"""Decorator-based registry binding Python objects to markdown notes.

Mirrors `predication_categories/link.py` in shape: each registered link
has a `target` (relative path from the corpus root to a markdown note),
a `kind` (`defines`, `verifies`, `instantiates`, ...), and arbitrary
metadata. The validator at `validate.py` checks every registered link
resolves to an existing markdown note.

Triage-stub form: registry exists, no objects yet registered. Promotion
out of triage will register one entry per primitive / theorem module
once those modules are populated.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Callable, Iterable


@dataclass(frozen=True)
class Link:
    """A single Python <-> markdown link record."""

    target: str
    kind: str
    obj: Any
    metadata: tuple[tuple[str, Any], ...] = field(default_factory=tuple)


_REGISTRY: list[Link] = []


def all_links() -> Iterable[Link]:
    """Return every registered link."""
    return tuple(_REGISTRY)


def defines(target: str, **metadata: Any) -> Callable[[Any], Any]:
    """Mark `obj` as the Python realization of the markdown note `target`."""

    def _decorator(obj: Any) -> Any:
        _REGISTRY.append(
            Link(
                target=target,
                kind="defines",
                obj=obj,
                metadata=tuple(sorted(metadata.items())),
            )
        )
        return obj

    return _decorator


def verifies(target: str, **metadata: Any) -> Callable[[Any], Any]:
    """Mark `obj` as a computational verification of the markdown note `target`."""

    def _decorator(obj: Any) -> Any:
        _REGISTRY.append(
            Link(
                target=target,
                kind="verifies",
                obj=obj,
                metadata=tuple(sorted(metadata.items())),
            )
        )
        return obj

    return _decorator


def instantiates(target: str, **metadata: Any) -> Callable[[Any], Any]:
    """Mark `obj` as an instance of the markdown note `target`."""

    def _decorator(obj: Any) -> Any:
        _REGISTRY.append(
            Link(
                target=target,
                kind="instantiates",
                obj=obj,
                metadata=tuple(sorted(metadata.items())),
            )
        )
        return obj

    return _decorator
