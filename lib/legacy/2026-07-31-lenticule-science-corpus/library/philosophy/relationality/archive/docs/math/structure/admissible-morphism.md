---
title: Admissible Morphism
id: admissible-morphism
role: structure
status: plan
derived_from: theorem/internal/stratified-site-structure
proof_refs: []
---



## Definition

- Carrier: admissible morphisms `Adm ⊂ Mor(C)` in a stratified ∞-site.
- Source: induced by the stratified site structure
  [`stratified-site-structure`](../theorem/internal/stratified-site-structure.md).

## Invariants
- Stratified polarity: admissible morphisms respect the stratification step.
- Locality: admissibility is local on the coverage; pullbacks along covers exist and glue.
- Factorisation: every admissible morphism factors as `Gen ∘ Obs`, stable under pullback/composition.

## Proof
- Derived from: [`stratified-site-structure`](../theorem/internal/stratified-site-structure.md) which earns the site, coverage, and stratification data.
- Shows that: the earned site structure determines the admissible class with polarity, locality, and factorisation properties; uniqueness up to earned equivalence follows from the site derivation.
