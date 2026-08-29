---
title: "Sheaf Semantics"
aliases:
  - "Sheaf Semantics"
  - "sheaf semantics"
id: gfrtu-sheaf-semantics
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: concept
tags: []
---

## Concrete example first

You have two overlapping local traces and assign a meaning to a recognition term on each one. If those local meanings agree on overlap, sheaf semantics says they must glue to one global meaning. If they disagree on overlap, no global meaning is allowed.

## Formal definition

In GFRTU, an RTL judgment is interpreted as a single arrow in the sheaf topos
$R=\mathbf{Sh}(T,J)$, not as disconnected per-trace functions.
Fiberwise components appear because arrows of sheaves are natural families satisfying compatibility with restriction maps.

So **sheaf semantics** is the requirement that interpretation respects locality, compatibility on overlaps, and gluing in $(T,J)$.

## Why it matters in GFRTU

- It turns trace-indexed data into coherent global semantics.
- It prevents contradictory local interpretations from entering the universe.
- It is one of the three closure principles used to generate GFRTU.


---

<!-- source: archive/triage/relationality/domains/relationality-slop-2025-04/domains/internal/sheaf-semantics.md -->

## Imported source: archive/triage/relationality/domains/relationality-slop-2025-04/domains/internal/sheaf-semantics.md

---
title: Sheaf Semantics
aliases:
  - Sheaf Semantics
  - sheaf semantics
date-created: "2026-03-04T00:00:00"
tags:
  - sheaf
  - presheaf
  - topos
depends_on:
  - presheaf
  - presheaf-topos
  - sheaf-condition
  - sheafification
  - profile-topos
---

# Theorem (Sheaf Semantics)

The profile/filter/tower machinery already builds a presheaf topos; the acts in
the sheaf family promote this to genuine sheaves and stacks on the relational
∞-site.  This theorem enumerates the witnesses.

## 1. Presheaf structure

**Theorem 1 (Presheaves on recognitions).**  
[Presheaf](../../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/presheaf.md) and
[Presheaf Topos](404.md) interpret recognitions as
presheaves on the profile site.  They reuse the flow/nucleus compatibility to
define restriction maps and show that finite limits/exponentials exist.

*Proof sketch.* The acts explicitly construct the presheaf category and show it
inherits the topos structure from the fixed profile semantics.  Therefore every
recognition yields a presheaf object (contexts ↦ observations). ∎

## 2. Sheaf condition

**Theorem 2 (Sheafification).**  
[Sheaf Condition](../../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-02/acts/sheaf-condition.md) and
[Sheafification](404.md) enforce the usual cover-glue
axioms with respect to the discipline/filter coverage (from the ∞-site theorem).
The proof uses the same flow–nucleus commutation to glue compatible sections.

*Proof sketch.* Coverage is provided by discipline/filter acts; `SheafCondition`
checks matching families and `Sheafification` freely adjoins the necessary
sections.  Their proofs show that the resulting object satisfies the usual sheaf
equalizer diagrams. ∎

## 3. Relation to profile topos

**Theorem 3 (Comparison with profile topos).**  
[Profile Topos](404.md) embeds the fixed profile category
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
