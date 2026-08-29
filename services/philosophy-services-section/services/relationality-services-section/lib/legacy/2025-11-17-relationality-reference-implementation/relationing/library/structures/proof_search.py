"""
Very small proof search for λ_R in the implicational fragment.

This is a finite, depth-bounded inhabitation search over Types built
from atoms and implication only. It provides a concrete check that
some valid implicational formulas admit λ_R terms whose typings match
their semantic validity in our finite Heyting models.
"""

from __future__ import annotations

from typing import Iterable, List, Optional, Tuple

from relationing.core.language.terms import Term, Var
from relationing.core.language.types import Type, TypeKind
from relationing.core.language.typing import type_of

from .search_context import SearchContext


def is_implicational(ty: Type) -> bool:
    """Return True when `ty` is built from atoms and implication only."""

    if ty.kind == TypeKind.ATOM:
        return True
    if ty.kind == TypeKind.IMP and ty.left is not None and ty.right is not None:
        return is_implicational(ty.left) and is_implicational(ty.right)
    return False


def find_term(
    goal: Type,
    max_depth: int,
    ctx: Optional[SearchContext] = None,
) -> Optional[Term]:
    """Attempt to find a λ_R term inhabiting `goal` in the implicational fragment.

    This is a backward-compatible wrapper around `prove`, preserving
    the outward-mutation behaviour of `ctx` used in existing tests
    while routing the search through a more structured API.
    """

    if ctx is None:
        ctx = SearchContext.empty()

    result = prove(goal, max_depth=max_depth, ctx=ctx)
    if result is None:
        return None
    term, out_ctx = result
    # Preserve the historical behaviour where ctx.ctx is updated to the
    # final context (for example, to bind λ-parameters when typechecking).
    ctx.ctx = out_ctx.ctx
    return term


def prove(
    goal: Type,
    max_depth: int,
    ctx: Optional[SearchContext] = None,
) -> Optional[Tuple[Term, SearchContext]]:
    """Structured proof search: Γ ⊢ goal, returning (term, context).

    The returned context reflects any λ-parameters introduced during
    implication introduction; for closed goals this coincides with the
    input context.
    """

    if ctx is None:
        ctx = SearchContext.empty()

    if max_depth < 0:
        return None

    # Implication goal A ⇒ B.
    if goal.kind == TypeKind.IMP and goal.left is not None and goal.right is not None:
        # First, try to use an existing assumption of type A ⇒ B.
        for b in ctx.bindings:
            if b.ty == goal:
                return Term.var(b.var), ctx

        # Otherwise, implication introduction: λx:A. t where t:B.
        param = Var(f"x{max_depth}")
        extended = ctx.extend(param, goal.left)
        sub = prove(goal.right, max_depth - 1, extended)
        if sub is None:
            return None
        body, body_ctx = sub
        return Term.lam(param, body), extended

    # Atomic goal: either a variable has that type, or we can apply some
    # function in the context to smaller terms.
    if goal.kind == TypeKind.ATOM:
        # Direct variable.
        for b in ctx.bindings:
            if b.ty == goal:
                return Term.var(b.var), ctx

        # Try to use variables of function type: f: A ⇒ goal.
        for b in ctx.bindings:
            ty = b.ty
            if ty.kind == TypeKind.IMP and ty.left is not None and ty.right is not None:
                if ty.right == goal:
                    sub = prove(ty.left, max_depth - 1, ctx)
                    if sub is not None:
                        arg, arg_ctx = sub
                        return Term.app(Term.var(b.var), arg), arg_ctx
        return None

    # We ignore non-implicational goals here.
    return None


def check_inhabited(goal: Type, max_depth: int) -> bool:
    """Return True if `find_term` finds a well-typed inhabitant of `goal`."""

    if not is_implicational(goal):
        return False
    ctx = SearchContext.empty()
    result = prove(goal, max_depth, ctx)
    if result is None:
        return False
    term, out_ctx = result
    # Ensure the term actually typechecks as `goal` from the resulting context.
    try:
        inferred = type_of(out_ctx.ctx, term)
    except Exception:
        return False
    return inferred == goal


def inhabited_implicational_theorems(
    goals: Iterable[Type],
    max_depth: int,
) -> List[Type]:
    """Return implicational goals that are inhabited by proof search.

    This is a small helper towards the Language TODO of making the
    proof-search/completeness fragment explicit: given a family of
    implicational types, it returns the subfamily for which
    ``check_inhabited`` can exhibit a well-typed inhabitant at the
    given depth bound.
    """

    inhabited: List[Type] = []
    for goal in goals:
        if not is_implicational(goal):
            continue
        if check_inhabited(goal, max_depth=max_depth):
            inhabited.append(goal)
    return inhabited


__all__ = [
    "is_implicational",
    "find_term",
    "prove",
    "check_inhabited",
    "inhabited_implicational_theorems",
]
