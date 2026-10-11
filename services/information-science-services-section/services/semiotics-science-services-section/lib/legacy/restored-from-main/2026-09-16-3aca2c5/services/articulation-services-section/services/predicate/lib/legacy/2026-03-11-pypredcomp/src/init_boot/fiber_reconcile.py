"""Crash-recovery for fiber-snapshot caches.

The ``respond`` primitive persists in this order::

    snapshot  ->  event  ->  fiber

If a crash interrupts the sequence between the event append (atomic
fsync'd JSONL line) and the fiber write (atomic-rename, fsync'd), the
on-disk fiber-snapshot cache is one or more responds behind the event
log. The event log is ground truth — fiber-snapshot files are derived
caches (per ``specs/filesystem/cell-record.md`` §0 and
``specs/filesystem/presheaf-storage.md`` §4.2).

On boot we therefore:

1. Walk ``events.jsonl`` and group every ``respond`` / ``federation_merge``
   event by its target entity, recording ``(event_id, event_ord, cell_id)``.
2. For each entity, compare to the on-disk fiber's ``history``. If the
   sequences differ in length or content, the fiber is stale.
3. Rebuild the stale fiber by walking every snapshot in history in
   order: the snapshot's ``predicates`` map updates the fiber's
   ``predicates`` (latest snapshot's value wins per-key); each atom in
   the snapshot's ``cells: [...]`` array updates ``cells_by_predicate``
   (latest atom-id wins per predicate, preserving the witness-map
   invariant respond.py depends on); the full event-derived history
   replaces ``history``; ``latest_cell_id`` points at the tail snapshot.

Snapshot files / events / aliases / rules are content-addressed and
immutable, so they need no reconciliation — only the mutable fiber
cache file does.
"""

from __future__ import annotations

import logging
from typing import Any

from substrate.algebra import BilatticeValue
from substrate.error_codes import PCC_PROJECTION_DIVERGED, SubstrateError
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout

log = logging.getLogger("substrate.boot.reconcile")


