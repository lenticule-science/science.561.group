"""Pydantic-only models: inputs/outputs of skills and agents.

These are never persisted to the DB. They represent data in flight:
the typed contracts between skill steps.
"""
from __future__ import annotations

from typing import Literal, Optional
from pydantic import BaseModel, field_validator

PromptUnitType = Literal["Principle", "Idea", "WorkItem", "Conjecture", "Question", "Gap"]
DepartmentType = Literal["math", "proof", "spec", "src", "root"]


class PromptUnit(BaseModel):
    type: PromptUnitType
    department: DepartmentType
    text: str
    action: Optional[str] = None      # WorkItem
    problem: Optional[str] = None     # Idea
    evidence: Optional[str] = None    # Conjecture
    location: Optional[str] = None    # Gap


class BuildResult(BaseModel):
    status: Literal["ok", "error"]
    message: str


class RoutingDecision(BaseModel):
    unit_index: int                    # position in the input PromptUnit list
    destination: Literal["SOUL", "INBOX"]
    msg_type: Literal["FixNeeded", "GapFound", "Discovery", "Principle"]
    urgency: Literal["Blocking", "Normal", "Low"] = "Normal"


class RoutingLine(BaseModel):
    unit_type: str
    destination: str                   # e.g. "math/INBOX.md" or "math/SOUL.md"


class RoutingReport(BaseModel):
    lines: list[RoutingLine]


class WorkReport(BaseModel):
    items_completed: list[str]
    items_added: list[str]
    inbox_triaged: int
    exit_condition: Literal[
        "loop-complete", "user-interrupted", "skill-error-unrecoverable"
    ]


class SkillError(BaseModel):
    error_class: Literal[
        "MissingInput", "ValidationFailure", "UnexpectedState",
        "SkillNotFound", "Unresolvable",
    ]
    error_message: str
    context: str                       # skill name + input summary
    recovery_hint: Optional[str] = None
