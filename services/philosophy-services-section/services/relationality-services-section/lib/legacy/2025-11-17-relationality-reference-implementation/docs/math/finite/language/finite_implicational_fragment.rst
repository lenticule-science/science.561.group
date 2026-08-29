Finite implicational λ_R fragment
=================================

.. meta::
   :xref-spec: math/infinite/language/index (Implicational fragment)
   :xref-code: code/core/language/types, code/core/language/terms, code/core/language/typing, code/core/language/reduction, code/library/structures/proof_search
   :xref-tests: tests/core/language/test_language_typing_and_judgements, tests/library/test_library_proof_search

Statement
---------

The finite implicational fragment of *Relational Language*
(*RelationalLanguage*) restricts :math:`\lambda_R` to:

- atomic types built from recognition atoms; and
- implication-only formulas :math:`A \Rightarrow B`.

On this fragment, the core typing and reduction operations and the
library proof-search helpers produce finite, depth-bounded witnesses
to inhabitation and soundness: whenever the fragment deems an
implicational type inhabited, the proof-search procedure produces a
:math:`\lambda_R` term that typechecks at that type in the core
Language.

This fragment is exercised concretely in the core language typing tests
and in the library proof-search tests listed above.
