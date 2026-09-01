Relational Exponent
====================

Definition — ***Relational Exponent***
--------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_monotone_endomap

Let a *Relational Structure* (``RelationalStructure``) carry a
preorder :math:`(R, \leq)` of *Recognitions* and let :math:`T : R \to R`
be a *Monotone Endomap* (for example, a Flow on recognitions).

A ***Relational Exponent*** for :math:`T` is a monotone endomap
:math:`\exp_T : R \to R` such that for all recognitions
:math:`a, b \in R`:

.. math::

   T(a) \leq b \quad\Leftrightarrow\quad a \leq \exp_T(b).

When this equivalence holds we write :math:`T \dashv \exp_T` and say
that :math:`\exp_T` is the right adjoint of :math:`T` in the
recognition order.

