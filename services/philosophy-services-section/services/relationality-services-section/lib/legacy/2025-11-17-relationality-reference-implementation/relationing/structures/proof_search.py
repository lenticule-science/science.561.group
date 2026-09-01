"""
Very small proof search for λ_R in the implicational fragment.

This is a finite, depth-bounded inhabitation search over Types built
from atoms and implication only. It provides a concrete check that
some valid implicational formulas admit λ_R terms whose typings match
their semantic validity in our finite Heyting models.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import List, Optional, Sequence, Tuple

from relationing.language import Context, Term, Type, TypeKind, Var, type_of


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
