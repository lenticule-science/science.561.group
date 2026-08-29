"""
Relational Physics layer (Python).

This package provides a thin executable layer for the Physics‑level
notions in the Relational Core notes (see
``docs/relational_core/physics.rst``; the legacy
``docs/relational_foundations/physics.rst`` tree is kept only for
backwards compatibility of links).  It packages:

* ``RelationalPhysicalSystem`` values built from a
  ``RelationalStructure``, flow, nuclei, and observables;
* ``ProfilePhysicalSystem`` values obtained by restricting a system to
  a finite profile of recognitions; and
* convenience builders that construct profile‑level systems from
  Filters, mirroring the Filter‑induced reconstruction and Profile
  tower results in the notes.

Concrete carriers, Filters, and example profiles live under
``relationing.library`` and ``relationing.profiles``.
"""

from __future__ import annotations

from .observable import Observable
from .system import RelationalPhysicalSystem
from .profile_system import ProfilePhysicalSystem
from .profile_physical_system_from_filter import profile_physical_system_from_filter
from .nested_profile_physical_system_from_filter import (
    nested_profile_physical_system_from_filter,
)

__all__ = [
    "Observable",
    "RelationalPhysicalSystem",
    "ProfilePhysicalSystem",
    "profile_physical_system_from_filter",
    "nested_profile_physical_system_from_filter",
]
