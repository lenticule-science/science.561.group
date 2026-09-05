"""
Public Profiles entrypoint.

This mirrors :mod:`relationing.library.profiles` but is exposed as
``relationing.profiles`` to align with the layered layout used in the
Relational Mathematics Specification.
"""

from __future__ import annotations

from relationing.library.profiles import geometry_profiles

__all__ = [
    "geometry_profiles",
]
