Inference Rules — Conjunction
=============================

Rules — Conjunction
-------------------

- Intro: from ``Γ ⊢ t : A`` and ``Γ ⊢ u : B`` infer
  ``Γ ⊢ ⟨t, u⟩ : A ∧ B``.
- Elim: from ``Γ ⊢ p : A ∧ B`` infer ``Γ ⊢ π₁ p : A`` and
  ``Γ ⊢ π₂ p : B``.
