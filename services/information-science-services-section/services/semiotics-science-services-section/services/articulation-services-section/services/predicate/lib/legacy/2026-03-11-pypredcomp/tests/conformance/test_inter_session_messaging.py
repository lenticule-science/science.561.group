"""Conformance — inter-session messaging round-trip.

Spec: ``operations/command/projects/replit-sprint/specs/process/inter-session-messaging.md`` §11.

Round-trip path: author task-handoff → surface unread → recipient sees
``has-unread-message`` cell → mark read → cell stops appearing.
"""

from __future__ import annotations

from pathlib import Path

from process.session import open_session
from process.session_messaging import (
    list_unread,
    mark_read,
    send_message,
    surface_unread_messages,
)
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate import stdlib


NODE = "node:conformance"


def test_inter_session_round_trip_replays_byte_identical(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id=NODE)

    sender = open_session(
        layout=layout, event_log=log, node_id=NODE,
        owner="user:alice", capabilities=["signal:session-message:*"],
    )
    recipient = open_session(
        layout=layout, event_log=log, node_id=NODE,
        owner="user:bob", capabilities=["signal:session-message:*"],
    )

    # 1. Author.
    msg = send_message(
        layout=layout, event_log=log, node_id=NODE,
        from_session=sender.slug, to_session=recipient.slug,
        msg_type="task-handoff",
        content={"task-id": "task:conformance",
                 "handoff-reason": "round-trip"},
    )

    # 2. Surface — recipient gets a has-unread-message cell.
    surfaced = surface_unread_messages(
        layout=layout, event_log=log, node_id=NODE,
    )
    assert any(s["recipient"] == recipient.slug for s in surfaced)
    has_unread = stdlib.project(
        layout,
        stdlib.CellPattern(
            s=recipient.slug, p="has-unread-message",
            o=msg.slug, v="True",
        ),
    )
    assert len(has_unread) == 1, "surfacing rule must emit the inbox cell"

    # 3. Recipient sees the message.
    unread = list_unread(layout, recipient.slug)
    assert [u["msg_slug"] for u in unread] == [msg.slug]

    # 4. Mark read; the unread query collapses.
    mark_read(
        layout=layout, event_log=log, node_id=NODE,
        msg_slug=msg.slug, reader_session=recipient.slug,
    )
    assert list_unread(layout, recipient.slug) == []

    # Re-running surface is idempotent (no double surfacing once read).
    second = surface_unread_messages(
        layout=layout, event_log=log, node_id=NODE,
    )
    assert second == []

    # 5. Replay — every event byte-identical via hash chain.
    log.verify()
