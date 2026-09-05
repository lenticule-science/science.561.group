"""
Explicit typing derivation trees for λ_R.

This module defines :class:`Derivation`, a structured witness of a
typing judgement ``Γ ⊢ t : A`` that mirrors the inference rules in
the Relational Language notes.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import List

from .context import Context
from .terms import Term
from .types import Type


@dataclass
class Derivation:
    """Explicit witness of a typing judgement Γ ⊢ t : A.

    Each node records:

    - the rule name (for example, ``var``, ``lam``, ``app``);
    - the context Γ used at this step;
    - the term ``t`` being typed;
    - the resulting type ``A``; and
    - premise derivations for the rule's premises.

    This mirrors the inference trees described in the Relational
    Mathematics Specification for the Language layer and can be used
    for debugging or explanatory output without affecting the core
    typing algorithm.
    """

    rule: str
    context: Context
    term: Term
    ty: Type
    premises: List["Derivation"]


__all__ = ["Derivation"]
