"""Mathematical primitives used across per-note verification modules.

These are strictly-typed, shared building blocks. Add new primitives only
when at least two per-note modules need them — premature abstraction is
a known failure mode.

Modules:

- `poset`: Poset, OrderComplex (the order complex of a poset is a simplicial complex).
- `simplicial_complex`: SimplicialComplex with cells, faces, cohomology over Z.
- `cellular_sheaf`: CellularSheaf with stalks and restriction maps; cohomology computation.
"""

from .poset import Poset, OrderComplex
from .simplicial_complex import SimplicialComplex, Simplex
from .cellular_sheaf import CellularSheaf, ConstantSheaf
from .frame import PowersetFrame, FrameMorphism, restrict_with
from .frame_valued_sheaf import FrameValuedSheaf
from .dframe import DFrame, settling_dframe_at_clopen
from .closure_rule import ClosureRuleSystem, Rule, State, rule
from .substitution import (
    SubstitutionMatrix,
    FIBONACCI,
    THUE_MORSE,
    PADOVAN,
    TRIBONACCI,
    TETRANACCI,
    FIBONACCI_DEFAULT_VALUATION,
    THUE_MORSE_DEFAULT_VALUATION,
    PADOVAN_DEFAULT_VALUATION,
    TRIBONACCI_DEFAULT_VALUATION,
    TETRANACCI_DEFAULT_VALUATION,
)
from .bilattice import BilatticeValue, negate, negation_permutation

__all__ = [
    "Poset",
    "OrderComplex",
    "SimplicialComplex",
    "Simplex",
    "CellularSheaf",
    "ConstantSheaf",
    "PowersetFrame",
    "FrameMorphism",
    "restrict_with",
    "FrameValuedSheaf",
    "DFrame",
    "settling_dframe_at_clopen",
    "ClosureRuleSystem",
    "Rule",
    "State",
    "rule",
    "SubstitutionMatrix",
    "FIBONACCI",
    "THUE_MORSE",
    "PADOVAN",
    "TRIBONACCI",
    "TETRANACCI",
    "FIBONACCI_DEFAULT_VALUATION",
    "THUE_MORSE_DEFAULT_VALUATION",
    "PADOVAN_DEFAULT_VALUATION",
    "TRIBONACCI_DEFAULT_VALUATION",
    "TETRANACCI_DEFAULT_VALUATION",
    "BilatticeValue",
    "negate",
    "negation_permutation",
]
