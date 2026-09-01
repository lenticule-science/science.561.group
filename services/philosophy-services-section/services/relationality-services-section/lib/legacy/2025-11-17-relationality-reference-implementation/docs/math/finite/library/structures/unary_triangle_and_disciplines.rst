Unary triangle and Disciplines
==============================

.. meta::
   :xref-spec: math/infinite/language/soundness_and_logical_relations
   :xref-code: code/library/structures/unary_explorer
   :xref-tests: tests/library/test_unary_explorer, tests/library/test_semantics_unary_disciplines

Statement
---------

This fragment records the finite unary ``A ⇒ A`` triangle phenomenon:

- validity in all finite models;
- top-ness in a finite syntactic model; and
- inhabitation by a λ_R term

coincide on a small implicational fragment, and can be realised as
Disciplines in suitable RelationalStructures.

Sketch
------

The triangle is developed in the Language and Geometry notes. This file
acts as an atomic bridge between that development and the executable
unary exploration and Discipline-building helpers in
``relationing.library.structures.unary_explorer`` and their tests.
