Flow–Nucleus Compatibility and Transport
========================================

.. meta::
   :xref-spec: math/infinite/geometry/index (Flow–nucleus compatibility and transport)

Proposition — Flow–Nucleus Compatibility
----------------------------------------

If :math:`F \circ \nu \le \nu \circ F` for closure-like
:math:`\nu`, then :math:`\nu`-closed recognitions are
forward-invariant:
:math:`\nu(x) = x \Rightarrow \nu(F(x)) = F(x)`. The dual statement
holds for interior-like :math:`\nu` with
:math:`\nu \circ F \le F \circ \nu`.

**Proof.** :math:`\nu(F(x)) \ge F(\nu(x)) = F(x)`, but also
:math:`\nu(F(x)) \le F(x)` since :math:`x` is :math:`\nu`-closed and
:math:`\nu` is extensive; hence equality. ∎


Proposition — Transport of Fixed Points
---------------------------------------

Let :math:`f : R \to R'` be a *Relational Morphism*
(:class:`relationing.library.structures.RelationalMorphism`) between
*Relational Structures*, and let :math:`F : R \to R` and
:math:`F' : R' \to R'` be flows such that
:math:`f \circ F = F' \circ f`. If :math:`x` is :math:`F`-fixed
(:math:`F(x) = x`), then :math:`f(x)` is :math:`F'`-fixed
(:math:`F'(f(x)) = f(x)`).

**Proof.** :math:`F'(f(x)) = f(F(x)) = f(x)`. ∎


Proposition — Transport of Nucleus Fixed Points
-----------------------------------------------

Let :math:`f : R \to R'` be a *Relational Morphism* and let
:math:`\nu, \nu'` be nuclei on :math:`R` and :math:`R'` with
:math:`f \circ \nu = \nu' \circ f`. If :math:`x` is :math:`\nu`-closed
(:math:`\nu(x) = x`), then :math:`f(x)` is :math:`\nu'`-closed
(:math:`\nu'(f(x)) = f(x)`).

**Proof.** :math:`\nu'(f(x)) = f(\nu(x)) = f(x)`. ∎
