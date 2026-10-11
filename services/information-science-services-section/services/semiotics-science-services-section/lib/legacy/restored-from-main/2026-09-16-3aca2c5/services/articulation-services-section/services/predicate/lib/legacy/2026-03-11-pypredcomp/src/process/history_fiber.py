"""History-fiber projection — sender-keyed event-log slice.

Per [`decisions/identity-is-boundary-projection.md`](../../docs/dev/decisions/identity-is-boundary-projection.md)
and [`specs/security/user-as-boundary.md`](../../docs/dev/specs/security/user-as-boundary.md),
a user is a boundary entity that projects four canonical fibers; the
``history`` fiber is the *audit-side* projection — every event the user
authored as ``sender``, plus optionally every event whose target the
user attended to.

Per row 12 of [`references/theory-for-developers.md`](../../docs/dev/references/theory-for-developers.md)
("caches are recomputable from history, never authoritative against
history"), the history fiber is a *derived* projection, not a stored
cache: the event log is the truth-source. At v0.2a the projection is
computed on demand by walking [`storage.event_log.EventLog`](../storage/event_log.py).
The boundary entity already carries the projection-cell witness
``(boundary:<bare>, projects-history-fiber, true)`` emitted at
provisioning time by [`init_boot.bootstrap_users`](../init_boot/bootstrap_users.py).
Per [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../../docs/dev/decisions/personnel-migration-sequenced-before-bootstrap-users.md)
the witness lives on the ``boundary:<bare>`` identity surface — the
same surface ``personnel_migration`` lands migrated personnel records
on — while the ``sender`` field on each event remains the user-form
slug ``user:<bare>`` (the auth-record / authoring-identity surface
returned by :func:`process.user.authenticate`).

Determinism. The projection is a pure function of
``(event_log[:head_ord], sender, attended_targets)``; the canonical
digest returned in :class:`HistoryFiberProjection` is the SHA-256 of the
canonical-bytes encoding (per
[`specs/kernel/canonicalization.md`](../../docs/dev/specs/kernel/canonicalization.md))
of the projection's ``events`` list. Two byte-identical event logs
produce byte-identical history projections under the
[event-ordinal-is-time](../../docs/dev/decisions/event-ordinal-is-time.md)
discipline — wall-clock fields are excluded from the projection.

Coordinates with `t02-143` (fiber-cache reconcile): when the existing
per-target fiber-snapshot cache is rebuilt from event-log truth by
[`init_boot.fiber_reconcile.reconcile_fibers`](../init_boot/fiber_reconcile.py),
the history projection is unaffected because it derives directly from
the event log — not from any rebuilt cache file. Per recipe 6 (projection
divergence) the history projection NEVER patches; if a future cache file
is added, divergence surfaces as
:data:`substrate.error_codes.PCC_PROJECTION_DIVERGED`.
"""

from __future__ import annotations

import hashlib
from typing import Any, Iterable

from pydantic import BaseModel, ConfigDict, Field

from storage.event_log import EventLog
from substrate.canonicalization import canonical


HISTORY_FIBER_NAME = "history"


class HistoryEvent(BaseModel):
    """One row of a sender's history-fiber projection.

    Carries only the ordinal-time, content-addressed fields — wall-clock
    timestamps and node identifiers are excluded so the projection is
    byte-stable across re-runs and cross-implementation.
    """

    model_config = ConfigDict(extra="forbid")

    ord: int = Field(description="Event-log ordinal; the canonical 'time'.")
    event_id: str = Field(description="Content-addressed event id.")
    kind: str = Field(description="Event kind, e.g. 'respond' or 'federation_merge'.")
    target: str | None = Field(
        default=None,
        description="The respond target / merge entity, if any.",
    )
    cell_id: str | None = Field(
        default=None,
        description="The fiber-snapshot id this event produced, if any.",
    )
    payload_keys: list[str] = Field(
        default_factory=list,
        description="Sorted predicate keys from the respond payload (R1).",
    )
    payload_digest: str | None = Field(
        default=None,
        description="Canonical-bytes SHA-256 of the post-reduction payload (R1).",
    )


class HistoryFiberProjection(BaseModel):
    """Sender-keyed history-fiber projection.

    The ``digest`` field is the SHA-256 of the canonical-bytes encoding
    of ``events`` (after model-dump) — the witness that two runs over
    identical event logs produced identical projections.
    """

    model_config = ConfigDict(extra="forbid")

    entity: str = Field(description="The boundary entity, e.g. 'user:alice'.")
    fiber: str = Field(default=HISTORY_FIBER_NAME, description="Always 'history' here.")
    head_ord: int = Field(
        description="The event-log ord at projection time; bounds 'as-of'.",
    )
    sender_events: list[HistoryEvent] = Field(
        default_factory=list,
        description="Events authored by the entity, in ord-ascending order.",
    )
    attended_events: list[HistoryEvent] = Field(
        default_factory=list,
        description=(
            "Events whose ``target`` the entity attended to, when "
            "``attended_targets`` is supplied; ord-ascending."
        ),
    )
    digest: str = Field(description="SHA-256 of the canonical projection bytes.")


