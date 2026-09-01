Finite powerset Heyting carriers
================================

.. meta::
   :xref-spec: math/infinite/structure/heyting_algebra_theorem
   :xref-code: code/core/structure/finite_powerset_heyting_algebra
   :xref-tests: tests/core/structure/test_finite_powerset_heyting, tests/core/structure/test_finite_powerset_semantics

Statement
---------

Finite powerset Heyting carriers are concrete finite models of the
Heyting Algebra theorem: given a finite base set :math:`U` of atoms,
the powerset :math:`\mathcal{P}(U)` ordered by inclusion with
pointwise :math:`\wedge, \vee, \Rightarrow, \bot, \top` forms a
Heyting algebra. The ``FinitePowersetHeytingAlgebra`` carrier in the
code instantiates this construction for small finite :math:`U`.

These finite models provide witnesses that the Heyting Algebra laws
from the infinite Relational Structure notes hold on explicit finite
examples, obtained by restricting the infinite *Relational Structure*
to a finite carrier of recognitions.

