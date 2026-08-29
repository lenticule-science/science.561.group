Dynamics of Geometry
====================

This section documents the ***Dynamics of Relational Geometry***
(*Relational Dynamics*): nuclei, flows, Disciplines, Filters, and
profiles describing how recognitions evolve and where their fixed
points lie. It should be read alongside:

- **Formal mathematical specification** – :doc:`Relational Geometry Spec <math/infinite/geometry/index>`
  and the atomic spec fragments under ``docs/math/infinite/geometry/``.
- **System code documentation** – per-function and per-dataclass docs for
  :mod:`relationing.core.geometry` and related helpers under
  ``docs/code/core/geometry/`` and ``docs/code/library/``.
- **Test documentation** – Geometry-layer and profile tests documented under
  ``docs/tests/core/geometry/`` and ``docs/tests/library/``.


Contents
--------

.. toctree::
   :maxdepth: 3

   math/infinite/geometry/index
   code/core/geometry/index
   tests/core/geometry/index

Mathematical background
-----------------------

For the full formal development of Relational Geometry (nuclei, flows,
fixed-point substructures, and derived laws), see:

- :doc:`Relational Geometry Spec <math/infinite/geometry/index>`

Code overview
-------------

**Structures (geometry layer)**

.. automodule:: relationing.geometry
   :members: Nucleus, Flow, Discipline, Filter, Regime, FixedPointRegime
   :undoc-members:
   :show-inheritance:

**Core geometry modules**

.. toctree::
   :maxdepth: 1

   code/core/geometry/index

**Regimes, Filters, and Profiles**

.. automodule:: relationing.library.profiles.geometry.profiles
   :members: FiniteFixedProfile, finite_filter_fixed_profile, finite_discipline_fixed_profile,
             is_filter_reflex_compatible, is_discipline_filter_compatible,
             finite_profile_from_step_fixed_points, composite_profile_from_filters,
             nested_profile_from_filters
   :undoc-members:

The underlying profile helpers are documented in more detail in the
library profiles index:

.. toctree::
   :maxdepth: 1

   code/library/profiles/index

**Profiles and systems**

Finite profiles and profile-level systems are built by combining
Filters/Disciplines with the profile geometry and physics helpers in
``relationing.library.profiles.geometry.profiles`` and
``relationing.physics``. See the usage and mapping docs for higher-
level examples tied to the Relational Mathematics Specification.

Language–geometry bridge
-------------------------

Unary λ_R terms whose semantics are λ_R-definable, ρ-compatible
endomaps on recognitions can be viewed as concrete Disciplines in the
geometry layer. In particular, the
``relationing.library.structures.semantics.LambdaEndomap`` helper
produces values that satisfy the :class:`relationing.geometry.Discipline`
interface, and tests check that the λ_R identity and Reflex inhabitants
commute with example nuclei and flows on small finite carriers. Using
``finite_discipline_fixed_profile`` and
:class:`relationing.geometry.FixedPointRegime`, these λ_R-defined
Disciplines induce Regimes and finite profiles whose elements coincide
with the fixed-point sets used in the hand-crafted examples, alongside
the existing ``finite_filter_fixed_profile`` construction for Filters.

The conceptual role previously played by a concrete unary register
module is now taken by the generic unary exploration machinery in
``relationing.library.structures.unary_explorer`` together with explicit
finite model families and profile constructions; see
``relationing.library.structures.unary_explorer.UnaryFragment`` and
``relationing.library.structures.unary_explorer.triangle_unary_disciplines``
for the bridge from unary λ_R terms to Disciplines.


.. _impl-geometry-flows:

Flow laws and fixed sets (implementation)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Flow abstraction and its finite law checkers
(:class:`relationing.geometry.Flow`,
:class:`relationing.geometry.EndomapFlow`,
and :func:`relationing.geometry.flow_respects_laws`) realise the flow
axioms stated in the Relational Geometry notes. Their behaviour is
exercised in the geometry tests under
``tests/core/geometry/test_flow_laws_and_endomap_flow_wrapper.py``
and ``tests/core/geometry/test_profiles_geometry.py``, where concrete
flows on two-element and profile carriers are checked for
lax-idempotence, directionality, and fixed-set closure.
