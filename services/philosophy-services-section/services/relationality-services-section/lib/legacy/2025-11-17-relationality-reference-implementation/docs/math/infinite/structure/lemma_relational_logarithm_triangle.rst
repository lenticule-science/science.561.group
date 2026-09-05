Triangle inequalities for :math:`\log_T \dashv T`
=================================================

Lemma — *Triangle inequalities*
-------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_logarithm

Assume :math:`\log_T \dashv T`. Then for any recognition :math:`x \in R`:

.. math::

   \log_T(T(x)) \leq x,
   \qquad
   x \leq T(\log_T(x)).

In other words, :math:`\log_T \circ T \leq \mathrm{id}` and
:math:`\mathrm{id} \leq T \circ \log_T` in the pointwise order.

*Proof.* For the first inequality, take :math:`a \coloneqq T(x)` and
:math:`b \coloneqq x`. The inequality :math:`a \leq T(b)` holds
because :math:`T(x) \leq T(x)` by reflexivity. By the Logarithm Law:

.. math::

   \log_T(T(x)) \leq x.

For the second inequality, take :math:`a \coloneqq x` and
:math:`b \coloneqq \log_T(x)`. The inequality
:math:`\log_T(x) \leq \log_T(x)` is trivial; by the Logarithm Law this
implies:

.. math::

   x \leq T(\log_T(x)).

Thus both triangle inequalities follow directly from the adjunction.
:math:`\square`

