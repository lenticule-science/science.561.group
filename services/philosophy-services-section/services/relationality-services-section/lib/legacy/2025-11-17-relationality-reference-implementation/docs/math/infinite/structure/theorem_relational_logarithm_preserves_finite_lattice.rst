Relational Logarithm and finite lattice structure
=================================================

Theorem — *Logarithm preserves joins;* :math:`T` *preserves meets*
------------------------------------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_relational_logarithm,
                math/infinite/structure/definition_meet,
                math/infinite/structure/definition_join,
                math/infinite/structure/proposition_bounded_distributive_lattice

Assume :math:`R` has finite meets and joins and :math:`\log_T \dashv T`
for a *Monotone Endomap* :math:`T : R \to R`. Then for all recognitions
:math:`a, b \in R`:

.. math::

   \log_T(a \vee b) \;=\; \log_T(a) \vee \log_T(b),
   \qquad
   T(a \wedge b) \;=\; T(a) \wedge T(b).

That is, :math:`\log_T` preserves finite joins and :math:`T` preserves
finite meets.

*Proof sketch (joins).* We prove
:math:`\log_T(a \vee b) \leq \log_T(a) \vee \log_T(b)` and the reverse
inequality.

First, let :math:`c \coloneqq \log_T(a) \vee \log_T(b)`. By
monotonicity of :math:`T`:

.. math::

   T(\log_T(a)) \leq T(c), \qquad T(\log_T(b)) \leq T(c).

Using the triangle inequalities
:math:`a \leq T(\log_T(a))` and :math:`b \leq T(\log_T(b))`, we obtain:

.. math::

   a \leq T(\log_T(a)) \leq T(c),
   \qquad
   b \leq T(\log_T(b)) \leq T(c).

Thus :math:`a \vee b \leq T(c)`. By the Logarithm Law (with
left-hand argument :math:`a \vee b` and right-hand argument
:math:`c`), this yields

.. math::

   \log_T(a \vee b) \leq c
   \;=\;
   \log_T(a) \vee \log_T(b).

For the reverse inequality, it suffices to show
:math:`\log_T(a) \leq \log_T(a \vee b)` and
:math:`\log_T(b) \leq \log_T(a \vee b)`; the join inequality then
follows. We prove the first; the second is symmetric.

By the Logarithm Law,
:math:`\log_T(a) \leq \log_T(a \vee b)` is equivalent to:

.. math::

   a \leq T(\log_T(a \vee b)).

We have :math:`a \leq a \vee b` by join-introduction, and from the
triangle inequality at :math:`a \vee b`:

.. math::

   a \vee b \leq T(\log_T(a \vee b)).

Combining these gives:

.. math::

   a \leq a \vee b \leq T(\log_T(a \vee b)),

which establishes the desired inequality via the adjunction. The
argument for :math:`\log_T(b)` is identical.

Thus :math:`\log_T` preserves binary joins; nullary and unary cases
follow similarly. The statement that :math:`T` preserves finite meets
is the standard dual property of a right adjoint: right adjoints
preserve all existing meets, so :math:`T(a \wedge b) = T(a) \wedge T(b)`
follows from general adjoint theory. :math:`\square`

