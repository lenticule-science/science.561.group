Uniqueness of Relational Exponent
=================================

Proposition — *Uniqueness of the Relational Exponent*
-----------------------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_exponent

Let :math:`T : R \to R` be a *Monotone Endomap*. Suppose
:math:`E, E' : R \to R` both satisfy the adjunction law:

.. math::

   T(a) \leq b \;\Leftrightarrow\; a \leq E(b), \qquad
   T(a) \leq b \;\Leftrightarrow\; a \leq E'(b)

for all recognitions :math:`a, b \in R`. Then :math:`E = E'`.

*Proof.* Fix :math:`b \in R`. For any :math:`a \in R` we have

.. math::

   a \leq E(b)
   \;\Leftrightarrow\;
   T(a) \leq b
   \;\Leftrightarrow\;
   a \leq E'(b).

Thus :math:`E(b)` and :math:`E'(b)` have exactly the same set of lower
bounds. In a preorder, two elements with the same lower bounds are
equivalent in order. Hence :math:`E(b)` and :math:`E'(b)` are equal up
to the underlying equality of recognitions. Since this holds for all
:math:`b`, we have :math:`E = E'`. :math:`\square`

