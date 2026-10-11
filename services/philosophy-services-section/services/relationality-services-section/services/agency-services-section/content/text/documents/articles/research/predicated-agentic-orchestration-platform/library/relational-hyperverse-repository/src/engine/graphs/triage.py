"""Triage loop — LangGraph state machine over Units.

Reads unread Messages from department INBOXes. For each:
  FixNeeded  → promote to PLANS.md as WorkItem, acknowledge
  GapFound | Discovery → defer to IDEAS.md, defer message
  other      → decline

Done condition: no unread Messages remain.
No LLM calls. Fully deterministic.
"""
from __future__ import annotations

from datetime import date
from typing import Annotated, TypedDict

from langgraph.graph import StateGraph, END
from sqlmodel import Session, select

from src.engine.db import get_engine
from src.engine.models.unit import Unit, MessageContent, WorkItemContent, IdeaContent
from src.engine.serializer import flush_departments

DEPARTMENTS = ["math", "proof", "spec", "src", "root"]


class TriageState(TypedDict):
    pending: list[int]       # unit ids of unread Messages still to process
    dirty: set[str]          # departments that need flushing
    processed: int           # count of messages handled this run


# ------------------------------------------------------------------
# Nodes
# ------------------------------------------------------------------

def load_unread(state: TriageState) -> TriageState:
    """Load all unread Message unit ids across all departments."""
    with Session(get_engine()) as session:
        units = session.exec(
            select(Unit)
            .where(Unit.kind == "Message")
        ).all()
        pending = [
            u.id for u in units
            if MessageContent.model_validate_json(u.content).status == "unread"
        ]
    return {**state, "pending": pending}


def process_next(state: TriageState) -> TriageState:
    """Process one unread Message. Promote, defer, or decline."""
    unit_id = state["pending"][0]
    remaining = state["pending"][1:]
    dirty = set(state.get("dirty", set()))
    today = date.today().isoformat()

    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        if unit is None:
            return {**state, "pending": remaining}

        msg = MessageContent.model_validate_json(unit.content)
        dept = unit.department

        if msg.msg_type == "FixNeeded":
            # Promote to PLANS as WorkItem
            work_item = WorkItemContent(
                identifier=_slugify(msg.subject),
                added=today,
                status="open",
                action=msg.subject,
                why=msg.body or msg.subject,
            )
            session.add(Unit.make("WorkItem", dept, work_item))
            msg.status = "acknowledged"

        elif msg.msg_type in ("GapFound", "Discovery"):
            # Defer to IDEAS
            idea = IdeaContent(text=msg.subject + (("\n" + msg.body) if msg.body else ""))
            session.add(Unit.make("Idea", dept, idea))
            msg.status = "deferred"

        else:
            msg.status = "declined"

        unit.content = msg.model_dump_json()
        session.add(unit)
        session.commit()
        dirty.add(dept)

    return {**state, "pending": remaining, "dirty": dirty, "processed": state.get("processed", 0) + 1}


def flush(state: TriageState) -> TriageState:
    """Flush dirty departments to cold store."""
    if state.get("dirty"):
        flush_departments(state["dirty"])
    return {**state, "dirty": set()}


# ------------------------------------------------------------------
# Routing
# ------------------------------------------------------------------

def has_pending(state: TriageState) -> str:
    return "process_next" if state["pending"] else "flush"


# ------------------------------------------------------------------
# Graph
# ------------------------------------------------------------------

_builder = StateGraph(TriageState)
_builder.add_node("load_unread", load_unread)
_builder.add_node("process_next", process_next)
_builder.add_node("flush", flush)

_builder.set_entry_point("load_unread")
_builder.add_conditional_edges("load_unread", has_pending)
_builder.add_conditional_edges("process_next", has_pending)
_builder.add_edge("flush", END)

graph = _builder.compile()


# ------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------

def _slugify(text: str) -> str:
    import re
    return re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")[:60]
