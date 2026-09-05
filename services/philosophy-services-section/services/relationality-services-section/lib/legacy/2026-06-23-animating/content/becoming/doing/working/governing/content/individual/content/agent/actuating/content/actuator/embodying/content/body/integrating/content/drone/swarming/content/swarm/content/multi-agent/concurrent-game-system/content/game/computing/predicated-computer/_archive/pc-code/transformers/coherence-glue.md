---
type: morphism
class: composed-operator
realizes: [repair]
depends-on: [merge, repair, repair-catalog]
see-also: [settle, sync]
---

# Coherence glue

The operator that resolves a *coherence violation*: when two substrate sources record different values for the same predication, coherence-glue applies the substrate's declared repair recipe to produce a single canonical predication. The operator is the engineering realization of "two sections agree on the overlap; merge them; if they disagree, the substrate's declared repair handles it."

## Signature

`coherence-glue(predication-coordinates, conflicting-values, scope) → (resolved-value, witness) | (abort, witness)`

Inputs:

- **`predication-coordinates`** — the (subject, predicate, object) of the conflicting predication.
- **`conflicting-values`** — the two (or more) values the conflict is between, with citation to their sources (which substrate region or which replica each value came from).
- **`scope`** — reference to the [scope](teaching/explanations/scope.md) within which the conflict is being resolved; determines which [repair-catalog](../objects/repair-catalog.md) version applies.

Outputs:

- **`resolved-value`** — on success, the single canonical value the substrate adopts for the predication. Future reads see this value.
- **`abort`** — on failure, the conflict is irreducible: the repair catalog has no admissible resolution. The substrate's [governance](theories/agential-orchestration-platform/concepts/governance.md) is invoked to choose; alternatively, the conflict is recorded as a hard violation pending external decision.
- **`witness`** — records the conflict (input values and sources), the repair recipe applied (if any), the resolution.

## Operational semantics

Coherence-glue proceeds in four phases:

1. *Identify repair entry.* The repair catalog is consulted for an entry whose triggering condition matches the conflict: typically a `coherence-violation` repair scoped to the predication's predicate. If no entry matches, the conflict is irreducible at substrate level.
2. *Apply recipe.* The repair entry's recipe is applied per [repair](teaching/explanations/repair.md) discipline. Common recipes:
   - **Value-domain join.** When the substrate's value-domain has a meaningful join (bilattice knowledge-order join, multi-valued aggregation, weighted average), the resolved value is the join of the conflicting values.
   - **Provenance precedence.** When the conflicting values have different [provenance](teaching/explanations/provenance.md) chains, the recipe may declare which provenance source has precedence; the resolved value is the precedence-winner's value.
   - **Timestamp precedence.** When the values have different recorded times, the recipe may declare the most-recent value wins. (Note: timestamps are typically not authoritative in the substrate; this recipe is a particular choice for particular contexts.)
   - **Retract-on-conflict.** The recipe retracts both conflicting values and admits the predication as unrecorded; the substrate later may re-derive the predication from authoritative sources.
   - **Parallel-edges-until-resolved.** Both conflicting values are admitted as parallel predications at the same coordinates, each carrying its own provenance citation. Queries against the predication report all parallel values; the substrate does not pick a winner. Resolution is deferred to a later operation — typically a governance decision, an authoritative-source re-read, or an explicit operator action — that retracts all but one of the parallel values. This recipe is appropriate where deterministic resolution is impossible at conflict time but where dropping data is unacceptable; the cost is that downstream operations must be parallel-aware until a later retraction collapses the set.
3. *Insert resolved value.* Per [insertion](insertion.md), the resolved value is written to the predication-graph store at the cited coordinates. The previous conflicting values are retracted with their citations recorded.
4. *Witness emit.* The composed witness records every step.

## Engineering invariants

- **Recipe must be cataloged.** A coherence repair invoked on a predication-predicate must have a corresponding catalog entry; ad-hoc resolutions are not admissible.
- **Resolution is deterministic.** Given the same conflict (same input values, same sources, same scope, same catalog version), the resolved value is the same across all substrates applying the recipe.
- **Witness is auditable.** The witness records the inputs, the recipe, the resolution; an auditor with both can replay the resolution byte-for-byte.

## Failure modes

- **No catalog entry.** The repair catalog has no admissible recipe for this predicate's coherence violation. Coherence-glue aborts; the substrate's governance is invoked to make a decision (or the conflict is left for human resolution).
- **Recipe-failure.** The recipe runs but produces an undefined result (e.g., the value-domain join is partial and undefined for these inputs). The substrate's repair discipline determines the next step: typically escalate to a higher-severity repair recipe.

## Position in the substrate

Coherence-glue is the substrate's *conflict-resolution primitive*. It is invoked by [merge](merge.md) when CRDT join produces conflicting values, by [sync](sync.md) when replicas disagree, by [settle](settle.md) when closure rules produce contradictory conclusions. The substrate's discipline is that *every coherence resolution is cataloged*; without coherence-glue, conflicts are silently resolved by host-runtime ordering accidents, breaking determinism and replayability.
