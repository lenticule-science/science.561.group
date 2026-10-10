"""Conformance fixture for ``specs/filesystem/paths-and-resolution.md``.

Pairs with task ``t02-110`` (source) per the
``decisions/fixture-authoring-paired-task.md`` discipline. Exercises:

- §1 path syntax for all five forms.
- §2 current-scope predicate as a binary cell on the per-session-scope
  fiber.
- §3 resolution algorithm branches (cell, entity, alias, relative,
  parent).
- §4 worked examples.
- §5 conformance gates 1 (determinism) and 3 (alias updates reflect).
  Gate 2 (capability scoping) is owned by t02-112
  (``filesystem/capability-permissions.md``) and is not exercised here.

The §4 worked example ``./tasks/write-spec → task:write-spec`` resolves
via the alias substrate (``alias-mapping.md`` §5): an alias whose name
is the joined sub-scope path and whose target ends in ``:`` names the
entity-kind. ``test_resolve_relative_uses_kind_alias_for_§4_example``
exercises that path. Without such an alias, the joined slug is returned
(``test_resolve_relative_prepends_scope_when_no_kind_alias``).
"""

from __future__ import annotations

import time
from pathlib import Path

import pytest

from process.session import open_session
from process.user import create_user
from storage.aliases import AliasStore
from storage.event_log import EventLog
from storage.paths import (
    CURRENT_SCOPE_PREDICATE,
    ResolutionResult,
    get_current_scope,
    resolve,
    set_current_scope,
)
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCM_PAYLOAD_INVALID, SubstrateError


# ---------------------------------------------------------------------------
# fixtures
# ---------------------------------------------------------------------------


@pytest.fixture()
def boot(tmp_path: Path):
    """A booted substrate with one user and one open session."""
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    event_log = EventLog(tmp_path)
    event_log.initialize(node_id="test-node", wall_clock_ns=time.time_ns())
    create_user(
        layout=layout, event_log=event_log, node_id="test-node",
        slug="user:tester", display_name="Tester",
    )
    sess = open_session(
        layout=layout, event_log=event_log, node_id="test-node",
        owner="user:tester", capabilities=["shell:*", "signal:*"],
    )
    return layout, event_log, sess


# ---------------------------------------------------------------------------
# §1 / §3 — path syntax + resolution branches
# ---------------------------------------------------------------------------


def test_resolve_cell_id(boot):
    layout, _, _ = boot
    r = resolve("cell:abc123def456", layout=layout)
    assert r == ResolutionResult(
        kind="cell", target="cell:abc123def456", via="cell:",
    )


def test_resolve_entity_slug(boot):
    layout, _, _ = boot
    r = resolve("task:write-spec", layout=layout)
    assert r == ResolutionResult(
        kind="entity", target="task:write-spec", via="entity",
    )


def test_resolve_alias_path_returns_alias_target(boot):
    layout, _, _ = boot
    AliasStore(layout.root).set("captain", "personnel:emsenn")
    r = resolve("/aliases/captain", layout=layout)
    assert r.kind == "alias-target"
    assert r.target == "personnel:emsenn"
    assert r.via == "alias"


def test_resolve_alias_missing_raises(boot):
    layout, _, _ = boot
    with pytest.raises(SubstrateError) as ei:
        resolve("/aliases/nope", layout=layout)
    assert ei.value.code == "PCS_RECORD_NOT_FOUND"
    assert "/aliases/nope" in str(ei.value)


def test_resolve_alias_path_requires_name(boot):
    layout, _, _ = boot
    with pytest.raises(SubstrateError) as ei:
        resolve("/aliases/", layout=layout)
    assert ei.value.code == PCM_PAYLOAD_INVALID


def test_resolve_relative_requires_session(boot):
    layout, _, _ = boot
    with pytest.raises(SubstrateError) as ei:
        resolve("./tasks", layout=layout)
    assert ei.value.code == PCM_PAYLOAD_INVALID


def test_resolve_relative_requires_current_scope(boot):
    layout, _, sess = boot
    with pytest.raises(SubstrateError) as ei:
        resolve("./tasks", layout=layout, session_slug=sess.slug)
    assert ei.value.code == PCM_PAYLOAD_INVALID
    assert "current-scope" in str(ei.value)


def test_resolve_relative_prepends_scope_when_no_kind_alias(boot):
    """No kind-alias registered → relative resolution returns the
    joined scope slug. The substrate tells the truth about what's
    registered."""
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    r = resolve("./tasks/write-spec", layout=layout, session_slug=sess.slug)
    assert r.kind == "entity"
    assert r.target == "scope:engineering/tasks/write-spec"
    assert r.via == "relative"


def test_resolve_relative_uses_kind_alias_for_spec4_example(boot):
    """Spec §4 worked example: with current-scope = scope:engineering
    and the kind-alias ``scope:engineering/tasks → task:`` registered,
    ``./tasks/write-spec`` resolves to ``task:write-spec`` (alias-driven
    leaf-kind derivation per ``alias-mapping.md`` §5)."""
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    AliasStore(layout.root).set("scope:engineering/tasks", "task:")
    r = resolve("./tasks/write-spec", layout=layout, session_slug=sess.slug)
    assert r.kind == "entity"
    assert r.target == "task:write-spec"
    assert r.via == "relative-kind"


