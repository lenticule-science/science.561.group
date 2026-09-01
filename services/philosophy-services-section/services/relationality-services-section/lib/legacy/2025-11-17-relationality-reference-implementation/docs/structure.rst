Algebra of Structure
====================

This page links the ***Algebra of Relational Structure*** (*Relational Algebra*)
in the Relational Mathematics (recognitions, order, algebraic
constructions such as Heyting carriers, iteration, fixed points, and
quotients) to its implementation and tests. The detailed content is
split along the same axes as the rest of the documentation:

- **Formal mathematical specification** – see
  :doc:`Relational Structure Spec <math/infinite/structure/index>` for
  the full notes, and the atomic spec fragments under
  ``docs/math/infinite/structure/`` (for example,
  :doc:`math/infinite/structure/heyting_algebra_theorem`,
  :doc:`math/infinite/structure/iteration_and_equivalence`,
  :doc:`math/infinite/structure/heyting_quotient_of_reflex_endomorphism`,
  :doc:`math/infinite/structure/origination_and_reflex_emergence`).

- **System code documentation** – per-function and per-dataclass docs
  for :mod:`relationing.core.structure` live under
  ``docs/code/core/structure/``. An index of the core Structure API
  is provided at :doc:`code/core/structure/index`, with one page per
  helper or dataclass (for example,
  :doc:`code/core/structure/finite_powerset_heyting_algebra`,
  :doc:`code/core/structure/iterate_step`,
  :doc:`code/core/structure/eventual_equivalence_quotient`,
  :doc:`code/core/structure/relationlessness`,
  :doc:`code/core/structure/exclusion_recognition`,
  :doc:`code/core/structure/articulation`,
  :doc:`code/core/structure/identity_reflex`,
  :doc:`code/core/structure/reflex_step`).

- **Test documentation** – documentation for Structure tests lives
  under ``docs/tests/core/structure/`` (for example,
  :doc:`tests/core/structure/test_finite_powerset_heyting`,
  :doc:`tests/core/structure/test_finite_powerset_semantics`,
  :doc:`tests/core/structure/test_structure_iteration_and_quotient`,
  :doc:`tests/core/structure/test_structure_origination_and_exclusion`),
  with each page carrying metadata linking back to the relevant spec
  and code docs.

Together these trees provide the cross-referenced view the repository
aims for: every Structure definition, implementation element, and test
has its own documentation entry, with explicit links between them.


Contents
--------

.. toctree::
   :maxdepth: 3

   math/infinite/structure/index
   code/core/structure/index
   tests/core/structure/index


Core Structure code index
-------------------------

.. toctree::
   :maxdepth: 1

   code/core/structure/index
