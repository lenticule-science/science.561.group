---
type: morphism
class: composed-operator
realizes: [closure-conditions, depth-filtration]
depends-on: [closure-conditions, scope-record, settle]
see-also: [scope-maturation, entity-maturation, repair]
---

# Align

The composed operator that brings a region of the substrate from satisfying $n$ of the seven [closure conditions](teaching/explanations/closure-conditions.md) to satisfying $n+1$. Where [settle](settle.md) drives a region's content to fixed-point under the *current* closure-rule system, *align* extends the region's commitments — adding the structural content (typically new shapes, new operator declarations, new covering predications) that lets the region satisfy the next closure condition.

Align is the substrate's *advancement* primitive: a region matures by being aligned, not by accumulating content alone. The sequence `align; align; align` traverses the region through the closure stages of [scope-maturation](teaching/explanations/scope-maturation.md); the corresponding sequence on a single entity traverses [entity-maturation](teaching/explanations/entity-maturation.md). The same operator is responsible for both — what differs is the region the operator is aligned over.

## Signature

`align(region, target-condition, rule-system, fuel) → (aligned-region, witness, status)`

Inputs:

- **`region`** — references to the region to align: an entity, a [scope](teaching/explanations/scope.md), a [sublocale](../objects/application-sublocale.md). Canonical-form addressable.
- **`target-condition`** — the next closure condition the region is being aligned to (1 through 7, per [closure-conditions](teaching/explanations/closure-conditions.md)). The substrate verifies the region currently satisfies all conditions strictly below `target-condition` and refuses if a lower condition is unmet (alignment must proceed in order).
- **`rule-system`** — the active [closure-rule records](../objects/closure-rule-record.md) and [shape records](theories/agential-orchestration-platform/objects/shape-record.md), per the substrate's current foundation.
- **`fuel`** — the bound on iterations spent attempting the alignment per [fuel-bound](teaching/explanations/fuel-bound.md).

Outputs:

- **`aligned-region`** — the region with the target condition satisfied (or the region as left after fuel exhaustion).
- **`witness`** — the alignment record: input hash, target condition, the substrate-edits applied (added shapes, declared operators, etc.), the closure-rule applications fired, the resulting region's hash.
- **`status`** — one of `aligned` (the target condition is now satisfied), `partial` (the region advanced but did not reach target), or `blocked` (a precondition is missing and alignment cannot proceed without external substrate edits).

## Operational semantics

Alignment proceeds in two phases:

1. **Edit phase.** The substrate's [self-representation](teaching/explanations/self-representation.md) discipline says that the substrate's structural commitments are themselves substrate content. Aligning to condition $n$ requires that the predications expressing condition $n$'s requirements are present in the region. The edit phase admits those predications: declaring shapes (for condition 5), declaring structural procedures (for condition 6), declaring covering policies (the agential charter's discipline), or declaring local-section compatibility (for condition 7). The edits enter the substrate through the boundary like any other admission, with witnesses recorded.
2. **Settle phase.** The substrate's closure rules now have new content to act on. The settle phase per [settle](settle.md) propagates the new commitments through the region — checking shape conformance, applying structural procedures, identifying contested predications. Per the substrate's [repair](teaching/explanations/repair.md) discipline, contradictions surfaced during the settle phase produce repair tickets rather than aborts; the alignment continues with the contradictions recorded.

Successful completion (`status = aligned`) requires both phases to terminate within fuel and the resulting region to verify against condition $n$'s definition. The verification is itself a substrate operation — checking each of the condition's commitments against the region's content — and produces its own witness chain.

## What alignment does not do

Three engineering invariants worth naming explicitly:

- **Alignment does not skip stages.** A region at condition 4 cannot be aligned directly to condition 6 without passing through condition 5. Each closure condition relies structurally on the previous; the substrate's `align` refuses out-of-order requests. (Per [closure-conditions](teaching/explanations/closure-conditions.md), the conditions are independent in the sense that any subset can be satisfied — but the *named development arc* is sequential because each condition's edits typically presume the prior ones.)
- **Alignment does not undo settled state.** Edits introduced by alignment add to the region's content; they do not retract prior settled predications. A predication that contradicts the new commitments is surfaced as a repair, not silently overwritten. The substrate's [installed-base constraint](teaching/explanations/infrastructure-as-substrate.md) holds across alignment.
- **Alignment is per-region, not global.** Two sibling regions in the same substrate may be at different alignment levels simultaneously. The substrate's coherence does not require uniform alignment; it requires that each region's claimed level is checkable against its content.

## Failure modes

- **Precondition unmet.** The region does not satisfy condition $n - 1$. `align` returns `status = blocked` with the unmet precondition identified. The caller's recourse is to align to the missing prior condition first.
- **Required edits missing.** The substrate's commitment for condition $n$ requires content (a specific shape, a specific operator declaration) that the caller has not supplied and the substrate cannot derive. `align` returns `status = blocked` with the required edits enumerated.
- **Repairable contradiction.** The settle phase surfaces a contradiction whose [repair catalog](../objects/repair-catalog.md) entry classifies it as repairable. The alignment continues with the repair recorded; the resulting region carries a repair ticket but is `aligned` at the target condition.
- **Hard contradiction.** The settle phase surfaces a contradiction the substrate cannot resolve without retracting prior commitments. `align` returns `status = blocked` and surfaces the contradiction; the caller must edit the substrate to resolve before retrying.
- **Fuel exhaustion.** The combined edit-and-settle phases consume the declared fuel before reaching condition $n$. `align` returns `status = partial` with the last stable hash and the unfinished work flagged.

## Position in the substrate

Align is the substrate's *region-maturation operator*. It is what makes the region's [closure-conditions](teaching/explanations/closure-conditions.md) progression an explicit substrate operation rather than an emergent property of accumulated edits. Per the [depth-filtration](teaching/explanations/depth-filtration.md) framing, the substrate's regions live at varying depths of the filtration $R_0 \hookrightarrow R_1 \hookrightarrow \cdots \hookrightarrow R$; *align* is the operator that lifts a region from depth $n$ to depth $n+1$ in the filtration.

The pattern composes with [settle](settle.md) (which is invoked as part of the settle phase), with [scope-maturation](teaching/explanations/scope-maturation.md) (which names the region-level milestones the alignment sequence traverses), and with [entity-maturation](teaching/explanations/entity-maturation.md) (the per-entity counterpart, where alignment moves an entity through the fleeting/working/settled arc).

The substrate's audit of any region's claimed completeness reduces to inspecting the alignment witnesses: each successful alignment is a recorded advancement; the chain of alignments tells the region's full history of commitments.
