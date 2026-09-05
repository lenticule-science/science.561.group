Inference Rules — Reflex Operator
=================================

Rules — Reflex Operator
-----------------------

- ``ρ``-intro: from ``Γ ⊢ t : A`` infer ``Γ ⊢ ρ(t) : A``.
- ``ρ``-monotone: if ``A`` is a recognition type and
  ``Γ ⊢ t ≤ u`` then ``Γ ⊢ ρ(t) ≤ ρ(u)``.
- ``ρ``-stability: ``Γ ⊢ ρ(t) ≤ t`` implies
  ``Γ ⊢ ρ(t) ≡ t : A``.
