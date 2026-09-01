"""
One-step reduction traces for λ_R.

This module defines :class:`ReductionStep`, a labelled small-step
transition used by ``normalize_with_trace`` to record reduction
sequences.
"""

from __future__ import annotations

from dataclasses import dataclass

from .terms import Term


@dataclass(frozen=True)
class ReductionStep:
    """One labelled small-step reduction t → t′.

    Each step records the source term, the resulting term, and a
    coarse rule label such as ``beta``, ``fst-pair``, ``case-inl``,
    or ``reflex-cong`` that mirrors the reduction rules in the
    Relational Language notes.
    """

    before: Term
    after: Term
    rule: str


__all__ = ["ReductionStep"]
