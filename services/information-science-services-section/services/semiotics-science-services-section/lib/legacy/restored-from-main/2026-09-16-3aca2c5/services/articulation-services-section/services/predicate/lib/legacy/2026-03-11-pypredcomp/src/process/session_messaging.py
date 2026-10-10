"""Inter-session messaging — typed messages between sessions.

Per ``specs/process/inter-session-messaging.md`` (v0.2): typed messages
between sessions as substrate cells with a binary EAVT envelope::

    (msg, kind,           "session-message",   True)
    (msg, from-session,   sender-session,      True)
    (msg, to-session,     recipient-session,   True)   # one per recipient
    (msg, msg-type,       <type>,              True)
    (msg, content-cell,   content-id,          True)
    (msg, read,           recipient-session,   False)  # per recipient
    (msg, authored-at-ord, ord,                True)

Five canonical ``msg-type`` values: ``task-handoff``, ``query``,
``response``, ``completed``, ``conflict``. Each has required
content-cell predicates (see :data:`MSG_TYPE_REQUIRED_CONTENT`).

This module bypasses :func:`substrate.respond.respond` because the
envelope cells are binary (``s != o``) while ``respond._emit_asserted_cells``
is unary-only (forces ``o = s``). Envelope cells are written directly
through :class:`storage.storage_layout.StorageLayout` and the
:class:`storage.event_log.EventLog`; they carry stratum ``"asserted"``
(no derivation chain — a session-message envelope is a first-class
authoring claim, not a saturation result).

The inbox is a query, not a queue: :func:`list_unread` projects
``(p=to-session, o=session, v=True)`` against the cell store and
filters by the per-recipient ``read`` cell. :func:`surface_unread_messages`
applies the spec's §4 surfacing rule once, asserting
``(recipient, has-unread-message, msg, True)`` for every unread
message addressed to an open recipient. It is idempotent: re-running
with no new state writes no cells.
"""

from __future__ import annotations

import secrets
import time
from typing import Any

from pydantic import BaseModel, ConfigDict

from process.session import Session, get_session, require_open
from security.capabilities import has_any_in_namespace, require_capability
from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate import stdlib
from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCA_SCOPE_INSUFFICIENT,
    PCS_MESSAGE_RECIPIENT_CLOSED,
    PCS_MESSAGE_RECIPIENT_INVALID,
    PCS_MESSAGE_RESPONDS_TO_INVALID,
    PCS_MESSAGE_TYPE_UNKNOWN,
    PCS_RECORD_CORRUPT,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)


# Reading or surfacing one's own inbox requires being a participating
# session at all — i.e. holding ANY ``signal:session-message:*``
# capability (specific kind, per-action wildcard, or substrate
# super-grant). This closes the trivial information-leak vector where
# an unprivileged session reads another session's mailbox.
#
# Per ``capability-permissions.md`` §6.6, this is the namespace-
# participation surface: it asks "does this session participate in
# session-messaging at all?", not "does it hold THIS specific cap?",
# so it routes through ``security.capabilities.has_any_in_namespace``
# rather than ``require_capability``. Both helpers share the same
# token-aligned wildcard algebra (§6.2).
_MESSAGE_NAMESPACE = "signal:session-message"


def _has_any_message_capability(sess: Session) -> bool:
    return has_any_in_namespace(sess.capabilities, _MESSAGE_NAMESPACE)


def _require_participation(sess: Session, action: str) -> None:
    if not _has_any_message_capability(sess):
        raise SubstrateError(
            PCA_SCOPE_INSUFFICIENT,
            f"session {sess.slug!r} cannot {action}: requires "
            f"any {_MESSAGE_NAMESPACE}:* capability",
            session=sess.slug, action=action,
        )


# Canonical typed message kinds — spec §2.
CANONICAL_MSG_TYPES: frozenset[str] = frozenset({
    "task-handoff",
    "query",
    "response",
    "completed",
    "conflict",
})

