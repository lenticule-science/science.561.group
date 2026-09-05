"""
Relational Geometry layer (Python).

This package implements the Geometry‑level abstractions from the
Relational Mathematics Specification (see the math docs under
``docs/math/core/geometry/``; the legacy
``docs/relational_foundations/geometry.rst`` tree is kept only for
backwards compatibility of links):

* nucleus‑like endomaps on recognitions (``Nucleus``);
* relational flows (``Flow`` and ``EndomapFlow``) expressing directed
  evolution; and
* Disciplines, Filters, and Regimes capturing fixed‑point substructures
  induced by unary endomaps that commute with nuclei and flows.

Concrete nuclei, flows, and finite profiles are provided in the
``relationing.library`` and ``relationing.profiles`` packages; this
module exposes the core interfaces.
"""

from __future__ import annotations

from .nucleus import Nucleus
from .flow import Flow
from .endomap_flow import EndomapFlow
from .discipline import Discipline
from .filter import Filter
from .regime_base import Regime
from .regime import FixedPointRegime
from .relational_geometry import RelationalGeometry
from .nucleus_closure_laws import nucleus_respects_closure_laws
from .nucleus_interior_laws import nucleus_respects_interior_laws
from .flow_laws import flow_respects_laws
from .flow_nucleus_compatibility import flow_nucleus_compatible
from .transport_flow_fixed_points import transport_flow_fixed_points
from .transport_nucleus_fixed_points import transport_nucleus_fixed_points

__all__ = [
    "Nucleus",
    "Flow",
    "EndomapFlow",
    "Discipline",
    "Regime",
    "FixedPointRegime",
    "Filter",
    "RelationalGeometry",
    "nucleus_respects_closure_laws",
    "nucleus_respects_interior_laws",
    "flow_respects_laws",
    "flow_nucleus_compatible",
    "transport_flow_fixed_points",
    "transport_nucleus_fixed_points",
]
