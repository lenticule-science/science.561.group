"""
Regimes and fixed-point constructions.

This module re-exports Regime-related notions from the Relational
Geometry layer, making it clear where fixed-point semantics live.
"""

from __future__ import annotations

from relationing.geometry import FixedPointRegime, Regime

__all__ = ["Regime", "FixedPointRegime"]