# Required content-cell predicate keys per msg-type — spec §2.
MSG_TYPE_REQUIRED_CONTENT: dict[str, frozenset[str]] = {
    "task-handoff": frozenset({"task-id", "handoff-reason"}),
    "query":        frozenset({"question-cell"}),
    "response":     frozenset({"responds-to", "answer-cell"}),
    "completed":    frozenset({"task-id", "completion-cell"}),
    "conflict":     frozenset({"conflict-on", "claimed-value", "observed-value"}),
}


# ---------------------------------------------------------------------------
# Models
# ---------------------------------------------------------------------------


class SessionMessage(BaseModel):
    """A persisted session-message envelope summary."""

    model_config = ConfigDict(extra="forbid")

    slug: str
    from_session: str
    to_sessions: list[str]
    msg_type: str
    content_cell_id: str
    authored_at_ord: int
    snapshot_id: str
    event_id: str


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def _new_msg_slug() -> str:
    return f"session-message:{secrets.token_hex(8)}"


def _snap_body_for_storage(snap: FiberSnapshot) -> dict[str, Any]:
    """Strip ``id`` from the snapshot dict so storage can re-hash it."""
    body = snap.model_dump(mode="json")
    body.pop("id", None)
    return {k: v for k, v in body.items() if v is not None}


def _cell_body_for_fiber(cell: Cell) -> dict[str, Any]:
    body = cell.model_dump(mode="json")
    return {k: v for k, v in body.items() if v is not None}


def _cas_put_fiber(
    layout: StorageLayout,
    entity_slug: str,
    *,
    expected_latest_cell_id: str | None,
    new_body: dict[str, Any],
) -> None:
    """Best-effort stale-write detection for fiber RMW.

    NOT an atomic compare-and-swap primitive. This is a check-then-put
    sequence: it re-reads the on-disk fiber and refuses to overwrite if
    ``latest_cell_id`` no longer matches the baseline. Under true
    concurrent writers, two actors can still pass the check before
    either ``put_fiber`` (classic TOCTOU window).

    pypredcomp v0.2 is a single-writer substrate by design — there is
    no cross-process locking anywhere in storage_layout — so this
    guard's purpose is fail-loud behaviour against accidental in-
    process re-entrancy and against any future regression that
    introduces a second writer. Federation and multi-writer support
    (v0.3) will replace this with proper leases / advisory locks at
    the StorageLayout boundary.
    """
    current = layout.get_fiber(entity_slug)
    current_latest = (current or {}).get("latest_cell_id")
    if current_latest != expected_latest_cell_id:
        raise SubstrateError(
            PCS_RECORD_CORRUPT,
            f"fiber {entity_slug!r} mutated between read and write "
            f"(baseline latest_cell_id={expected_latest_cell_id!r}, "
            f"on-disk={current_latest!r})",
            entity=entity_slug,
            expected=expected_latest_cell_id,
            actual=current_latest,
        )
    layout.put_fiber(entity_slug, new_body)


def _capability_check(sess: Session, msg_type: str) -> None:
    """Enforce ``signal:session-message:<msg-type>`` on the sender session.

    Per spec §3 + §9 (PCA_SCOPE_INSUFFICIENT). Delegates to the shared
    :func:`security.capabilities.require_capability` so every binary-
    cell-emission site uses the same wildcard discipline.
    """
    require_capability(sess, f"signal:session-message:{msg_type}")


