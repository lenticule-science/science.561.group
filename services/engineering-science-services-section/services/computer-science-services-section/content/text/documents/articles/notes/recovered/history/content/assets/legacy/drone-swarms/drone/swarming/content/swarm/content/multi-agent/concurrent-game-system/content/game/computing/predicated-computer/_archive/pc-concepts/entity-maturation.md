---
type: concept
class: pattern
depends-on: [closure-rule, vocabulary-completeness]
see-also: [identity-by-relations, closure-conditions]
---

# Entity maturation

The pattern by which a *single substrate entity* progresses from raw declaration to fully-related, fully-classified content. Entity maturation is structurally distinct from [closure-conditions](closure-conditions.md) (which characterizes a sub-region's completeness) and from settlement-path (which characterizes derived-content stages from observation to tool); this pattern is about how *one entity* moves from "just admitted" to "settled."

The arc has three named stages:

- **Fleeting.** The entity exists with the minimum predications required for substrate residency: typically `id` and `description` only. The entity is admissible at the substrate's bare-presence condition (per [closure-conditions](closure-conditions.md) condition 1) but carries no relations. Operations that consult the entity find content but no structure. The entity is in the graph but unconnected.
- **Working.** Relations have been added: predications connecting the entity to other entities, plus declared *unresolved* dependencies (predications cited as `given:` or equivalent — markers that further structure is required but not yet present). The entity is in the graph and partially structured, but has non-zero defect: its relations are not yet fully normalized. The substrate's reflection rules can detect the defect and the operations consulting the entity see "partial structure with declared gaps."
- **Settled.** All relations have been normalized to specific predicates (no generic `related:` placeholders remain). All declared `given:` dependencies have been resolved. The entity's defect is zero. The entity is unconditionally part of the substrate's settled content; operations consulting it find complete structure.

## What drives maturation

The progression is driven by the substrate's closure machinery applied to the entity's predications:

- **Forward normalization** (the substrate's $\Delta$-style rules): when the entity carries a generic `related:` predication, closure rules examine the targeted entities and the entity's other content to derive a more-specific predicate (`uses:`, `extends:`, `produces:`, etc.). The generic predication is replaced; the entity's defect decreases.
- **Backward resolution** (the substrate's $\sigma$-style rules): when the entity carries a `given:` predication declaring an unresolved dependency, closure rules check whether the cited dependency has now been provided by other substrate state. If so, the `given:` is resolved (replaced with concrete predications); the entity's defect decreases.
- **Convergence.** Both rule families together eventually reach a fixed point: no further normalizations apply, no further resolutions are pending. The entity is settled.

## Engineering properties

- **Substrate-recorded.** Each transition (fleeting→working, working→settled) produces a witness; the substrate's audit can show every entity's maturation history.
- **Per-entity, not per-region.** A scope may contain entities at different maturation stages simultaneously: some fleeting, some working, some settled. The substrate's coherence does not require uniformity.
- **Non-monotone in defect, eventually convergent.** The defect (count of generic predications + unresolved `given:`s) may temporarily rise during working stage as new relations are noted; convergence to zero is what marks settlement.
- **Distinct from [closure-conditions](closure-conditions.md) stages.** Closure conditions characterize a sub-region; entity maturation characterizes one entity. A scope might contain a settled entity at the bare-presence stage of regional completeness, or a fleeting entity in a closed locale.

## Position in the substrate

Entity maturation is the substrate's *single-entity normalization arc*. Per [self-representation](self-representation.md), the substrate's closure machinery sees the entity's defect as substrate content; per [vocabulary-completeness](vocabulary-completeness.md), maturation closes vocabulary debt at the per-entity level (resolving `given:` predications adds the cited entities or links to their existing forms).

A predicated computer that carries many fleeting entities indefinitely has a high vocabulary-debt and reflection-debt overhead; a substrate that drives entities through to settled has zero per-entity defect at any moment. The discipline is the substrate's commitment to *closure of individual entities*, complementing closure-conditions' commitment to *closure of sub-regions*.
