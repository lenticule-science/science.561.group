Relational Physics
==================

A *Relational Physics* (*RelationalPhysics*) abstracts a particular class of Disciplines whose
compatibility conditions hold with all nuclei and the flow. Such
Disciplines (*Filters*) induce stable recognitional regions
(*Profiles*) that inherit *Relational Structure* (*RelationalStructure*),
*Relational Language* (*RelationalLanguage*), *Relational Geometry*
(*RelationalGeometry*), and *Relational Physics* (*RelationalPhysics*)
internally.

.. meta::
   :since: 0.1.0


Filters and Profile tower
-------------------------

The definitions and basic propositions about Filters and Profiles, the
restriction of Reflex to profiles, Filter-induced reconstruction, and
Composite / Nested Profiles are documented atomically in the following
notes:

.. toctree::
   :maxdepth: 1

   filters_and_profiles
   profile_structure_and_reflex
   filter_induced_reconstruction
   composite_and_nested_profiles


Profile-induced Relational Physics
----------------------------------

.. toctree::
   :maxdepth: 1

   relational_physical_system
   profile_physical_system
   profile_geometry
   profile_language_soundness
   profile_physics_soundness
   lemma_cyclic_profile_physics_time_symmetric

.. todo::

   :phase: spec-math

   Complete the infinite Profile tower and soundness proofs at this
   level and make explicit how the finite ProfileGeometry and
   ProfilePhysics specifications under ``docs/math/finite/geometry``
   and ``docs/math/finite/physics`` arise by filtering an infinite
   RelationalPhysicalSystem along Finite Profiles.
