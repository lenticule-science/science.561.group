---
source: [target, rules, fuel]
target: [settled, witness]
name: settle
description: "FARS's realization of the substrate-level settle morphism, applied to a fiber (or a fiber map across multiple entities) under the platform's closure-rule system."
type: morphism
class: composed-operator
instantiates: [settle]
depends-on: [fiber, compose, witness]
see-also: [respond, dispatch, closure-rule, fuel-bound, rule-addition-is-substrate-local, instinct-confidence-is-closure-fixpoint-measure]
title: settle
---


FARS's realization of the substrate-level [`settle`](settle.md) morphism, applied to a [fiber](../structures/fiber.md) (or a fiber map across multiple entities) under the platform's closure-rule system.
`settle` runs closure-rule applications in BFS layers until either *quiescence* (no rule's premise matches against a cell that does not already record the rule's conclusion) or *fuel exhaustion*.
The output is the settled fiber (or fiber map) plus a [`Witness`](../objects/witness.md) recording every layer's hash, every fired rule, and every repair invoked.

`settle` is the inference engine that drives FARS forward.
[`respond`](respond.md) calls it as its second phase (after composing entity fiber with message fiber); the heartbeat tick calls it across the wavefront when an edit propagates; dispatch calls it on each candidate entity when a query needs richer responses than the candidate's stored fiber alone provides.

## Signature

```
settle(target; rules, fuel) → (settled, witness)
```

Inputs:

- **`target`** — either a single [`Fiber`](../structures/fiber.md) (single-entity settle) or a fiber-map from entity-address to fiber (multi-entity wavefront settle).
  The two cases are unified internally; single-entity is the trivial case of the multi-entity machinery.
- **`rules`** — the closure-rule system to apply.
  The rule system is itself substrate content: rule records carrying premise patterns, conclusion patterns, and match-radius declarations.
- **`fuel`** — bound on iteration layers per [fuel-bound](../../../../teaching/explanations/fuel-bound.md).
  Realizations SHOULD default to a value sufficient for typical FARS rule-systems; the bilattice's bounded-orbit property (per [@adjoint-structure-spo-bilattice] Proposition 8) and FARS's bounded match-radii typically settle in 2–4 layers.

Outputs:

- **`settled`** — the input target with closure rules applied to fixed-point (or fuel-exhausted state).
  The output's structure (single fiber or fiber-map) matches the input's.
- **`witness`** — the [`Witness`](../objects/witness.md): every layer's input/output hashes, every fired rule's identity and match site, every consumed unit of fuel, every repair invoked.

## Operational semantics

`settle` SHALL proceed in *layers*.
Per layer:

1. **Match.** Walk the rule system; for each rule, scan the target for cells (or cell configurations) that match the rule's premise.
  Per [closure-rule-application](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), the match operation reads at the rule's declared radius — single-entity rules read one fiber's cells; cross-entity rules read a bounded set of fibers from the fiber-map.
2. **Apply.** For each match, compute the rule's conclusion: a set of cells (with their values) to add to the target.
  The conclusion is composed into the target via [`compose`](compose.md) — pointwise $\odot$ on the target's existing values and the conclusion's values.
3. **Witness.** Record the layer's input hash, the fired rules' identities and match sites, the layer's output hash.
  Repairs invoked during the layer (per [repair](../../../../teaching/explanations/repair.md)) are recorded with their before/after hashes.
4. **Check quiescence.** If no rule fired in this layer, the target is settled — return.
  Otherwise, increment the layer counter; if it has reached `fuel`, return with the witness recording fuel exhaustion.
  Otherwise, proceed to the next layer.

The order of rule applications *within* a layer SHALL be determined by canonical hash (lexicographic), per [determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md).
This ensures byte-identical settled output across runs and across realizations.

## Normative invariants

- **Deterministic.** Per the substrate-level [`settle`](settle.md) morphism: same target + same rule system + same fuel SHALL produce byte-identical output and witness.
- **Locality-respecting.** Each rule reads at its declared match-radius; a conformant realization's working memory SHALL be bounded by the active wavefront (the cells changing in the current layer), not by the target's total cell count.
  A single-entity settle's wavefront is the cells changing on that entity; a multi-entity wavefront settle's is the active frontier across all entities currently changing.
- **Idempotent on settled input.** If `target` is already at fixed-point under `rules`, the first layer SHALL find no matches and return; the witness records "no advance," fuel is unconsumed, the output is the input.
- **Witness-emitting.** Every settle SHALL produce a `Witness`.
  A settle that returns without producing a witness violates the audit contract and is a non-conformance.

## Failure modes

- **Fuel exhaustion.** When the rule system on this input would require more layers than `fuel`, `settle` SHALL return the last stable state with the witness recording fuel exhaustion.
  Callers MAY retry with more fuel, escalate, or accept the partial settlement per their operational policy.
- **Repair failure.** A coherence repair with no admissible recipe (e.g., conflicting sections that cannot be reconciled under the current rule system) SHALL either record the failure as a witness diagnostic (soft) or abort `settle` (hard); the choice is the rule system's, declared on the repair's catalog entry.
- **Closure-rule-system mismatch.** If `rules` is a version different from the substrate's current rule-system version, `settle` SHALL either run against the cited version (deterministic replay) or abort (the cited version is no longer authoritative).
  Both modes are admissible; conformant realizations declare which they default to.

## Position

`settle` is FARS's primary computation morphism.
Every FARS morphism that performs inference reduces to a sequence of `settle` calls — sometimes one (a direct query), sometimes a cascade (a wavefront triggered by a substrate edit).
The rest of the algebra ([`compose`](compose.md), [`restrict`](restrict.md)) handles the per-cell mathematics; `settle` orchestrates cell-level moves into a fixed-point computation.
