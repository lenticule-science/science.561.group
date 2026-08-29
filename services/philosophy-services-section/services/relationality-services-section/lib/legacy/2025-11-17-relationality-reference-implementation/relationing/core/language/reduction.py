"""
Small-step operational semantics for the λ_R language.

This module implements:
- `_substitute` for (naive) capture-avoiding substitution;
- `_step` for one-step reduction; and
- `normalize` for iterated reduction to normal form.
"""

from __future__ import annotations

from typing import List, Tuple, cast

from .errors import TypeError
from .reduction_step import ReductionStep
from .terms import Term, Var
from .types import Type


def _substitute(term: Term, var: Var, replacement: Term) -> Term:
    """Naive capture-avoiding substitution [replacement/var]term."""

    if term.tag == "var":
        assert isinstance(term.value, Var)
        return replacement if term.value.name == var.name else term

    if term.tag == "lam":
        param, body = cast(tuple[Var, Term], term.value)
        if param.name == var.name:
            return term  # shadowed, stop
        return Term.lam(param, _substitute(body, var, replacement))

    if term.tag == "app":
        fn, arg = cast(tuple[Term, Term], term.value)
        return Term.app(
            _substitute(fn, var, replacement),
            _substitute(arg, var, replacement),
        )

    if term.tag == "pair":
        first, second = cast(tuple[Term, Term], term.value)
        return Term.pair(
            _substitute(first, var, replacement),
            _substitute(second, var, replacement),
        )

    if term.tag == "fst":
        pair = cast(Term, term.value)
        return Term.fst(_substitute(pair, var, replacement))

    if term.tag == "snd":
        pair = cast(Term, term.value)
        return Term.snd(_substitute(pair, var, replacement))

    if term.tag == "inl":
        inner, right_ty = cast(tuple[Term, Type], term.value)
        return Term.inl(_substitute(inner, var, replacement), right_ty)

    if term.tag == "inr":
        inner, left_ty = cast(tuple[Term, Type], term.value)
        return Term.inr(_substitute(inner, var, replacement), left_ty)

    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = cast(
            tuple[Term, Var, Term, Var, Term],
            term.value,
        )
        new_scrut = _substitute(scrut, var, replacement)
        new_l_branch = (
            l_branch
            if l_var.name == var.name
            else _substitute(l_branch, var, replacement)
        )
        new_r_branch = (
            r_branch
            if r_var.name == var.name
            else _substitute(r_branch, var, replacement)
        )
        return Term.case(new_scrut, l_var, new_l_branch, r_var, new_r_branch)

    if term.tag == "star":
        return term

    if term.tag == "abort":
        inner, target = cast(tuple[Term, Type], term.value)
        return Term.abort(_substitute(inner, var, replacement), target)

    if term.tag == "reflex":
        inner = cast(Term, term.value)
        return Term.reflex(_substitute(inner, var, replacement))

    raise TypeError(f"unknown term tag in substitution: {term.tag!r}")


def normalize(term: Term, max_steps: int = 1000) -> Term:
    """Iterate the small-step reduction to obtain a normal form."""

    normal, _ = normalize_with_trace(term, max_steps=max_steps)
    return normal


def normalize_with_trace(
    term: Term,
    max_steps: int = 1000,
) -> Tuple[Term, List[ReductionStep]]:
    """Normalize a term and record the applied small steps.

    The returned trace is finite, each entry corresponds to one call
    to the internal stepper, and the final term coincides with
    :func:`normalize` on the same input and ``max_steps``.
    """

    current = term
    trace: List[ReductionStep] = []
    for _ in range(max_steps):
        next_term, changed, rule = _step(current)
        if not changed:
            return current, trace
        if rule is not None:
            trace.append(ReductionStep(before=current, after=next_term, rule=rule))
        current = next_term
    return current, trace


def _step(term: Term) -> Tuple[Term, bool, str | None]:
    """One small-step reduction of λ_R.

    Returns the new term, a flag indicating whether a rule fired, and
    a coarse rule label when a reduction occurred.
    """

    # β-reduction.
    if term.tag == "app":
        fn, arg = cast(tuple[Term, Term], term.value)
        if fn.tag == "lam":
            param, body = cast(tuple[Var, Term], fn.value)
            return _substitute(body, param, arg), True, "beta"
        new_fn, changed, rule = _step(fn)
        if changed:
            return Term.app(new_fn, arg), True, rule
        new_arg, changed, rule = _step(arg)
        if changed:
            return Term.app(fn, new_arg), True, rule
        return term, False, None

    # Projections from pairs.
    if term.tag == "fst":
        pair = cast(Term, term.value)
        if pair.tag == "pair":
            first, _ = cast(tuple[Term, Term], pair.value)
            return first, True, "fst-pair"
        new_pair, changed, rule = _step(pair)
        if changed:
            return Term.fst(new_pair), True, rule
        return term, False, None

    if term.tag == "snd":
        pair = cast(Term, term.value)
        if pair.tag == "pair":
            _, second = cast(tuple[Term, Term], pair.value)
            return second, True, "snd-pair"
        new_pair, changed, rule = _step(pair)
        if changed:
            return Term.snd(new_pair), True, rule
        return term, False, None

    # Pairs.
    if term.tag == "pair":
        first, second = cast(tuple[Term, Term], term.value)
        new_first, changed, rule = _step(first)
        if changed:
            return Term.pair(new_first, second), True, rule
        new_second, changed, rule = _step(second)
        if changed:
            return Term.pair(first, new_second), True, rule
        return term, False, None

    # Sum case.
    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = cast(
            tuple[Term, Var, Term, Var, Term],
            term.value,
        )
        if scrut.tag == "inl":
            inner, _ = cast(tuple[Term, Type], scrut.value)
            return _substitute(l_branch, l_var, inner), True, "case-inl"
        if scrut.tag == "inr":
            inner, _ = cast(tuple[Term, Type], scrut.value)
            return _substitute(r_branch, r_var, inner), True, "case-inr"
        new_scrut, changed, rule = _step(scrut)
        if changed:
            return Term.case(new_scrut, l_var, l_branch, r_var, r_branch), True, rule
        return term, False, None

    # Injections.
    if term.tag == "inl":
        inner, right_ty = cast(tuple[Term, Type], term.value)
        new_inner, changed, rule = _step(inner)
        if changed:
            return Term.inl(new_inner, right_ty), True, rule
        return term, False, None

    if term.tag == "inr":
        inner, left_ty = cast(tuple[Term, Type], term.value)
        new_inner, changed, rule = _step(inner)
        if changed:
            return Term.inr(new_inner, left_ty), True, rule
        return term, False, None

    # Abort reduces inside its argument.
    if term.tag == "abort":
        inner, target = cast(tuple[Term, Type], term.value)
        new_inner, changed, rule = _step(inner)
        if changed:
            return Term.abort(new_inner, target), True, rule
        return term, False, None

    # Reflex reduces its subterm but is not eliminated.
    if term.tag == "reflex":
        inner = cast(Term, term.value)
        new_inner, changed, rule = _step(inner)
        if changed:
            return Term.reflex(new_inner), True, "reflex-cong" if rule is None else rule
        return term, False, None

    # Variables and constants are in normal form.
    if term.tag in {"var", "star"}:
        return term, False, None

    raise TypeError(f"unknown term tag in step: {term.tag!r}")


__all__ = ["normalize", "normalize_with_trace"]
