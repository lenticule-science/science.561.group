"""
SearchContext wrapper for implicational proof search.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Sequence

from relationing.core.language.binding import Binding
from relationing.core.language.context import Context
from relationing.core.language.terms import Var
from relationing.core.language.types import Type


@dataclass
class SearchContext:
    """Proof-search context: variables and their types."""

    ctx: Context

    @staticmethod
    def empty() -> "SearchContext":
        return SearchContext(Context.empty())

    def extend(self, var: Var, ty: Type) -> "SearchContext":
        return SearchContext(self.ctx.extend(var, ty))

    @property
    def bindings(self) -> Sequence[Binding]:
        return self.ctx.entries


__all__ = ["SearchContext"]
