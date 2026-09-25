---
title: Relational directed stratified Infinity-Sites
aliases:
  - Relational directed stratified Infinity-Sites
  - relational directed stratified infinity-sites
keywords:
  - text
  - homotopy
  - infinity-site
operations:
  - name: discipline
  - name: filter
  - name: tower
depends-on:
  - theorem/internal/flow-nucleus-compatibility
  - theorem/internal/profile-flow
  - theorem/internal/sheaf-semantics
description: Directed ∞-sites generalize Grothendieck sites by layering coverage conditions across multiple strata.
---

# Theorem (Relational Directed Stratified Infinity-Sites)

Directed ∞-sites generalize Grothendieck sites by layering coverage conditions
across multiple strata. In the relational calculus, the profile/filter/tower acts
provide exactly the machinery needed to build such stratified directed sites.
This text formalizes the correspondence.

## 1. Stratified coverage

**Theorem 1 (Stratified cover system).**  
Acts [Discipline](../../research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality/domains/relationality-slop-2025-04/acts/discipline.md) through
[Filter](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/filter.md) define a stratified coverage on the
recognitions: each discipline specifies a layer, and filters record covering
families active under flow/nucleus behavior.

*Proof sketch.* Disciplines are compatible with the directed geometry (flow +
nucleus), and filters commute with them ([Compose Filter](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/compose-filter.md)).
Therefore every stratum inherits a coverage that respects directed reductions,
matching the axioms of a stratified site. ∎

## 2. Directed structure and profiles

**Theorem 2 (Profiles as objects of a directed site).**  
[Profile Recognitions](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/profile-recognitions.md),
[Trace Profile](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/trace-profile.md), and
[Geometry Profile](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/geometry-profile.md) show that each profile
inherits the directed geometric structure, giving the “objects” of the site.

*Proof.* The cited acts reconstruct the entire trace, context, and geometry inside
each profile, so every layer behaves like a directed object equipped with covers. ∎

## 3. Higher cells via towers

**Theorem 3 (Infinity structure).**  
Towers such as [Build Profile Tower](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/build-profile-tower.md),
[Build Nested Profile Tower](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/build-nested-profile-tower.md),
and [Build Composite Profile Tower](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/build-composite-profile-tower.md)
organize profiles into higher-dimensional cells; together they behave like the
∞-levels of a stratified site.

*Proof sketch.* Each tower act iterates the profile construction while preserving
compatibility with filters/disciplines. This yields coherence data across levels,
analogous to the nerve of an ∞-site. ∎

## 4. Directed coverage with observables

**Theorem 4 (Directed sieves with observables).**  
[Observe](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/observe.md) through
[Reach](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/reach.md) attach observables and reachability to the
directed geometry, ensuring covering families can be measured and compared.

*Proof.* The observable acts
([Observe](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/observe.md), [Systematize Physics](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/systematize-physics.md),
and [Interpret Physics](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/interpret-physics.md)) interpret flow behavior,
while [Stabilize Invariant](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/stabilize-invariant.md) and
[Reach](../../../../../../services/relationality-services-section/content/text/documents/articles/notes/reach.md) capture persistent coverage conditions. These exactly
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
