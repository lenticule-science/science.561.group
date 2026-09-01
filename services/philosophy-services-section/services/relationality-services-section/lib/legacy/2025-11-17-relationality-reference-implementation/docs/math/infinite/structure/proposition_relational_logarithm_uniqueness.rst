Uniqueness of Relational Logarithm
==================================

Proposition — *Uniqueness of the Relational Logarithm*
------------------------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_logarithm

Let :math:`T : R \to R` be a *Monotone Endomap*. Suppose
:math:`L, L' : R \to R` both satisfy the Logarithm Law:

.. math::

   L(a) \leq b \;\Leftrightarrow\; a \leq T(b),
   \qquad
   L'(a) \leq b \;\Leftrightarrow\; a \leq T(b)

for all recognitions :math:`a, b \in R`. Then :math:`L = L'`.

*Proof.* Fix :math:`a \in R`. For any :math:`b \in R` we have

.. math::

   L(a) \leq b
   \;\Leftrightarrow\;
   a \leq T(b)
   \;\Leftrightarrow\;
   L'(a) \leq b.

Thus :math:`L(a)` and :math:`L'(a)` have exactly the same set of upper
bounds. In a preorder, two elements with the same upper bounds are
equivalent in order. In particular, taking :math:`b \coloneqq L'(a)`
gives :math:`L(a) \leq L'(a)`; taking :math:`b \coloneqq L(a)` gives
:math:`L'(a) \leq L(a)`. So :math:`L(a)` and :math:`L'(a)` are equal
up to the underlying equality of recognitions. Since this holds for
all :math:`a`, we have :math:`L = L'`. :math:`\square`

