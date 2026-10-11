---
type: morphism
class: composed-operator
realizes: [repair, doctrine-fidelity]
depends-on: [repair-catalog, witness, closure-rule-system]
see-also: [coherence-glue, settle, retire]
---

# Apply-repair

The composed operator that resolves a contested or contradictory substrate predication by applying a declared recipe from the [repair catalog](../objects/repair-catalog.md). Where settlement produces contradictions (per [coherence-glue](coherence-glue.md)) or constraint evaluations surface violations (per [constraint-record](../objects/constraint-record.md)), apply-repair is the substrate's response: a witnessed, declared, replicable resolution rather than a silent overwrite.

Apply-repair distinguishes the substrate's discipline from naive conflict resolution. A substrate without apply-repair has to choose between rejecting contradictions (refusing admissions that would conflict, losing concurrent-edit support) or silently absorbing them (discarding the conflicting evidence, losing audit trail). Apply-repair admits both contradictions: the conflict is recorded, the resolution recipe is declared, the application is witnessed, and the substrate's audit can trace any current state to the repair history that produced it.

## Signature

`apply-repair(contested-region, repair-recipe, repair-context, fuel) → (repaired-region, witness, status)`

Inputs:

- **`contested-region`** — references to the substrate region carrying the contradiction: typically a [fiber](../objects/fiber.md) or a [scope](../objects/scope-record.md) in which one or more predications carry contested values (per the substrate's [value-domain](teaching/explanations/substrate-value-domain.md), $\top$ in the four-bilattice).
- **`repair-recipe`** — reference to the [repair-catalog](../objects/repair-catalog.md) entry declaring how the contradiction is to be resolved. The recipe specifies which predications to retract, which to admit, what side to favor, what witness annotations to attach.
- **`repair-context`** — references to the cited [closure-rule-system](../objects/closure-rule-system.md), the responsible agent or office (per the agential subtheory), and any authorization predications gating the repair.
- **`fuel`** — bound on the repair work per [fuel-bound](teaching/explanations/fuel-bound.md).

Outputs:

- **`repaired-region`** — the substrate region with the contradiction resolved. The contested predications are either retracted, replaced, annotated with the repair's resolution, or marked-and-deferred per the recipe.
- **`witness`** — the witness recording the repair: contested-region hash before repair, recipe hash, before-and-after hashes of every modified predication, repair-context hashes, fuel consumed.
- **`status`** — one of `repaired` (the contradiction is resolved), `partial` (some predications repaired, others remain contested), or `escalated` (the recipe could not resolve the contradiction; an escalation predication is admitted for human or supervisory attention).

## Operational semantics

Apply-repair proceeds through four phases:

1. **Recipe resolution.** The cited repair-recipe is fetched from the substrate's [repair-catalog](../objects/repair-catalog.md). The recipe declares: which predications to retract, which to admit, what evidence to attach, what authorization is required.
2. **Authorization check.** The repair-context's responsible agent or office is checked against the recipe's authorization requirements. An unauthorized repair attempt is rejected; the rejection witness records the authorization failure.
3. **Recipe application.** The cited predications are modified per the recipe: retractions per [retraction](retraction.md), admissions per [admit](admit.md) (with elevated trust per the recipe), value adjustments per the substrate's [extend-restrict adjoint](teaching/explanations/extend-restrict-adjoint.md). Each modification produces its own witness, linked to the repair's parent witness.
4. **Re-settlement.** The repaired region is run through the substrate's [settle](settle.md) operator under the active closure-rule-system. Settlement may discover additional contradictions; per the recipe's policy, these are either retried (a recursive repair under the same recipe), escalated (the repair status is updated to `escalated`), or accepted as new contested predications requiring different repairs.

## Engineering invariants

- **Recipe-declared, not ad-hoc.** Every repair cites a [repair-catalog](../objects/repair-catalog.md) entry. The substrate refuses ad-hoc repairs whose justification isn't substrate content; this is what makes repairs auditable.
- **Witness-emitting.** Every modification under the repair produces a witness; the parent repair witness links them into a coherent chain. An auditor can trace from the original contradiction through every applied modification to the final state.
- **Authorization-respecting.** The cited recipe's authorization requirements must be satisfied. Per [self-representation](teaching/explanations/self-representation.md), the authorization predications are themselves substrate content, queryable through normal traversal.
- **Non-monotonic with provenance.** Apply-repair may *retract* predications, breaking the substrate's general monotonicity. Per the substrate's [installed-base constraint](teaching/explanations/infrastructure-as-substrate.md), retractions are admissible only when declared and witnessed; the audit chain preserves what was retracted.

## Failure modes

- **Unauthorized repair.** The repair-context's responsible agent lacks the authorization the recipe requires. The witness records the authorization failure; the substrate state is unchanged.
- **Recipe-fail.** The cited recipe cannot resolve the contradiction (e.g., the recipe assumes evidence the substrate doesn't carry). The repair's status is `escalated`; an escalation predication is admitted citing the failure cause.
- **Hard contradiction.** The contradiction is in a region the substrate's discipline marks as unrepairable (e.g., bootstrap predications, identity predications). The repair is rejected; the substrate's caller must intervene at a higher level (substrate-edit, federation reconciliation).
- **Re-settlement non-convergence.** The post-repair settlement does not reach quiescence within fuel. The repair's status is `partial`; the witness records the un-settled state, and the caller may re-run with increased fuel or escalate.
- **Recipe-rejection by audit.** The substrate's audit-side detects that the repair would falsify a witnessed prior state — the repair is being applied to a region whose contradiction has already been audited and accepted as historical. The repair is rejected as historically-incompatible; the witness records the rejection.

## Position in the substrate

Apply-repair is the substrate's *contradiction-resolution primitive*. Per the [coherence-glue](coherence-glue.md) discipline, contradictions are surfaced (not silenced) when they arise. Apply-repair is what the substrate does *with* the surfaced contradiction: declared, witnessed, replicable resolution that preserves the substrate's audit-chain integrity.

The pattern composes with [coherence-glue](coherence-glue.md) (which surfaces contradictions for repair), with [repair-catalog](../objects/repair-catalog.md) (the recipe source), with [settle](settle.md) (which is invoked after repair to re-stabilize the region), and with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) (where peer-substrate contradictions are repaired through bridge-mediated recipes).
