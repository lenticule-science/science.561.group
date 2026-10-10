"""
Relational Language (λ_R) layer (Python).

This module provides a minimal syntax and typing skeleton for the
internal λ-like language described in the Treatise.
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import Enum, auto
from typing import List, Optional, Tuple


class TypeKind(Enum):
    ATOM = auto()
    BOTTOM = auto()
    TOP = auto()
    AND = auto()
    OR = auto()
    IMP = auto()


@dataclass(frozen=True)
class Type:
    kind: TypeKind
    left: Optional["Type"] = None
    right: Optional["Type"] = None

    # For ATOM kinds, `left` and `right` are unused; the atom name is
    # stored in `atom`.
    atom: Optional[str] = None

    @staticmethod
    def bottom() -> "Type":
        return Type(TypeKind.BOTTOM)

    @staticmethod
    def top() -> "Type":
        return Type(TypeKind.TOP)

    @staticmethod
    def and_(a: "Type", b: "Type") -> "Type":
        return Type(TypeKind.AND, a, b)

    @staticmethod
    def or_(a: "Type", b: "Type") -> "Type":
        return Type(TypeKind.OR, a, b)

    @staticmethod
    def imp(a: "Type", b: "Type") -> "Type":
        return Type(TypeKind.IMP, a, b)

    @staticmethod
    def atom(name: str) -> "Type":
        return Type(TypeKind.ATOM, None, None, atom=name)

    @staticmethod
    def neg(a: "Type") -> "Type":
        """Heyting negation ¬A defined as A ⇒ ⊥."""
        return Type.imp(a, Type.bottom())


@dataclass(frozen=True)
class Var:
    name: str


@dataclass(frozen=True)
class Term:
    """AST node for λ_R terms.

    Tags and their values:
    - "var": Var
    - "lam": (Var, Term)
    - "app": (Term, Term)
    - "pair": (Term, Term)
    - "fst": Term
    - "snd": Term
    - "inl": (Term, Type)      # right summand type
    - "inr": (Term, Type)      # left summand type
    - "case": (scrutinee, Var, Term, Var, Term)
    - "star": None
    - "abort": (Term, Type)    # target type
    - "reflex": Term
    """

    tag: str
    value: object | None = None

    @staticmethod
    def var(v: Var) -> "Term":
        return Term("var", v)

    @staticmethod
    def lam(param: Var, body: "Term") -> "Term":
        return Term("lam", (param, body))

    @staticmethod
    def app(fn: "Term", arg: "Term") -> "Term":
        return Term("app", (fn, arg))

    @staticmethod
    def pair(first: "Term", second: "Term") -> "Term":
        return Term("pair", (first, second))

    @staticmethod
    def fst(pair: "Term") -> "Term":
        return Term("fst", pair)

    @staticmethod
    def snd(pair: "Term") -> "Term":
        return Term("snd", pair)

    @staticmethod
    def inl(term: "Term", right_ty: Type) -> "Term":
        """Left injection: term : A, right_ty : B."""
        return Term("inl", (term, right_ty))

    @staticmethod
    def inr(term: "Term", left_ty: Type) -> "Term":
        """Right injection: term : B, left_ty : A."""
        return Term("inr", (term, left_ty))

    @staticmethod
    def case(
        scrutinee: "Term",
        left_var: Var,
        left_branch: "Term",
        right_var: Var,
        right_branch: "Term",
    ) -> "Term":
        return Term("case", (scrutinee, left_var, left_branch, right_var, right_branch))

    @staticmethod
    def star() -> "Term":
        return Term("star", None)

    @staticmethod
    def abort(term: "Term", target: Type) -> "Term":
        return Term("abort", (term, target))

    @staticmethod
    def reflex(term: "Term") -> "Term":
        return Term("reflex", term)


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


class TypeError(Exception):
    pass


def substitute(term: Term, var: Var, replacement: Term) -> Term:
    """Naive capture-avoiding substitution [replacement/var]term.

    This assumes terms are constructed so that variable names avoid
    capture; it is sufficient for the small examples and tests here.
    """

    if term.tag == "var":
        assert isinstance(term.value, Var)
        return replacement if term.value.name == var.name else term

    if term.tag == "lam":
        param, body = term.value  # type: ignore[misc]
        assert isinstance(param, Var)
        assert isinstance(body, Term)
        if param.name == var.name:
            return term  # shadowed, stop
        return Term.lam(param, substitute(body, var, replacement))

    if term.tag == "app":
        fn, arg = term.value  # type: ignore[misc]
        assert isinstance(fn, Term)
        assert isinstance(arg, Term)
        return Term.app(substitute(fn, var, replacement), substitute(arg, var, replacement))

    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        return Term.pair(substitute(first, var, replacement), substitute(second, var, replacement))

    if term.tag == "fst":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        return Term.fst(substitute(pair, var, replacement))

    if term.tag == "snd":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        return Term.snd(substitute(pair, var, replacement))

    if term.tag == "inl":
        inner, right_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(right_ty, Type)
        return Term.inl(substitute(inner, var, replacement), right_ty)

    if term.tag == "inr":
        inner, left_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(left_ty, Type)
        return Term.inr(substitute(inner, var, replacement), left_ty)

    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = term.value  # type: ignore[misc]
        assert isinstance(scrut, Term)
        assert isinstance(l_var, Var)
        assert isinstance(l_branch, Term)
        assert isinstance(r_var, Var)
        assert isinstance(r_branch, Term)
        new_scrut = substitute(scrut, var, replacement)
        new_l_branch = (
            l_branch
            if l_var.name == var.name
            else substitute(l_branch, var, replacement)
        )
        new_r_branch = (
            r_branch
            if r_var.name == var.name
            else substitute(r_branch, var, replacement)
        )
        return Term.case(new_scrut, l_var, new_l_branch, r_var, new_r_branch)

    if term.tag == "star":
        return term

    if term.tag == "abort":
        inner, target = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(target, Type)
        return Term.abort(substitute(inner, var, replacement), target)

    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        return Term.reflex(substitute(inner, var, replacement))

    raise TypeError(f"unknown term tag in substitution: {term.tag!r}")


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


def step(term: Term) -> Tuple[Term, bool]:
    """One small-step reduction of λ_R.

    Returns (new_term, changed). The reduction strategy is a simple
    outermost reduction with recursive descent.
    """

    # β-reduction.
    if term.tag == "app":
        fn, arg = term.value  # type: ignore[misc]
        assert isinstance(fn, Term)
        assert isinstance(arg, Term)
        if fn.tag == "lam":
            param, body = fn.value  # type: ignore[misc]
            assert isinstance(param, Var)
            assert isinstance(body, Term)
            return substitute(body, param, arg), True
        new_fn, changed = step(fn)
        if changed:
            return Term.app(new_fn, arg), True
        new_arg, changed = step(arg)
        if changed:
            return Term.app(fn, new_arg), True
        return term, False

    # Projections from pairs.
    if term.tag == "fst":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        if pair.tag == "pair":
            first, _ = pair.value  # type: ignore[misc]
            assert isinstance(first, Term)
            return first, True
        new_pair, changed = step(pair)
        if changed:
            return Term.fst(new_pair), True
        return term, False

    if term.tag == "snd":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        if pair.tag == "pair":
            _, second = pair.value  # type: ignore[misc]
            assert isinstance(second, Term)
            return second, True
        new_pair, changed = step(pair)
        if changed:
            return Term.snd(new_pair), True
        return term, False

    # Pairs.
    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        new_first, changed = step(first)
        if changed:
            return Term.pair(new_first, second), True
        new_second, changed = step(second)
        if changed:
            return Term.pair(first, new_second), True
        return term, False

    # Sum case.
    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = term.value  # type: ignore[misc]
        assert isinstance(scrut, Term)
        assert isinstance(l_var, Var)
        assert isinstance(l_branch, Term)
        assert isinstance(r_var, Var)
        assert isinstance(r_branch, Term)
        if scrut.tag == "inl":
            inner, _ = scrut.value  # type: ignore[misc]
            assert isinstance(inner, Term)
            return substitute(l_branch, l_var, inner), True
        if scrut.tag == "inr":
            inner, _ = scrut.value  # type: ignore[misc]
            assert isinstance(inner, Term)
            return substitute(r_branch, r_var, inner), True
        new_scrut, changed = step(scrut)
        if changed:
            return Term.case(new_scrut, l_var, l_branch, r_var, r_branch), True
        return term, False

    # Injections.
    if term.tag == "inl":
        inner, right_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(right_ty, Type)
        new_inner, changed = step(inner)
        if changed:
            return Term.inl(new_inner, right_ty), True
        return term, False

    if term.tag == "inr":
        inner, left_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(left_ty, Type)
        new_inner, changed = step(inner)
        if changed:
            return Term.inr(new_inner, left_ty), True
        return term, False

    # Abort reduces inside its argument.
    if term.tag == "abort":
        inner, target = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(target, Type)
        new_inner, changed = step(inner)
        if changed:
            return Term.abort(new_inner, target), True
        return term, False

    # Reflex reduces its subterm but is not eliminated.
    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        new_inner, changed = step(inner)
        if changed:
            return Term.reflex(new_inner), True
        return term, False

    # Variables and constants are in normal form.
    if term.tag in {"var", "star"}:
        return term, False

    raise TypeError(f"unknown term tag in step: {term.tag!r}")


def normalize(term: Term, max_steps: int = 1000) -> Term:
    """Iterate `step` to obtain a normal form (or stop at max_steps)."""

    current = term
    for _ in range(max_steps):
        current, changed = step(current)
        if not changed:
            return current
    return current
