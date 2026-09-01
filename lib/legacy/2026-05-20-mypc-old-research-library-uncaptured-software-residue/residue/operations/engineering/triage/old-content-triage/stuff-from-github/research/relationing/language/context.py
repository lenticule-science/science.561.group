"""
Typing context for λ_R.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import List, Optional

from relationing.language.terms import Var
from relationing.language.types import Type


@dataclass
class Binding:
    var: Var
    ty: Type


@dataclass
class Context:
    entries: List[Binding]

    @staticmethod
    def empty() -> "Context":
        return Context([])

    def extend(self, var: Var, ty: Type) -> "Context":
        return Context(self.entries + [Binding(var, ty)])

    def lookup(self, var: Var) -> Optional[Type]:
        for b in reversed(self.entries):
            if b.var.name == var.name:
                return b.ty
        return None


__all__ = ["Binding", "Context"]

