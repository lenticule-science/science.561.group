---
title: Judgment Calculus Soundness
keywords:
  - lambda
  - typing
layer: internal-theorem
status: plan
depends_on:
  - sound-syntax
  - preserve-typing
  - progress-typing
---
# Judgment Calculus Soundness

The acts

- `SoundSyntax`,
- `PreserveTyping`, and
- `ProgressTyping`

establish the standard metatheory of the internal judgment calculus in the
relational calculus:

- preservation: if `Γ ⊢ t : A` and `t` reduces to `t'` via the relational
  evaluation acts, then `Γ ⊢ t' : A`,
- progress: every well-typed closed term is either a value or can take a
  relational evaluation step.

Together these acts witness that the relational realisation of the judgment
calculus obeys the usual soundness properties, and via the external
correspondence theorem this yields the usual soundness properties for the
simply-typed lambda calculus.