def test_resolve_bare_name_with_current_scope_is_relative(boot):
    """Spec §3.4: ``<name>`` (with current-scope set) ≡ ``./<name>``.

    The disambiguation from §3.2 entity-slug is by token shape — a
    bare token without ``:``, ``/``, or leading ``.`` is relative iff
    a current-scope is bound.
    """
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    r = resolve("write-spec", layout=layout, session_slug=sess.slug)
    assert r.kind == "entity"
    assert r.target == "scope:engineering/write-spec"
    assert r.via == "relative"


def test_resolve_bare_name_without_current_scope_is_entity(boot):
    """Spec §3.2: bare token falls through to entity-slug when no
    current-scope is bound."""
    layout, _, sess = boot
    r = resolve("write-spec", layout=layout, session_slug=sess.slug)
    assert r.kind == "entity"
    assert r.target == "write-spec"
    assert r.via == "entity"


def test_resolve_kinded_slug_with_current_scope_is_entity(boot):
    """An entity slug with a kind prefix (``task:write-spec``) stays
    a §3.2 entity even when current-scope is bound — the ``:`` is the
    disambiguator."""
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    r = resolve("task:write-spec", layout=layout, session_slug=sess.slug)
    assert r.kind == "entity"
    assert r.target == "task:write-spec"
    assert r.via == "entity"


def test_resolve_parent_walks_one_level_up(boot):
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    r = resolve("../tasks", layout=layout, session_slug=sess.slug)
    # Spec §4: ../tasks with current-scope = scope:engineering →
    # scope:tasks (parent of scope:engineering is scope:, then joined
    # with "tasks").
    assert r.kind == "entity"
    assert r.target == "scope:tasks"
    assert r.via == "parent"


def test_resolve_parent_from_nested_scope(boot):
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering/tasks",
    )
    r = resolve("../write-spec", layout=layout, session_slug=sess.slug)
    assert r.target == "scope:engineering/write-spec"


def test_empty_path_rejected(boot):
    layout, _, _ = boot
    with pytest.raises(SubstrateError) as ei:
        resolve("", layout=layout)
    assert ei.value.code == PCM_PAYLOAD_INVALID


# ---------------------------------------------------------------------------
# §2 — current-scope is a binary cell
# ---------------------------------------------------------------------------


def test_set_current_scope_emits_binary_cell(boot):
    layout, event_log, sess = boot
    cell_id = set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    fiber = layout.get_fiber(f"session-scope:{sess.slug}")
    assert fiber is not None
    cells = fiber["cells"]
    assert len(cells) == 1
    c = cells[0]
    # Binary: s != o per spec §2.
    assert c["s"] == sess.slug
    assert c["p"] == CURRENT_SCOPE_PREDICATE
    assert c["o"] == "scope:engineering"
    assert c["v"] == BilatticeValue.TRUE.value
    assert c["s"] != c["o"]
    # binary-cell-emission.md §2 gate 3: stratum = "asserted",
    # no derivation chain.
    assert c["stratum"] == "asserted"
    assert c.get("derived_from") in (None, [], "")
    assert c["id"] == cell_id


def test_set_current_scope_appends_typed_event(boot):
    layout, event_log, sess = boot
    h0 = event_log.height()
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    h1 = event_log.height()
    assert h1 == h0 + 1
    last = list(event_log.iter_events())[-1]
    assert last["kind"] == "session-current-scope"
    assert last["body"]["session"] == sess.slug
    assert last["body"]["scope"] == "scope:engineering"


def test_set_current_scope_rejects_path_shaped_value(boot):
    layout, event_log, sess = boot
    with pytest.raises(SubstrateError) as ei:
        set_current_scope(
            layout=layout, event_log=event_log, node_id="test-node",
            session_slug=sess.slug, scope="./not-a-scope",
        )
    assert ei.value.code == PCM_PAYLOAD_INVALID


def test_get_current_scope_returns_none_when_unset(boot):
    layout, _, sess = boot
    assert get_current_scope(layout, sess.slug) is None


def test_get_current_scope_returns_latest(boot):
    layout, event_log, sess = boot
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering/tasks",
    )
    assert get_current_scope(layout, sess.slug) == "scope:engineering/tasks"


# ---------------------------------------------------------------------------
# §5 conformance gates
# ---------------------------------------------------------------------------


def test_gate_1_determinism_same_state_same_target(boot):
    """§5.1: same path + same state → same target."""
    layout, event_log, sess = boot
    AliasStore(layout.root).set("captain", "personnel:emsenn")
    set_current_scope(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, scope="scope:engineering",
    )
    paths = [
        "cell:abc123",
        "task:write-spec",
        "/aliases/captain",
        "./tasks",
        "../sibling",
    ]
    first = [resolve(p, layout=layout, session_slug=sess.slug) for p in paths]
    second = [resolve(p, layout=layout, session_slug=sess.slug) for p in paths]
    assert first == second


def test_gate_3_alias_update_reflects_in_resolution(tmp_path: Path):
    """§5.3: aliases update; subsequent resolutions reflect."""
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    store = AliasStore(layout.root)
    store.set("ledger", "cell:0000000000000000")
    r1 = resolve("/aliases/ledger", layout=layout)
    assert r1.target == "cell:0000000000000000"
    store.set("ledger", "cell:ffffffffffffffff")
    r2 = resolve("/aliases/ledger", layout=layout)
    assert r2.target == "cell:ffffffffffffffff"
