Finite morphisms and substructures
==================================

.. meta::
   :xref-spec: math/infinite/structure/relational_morphisms_and_substructures
   :xref-code: code/library/structures/morphisms
   :xref-tests: tests/library/test_library_morphisms_and_semantics

Statement
---------

Finite morphisms and finite substructures provide concrete finite
instances of the Relational Morphism and Substructure notions from
the infinite Structure notes. The library helpers construct:

- finite RelationalMorphisms between small Heyting carriers that
  preserve bounds, meets, joins, and implication inequalities; and
- finite Heyting-closed substructures used as explicit witnesses to
  morphism and substructure results.

The tests listed above exercise these finite witnesses using the
library `morphisms` and `semantics` modules.

