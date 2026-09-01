"""
Typing judgements for the λ_R language.

This module exposes `type_of`, which infers types for terms in a
given `Context`, using the core syntax layer defined by the ``Var``,
``Term``, and ``Type`` classes. For users who need an explicit witness
of the typing derivation (matching the rules in the Relational
Mathematics Specification for the Language layer),
:func:`type_of_with_derivation` additionally returns a structured
:class:`Derivation` tree.
"""

from __future__ import annotations

from typing import Tuple, cast

from .derivation import Derivation
from .context import Context
from .errors import TypeError
from .terms import Term, Var
from .types import Type, TypeKind


def type_of(ctx: Context, term: Term) -> Type:
    """Infer the type of a term in context."""

    ty, _ = type_of_with_derivation(ctx, term)
    return ty


def type_of_with_derivation(ctx: Context, term: Term) -> Tuple[Type, Derivation]:
    """Infer a type together with its typing derivation."""

    if term.tag == "var":
        assert isinstance(term.value, Var)
        ty = ctx.lookup(term.value)
        if ty is None:
            raise TypeError(f"unbound variable {term.value.name}")
        return ty, Derivation("var", ctx, term, ty, [])

    if term.tag == "lam":
        param, body = cast(tuple[Var, Term], term.value)
        param_ty = ctx.lookup(param)
        if param_ty is None:
            raise TypeError(f"parameter {param.name} must be bound in context")
        body_ty, body_deriv = type_of_with_derivation(ctx, body)
        result_ty = Type.imp(param_ty, body_ty)
        return result_ty, Derivation("lam", ctx, term, result_ty, [body_deriv])

    if term.tag == "app":
        fn, arg = cast(tuple[Term, Term], term.value)
        fn_ty, fn_deriv = type_of_with_derivation(ctx, fn)
        arg_ty, arg_deriv = type_of_with_derivation(ctx, arg)
        if fn_ty.kind != TypeKind.IMP or fn_ty.left is None or fn_ty.right is None:
            raise TypeError("attempt to apply a non-function")
        if fn_ty.left != arg_ty:
            raise TypeError("argument type mismatch")
        result_ty = fn_ty.right
        assert result_ty is not None
        return result_ty, Derivation("app", ctx, term, result_ty, [fn_deriv, arg_deriv])

    if term.tag == "pair":
        first, second = cast(tuple[Term, Term], term.value)
        t1, d1 = type_of_with_derivation(ctx, first)
        t2, d2 = type_of_with_derivation(ctx, second)
        result_ty = Type.and_(t1, t2)
        return result_ty, Derivation("pair", ctx, term, result_ty, [d1, d2])

    if term.tag == "fst":
        pair = cast(Term, term.value)
        p_ty, p_deriv = type_of_with_derivation(ctx, pair)
        if p_ty.kind != TypeKind.AND or p_ty.left is None:
            raise TypeError("projection from non-product")
        result_ty = p_ty.left
        return result_ty, Derivation("fst", ctx, term, result_ty, [p_deriv])

    if term.tag == "snd":
        pair = cast(Term, term.value)
        p_ty, p_deriv = type_of_with_derivation(ctx, pair)
        if p_ty.kind != TypeKind.AND or p_ty.right is None:
            raise TypeError("projection from non-product")
        result_ty = p_ty.right
        return result_ty, Derivation("snd", ctx, term, result_ty, [p_deriv])

    if term.tag == "inl":
        inner, right_ty = cast(tuple[Term, Type], term.value)
        a_ty, inner_deriv = type_of_with_derivation(ctx, inner)
        result_ty = Type.or_(a_ty, right_ty)
        return result_ty, Derivation("inl", ctx, term, result_ty, [inner_deriv])

    if term.tag == "inr":
        inner, left_ty = cast(tuple[Term, Type], term.value)
        b_ty, inner_deriv = type_of_with_derivation(ctx, inner)
        result_ty = Type.or_(left_ty, b_ty)
        return result_ty, Derivation("inr", ctx, term, result_ty, [inner_deriv])

    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = cast(
            tuple[Term, Var, Term, Var, Term],
            term.value,
        )
        scrut_ty, scrut_deriv = type_of_with_derivation(ctx, scrut)
        if (
            scrut_ty.kind != TypeKind.OR
            or scrut_ty.left is None
            or scrut_ty.right is None
        ):
            raise TypeError("case on non-sum scrutinee")
        ctx_l = ctx.extend(l_var, scrut_ty.left)
        ctx_r = ctx.extend(r_var, scrut_ty.right)
        ty_l, l_deriv = type_of_with_derivation(ctx_l, l_branch)
        ty_r, r_deriv = type_of_with_derivation(ctx_r, r_branch)
        if ty_l != ty_r:
            raise TypeError("branches of case must have same type")
        result_ty = ty_l
        return result_ty, Derivation(
            "case",
            ctx,
            term,
            result_ty,
            [scrut_deriv, l_deriv, r_deriv],
        )

    if term.tag == "star":
        result_ty = Type.top()
        return result_ty, Derivation("top-intro", ctx, term, result_ty, [])

    if term.tag == "abort":
        inner, target = cast(tuple[Term, Type], term.value)
        inner_ty, inner_deriv = type_of_with_derivation(ctx, inner)
        if inner_ty.kind != TypeKind.BOTTOM:
            raise TypeError("abort expects a ⊥-typed argument")
        result_ty = target
        return result_ty, Derivation("bottom-elim", ctx, term, result_ty, [inner_deriv])

    if term.tag == "reflex":
        inner = cast(Term, term.value)
        inner_ty, inner_deriv = type_of_with_derivation(ctx, inner)
        return inner_ty, Derivation("reflex-intro", ctx, term, inner_ty, [inner_deriv])

    raise TypeError(f"unknown term tag {term.tag!r}")


__all__ = ["Derivation", "type_of", "type_of_with_derivation"]
