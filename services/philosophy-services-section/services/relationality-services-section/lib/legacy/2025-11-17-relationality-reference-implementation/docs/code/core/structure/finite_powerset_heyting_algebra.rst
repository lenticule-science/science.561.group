FinitePowersetHeytingAlgebra
============================

.. meta::
   :xref-spec: math/infinite/structure/heyting_algebra_theorem, math/finite/structure/finite_powerset_heyting_carrier
   :xref-tests: tests/core/structure/test_finite_powerset_semantics, tests/core/structure/test_finite_powerset_heyting

Overview
--------

.. automodule:: relationing.core.structure.finite_powerset_heyting_algebra
   :members: FinitePowersetHeytingAlgebra
   :undoc-members:
   :show-inheritance:

This file documents the ``FinitePowersetHeytingAlgebra`` dataclass,
which provides a concrete finite Heyting carrier derived from
Relationlessness and exclusion atoms. Its ``eval_type`` method
implements λ_R type evaluation in these finite models and is exercised
by the tests referenced in the metadata above.
