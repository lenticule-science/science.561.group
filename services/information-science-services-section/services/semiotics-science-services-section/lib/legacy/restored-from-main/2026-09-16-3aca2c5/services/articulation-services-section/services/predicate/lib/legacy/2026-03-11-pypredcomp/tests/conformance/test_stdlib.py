"""Conformance: substrate stdlib (project, filter, fold, materialize, hash,
assert/retract, settle, witness)."""

from __future__ import annotations

from pathlib import Path

import pytest

from substrate.algebra import BilatticeValue as B
from substrate.canonicalization import canonical, cid_bytes
from substrate.error_codes import SubstrateError
from substrate.respond import respond
from substrate.stdlib import (
    AuditReport,
    CellPattern,
    assert_cell,
    audit,
    filter_,
    fold,
    fork,
    hash_,
    materialize,
    project,
    retract_cell,
    settle,
    witness,
)
from process.session import open_session, close_session
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def env(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node")
    return layout, log


def _seed(layout: StorageLayout, log: EventLog) -> None:
    """Seed three task entities and one account, with a few predicates each."""
    for slug in ("task:write-spec", "task:port-zork", "task:done-thing"):
        respond(
            target=slug,
            payload={"is-a": "True", "status": "True"},
            layout=layout, event_log=log, node_id="test-node",
            active_rule_ids=[],
        )
    respond(
        target="account:hosting",
        payload={"balance": "True"},
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )


# ---------------------------------------------------------------------------
# project
# ---------------------------------------------------------------------------


def test_project_pattern_match_all_tasks(env):
    layout, log = env
    _seed(layout, log)
    matches = project(layout, CellPattern(s="task:*", p="status"))
    assert len(matches) == 3
    for m in matches:
        assert m.s.startswith("task:")
        assert m.p == "status"
    # Determinism: lexicographic by id.
    ids = [m.id for m in matches]
    assert ids == sorted(ids)


def test_project_wildcard_position(env):
    layout, log = env
    _seed(layout, log)
    is_a_atoms = project(layout, CellPattern(p="is-a"))
    assert {a.s for a in is_a_atoms} >= {
        "task:write-spec", "task:port-zork", "task:done-thing"
    }


def test_project_scope_entity(env):
    layout, log = env
    _seed(layout, log)
    only_one = project(
        layout,
        CellPattern(p="status"),
        scope="entity:task:write-spec",
    )
    assert len(only_one) == 1
    assert only_one[0].s == "task:write-spec"


def test_project_no_match_returns_empty(env):
    layout, log = env
    _seed(layout, log)
    assert project(layout, CellPattern(s="nope:*")) == []


def test_project_deterministic_across_runs(env):
    layout, log = env
    _seed(layout, log)
    a = [c.id for c in project(layout, CellPattern(s="task:*"))]
    b = [c.id for c in project(layout, CellPattern(s="task:*"))]
    assert a == b


# ---------------------------------------------------------------------------
# filter
# ---------------------------------------------------------------------------


def test_filter_value_equality(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern(p="status"))
    only_true = filter_(cells, "==True")
    assert len(only_true) == len(cells)
    assert filter_(cells, "==False") == []


def test_filter_truth_order(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern(p="status"))
    # Every TRUE cell satisfies True ≤_t True.
    assert filter_(cells, ">=t True") == cells


def test_filter_is_stale_no_match(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern())
    assert filter_(cells, "is-stale") == []


# ---------------------------------------------------------------------------
# fold
# ---------------------------------------------------------------------------


def test_fold_count(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern(s="task:*", p="status"))
    [r] = fold(cells, "count")
    assert r.value == 3


def test_fold_distinct_subjects(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern(p="status"))
    [r] = fold(cells, "distinct", by="s")
    assert r.value == sorted({"task:write-spec", "task:port-zork", "task:done-thing"})


def test_fold_group_by_predicate(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern(s="task:*"))
    rows = fold(cells, "group-by", by="p")
    counts = {r.key: r.value for r in rows}
    assert counts == {"is-a": 3, "status": 3}


def test_fold_sort_deterministic(env):
    layout, log = env
    _seed(layout, log)
    cells = project(layout, CellPattern(p="is-a"))
    [r1] = fold(cells, "sort")
    [r2] = fold(cells, "sort")
    assert r1.value == r2.value


# ---------------------------------------------------------------------------
# materialize
# ---------------------------------------------------------------------------


def test_materialize_cell_byte_identical(env):
    layout, log = env
    r = respond(
        target="hello", payload={"p": "True"},
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )
    on_disk = layout.cell_path(r.cell_id).read_bytes()
    via_stdlib = materialize(layout, f"cell:{r.cell_id}")
    assert via_stdlib == on_disk
    # Bare 64-hex form takes the same path.
    assert materialize(layout, r.cell_id) == on_disk


def test_materialize_entity_returns_canonical_fiber(env):
    layout, log = env
    respond(
        target="alice", payload={"role": "True"},
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )
    via = materialize(layout, "entity:alice")
    fiber = layout.get_fiber("alice")
    assert via == canonical(fiber)


def test_materialize_unknown_entity_raises(env):
    layout, _ = env
    with pytest.raises(SubstrateError):
        materialize(layout, "entity:ghost")


# ---------------------------------------------------------------------------
# hash
# ---------------------------------------------------------------------------


def test_hash_bytes_matches_canonicalization(env):
    body = b'{"hello":"world"}'
    assert hash_(body) == cid_bytes(body)


def test_hash_cell_matches_on_disk_id(env):
    layout, log = env
    r = respond(
        target="x", payload={"p": "True"},
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )
    # The hash of a cell record's body-without-id IS its on-disk id.
    assert hash_(f"cell:{r.cell_id}", layout=layout) == r.cell_id


def test_hash_cell_corruption_raises(env):
    """A tampered cell file must surface PCC_HASH_MISMATCH, not return silently."""
    layout, log = env
    r = respond(
        target="taint", payload={"p": "True"},
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )
    path = layout.cell_path(r.cell_id)
    body = path.read_bytes().replace(b'"True"', b'"False"')
    path.write_bytes(body)
    with pytest.raises(SubstrateError) as exc:
        hash_(f"cell:{r.cell_id}", layout=layout)
    assert exc.value.code == "PCC_HASH_MISMATCH"


def test_hash_entity_stable(env):
    layout, log = env
    respond(
        target="bob", payload={"p": "True"},
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )
    h1 = hash_("entity:bob", layout=layout)
    h2 = hash_("entity:bob", layout=layout)
    assert h1 == h2 and len(h1) == 64


# ---------------------------------------------------------------------------
# assert / retract
# ---------------------------------------------------------------------------


def test_assert_writes_cell_and_event(env):
    layout, log = env
    r = assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:foo", p="status", v=B.TRUE,
    )
    assert r.cell_id
    assert layout.has_record("cells", r.cell_id)
    assert layout.get_fiber("task:foo")["predicates"] == {"status": "True"}


