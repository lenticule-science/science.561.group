Relational morphisms and finite substructures
=============================================

.. meta::
   :xref-spec: math/infinite/structure/index (finite substructures)
   :xref-code: code/library/structures/morphisms
   :xref-tests: tests/library/test_library_morphisms_and_semantics

This file isolates the RelationalMorphism and finite substructure
concepts used in the library layer:

- Relational morphisms between Heyting algebras that preserve bounds,
  meets, joins, and implication inequalities; and
- finite Heyting-closed substructures of carriers, as used to model
  small, concrete witnesses to Structure-layer results.

The detailed algebraic development remains in the Structure notes;
this file serves as the atomic anchor for the library morphism helpers
and their tests.

