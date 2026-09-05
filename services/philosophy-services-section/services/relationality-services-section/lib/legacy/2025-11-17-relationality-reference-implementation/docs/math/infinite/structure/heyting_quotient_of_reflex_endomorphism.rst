Heyting Quotient of a Reflex Endomorphism
=========================================

.. meta::
   :xref-spec: math/infinite/structure/index (Heyting Quotient of a Reflex Endomorphism)

This file records the Heyting quotient construction for a Reflex
endomorphism at the infinite level.


Theorem — Heyting Quotient of a Reflex Endomorphism
---------------------------------------------------

Let :math:`(R, \le, \wedge, \vee, \Rightarrow, \bot, \top)` be a
Heyting algebra of recognitions and let :math:`S : R \to R` be a
monotone endomap such that:

1. :math:`S` preserves the Heyting structure (a Heyting endomorphism):

   .. math::

      S(\bot) = \bot,\quad S(\top) = \top,\\
      S(x \wedge y) = S(x) \wedge S(y),\quad
      S(x \vee y) = S(x) \vee S(y),\\
      S(x \Rightarrow y) = S(x) \Rightarrow S(y)

   for all recognitions :math:`x, y`.

2. Eventual equivalence :math:`x \equiv_S y` is defined by
   stabilisation of the iterates :math:`S^n(x), S^n(y)` as in the
   iteration notes: there exists :math:`N` such that for all
   :math:`n \ge N`, :math:`S^n(x) = S^n(y)`.

Then :math:`\equiv_S` is a Heyting congruence: if :math:`x_i \equiv_S y_i`
for :math:`i = 1, 2`, then

.. math::

   x_1 \wedge x_2 \equiv_S y_1 \wedge y_2,\quad
   x_1 \vee x_2 \equiv_S y_1 \vee y_2,\quad
   (x_1 \Rightarrow x_2) \equiv_S (y_1 \Rightarrow y_2),

and :math:`\bot \equiv_S \bot`, :math:`\top \equiv_S \top`. Consequently,
the quotient set :math:`R / \equiv_S` carries a well-defined Heyting
algebra structure with

.. math::

   [x] \wedge [y] := [x \wedge y],\quad
   [x] \vee [y] := [x \vee y],\quad
   [x] \Rightarrow [y] := [x \Rightarrow y],

and inherited bounds :math:`[\bot], [\top]`.

**Proof (sketch).** The assumptions ensure that :math:`S` commutes with
the Heyting operations and that the iterates :math:`S^n` do as well. If
:math:`x_i \equiv_S y_i` for :math:`i = 1, 2`, then there exists
:math:`N` such that for all :math:`n \ge N` one has
:math:`S^n(x_i) = S^n(y_i)`. Using preservation of
:math:`\wedge, \vee, \Rightarrow`, we obtain

.. math::

   S^n(x_1 \wedge x_2) = S^n(x_1) \wedge S^n(x_2)
   = S^n(y_1) \wedge S^n(y_2) = S^n(y_1 \wedge y_2),

and similarly for :math:`\vee` and :math:`\Rightarrow`. Hence the
corresponding pairs are eventually equivalent, so the operations are
compatible with :math:`\equiv_S` and descend to the quotient. The bounds
are preserved by assumption on :math:`S`. Standard algebraic arguments
then show that the Heyting axioms hold on :math:`R / \equiv_S`. ∎
