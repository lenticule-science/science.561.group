"""Conformance — history-fiber projection (paired with task t02-43).

Pins the four acceptance properties from
[`docs/dev/tasks/engineering/t02-43-v0.2a-kernel-frozen.md`](../../docs/dev/tasks/engineering/t02-43-v0.2a-kernel-frozen.md):

a. Sender-authored events appear in the projection in ord-ascending
   order.
b. The optional attended-targets filter projects the read side as a
   second independent slice.
c. Cache corruption + reboot rebuilds the per-target fiber cache from
   event-log truth, and the history projection — being a pure function
   of the log — is byte-identical to its pre-corruption value.
d. Two runs over byte-identical event logs produce byte-identical
   projection digests (the determinism witness).
"""

from __future__ import annotations

import pytest

from init_boot.fiber_reconcile import reconcile_fibers
from process.history_fiber import HISTORY_FIBER_NAME, history_fiber_for
from substrate.error_codes import PCC_PROJECTION_DIVERGED, SubstrateError

from tests.fixtures.history.t02_43f import build


@pytest.fixture
def scenario(tmp_path):
    return build(tmp_path)


# ---------------------------------------------------------------------------
# (a) Sender-authored slice is the alice-authored events, ord-ascending.
# ---------------------------------------------------------------------------


def test_sender_slice_lists_only_alice_events_in_ord_order(scenario):
    proj = history_fiber_for(
        event_log=scenario.event_log, sender=scenario.alice,
    )
    assert proj.entity == scenario.alice
    assert proj.fiber == HISTORY_FIBER_NAME
    # 3 against doc:proposal + 1 against doc:errata = 4
    assert len(proj.sender_events) == 4
    targets = [r.target for r in proj.sender_events]
    assert targets.count(scenario.doc_proposal) == 3
    assert targets.count(scenario.doc_errata) == 1
    # Ord-ascending.
    ords = [r.ord for r in proj.sender_events]
    assert ords == sorted(ords)
    # Every event id is content-addressed.
    for row in proj.sender_events:
        assert row.event_id and row.cell_id


def test_sender_slice_excludes_other_senders_and_system(scenario):
    proj = history_fiber_for(
        event_log=scenario.event_log, sender=scenario.alice,
    )
    # Bob's reviewed event is not in alice's sender slice.
    assert all(r.kind == "respond" for r in proj.sender_events)
    # The bootstrap-emitted system cells (sender="system") are excluded.
    # If they leaked in, alice would have far more than 4 events.
    assert len(proj.sender_events) == 4


# ---------------------------------------------------------------------------
# (b) Attended-targets is an independent slice.
# ---------------------------------------------------------------------------


def test_attended_targets_projects_read_side_independently(scenario):
    proj = history_fiber_for(
        event_log=scenario.event_log,
        sender=scenario.alice,
        attended_targets={scenario.doc_proposal, scenario.doc_errata},
    )
    # 3 alice + 1 bob against doc:proposal + 1 alice against doc:errata = 5
    assert len(proj.attended_events) == 5
    # Sender slice unchanged.
    assert len(proj.sender_events) == 4
    # Attended slice is ord-ascending.
    ords = [r.ord for r in proj.attended_events]
    assert ords == sorted(ords)
    # Senders in the attended slice are alice and bob (not system).
    # We can't read sender directly from HistoryEvent (it's a sender-keyed
    # projection of the *event* not the body), but we verify by
    # cross-checking that bob's review is present via target-and-predicate.
    pred_keys = [tuple(r.payload_keys) for r in proj.attended_events]
    assert ("reviewed",) in pred_keys


def test_attended_targets_omitted_yields_empty_attended_slice(scenario):
    proj = history_fiber_for(
        event_log=scenario.event_log, sender=scenario.alice,
    )
    assert proj.attended_events == []


# ---------------------------------------------------------------------------
# (c) Cache corruption + reboot — projection is unaffected.
# ---------------------------------------------------------------------------


