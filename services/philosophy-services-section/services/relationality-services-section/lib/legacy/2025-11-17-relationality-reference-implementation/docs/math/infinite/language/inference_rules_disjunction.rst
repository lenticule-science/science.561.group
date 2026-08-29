Inference Rules — Disjunction
=============================

Rules — Disjunction
-------------------

- Intro: from ``Γ ⊢ t : A`` infer ``Γ ⊢ \mathrm{inl}\ t : A ∨ B``;
  from ``Γ ⊢ u : B`` infer ``Γ ⊢ \mathrm{inr}\ u : A ∨ B``.
- Elim: from ``Γ ⊢ s : A ∨ B``, ``Γ, x:A ⊢ u : C``, and
  ``Γ, y:B ⊢ v : C`` infer
  ``Γ ⊢ \mathrm{case}\ s\ \mathrm{of}\ \mathrm{inl}\ x↦u\ |\ \mathrm{inr}\ y↦v : C``.
