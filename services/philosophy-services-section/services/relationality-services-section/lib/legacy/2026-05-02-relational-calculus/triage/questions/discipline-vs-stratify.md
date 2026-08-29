---
name: discipline-vs-stratify
type: question
status: open
explores: [discipline-regime-filter-profile, stratifying, cohesive-chain, ritm]
---

The relational calculus carries two hierarchies that look like they describe the same content from different sides — but the source material does not state their equivalence.

## The two hierarchies

**Discipline / Regime / Filter / Profile** ([discipline-regime-filter-profile.md](../teaching/explanations/discipline-regime-filter-profile.md)):

- *Discipline* — a unary endomap commuting with all nuclei.
- *Regime* — the fixed-point set of a Discipline.
- *Filter* — a Discipline that additionally commutes with Flow and with the four cohesive functors of RITM.
- *Profile* — the fixed-point set of a Filter; carries the entire four-part chain (Filter-Induced Reflexive Reconstruction).

**Stratify / Constructible** ([stratifying.md](../teaching/explanations/stratifying.md)):

- *Stratify* — the operation that decomposes the relational field into strata along the cohesive chain.
- *Constructible* — the property of being a stratum (a closed sub-field active under the constructible reasoning of the cohesive geometry).

## Are they the same hierarchy?

Three readings:

1. **Profile = Constructible stratum.** Every Profile is a constructible stratum, and every constructible stratum is the Profile of some Filter. On this reading, the two hierarchies are the same content described from the act-algebra side (Discipline → Profile) and from the geometric side (Stratify → Constructible).

2. **Profile ⊂ Constructible stratum.** Every Profile is a constructible stratum but not conversely — there are constructible strata not realized as Profiles of any Filter. This would mean Stratify is more general than Discipline.

3. **Profile ⊅ Constructible stratum but they overlap.** The two hierarchies share an intersection (the strata that are also Profiles) but neither contains the other.

## Why it matters

Filter-Induced Reflexive Reconstruction (Theorem in [discipline-regime-filter-profile.md](../teaching/explanations/discipline-regime-filter-profile.md)) says every Profile carries a complete four-part framework. If Profile = Constructible stratum, then every constructible stratum carries one too — which would link the cohomological invariants of the cohesive geometry directly to the four-part-framework instances on each stratum. If they are not equivalent, no such direct link exists, and the cohomological side of the calculus loses one of its main applications.

## Status

Open. The most likely answer is Position 1 (Profile = Constructible stratum) because the *Filter commutes with the cohesive functors* condition is exactly what guarantees the stratum is constructible in the cohesive sense. But the source material does not prove this; the two hierarchies are introduced in different chapters with no theorem connecting them.
