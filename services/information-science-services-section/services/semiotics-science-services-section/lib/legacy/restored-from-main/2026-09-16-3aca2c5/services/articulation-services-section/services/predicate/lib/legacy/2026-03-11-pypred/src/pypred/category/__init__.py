"""Finite categorical primitives for predication-native computation."""

from .bilattice import (
    BilatticeValue,
    knowledge_join,
    knowledge_leq,
    knowledge_meet,
    negate,
    negation_permutation,
    truth_join,
    truth_leq,
    truth_meet,
)
from .cellular_sheaf import CellularSheaf, ConstantSheaf
from .closure_rule import ClosureRuleSystem, Rule, State, rule
from .dframe import DFrame, settling_dframe_at_clopen
from .frame import FrameMorphism, PowersetFrame, restrict_with
from .frame_valued_sheaf import FrameValuedSheaf
from .poset import OrderComplex, Poset
from .simplicial_complex import Simplex, SimplicialComplex
from .substitution import (
    FIBONACCI,
    FIBONACCI_DEFAULT_VALUATION,
    PADOVAN,
    PADOVAN_DEFAULT_VALUATION,
    TETRANACCI,
    TETRANACCI_DEFAULT_VALUATION,
    THUE_MORSE,
    THUE_MORSE_DEFAULT_VALUATION,
    TRIBONACCI,
    TRIBONACCI_DEFAULT_VALUATION,
    SubstitutionMatrix,
)

__all__ = [
    "BilatticeValue",
    "CellularSheaf",
    "ClosureRuleSystem",
    "ConstantSheaf",
    "DFrame",
    "FIBONACCI",
    "FIBONACCI_DEFAULT_VALUATION",
    "FrameMorphism",
    "FrameValuedSheaf",
    "OrderComplex",
    "PADOVAN",
    "PADOVAN_DEFAULT_VALUATION",
    "Poset",
    "PowersetFrame",
    "Rule",
    "Simplex",
    "SimplicialComplex",
    "State",
    "SubstitutionMatrix",
    "TETRANACCI",
    "TETRANACCI_DEFAULT_VALUATION",
    "THUE_MORSE",
    "THUE_MORSE_DEFAULT_VALUATION",
    "TRIBONACCI",
    "TRIBONACCI_DEFAULT_VALUATION",
    "knowledge_join",
    "knowledge_leq",
    "knowledge_meet",
    "negate",
    "negation_permutation",
    "restrict_with",
    "rule",
    "settling_dframe_at_clopen",
    "truth_join",
    "truth_leq",
    "truth_meet",
]
