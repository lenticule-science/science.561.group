Relational Exponent and meets
=============================

Theorem — *Relational Exponent preserves meets*
-----------------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_exponent,
                math/infinite/structure/definition_meet,
                math/infinite/structure/proposition_bounded_distributive_lattice

Assume :math:`R` has finite meets and :math:`T \dashv \exp_T` for a
*Monotone Endomap* :math:`T : R \to R`. Then :math:`\exp_T` preserves
finite meets: for all recognitions :math:`b_1, b_2 \in R`:

.. math::

   \exp_T(b_1 \wedge b_2) \;=\; \exp_T(b_1) \wedge \exp_T(b_2).

More generally, :math:`\exp_T` preserves all existing meets in
:math:`R`.

*Proof sketch.* This is the standard property of right adjoints in
order theory: any right adjoint preserves all existing meets. In this
setting, :math:`\exp_T` is right adjoint to :math:`T`, so it preserves
finite (and more generally, all existing) meets. A direct
order-theoretic proof can be given by unpacking the adjunction law in
the presence of meets. :math:`\square`

