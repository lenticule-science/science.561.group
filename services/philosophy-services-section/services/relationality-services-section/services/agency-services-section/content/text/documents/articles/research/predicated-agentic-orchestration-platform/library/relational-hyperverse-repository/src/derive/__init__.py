"""src/derive/ — scripts that compute derivable fields for each Unit kind.

Each module exports a derive(unit, path) function that takes a parsed Pydantic
model and the source file path, and returns the model with derivable fields populated.

Derivable fields (MUST NOT be stored in cold store per spec/unit.md):
  - department: derived from file path (e.g. math/INBOX.md -> math)
  - kind/type:  derived from filename (INBOX.md -> Message, PLANS.md -> WorkItem, etc.)
"""
from pathlib import Path

_FILE_TO_KIND = {
    "SOUL.md":   "Principle",
    "MEMORY.md": "MemoryEntry",
    "INBOX.md":  "Message",
    "PLANS.md":  "WorkItem",
    "IDEAS.md":  "Idea",
}

DEPARTMENTS = {"math", "proof", "spec", "src", "root"}


def department_from_path(path: str | Path) -> str:
    """Derive department from file path."""
    parts = Path(path).parts
    for part in parts:
        if part in DEPARTMENTS:
            return part
    return "root"


def kind_from_path(path: str | Path) -> str:
    """Derive Unit kind from filename."""
    return _FILE_TO_KIND.get(Path(path).name, "Unknown")
