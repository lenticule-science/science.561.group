"""
Python reference implementation of the Treatise on Relationality.

The package is organised along the four-part structure of TREATISE.md:

- structure: RelationalStructure and Heyting algebra core
- language:   λ_R syntax and typing skeleton
- geometry:   nuclei, flow, disciplines, regimes
- physics:    RelationalPhysicalSystem and observables
"""

from . import structure, language, geometry, physics

__all__ = ["structure", "language", "geometry", "physics"]

