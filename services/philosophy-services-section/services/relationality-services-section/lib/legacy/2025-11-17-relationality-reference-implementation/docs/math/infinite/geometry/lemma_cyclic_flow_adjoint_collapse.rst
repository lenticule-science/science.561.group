Cyclic Flow Adjoint Collapse
============================

Lemma — *Cyclic Flow Adjoint Collapse on a Finite Profile*
----------------------------------------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_monotone_endomap,
                math/infinite/structure/definition_relational_logarithm,
                math/infinite/structure/definition_relational_exponent

Let a *Relational Geometry* (``RelationalGeometry``) be given on a
carrier :math:`R` with order :math:`\leq` and a *Flow*
:math:`F : R \to R` (``Flow``). Suppose there exists a finite profile
subset :math:`P \subseteq R` such that:

- *Finite chain profile.* :math:`(P, \leq)` is a finite chain of
  recognitions:

  .. math::

     P = \{ p_0, \dots, p_{n-1} \},
     \quad
     p_0 \leq p_1 \leq \dots \leq p_{n-1},

  with all :math:`p_i` distinct.

- *Cyclic flow action.* The flow :math:`F` restricts to a cycle on
  :math:`P`:

  .. math::

     F(p_i) = p_{i+1} \quad (0 \leq i < n-1),
     \qquad
     F(p_{n-1}) = p_0.

- *Inverse endomap on the profile.* There is an endomap
  :math:`G : R \to R` (not assumed monotone globally) whose restriction
  to :math:`P` is the inverse cycle:

  .. math::

     G(p_0) = p_{n-1},
     \qquad
     G(p_i) = p_{i-1} \quad (1 \leq i \leq n-1).

Then, on the profile :math:`P`, :math:`G` is both a right and left
relational adjoint of :math:`F` with respect to the inherited order
:math:`\leq`:

.. math::

   \forall x, y \in P:
   \quad
   F(x) \leq y \;\Leftrightarrow\; x \leq G(y),
   \qquad
   G(x) \leq y \;\Leftrightarrow\; x \leq F(y).

Consequently, any left adjoint :math:`\log_F` and right adjoint
:math:`\exp_F` of :math:`F` (when they are defined as order adjoints
on :math:`P`) coincide on :math:`P` and equal the inverse cycle:

.. math::

   \log_F\!\restriction_P
   \;=\;
   \exp_F\!\restriction_P
   \;=\;
   G\!\restriction_P.

In particular, the flow :math:`F` admits a profile-level adjoint
collapse: its geometry on the finite chain profile :math:`P` is
completely determined (up to equality) by the inverse cycle.

*Proof (sketch).* Work entirely inside the finite profile
:math:`P = \{ p_0, \dots, p_{n-1} \}` with the inherited order. Since
:(P, \leq)` is a finite chain, for any :math:`x, y \in P`:

.. math::

   x \leq y \;\Leftrightarrow\;
   \operatorname{index}(x) \leq \operatorname{index}(y),

where :math:`\operatorname{index}(p_i) = i`. On this finite chain:

- :math:`F` is a bijection :math:`P \to P` with cyclic action as
  given; and
- :math:`G` is its inverse permutation :math:`F^{-1}` on :math:`P`.

Because :math:`F` and :math:`G` are mutual inverses on the chain, for
all :math:`x, y \in P`:

.. math::

   F(x) \leq y
   \;\Leftrightarrow\;
   x = G(F(x)) \leq G(y)
   \;\Leftrightarrow\;
   x \leq G(y),

and conversely applying :math:`F` to :math:`x \leq G(y)` yields

.. math::

   F(x) \leq F(G(y)) = y.

This establishes :math:`F \dashv G` on :math:`P`. The same argument
with roles swapped shows

.. math::

   G(x) \leq y \;\Leftrightarrow\; x \leq F(y)

for all :math:`x, y \in P`, i.e. :math:`G \dashv F` on :math:`P`.

By uniqueness of left and right adjoints on a given poset, any
endomap :math:`\log_F` satisfying the left adjoint law must coincide
with :math:`G` on :math:`P`, and any :math:`\exp_F` satisfying the
right adjoint law must also coincide with :math:`G` on :math:`P`.
Thus:

.. math::

   \log_F\!\restriction_P
   \;=\;
   \exp_F\!\restriction_P
   \;=\;
   G\!\restriction_P,

which is the claimed adjoint collapse. :math:`\square`

