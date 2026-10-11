"""repo-engine MCP server.

The external interface for the repository engine. Exposes orchestration,
query, and write tools via the Model Context Protocol.

Run:
    python3 src/engine/mcp_server.py

Or via Claude Code after running src/claude/install-mcp.sh.

Two categories of tools:
  Orchestration -- invoke LangGraph graphs / PydanticAI agents
  Query/Write   -- direct Unit table access (read or single-record writes)
"""
from __future__ import annotations

import json
from datetime import date
from typing import Optional

from fastmcp import FastMCP
from sqlmodel import Session, select

from src.engine.db import get_engine
from src.engine.loader import load_all
from src.engine.models.unit import (
    Unit,
    MemoryEntryContent,
    MessageContent,
    PrincipleContent,
    WorkItemContent,
    WorkUnitContent,
)
from src.engine.serializer import flush_departments

# ------------------------------------------------------------------
# Server
# ------------------------------------------------------------------

mcp = FastMCP(
    "repo-engine",
    instructions=(
        "Engine for the Relational Hyperverse repository. "
        "Use run_runbook to execute workflows (deterministic or LLM-backed). "
        "Use get_inbox / get_plans / get_memory for department state queries."
    ),
)

# Load DB from markdown on startup
load_all()


# ------------------------------------------------------------------
# Orchestration tools
# ------------------------------------------------------------------

@mcp.tool()
async def run_runbook(runbook_id: str, inputs: dict) -> dict:
    """Execute a runbook by id with the given inputs. Returns the runbook's outputs.
    Process-type runbooks are fully deterministic (no LLM calls).
    Examples: run_runbook('route-units', {'units': [...]})"""
    from src.engine.runbook_executor import run
    return await run(runbook_id, inputs)


@mcp.tool()
async def run_triage() -> dict:
    """Process all unread INBOX messages across all departments.
    Promotes FixNeeded to PLANS, defers GapFound/Discovery to IDEAS. No LLM."""
    from src.engine.graphs.triage import graph
    result = await graph.ainvoke({"pending": [], "dirty": set(), "processed": 0})
    return {"processed": result["processed"]}


@mcp.tool()
async def run_improve(department: str) -> dict:
    """Work through open WorkItems for a department. Executes runbook-backed items
    deterministically; suspends on items that need LLM execution.
    department: math | proof | spec | src | root"""
    from src.engine.graphs.improve import graph
    result = await graph.ainvoke({
        "department": department,
        "queue": [],
        "current": None,
        "completed": [],
        "added": [],
    })
    return {"completed": result["completed"], "added": result["added"]}


@mcp.tool()
async def build_math() -> dict:
    """Run the math corpus build. Returns ok/error + message."""
    from src.engine.agents.build_math import run
    result = await run()
    return result.model_dump()


@mcp.tool()
async def reload_db() -> dict:
    """Reload DB from current markdown files. Use after manual file edits."""
    load_all()
    return {"status": "ok", "message": "DB reloaded from markdown"}


# ------------------------------------------------------------------
# Query tools
# ------------------------------------------------------------------

@mcp.tool()
def get_inbox(department: str) -> list[dict]:
    """Return all messages in a department's INBOX.
    department: math | proof | spec | src | root"""
    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == "Message")
            .where(Unit.department == department)
            .order_by(Unit.id)
        ).all())
    return [
        {**json.loads(u.content), "id": u.id}
        for u in units
    ]


@mcp.tool()
def get_plans(department: str, open_only: bool = True) -> list[dict]:
    """Return work units for a department.
    department: math | proof | spec | src | root
    open_only: if True (default), return only incomplete WorkUnits"""
    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == "WorkUnit")
            .where(Unit.department == department)
        ).all())
    if open_only:
        units = [u for u in units
                 if not WorkUnitContent.model_validate_json(u.content).done]
    units.sort(key=lambda u: WorkUnitContent.model_validate_json(u.content).sort_order)
    return [{"id": u.id, **json.loads(u.content)} for u in units]


@mcp.tool()
def get_work_items(department: str, open_only: bool = True) -> list[dict]:
    """Return WorkItems (PLANS entries in spec/root/src format) for a department."""
    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == "WorkItem")
            .where(Unit.department == department)
            .order_by(Unit.id)
        ).all())
    if open_only:
        units = [u for u in units
                 if WorkItemContent.model_validate_json(u.content).status != "deferred"]
    return [{"id": u.id, **json.loads(u.content)} for u in units]


@mcp.tool()
def get_memory(department: str) -> list[dict]:
    """Return memory entries for a department.
    department: math | proof | spec | src | root"""
    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == "MemoryEntry")
            .where(Unit.department == department)
            .order_by(Unit.id)
        ).all())
    return [{"id": u.id, **json.loads(u.content)} for u in units]


@mcp.tool()
def get_principles(department: str) -> list[dict]:
    """Return principles (SOUL entries) for a department."""
    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == "Principle")
            .where(Unit.department == department)
        ).all())
    return [{"id": u.id, **json.loads(u.content)} for u in units]


@mcp.tool()
def search(query: str, kind: Optional[str] = None, department: Optional[str] = None, limit: int = 20) -> list[dict]:
    """Full-text search across all Units in the knowledge graph.
    Searches id, description, and body content.
    kind: MathUnit | SpecUnit | Skill | Runbook | Message | WorkItem | Principle | ...
    department: math | proof | spec | src | root (omit to search all)"""
    with Session(get_engine()) as session:
        stmt = select(Unit)
        if kind:
            stmt = stmt.where(Unit.kind == kind)
        if department:
            stmt = stmt.where(Unit.department == department)
        units = session.exec(stmt).all()

    q = query.lower()
    results = [
        {"id": u.id, "kind": u.kind, "department": u.department, **json.loads(u.content)}
        for u in units
        if q in u.content.lower()
    ]
    return results[:limit]