# ---------------------------------------------------------------------------
# Projection.
# ---------------------------------------------------------------------------


def _matches_sender(body: dict[str, Any], sender: str) -> bool:
    return body.get("sender") == sender


def _matches_target(body: dict[str, Any], targets: frozenset[str]) -> bool:
    target = body.get("target") or body.get("entity")
    return isinstance(target, str) and target in targets


def _row_from_event(ev: dict[str, Any]) -> HistoryEvent:
    body = ev.get("body") or {}
    target = body.get("target") or body.get("entity")
    cell_id = body.get("cell_id")
    payload_keys = body.get("payload_keys") or []
    payload_digest = body.get("payload_digest")
    return HistoryEvent(
        ord=int(ev.get("ord", 0)),
        event_id=str(ev.get("id")),
        kind=str(ev.get("kind", "")),
        target=target if isinstance(target, str) else None,
        cell_id=cell_id if isinstance(cell_id, str) else None,
        payload_keys=[k for k in payload_keys if isinstance(k, str)],
        payload_digest=(
            payload_digest if isinstance(payload_digest, str) else None
        ),
    )


def _digest_projection(
    *,
    entity: str,
    fiber: str,
    head_ord: int,
    sender_rows: Iterable[HistoryEvent],
    attended_rows: Iterable[HistoryEvent],
) -> str:
    """Canonical SHA-256 over the full projection shape.

    The two slices (``sender_events``, ``attended_events``) are kept
    under distinct keys so that projection identity is unambiguous —
    re-partitioning the same row set between the two slices MUST change
    the digest. ``digest`` itself is, of course, excluded from the
    canonical input.
    """
    payload = {
        "entity": entity,
        "fiber": fiber,
        "head_ord": head_ord,
        "sender_events": [r.model_dump() for r in sender_rows],
        "attended_events": [r.model_dump() for r in attended_rows],
    }
    return hashlib.sha256(canonical(payload)).hexdigest()


def history_fiber_for(
    *,
    event_log: EventLog,
    sender: str,
    attended_targets: Iterable[str] | None = None,
    head_ord: int | None = None,
) -> HistoryFiberProjection:
    """Project the history fiber for ``sender`` from the event log.

    Walks the event log in ordinal order — ``EventLog.iter_events``
    yields the JSONL records as written, and the JSONL discipline plus
    single-writer invariant give us monotone ord. Each event whose
    ``body.sender == sender`` is appended to ``sender_events``; if
    ``attended_targets`` is supplied, every event whose target is in
    that set is appended to ``attended_events`` (sender-authored events
    are NOT excluded from ``attended_events`` — the two slices are
    independent projections).

    Args:
        event_log: The substrate event log.
        sender: The boundary slug, e.g. ``"user:alice"``.
        attended_targets: Optional iterable of target slugs the entity
            attended to (read). Empty / ``None`` skips the read-side
            projection.
        head_ord: Optional upper bound (inclusive). Events with
            ``ord > head_ord`` are skipped, so the projection is
            ``as-of`` that ord. ``None`` (default) projects against the
            full log.

    Returns:
        A :class:`HistoryFiberProjection` whose ``digest`` is the
        canonical-bytes SHA-256 of the projection — the witness for the
        byte-identical-across-runs guarantee.
    """
    targets: frozenset[str] = (
        frozenset(attended_targets) if attended_targets else frozenset()
    )
    sender_rows: list[HistoryEvent] = []
    attended_rows: list[HistoryEvent] = []
    seen_head = -1
    for ev in event_log.iter_events():
        ord_ = int(ev.get("ord", 0))
        if head_ord is not None and ord_ > head_ord:
            continue
        if ord_ > seen_head:
            seen_head = ord_
        body = ev.get("body") or {}
        is_sender = _matches_sender(body, sender)
        is_attended = bool(targets) and _matches_target(body, targets)
        if not (is_sender or is_attended):
            continue
        row = _row_from_event(ev)
        if is_sender:
            sender_rows.append(row)
        if is_attended:
            attended_rows.append(row)

    sender_rows.sort(key=lambda r: r.ord)
    attended_rows.sort(key=lambda r: r.ord)

    effective_head = head_ord if head_ord is not None else max(seen_head, 0)
    digest = _digest_projection(
        entity=sender,
        fiber=HISTORY_FIBER_NAME,
        head_ord=effective_head,
        sender_rows=sender_rows,
        attended_rows=attended_rows,
    )
    return HistoryFiberProjection(
        entity=sender,
        fiber=HISTORY_FIBER_NAME,
        head_ord=effective_head,
        sender_events=sender_rows,
        attended_events=attended_rows,
        digest=digest,
    )