def _validate_recipients(
    layout: StorageLayout, recipients: list[str],
) -> list[Session]:
    if not recipients:
        raise SubstrateError(
            PCS_MESSAGE_RECIPIENT_INVALID,
            "to_session must be non-empty",
        )
    out: list[Session] = []
    for slug in recipients:
        if not isinstance(slug, str) or not slug.startswith("session:"):
            raise SubstrateError(
                PCS_MESSAGE_RECIPIENT_INVALID,
                f"recipient {slug!r} is not a session slug",
                recipient=slug,
            )
        try:
            sess = get_session(layout, slug)
        except SubstrateError as e:
            if e.code == PCS_RECORD_NOT_FOUND:
                raise SubstrateError(
                    PCS_MESSAGE_RECIPIENT_INVALID,
                    f"recipient session {slug!r} does not exist",
                    recipient=slug,
                )
            raise
        out.append(sess)
    if all(s.state != "open" for s in out):
        raise SubstrateError(
            PCS_MESSAGE_RECIPIENT_CLOSED,
            "all recipient sessions are closed",
            recipients=[s.slug for s in out],
        )
    return out


def _validate_msg_type(msg_type: str, content: dict[str, Any]) -> None:
    if msg_type not in CANONICAL_MSG_TYPES:
        raise SubstrateError(
            PCS_MESSAGE_TYPE_UNKNOWN,
            f"msg-type {msg_type!r} is not in the canonical set "
            f"({sorted(CANONICAL_MSG_TYPES)})",
            msg_type=msg_type,
        )
    required = MSG_TYPE_REQUIRED_CONTENT[msg_type]
    missing = sorted(required - set(content))
    if missing:
        raise SubstrateError(
            PCS_MESSAGE_TYPE_UNKNOWN,
            f"msg-type {msg_type!r} content missing required keys: {missing}",
            msg_type=msg_type,
            missing=missing,
        )


def _validate_responds_to(
    layout: StorageLayout,
    msg_type: str,
    content: dict[str, Any],
    sender_slug: str,
) -> None:
    """Per spec §9: a response's responds-to MUST point at a query that
    was authored to this session. We require the sender of the response
    to be a recipient of the original query — otherwise any session
    could hijack a thread.
    """
    if msg_type != "response":
        return
    target_msg_id = content.get("responds-to")
    if (
        not isinstance(target_msg_id, str)
        or not target_msg_id.startswith("session-message:")
    ):
        raise SubstrateError(
            PCS_MESSAGE_RESPONDS_TO_INVALID,
            f"responds-to {target_msg_id!r} is not a session-message slug",
        )
    target_fiber = layout.get_fiber(target_msg_id)
    if target_fiber is None:
        raise SubstrateError(
            PCS_MESSAGE_RESPONDS_TO_INVALID,
            f"responds-to {target_msg_id!r} not found",
        )
    msg_type_o: str | None = None
    target_recipients: set[str] = set()
    for c in target_fiber.get("cells", []):
        if c.get("p") == "msg-type" and c.get("v") == "True":
            msg_type_o = c.get("o")
        elif c.get("p") == "to-session" and c.get("v") == "True":
            target_recipients.add(c.get("o"))
    if msg_type_o != "query":
        raise SubstrateError(
            PCS_MESSAGE_RESPONDS_TO_INVALID,
            f"responds-to {target_msg_id!r} is not a query (msg-type={msg_type_o!r})",
        )
    if sender_slug not in target_recipients:
        # Attribution gate: only the original query's recipient may
        # author the response. Closes the thread-hijack vector.
        raise SubstrateError(
            PCS_MESSAGE_RESPONDS_TO_INVALID,
            f"sender {sender_slug!r} is not a recipient of "
            f"the original query {target_msg_id!r}",
            sender=sender_slug,
            target=target_msg_id,
            target_recipients=sorted(target_recipients),
        )


# ---------------------------------------------------------------------------
# send_message
# ---------------------------------------------------------------------------


