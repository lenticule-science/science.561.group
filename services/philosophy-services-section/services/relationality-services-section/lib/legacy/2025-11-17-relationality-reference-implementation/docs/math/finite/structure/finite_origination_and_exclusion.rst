Finite origination and exclusion
================================

.. meta::
   :xref-spec: math/infinite/structure/origination_and_reflex_emergence
   :xref-code: code/core/structure/relationlessness, code/core/structure/exclusion_recognition, code/core/structure/articulate_relationlessness, code/core/structure/articulation, code/core/structure/identity_reflex, code/core/structure/reflex_step, code/core/structure/preorder, code/core/structure/heyting_algebra
   :xref-tests: tests/core/structure/test_structure_origination_and_exclusion

Statement
---------

Finite origination and exclusion helpers provide concrete finite
witnesses of the Origination and Reflex Emergence story from the
infinite Relational Structure notes:

- ``Relationlessness`` and ``ExclusionRecognition`` are instantiated
  on finite exclusion atoms;
- ``articulate_relationlessness`` and ``reflex_emergence`` construct
  minimal finite configurations realising the Articulation and Reflex
  Emergence definitions; and
- ``IdentityReflex`` and ``ReflexStep`` witness trivial Reflex
  endomaps on finite Heyting carriers.

The tests listed above exercise these helpers on small finite
carriers, showing that the Origination and Reflex Emergence results
hold on explicit finite models obtained by filtering the infinite
Relationlessness/Reflex story down to finite exclusion atoms and
finite Heyting carriers.