@mcp.tool()
def get_units(department: str, kind: str) -> list[dict]:
    """Return all units of any kind for a department.
    Useful for future kinds (MathUnit, Skill, etc.) beyond the built-in types."""
    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == kind)
            .where(Unit.department == department)
            .order_by(Unit.id)
        ).all())
    return [{"id": u.id, "kind": u.kind, "settled": u.settled, **json.loads(u.content)}
            for u in units]


# ------------------------------------------------------------------
# Write tools
# ------------------------------------------------------------------

@mcp.tool()
def add_message(
    department: str,
    from_department: str,
    subject: str,
    body: str,
    msg_type: str = "GapFound",
    urgency: str = "Normal",
) -> dict:
    """Add a message to a department's INBOX and flush to markdown.
    msg_type: FixNeeded | GapFound | Discovery
    urgency: Blocking | Normal | Low"""
    today = date.today().isoformat()
    with Session(get_engine()) as session:
        unit = Unit.make("Message", department, MessageContent(
            from_department=from_department,
            date=today,
            msg_type=msg_type,
            urgency=urgency,
            subject=subject,
            body=body,
        ))
        session.add(unit)
        session.commit()
        session.refresh(unit)
        unit_id = unit.id

    flush_departments({department})
    return {"status": "ok", "unit_id": unit_id}


@mcp.tool()
def add_memory_entry(department: str, topic: str, body: str) -> dict:
    """Append a memory entry to a department's MEMORY.md."""
    today = date.today().isoformat()
    with Session(get_engine()) as session:
        unit = Unit.make("MemoryEntry", department, MemoryEntryContent(
            date=today, topic=topic, body=body
        ))
        session.add(unit)
        session.commit()
        session.refresh(unit)
        unit_id = unit.id

    flush_departments({department})
    return {"status": "ok", "unit_id": unit_id}


@mcp.tool()
def set_message_status(unit_id: int, status: str) -> dict:
    """Update a message's status.
    status: unread | acknowledged | deferred | declined"""
    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        if not unit or unit.kind != "Message":
            return {"status": "error", "message": f"Message unit {unit_id} not found"}
        data = json.loads(unit.content)
        data["status"] = status
        unit.content = json.dumps(data)
        session.add(unit)
        session.commit()
        dept = unit.department

    flush_departments({dept})
    return {"status": "ok"}


@mcp.tool()
def add_work_item(department: str, identifier: str, action: str, why: str = "") -> dict:
    """Add a WorkItem to a department's PLANS.md.
    identifier: slug for the item (e.g. 'fix-loader-bug')
    action: one sentence stating the deliverable
    why: optional motivation"""
    today = date.today().isoformat()
    with Session(get_engine()) as session:
        unit = Unit.make("WorkItem", department, WorkItemContent(
            identifier=identifier,
            added=today,
            status="open",
            action=action,
            why=why,
        ))
        session.add(unit)
        session.commit()
        session.refresh(unit)
        unit_id = unit.id
    flush_departments({department})
    return {"status": "ok", "unit_id": unit_id}


@mcp.tool()
def update_work_item(unit_id: int, status: str, why_blocked: str = "") -> dict:
    """Update a WorkItem's status.
    status: open | done | blocked | deferred"""
    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        if not unit or unit.kind != "WorkItem":
            return {"status": "error", "message": f"WorkItem {unit_id} not found"}
        data = json.loads(unit.content)
        data["status"] = status
        if why_blocked:
            data["why_blocked"] = why_blocked
        unit.content = json.dumps(data)
        session.add(unit)
        session.commit()
        dept = unit.department
    flush_departments({dept})
    return {"status": "ok"}


@mcp.tool()
def write_content_unit(department: str, kind: str, unit_id: str, description: str, body: str, source_path: str) -> dict:
    """Write or overwrite a content unit (MathUnit, SpecUnit, Skill, etc.).
    Writes to the Unit table and flushes to the source_path on disk.
    kind: MathUnit | SpecUnit | Skill | ...
    unit_id: the id field (typically the file stem)
    source_path: relative path from repo root (e.g. 'math/nucleus.md')"""
    from src.engine.models.unit import ContentFileUnit
    from pathlib import Path
    REPO = Path(__file__).parent.parent.parent
    full_path = REPO / source_path

    # Write markdown to disk
    content = f"---\nid: {unit_id}\ndescription: \"{description}\"\n---\n\n{body}"
    full_path.parent.mkdir(parents=True, exist_ok=True)
    full_path.write_text(content, encoding="utf-8")

    # Update Unit table
    with Session(get_engine()) as session:
        # Remove existing unit with same source_path if any
        existing = session.exec(select(Unit).where(Unit.kind == kind).where(Unit.department == department)).all()
        for u in existing:
            c = json.loads(u.content)
            if c.get("source_path") == source_path:
                session.delete(u)
        unit = Unit.make(kind, department, ContentFileUnit(
            id=unit_id, description=description, body=body, source_path=source_path
        ))
        session.add(unit)
        session.commit()
        session.refresh(unit)
        db_id = unit.id

    return {"status": "ok", "unit_id": db_id, "path": source_path}


# ------------------------------------------------------------------
# Entry point
# ------------------------------------------------------------------

if __name__ == "__main__":
    import os
    transport = os.environ.get("MCP_TRANSPORT", "stdio")
    if transport == "sse":
        mcp.run(transport="sse", host="0.0.0.0", port=int(os.environ.get("MCP_PORT", "8765")))
    else:
        mcp.run()
