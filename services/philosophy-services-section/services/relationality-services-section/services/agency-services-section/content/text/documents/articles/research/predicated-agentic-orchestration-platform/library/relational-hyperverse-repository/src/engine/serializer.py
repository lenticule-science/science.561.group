"""Flush Unit records for one or more departments back to markdown files.

Called after a DB commit whenever department state changes.
SOUL and IDEAS are not flushed here -- agents append to those directly.
"""
from __future__ import annotations

import os
from pathlib import Path

from sqlmodel import Session, select

from src.engine.db import get_engine
from src.engine.models.unit import (
    Unit,
    IdeaContent,
    MemoryEntryContent,
    MessageContent,
    PrincipleContent,
    RawSectionContent,
    WorkflowContent,
    WorkItemContent,
    WorkUnitContent,
)

REPO_DIR = Path(__file__).parent.parent.parent


def dept_path(dept: str, filename: str) -> Path:
    if dept == "root":
        return REPO_DIR / filename
    return REPO_DIR / dept / filename


def atomic_write(path: Path, content: str) -> None:
    tmp = path.with_suffix(".tmp")
    tmp.write_text(content, encoding="utf-8")
    os.replace(tmp, path)


def flush_departments(departments: set[str]) -> None:
    with Session(get_engine()) as session:
        for dept in departments:
            _flush_inbox(dept, session)
            _flush_plans(dept, session)
            _flush_memory(dept, session)


# ------------------------------------------------------------------
# INBOX.md
# ------------------------------------------------------------------

def _flush_inbox(dept: str, session: Session) -> None:
    path = dept_path(dept, "INBOX.md")
    if not path.exists():
        return

    units = list(session.exec(
        select(Unit)
        .where(Unit.kind == "Message")
        .where(Unit.department == dept)
        .order_by(Unit.id)
    ).all())

    label = "root / orchestrator level" if dept == "root" else f"{dept}/ department"
    parts = [
        "# INBOX.md\n",
        f"Incoming Messages to the {label}. Each entry is a "
        "[Message](spec/message.md).\n"
        "Written by `skills/deposit-message-in-agent-inbox.md`. Triage every\n"
        "Message before reading PLANS.md. Status must be set on every Message before\n"
        "work begins.\n",
    ]

    for unit in units:
        msg = unit.parse()
        parts.append("### Message")
        parts.append(f"- from: {msg.from_department}")
        parts.append(f"- date: {msg.date}")
        parts.append(f"- type: {msg.msg_type}")
        parts.append(f"- urgency: {msg.urgency}")
        parts.append(f"- subject: {msg.subject}")
        parts.append(f"- status: {msg.status}")
        if msg.body:
            parts.append(f"\n{msg.body}")
        parts.append("")

    atomic_write(path, "\n".join(parts) + "\n")


# ------------------------------------------------------------------
# PLANS.md
# ------------------------------------------------------------------

def _flush_plans(dept: str, session: Session) -> None:
    path = dept_path(dept, "PLANS.md")
    if not path.exists():
        return

    workflows = list(session.exec(
        select(Unit)
        .where(Unit.kind == "Workflow")
        .where(Unit.department == dept)
        .order_by(Unit.id)
    ).all())

    work_items = list(session.exec(
        select(Unit)
        .where(Unit.kind == "WorkItem")
        .where(Unit.department == dept)
        .order_by(Unit.id)
    ).all())

    raw_sections = list(session.exec(
        select(Unit)
        .where(Unit.kind == "RawSection")
        .where(Unit.department == dept)
        .order_by(Unit.id)
    ).all())

    header = f"# {dept}/PLANS.md" if dept != "root" else "# PLANS.md"
    parts = [f"{header}\n"]

    if workflows:
        parts.append("## Workflows\n")
        for wf_unit in workflows:
            wf = wf_unit.parse()
            parts.append(f"### {wf.name}")
            parts.append(f"**Produces:** {wf.produces}")
            parts.append(f"**Complete when:** {wf.complete_when}")
            parts.append(f"**Status:** {wf.status}\n")

            work_units = list(session.exec(
                select(Unit)
                .where(Unit.kind == "WorkUnit")
                .where(Unit.department == dept)
            ).all())
            wf_units = [
                u for u in work_units
                if WorkUnitContent.model_validate_json(u.content).workflow_name == wf.name
            ]
            wf_units.sort(
                key=lambda u: WorkUnitContent.model_validate_json(u.content).sort_order
            )

            if wf_units:
                parts.append("WorkUnits:")
                for wu_unit in wf_units:
                    wu = wu_unit.parse()
                    check = "x" if wu.done else " "
                    parts.append(f"- [{check}] {wu.text}")
            parts.append("")
            parts.append("---\n")

    if work_items:
        # Group into Open / Deferred
        open_items     = [u for u in work_items
                          if WorkItemContent.model_validate_json(u.content).status
                          in ("open", "blocked")]
        deferred_items = [u for u in work_items
                          if WorkItemContent.model_validate_json(u.content).status
                          == "deferred"]

        if open_items:
            parts.append("## Open\n")
            for unit in open_items:
                wi = unit.parse()
                parts.append(f"### {wi.identifier}\n")
                if wi.added:
                    parts.append(f"**Added:** {wi.added}")
                parts.append(f"**Status:** {wi.status}")
                if wi.why_blocked:
                    parts.append(f"**Why blocked:** {wi.why_blocked}")
                if wi.action:
                    parts.append(f"**Action:** {wi.action}")
                if wi.why:
                    parts.append(f"**Why:** {wi.why}")
                parts.append("")

        if deferred_items:
            parts.append("## Deferred\n")
            for unit in deferred_items:
                wi = unit.parse()
                parts.append(f"### {wi.identifier}\n")
                if wi.added:
                    parts.append(f"**Added:** {wi.added}")
                parts.append(f"**Status:** {wi.status}")
                if wi.why_blocked:
                    parts.append(f"**Why blocked:** {wi.why_blocked}")
                if wi.action:
                    parts.append(f"**Action:** {wi.action}")
                if wi.why:
                    parts.append(f"**Why:** {wi.why}")
                parts.append("")

    for raw_unit in raw_sections:
        raw = raw_unit.parse()
        parts.append(raw.body)
        parts.append("")

    atomic_write(path, "\n".join(parts) + "\n")


# ------------------------------------------------------------------
# MEMORY.md
# ------------------------------------------------------------------

def _flush_memory(dept: str, session: Session) -> None:
    path = dept_path(dept, "MEMORY.md")
    if not path.exists():
        return

    units = list(session.exec(
        select(Unit)
        .where(Unit.kind == "MemoryEntry")
        .where(Unit.department == dept)
        .order_by(Unit.id)
    ).all())

    label = "root / orchestrator level" if dept == "root" else f"{dept}/ department"
    parts = [
        "# MEMORY.md\n",
        f"Accumulated cross-session knowledge for the {label}. Each\n"
        "entry is a MemoryEntry. Append-only.\n",
        "---\n",
    ]

    for unit in units:
        entry = unit.parse()
        parts.append(f"## {entry.date} -- {entry.topic}\n")
        parts.append(entry.body)
        parts.append("")

    atomic_write(path, "\n".join(parts) + "\n")