def test_retract_raises_to_both_when_already_true(env):
    """Settling-monotonicity: True ⊕ False = Both, never Falses-out True."""
    layout, log = env
    assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:bar", p="status", v=B.TRUE,
    )
    r = retract_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:bar", p="status",
    )
    assert r.fiber["predicates"]["status"] == "Both"


def test_assert_default_value_is_true(env):
    layout, log = env
    r = assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:baz", p="open",
    )
    assert r.fiber["predicates"]["open"] == "True"


# ---------------------------------------------------------------------------
# settle
# ---------------------------------------------------------------------------


def test_settle_runs_respond_with_empty_payload(env):
    layout, log = env
    assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:settle", p="status", v=B.TRUE,
    )
    height_before = log.height()
    r = settle(
        layout=layout, event_log=log, node_id="test-node",
        target="task:settle",
    )
    # respond always appends one event per call.
    assert log.height() == height_before + 1
    # Predicate state preserved (no new asserts means no new predicates).
    assert r.fiber["predicates"] == {"status": "True"}


def test_settle_idempotent_on_quiescent_state(env):
    layout, log = env
    assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:idem", p="status", v=B.TRUE,
    )
    r1 = settle(layout=layout, event_log=log, node_id="test-node", target="task:idem")
    r2 = settle(layout=layout, event_log=log, node_id="test-node", target="task:idem")
    assert r1.fiber["predicates"] == r2.fiber["predicates"]


# ---------------------------------------------------------------------------
# witness
# ---------------------------------------------------------------------------


def test_witness_returns_atom_for_asserted_cell(env):
    layout, log = env
    assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:w", p="status", v=B.TRUE,
    )
    atoms = project(layout, CellPattern(s="task:w", p="status"))
    assert atoms
    chain = witness(layout, atoms[0].id)
    assert len(chain) == 1
    entry = chain[0]
    assert entry.cell_id == atoms[0].id
    assert entry.stratum == "asserted"
    assert entry.derived_from == []


def test_witness_unknown_cell_raises(env):
    layout, _ = env
    with pytest.raises(SubstrateError):
        witness(layout, "0" * 64)


def test_witness_chain_chronological(env):
    """When a cell has parents, the chain comes back ordinal-sorted."""
    layout, log = env
    # Two asserts produce two atoms with different ords on the same fiber.
    assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:chain", p="p1", v=B.TRUE,
    )
    assert_cell(
        layout=layout, event_log=log, node_id="test-node",
        s="task:chain", p="p2", v=B.TRUE,
    )
    atoms = project(layout, CellPattern(s="task:chain"))
    # No closure rules active, so each atom is its own one-link chain.
    for a in atoms:
        chain = witness(layout, a.id)
        assert chain == sorted(chain, key=lambda e: e.ord)


# ---------------------------------------------------------------------------
# audit — verify event-chain and witness-chain integrity
# ---------------------------------------------------------------------------


def test_audit_intact_log_returns_verified_true(env):
    layout, log = env
    _seed(layout, log)
    report = audit(layout)
    assert isinstance(report, AuditReport)
    assert report.verified is True
    assert report.failures == []
    # Genesis + 4 respond rounds = 5 events; each respond also appends
    # ancillary events (e.g. cost cells), so just assert > seed count.
    assert report.events_checked >= 5


