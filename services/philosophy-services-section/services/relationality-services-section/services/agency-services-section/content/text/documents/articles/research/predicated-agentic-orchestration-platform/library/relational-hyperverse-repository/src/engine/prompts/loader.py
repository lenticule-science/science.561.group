"""Load skill files as system prompts for PydanticAI agents.

Skill files are the canonical source of truth. Agents are initialized with
the skill body at import time, so changing a skill file requires restarting
the engine (or calling reload()).
"""
from __future__ import annotations

import re
from pathlib import Path

from src.engine.paths import REPO_DIR


def load_skill(skill_path: str) -> str:
    """Read a skill .md file, strip YAML frontmatter, return body."""
    path = REPO_DIR / skill_path
    text = path.read_text(encoding="utf-8")
    # Strip --- frontmatter block ---
    if text.startswith("---"):
        end = text.index("---", 3)
        text = text[end + 3:].lstrip("\n")
    return text.strip()
