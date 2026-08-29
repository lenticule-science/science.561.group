---
form: research
title: Flow–Normalization Compatibility
tags:
  - flow
  - normalization
  - equivalence
layer: internal-theorem
status: plan
depends-on:
  - theorem/internal/flow-nucleus-compatibility
  - theorem/internal/admissible-normal-form-structure
  - flow
  - evolve# Flow–Normalization Compatibility

Let `(C, (tau), σ)` be a stratified ∞-site with admissible morphisms `Adm` and
normal-form map `N∞ : Adm → Adm` as in **Theorem (Normal Forms on Admissible
Morphisms)**. A **flow** on `(C, (tau), σ)` is a family of endofunctors
`F_t : C → C` (discrete or continuous time) that:

- is compatible with the stratification (stratum safety),
- preserves coverage (coverage continuity),
- preserves admissibility (sends `Adm` to `Adm`), and
- preserves normalisation witnesses (normalisation stability).

Using the flow–nucleus compatibility acts and the normal-form structure, each
such flow satisfies:

- **Commutation with normalization.**  
  For every admissible morphism `f`, the composites
  `F_t(N∞(f))` and `N∞(F_t(f))` are equivalent in the sense of the
  flow–nucleus geometry; that is,
  `F_t ∘ N∞ ≃ N∞ ∘ F_t` on `Adm`.

- **Canonicity under flow.**  
  The normal form `N∞(f)` is a canonical representative of the flow-orbit of
  `f`: applying the flow first and then normalising yields the same nucleus as
  normalising first and then flowing.

In particular, evaluation flows (which execute dynamics) and normalization
flows (which contract to normal form) can be combined without ambiguity: the
choice of interleaving does not change the semantic nucleus class of an
admissible morphism.

