Flow Fixed Sets and Fixed Points
================================

.. meta::
   :xref-spec: math/infinite/geometry/index (Flow fixed sets and fixed points)

Lemma — Fixed Sets
------------------

Under monotonicity and lax-idempotence, the fixed-point set

.. math::

   \mathrm{Fix}(F) := \{\, x \mid F(x) = x \,\}

is closed under :math:`\wedge`. If :math:`F` is idempotent and
the underlying Heyting structure distributes, then
:math:`\mathrm{Fix}(F)` is also closed under :math:`\vee` and
:math:`\Rightarrow`.

**Proof.** If :math:`F` is idempotent, then
:math:`F(x \wedge y) \le F(x) \wedge F(y) = x \wedge y` and
:math:`x \wedge y \le F(x \wedge y)`, hence equality. Similarly for
:math:`\vee` using monotonicity and distributivity. For
:math:`\Rightarrow`, use residuation with
:math:`F(x \wedge (x \Rightarrow y)) \le F(y)`. ∎


Theorem — Fixed-Point Existence
-------------------------------

Assume :math:`R` is :math:`\omega`-complete (every ascending
:math:`\omega`-chain has a least upper bound). If :math:`F` is
inflationary and monotone, then for any :math:`x`, the chain

.. math::

   x \;\le\; F(x) \;\le\; F^2(x) \;\le\; \dots

has a least upper bound :math:`\ell` with :math:`F(\ell) = \ell`.
The dual statement holds for deflationary :math:`F` in
an :math:`\omega`-op-complete :math:`R`.

**Proof.** Let :math:`\ell := \bigvee_{n \in \mathbb{N}} F^n(x)`.
Monotonicity gives
:math:`F(\ell) = F\bigl(\bigvee_n F^n(x)\bigr) \ge
\bigvee_n F^{n+1}(x) = \ell` and also :math:`\ell \ge F(\ell)`, so
equality. ∎
