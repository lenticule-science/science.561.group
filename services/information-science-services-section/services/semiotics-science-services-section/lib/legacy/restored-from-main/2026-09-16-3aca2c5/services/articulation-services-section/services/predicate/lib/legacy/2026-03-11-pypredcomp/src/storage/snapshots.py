"""Snapshots — verifiable state-root events on the substrate event log.

Per ``specs/filesystem/snapshots.md`` (the v0.2a slice, §6). A snapshot
is a typed event whose body records three Merkle-style root hashes
covering the materialised cells, rules, and fibers at one
event-ordinal cursor. Snapshots are an *optional* substrate
optimisation: the event log alone is ground truth; a snapshot
discharges the verifier-side replay-equivalence assertion that
"two substrates with the same prefix log have the same on-disk
state at every ord".

The v0.2a slice ships three primitives:

- :func:`compute_state_roots` — pure derivation of ``(cells_root_hash,
  rules_root_hash, fiber_root_hash)`` over current on-disk state.
- :func:`record_snapshot` — capability-gated typed-event emission
  (gate 4 of ``kernel/binary-cell-emission.md`` §2 via
  ``security.capabilities.require_capability`` against
  :data:`SIGNAL_SNAPSHOT_RECORD`); ord-coherence asserted after
  append per the same gate-ordering invariant the other v0.2a
  cell-emission sites obey.
- :func:`verify_snapshot` — recompute current-state roots, compare
  against a snapshot event's recorded roots, return ``bool``. The
  *replay-from-previous-snapshot* form of verification (spec §3) is
  the v0.4 federation slice's job, since it requires fast catch-up
  semantics that don't ship until then.

What is deferred (and where it ships):

- Fast catch-up by loading a snapshot and replaying since ``at-ord``
  — v0.4 federation (``specs/filesystem/snapshots.md`` §2.1).
- Fast fork from a snapshot — v0.4 federation (§2.2).
- Point-in-time queries (``fiber/<entity>?at_ord=N``) — v0.3 userland
  (§2.3).
- Configurable cadence cell ``(system, snapshot-cadence, ...)``
  driving automatic recording — v0.3 userland (§4).

Root discipline:

- Cells and rules are content-addressed (the filename stem equals the
  SHA-256 of the canonical bytes of the record without ``id``). The
  kind-root nevertheless folds each record's full on-disk bytes into
  the hash alongside its stem — ``sha256(canonical(sorted([[id,
  sha256(file_bytes)], ...])))`` — so that in-place byte tampering (a
  rewritten file keeping its name) is detected. Hashing only the
  stems would miss that attack: the stem is a property of the path,
  not of the bytes.
- Fibers are mutable per-entity caches (not content-addressed), so
  the fiber-root is the SHA-256 of the canonical bytes of the
  lexicographically-sorted list of ``(entity_slug,
  sha256_of_fiber_bytes)`` pairs. Two substrates whose fiber
  caches differ on any entity produce different fiber-root hashes
  (tamper-evident).

These three roots collectively summarise everything a session-side
replayer materialises from the event log; together with the
event-log tail's ``id`` they are the substrate's state digest.
"""

from __future__ import annotations

import hashlib
from typing import Any

from process.session import Session
from security.capabilities import (
    SIGNAL_SNAPSHOT_RECORD,
    require_capability,
)
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.canonicalization import canonical
from substrate.error_codes import PCM_PAYLOAD_INVALID, SubstrateError


SNAPSHOT_EVENT_KIND = "snapshot"


