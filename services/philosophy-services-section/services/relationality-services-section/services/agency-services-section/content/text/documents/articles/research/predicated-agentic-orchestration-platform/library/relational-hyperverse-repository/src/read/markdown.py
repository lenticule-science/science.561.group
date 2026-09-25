"""src/read/markdown.py

Parse department context files into typed Pydantic model instances.

parse_units(path, unit_type) reads a context file and returns a list of instances
of the given model class. Each ### heading starts a new unit; fields are read from
bold-label lines ("**field:** value") and trailing body text.
"""
from __future__ import annotations

import re
from pathlib import Path
from typing import Type, TypeVar

from pydantic import BaseModel

T = TypeVar("T", bound=BaseModel)

_FIELD_RE = re.compile(r"^\*\*(\w[\w-]*)\*\*:\s*(.*)")


def parse_units(path: str | Path, model: Type[T]) -> list[T]:
    """Read a context file and return a list of model instances, one per ### section."""
    text = Path(path).read_text(encoding="utf-8")
    blocks = _split_blocks(text)
    results = []
    for heading, body in blocks:
        fields = _extract_fields(heading, body)
        try:
            results.append(model(**fields))
        except Exception:
            pass  # malformed block; skip
    return results


def _split_blocks(text: str) -> list[tuple[str, str]]:
    """Split on ### headings. Returns (heading_text, body) pairs."""
    blocks: list[tuple[str, str]] = []
    current_heading = ""
    current_lines: list[str] = []

    for line in text.splitlines():
        if line.startswith("### "):
            if current_heading:
                blocks.append((current_heading, "\n".join(current_lines).strip()))
            current_heading = line[4:].strip()
            current_lines = []
        elif current_heading:
            current_lines.append(line)

    if current_heading:
        blocks.append((current_heading, "\n".join(current_lines).strip()))

    return blocks


def _extract_fields(heading: str, body: str) -> dict:
    """Extract **field:** value pairs from body, plus heading and remaining body text."""
    fields: dict = {"heading": heading}
    body_lines: list[str] = []

    for line in body.splitlines():
        m = _FIELD_RE.match(line)
        if m:
            key = m.group(1).lower().replace("-", "_")
            fields[key] = m.group(2).strip()
        else:
            body_lines.append(line)

    leftover = "\n".join(body_lines).strip()
    if leftover and "body" not in fields:
        fields["body"] = leftover

    return fields
