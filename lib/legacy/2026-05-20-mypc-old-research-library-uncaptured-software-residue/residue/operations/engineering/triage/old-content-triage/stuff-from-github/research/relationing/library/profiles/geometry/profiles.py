"""
Filters and finite profiles.

This module builds on the Geometry layer to provide concrete finite
profiles: stable domains of recognitions induced by Filters, in the
spirit of the Profile and Composite Profile constructions described in
the Relationality notes.
"""

from __future__ import annotations

from relationing.core.structure import HeytingAlgebra

from .finite_profile import FiniteFixedProfile
from .finite_profile_from_discipline import finite_discipline_fixed_profile
from .finite_profile_from_filter import finite_filter_fixed_profile
from .finite_profile_from_step_fixed_points import (
    finite_profile_from_step_fixed_points,
)
from .filter_reflex_compatibility import is_filter_reflex_compatible
from .discipline_filter_compatibility import is_discipline_filter_compatible
from .composite_profile_from_filters import composite_profile_from_filters
from .nested_profile_from_filters import nested_profile_from_filters


__all__ = [
    "FiniteFixedProfile",
    "finite_filter_fixed_profile",
    "finite_discipline_fixed_profile",
    "is_filter_reflex_compatible",
    "is_discipline_filter_compatible",
    "finite_profile_from_step_fixed_points",
    "composite_profile_from_filters",
    "nested_profile_from_filters",
    "HeytingAlgebra",
]
