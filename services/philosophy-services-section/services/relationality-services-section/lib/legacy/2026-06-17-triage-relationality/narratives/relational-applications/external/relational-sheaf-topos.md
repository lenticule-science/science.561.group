---
title: Relational sheaf Topos
aliases:
  - Relational sheaf Topos
  - relational sheaf topos
tags:
  - sheaf
  - topos
  - site
depends-on:
  - theorem/internal/sheaf-semantics
  - theorem/internal/flow-nucleus-compatibility
operations:
  - name: cover
  - name: sheafification
  - name: subobject classifier
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Relational Sheaf Topos)

The relational calculus with its stratified site (discipline/filter/tower) gives
rise to a genuine sheaf topos.  This theorem explains the correspondence with
classical sheaf theory.

## 1. Site and coverage

**Theorem 1 (Relational site).**  
The acts described in the ∞-site theorem—
Discipline through
Filter, plus the tower acts—define a Grothendieck site
with coverage.  Sections are profile recognitions; covering families are filters.

*Proof sketch.* `Relational Directed Stratified Infinity-Sites` already proves
this: each stratum has coverage stable under flow/nucleus and towers give higher
cells.  We reuse that result verbatim. ∎

## 2. Sheaf condition and sheafification

**Theorem 2 (Sheaves coincide with stabilized recognitions).**  
Sheaf Condition matches the usual matching
family glueing requirement, and Sheafification
produces the associated sheaf.  Sections of a sheaf correspond to stabilized
profile recognitions.

*Proof sketch.* By construction, `SheafCondition` checks that local data on covers
agree on overlaps; `Sheafification` uses the same nucleus/flow compatibility to
glue.  Therefore the relational sheaves satisfy precisely the classical axioms. ∎

## 3. Topos structure

**Theorem 3 (Sheaf topos).**  
Profile Topos and
Presheaf Topos carry over to the sheaf setting
since the sheafification functor preserves finite limits and exponentials.
Hence the category of relational sheaves is a topos whose internal logic matches
the previously earned Heyting algebra.

*Proof sketch.* Sheafification is left exact; the earned acts guarantee it
respects exponentials and subobject classifiers.  Consequently the sheaf category
inherits the topos structure from the presheaf category, just as in classical
sheaf theory. ∎

## Summary

| Classical notion | Relational witnesses |
| ---------------- | -------------------- |
| Site/coverage | Discipline/filter/tower acts (see ∞-site theorem) |
| Sheaf condition | `SheafCondition`, `Sheafification` |
| Sheaf topos | `PresheafTopos`, `ProfileTopos`, plus sheafification |

Thus the relational calculus hosts its own sheaf topos equivalent to the usual
construction on a Grothendieck site.
