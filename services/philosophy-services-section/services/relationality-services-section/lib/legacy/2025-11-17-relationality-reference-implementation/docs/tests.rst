Test documentation
==================

This page provides an overview of the main test modules used to
instantiate fragments of the Relational Mathematics Specification on
finite examples. It is intended as a companion to:

- the formal mathematical specification under ``docs/math/``, and
- the system code documentation under ``docs/code/`` and the
  Structure/Language/Geometry/Physics layer docs.

More granular, per-test documentation (one file per test module) lives
under ``docs/tests/`` and carries explicit cross-references back to the
spec and code metadata for each test. At present all tests are finite;
future transfinite tests will be documented in the same style once the
corresponding transfinite spec and APIs land.

Test index
----------

.. toctree::
   :maxdepth: 2

   tests/core/structure/index
   tests/core/language/index
   tests/core/geometry/index
   tests/core/physics/index
   tests/library/index

Structure tests
---------------

The Structure layer tests finite carriers, iteration, quotients, and
Heyting algebra properties in the ***Algebra of Relational
Structure*** (*Relational Algebra*).

.. todo::

   :phase: test

   Continue atomising tests so that each module focuses on a tightly
   scoped fragment (ideally one concept or law), and ensure every test
   doc under ``docs/tests/*`` carries ``.. meta::`` with complete
   ``:xref-spec:`` and ``:xref-code:`` entries linking back to the
   relevant spec atoms and APIs.

.. _tests-test_carrier_two_element_heyting:

- ``tests/core/structure/test_carrier_two_element_heyting.py`` – the canonical
  two-element Heyting algebra carrier used across layers; checks the
  Heyting laws and residuation properties on the two-element model.

.. _tests-test_finite_powerset_heyting:

- ``tests/core/structure/test_finite_powerset_heyting.py`` – finite
  powerset Heyting algebras built from exclusion atoms; checks
  meet/join/imp and residuation on finite powerset carriers.

.. _tests-test_finite_powerset_semantics:

- ``tests/core/structure/test_finite_powerset_semantics.py`` – type
  evaluation over finite powerset Heyting algebras, validating the way
  λ_R types interpret into powerset carriers as per the Heyting Algebra
  theorem.

.. _tests-test_structure_origination_and_exclusion:

- ``tests/core/structure/test_structure_origination_and_exclusion.py`` –
  origination from Relationlessness, ExclusionRecognition, and
  ReflexEmergence.

.. _tests-test_structure_iteration_and_quotient:

- ``tests/core/structure/test_structure_iteration_and_quotient.py`` –
  Reflex step iteration, baseline limits, eventual equivalence, and
  the EventualEquivalenceQuotient helpers.

Language tests
--------------

The Language layer tests typing, normalization, and soundness.

.. _tests-language-preservation:

Language preservation and progress tests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``tests/core/language/test_language_typing_and_judgements.py`` –
  λ_R typing rules, reduction, and judgemental equivalence on finite
  examples. In particular, these tests witness the Preservation and
  Progress theorems by checking that well-typed terms remain
  well-typed and normalise.

.. _tests-language-soundness:

Language soundness and logical relations tests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``tests/core/language/test_language_soundness_semantics.py`` –
  semantic soundness of typing and sequent validity in finite
  Relational models. These tests witness the Soundness and
  Fundamental Theorem of Logical Relations results from the Language
  notes.

.. _tests-language-syntactic-model:

Language syntactic model and completeness tests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``tests/library/test_syntactic_model.py`` – the finite syntactic
  model and agreement between syntactic and semantic entailment on
  small fragments, instantiating the Syntactic Structure and
  Completeness results.
- ``tests/library/test_library_proof_search.py`` – finite
  implicational proof search in the λ_R fragment.
- ``tests/library/test_unary_explorer.py`` – unary ``A ⇒ A``
  exploration and triangle phenomena.
- ``tests/library/test_semantics_unary_disciplines.py`` –
  λ→Discipline interpretation, LambdaEndomap, and unary Disciplines
  commuting with Reflex.

Geometry tests
--------------

The Geometry layer tests nuclei, flows, and finite fixed-point profiles:

- ``tests/core/geometry/test_nucleus_laws_on_two_element_ha.py`` –
  finite nuclei and Relational Nucleus laws on a two-element Heyting
  algebra.
- ``tests/core/geometry/test_flow_laws_and_endomap_flow_wrapper.py`` –
  finite Relational Flow laws and the EndomapFlow wrapper on a
  two-element Heyting algebra.
- ``tests/core/geometry/test_discipline_commutes_with_nucleus_and_flow.py`` –
  Discipline–nucleus–flow compatibility and fixed-point transport.
- ``tests/core/geometry/test_profiles_from_filters_and_disciplines.py`` –
  Filters, finite fixed-point profiles, and profile-level
  compatibility of flows and nuclei.

Physics tests
-------------

The Physics layer tests physical systems and profile-level physics:

- ``tests/core/physics/test_relational_physical_system_evolve.py`` –
  RelationalPhysicalSystem evolution on a two-element carrier.
- ``tests/core/physics/test_profile_physical_system_from_filter_and_nested.py`` –
  ProfilePhysicalSystem from Filters, nested profiles, and consistency
  with ``finite_filter_fixed_profile``.

Library and morphism tests
--------------------------

Additional tests exercise library-level helpers that support the core
layers:

- ``tests/library/test_library_morphisms_and_semantics.py`` – finite
  RelationalMorphisms and semantic properties of morphisms between
  models.
- ``tests/library/test_semantics_unary_disciplines.py`` – λ→Discipline
  interpretation, LambdaEndomap, and unary Disciplines commuting with
  Reflex.
