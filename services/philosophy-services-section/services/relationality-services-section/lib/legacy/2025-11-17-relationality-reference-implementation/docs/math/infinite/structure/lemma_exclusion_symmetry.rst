Exclusion Symmetry
==================

Lemma — *Exclusion Symmetry*
----------------------------

.. meta::
   :induced-by: math/infinite/structure/definition_inclusion,
                math/infinite/structure/definition_exclusion,
                math/infinite/structure/proposition_bounded_distributive_lattice

Let a *Relational Structure* (``RelationalStructure``) *R* carry
Exclusion :math:`\perp` as in *Inclusion* and *Exclusion*. For
recognitions :math:`x, y \in R`, we have Exclusion symmetry:

.. math::

   x \perp y \quad\text{iff}\quad y \perp x.

*Proof.* If :math:`x \perp y`, then :math:`x \wedge y = \bot`. By
commutativity of :math:`\wedge`, :math:`y \wedge x = \bot`, so
:math:`y \perp x`. The converse is identical. :math:`\square`

