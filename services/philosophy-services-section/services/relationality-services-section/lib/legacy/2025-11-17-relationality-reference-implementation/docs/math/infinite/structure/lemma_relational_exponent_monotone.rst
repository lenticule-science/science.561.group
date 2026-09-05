Monotonicity of Relational Exponent
===================================

Lemma — *Monotonicity of* :math:`\exp_T`
----------------------------------------

.. meta::
   :induced-by: math/infinite/structure/lemma_relational_exponent_join_construction

Let :math:`T : R \to R` be a *Monotone Endomap* and :math:`\exp_T` a
Relational Exponent constructed as in
``lemma_relational_exponent_join_construction``. Then :math:`\exp_T`
is monotone:

.. math::

   a \leq a' \;\Rightarrow\; \exp_T(a) \leq \exp_T(a')

for all recognitions :math:`a, a' \in R`.

*Proof.* If :math:`a \leq a'` and :math:`T(x) \leq a`, then
:math:`T(x) \leq a'` by transitivity, so :math:`U_{a'} \subseteq U_a`.
Taking joins, :math:`\bigvee U_a \leq \bigvee U_{a'}`. By the
definition of :math:`\exp_T`, this is
:math:`\exp_T(a) \leq \exp_T(a')`. :math:`\square`

