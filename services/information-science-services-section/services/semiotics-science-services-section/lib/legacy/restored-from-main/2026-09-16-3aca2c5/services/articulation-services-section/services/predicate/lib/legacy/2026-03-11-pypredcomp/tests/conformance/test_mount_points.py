"""Mount points — spec §5 conformance.

Pins ``specs/filesystem/mount-points.md`` §5 gates 1–3 plus the
spec §1 binary-cell shape. The fetch backends (peer protocol, fs
driver, git driver, paracosm reader) are intentionally out of scope
for the v0.2a slice; this fixture exercises the substrate machinery
that backends sit on top of:

- attach writes the five (or six, with scope-restriction) §1 cells
  through the binary-cell-emission discipline;
- ``find_mount_for`` reports a mount as covering a slug iff the slug
  starts with the mount's local-prefix (gate 1's prerequisite);
- ``scope_restriction`` filters which foreign slugs the mount admits
  (gate 2);
- detach makes the mount invisible to ``find_mount_for`` (gate 3);
- ``resolve()`` returns ``kind="mount-target"`` for slugs under an
  attached mount, with the foreign slug stripped of the local prefix.
"""

from __future__ import annotations

import time
from pathlib import Path

import pytest

from process.session import open_session
from process.user import create_user
from storage.event_log import EventLog
from storage.mounts import (
    ATTACHED_PREDICATE,
    KIND_PREDICATE,
    KIND_VALUE,
    LOCAL_PREFIX_PREDICATE,
    SCOPE_RESTRICTION_PREDICATE,
    SOURCE_REF_PREDICATE,
    SOURCE_TYPE_PREDICATE,
    attach_mount,
    detach_mount,
    find_mount_for,
    list_mounts,
    project_through_mount,
)
from storage.paths import resolve
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import SubstrateError


@pytest.fixture
def boot(tmp_path: Path):
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


# --- spec §1: binary cells -------------------------------------------------


def test_attach_writes_spec_section_1_binary_cells(boot):
    layout, event_log, sess = boot
    mp = attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    assert mp.slug == "reach-around"
    assert mp.attached is True

    fiber = layout.get_fiber("mount:reach-around")
    assert fiber is not None
    by_predicate = fiber["cells_by_predicate"]
    # Spec §1 lists kind / source-type / source-ref / local-prefix /
    # scope-restriction (optional). attached is the v0.2a substrate
    # marker for the spec §3 attach/detach lifecycle.
    for predicate in (KIND_PREDICATE, SOURCE_TYPE_PREDICATE,
                      SOURCE_REF_PREDICATE, LOCAL_PREFIX_PREDICATE,
                      ATTACHED_PREDICATE):
        assert predicate in by_predicate, f"missing predicate {predicate!r}"

    # Every cell carries v=True per binary-cell-emission discipline.
    for cell in fiber["cells"]:
        assert cell["v"] == BilatticeValue.TRUE.value
        assert cell["s"] == "mount:reach-around"
        assert cell["stratum"] == "asserted"


def test_attach_with_scope_restriction_writes_sixth_cell(boot):
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="public-only",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
        scope_restriction="public/*",
    )
    fiber = layout.get_fiber("mount:public-only")
    assert SCOPE_RESTRICTION_PREDICATE in fiber["cells_by_predicate"]


# --- spec §5 gate 1: covered slugs ----------------------------------------


def test_find_mount_for_returns_mount_when_slug_starts_with_prefix(boot):
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    mp = find_mount_for(layout, "remote/reach-around/captain")
    assert mp is not None and mp.slug == "reach-around"


def test_find_mount_for_returns_none_when_slug_outside_prefix(boot):
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    assert find_mount_for(layout, "task:write-spec") is None
    assert find_mount_for(layout, "remote/other/captain") is None


def test_find_mount_for_longest_prefix_wins(boot):
    """Plan-9-style overlay: a child mount under a more specific
    prefix takes precedence over the parent mount."""
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="parent",
        source_type="peer", source_ref="peer:parent",
        local_prefix="remote/",
    )
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="child",
        source_type="peer", source_ref="peer:child",
        local_prefix="remote/inner/",
    )
    mp = find_mount_for(layout, "remote/inner/foo")
    assert mp.slug == "child"
    mp2 = find_mount_for(layout, "remote/elsewhere/bar")
    assert mp2.slug == "parent"


# --- spec §5 gate 2: scope-restriction ------------------------------------


def test_scope_restriction_filters_foreign_slugs(boot):
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="public-only",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
        scope_restriction="public/*",
    )
    assert find_mount_for(layout, "remote/reach-around/public/charter") is not None
    assert find_mount_for(layout, "remote/reach-around/private/diary") is None


# --- spec §5 gate 3: detach removes ---------------------------------------


def test_detach_removes_mount_from_find(boot):
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    assert find_mount_for(layout, "remote/reach-around/x") is not None

    detach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
    )
    assert find_mount_for(layout, "remote/reach-around/x") is None
    # Definition is preserved for re-attach / audit.
    detached = list_mounts(layout, include_detached=True)
    assert len(detached) == 1 and detached[0].attached is False


def test_reattach_after_detach_is_single_binary_cell_write(boot):
    """Spec §1: detach preserves definition cells so re-attach is a
    single ``attached=True`` binary-cell write."""
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    detach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
    )

    height_before = event_log.height()
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    height_after = event_log.height()
    assert height_after - height_before == 1, (
        "spec §1: re-attach of an unchanged definition is one cell write"
    )
    assert find_mount_for(layout, "remote/reach-around/x") is not None


