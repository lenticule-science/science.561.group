Mechanics of Physics
====================

This section documents the ***Mechanics of Relational Physics***
(*Relational Mechanics*): global physical systems and profile-level
systems built from flows, nuclei, and observables, as implemented in
:mod:`relationing.physics`. It should be read alongside:

- **Formal mathematical specification** – :doc:`Relational Physics Spec <math/infinite/physics/index>`
  and the atomic spec fragments under ``docs/math/infinite/physics/``.
- **System code documentation** – per-class and per-helper docs for
  :mod:`relationing.core.physics` and profile builders under
  ``docs/code/core/physics/`` and ``docs/code/library/``. An index of
  the core Physics API is provided at :doc:`code/core/physics/index`,
  with one page per system or builder.
- **Test documentation** – Physics-layer and profile tests documented
  under ``docs/tests/core/physics/`` and related library test docs.


Contents
--------

.. toctree::
   :maxdepth: 3

   math/infinite/physics/index
   code/core/physics/index
   tests/core/physics/index

Mathematical background
-----------------------

For the full formal development of Relational Physics, including
profile-level reconstruction and profile towers, see:

- :doc:`Relational Physics Spec <math/infinite/physics/index>`

Code overview (API)
-------------------

.. automodule:: relationing.physics
   :members: Observable, RelationalPhysicalSystem,
             ProfilePhysicalSystem,
             profile_physical_system_from_filter,
             nested_profile_physical_system_from_filter
   :undoc-members:
   :show-inheritance:

Specification–implementation mapping
------------------------------------

The Physics-layer constructions in
:doc:`Relational Physics Spec <math/infinite/physics/index>` have the
following concrete realisations:

- The ``RelationalPhysicalSystem`` notion, bundling a
  RelationalGeometry with observables, is implemented by
  :class:`relationing.physics.RelationalPhysicalSystem`, whose
  ``structure``, ``flow``, ``nuclei``, and ``observables`` fields
  correspond to the components of ``RPhys`` in the notes.
- Observables, used to model measurement/idealisation in the Physics
  layer, are represented abstractly by
  :class:`relationing.physics.Observable`; concrete observable
  families (for example, nucleus- or flow-induced observables) can be
  defined as subclasses implementing this interface.
- Profile-level physical systems described in the ``ProfilePhysics``
  and ``Filter-Induced Reflexive Reconstruction`` sections are
  implemented by
  :class:`relationing.physics.ProfilePhysicalSystem`, which restricts
  a global :class:`RelationalPhysicalSystem` to a finite
  :class:`relationing.library.profiles.geometry.profiles.FiniteFixedProfile`
  of recognitions.
- The profile builders
  :func:`relationing.physics.profile_physical_system_from_filter` and
  :func:`relationing.physics.nested_profile_physical_system_from_filter`
  provide finite, executable counterparts to the Filter-induced
  reconstruction and Profile Tower theorems: given a Filter and a
  global system, they construct profile-level systems and nested
  profile towers whose structure and flow/nucleus behaviour match the
  restrictions described in the Physics notes.

Core Physics code index
-----------------------

.. toctree::
   :maxdepth: 1

   code/core/physics/index


Worked example — profile physics simulation
-------------------------------------------

A typical finite profile-level RelationalPhysics construction proceeds
by:

- choosing a finite carrier and RelationalStructure;
- defining a global RelationalPhysicalSystem with flow, nuclei, and
  observables;
- picking a Filter on recognitions and forming its finite fixed-point
  profile via the helpers in
  :mod:`relationing.profiles.geometry.profiles`; and
- restricting the global system to that profile using
  :func:`relationing.physics.profile_physical_system_from_filter`.

Nested profiles (profile towers) can then be explored via
:func:`relationing.physics.nested_profile_physical_system_from_filter`
by applying additional Filters on the finite Profile, in line with the
ProfilePhysics reconstruction described in the Relational Mathematics Specification.
