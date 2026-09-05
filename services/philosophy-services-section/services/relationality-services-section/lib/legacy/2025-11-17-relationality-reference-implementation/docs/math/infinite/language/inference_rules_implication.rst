Inference Rules — Implication
=============================

Rules — Implication
-------------------

- Intro: from ``Γ, x:A ⊢ t : B`` infer ``Γ ⊢ λx.t : A ⇒ B``.
- Elim: from ``Γ ⊢ f : A ⇒ B`` and ``Γ ⊢ a : A`` infer
  ``Γ ⊢ f\,a : B``.
