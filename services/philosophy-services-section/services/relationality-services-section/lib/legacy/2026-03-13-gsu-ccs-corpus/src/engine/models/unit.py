"""Unified Unit store: one SQLModel table for all knowledge in the repository.

The Unit table is the hot store. Markdown files are the cold store.
kind determines which content model applies; content is a JSON blob
validated by the corresponding Pydantic model.

Kinds matching department context files:
  Message      -- INBOX.md entries
  WorkItem     -- PLANS.md entries (spec/root/src format)
  Workflow     -- PLANS.md workflow headers (math/proof format)
  WorkUnit     -- PLANS.md checklist items within a Workflow
  RawSection   -- PLANS.md non-workflow prose sections
  Idea         -- IDEAS.md entries
  MemoryEntry  -- MEMORY.md entries
  Principle    -- SOUL.md entries
  Project      -- project metadata (spec/project.md)
  Runbook      -- YAML-structured executable workflow (spec/runbook.md)

Future kinds loaded from the broader library:
  MathUnit, Skill, ProofFile, ... (gigabytes of domain content)
"""
from __future__ import annotations

from typing import Optional
from pydantic import BaseModel
from sqlmodel import SQLModel, Field


# ------------------------------------------------------------------
# Persisted model
# ------------------------------------------------------------------

class Unit(SQLModel, table=True):
    __tablename__ = "units"

    id: Optional[int] = Field(default=None, primary_key=True)
    kind: str = Field(index=True)        # see kinds above
    department: str = Field(index=True)  # math | proof | spec | src | root
    content: str = Field(default="{}")   # JSON; parse with content_model(kind)
    history_t: str = Field(default="")   # history step when added (future use)
    settled: bool = Field(default=False) # True when in H*_t: fixed by both nuclei

    @classmethod
    def make(
        cls,
        kind: str,
        department: str,
        content: BaseModel,
        history_t: str = "",
        settled: bool = False,
    ) -> "Unit":
        return cls(
            kind=kind,
            department=department,
            content=content.model_dump_json(),
            history_t=history_t,
            settled=settled,
        )

    def parse(self) -> BaseModel:
        return content_model(self.kind).model_validate_json(self.content)


# ------------------------------------------------------------------
# Content models (Pydantic only -- never persisted directly)
# ------------------------------------------------------------------

class MessageContent(BaseModel):
    from_department: str
    date: str
    msg_type: str                    # FixNeeded | GapFound | Discovery
    urgency: str = "Normal"          # Blocking | Normal | Low
    subject: str
    status: str = "unread"           # unread | acknowledged | deferred | declined
    body: str = ""


class WorkItemContent(BaseModel):
    identifier: str                  # kebab-case heading slug
    added: str = ""                  # YYYY-MM-DD
    status: str = "open"             # open | deferred | blocked
    action: str = ""
    why: str = ""
    why_blocked: str = ""


class WorkflowContent(BaseModel):
    name: str
    produces: str = ""
    complete_when: str = ""
    status: str = "open"


class WorkUnitContent(BaseModel):
    workflow_name: str
    text: str
    done: bool = False
    sort_order: int = 0


class RawSectionContent(BaseModel):
    heading: str
    body: str
    sort_order: int = 0
    malformed: bool = False  # True when content could not be parsed into its expected kind


class IdeaContent(BaseModel):
    text: str
    done: bool = False
    output_file: Optional[str] = None


class MemoryEntryContent(BaseModel):
    date: str
    topic: str
    body: str = ""


class PrincipleContent(BaseModel):
    name: str
    body: str = ""


class ProjectContent(BaseModel):
    name: str
    goal: str                        # one sentence: what success looks like
    description: str = ""            # prose orientation for agents
    added: str = ""                  # YYYY-MM-DD
    plan_ids: list[str] = []         # ids of Plans (PLANS.md files) in this project
    default_plan_ids: list[str] = [] # subset of plan_ids designated as DefaultPlan


# ------------------------------------------------------------------
# Registry
# ------------------------------------------------------------------


class ContentFileUnit(BaseModel):
    """Generic content unit loaded from a markdown file with YAML frontmatter."""
    id: str = ""                     # frontmatter id
    description: str = ""            # frontmatter description
    body: str = ""                   # full file content (frontmatter stripped)
    source_path: str = ""            # relative path from repo root


class RunbookContent(BaseModel):
    skill_closure_kind: str          # process | procedure | derivation | inquiry
    inputs: list[dict] = []          # [{name, type}]
    outputs: list[dict] = []         # [{name, type}]
    steps: list[dict] = []           # step definitions (see spec/runbook.md)
    source_yaml: str = ""            # raw YAML source for round-trip fidelity


_CONTENT_MODELS: dict[str, type[BaseModel]] = {
    "MathUnit":   ContentFileUnit,
    "SpecUnit":   ContentFileUnit,
    "Skill":      ContentFileUnit,
    "Message":     MessageContent,
    "WorkItem":    WorkItemContent,
    "Workflow":    WorkflowContent,
    "WorkUnit":    WorkUnitContent,
    "RawSection":  RawSectionContent,
    "Idea":        IdeaContent,
    "MemoryEntry": MemoryEntryContent,
    "Principle":   PrincipleContent,
    "Project":     ProjectContent,
    "Runbook":     RunbookContent,
}


def content_model(kind: str) -> type[BaseModel]:
    """Return the content Pydantic model class for the given kind.
    Falls back to a generic dict-wrapping model for unknown future kinds."""
    return _CONTENT_MODELS.get(kind, BaseModel)


def units_of_kind(units: list[Unit], kind: str) -> list[Unit]:
    return [u for u in units if u.kind == kind]
