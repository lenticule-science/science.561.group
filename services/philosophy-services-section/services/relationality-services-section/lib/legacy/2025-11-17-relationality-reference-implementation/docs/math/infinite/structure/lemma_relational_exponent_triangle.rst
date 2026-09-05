Triangle inequalities for :math:`T \dashv \exp_T`
=================================================

Lemma — *Triangle inequalities*
-------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_exponent

Assume :math:`T \dashv \exp_T`. Then for any recognition :math:`x \in R`:

.. math::

   x \leq \exp_T(T(x)), \qquad T(\exp_T(x)) \leq x.

In other words, :math:`\mathrm{id} \leq \exp_T \circ T` and
:math:`T \circ \exp_T \leq \mathrm{id}` in the pointwise order.

*Proof.* Both inequalities are the standard triangle identities for a
right adjoint. For the first, take :math:`a \coloneqq x` and
:math:`b \coloneqq T(x)` in the adjunction law. The inequality
:math:`T(a) \leq b` holds because :math:`T(x) \leq T(x)` by
reflexivity, so :math:`x \leq \exp_T(T(x))`. For the second, take
:math:`a \coloneqq \exp_T(x)` and :math:`b \coloneqq x`. The inequality
:math:`a \leq \exp_T(b)` is trivial, and the adjunction law gives
:math:`T(\exp_T(x)) \leq x`. :math:`\square`

