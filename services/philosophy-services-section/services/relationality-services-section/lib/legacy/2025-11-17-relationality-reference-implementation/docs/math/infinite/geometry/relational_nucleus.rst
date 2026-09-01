Relational Nuclei and Fixed-Point Substructures
===============================================

.. meta::
   :xref-spec: math/infinite/geometry/index (Relational Nuclei)

Definition — ***Relational Nucleus*** (*Nucleus*)
-------------------------------------------------

Given a *:doc:`Relational Structure <math/infinite/structure/relational_structure>`*
(:class:`relationing.core.structure.RelationalStructure`) ***R***, a
***Relational Nucleus*** (*Nucleus*) on ***R*** is an endomap
:math:`\nu : R \to R` such that for all :math:`x, y \in R`:

- *Monotone*: :math:`x \le y \Rightarrow \nu(x) \le \nu(y)`;
- *Idempotent*: :math:`\nu(\nu(x)) = \nu(x)`;
- *Orientation*: either (closure-like) :math:`x \le \nu(x)` or
  (interior-like) :math:`\nu(x) \le x`;
- *Algebraic compatibility*:

  - closure-like:
    :math:`x \wedge \nu(y) \le \nu(x \wedge y)` and
    :math:`\nu(x) \vee \nu(y) = \nu(x \vee y)`;
  - interior-like:
    :math:`\nu(x \wedge y) = \nu(x) \wedge \nu(y)` and
    :math:`\nu(x \vee y) \le \nu(x) \vee \nu(y)`.

Proposition — Fixed-Point Substructures
---------------------------------------

For closure-like :math:`\nu`, the :math:`\nu`-closed recognitions

.. math::

   \mathrm{Fix}(\nu) := \{\, x \mid \nu(x) = x \,\}

form a Heyting subalgebra closed under :math:`\wedge`, :math:`\vee`,
and :math:`\Rightarrow`. Dually, :math:`\nu`-open recognitions for
interior-like :math:`\nu` form a Heyting subalgebra closed under
:math:`\wedge` and :math:`\Rightarrow` and are upward-closed under
:math:`\vee` via :math:`\nu`.

**Proof.** For closure-like :math:`\nu`:
 :math:`\wedge`-closure follows from algebraic compatibility;
:math:`\vee`-closure follows from the stated equality; and
:math:`\Rightarrow`-closure follows since, if :math:`a, b` are closed,
then :math:`\nu(a \Rightarrow b) \ge a \Rightarrow b` and also
:math:`\le` by monotonicity from
:math:`a \wedge (a \Rightarrow b) \le b` and idempotence, yielding
equality. Dual statements hold for interior-like :math:`\nu`. ∎
