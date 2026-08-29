"""
Public Relational Physics entrypoint.

This module re-exports the :mod:`relationing.core.physics` surface so
callers can import ``relationing.physics`` in line with the Relational
Core layout.
"""

from __future__ import annotations

from relationing.core.physics import (
    Observable,
    RelationalPhysicalSystem,
    ProfilePhysicalSystem,
    profile_physical_system_from_filter,
    nested_profile_physical_system_from_filter,
)

__all__ = [
    "Observable",
    "RelationalPhysicalSystem",
    "ProfilePhysicalSystem",
    "profile_physical_system_from_filter",
    "nested_profile_physical_system_from_filter",
]

