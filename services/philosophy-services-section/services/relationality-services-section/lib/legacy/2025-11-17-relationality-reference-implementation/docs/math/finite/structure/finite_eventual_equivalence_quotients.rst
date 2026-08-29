Finite eventual-equivalence quotients
=====================================

.. meta::
   :xref-spec: math/infinite/structure/iteration_and_equivalence, math/infinite/structure/heyting_quotient_of_reflex_endomorphism
   :xref-code: code/core/structure/eventual_equivalence_quotient, code/core/structure/build_eventual_equivalence_quotient, code/core/structure/heyting_ops_respect_eventual_equivalence, code/core/structure/implication_quotient_table, code/core/structure/implication_total_on_quotient
   :xref-tests: tests/core/structure/test_structure_iteration_and_quotient

Statement
---------

Finite eventual-equivalence and quotient helpers provide concrete
finite instances of the Heyting quotient results from the infinite
Structure notes. On a finite carrier:

- the eventual-equivalence relation ``≡_S`` can be computed by
  examining finitely many iterates of ``S``; and
- the quotient ``R / ≡_S`` and its Heyting-structure operations can
  be constructed and checked explicitly.

The tests listed above exercise these helpers on small monotone steps
and finite Heyting carriers, instantiating the quotient theorems on
explicit finite models obtained by restricting the infinite
***Relational Structure*** and Reflex step to finite carriers.
