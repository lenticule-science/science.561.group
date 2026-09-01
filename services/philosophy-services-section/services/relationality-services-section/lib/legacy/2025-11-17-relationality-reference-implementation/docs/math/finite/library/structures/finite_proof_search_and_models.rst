Finite proof search and models
==============================

.. meta::
   :xref-spec: math/infinite/language/index (finite fragments), math/finite/library/structures/morphisms_and_substructures
   :xref-code: code/library/structures/proof_search, code/library/structures/syntactic_model, code/library/structures/semantics, code/library/structures/unary_explorer
   :xref-tests: tests/library/test_library_proof_search, tests/library/test_syntactic_model, tests/library/test_library_morphisms_and_semantics

This file records, at a high level, the finite-model and finite-proof-
search results realised in the ``relationing.library.structures``
modules:

- depth-bounded proof search for implicational λ_R fragments;
- finite syntactic models and their agreement with semantic entailment
  on small fragments; and
- finite explorations of unary ``A ⇒ A`` operators and Disciplines.

More atomic statements are documented in:

.. toctree::
   :maxdepth: 1

   finite_implicational_proof_search
   unary_triangle_and_disciplines

The detailed development remains in the core Language and Structure
notes; this file and its subpages provide anchors connecting those notes
to the executable finite witnesses in the library and their tests.
