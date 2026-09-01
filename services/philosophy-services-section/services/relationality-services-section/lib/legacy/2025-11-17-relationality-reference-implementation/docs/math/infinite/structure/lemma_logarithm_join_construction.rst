Logarithm Law via joins
=======================

Lemma — *Logarithm Law via joins*
---------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_monotone_endomap,
                math/infinite/structure/definition_join,
                math/infinite/structure/proposition_bounded_distributive_lattice

Let :math:`(R, \leq)` be a preorder of recognitions in which, for each
recognition :math:`a \in R`, the subset

.. math::

   S_a \;=\; \{\, b \in R \mid a \leq T(b) \,\}

has a join :math:`\bigvee S_a \in R`. In particular, this holds when
*R* is finite or when the preorder is join-complete over these
subsets.

Define :math:`\log_T : R \to R` by

.. math::

   \log_T(a) \;\coloneqq\; \bigvee \{\, b \in R \mid a \leq T(b) \,\}.

Then for all recognitions :math:`a, b \in R`:

.. math::

   \log_T(a) \leq b \quad\text{iff}\quad a \leq T(b).

*Proof.* (“Only if” direction.) Suppose :math:`\log_T(a) \leq b`. By
definition, every :math:`b' \in S_a` satisfies :math:`b' \leq \log_T(a)`
and hence :math:`b' \leq b`. For any such :math:`b'` we have
:math:`a \leq T(b')` by construction of :math:`S_a`. By monotonicity
of :math:`T`:

.. math::

   a \leq T(b') \leq T(b),

so in particular :math:`a \leq T(b)`.

(“If” direction.) Conversely, suppose :math:`a \leq T(b)`. Then
:math:`b \in S_a` by definition, so :math:`b` is one of the candidates
in the join defining :math:`\log_T(a)`. Since :math:`\log_T(a)` is the
least upper bound of :math:`S_a`, we have :math:`\log_T(a) \leq b`.

Combining both directions gives the equivalence and hence the
Logarithm Law. :math:`\square`

