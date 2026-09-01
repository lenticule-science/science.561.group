Finite implicational proof search
=================================

.. meta::
   :xref-spec: math/finite/language/finite_implicational_fragment, math/infinite/language/index (finite implicational fragment)
   :xref-code: code/library/structures/proof_search, code/core/language/typing, code/core/language/reduction
   :xref-tests: tests/library/test_library_proof_search, tests/core/language/test_language_typing_and_judgements

Statement
---------

This fragment isolates the finite, depth-bounded proof search for the
implicational fragment of *Relational Language* (*RelationalLanguage*):

- atomic types built from recognition atoms; and
- implication-only formulas ``A ⇒ B``.

The proof search procedure produces λ_R terms inhabiting implicational
types when they are semantically valid in the finite models considered.

Sketch
------

The detailed rules and metatheory for the implicational λ_R fragment
are developed in the Language notes. This file serves as an atomic
anchor tying that development to the executable proof-search helpers in
``relationing.library.structures.proof_search`` and their tests.