def test_reattach_with_changed_source_ref_re_emits_only_diverging_predicate(boot):
    """Operators relocate a mount by re-attach with new source-ref —
    only divergent predicates are re-emitted (plus the attached
    flip). Definition cells that match are not re-written."""
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:old.local",
        local_prefix="remote/reach-around/",
    )
    detach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
    )
    height_before = event_log.height()
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:new.local",  # changed
        local_prefix="remote/reach-around/",
    )
    # source-ref divergence + attached flip = 2 events.
    assert event_log.height() - height_before == 2
    mp = find_mount_for(layout, "remote/reach-around/x")
    assert mp is not None and mp.source_ref == "peer:new.local"


# --- resolver integration -------------------------------------------------


def test_resolve_returns_mount_target_for_covered_slug(boot):
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="reach-around",
        source_type="peer", source_ref="peer:reach-around.561.local",
        local_prefix="remote/reach-around/",
    )
    r = resolve("remote/reach-around/task:write-charter", layout=layout)
    assert r.kind == "mount-target"
    assert r.target == "task:write-charter"
    assert r.via == "mount"
    assert r.mount_slug == "reach-around"


def test_resolve_falls_through_to_entity_when_no_mount(boot):
    layout, event_log, sess = boot
    r = resolve("task:write-charter", layout=layout)
    assert r.kind == "entity"
    assert r.via == "entity"
    assert r.mount_slug is None


# --- helpers --------------------------------------------------------------


def test_project_through_mount_strips_prefix(boot):
    layout, event_log, sess = boot
    mp = attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="home",
        source_type="fs", source_ref="/home/emsenn/",
        local_prefix="host/home/",
    )
    assert project_through_mount(mp, "host/home/notes/today.md") == "notes/today.md"


def test_malformed_attached_value_is_invisible(boot):
    """A non-canonical ``attached`` object value (anything other than
    exactly ``"True"`` or ``"False"``) is treated as malformed and the
    mount is held out of the registry — pins the parser contract."""
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="garbled",
        source_type="peer", source_ref="peer:garbled",
        local_prefix="remote/garbled/",
    )
    fiber = layout.get_fiber("mount:garbled")
    for cell in fiber["cells"]:
        if cell["p"] == ATTACHED_PREDICATE:
            cell["o"] = "yes"  # not canonical
    layout.put_fiber("mount:garbled", fiber)
    assert find_mount_for(layout, "remote/garbled/foo") is None


def test_reattach_returns_persisted_scope_restriction_when_omitted(boot):
    """Re-attach that omits ``scope_restriction`` returns the persisted
    restriction in the result — pins return-semantics ↔ registry-state
    coherence."""
    layout, event_log, sess = boot
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="restricted",
        source_type="peer", source_ref="peer:restricted",
        local_prefix="remote/restricted/",
        scope_restriction="public/*",
    )
    detach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="restricted",
    )
    mp = attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="restricted",
        source_type="peer", source_ref="peer:restricted",
        local_prefix="remote/restricted/",
        # scope_restriction omitted on re-attach
    )
    assert mp.scope_restriction == "public/*"
    # Round-trip through the registry too.
    visible = find_mount_for(layout, "remote/restricted/public/x")
    assert visible is not None and visible.scope_restriction == "public/*"


def test_partially_authored_mount_missing_attached_is_invisible(boot):
    """v0.2a non-atomic attach: a crash after definition cells but
    before the ``attached`` write must leave the mount out of the
    registry surface. Spec §1 makes ``attached`` part of the mount's
    identity; without it the operator's binding intent is unknown.
    """
    layout, event_log, sess = boot
    # Synthesize a partial fiber by writing only the four definition
    # predicates — no ``attached`` cell. (We use the public emit
    # helper indirectly by calling attach_mount with a monkey-patched
    # pair list isn't worth the surface; instead, drive attach then
    # rewrite the fiber to drop the attached entry, simulating a
    # crash after definition but before the lifecycle write.)
    attach_mount(
        layout=layout, event_log=event_log, node_id="test-node",
        session_slug=sess.slug, slug="partial",
        source_type="peer", source_ref="peer:partial",
        local_prefix="remote/partial/",
    )
    fiber = layout.get_fiber("mount:partial")
    fiber["cells_by_predicate"].pop(ATTACHED_PREDICATE, None)
    fiber["predicates"].pop(ATTACHED_PREDICATE, None)
    fiber["cells"] = [
        c for c in fiber["cells"] if c["p"] != ATTACHED_PREDICATE
    ]
    layout.put_fiber("mount:partial", fiber)

    assert find_mount_for(layout, "remote/partial/foo") is None
    assert list_mounts(layout) == []


def test_invalid_mount_inputs_rejected(boot):
    layout, event_log, sess = boot
    with pytest.raises(SubstrateError):
        attach_mount(
            layout=layout, event_log=event_log, node_id="test-node",
            session_slug=sess.slug, slug="bad/slug",
            source_type="peer", source_ref="peer:x", local_prefix="x/",
        )
    with pytest.raises(SubstrateError):
        attach_mount(
            layout=layout, event_log=event_log, node_id="test-node",
            session_slug=sess.slug, slug="ok",
            source_type="peer", source_ref="peer:x",
            local_prefix="/absolute/",
        )
    with pytest.raises(SubstrateError):
        attach_mount(
            layout=layout, event_log=event_log, node_id="test-node",
            session_slug=sess.slug, slug="ok",
            source_type="peer", source_ref="", local_prefix="x/",
        )
