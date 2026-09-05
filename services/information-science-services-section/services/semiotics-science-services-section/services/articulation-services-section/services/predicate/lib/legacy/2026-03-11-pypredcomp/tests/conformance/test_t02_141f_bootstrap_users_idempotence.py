"""Conformance — bootstrap-users idempotence (`t02-141f`).

Pairs with [`task:t02-141`](../../docs/dev/tasks/engineering/t02-141-v0.2a-multi-user-authoring.md)
per [decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).
This is the **byte-identity determinism gate** for the bootstrap-users
*routine* (``ensure_users_from_manifest``), witnessing the [boot-determinism
theorem](../../../../../../../library/theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md):
*boot is a deterministic function of (deployment image, persistent set)*.

**Scope.** The t02-141 acceptance asks that ``events.jsonl`` is byte-identical
across reboots *with respect to the bootstrap-users phase's contribution*.
The full :func:`init_boot.boot.boot` sequence emits per-boot
``runlevel-transition`` events from the runlevel phases regardless of
bootstrap state — those events are unrelated to the bootstrap-users routine
and would mask its idempotence at the file level. We therefore drive the
routine directly via :func:`ensure_users_from_manifest`, matching the
established pattern in :mod:`tests.conformance.test_bootstrap_users_manifest`,
and pin byte-identity at the routine's grain. The full-boot count-level
idempotence (``responds_after_second == responds_after_first``) is already
pinned in :mod:`tests.conformance.test_t02_145f_bootstrap_reconcile_joint`;
this fixture is the byte-grain refinement.

**The four legs:**

* **Unchanged-manifest** (``test_unchanged_manifest_call_is_byte_identical``)
  — first call provisions; second call against the same manifest must add
  zero bytes to ``events.jsonl``. Byte-identical, sha256-identical,
  line-identical. Repeat for a third call to confirm steady-state.
  ``EventLog.verify()`` (the canonical hash-chain check) passes throughout.
* **Diagnostic sibling** (``test_unchanged_manifest_call_emits_zero_responds``)
  — narrows any future regression to the bootstrap routine by counting
  respond events the second call contributed.
* **Changed-manifest** (``test_changed_manifest_call_appends_only_the_delta``)
  — swap manifest A → B (adds ``user:carol``); the post-A byte prefix is
  preserved verbatim (append-only per
  [decisions/event-log-is-jsonl.md](../../docs/dev/decisions/event-log-is-jsonl.md)),
  and the delta lines target only ``user:carol`` and ``deployment``. No
  existing user appears as an event target — the spec invariant *bootstrap
  MUST NOT modify existing users* is structurally checked.
* **New steady state** (``test_changed_manifest_reaches_new_steady_state``)
  — after the manifest change, subsequent calls against the new manifest
  are themselves byte-identical no-ops. Idempotence is preserved through
  the change, not just before it.

No determinism patching is required: the second call's bootstrap_users
phase emits ZERO events on the unchanged path because every per-user
predicate is already True (per :func:`_assert_if_changed`) and the
manifest-hash record is gated on change-or-first-boot. Byte-identity
follows from the implementation's structural idempotence, not from
monkeypatched RNG / clock.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

from init_boot.bootstrap_users import (
    BootstrapManifest,
    BootstrapUserEntry,
    ensure_users_from_manifest,
)
from process.user import authenticate, list_users
from storage.event_log import EVENT_LOG_FILENAME, EventLog
from storage.storage_layout import StorageLayout


# ---------------------------------------------------------------------------
# Manifest helpers
# ---------------------------------------------------------------------------


def _manifest_a() -> BootstrapManifest:
    return BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:captain", display_name="Captain", role="admin"),
        BootstrapUserEntry(slug="user:alice",   display_name="Alice",   role="member"),
        BootstrapUserEntry(slug="user:bob",     display_name="Bob",     role="observer"),
    ])


def _manifest_b() -> BootstrapManifest:
    """Manifest-A + one extra user (``user:carol``)."""
    return BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:captain", display_name="Captain", role="admin"),
        BootstrapUserEntry(slug="user:alice",   display_name="Alice",   role="member"),
        BootstrapUserEntry(slug="user:bob",     display_name="Bob",     role="observer"),
        BootstrapUserEntry(slug="user:carol",   display_name="Carol",   role="member"),
    ])


def _open_substrate(root: Path, node_id: str = "n") -> tuple[StorageLayout, EventLog]:
    """Open layout + event-log without invoking the full ``boot()`` sequence.

    Mirrors the in-process opening that ``ensure_users_from_manifest`` does
    not own (it expects an attached log). The ``initialize`` call is the
    log-attach Phase 2 effect; calling it twice on the same root is safe
    (it's a no-op when the genesis event is already present).
    """
    import time
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id=node_id, wall_clock_ns=time.time_ns())
    return layout, log


def _events_path(root: Path) -> Path:
    return root / EVENT_LOG_FILENAME


def _read_bytes(path: Path) -> bytes:
    return path.read_bytes()


def _read_lines(path: Path) -> list[str]:
    return path.read_text(encoding="utf-8").splitlines()


# ---------------------------------------------------------------------------
# Unchanged-manifest leg — byte-identity across re-calls
# ---------------------------------------------------------------------------


def test_unchanged_manifest_call_is_byte_identical(tmp_path):
    """The load-bearing acceptance: ``events.jsonl`` after a second
    ``ensure_users_from_manifest`` call against an unchanged manifest is
    byte-for-byte identical to the post-first-call file.

    This is strictly stronger than the joint fixture's "zero new respond
    events" assertion: byte-identity rules out same-kind/different-timestamp
    appends that would silently break the boot-determinism theorem.
    """
    layout, log = _open_substrate(tmp_path)
    log_path = _events_path(tmp_path)

    # First call provisions the manifest.
    r1 = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    assert sorted(r1.created_slugs) == ["user:alice", "user:bob", "user:captain"]
    bytes_after_first = _read_bytes(log_path)
    sha_after_first = hashlib.sha256(bytes_after_first).hexdigest()
    lines_after_first = _read_lines(log_path)

    # --- second call: must add zero bytes ---
    r2 = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    bytes_after_second = _read_bytes(log_path)
    assert bytes_after_second == bytes_after_first, (
        "events.jsonl must be byte-identical across an idempotent re-call; "
        f"first sha256={sha_after_first}, "
        f"second sha256={hashlib.sha256(bytes_after_second).hexdigest()}; "
        f"size delta = {len(bytes_after_second) - len(bytes_after_first)} bytes"
    )
    assert hashlib.sha256(bytes_after_second).hexdigest() == sha_after_first
    assert _read_lines(log_path) == lines_after_first

    # --- third call: confirm steady state, not a one-shot ---
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    assert _read_bytes(log_path) == bytes_after_first

    # Hash chain remains valid.
    EventLog(tmp_path).verify()

    # Cross-check the BootstrapResult shape on the idempotent re-call.
    assert r2.created_slugs == []
    assert r2.manifest_changed is False
    assert r2.tokens == {}
    assert r2.manifest_hash == r1.manifest_hash
    assert r2.prior_manifest_hash == r1.manifest_hash


def test_unchanged_manifest_call_emits_zero_responds(tmp_path):
    """Sibling assertion at the per-routine granularity.

    Byte-identity (test above) is the structural witness; this is the
    diagnostic: if byte-identity ever fails, this assertion narrows the
    failure to ``ensure_users_from_manifest`` by counting respond events
    contributed by it specifically.
    """
    layout, log = _open_substrate(tmp_path)

    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    responds_before = sum(1 for ev in log.iter_events() if ev.get("kind") == "respond")

    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    responds_after = sum(1 for ev in log.iter_events() if ev.get("kind") == "respond")

    assert responds_after == responds_before, (
        "ensure_users_from_manifest must emit zero respond events on idempotent "
        f"re-call; grew from {responds_before} to {responds_after}"
    )


# ---------------------------------------------------------------------------
# Changed-manifest leg — append-only delta is exactly the expected change
# ---------------------------------------------------------------------------


def test_changed_manifest_call_appends_only_the_delta(tmp_path):
    """Acceptance criterion #3: a second call against a CHANGED manifest emits
    exactly the new manifest-hash record + the additional user provisioning
    events; existing users are not modified.

    Witnesses two structural invariants:

    1. **Append-only** — the post-first-call byte prefix is preserved verbatim
       in the post-second-call file. (The event log is structurally append-only
       per [decisions/event-log-is-jsonl.md](../../docs/dev/decisions/event-log-is-jsonl.md).)
    2. **Surgical delta** — the appended lines target only the new user's
       slug + the deployment manifest-hash entity. No event has an existing
       user as its target.
    """
    layout, log = _open_substrate(tmp_path)
    log_path = _events_path(tmp_path)

    r1 = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    captain_token = r1.tokens["user:captain"]
    alice_token   = r1.tokens["user:alice"]
    bob_token     = r1.tokens["user:bob"]

    bytes_after_a = _read_bytes(log_path)
    lines_after_a = _read_lines(log_path)

    # Swap manifest A → B (adds user:carol).
    r2 = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_b(),
    )
    bytes_after_b = _read_bytes(log_path)
    lines_after_b = _read_lines(log_path)

    # --- (1) append-only: the A-prefix is preserved verbatim ---
    assert bytes_after_b.startswith(bytes_after_a), (
        "event log must be append-only; the post-A prefix must survive "
        "verbatim into the post-B state"
    )
    assert lines_after_b[: len(lines_after_a)] == lines_after_a

    # --- (2) surgical delta ---
    delta_lines = lines_after_b[len(lines_after_a):]
    assert delta_lines, "changed manifest must produce at least the new user + hash"

    delta_targets: set[str] = set()
    delta_kinds: dict[str, int] = {}
    for raw in delta_lines:
        ev = json.loads(raw)
        kind = ev.get("kind")
        delta_kinds[kind] = delta_kinds.get(kind, 0) + 1
        body = ev.get("body") or {}
        target = body.get("target") or body.get("entity")
        if isinstance(target, str):
            delta_targets.add(target)

    # The only entities touched by the delta are user:carol (new user) and
    # 'deployment' (the manifest-hash audit record). NO existing user appears.
    # carol is provisioned net-new — both her user-surface auth cell
    # (`(user:carol, provisioned)` from process.user.create_user) and her
    # boundary-surface identity cells (kind-user / projects-*-fiber /
    # role-* / granted:*) appear in the delta. Existing users (captain,
    # alice, bob) must not appear on either surface — the substrate does
    # NOT modify already-provisioned users, per spec §4.1.
    assert "user:carol"     in delta_targets, delta_targets
    assert "boundary:carol" in delta_targets, delta_targets
    assert "deployment"     in delta_targets, delta_targets
    for forbidden in (
        "user:captain", "user:alice", "user:bob",
        "boundary:captain", "boundary:alice", "boundary:bob",
    ):
        assert forbidden not in delta_targets, (
            f"existing user {forbidden!r} was modified by the changed-manifest "
            f"re-call — bootstrap MUST NOT modify existing users; "
            f"delta targets = {sorted(delta_targets)}"
        )

    # The delta contains at least one respond event (the manifest-hash record
    # plus carol's provisioning predicates).
    assert delta_kinds.get("respond", 0) >= 1, delta_kinds

    # --- (3) bookkeeping ---
    assert r2.created_slugs == ["user:carol"]
    assert r2.manifest_changed is True
    assert set(r2.tokens) == {"user:carol"}

    # Existing users still authenticate with their original tokens (proof
    # that bootstrap did not touch their auth-fiber records).
    assert authenticate(layout, captain_token).slug == "user:captain"
    assert authenticate(layout, alice_token).slug   == "user:alice"
    assert authenticate(layout, bob_token).slug     == "user:bob"

    # All four users now present.
    assert sorted(u.slug for u in list_users(layout)) == [
        "user:alice", "user:bob", "user:captain", "user:carol",
    ]

    # The hash chain remains valid through the delta.
    EventLog(tmp_path).verify()


# ---------------------------------------------------------------------------
# Belt-and-suspenders — second call after the changed manifest is itself
# idempotent (byte-identity holds against the new steady state).
# ---------------------------------------------------------------------------


def test_changed_manifest_reaches_new_steady_state(tmp_path):
    """After a manifest change, subsequent calls against the SAME (changed)
    manifest are themselves byte-identical no-ops. Idempotence is preserved
    through the change, not just before it.
    """
    layout, log = _open_substrate(tmp_path)

    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_a(),
    )
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_b(),
    )

    log_path = _events_path(tmp_path)
    bytes_after_b1 = _read_bytes(log_path)

    # Re-call with manifest B unchanged: must be byte-identical.
    r = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="n", manifest=_manifest_b(),
    )
    assert _read_bytes(log_path) == bytes_after_b1
    assert r.created_slugs == []
    assert r.manifest_changed is False


# ---------------------------------------------------------------------------
# True reboot semantics — re-open StorageLayout/EventLog between calls
# ---------------------------------------------------------------------------


def test_reboot_against_unchanged_manifest_is_byte_identical(tmp_path):
    """The strongest form of the t02-141 acceptance: simulate a true process
    *reboot* by discarding the in-process ``StorageLayout`` and ``EventLog``
    instances between the two calls and re-opening them from disk.

    This catches any latent dependence on in-memory state held by the
    ``EventLog`` instance (e.g. cached event lists, predicate maps) that
    would not survive a real process restart and could otherwise mask a
    re-emission bug. Byte-identity of ``events.jsonl`` across the boundary
    is the load-bearing witness for the boot-determinism theorem.
    """
    layout1, log1 = _open_substrate(tmp_path)
    ensure_users_from_manifest(
        layout=layout1, event_log=log1, node_id="n", manifest=_manifest_a(),
    )
    log_path = _events_path(tmp_path)
    bytes_after_first = _read_bytes(log_path)

    # Drop the in-process handles — simulate process exit.
    del layout1, log1

    # Re-open from disk and re-run with the same manifest.
    layout2, log2 = _open_substrate(tmp_path)
    r = ensure_users_from_manifest(
        layout=layout2, event_log=log2, node_id="n", manifest=_manifest_a(),
    )
    bytes_after_reboot = _read_bytes(log_path)

    assert bytes_after_reboot == bytes_after_first, (
        "events.jsonl must be byte-identical across a true reboot against "
        "an unchanged manifest"
    )
    assert r.created_slugs == []
    assert r.manifest_changed is False
    EventLog(tmp_path).verify()


def test_reboot_after_manifest_change_does_not_re_emit_hash(tmp_path):
    """Reboot variant of the steady-state test — the case where the original
    bug lived. After A→B in one process and B in a fresh process, the second
    B call must read prior=B from disk (not None, not A) and emit nothing.
    """
    layout1, log1 = _open_substrate(tmp_path)
    ensure_users_from_manifest(
        layout=layout1, event_log=log1, node_id="n", manifest=_manifest_a(),
    )
    ensure_users_from_manifest(
        layout=layout1, event_log=log1, node_id="n", manifest=_manifest_b(),
    )
    log_path = _events_path(tmp_path)
    bytes_after_b = _read_bytes(log_path)
    del layout1, log1

    layout2, log2 = _open_substrate(tmp_path)
    r = ensure_users_from_manifest(
        layout=layout2, event_log=log2, node_id="n", manifest=_manifest_b(),
    )
    assert _read_bytes(log_path) == bytes_after_b, (
        "reboot against the post-change manifest must not re-emit the hash; "
        "this is the exact path the _read_prior_manifest_hash bug broke"
    )
    assert r.manifest_changed is False
    assert r.prior_manifest_hash == r.manifest_hash
    EventLog(tmp_path).verify()
