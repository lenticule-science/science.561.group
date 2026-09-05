Unary A ⇒ A Operators
======================

.. meta::
   :phase: doc-module
   :xref-spec: math/infinite/language/index (unary fragment triangle)
   :xref-code: unary
   :xref-tests: tests

This page documents the small unary ``A ⇒ A`` operators used in the
Language–Geometry bridge and the finite exploration helpers in
``relationing.library.structures.unary_explorer``.

Mathematical background
-----------------------

Unary ``A ⇒ A`` endomaps play a distinguished role in the Relational
Core notes as candidates for Disciplines on recognitions: monotone,
ρ‑compatible endomaps that commute with chosen nuclei and flows on a
RelationalGeometry. On finite fragments, these operators can be
explored systematically by restricting to:

- a single atom ``p`` (or a small list of atoms);
- bounded type depth for implicational types ``A ⇒ A``; and
- finite Heyting models built from powerset carriers.

The Relational Language notes treat such operators as closed unary
λ_R inhabitants of types ``A ⇒ A`` whose semantics agree across:

- finite Relational powerset models,
- the finite syntactic model, and
- depth‑bounded proof search.

Code overview
-------------

The exploration helpers live in
``relationing.library.structures.unary_explorer``:

.. automodule:: relationing.library.structures.unary_explorer
   :members: UnaryFragment, UnaryOpAnalysis, find_unary_ops, find_unary_ops_in_models, triangle_unary_ops, triangle_unary_disciplines_over_atom, triangle_unary_disciplines
   :undoc-members:
   :show-inheritance:

The full set of library structures (proof search, syntactic models,
semantics, unary exploration, and morphisms) is documented in the
library structures index:

.. toctree::
   :maxdepth: 1

   code/library/structures/index

The key components are:

- :class:`relationing.library.structures.unary_explorer.UnaryFragment`
  packages the atom name, type depth, model height, and proof‑search
  depth used to explore unary ``A ⇒ A`` candidates.
- :func:`relationing.library.structures.unary_explorer.find_unary_ops`
  and :func:`relationing.library.structures.unary_explorer.find_unary_ops_in_models`
  enumerate implicational types ``A ⇒ A`` over the fragment and
  record, for each candidate, whether:

  - it is semantically valid in all supplied finite Heyting models;
  - it is top in the finite syntactic model; and
  - it is inhabited by finite proof search.

- :func:`relationing.library.structures.unary_explorer.triangle_unary_ops`
  further filters to those candidates where validity, top‑ness, and
  inhabitation coincide (the “Reflex triangle”), and
  :func:`relationing.library.structures.unary_explorer.triangle_unary_disciplines`
  interprets their canonical inhabitants as
  :class:`relationing.geometry.Discipline`\ s on a given
  :class:`relationing.structure.RelationalStructure`.

Language–geometry bridge
------------------------

For a fixed fragment and a family of finite Heyting models, the
triangle helpers connect the Language, Structure, and Geometry layers:

- Proof search and syntactic entailment:

  - :mod:`relationing.library.structures.proof_search` implements a
    depth‑bounded inhabitation search over implicational types
    :func:`relationing.library.structures.proof_search.is_implicational`,
    :func:`relationing.library.structures.proof_search.find_term`.
  - :mod:`relationing.library.structures.syntactic_model` provides a
    finite syntactic model for comparing types up to λ_R
    equivalence.

- Semantic validity in models:

  - :mod:`relationing.library.structures.semantics` interprets λ_R
    types and terms in finite Relational powerset models and checks
    sequent validity and typing soundness.

- Geometry‑level Disciplines:

  - :class:`relationing.library.structures.semantics.LambdaEndomap`
    and the λ→Discipline helpers
    (:func:`relationing.library.structures.semantics.interpret_unary_lambda_as_endomap`,
    :func:`relationing.library.structures.semantics.typed_unary_lambda_as_endomap`,
    :func:`relationing.library.structures.semantics.interpret_closed_top_arrow_as_discipline`,
    :func:`relationing.library.structures.semantics.interpret_closed_atom_arrow_as_discipline`)
    interpret closed unary λ_R inhabitants as Disciplines that
    commute with Reflex and, in examples, with chosen nuclei and
    flows.

  - :func:`relationing.library.structures.unary_explorer.triangle_unary_disciplines`
    applies these helpers systematically to all triangle‑satisfying
    unary operators in a fragment, yielding a finite family of
    Disciplines on a :class:`relationing.structure.RelationalStructure`.

Tests and examples
------------------

The unary exploration machinery is exercised by:

- ``tests/test_library_proof_search_and_unary_explorer.py``, which
  checks that:

  - the implicational fragment proof search finds well‑typed λ_R
    inhabitants for simple goals such as ``p ⇒ p``; and
  - triangle operators returned by
    :func:`triangle_unary_ops` have canonical inhabitants that are
    syntactically unary λ‑abstractions.

- ``tests/library/test_semantics_unary_disciplines.py``, which validates the
  λ→Discipline interpretation and the Language–Geometry bridge by
  checking that:

  - :class:`LambdaEndomap` instances derived from closed top- and
    atom‑arrow inhabitants act as identity Disciplines on a
    two‑element carrier;
  - these Disciplines commute with the structure’s Reflex endomap via
    :func:`endomap_commutes_with_structure_reflex`; and
  - Disciplines produced by
    :func:`triangle_unary_disciplines` on the same finite carrier
    also commute with Reflex.

Together, these tests instantiate the fragment‑level equivalence
between syntactic provability, semantic validity in finite Heyting
models, syntactic‑model top‑ness, and the existence of λ_R
inhabitants that induce Disciplines in the Geometry layer.
