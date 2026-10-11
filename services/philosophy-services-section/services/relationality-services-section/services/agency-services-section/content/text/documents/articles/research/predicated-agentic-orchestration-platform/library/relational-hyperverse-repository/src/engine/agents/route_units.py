"""RouteUnitsAgent: decides where each PromptUnit goes and with what message type.

System prompt is loaded from skills/route-prompt-units.md at import time.
Returns one RoutingDecision per input PromptUnit.
"""
from __future__ import annotations

import json

from pydantic_ai import Agent

from src.engine.models.transient import PromptUnit, RoutingDecision
from src.engine.prompts.loader import load_skill

_agent: Agent | None = None
_SYSTEM_PROMPT = load_skill("skills/route-prompt-units.md")


def get_agent() -> Agent:
    global _agent
    if _agent is None:
        _agent = Agent(
            "claude-sonnet-4-6",
            result_type=list[RoutingDecision],
            system_prompt=_SYSTEM_PROMPT,
        )
    return _agent


async def run(units: list[PromptUnit]) -> list[RoutingDecision]:
    payload = json.dumps([u.model_dump() for u in units], indent=2)
    result = await get_agent().run(payload)
    return result.data
