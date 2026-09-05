from __future__ import annotations

from typing import Protocol, runtime_checkable


@runtime_checkable
class Preorder(Protocol):
    """A preorder / partial-order interface."""

    def leq(self, other: "Preorder") -> bool:
        """Return True when self is at most as recognising as other."""
        ...

    def geq(self, other: "Preorder") -> bool:
        return other.leq(self)


__all__ = ["Preorder"]
