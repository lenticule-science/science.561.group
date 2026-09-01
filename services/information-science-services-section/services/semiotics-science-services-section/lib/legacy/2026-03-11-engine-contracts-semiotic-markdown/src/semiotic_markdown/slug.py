from __future__ import annotations

import re

_NOT_SLUG_SAFE = re.compile(r"[^a-z0-9_-]")
_DASHES = re.compile(r"-+")


def slugify(value: str) -> str:
    value = value.lower().strip()
    value = value.replace("/", "-").replace("\\", "-")
    value = _NOT_SLUG_SAFE.sub("-", value)
    value = _DASHES.sub("-", value).strip("-")
    return value or "item"
