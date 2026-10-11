---
type: definition
class: substrate-entity
realizes: [witness]
depends-on: [canonical-form, determinism, predication-valuation, increment-sequence, settling-monotonicity, closure-drivenness]
see-also: [event-log, emit-witness, repair-catalog]
---

# Witness

The substrate-entity formal definition of a [witness](teaching/explanations/witness.md): the predication-graph entity recording one operator execution's evidence — equivalently, one increment $u_\tau$ in the substrate's [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md), together with the closure step that produced $v_{\tau+1}$ from $v_\tau$ via the [closure-driven](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) discipline. Each witness is appended to the [event log](event-log.md) as a substrate operation completes; the cumulative chain across all operators is the substrate-side materialization of the predication settling family $(v_\tau)_{\tau<\lambda}$ together with $U$.

## Structural fields

A witness record carries:

- **`id`** — canonical-form hash of the witness's own content; serves as the witness's substrate address.
- **`operator`** — reference to the operator-specification entity whose execution this witness records (e.g., a [closure-rule record](closure-rule-record.md), a [shape-record](shape-record.md), an [admit](../morphisms/admit.md) operator).
- **`rule-system-version`** — canonical-form hash of the substrate's active [closure-rule system](closure-rule-system.md) at execution time. An auditor without this version cannot replay the operator deterministically (per [settlement-determinism](../theorems/settlement-determinism.md)).
- **`input-hash`** — canonical-form hash of the [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) $v_\tau$ on the operator's input region.
- **`increment-hash`** — canonical-form hash of the increment $u_{\tau+1}$ this operator contributed to the substrate's increment sequence.
- **`output-hash`** — canonical-form hash of the resulting valuation $v_{\tau+1}$ on the output region. Per [closure-driven settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), $v_{\tau+1} \geq_k v_\tau$ in the [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md). Byte-identical to the input hash if the operator was a no-op.
- **`intermediate-hashes`** — for composed operators (e.g., [settle](../morphisms/settle.md) running multiple wavefront layers), the canonical-form hash at each intermediate state in the closure trajectory. Lets an auditor check the operator's internal trajectory, not just its endpoints.
- **`fuel-consumed`** — for operators bound by [fuel-bound](teaching/explanations/fuel-bound.md), the fuel actually consumed.
- **`repair-citations`** — references to any [repair-catalog](repair-catalog.md) entries the operator invoked during execution. Each citation includes the repair's canonical-form code and the before/after hashes of the predications repaired.
- **`step-ordinal`** — the ordinal $\tau$ in the substrate's settling. For substrates in the strict or Scott-continuous regime, $\tau$ is a natural number (or $\omega$ for limit-of-finite-prefix). For substrates in the non-Scott-continuous regimes, $\tau$ may be a [non-Scott-continuous firing ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md), and the witness must record sufficient detail to identify the firing ordinal in $L_{\mathrm{ns}}$ (necessary for [federation-convergence](../theorems/federation-convergence.md) in those regimes).
- **`closure-kind`** — per [closure-kind](teaching/explanations/closure-kind.md), which of the four positions the operator occupies (Process, Derivation, Procedure, Inquiry). Determines what other audit-side guarantees the witness underwrites.
- **`signature`** — for federated witnesses crossing substrate boundaries, the cryptographic signature of the issuing substrate's identity. Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), peer witnesses verify against the issuing substrate's published identity key.

## Invariants

- **Idempotent on canonical input.** Two witnesses with identical `(operator, rule-system-version, input-hash)` triples must have identical `output-hash`. Disagreement is a substrate-determinism violation per [settlement-determinism](../theorems/settlement-determinism.md).
- **Hash-cited provenance.** Every reference to a content region cites that region's canonical-form hash. References by name, by description, or by paraphrase are not admissible.
- **Append-only in the event log.** A witness, once recorded, is not edited in place. Corrections to a witnessed operator (a discovered bug) are recorded as new witnesses superseding the original; the original's hash chain remains traversable.
- **Non-empty for state changes.** Every operator that produces a state change (per [cost-discipline](teaching/explanations/cost-discipline.md): admissions, settlements, repairs) emits a witness. An operator that produces no state change (a read, per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md)) does not require a witness, but may emit one if the read crossed a trust boundary or was billed under an audit policy.
- **Settling-monotonicity respect.** The output-hash represents a valuation $\geq_k$ the input-hash's valuation. A witness whose output is not $\geq_k$ its input violates settling-monotonicity and is non-conforming.

## Operations

- *Emit.* When an operator completes, the substrate computes the output's canonical-form hash, assembles the witness record, computes the witness's own canonical-form hash, and appends to the event log via [emit-witness](../morphisms/emit-witness.md).
- *Verify.* An auditor in possession of the witness, the operator specification, and the rule-system version can replay the operator on the cited input and check that the produced hash chain matches the witness. This is the substrate's audit primitive.
- *Replay.* Per the [audit stack](teaching/explanations/substrate-as-stack-composition.md), iterating the event log's witness chain and re-running each cited operator reproduces the substrate's settling family byte-for-byte from any chosen starting point. Replay is the substrate's recovery primitive.
- *Federate.* A witness with a valid signature crosses substrate boundaries. The receiving substrate verifies the signature against its known peer identities and admits the witness to its own event log; the substrate's [merge](../morphisms/merge.md) discipline integrates the predicated effect into local state per [federation-convergence](../theorems/federation-convergence.md).

## Position in the substrate

The witness is the substrate's *primary audit artifact*. Without it, the substrate's operator executions are opaque — an external auditor has no way to verify what happened. With it, every operator execution is replayable, falsifiable against its specification, and federation-portable. Per [events-as-source-of-truth](teaching/explanations/events-as-source-of-truth.md), the witness chain accumulating in the event log is the substrate-side instance of the increment sequence + settling-step trajectory; replay reconstructs any prior valuation from the chain alone.

The pattern composes with [emit-witness](../morphisms/emit-witness.md) (the morphism that produces witnesses), with [event-log](event-log.md) (the durable accumulation), with [hash-discipline](teaching/explanations/hash-discipline.md) (which makes the canonical-form hashes comparable across substrates), and with [repair-catalog](repair-catalog.md) (which the witness's repair-citations reference).
