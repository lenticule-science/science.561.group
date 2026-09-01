"""Per-stratum capability fiber for retraction — t02-126 / paired fixture t02-126f.

Per ``docs/dev/specs/security/capability-model.md`` §"per-stratum
capability fiber" + ``docs/dev/specs/security/user-as-boundary.md`` §4 +
``docs/dev/specs/security/tool-risk-scoring.md`` §3:

A sender wishing to act at the ``"saturated"`` or ``"settled"`` stratum
(canonical case: retracting a derived cell) must hold an accessibility
cell whose ``at_stratum`` projects onto that stratum. The substrate
records the licensing capability id(s) and the stratum on a post-commit
``audit-log`` fiber so that "by what authority was this saturated cell
retracted?" has a deterministic answer.

Tests:

1. Backwards compat: an ``at_stratum=None`` accessibility grant continues
   to authorize every respond regardless of the requested stratum
   (the legacy v0.2-pre behavior).
2. Per-stratum projection: a grant scoped to ``"saturated"`` authorizes
   a saturated retraction but does NOT authorize an asserted respond
   from the same sender, and vice versa.
3. Retraction-at-saturated audit-log emission (fixture t02-126f path A).
4. Retraction-at-settled audit-log emission   (fixture t02-126f path B).
5. Unknown stratum strings fail closed.
"""

from __future__ import annotations

from pathlib import Path

import pytest

from substrate.algebra import BilatticeValue
from substrate.authorization import (
    AccessibilityCell,
    authz_check,
    box_R,
    write_accessibility,
)
from substrate.respond import respond
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def layout(tmp_path: Path) -> StorageLayout:
    s = StorageLayout(tmp_path)
    s.ensure_dirs()
    return s


@pytest.fixture
def event_log(tmp_path: Path) -> EventLog:
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node")
    return log


# -----------------------------------------------------------------------------
# Backwards compat — at_stratum=None grants apply at every stratum
# -----------------------------------------------------------------------------


def test_unscoped_grant_authorizes_every_stratum(layout: StorageLayout):
    """A cell with ``at_stratum=None`` is a stratum-agnostic grant — it
    applies at asserted, saturated, and settled requests alike. This is
    the v0.2-pre legacy default; no on-disk migration is required."""
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:peer",
        world_to="rsc:thing",
        allowed_value=BilatticeValue.TRUE,
        at_stratum=None,
    ))
    for stratum in ("asserted", "saturated", "settled"):
        decision = authz_check(
            layout=layout, sender="rsc:peer", target="rsc:thing",
            stratum=stratum,
        )
        assert decision.allowed, f"unscoped grant failed at stratum={stratum}"
        assert decision.stratum == stratum


# -----------------------------------------------------------------------------
# Per-stratum projection — a scoped grant matches only its stratum
# -----------------------------------------------------------------------------


def test_saturated_grant_does_not_authorize_asserted(layout: StorageLayout):
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:peer",
        world_to="rsc:thing",
        allowed_value=BilatticeValue.TRUE,
        at_stratum="saturated",
    ))
    asserted = authz_check(
        layout=layout, sender="rsc:peer", target="rsc:thing",
        stratum="asserted",
    )
    assert not asserted.allowed, (
        "a saturated-only grant must NOT authorize an asserted respond"
    )
    assert asserted.box_value == BilatticeValue.NONE
    assert asserted.matched_cells == []

    saturated = authz_check(
        layout=layout, sender="rsc:peer", target="rsc:thing",
        stratum="saturated",
    )
    assert saturated.allowed
    assert saturated.box_value == BilatticeValue.TRUE
    assert len(saturated.matched_cells) == 1


def test_settled_grant_only_authorizes_settled(layout: StorageLayout):
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:peer",
        world_to="rsc:thing",
        allowed_value=BilatticeValue.TRUE,
        at_stratum="settled",
    ))
    for stratum in ("asserted", "saturated"):
        d = authz_check(
            layout=layout, sender="rsc:peer", target="rsc:thing",
            stratum=stratum,
        )
        assert not d.allowed, f"settled-only grant must not authorize stratum={stratum}"
    settled = authz_check(
        layout=layout, sender="rsc:peer", target="rsc:thing",
        stratum="settled",
    )
    assert settled.allowed