def test_audit_deterministic_across_runs(env):
    layout, log = env
    _seed(layout, log)
    r1 = audit(layout)
    r2 = audit(layout)
    assert r1.model_dump() == r2.model_dump()


def test_audit_to_wire_uses_hyphenated_keys(env):
    layout, log = env
    _seed(layout, log)
    wire = audit(layout).to_wire()
    assert set(wire.keys()) == {
        "verified", "events-checked", "witnesses-checked", "failures"
    }


def test_audit_detects_tampered_event_id(env):
    layout, log = env
    _seed(layout, log)
    log_path = layout.root / "events.jsonl"
    lines = log_path.read_text(encoding="utf-8").splitlines()
    # Tamper a non-genesis line: flip "test-node" → "hax0r-node" in the
    # event body so the recomputed cid no longer matches the recorded id.
    target_idx = 1
    tampered = lines[target_idx].replace('"test-node"', '"hax0r-node"')
    assert tampered != lines[target_idx]
    lines[target_idx] = tampered
    log_path.write_text("\n".join(lines) + "\n", encoding="utf-8")

    report = audit(layout)
    assert report.verified is False
    kinds = {f.kind for f in report.failures}
    # An event-body tamper changes the event's recomputed id (id-mismatch);
    # the recorded id is unchanged so prev-mismatch on the *next* event
    # does not appear (the recorded id still chains forward).
    assert "id-mismatch" in kinds


def test_audit_detects_missing_witness(env):
    """A derived cell whose derived_from id is absent from disk fails."""
    layout, log = env
    _seed(layout, log)
    cells_dir = layout.root / "cells"
    # Inject a fake "derived" cell pointing at a non-existent parent.
    from storage.cell import Cell
    fake = Cell(
        s="ghost", p="status", o="ghost",
        v=B.TRUE, ord=0, stratum="saturated",
        derived_from=["a" * 64], derived_via="test",
    ).with_id()
    shard = cells_dir / fake.id[:2]
    shard.mkdir(parents=True, exist_ok=True)
    (shard / f"{fake.id}.json").write_bytes(fake.canonical())

    report = audit(layout)
    assert report.verified is False
    assert any(f.kind == "witness-missing" for f in report.failures)


def test_audit_ord_window_filters_failures(env):
    layout, log = env
    _seed(layout, log)
    # Tamper ord 1 (first respond after genesis).
    log_path = layout.root / "events.jsonl"
    lines = log_path.read_text(encoding="utf-8").splitlines()
    lines[1] = lines[1].replace('"test-node"', '"hax0r-node"')
    log_path.write_text("\n".join(lines) + "\n", encoding="utf-8")

    in_window = audit(layout, start_ord=0, end_ord=2)
    out_window = audit(layout, start_ord=10, end_ord=20)
    assert any(f.kind == "id-mismatch" for f in in_window.failures)
    # Tampered ord-1 failures filtered out of [10, 20). Note the chain
    # break propagates as prev-mismatch on subsequent events; those
    # would also be filtered if their ord lies outside the window.
    assert all(
        f.kind != "id-mismatch" or (f.ord is not None and f.ord >= 10)
        for f in out_window.failures
    )


# ---------------------------------------------------------------------------
# fork — clone a session
# ---------------------------------------------------------------------------


def test_fork_inherits_owner_and_capabilities(env):
    layout, log = env
    parent = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:alice", capabilities=["cap:read", "cap:write"],
    )
    child = fork(
        layout=layout, event_log=log, node_id="test-node",
        parent_slug=parent.slug,
    )
    assert child.owner == parent.owner
    assert child.capabilities == parent.capabilities
    assert child.parent == parent.slug
    assert child.slug != parent.slug
    assert child.state == "open"


def test_fork_emits_opened_cell(env):
    layout, log = env
    parent = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:bob",
    )
    child = fork(
        layout=layout, event_log=log, node_id="test-node",
        parent_slug=parent.slug,
    )
    # The child's open-cell is reachable via project on (s=child.slug, p=opened).
    opened_cells = project(
        layout, CellPattern(s=child.slug, p="opened"),
    )
    assert len(opened_cells) == 1
    assert opened_cells[0].v == B.TRUE


def test_fork_from_closed_parent_raises(env):
    layout, log = env
    parent = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:carol",
    )
    close_session(
        layout=layout, event_log=log, node_id="test-node",
        slug=parent.slug,
    )
    with pytest.raises(SubstrateError) as exc:
        fork(
            layout=layout, event_log=log, node_id="test-node",
            parent_slug=parent.slug,
        )
    assert exc.value.code == "PCM_SESSION_CLOSED"


def test_fork_capability_non_amplifying(env):
    """Per stdlib/fork.md §2: child cannot acquire capabilities the
    parent lacks. The wrapper does not synthesise capabilities."""
    layout, log = env
    parent = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:dave", capabilities=["cap:read"],
    )
    child = fork(
        layout=layout, event_log=log, node_id="test-node",
        parent_slug=parent.slug,
    )
    assert set(child.capabilities) <= set(parent.capabilities)
