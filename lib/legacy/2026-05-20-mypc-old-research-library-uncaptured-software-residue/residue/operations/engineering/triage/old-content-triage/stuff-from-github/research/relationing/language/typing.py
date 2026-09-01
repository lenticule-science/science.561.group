"""
Typing judgements for the λ_R language.

This module exposes `type_of`, which infers types for terms in a
given `Context`, using the syntax layer defined in
`relationing.language.syntax`.
"""

from __future__ import annotations

from relationing.language.syntax import Context, Term, Type, TypeError, TypeKind, Var


def type_of(ctx: Context, term: Term) -> Type:
    """Infer the type of a term in context."""

    if term.tag == "var":
        assert isinstance(term.value, Var)
        ty = ctx.lookup(term.value)
        if ty is None:
            raise TypeError(f"unbound variable {term.value.name}")
        return ty

    if term.tag == "lam":
        param, body = term.value  # type: ignore[misc]
        assert isinstance(param, Var)
        assert isinstance(body, Term)
        param_ty = ctx.lookup(param)
        if param_ty is None:
            raise TypeError(f"parameter {param.name} must be bound in context")
        body_ty = type_of(ctx, body)
        return Type.imp(param_ty, body_ty)

    if term.tag == "app":
        fn, arg = term.value  # type: ignore[misc]
        assert isinstance(fn, Term)
        assert isinstance(arg, Term)
        fn_ty = type_of(ctx, fn)
        arg_ty = type_of(ctx, arg)
        if fn_ty.kind != TypeKind.IMP or fn_ty.left is None or fn_ty.right is None:
            raise TypeError("attempt to apply a non-function")
        if fn_ty.left != arg_ty:
            raise TypeError("argument type mismatch")
        return fn_ty.right

    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        t1 = type_of(ctx, first)
        t2 = type_of(ctx, second)
        return Type.and_(t1, t2)

    if term.tag == "fst":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        p_ty = type_of(ctx, pair)
        if p_ty.kind != TypeKind.AND or p_ty.left is None:
            raise TypeError("projection from non-product")
        return p_ty.left

    if term.tag == "snd":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        p_ty = type_of(ctx, pair)
        if p_ty.kind != TypeKind.AND or p_ty.right is None:
            raise TypeError("projection from non-product")
        return p_ty.right

    if term.tag == "inl":
        inner, right_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(right_ty, Type)
        a_ty = type_of(ctx, inner)
        return Type.or_(a_ty, right_ty)

    if term.tag == "inr":
        inner, left_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(left_ty, Type)
        b_ty = type_of(ctx, inner)
        return Type.or_(left_ty, b_ty)

    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = term.value  # type: ignore[misc]
        assert isinstance(scrut, Term)
        assert isinstance(l_var, Var)
        assert isinstance(l_branch, Term)
        assert isinstance(r_var, Var)
        assert isinstance(r_branch, Term)
        scrut_ty = type_of(ctx, scrut)
        if scrut_ty.kind != TypeKind.OR or scrut_ty.left is None or scrut_ty.right is None:
            raise TypeError("case on non-sum scrutinee")
        ctx_l = ctx.extend(l_var, scrut_ty.left)
        ctx_r = ctx.extend(r_var, scrut_ty.right)
        ty_l = type_of(ctx_l, l_branch)
        ty_r = type_of(ctx_r, r_branch)
        if ty_l != ty_r:
            raise TypeError("branches of case must have same type")
        return ty_l

    if term.tag == "star":
        return Type.top()

    if term.tag == "abort":
        inner, target = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(target, Type)
        inner_ty = type_of(ctx, inner)
        if inner_ty.kind != TypeKind.BOTTOM:
            raise TypeError("abort expects a ⊥-typed argument")
        return target

    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        return type_of(ctx, inner)

    raise TypeError(f"unknown term tag {term.tag!r}")


__all__ = ["type_of"]

