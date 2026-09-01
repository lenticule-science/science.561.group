Relational Geometry
===================

A *Relational Geometry* (*RelationalGeometry*) equips *Relational Structure*
(*RelationalStructure*) with nucleus-like operators and a flow,
stated purely relationally, and to develop fixed-point substructures
and their interaction. The aggregate of these components is the
***Relational Geometry*** (*RelationalGeometry*) of the carrier.

.. meta::
   :since: 0.1.0


Relational Nuclei
-----------------

The Relational Nucleus definition and the fixed-point substructure
proposition are documented atomically in
:doc:`relational_nucleus`. On the implementation side they are
mirrored by :mod:`relationing.core.geometry.nucleus`, the
RelationalGeometry helpers, and the finite profile constructions
described in the geometry and profiles test docs.


Definition — ***Relational Geometry*** (*RelationalGeometry*)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A *Relational Geometry* is a ``RelationalStructure`` equipped with a
specified family of nuclei ``{ν_i}_i`` satisfying declared
interactions (for example, commuting ``ν_i ∘ ν_j = ν_j ∘ ν_i`` when
required).

.. todo::

   :phase: spec-math

   Extend this infinite specification with complete proofs for the
   RelationalGeometry axioms and derived laws, and cross-reference the
   finite witnesses under ``docs/math/finite/geometry`` that realise
   these axioms on explicit finite carriers.


Relational Flow
---------------

The definition of *Relational Flow* (*Flow*) together with the fixed-set,
compatibility, and transport results are documented atomically in
:doc:`nuclei_and_flows`. At the implementation level they are
witnessed by :mod:`relationing.core.geometry.flow`, the law checkers,
and the corresponding tests described in the geometry test docs.


Definition — ***Relational Geometry*** (Final)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A *Relational Geometry* is a ``RelationalStructure`` with chosen nuclei
and a flow ``F`` satisfying the Relational Flow Definition and any
stated completeness assumptions when fixed-point existence is
required.

.. todo::

   :phase: spec-math

   Make explicit which completeness and compatibility assumptions are
   required for the fixed-point existence and transport theorems, and
   relate them to the corresponding finite-profile constructions and
   checks in the finite Geometry and Physics specifications.


Derived Nucleus and Flow Laws
-----------------------------

Further derived laws for closure-like and interior-like nuclei and
their interaction with flows (for example, Closure Absorption, Interior
Distribution, fixed sets, fixed-point existence, transport, and
Temporal Closure) are collected in the following notes:

.. toctree::
   :maxdepth: 1

   nuclei_and_flows
   flow_fixed_sets_and_existence
   flow_nucleus_compatibility_and_transport
   derived_nucleus_and_flow_laws
   temporal_closure
   lemma_cyclic_flow_adjoint_collapse

Geometry contents
-----------------

.. toctree::
   :maxdepth: 1

   relational_nucleus
   nuclei_and_flows
   regimes_and_profiles