def test_unknown_stratum_fails_closed(layout: StorageLayout):
    """Unknown stratum strings deny by default-deny truth-meet against NONE.
    Per ``box_R`` docstring: "Unknown stratum values fail closed"."""
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:peer",
        world_to="rsc:thing",
        allowed_value=BilatticeValue.TRUE,
        at_stratum=None,
    ))
    decision = authz_check(
        layout=layout, sender="rsc:peer", target="rsc:thing",
        stratum="bogus-stratum",
    )
    assert not decision.allowed
    assert decision.box_value == BilatticeValue.NONE
    # Witness data must reflect the empty match set per
    # ``capability-model.md`` §3a — non-empty matched_cells on a
    # denied unknown-stratum decision would let an auditor mistakenly
    # attribute denial to grants that didn't participate.
    assert decision.matched_cells == []


def test_matched_cells_sorted_and_audit_log_lists_every_grant(
    layout: StorageLayout, event_log: EventLog,
):
    """Multiple matching capability ids must list deterministically
    (sorted) on the AuthzDecision AND every one must appear as a
    ``licensed-by-capability:<id>`` predicate on the emitted audit-log
    fiber. Replay-stability of the audit-log surface depends on this
    ordering being a function of the cell-id set alone."""
    cap_ids = [
        _grant(layout, sender="rsc:retractor", target="rsc:thing",
               stratum="saturated", tag="primary"),
        _grant(layout, sender="rsc:retractor", target="rsc:thing",
               stratum=None, tag="legacy-unscoped"),  # also matches saturated
        _grant(layout, sender="rsc:retractor", target="rsc:thing",
               stratum="saturated", tag="delegated"),
    ]
    assert len(set(cap_ids)) == 3, "fixture must yield three distinct grants"
    expected = sorted(cap_ids)

    result = respond(
        target="rsc:thing",
        payload={"flag/positive": "False"},
        sender="rsc:retractor",
        layout=layout, event_log=event_log, node_id="test-node",
        active_rule_ids=[],
        at_stratum="saturated",
    )
    assert result.authz_decision["matched_cells"] == expected

    audit_fiber = layout.get_fiber(f"audit-log:{result.event_id}")
    preds = audit_fiber["predicates"]
    licensed = sorted(
        p.split(":", 1)[1] for p in preds
        if p.startswith("licensed-by-capability:")
    )
    assert licensed == expected


def test_box_R_per_stratum_filter():
    """Direct ``box_R`` invariant: only cells whose at_stratum is None
    or matches the requested stratum participate in the truth-meet."""
    cells = [
        AccessibilityCell(
            surface="authentication",
            world_from="a", world_to="b",
            allowed_value=BilatticeValue.TRUE,
            at_stratum="saturated",
        ),
    ]
    boxed_sat = box_R(
        requested_value=BilatticeValue.TRUE,
        surface="authentication", world_from="a", world_to="b",
        cells=cells, stratum="saturated",
    )
    boxed_asserted = box_R(
        requested_value=BilatticeValue.TRUE,
        surface="authentication", world_from="a", world_to="b",
        cells=cells, stratum="asserted",
    )
    assert boxed_sat == BilatticeValue.TRUE
    assert boxed_asserted == BilatticeValue.NONE


# -----------------------------------------------------------------------------
# Paired fixture t02-126f — retract-at-saturated and retract-at-settled
# -----------------------------------------------------------------------------


def _grant(
    layout: StorageLayout, *, sender: str, target: str, stratum: str | None,
    tag: str | None = None,
) -> str:
    """Write an accessibility cell. ``tag`` is an optional metadata
    discriminator so that fixtures wanting two distinct grants on the
    same (sender, target, stratum) edge avoid the content-address
    collision that would otherwise dedupe them."""
    cell_id, _ = write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from=sender, world_to=target,
        allowed_value=BilatticeValue.TRUE,
        at_stratum=stratum,
        metadata={"tag": tag} if tag is not None else None,
    ))
    return cell_id


