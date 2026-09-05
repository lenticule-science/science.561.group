Monotonicity of Relational Logarithm
====================================

Lemma — *Monotonicity of* :math:`\log_T`
----------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_logarithm

Let :math:`T : R \to R` be a *Monotone Endomap* and let
:math:`\log_T : R \to R` be a Relational Logarithm for :math:`T`,
with :math:`\log_T \dashv T`. Then :math:`\log_T` is monotone:

.. math::

   a_1 \leq a_2 \;\Rightarrow\; \log_T(a_1) \leq \log_T(a_2)

for all recognitions :math:`a_1, a_2 \in R`.

*Proof.* Suppose :math:`a_1 \leq a_2`. We must show
:math:`\log_T(a_1) \leq \log_T(a_2)`. By the adjunction, this is
equivalent to:

.. math::

   a_1 \leq T(\log_T(a_2)).

By the Logarithm Law with :math:`a \coloneqq a_2` and
:math:`b \coloneqq \log_T(a_2)`, the inequality
:math:`\log_T(a_2) \leq \log_T(a_2)` implies
:math:`a_2 \leq T(\log_T(a_2))`. Using :math:`a_1 \leq a_2` and
transitivity, we obtain

.. math::

   a_1 \leq a_2 \leq T(\log_T(a_2)),

which is exactly the condition required to conclude
:math:`\log_T(a_1) \leq \log_T(a_2)` via the adjunction. :math:`\square`