def send_message(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    from_session: str,
    to_session: str | list[str],
    msg_type: str,
    content: dict[str, Any],
) -> SessionMessage:
    """Author and persist a session-message.

    Validates msg-type + capability + recipients, writes the
    content-cell snapshot, writes the envelope snapshot, persists a
    fiber for the message entity, and appends a ``session-message``
    event to the log.
    """
    sender = require_open(get_session(layout, from_session))
    _capability_check(sender, msg_type)
    _validate_msg_type(msg_type, content)

    recipients_list = (
        [to_session] if isinstance(to_session, str) else list(to_session)
    )
    recipients = _validate_recipients(layout, recipients_list)
    _validate_responds_to(layout, msg_type, content, sender.slug)

    # Predicted next event-ordinal. Cells embed this value in their
    # ``ord`` field (part of their canonical bytes). The event we append
    # below MUST receive the same ordinal — we assert this after append
    # so any concurrent appender (out-of-spec for v0.2's single-process
    # runtime, but worth surfacing) fails loudly rather than silently
    # producing cells whose recorded ord disagrees with the event log.
    next_ord = event_log.height()
    msg_slug = _new_msg_slug()

    # 1. Content-cell snapshot. Each (key,value) pair becomes one
    #    binary cell on the content entity. The content-cell id is the
    #    snapshot's content-id (SHA-256 of canonical bytes).
    content_entity = f"{msg_slug}:content"
    content_cells: list[Cell] = []
    for key in sorted(content.keys()):
        content_cells.append(
            Cell(
                s=content_entity,
                p=str(key),
                o=str(content[key]),
                v=BilatticeValue.TRUE,
                ord=next_ord,
                stratum="asserted",
                sender=sender.slug,
            ).with_id()
        )
    content_snap = FiberSnapshot(
        entity=content_entity,
        predicates={c.p: c.v for c in content_cells},
        cells=content_cells,
        payload={
            "sender": sender.slug,
            "msg_type": msg_type,
            "content": content,
        },
        metadata={"role": "session-message-content"},
    )
    content_id, _ = layout.put_record("cells", _snap_body_for_storage(content_snap))

    # 2. Envelope cells.
    envelope_cells: list[Cell] = []

    def _add(p: str, o: str, v: BilatticeValue) -> None:
        envelope_cells.append(
            Cell(
                s=msg_slug,
                p=p,
                o=o,
                v=v,
                ord=next_ord,
                stratum="asserted",
                sender=sender.slug,
            ).with_id()
        )

    _add("kind", "session-message", BilatticeValue.TRUE)
    _add("from-session", sender.slug, BilatticeValue.TRUE)
    for r in recipients:
        _add("to-session", r.slug, BilatticeValue.TRUE)
    _add("msg-type", msg_type, BilatticeValue.TRUE)
    _add("content-cell", content_id, BilatticeValue.TRUE)
    for r in recipients:
        _add("read", r.slug, BilatticeValue.FALSE)
    _add("authored-at-ord", str(next_ord), BilatticeValue.TRUE)

    envelope_snap = FiberSnapshot(
        entity=msg_slug,
        predicates={c.p: c.v for c in envelope_cells},
        cells=envelope_cells,
        payload={
            "sender": sender.slug,
            "msg_type": msg_type,
            "to_sessions": [r.slug for r in recipients],
        },
        metadata={
            "role": "session-message-envelope",
            "content_cell": content_id,
        },
    )
    snap_id, _ = layout.put_record("cells", _snap_body_for_storage(envelope_snap))

    # 3. Persist a per-message fiber so list_unread / mark_read can
    #    locate envelope cells without re-scanning every snapshot.
    fiber_body = {
        "entity": msg_slug,
        "predicates": {p: v.value for p, v in envelope_snap.predicates.items()},
        "cells": [_cell_body_for_fiber(c) for c in envelope_cells],
        "latest_cell_id": snap_id,
        "history_event_ord": next_ord,
        "cells_by_predicate": {c.p: c.id for c in envelope_cells},
        "metadata": {
            "role": "session-message-envelope",
            "content_cell": content_id,
            "from_session": sender.slug,
            "msg_type": msg_type,
        },
    }
    layout.put_fiber(msg_slug, fiber_body)

    # 4. Append the event.
    event = event_log.append(
        kind="session-message",
        body={
            "msg_slug": msg_slug,
            "from_session": sender.slug,
            "to_sessions": [r.slug for r in recipients],
            "msg_type": msg_type,
            "content_cell_id": content_id,
            "snapshot_id": snap_id,
        },
        node_id=node_id,
        wall_clock_ns=time.time_ns(),
    )
    if event["ord"] != next_ord:
        # The cells embed ``next_ord`` in their canonical bytes; if the
        # actual event ord drifted, replay would reproduce different
        # cell ids than the live store. Fail loud — pypredcomp v0.2 is
        # single-writer by design and this is unreachable in spec'd use.
        raise SubstrateError(
            PCS_RECORD_CORRUPT,
            f"authored-at-ord drift: predicted={next_ord} actual={event['ord']}; "
            "concurrent event-log append violates the v0.2 single-writer "
            "invariant",
            predicted=next_ord, actual=event["ord"],
        )

    return SessionMessage(
        slug=msg_slug,
        from_session=sender.slug,
        to_sessions=[r.slug for r in recipients],
        msg_type=msg_type,
        content_cell_id=content_id,
        authored_at_ord=next_ord,
        snapshot_id=snap_id,
        event_id=event["id"],
    )


