---
title: Stratified Infinity-Site Structure
role: "Directed, stratified \u221E-site induced by discipline/filter/tower acts."
inputs: []
outputs:
- id: stratified-site-structure
  name: site
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The profile, discipline, filter, and tower acts induce the structure of a
directed, stratified ∞-site. In particular, they produce:

- a small ∞-category `C` of recognitions and their directed morphisms,
- a Grothendieck-style coverage `(tau)` on `C`, and
- a stratification function `σ : Ob(C) → ℕ` compatible with the directed
  structure.

Concretely:

- Discipline and filter acts stratify recognitions into levels
  (`σ = 0,1,2,…`) and define covering families that are active under
  flow–nucleus behaviour and base change, as summarised in the external
  theorem on directed stratified ∞-sites.
- Tower acts (such as profile towers) organise objects and morphisms into
  higher-dimensional cells, giving the ∞-level structure of `C`.
- The sheaf condition and presheaf-topos acts ensure that the coverage data
  behaves like a Grothendieck coverage on this stratified directed category.

We call any such triple `(C, (tau), σ)` a **stratified ∞-site** in the relational
setting: objects are judgements/recognitions, morphisms are derivations, and
the stratification records their level in the profile/tower hierarchy.

## Proof
- TODO: fill proof.