def test_t02_126f_retract_at_saturated(layout: StorageLayout, event_log: EventLog):
    """Path A — sender holds a saturated-scoped capability and issues
    a retraction at the saturated stratum. Respond commits, the
    audit-log fiber is emitted recording the licensing capability id
    and at-stratum-saturated marker."""
    cap_id = _grant(layout, sender="rsc:retractor", target="rsc:thing",
                    stratum="saturated")
    result = respond(
        target="rsc:thing",
        payload={"flag/positive": "False"},
        sender="rsc:retractor",
        layout=layout, event_log=event_log, node_id="test-node",
        active_rule_ids=[],
        at_stratum="saturated",
    )

    assert result.authz_decision is not None
    assert result.authz_decision["allowed"] is True
    assert result.authz_decision["stratum"] == "saturated"
    assert result.authz_decision["matched_cells"] == [cap_id]

    # Audit-log fiber must exist on disk and carry the spec'd predicates.
    audit_id = result.retraction_audit_log_id
    assert audit_id is not None
    audit_slug = f"audit-log:{result.event_id}"
    audit_fiber = layout.get_fiber(audit_slug)
    assert audit_fiber is not None, "retraction must materialise audit-log fiber"
    preds = audit_fiber["predicates"]
    assert preds.get("kind-audit-log") == "True"
    assert preds.get("at-stratum-saturated") == "True"
    assert preds.get(f"licensed-by-capability:{cap_id}") == "True"
    assert preds.get("retraction-of-target:rsc:thing") == "True"
    assert preds.get("sender:rsc:retractor") == "True"
    # at-stratum-settled MUST NOT be on the saturated path.
    assert "at-stratum-settled" not in preds


def test_t02_126f_retract_at_settled(layout: StorageLayout, event_log: EventLog):
    """Path B — sender holds a settled-scoped capability and issues
    a retraction at the settled stratum. Audit-log emits at-stratum-settled
    and the settled-grant cap id."""
    cap_id = _grant(layout, sender="rsc:retractor", target="rsc:thing",
                    stratum="settled")
    result = respond(
        target="rsc:thing",
        payload={"flag/positive": "False"},
        sender="rsc:retractor",
        layout=layout, event_log=event_log, node_id="test-node",
        active_rule_ids=[],
        at_stratum="settled",
    )
    assert result.authz_decision["stratum"] == "settled"
    assert result.authz_decision["matched_cells"] == [cap_id]

    audit_id = result.retraction_audit_log_id
    assert audit_id is not None
    audit_fiber = layout.get_fiber(f"audit-log:{result.event_id}")
    preds = audit_fiber["predicates"]
    assert preds.get("at-stratum-settled") == "True"
    assert preds.get(f"licensed-by-capability:{cap_id}") == "True"
    assert "at-stratum-saturated" not in preds


def test_retract_at_saturated_denied_when_only_asserted_grant(
    layout: StorageLayout, event_log: EventLog,
):
    """A sender holding only an asserted-scoped grant cannot retract at
    the saturated stratum.

    Per t02-41 / ``decisions/capability-not-acl.md`` the substrate does
    not raise on insufficient authority — restriction is algebraic.
    The Phase-0 gate records ``allowed=False`` with the requested
    ``stratum="saturated"`` on the witness, the pipeline
    short-circuits, and respond returns a vacuous result: no cell, no
    event, no audit-log. The target fiber is unchanged.
    """
    _grant(layout, sender="rsc:retractor", target="rsc:thing",
           stratum="asserted")
    height_before = event_log.height()
    fiber_before = layout.get_fiber("rsc:thing")
    r = respond(
        target="rsc:thing",
        payload={"flag/positive": "False"},
        sender="rsc:retractor",
        layout=layout, event_log=event_log, node_id="test-node",
        active_rule_ids=[],
        at_stratum="saturated",
    )
    assert r.authz_decision is not None
    assert r.authz_decision["allowed"] is False
    assert r.authz_decision["stratum"] == "saturated"
    assert r.cell_id is None
    assert r.event_id is None
    assert r.retraction_audit_log_id is None
    assert event_log.height() == height_before
    assert layout.get_fiber("rsc:thing") == fiber_before


def test_asserted_default_emits_no_audit_log(
    layout: StorageLayout, event_log: EventLog,
):
    """The legacy default (at_stratum=None) emits no retraction
    audit-log cell — payload writes already land as auditable asserted
    cells. Audit-log emission is reserved for non-default-stratum
    responds per ``specs/security/tool-risk-scoring.md`` §3."""
    _grant(layout, sender="rsc:peer", target="rsc:thing", stratum=None)
    result = respond(
        target="rsc:thing",
        payload={"flag/positive": "True"},
        sender="rsc:peer",
        layout=layout, event_log=event_log, node_id="test-node",
        active_rule_ids=[],
    )
    assert result.retraction_audit_log_id is None