def test_history_projection_is_log_truth_after_fiber_corruption(scenario):
    """The per-target fiber cache may be corrupted; the history projection
    derives directly from the event log and is unaffected by the
    cache's state.
    """
    layout, log = scenario.layout, scenario.event_log
    pre = history_fiber_for(event_log=log, sender=scenario.alice)

    # Corrupt the doc:proposal fiber cache: drop its history list.
    fiber = layout.get_fiber(scenario.doc_proposal)
    assert fiber is not None
    layout.put_fiber(scenario.doc_proposal, {**fiber, "history": []})

    # The projection is computed from the event log, not the cache;
    # it is identical (full-shape, not just digest) to the pre-corruption
    # projection.
    post = history_fiber_for(event_log=log, sender=scenario.alice)
    assert post.digest == pre.digest
    assert post.model_dump(exclude={"digest"}) == pre.model_dump(exclude={"digest"})

    # Strict reconcile flags the corrupted target fiber per recipe 6
    # (projection divergence) — we never patch.
    with pytest.raises(SubstrateError) as exc:
        reconcile_fibers(layout=layout, event_log=log, strict=True)
    assert exc.value.code == PCC_PROJECTION_DIVERGED
    assert scenario.doc_proposal in exc.value.details["divergent"]

    # Non-strict reconcile rebuilds the target fiber from log truth;
    # the history projection is *still* unchanged because it never
    # depended on the cache.
    summary = reconcile_fibers(layout=layout, event_log=log)
    assert scenario.doc_proposal in summary["repaired"]
    rebuilt = history_fiber_for(event_log=log, sender=scenario.alice)
    assert rebuilt.digest == pre.digest
    assert rebuilt.model_dump(exclude={"digest"}) == pre.model_dump(exclude={"digest"})


# ---------------------------------------------------------------------------
# (d) Determinism — byte-identical projection across two builds.
# ---------------------------------------------------------------------------


def test_projection_digest_is_byte_stable_across_two_builds(tmp_path):
    """Two independent builds of the fixture produce identical digests.

    The fixture pins ``wall_clock_ns`` so two builds yield byte-identical
    ``events.jsonl`` files; the projection is then a pure function of
    the log bytes and the digests must match exactly.
    """
    a = build(tmp_path / "a")
    b = build(tmp_path / "b")
    pa = history_fiber_for(event_log=a.event_log, sender=a.alice)
    pb = history_fiber_for(event_log=b.event_log, sender=b.alice)
    assert pa.digest == pb.digest
    # Full-shape equality, not just count/ord — proves the digest is
    # actually a witness of projection identity, not a collision.
    assert pa.model_dump(exclude={"digest"}) == pb.model_dump(exclude={"digest"})
    # And confirm the same with attended-targets supplied.
    pa_att = history_fiber_for(
        event_log=a.event_log, sender=a.alice,
        attended_targets={a.doc_proposal, a.doc_errata},
    )
    pb_att = history_fiber_for(
        event_log=b.event_log, sender=b.alice,
        attended_targets={b.doc_proposal, b.doc_errata},
    )
    assert pa_att.digest == pb_att.digest
    assert pa_att.model_dump(exclude={"digest"}) == pb_att.model_dump(exclude={"digest"})


def test_digest_distinguishes_sender_vs_attended_partition(scenario):
    """Re-partitioning the same row set across slices MUST change digest.

    Regression for the boundary-ambiguity defect the architect flagged:
    if the digest were computed over the concatenated row list, a row
    moving from ``sender_events`` to ``attended_events`` (or vice
    versa) would NOT change the digest — defeating the purpose of the
    witness. The fix canonicalizes the two slices under distinct keys.
    """
    log = scenario.event_log
    # Sender slice only: alice has 4 sender-authored events.
    sender_only = history_fiber_for(event_log=log, sender=scenario.alice)
    # Sender + attended-doc:proposal: 4 sender + 4 attended (3 alice + 1 bob)
    # against doc:proposal. Same total event population either way (some
    # rows just appear in both slices, but the slice membership differs).
    with_attended = history_fiber_for(
        event_log=log, sender=scenario.alice,
        attended_targets={scenario.doc_proposal},
    )
    # Same sender slice; different attended slice → different digest.
    assert sender_only.sender_events == with_attended.sender_events
    assert sender_only.attended_events != with_attended.attended_events
    assert sender_only.digest != with_attended.digest


# ---------------------------------------------------------------------------
# head_ord — as-of bound is honored.
# ---------------------------------------------------------------------------


def test_head_ord_bounds_the_projection(scenario):
    full = history_fiber_for(
        event_log=scenario.event_log, sender=scenario.alice,
    )
    assert len(full.sender_events) == 4

    # Cut off before alice's last (doc:errata) event.
    last_proposal_ord = max(
        r.ord for r in full.sender_events if r.target == scenario.doc_proposal
    )
    bounded = history_fiber_for(
        event_log=scenario.event_log,
        sender=scenario.alice,
        head_ord=last_proposal_ord,
    )
    # The doc:errata event was after last_proposal_ord, so it's excluded.
    assert len(bounded.sender_events) == 3
    assert all(r.target == scenario.doc_proposal for r in bounded.sender_events)
    assert bounded.head_ord == last_proposal_ord
    # Different cut → different digest.
    assert bounded.digest != full.digest
