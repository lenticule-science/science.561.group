Heyting Carrier Theorem
=======================

.. meta::
   :xref-spec: math/infinite/structure/index (Heyting Carrier)
   :induced-by: math/infinite/structure/implication_by_residuation, math/infinite/structure/preorder_and_order, math/infinite/structure/residuation_law

Theorem — Heyting Carrier
-------------------------

If :math:`R` admits finite meets/joins and residuation for all pairs,
then :math:`(R, \leq, \wedge, \vee, \Rightarrow, \bot, \top)` is a
Heyting carrier: in particular, the recognitions in :math:`R` form a
Heyting algebra. For all :math:`a, b, c \in R`:

1. :math:`a \wedge (a \Rightarrow b) \leq b`,
2. :math:`c \leq (a \Rightarrow b)` iff :math:`c \wedge a \leq b`,
3. :math:`a \Rightarrow a = \top`,
4. :math:`\bot \Rightarrow a = \top`,
5. :math:`a \Rightarrow \bot` is the relative negation of :math:`a`.

**Proof.** (1) Take :math:`c \coloneqq (a \Rightarrow b)` and apply
the Residuation Law Lemma. (2) This is the Residuation Law Lemma.
(3) From the Residuation Law with :math:`b \coloneqq a` and
:math:`c \coloneqq \top`, since :math:`\top \wedge a = a \le a`.
(4) Since :math:`\top \wedge \bot = \bot \le a`. (5) Definition of
relative negation. ∎

