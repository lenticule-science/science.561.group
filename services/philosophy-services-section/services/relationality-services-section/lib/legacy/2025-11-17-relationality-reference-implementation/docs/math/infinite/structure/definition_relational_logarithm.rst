Relational Logarithm
=====================

Definition — ***Relational Logarithm***
---------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_monotone_endomap

Let a *Recognition* carrier :math:`R` with preorder :math:`\leq` and a
*Monotone Endomap* :math:`T : R \to R` be given.

A ***Relational Logarithm*** for :math:`T` is a function
:math:`\log_T : R \to R` such that for all recognitions
:math:`a, b \in R`:

.. math::

   \log_T(a) \leq b \quad\text{iff}\quad a \leq T(b).

This equivalence is the *Logarithm Law* for :math:`T`. When it holds
we write :math:`\log_T \dashv T` and say that :math:`\log_T` is left
adjoint to :math:`T`.