# ---------------------------------------------------------------------------
# mark_read
# ---------------------------------------------------------------------------


def mark_read(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    msg_slug: str,
    reader_session: str,
) -> dict[str, Any]:
    """Append ``(msg, read, reader, True)`` and update the message fiber.

    Authorization model (v0.2):

    * The reader session MUST be open.
    * The reader MUST hold any ``signal:session-message:*`` capability
      (participation gate — closes information leak from
      unprivileged sessions).
    * The reader MUST be in the message's ``to-session`` recipient
      set (substrate-level invariant).
    * The HTTP boundary binds ``reader_session`` to the bearer
      token, so a third party cannot pass another session's slug.
    """
    fiber = layout.get_fiber(msg_slug)
    if fiber is None:
        raise SubstrateError(
            PCS_RECORD_NOT_FOUND,
            f"no session-message {msg_slug!r}",
            msg_slug=msg_slug,
        )
    reader = require_open(get_session(layout, reader_session))
    _require_participation(reader, "mark a session-message read")

    recipients = {
        c.get("o")
        for c in fiber.get("cells", [])
        if c.get("p") == "to-session" and c.get("v") == "True"
    }
    if reader.slug not in recipients:
        raise SubstrateError(
            PCS_MESSAGE_RECIPIENT_INVALID,
            f"session {reader.slug!r} is not a recipient of {msg_slug!r}",
            msg_slug=msg_slug,
            reader=reader.slug,
        )

    baseline_latest_cell_id = fiber.get("latest_cell_id")
    next_ord = event_log.height()
    read_cell = Cell(
        s=msg_slug,
        p="read",
        o=reader.slug,
        v=BilatticeValue.TRUE,
        ord=next_ord,
        stratum="asserted",
        sender=reader.slug,
    ).with_id()

    parents = (
        [fiber["latest_cell_id"]]
        if fiber.get("latest_cell_id")
        else []
    )
    snap = FiberSnapshot(
        entity=msg_slug,
        predicates={"read": BilatticeValue.TRUE},
        cells=[read_cell],
        parents=parents,
        metadata={
            "role": "session-message-read-flip",
            "reader": reader.slug,
        },
    )
    snap_id, _ = layout.put_record("cells", _snap_body_for_storage(snap))

    cells = list(fiber.get("cells", []))
    cells.append(_cell_body_for_fiber(read_cell))
    cbp = dict(fiber.get("cells_by_predicate") or {})
    # Per-recipient key so multiple recipients' read cells coexist.
    cbp[f"read:{reader.slug}"] = read_cell.id
    new_fiber = {
        **fiber,
        "cells": cells,
        "cells_by_predicate": cbp,
        "latest_cell_id": snap_id,
        "history_event_ord": next_ord,
    }
    _cas_put_fiber(
        layout, msg_slug,
        expected_latest_cell_id=baseline_latest_cell_id,
        new_body=new_fiber,
    )

    event = event_log.append(
        kind="session-message-read",
        body={
            "msg_slug": msg_slug,
            "reader": reader.slug,
            "read_cell_id": read_cell.id,
            "snapshot_id": snap_id,
        },
        node_id=node_id,
        wall_clock_ns=time.time_ns(),
    )
    if event["ord"] != next_ord:
        raise SubstrateError(
            PCS_RECORD_CORRUPT,
            f"mark_read ord drift: predicted={next_ord} actual={event['ord']}; "
            "concurrent event-log append violates the v0.2 single-writer "
            "invariant",
            predicted=next_ord, actual=event["ord"],
        )
    return {
        "msg_slug": msg_slug,
        "reader": reader.slug,
        "read_cell_id": read_cell.id,
        "event_id": event["id"],
        "event_ord": event["ord"],
    }


