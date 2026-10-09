"""InterpretPromptAgent: parses raw operator text into typed PromptUnits.

System prompt is loaded from skills/interpret-prompt.md at import time.
Agent instance is created lazily (on first call) so the module can be
imported without ANTHROPIC_API_KEY set.
"""
from __future__ import annotations

from pydantic_ai import Agent

from src.engine.models.transient import PromptUnit
from src.engine.prompts.loader import load_skill

_agent: Agent | None = None
_SYSTEM_PROMPT = load_skill("skills/interpret-prompt.md")


def get_agent() -> Agent:
    global _agent
    if _agent is None:
        _agent = Agent(
            "claude-sonnet-4-6",
            result_type=list[PromptUnit],
            system_prompt=_SYSTEM_PROMPT,
        )
    return _agent


async def run(prompt: str) -> list[PromptUnit]:
    result = await get_agent().run(prompt)
    return result.data
