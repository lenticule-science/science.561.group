---
title: Sheaf Semantics
aliases:
  - Sheaf Semantics
  - sheaf semantics
keywords:
  - sheaf
  - presheaf
  - topos
depends-on:
  - presheaf
  - presheaf-topos
  - sheaf-condition
  - sheafification
  - profile-topos
description: The profile/filter/tower machinery already builds a presheaf topos; the acts in the sheaf family promote this to genuine sheaves and stacks on the relational ∞-site.
---

# Theorem (Sheaf Semantics)

The profile/filter/tower machinery already builds a presheaf topos; the acts in
the sheaf family promote this to genuine sheaves and stacks on the relational
∞-site.  This theorem enumerates the witnesses.

## 1. Presheaf structure

**Theorem 1 (Presheaves on recognitions).**  
[Presheaf](../../research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality/domains/slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/presheaf.md) and
[Presheaf Topos](../../research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality/domains/relationality-slop-2025-04/domains/internal/404.md) interpret recognitions as
presheaves on the profile site.  They reuse the flow/nucleus compatibility to
define restriction maps and show that finite limits/exponentials exist.

*Proof sketch.* The acts explicitly construct the presheaf category and show it
inherits the topos structure from the fixed profile semantics.  Therefore every
recognition yields a presheaf object (contexts ↦ observations). ∎

## 2. Sheaf condition

**Theorem 2 (Sheafification).**  
[Sheaf Condition](../../research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality/domains/slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/sheaf-condition.md) and
[Sheafification](../../research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality/domains/relationality-slop-2025-04/domains/internal/404.md) enforce the usual cover-glue
axioms with respect to the discipline/filter coverage (from the ∞-site theorem).
The proof uses the same flow–nucleus commutation to glue compatible sections.

*Proof sketch.* Coverage is provided by discipline/filter acts; `SheafCondition`
checks matching families and `Sheafification` freely adjoins the necessary
sections.  Their proofs show that the resulting object satisfies the usual sheaf
equalizer diagrams. ∎

## 3. Relation to profile topos

**Theorem 3 (Comparison with profile topos).**  
[Profile Topos](../../research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality/domains/relationality-slop-2025-04/domains/internal/404.md) embeds the fixed profile category
into the presheaf topos.  Composing with sheafification yields an equivalence
between profile-recognitions and sheaves on the relational site.

*Proof sketch.* The profile topos act already packages finite limits/exponentials
for recognitions.  The sheafification acts preserve these structures, so the
embedding lands inside the sheaf subcategory.  Since every sheaf arises from a
profile object via sheafification, the comparison is an equivalence up to the
expected stabilization. ∎

## Summary

| Feature | Witnessing acts |
| ------- | ---------------- |
| Presheaf category | `Presheaf`, `PresheafTopos` |
| Sheaf condition | `SheafCondition`, `Sheafification` |
| Comparison | `ProfileTopos` plus sheafification |

This theorem provides the internal backbone for any sheaf/topos correspondence.
