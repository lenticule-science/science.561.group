Relational Structure
====================

The goal of this section is to derive the core algebraic data of
relationality from Relationlessness and Reflex and obtain a Heyting
algebra of recognitions. The central notion is
***Relational Structure*** (*RelationalStructure*), whose code
counterpart is the :class:`relationing.core.structure.RelationalStructure`
carrier with a designated Reflex endomap.

.. meta::
   :since: 0.1.0

.. todo::

   :phase: spec-math

   Re-order the Structure subsections and their toctrees to follow the
   actual order of mathematical derivation: start from
   ***Relationlessness*** and Reflex, then Recognitions and Order,
   then Heyting structure and quotients, and only then morphisms and
   substructures. Currently this index discusses morphisms before
   Relationlessness and Order, which does not reflect the conceptual
   dependency order used in the notes.


Origination
~~~~~~~~~~~

The Relationlessness / Reflex / Articulation story and the Reflex
Emergence lemma are documented atomically in
:doc:`definition_relationlessness`, :doc:`definition_reflex`,
:doc:`theorem_articulation`, :doc:`definition_exclusion_recognition`,
and :doc:`lemma_reflex_emergence`. A narrative overview appears in
:doc:`origination_and_reflex_emergence`, with executable counterparts
in the Structure origination modules and tests in the origination test
suite.


Reflex Iteration and Derived Behaviours
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reflex-step iteration, stabilisation depth and persistence, baseline
convergence, and the eventual-equivalence relation ``x ≡_S y`` are
developed in detail in :doc:`iteration_and_equivalence`. That fragment
contains the Iteration theorem, the definitions of stabilisation and
baseline convergence, and the proof that ``≡_S`` is an equivalence
relation, together with references to the finite iteration/quotient
helpers and tests.

Existence schemas for persistent recognitions and fixed points are
treated alongside monotone endomaps in
:doc:`monotone_endomaps_and_fixed_points`, and in the corresponding
Geometry notes on fixed-point existence.


Quotients of Reflex Iteration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The eventual-equivalence relation ``x ≡_S y`` defined above can, under
additional hypotheses on the Reflex step ``S``, be used to form a
Heyting quotient. The full statement and proof are recorded in the
atomic fragment :doc:`heyting_quotient_of_reflex_endomorphism`, which
also serves as the anchor for corresponding finite witnesses and
helpers.


Recognitions and Order
~~~~~~~~~~~~~~~~~~~~~~

The basic Recognitions, Order, Extremes, and Preorder development is
documented atomically in :doc:`preorder_and_order`. Those definitions
underpin the lattice and Heyting constructions that follow in this
file. The additional lattice structure and Exclusion behaviour are
spelled out in the atomic fragments
:doc:`definition_meet`, :doc:`definition_join`,
:doc:`proposition_bounded_distributive_lattice`,
:doc:`definition_inclusion`, :doc:`definition_exclusion`, and
:doc:`lemma_exclusion_symmetry`.


Implication and Heyting Structure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The definition of implication by residuation, the Residuation Law
Lemma, the Heyting Algebra theorem, and the definition of
Relational Negation are documented atomically in
:doc:`heyting_algebra_theorem`. The basic Recognitions / Order /
Preorder development appears in :doc:`preorder_and_order`; the
canonical two-element Heyting carrier is documented as a finite
Structure witness under
:doc:`math/finite/library/carriers/two_element_heyting_carrier`.



Fixed Points and Stabilisation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For monotone endomaps and fixed points, see the atomic fragment
``monotone_endomaps_and_fixed_points``:

.. toctree::
   :maxdepth: 1

   monotone_endomaps_and_fixed_points


Morphisms and Substructures
~~~~~~~~~~~~~~~~~~~~~~~~~~~

For RelationalMorphisms and Substructures, see the atomic fragment
``relational_morphisms_and_substructures``:

.. toctree::
   :maxdepth: 1

   relational_morphisms_and_substructures


RelationalStructure
~~~~~~~~~~~~~~~~~~~

For the RelationalStructure tuple, see the atomic fragment
``relational_structure``:

.. toctree::
   :maxdepth: 1

   relational_structure


Structure contents
~~~~~~~~~~~~~~~~~~

The atomic Structure fragments referenced above are collected here for
navigation:

.. toctree::
   :maxdepth: 1

   origination_and_reflex_emergence
   lemma_reflex_emergence
   definition_relationlessness
   definition_reflex
   theorem_articulation
   definition_exclusion_recognition
   definition_recognition
   definition_order
   definition_extremes
   lemma_preorder
   preorder_and_order
   definition_meet
   definition_join
   proposition_bounded_distributive_lattice
   definition_inclusion
   definition_exclusion
   lemma_exclusion_symmetry
   heyting_algebra_theorem
   iteration_and_equivalence
   monotone_endomaps_and_fixed_points
   definition_monotone_endomap
   definition_fixed_point
   lemma_idempotence_at_fixed_points
   definition_relational_logarithm
   lemma_logarithm_join_construction
   proposition_relational_logarithm_uniqueness
   lemma_relational_logarithm_monotone
   lemma_relational_logarithm_triangle
   theorem_relational_logarithm_preserves_finite_lattice
   definition_relational_exponent
   lemma_relational_exponent_join_construction
   proposition_relational_exponent_uniqueness
   lemma_relational_exponent_monotone
   lemma_relational_exponent_triangle
   theorem_relational_exponent_preserves_meets
   heyting_quotient_of_reflex_endomorphism
   relational_morphisms_and_substructures
   relational_structure
