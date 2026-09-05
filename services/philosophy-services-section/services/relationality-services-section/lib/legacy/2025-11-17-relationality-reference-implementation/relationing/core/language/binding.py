"""
Binding between a variable and its type for λ_R contexts.
"""

from __future__ import annotations

from dataclasses import dataclass

from .terms import Var
from .types import Type


@dataclass
class Binding:
    """Associate a variable with its λ_R type."""

    var: Var
    ty: Type


__all__ = ["Binding"]

