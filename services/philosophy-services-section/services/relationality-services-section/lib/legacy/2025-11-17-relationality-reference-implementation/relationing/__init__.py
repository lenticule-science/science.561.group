"""
Python reference implementation of Relationality.

The :mod:`relationing` package is organised along the four-part
structure of the Relationality notes and their induced profile
constructions:

- structure:  global RelationalStructure and Heyting carriers
- language:   λ_R syntax, typing, reduction
- geometry:   nuclei, flows, disciplines, regimes
- physics:    RelationalPhysicalSystem and profile-level systems
- structures: constructed RelationalStructures (semantics, R_Γ, etc.)
- filters:    Filter/disciplines slots for inducing profiles
- profiles:   profile-level geometry and physics
"""

from . import filters, geometry, language, physics, profiles, structure, structures

__version__ = "0.2.0"

__all__ = [
    "structure",
    "language",
    "geometry",
    "physics",
    "structures",
    "filters",
    "profiles",
    "__version__",
]
