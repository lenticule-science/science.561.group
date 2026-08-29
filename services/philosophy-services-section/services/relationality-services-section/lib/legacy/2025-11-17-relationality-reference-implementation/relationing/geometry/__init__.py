"""
Public Relational Geometry entrypoint.

This module re-exports the :mod:`relationing.core.geometry` surface so
callers can import ``relationing.geometry`` in line with the Relational
Core layout.
"""

from __future__ import annotations

from relationing.core.geometry import (
    Discipline,
    EndomapFlow,
    Filter,
    FixedPointRegime,
    Flow,
    Nucleus,
    Regime,
    RelationalGeometry,
    flow_nucleus_compatible,
    flow_respects_laws,
    nucleus_respects_closure_laws,
    nucleus_respects_interior_laws,
    transport_flow_fixed_points,
    transport_nucleus_fixed_points,
)

__all__ = [
    "Discipline",
    "EndomapFlow",
    "Filter",
    "FixedPointRegime",
    "Flow",
    "Nucleus",
    "Regime",
    "RelationalGeometry",
    "nucleus_respects_closure_laws",
    "nucleus_respects_interior_laws",
    "flow_respects_laws",
    "flow_nucleus_compatible",
    "transport_flow_fixed_points",
    "transport_nucleus_fixed_points",
]
