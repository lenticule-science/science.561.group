"""
Very small proof search for λ_R in the implicational fragment.

This is a finite, depth-bounded inhabitation search over Types built
from atoms and implication only. It provides a concrete check that
some valid implicational formulas admit λ_R terms whose typings match
their semantic validity in our finite Heyting models.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import List, Optional, Sequence

from .language import Context, Term, Type, TypeKind, Var, type_of


@dataclass
class SearchContext:
    """Proof-search context: variables and their types."""

    ctx: Context

    @staticmethod
    def empty() -> SearchContext:
        return SearchContext(Context.empty())

    def extend(self, var: Var, ty: Type) -> SearchContext:
        return SearchContext(self.ctx.extend(var, ty))

    @property
    def bindings(self):
        return self.ctx.entries


def is_implicational(ty: Type) -> bool:
    """Return True when `ty` is built from atoms and implication only."""

    if ty.kind == TypeKind.ATOM:
        return True
    if ty.kind == TypeKind.IMP and ty.left is not None and ty.right is not None:
        return is_implicational(ty.left) and is_implicational(ty.right)
    return False


def find_term(goal: Type, max_depth: int, ctx: Optional[SearchContext] = None) -> Optional[Term]:
    """Attempt to find a λ_R term inhabiting `goal` in the implicational fragment.

    The search is depth-bounded and only considers λ-introduction and
    application of variables in context. It is not complete in general,
    but suffices to inhabit many small implicational tautologies.
    """

    if ctx is None:
        ctx = SearchContext.empty()

    if max_depth < 0:
        return None

    # Implication introduction: if goal is A ⇒ B, try λx:A. t where t:B.
    if goal.kind == TypeKind.IMP and goal.left is not None and goal.right is not None:
        param = Var(f"x{max_depth}")
        extended = ctx.extend(param, goal.left)
        body = find_term(goal.right, max_depth - 1, extended)
        if body is not None:
            # Wrap the body in a λ; the caller is expected to use the
            # same context `extended` when typechecking if needed.
            ctx.ctx = extended.ctx  # propagate extended context outward
            return Term.lam(param, body)
        return None

    # Atomic goal: either a variable has that type, or we can apply some
    # function in the context to smaller terms.
    if goal.kind == TypeKind.ATOM:
        # Direct variable.
        for b in ctx.bindings:
            if b.ty == goal:
                return Term.var(b.var)

        # Try to use variables of function type: f: A ⇒ goal.
        for b in ctx.bindings:
            ty = b.ty
            if ty.kind == TypeKind.IMP and ty.left is not None and ty.right is not None:
                if ty.right == goal:
                    arg = find_term(ty.left, max_depth - 1, ctx)
                    if arg is not None:
                        return Term.app(Term.var(b.var), arg)
        return None

    # We ignore non-implicational goals here.
    return None


def check_inhabited(goal: Type, max_depth: int) -> bool:
    """Return True if `find_term` finds a well-typed inhabitant of `goal`."""

    if not is_implicational(goal):
        return False
    ctx = SearchContext.empty()
    term = find_term(goal, max_depth, ctx)
    if term is None:
        return False
    # Ensure the term actually typechecks as `goal` from the search context.
    try:
        inferred = type_of(ctx.ctx, term)
    except Exception:
        return False
    return inferred == goal