# ---------------------------------------------------------------------------
# list_unread
# ---------------------------------------------------------------------------


def list_unread(
    layout: StorageLayout,
    recipient_session: str,
    *,
    msg_types: list[str] | None = None,
    require_capability: bool = True,
) -> list[dict[str, Any]]:
    """Return envelopes addressed to ``recipient_session`` not yet read.

    The recipient session MUST hold any ``signal:session-message:*``
    capability (participation gate). Set ``require_capability=False``
    only for system-internal callers that have already authenticated
    the recipient via another means.
    """
    if require_capability:
        recipient = require_open(get_session(layout, recipient_session))
        _require_participation(recipient, "read its inbox")
    addressed = stdlib.project(
        layout,
        stdlib.CellPattern(p="to-session", o=recipient_session, v="True"),
    )
    type_filter = set(msg_types) if msg_types else None
    out: list[dict[str, Any]] = []
    for atom in addressed:
        msg_slug = atom.s
        # Skip if a (msg, read, recipient, True) cell exists.
        if stdlib.project(
            layout,
            stdlib.CellPattern(
                s=msg_slug, p="read", o=recipient_session, v="True",
            ),
        ):
            continue
        fiber = layout.get_fiber(msg_slug)
        if fiber is None:
            continue
        mtype: str | None = None
        content_cell: str | None = None
        from_sess: str | None = None
        authored_at: int | None = None
        for c in fiber.get("cells", []):
            p = c.get("p")
            if p == "msg-type" and c.get("v") == "True":
                mtype = c.get("o")
            elif p == "content-cell" and c.get("v") == "True":
                content_cell = c.get("o")
            elif p == "from-session" and c.get("v") == "True":
                from_sess = c.get("o")
            elif p == "authored-at-ord" and c.get("v") == "True":
                try:
                    authored_at = int(c.get("o", "0"))
                except (TypeError, ValueError):
                    authored_at = None
        if type_filter is not None and mtype not in type_filter:
            continue
        out.append({
            "msg_slug": msg_slug,
            "from_session": from_sess,
            "msg_type": mtype,
            "content_cell": content_cell,
            "authored_at_ord": authored_at,
        })
    out.sort(key=lambda r: (r.get("authored_at_ord") or 0, r["msg_slug"]))
    return out


# ---------------------------------------------------------------------------
# surface_unread_messages — one tick of the spec's §4 closure rule.
# ---------------------------------------------------------------------------


