"""PostWorkAgent: classifies findings from a completed work unit and routes them.

System prompt loaded from skills/post-work-update.md. Lazy initialization.
"""
from __future__ import annotations

from pydantic import BaseModel
from pydantic_ai import Agent

from src.engine.prompts.loader import load_skill

_agent: Agent | None = None
_SYSTEM_PROMPT = load_skill("skills/post-work-update.md")


class PostWorkAction(BaseModel):
    rule: str          # Pattern | Gap | Fix | CrossDepartment | Done | Batch
    department: str
    destination: str   # PLANS | IDEAS | INBOX
    text: str


class PostWorkResult(BaseModel):
    actions: list[PostWorkAction]
    summary: str


def get_agent() -> Agent:
    global _agent
    if _agent is None:
        _agent = Agent(
            "claude-sonnet-4-6",
            result_type=PostWorkResult,
            system_prompt=_SYSTEM_PROMPT,
        )
    return _agent


async def run(work_summary: str, files_touched: list[str], findings: list[str]) -> PostWorkResult:
    prompt = (
        f"work_summary: {work_summary}\n"
        f"files_touched: {files_touched}\n"
        f"findings: {findings}"
    )
    result = await get_agent().run(prompt)
    return result.data
