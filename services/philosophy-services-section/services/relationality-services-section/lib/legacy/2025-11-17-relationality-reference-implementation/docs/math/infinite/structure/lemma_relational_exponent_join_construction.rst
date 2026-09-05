Relational Exponent via joins
=============================

Lemma — *Relational Exponent via joins*
---------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_exponent,
                math/infinite/structure/definition_join,
                math/infinite/structure/proposition_bounded_distributive_lattice

Let :math:`(R, \leq)` be a preorder of recognitions and
*:math:`T : R \to R`* a *Monotone Endomap*. For each recognition
:math:`b \in R`, define

.. math::

   U_b \;=\; \{\, a \in R \mid T(a) \leq b \,\}.

Assume that for every :math:`b \in R` this subset admits a join
:math:`\bigvee U_b \in R`. In particular, this holds automatically in
any finite carrier (for example, in a finite fixed profile).

Define :math:`\exp_T : R \to R` by

.. math::

   \exp_T(b) \;\coloneqq\; \bigvee \{\, a \in R \mid T(a) \leq b \,\}.

Then :math:`\exp_T` is a Relational Exponent for :math:`T`: for all
recognitions :math:`a, b \in R`:

.. math::

   T(a) \leq b \quad\Leftrightarrow\quad a \leq \exp_T(b).

*Proof.* (“Only if” direction.) Suppose :math:`T(a) \leq b`. Then
:math:`a \in U_b` by definition, so :math:`a` is one of the elements
whose join defines :math:`\exp_T(b)`. Therefore
:math:`a \leq \bigvee U_b = \exp_T(b)`.

(“If” direction.) Conversely, suppose :math:`a \leq \exp_T(b)`. Since
:math:`\exp_T(b)` is an upper bound for all :math:`a' \in U_b`, we
have :math:`a' \leq \exp_T(b)` for each such :math:`a'`. By
monotonicity of :math:`T`:

.. math::

   T(a') \leq T(\exp_T(b))

for all :math:`a' \in U_b`. By construction, every :math:`a' \in U_b`
also satisfies :math:`T(a') \leq b`. Since :math:`\exp_T(b)` is the
least upper bound of :math:`U_b`, monotonicity ensures:

.. math::

   T(\exp_T(b)) \leq b.

Combining,

.. math::

   T(a) \leq T(\exp_T(b)) \leq b

so :math:`T(a) \leq b`. This establishes the adjunction equivalence and
shows that :math:`\exp_T` is a Relational Exponent for :math:`T`.
:math:`\square`

