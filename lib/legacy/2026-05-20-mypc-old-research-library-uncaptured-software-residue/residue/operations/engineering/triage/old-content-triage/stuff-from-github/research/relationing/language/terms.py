"""
λ_R terms and variables.
"""

from __future__ import annotations

from dataclasses import dataclass

from relationing.language.types import Type


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


__all__ = ["Var", "Term"]