def surface_unread_messages(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
) -> list[dict[str, Any]]:
    """Apply the surface-unread-session-messages rule once.

    For every ``(msg, to-session, recipient, True)`` whose
    ``(msg, read, recipient, True)`` cell is absent and whose recipient
    session is open, write an asserted
    ``(recipient, has-unread-message, msg, True)`` cell into the
    recipient's fiber. Idempotent: re-running with no new state writes
    no cells and no events.
    """
    surfaced: list[dict[str, Any]] = []
    addressed = stdlib.project(
        layout, stdlib.CellPattern(p="to-session", v="True"),
    )

    per_recipient: dict[str, list[str]] = {}
    for atom in addressed:
        recipient = atom.o
        msg_slug = atom.s
        if stdlib.project(
            layout,
            stdlib.CellPattern(
                s=msg_slug, p="read", o=recipient, v="True",
            ),
        ):
            continue
        try:
            sess = get_session(layout, recipient)
        except SubstrateError:
            continue
        if sess.state != "open":
            continue
        if stdlib.project(
            layout,
            stdlib.CellPattern(
                s=recipient, p="has-unread-message",
                o=msg_slug, v="True",
            ),
        ):
            continue
        per_recipient.setdefault(recipient, []).append(msg_slug)

    for recipient in sorted(per_recipient):
        msgs = sorted(set(per_recipient[recipient]))
        next_ord = event_log.height()
        new_cells = [
            Cell(
                s=recipient,
                p="has-unread-message",
                o=msg_slug,
                v=BilatticeValue.TRUE,
                ord=next_ord,
                stratum="asserted",
                sender="system",
            ).with_id()
            for msg_slug in msgs
        ]
        snap = FiberSnapshot(
            entity=recipient,
            predicates={"has-unread-message": BilatticeValue.TRUE},
            cells=new_cells,
            metadata={
                "role": "session-message-surfacing",
                "msg_count": len(new_cells),
            },
        )
        snap_id, _ = layout.put_record("cells", _snap_body_for_storage(snap))

        rfiber_existing = layout.get_fiber(recipient)
        baseline_latest = (rfiber_existing or {}).get("latest_cell_id")
        rfiber = rfiber_existing or {
            "entity": recipient,
            "predicates": {},
            "cells": [],
            "cells_by_predicate": {},
            "parents": [],
        }
        existing_cells = list(rfiber.get("cells", []))
        for c in new_cells:
            existing_cells.append(_cell_body_for_fiber(c))
        rfiber["cells"] = existing_cells
        rfiber["latest_cell_id"] = snap_id
        rfiber["history_event_ord"] = next_ord
        preds = dict(rfiber.get("predicates") or {})
        preds["has-unread-message"] = BilatticeValue.TRUE.value
        rfiber["predicates"] = preds
        cbp = dict(rfiber.get("cells_by_predicate") or {})
        cbp["has-unread-message"] = new_cells[-1].id
        rfiber["cells_by_predicate"] = cbp
        _cas_put_fiber(
            layout, recipient,
            expected_latest_cell_id=baseline_latest,
            new_body=rfiber,
        )

        event = event_log.append(
            kind="session-message-surfaced",
            body={
                "recipient": recipient,
                "msg_slugs": [c.o for c in new_cells],
                "snapshot_id": snap_id,
            },
            node_id=node_id,
            wall_clock_ns=time.time_ns(),
        )
        if event["ord"] != next_ord:
            raise SubstrateError(
                PCS_RECORD_CORRUPT,
                f"surface ord drift: predicted={next_ord} "
                f"actual={event['ord']}; concurrent event-log append "
                "violates the v0.2 single-writer invariant",
                predicted=next_ord, actual=event["ord"],
            )
        surfaced.append({
            "recipient": recipient,
            "msg_slugs": [c.o for c in new_cells],
            "event_id": event["id"],
            "event_ord": event["ord"],
        })
    return surfaced


__all__ = [
    "CANONICAL_MSG_TYPES",
    "MSG_TYPE_REQUIRED_CONTENT",
    "SessionMessage",
    "send_message",
    "mark_read",
    "list_unread",
    "surface_unread_messages",
]
