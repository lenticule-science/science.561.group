Finite iteration witnesses
==========================

.. meta::
   :xref-spec: math/infinite/structure/iteration_and_equivalence, math/infinite/structure/monotone_endomaps_and_fixed_points
   :xref-code: code/core/structure/iterate_step, code/core/structure/eventual_equivalent
   :xref-tests: tests/core/structure/test_structure_iteration_and_quotient

Statement
---------

Finite iteration helpers provide concrete finite instances of the
Reflex-step iteration results from the infinite Structure notes. On a
finite carrier and a monotone step :math:`S`:

- the bounded iteration helpers realise the sequence :math:`S^n(x)`;
  and
- stabilisation depth, *Iterative Persistence*, and *Baseline Limit*
  can be computed explicitly for given recognitions.

These witnesses show that the abstract iteration and persistence
definitions specialise correctly to small finite examples, obtained by
restricting an infinite Reflex step to a finite substructure of
recognitions.
