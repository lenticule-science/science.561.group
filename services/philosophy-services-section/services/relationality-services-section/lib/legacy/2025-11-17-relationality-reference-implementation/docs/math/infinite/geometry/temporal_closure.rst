Temporal Closure for Flows
==========================

.. meta::
   :xref-spec: math/infinite/geometry/index (Temporal Closure)

Proposition — Temporal Closure
------------------------------

If :math:`F` is an inflationary, idempotent flow on a
*Relational Structure* ***R***, define
:math:`\Box x := \mathrm{Fix}(F) \wedge x` and
:math:`\Diamond x := \bigvee_{n} F^n(x)` when the join exists. Then
:math:`\Box` is interior-like on :math:`\mathrm{Fix}(F)` and
:math:`\Diamond` is closure-like; both commute with any nucleus
:math:`\nu` that is compatible with :math:`F`
(:math:`F \circ \nu \le \nu \circ F` or its dual).

**Proof.** By the Fixed Sets Lemma, the fixed points of :math:`F`
form a Heyting-closed subset of :math:`R`; restricting :math:`\Box`
to this subset gives an interior-like operator. The existence of
joins of :math:`F`-iterates yields a closure-like :math:`\Diamond`.
Compatibility with :math:`\nu` follows from the Flow–Nucleus
Compatibility proposition:
:math:`F \circ \nu \le \nu \circ F` ensures that fixed points and
iterates are preserved up to :math:`\nu`. ∎
