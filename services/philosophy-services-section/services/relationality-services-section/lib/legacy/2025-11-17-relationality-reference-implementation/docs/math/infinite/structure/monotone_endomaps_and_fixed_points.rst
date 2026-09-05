Monotone endomaps and fixed points
==================================

.. meta::
   :xref-spec: math/infinite/structure/index (Fixed Points and Stabilisation)

Definitions
-----------

Let ``(R, ≤)`` be a preorder of recognitions. An endomap
``T : R → R`` is a ***Monotone Endomap*** if

.. math::

   x ≤ y \Rightarrow T(x) ≤ T(y)

for all recognitions ``x, y ∈ R``.

An element ``x ∈ R`` is a ***Fixed Point*** of ``T`` if
``T(x) = x``; a *pre-fixpoint* if ``T(x) ≤ x``; and a *post-fixpoint*
if ``x ≤ T(x)``.

Lemma — Idempotence at fixed points
-----------------------------------

If ``T`` is monotone and ``T(x) ≤ x``, then ``T(T(x)) ≤ T(x)``. If
also ``x ≤ T(x)``, then ``T(x) = x``.

**Proof.** Apply monotonicity to ``T(x) ≤ x`` to obtain
``T(T(x)) ≤ T(x)``. If also ``x ≤ T(x)``, then ``x`` and ``T(x)`` are
both pre- and post-fixpoints, so equal by antisymmetry (when ``≤`` is
a partial order; otherwise equality is understood in the extensional
sense of recognitions). ∎

.. todo::

   :phase: spec-math

   Extend this fragment with a general fixed-point existence theorem
   for monotone endomaps under appropriate completeness assumptions,
   and relate it explicitly to the iteration and fixed-point existence
   results in the Geometry notes.
