"""
Small-step operational semantics for the λ_R language.

This module implements:
- `_substitute` for (naive) capture-avoiding substitution;
- `_step` for one-step reduction; and
- `normalize` for iterated reduction to normal form.
"""

from __future__ import annotations

from typing import Tuple

from relationing.language.syntax import Term, Type, TypeError, Var


def _substitute(term: Term, var: Var, replacement: Term) -> Term:
    """Naive capture-avoiding substitution [replacement/var]term."""

    if term.tag == "var":
        assert isinstance(term.value, Var)
        return replacement if term.value.name == var.name else term

    if term.tag == "lam":
        param, body = term.value  # type: ignore[misc]
        assert isinstance(param, Var)
        assert isinstance(body, Term)
        if param.name == var.name:
            return term  # shadowed, stop
        return Term.lam(param, _substitute(body, var, replacement))

    if term.tag == "app":
        fn, arg = term.value  # type: ignore[misc]
        assert isinstance(fn, Term)
        assert isinstance(arg, Term)
        return Term.app(_substitute(fn, var, replacement), _substitute(arg, var, replacement))

    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        return Term.pair(_substitute(first, var, replacement), _substitute(second, var, replacement))

    if term.tag == "fst":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        return Term.fst(_substitute(pair, var, replacement))

    if term.tag == "snd":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        return Term.snd(_substitute(pair, var, replacement))

    if term.tag == "inl":
        inner, right_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(right_ty, Type)
        return Term.inl(_substitute(inner, var, replacement), right_ty)

    if term.tag == "inr":
        inner, left_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(left_ty, Type)
        return Term.inr(_substitute(inner, var, replacement), left_ty)

    if term.tag == "case":
        scrut, l_var, l_branch, r_var, r_branch = term.value  # type: ignore[misc]
        assert isinstance(scrut, Term)
        assert isinstance(l_var, Var)
        assert isinstance(l_branch, Term)
        assert isinstance(r_var, Var)
        assert isinstance(r_branch, Term)
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
        inner, target = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(target, Type)
        return Term.abort(_substitute(inner, var, replacement), target)

    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        return Term.reflex(_substitute(inner, var, replacement))

    raise TypeError(f"unknown term tag in substitution: {term.tag!r}")


def normalize(term: Term, max_steps: int = 1000) -> Term:
    """Iterate the small-step reduction to obtain a normal form."""

    current = term
    for _ in range(max_steps):
        current, changed = _step(current)
        if not changed:
            return current
    return current


def _step(term: Term) -> Tuple[Term, bool]:
    """One small-step reduction of λ_R."""

    # β-reduction.
    if term.tag == "app":
        fn, arg = term.value  # type: ignore[misc]
        assert isinstance(fn, Term)
        assert isinstance(arg, Term)
        if fn.tag == "lam":
            param, body = fn.value  # type: ignore[misc]
            assert isinstance(param, Var)
            assert isinstance(body, Term)
            return _substitute(body, param, arg), True
        new_fn, changed = _step(fn)
        if changed:
            return Term.app(new_fn, arg), True
        new_arg, changed = _step(arg)
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
        new_pair, changed = _step(pair)
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
        new_pair, changed = _step(pair)
        if changed:
            return Term.snd(new_pair), True
        return term, False

    # Pairs.
    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        new_first, changed = _step(first)
        if changed:
            return Term.pair(new_first, second), True
        new_second, changed = _step(second)
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
            return _substitute(l_branch, l_var, inner), True
        if scrut.tag == "inr":
            inner, _ = scrut.value  # type: ignore[misc]
            assert isinstance(inner, Term)
            return _substitute(r_branch, r_var, inner), True
        new_scrut, changed = _step(scrut)
        if changed:
            return Term.case(new_scrut, l_var, l_branch, r_var, r_branch), True
        return term, False

    # Injections.
    if term.tag == "inl":
        inner, right_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(right_ty, Type)
        new_inner, changed = _step(inner)
        if changed:
            return Term.inl(new_inner, right_ty), True
        return term, False

    if term.tag == "inr":
        inner, left_ty = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(left_ty, Type)
        new_inner, changed = _step(inner)
        if changed:
            return Term.inr(new_inner, left_ty), True
        return term, False

    # Abort reduces inside its argument.
    if term.tag == "abort":
        inner, target = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        assert isinstance(target, Type)
        new_inner, changed = _step(inner)
        if changed:
            return Term.abort(new_inner, target), True
        return term, False

    # Reflex reduces its subterm but is not eliminated.
    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        new_inner, changed = _step(inner)
        if changed:
            return Term.reflex(new_inner), True
        return term, False

    # Variables and constants are in normal form.
    if term.tag in {"var", "star"}:
        return term, False

    raise TypeError(f"unknown term tag in step: {term.tag!r}")


__all__ = ["normalize"]