def _sha256_hex(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _content_addressed_kind_root(layout: StorageLayout, kind: str) -> str:
    """Root over ``[id, sha256(file_bytes)]`` pairs for every record.

    Used for ``cells/`` and ``rules/``. Both kinds are content-
    addressed (filename stem = SHA-256 of canonical bytes without
    ``id``), so a healthy substrate satisfies ``stem ==
    sha256(canonical(file_bytes_without_id))`` for every record.
    The kind-root nevertheless includes ``sha256(file_bytes)`` of
    each record's full on-disk bytes (i.e. the canonical bytes
    *with* the ``id`` field) so that in-place byte tampering — a
    rewritten file that keeps its stem but holds different bytes —
    is detected. Hashing only the IDs would miss this attack
    because the stem is a property of the path, not of the bytes.
    """
    base = layout.root / kind
    if not base.exists():
        return _sha256_hex(canonical([]))
    pairs: list[list[str]] = []
    for shard in sorted(base.iterdir()):
        if not shard.is_dir():
            continue
        for record in sorted(shard.iterdir()):
            if record.suffix != ".json":
                continue
            pairs.append([record.stem, _sha256_hex(record.read_bytes())])
    pairs.sort(key=lambda p: p[0])
    return _sha256_hex(canonical(pairs))


def _fiber_root(layout: StorageLayout) -> str:
    """Root over ``(entity_slug, sha256(fiber_bytes))`` pairs.

    Fibers under ``$ROOT/fibers/<entity-slug>/fiber.json`` are
    mutable caches (not content-addressed), so we hash the canonical
    bytes of each fiber file under each entity slug and roll those
    pairs into the fiber root.
    """
    base = layout.root / "fibers"
    if not base.exists():
        return _sha256_hex(canonical([]))
    pairs: list[list[str]] = []
    for entity_dir in sorted(base.iterdir()):
        if not entity_dir.is_dir():
            continue
        fiber_file = entity_dir / "fiber.json"
        if not fiber_file.exists():
            continue
        pairs.append([entity_dir.name, _sha256_hex(fiber_file.read_bytes())])
    pairs.sort(key=lambda p: p[0])
    return _sha256_hex(canonical(pairs))


def compute_state_roots(layout: StorageLayout) -> dict[str, str]:
    """Return the three substrate-state roots at the current cursor.

    Pure read of on-disk state; no event is emitted, no fiber
    written. Two substrates whose ``cells/``, ``rules/``, and
    ``fibers/`` directories agree byte-for-byte produce identical
    root triples.
    """
    return {
        "cells_root_hash": _content_addressed_kind_root(layout, "cells"),
        "rules_root_hash": _content_addressed_kind_root(layout, "rules"),
        "fiber_root_hash": _fiber_root(layout),
    }


def record_snapshot(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    sess: Session,
) -> dict[str, Any]:
    """Emit a typed ``snapshot`` event capturing current state roots.

    Gate ordering matches every other v0.2a session-issued
    substrate-action site (``capability-permissions.md`` §6.3): the
    capability check fires before the first ord-stamp, so a denied
    call leaves zero on-disk side-effect — neither event log nor any
    fiber advances. After append, ord-coherence is asserted (the
    event's ord must equal the height observed before append).

    Body fields per ``snapshots.md`` §1:

    - ``at_ord`` — the ordinal whose state this snapshot captures.
      The snapshot event itself sits at ``ord = at_ord + 1`` (the
      simplest cadence: capture the state immediately preceding the
      snapshot event's own append).
    - ``cells_root_hash``, ``rules_root_hash``, ``fiber_root_hash``
      — the three roots from :func:`compute_state_roots`.

    Returns the appended event dict (with ``id``, ``ord``, ``prev``
    populated by the event log).
    """
    require_capability(sess, SIGNAL_SNAPSHOT_RECORD)

    next_ord = event_log.height()
    if next_ord < 1:
        # Genesis must precede any snapshot — the substrate has no
        # state to summarise before its own first event.
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            "cannot record snapshot before genesis",
            height=next_ord,
        )
    at_ord = next_ord - 1

    roots = compute_state_roots(layout)
    body = {
        "at_ord": at_ord,
        "sender": sess.owner,
        "session": sess.slug,
        **roots,
    }
    event = event_log.append(
        kind=SNAPSHOT_EVENT_KIND, body=body, node_id=node_id,
    )
    if event["ord"] != next_ord:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            "ord-coherence violated: snapshot event ord disagrees with pre-append height",
            pre_append_height=next_ord, event_ord=event["ord"],
        )
    return event


def verify_snapshot(
    layout: StorageLayout, snapshot_event: dict[str, Any],
) -> bool:
    """Return ``True`` iff current on-disk state matches the snapshot's roots.

    Recomputes the three roots over current state and compares them
    against the snapshot event's body. ``False`` indicates either
    on-disk corruption since the snapshot was taken or that the
    state has advanced since (subsequent events have written new
    cells/rules/fibers). The verifier does not distinguish these
    cases — it is a state-equivalence check, not a tamper detector
    in the federation sense.

    The replay-from-previous-snapshot form of verification (spec §3
    — "re-replaying the log from the previous snapshot to ``at-ord``
    must produce the same roots") is the v0.4 federation slice's
    job, since it requires fast catch-up.
    """
    if snapshot_event.get("kind") != SNAPSHOT_EVENT_KIND:
        return False
    body = snapshot_event.get("body", {})
    current = compute_state_roots(layout)
    return all(
        body.get(field) == current[field]
        for field in ("cells_root_hash", "rules_root_hash", "fiber_root_hash")
    )


def list_snapshots(event_log: EventLog) -> list[dict[str, Any]]:
    """Return every snapshot event in the log, in append order."""
    return [
        ev for ev in event_log.iter_events()
        if ev.get("kind") == SNAPSHOT_EVENT_KIND
    ]


__all__ = [
    "SNAPSHOT_EVENT_KIND",
    "compute_state_roots",
    "record_snapshot",
    "verify_snapshot",
    "list_snapshots",
]
