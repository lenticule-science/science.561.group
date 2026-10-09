"""Improvement loop — LangGraph state machine over Units.

For a given department, works through open WorkItems in PLANS order.
Each item is executed by calling run_runbook with the item's runbook field,
or by invoking the MCP tool for LLM-backed execution when needed.

Done condition: no open unblocked WorkItems remain for the department.
Suspends by writing a blocked WorkItem to cold store if it cannot finish.
"""
from __future__ import annotations

from typing import TypedDict, Optional

from langgraph.graph import StateGraph, END
from sqlmodel import Session, select

from src.engine.db import get_engine
from src.engine.models.unit import Unit, WorkItemContent
from src.engine.serializer import flush_departments


class ImproveState(TypedDict):
    department: str
    queue: list[int]          # unit ids of open WorkItems, in order
    current: Optional[int]    # unit id being worked
    completed: list[str]      # identifiers of items completed this run
    added: list[str]          # identifiers of items added this run


# ------------------------------------------------------------------
# Nodes
# ------------------------------------------------------------------

def load_queue(state: ImproveState) -> ImproveState:
    """Load open unblocked WorkItems for the department."""
    dept = state["department"]
    with Session(get_engine()) as session:
        units = session.exec(
            select(Unit)
            .where(Unit.kind == "WorkItem")
            .where(Unit.department == dept)
        ).all()
        queue = [
            u.id for u in units
            if WorkItemContent.model_validate_json(u.content).status == "open"
        ]
    return {**state, "queue": queue, "current": queue[0] if queue else None}


def execute_item(state: ImproveState) -> ImproveState:
    """Execute the current WorkItem via its runbook, or mark blocked if no runbook."""
    unit_id = state["current"]
    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        if unit is None:
            return _advance(state)
        item = WorkItemContent.model_validate_json(unit.content)

    # Items with a runbook field can be executed deterministically
    runbook_id = getattr(item, "runbook", None)
    if runbook_id:
        import asyncio
        from src.engine.runbook_executor import run as run_runbook
        asyncio.get_event_loop().run_until_complete(run_runbook(runbook_id, {"department": state["department"]}))
        return _mark_done(state, unit_id, item.identifier)

    # No runbook — this item needs LLM execution; suspend here
    # Caller (MCP tool or operator) must handle LLM-backed items separately
    return _mark_blocked(state, unit_id, "no-runbook: requires LLM execution")


def flush_and_reload(state: ImproveState) -> ImproveState:
    """Flush dirty departments and reload queue."""
    flush_departments({state["department"]})
    return load_queue(state)


# ------------------------------------------------------------------
# Routing
# ------------------------------------------------------------------

def has_work(state: ImproveState) -> str:
    return "execute_item" if state.get("current") else END


# ------------------------------------------------------------------
# Graph
# ------------------------------------------------------------------

_builder = StateGraph(ImproveState)
_builder.add_node("load_queue", load_queue)
_builder.add_node("execute_item", execute_item)
_builder.add_node("flush_and_reload", flush_and_reload)

_builder.set_entry_point("load_queue")
_builder.add_conditional_edges("load_queue", has_work)
_builder.add_edge("execute_item", "flush_and_reload")
_builder.add_conditional_edges("flush_and_reload", has_work)

graph = _builder.compile()


# ------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------

def _advance(state: ImproveState) -> ImproveState:
    remaining = state["queue"][1:]
    return {**state, "queue": remaining, "current": remaining[0] if remaining else None}


def _mark_done(state: ImproveState, unit_id: int, identifier: str) -> ImproveState:
    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        item = WorkItemContent.model_validate_json(unit.content)
        item.status = "done"
        unit.content = item.model_dump_json()
        session.add(unit)
        session.commit()
    completed = list(state.get("completed", [])) + [identifier]
    return {**_advance(state), "completed": completed}


def _mark_blocked(state: ImproveState, unit_id: int, reason: str) -> ImproveState:
    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        item = WorkItemContent.model_validate_json(unit.content)
        item.status = "blocked"
        item.why_blocked = reason
        unit.content = item.model_dump_json()
        session.add(unit)
        session.commit()
    return _advance(state)