def reconcile_fibers(
    *, layout: StorageLayout, event_log: EventLog, strict: bool = False
) -> dict[str, Any]:
    """Rebuild any stale fiber caches from event-log truth.

    The default mode is *crash-recovery*: a fiber whose on-disk
    ``history`` lags the event log is silently rebuilt from the
    immutable cell records (the canonical truth per
    ``decisions/event-log-is-the-truth.md``). This handles the expected
    case of a crash interrupting the ``cell -> event -> fiber``
    persistence sequence in :func:`substrate.respond.respond`.

    With ``strict=True`` (per
    [`specs/init-boot/boot-sequence.md`](../../docs/dev/specs/init-boot/boot-sequence.md)
    §4.2 step 3): any divergence is treated as
    :data:`substrate.error_codes.PCC_PROJECTION_DIVERGED`. Boot is
    expected to transition to ``degraded`` rather than trust a
    potentially-corrupted cache. The summary's ``"divergent"`` list
    enumerates the offending entities; the first such entity also
    becomes the ``SubstrateError`` ``details["entity"]`` for surfacing.

    Returns a summary dict::

        {
            "scanned": <int — entities seen in event log>,
            "repaired": [<entity-slug>, ...],   # silently rebuilt
            "divergent": [<entity-slug>, ...],  # detected but not touched (strict)
        }
    """
    expected: dict[str, list[dict[str, Any]]] = {}
    for ev in event_log.iter_events():
        if ev.get("kind") not in ("respond", "federation_merge"):
            continue
        body = ev.get("body") or {}
        target = body.get("target") or body.get("entity")
        cell_id = body.get("cell_id")
        if not isinstance(target, str) or not isinstance(cell_id, str):
            continue
        expected.setdefault(target, []).append(
            {
                "event_id": ev["id"],
                "event_ord": ev["ord"],
                "cell_id": cell_id,
            }
        )

    repaired: list[str] = []
    divergent: list[str] = []

    # Orphan-fiber detection (strict-mode addition): a fiber file present on
    # disk for an entity that has *zero* respond/federation_merge events in the
    # log is not log-truth — it was either written by a code path that bypassed
    # the persistence sequence or is a stale artifact from a discarded run.
    # Crash-recovery semantics don't apply (there's nothing to rebuild from);
    # strict mode flags it as PCC_PROJECTION_DIVERGED so degraded-boot surfaces
    # the corruption rather than letting reads return ghosts. Non-strict mode
    # leaves the orphan in place (legacy data, federation edge case).
    if strict:
        for entity in _enumerate_on_disk_fibers(layout):
            if entity in expected:
                continue
            divergent.append(entity)

    for entity, history in expected.items():
        on_disk = layout.get_fiber(entity)
        on_disk_history = (on_disk or {}).get("history") or []
        if _history_matches(on_disk_history, history):
            continue
        if strict and on_disk is not None:
            # Per boot-sequence spec §4.2 step 3: divergence is when an
            # *existing* on-disk projection disagrees with the log-truth
            # rebuild. A missing fiber file (``on_disk is None``) is the
            # ordinary crash-recovery case (the runtime crashed between
            # event append and fiber write) and is silently rebuilt
            # even in strict mode. An on-disk fiber that exists but
            # whose history does not match — including the deliberately
            # truncated ``history=[]`` corruption case — is a real
            # divergence and degrades boot.
            divergent.append(entity)
            continue
        # Stale — rebuild by walking every snapshot in history. Latest
        # value wins per predicate; latest atom-id wins per predicate
        # in cells_by_predicate (preserving respond's witness-map
        # invariant).
        rebuilt_predicates: dict[str, str] = {}
        rebuilt_cells_by_predicate: dict[str, str] = {}
        aborted = False
        for entry in history:
            cell_id = entry["cell_id"]
            try:
                snap = layout.get_record("cells", cell_id)
            except Exception as e:
                log.warning(
                    "fiber_reconcile: skipping %s — snapshot %s missing (%s)",
                    entity, cell_id, e,
                )
                aborted = True
                break
            for k, v in (snap.get("predicates") or {}).items():
                rebuilt_predicates[k] = BilatticeValue(v).value
            for atom in (snap.get("cells") or []):
                p = atom.get("p")
                aid = atom.get("id")
                if isinstance(p, str) and isinstance(aid, str):
                    rebuilt_cells_by_predicate[p] = aid
        if aborted:
            continue
        rebuilt = {
            "entity": entity,
            "latest_cell_id": history[-1]["cell_id"],
            "predicates": rebuilt_predicates,
            "cells_by_predicate": rebuilt_cells_by_predicate,
            "history": history,
        }
        layout.put_fiber(entity, rebuilt)
        repaired.append(entity)
        log.warning(
            "fiber_reconcile: rebuilt fiber for %s "
            "(was %d entries on disk, %d in log)",
            entity, len(on_disk_history), len(history),
        )

    summary = {
        "scanned": len(expected),
        "repaired": sorted(repaired),
        "divergent": sorted(divergent),
    }
    if strict and divergent:
        first = sorted(divergent)[0]
        raise SubstrateError(
            PCC_PROJECTION_DIVERGED,
            f"fiber projection diverged from event-log truth: "
            f"{len(divergent)} entit{'y' if len(divergent) == 1 else 'ies'}",
            entity=first,
            divergent=sorted(divergent),
        )
    return summary


def _enumerate_on_disk_fibers(layout: StorageLayout) -> list[str]:
    """All entity slugs with a ``fiber.json`` cache present.

    Returns sorted entity slugs (one per ``$ROOT/fibers/<slug>/fiber.json``)
    so iteration order is deterministic across boots / implementations.
    """
    fibers_root = layout.root / "fibers"
    if not fibers_root.exists():
        return []
    out: list[str] = []
    for child in fibers_root.iterdir():
        if not child.is_dir():
            continue
        if (child / "fiber.json").exists():
            out.append(child.name)
    return sorted(out)


def _history_matches(
    on_disk: list[dict[str, Any]], expected: list[dict[str, Any]]
) -> bool:
    if len(on_disk) != len(expected):
        return False
    for a, b in zip(on_disk, expected):
        if a.get("event_ord") != b["event_ord"]:
            return False
        if a.get("event_id") != b["event_id"]:
            return False
        if a.get("cell_id") != b["cell_id"]:
            return False
    return True


