"""Session — the OS's process abstraction.

Per ``specs/process/session-as-process.md`` (v0.2): a session is a
substrate-resident execution context with a stable id, an owner, an
optional parent (for ``fork``), and a lifecycle (open → draining →
closed). Each session opens with a single audit assertion
``(session:<id>, opened, True)`` carrying the owner as ``sender``.

The ``$ROOT/sessions/<slug>.json`` file caches lifecycle state for
fast lookup. The cells emitted at open/close are the substrate-canonical
record; the cache is rebuilt deterministically from them on demand.

Per ``decisions/identity-is-boundary-projection.md`` the session's
``owner`` is a boundary entity (``user:<slug>``); every cell asserted
through the session carries that owner as the event-body ``sender``.
The session is therefore the *authoring* origin of the owner's
history-fiber projection — the routine in
:mod:`process.history_fiber` walks the event log filtered by
``sender == owner`` to reconstruct it.
"""

from __future__ import annotations

import secrets
import time

from pydantic import BaseModel, ConfigDict, Field

from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCM_SESSION_CLOSED,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)
from substrate.stdlib import assert_cell


class Session(BaseModel):
    model_config = ConfigDict(extra="forbid")

    slug: str = Field(description="session:<8-hex>; the OS's pid")
    owner: str = Field(description="user:<name> the session is attributed to")
    parent: str | None = None
    state: str = "open"  # opening|open|draining|closed
    opened_at_ord: int
    opened_at_ns: int
    closed_at_ord: int | None = None
    capabilities: list[str] = Field(default_factory=list)


def _sessions_dir(layout: StorageLayout):
    return layout.root / "sessions"


def _session_path(layout: StorageLayout, slug: str):
    safe = slug.replace(":", "_").replace("/", "_")
    return _sessions_dir(layout) / f"{safe}.json"


def _new_slug() -> str:
    return f"session:{secrets.token_hex(8)}"


def open_session(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    owner: str,
    capabilities: list[str] | None = None,
    parent: str | None = None,
) -> Session:
    """Open a new session attributed to ``owner``.

    Emits one ``(session:<slug>, opened, True)`` cell with sender=owner
    so the event log carries the proof-of-open.
    """
    slug = _new_slug()
    sess = Session(
        slug=slug,
        owner=owner,
        parent=parent,
        state="open",
        opened_at_ord=event_log.height(),
        opened_at_ns=time.time_ns(),
        capabilities=list(capabilities or []),
    )
    assert_cell(
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        s=slug,
        p="opened",
        v=BilatticeValue.TRUE,
        sender=owner,
    )
    _sessions_dir(layout).mkdir(parents=True, exist_ok=True)
    _session_path(layout, slug).write_text(sess.model_dump_json())
    return sess


def get_session(layout: StorageLayout, slug: str) -> Session:
    p = _session_path(layout, slug)
    if not p.exists():
        raise SubstrateError(
            PCS_RECORD_NOT_FOUND,
            f"no session {slug!r}",
            slug=slug,
        )
    return Session.model_validate_json(p.read_text())


def close_session(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    slug: str,
) -> Session:
    sess = get_session(layout, slug)
    if sess.state == "closed":
        return sess
    assert_cell(
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        s=slug,
        p="closed",
        v=BilatticeValue.TRUE,
        sender=sess.owner,
    )
    closed = sess.model_copy(update={
        "state": "closed",
        "closed_at_ord": event_log.height(),
    })
    _session_path(layout, slug).write_text(closed.model_dump_json())
    return closed


def fork_session(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    parent_slug: str,
) -> Session:
    """Open a child session inheriting the parent's owner + capabilities."""
    parent = get_session(layout, parent_slug)
    if parent.state != "open":
        raise SubstrateError(
            PCM_SESSION_CLOSED,
            f"cannot fork from {parent.state} session {parent_slug!r}",
            slug=parent_slug,
            state=parent.state,
        )
    return open_session(
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        owner=parent.owner,
        capabilities=list(parent.capabilities),
        parent=parent_slug,
    )


def list_sessions(layout: StorageLayout, *, owner: str | None = None) -> list[Session]:
    d = _sessions_dir(layout)
    if not d.exists():
        return []
    out: list[Session] = []
    for f in sorted(d.iterdir()):
        if f.suffix != ".json":
            continue
        try:
            s = Session.model_validate_json(f.read_text())
        except Exception:
            continue
        if owner is None or s.owner == owner:
            out.append(s)
    return out


def require_open(sess: Session) -> Session:
    if sess.state != "open":
        raise SubstrateError(
            PCM_SESSION_CLOSED,
            f"session {sess.slug!r} is {sess.state!r}, not open",
            slug=sess.slug,
            state=sess.state,
        )
    return sess
