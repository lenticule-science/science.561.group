---
title: Relational directed stratified Infinity-Sites
aliases:
  - Relational directed stratified Infinity-Sites
  - relational directed stratified infinity-sites
tags:
  - text
  - homotopy
  - infinity-site
depends-on:
  - theorem/internal/flow-nucleus-compatibility
  - theorem/internal/profile-flow
  - theorem/internal/sheaf-semantics
operations:
  - name: discipline
  - name: filter
  - name: tower
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Relational Directed Stratified Infinity-Sites)

Directed ∞-sites generalize Grothendieck sites by layering coverage conditions
across multiple strata. In the relational calculus, the profile/filter/tower acts
provide exactly the machinery needed to build such stratified directed sites.
This text formalizes the correspondence.

## 1. Stratified coverage

**Theorem 1 (Stratified cover system).**  
Acts Discipline through
Filter define a stratified coverage on the
recognitions: each discipline specifies a layer, and filters record covering
families active under flow/nucleus behavior.

*Proof sketch.* Disciplines are compatible with the directed geometry (flow +
nucleus), and filters commute with them (Compose Filter).
Therefore every stratum inherits a coverage that respects directed reductions,
matching the axioms of a stratified site. ∎

## 2. Directed structure and profiles

**Theorem 2 (Profiles as objects of a directed site).**  
Profile Recognitions,
Trace Profile, and
Geometry Profile show that each profile
inherits the directed geometric structure, giving the “objects” of the site.

*Proof.* The cited acts reconstruct the entire trace, context, and geometry inside
each profile, so every layer behaves like a directed object equipped with covers. ∎

## 3. Higher cells via towers

**Theorem 3 (Infinity structure).**  
Towers such as Build Profile Tower,
Build Nested Profile Tower,
and Build Composite Profile Tower
organize profiles into higher-dimensional cells; together they behave like the
∞-levels of a stratified site.

*Proof sketch.* Each tower act iterates the profile construction while preserving
compatibility with filters/disciplines. This yields coherence data across levels,
analogous to the nerve of an ∞-site. ∎

## 4. Directed coverage with observables

**Theorem 4 (Directed sieves with observables).**  
Observe through
Reach attach observables and reachability to the
directed geometry, ensuring covering families can be measured and compared.

*Proof.* The observable acts
(Observe, Systematize Physics,
and Interpret Physics) interpret flow behavior,
while Stabilize Invariant and
Reach capture persistent coverage conditions. These exactly
mirror sieves in a directed site. ∎

## Resulting structure

| Component | Relational witnesses |
| --------- | -------------------- |
| Stratified coverage | Profile/filter acts (Discipline -> Compose Filter) |
| Objects of the site | Profile recognitions and dynamics (Profile Recognitions -> Sound Profile Physics) |
| Higher cells (∞-structure) | Tower builders (Build Profile Tower -> Build Composite Profile Tower) |
| Directed observables/sieves | Observable and physics acts (Observe -> Stabilize Invariant and Reach) |

Thus the calculus provides a directed, stratified ∞-site: each stratum has a
coverage stable under flows; towers supply higher morphisms; and observables
offer the sieves needed for gluing. Future work can now define sheaves or stacks
on this site directly within the relational framework.
