---
type: morphism
class: boundary-operator
realizes: [boundary, port, doctrine-fidelity]
depends-on: [interfacer, port, shape-record, constraint-record]
see-also: [insertion, step, witness]
---

# Admit

The boundary operator that converts an external port-typed message into an admitted predication, ready for the substrate's [stepping](teaching/explanations/stepping.md) discipline. Admission is the substrate's *intake gate*: messages cross the boundary, pass through validation, and become substrate-content; messages that fail the gate are surfaced as rejection witnesses without entering the substrate's algebra.

Distinct from [insertion](insertion.md) (which is the interior primitive once content is admitted): admit is the *boundary* primitive, running at the substrate's external surface and applying the boundary's discipline. Every admission ultimately produces interior insertions, but admission carries additional responsibilities — port validation, shape conformance, constraint evaluation, federation signature verification — that interior operators don't.

## Signature

`admit(message, boundary-context, fuel) → (admitted-step, witness, status)`

Inputs:

- **`message`** — the external content arriving at the boundary, in whatever wire format the boundary's [interfacer](teaching/explanations/interfacer.md) handles (markdown, JSON, ActivityStreams JSON-LD, raw bytes through a sensor, etc.).
- **`boundary-context`** — references to the active [port](teaching/explanations/port.md), the applicable [shape-records](../objects/shape-record.md), the active [constraint-records](../objects/constraint-record.md), and the [scope-record](../objects/scope-record.md) the message is addressed to.
- **`fuel`** — bound on validation work per [fuel-bound](teaching/explanations/fuel-bound.md).

Outputs:

- **`admitted-step`** — if admission succeeded, the substrate-observable step the message produced (per [step](step.md)). May be empty if the message was a no-op (already-admitted content).
- **`witness`** — the witness recording the admission decision: input bytes hash, port match, shape conformance results, constraint evaluation results, output fiber hashes (or rejection cause).
- **`status`** — one of `admitted` (the message produced an interior step), `rejected` (the message failed a gate, no interior change), `repair-pending` (the message was admitted but flagged with a [repair-catalog](../objects/repair-catalog.md) ticket).

## Operational semantics

Admit proceeds through five gates in order:

1. **Wire-format extraction.** The boundary's interfacer parses the message into substrate-admissible predications. Per [doctrine-fidelity](teaching/explanations/doctrine-fidelity.md), the extraction must be doctrine-fidel — preserving the source's structure to the extent the interfacer claims to. Extraction failures (malformed bytes, unrecognized format) produce rejection witnesses.
2. **Port classification.** Each extracted predication's kind must be in the boundary's [port](teaching/explanations/port.md) admit-set. Predications outside the port are rejected; the rejection witness cites the offending kind.
3. **Shape conformance.** Each predication is run through the substrate's [validate-against-shape](validate-against-shape.md) operator against the applicable [shape-record](../objects/shape-record.md). Per the shape's severity, failures may reject the admission, admit-with-repair, or admit-with-warning.
4. **Constraint evaluation.** The candidate post-admission state is checked against the active [constraint-records](../objects/constraint-record.md). Per the constraint's severity, failures gate the admission identically to shape failures.
5. **Federation signature verification (when applicable).** Predications crossing a substrate boundary from a federated peer must carry a verifiable signature per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md). Unsigned or invalid-signature peer admissions are rejected; the rejection witness records the signature failure.

If all five gates pass, the admission produces an interior [step](step.md) — a [stepping](teaching/explanations/stepping.md)-compliant advancement of the substrate's state. The step's witness chain begins with the admit witness; subsequent settlement witnesses link back to it.

## Engineering invariants

- **Idempotent under at-least-once delivery.** The same message admitted twice produces the same substrate effect: the second admission's witness records "no change" (since the first admission already produced the step). Per [hash-discipline](teaching/explanations/hash-discipline.md), the message's canonical-form hash determines whether it's a re-delivery.
- **Atomic at the gate.** Either all five gates pass and the admission produces a step, or none does and a rejection is recorded. Partial admissions (some predications admitted, others rejected) are not admissible — the gate is at the message level.
- **Witness-emitting.** Every admission attempt — successful or rejected — produces a witness. A boundary that silently drops messages is a substrate violation.
- **Fuel-bounded.** Validation work is bounded by the cited fuel. Messages whose validation exceeds fuel are surfaced as inconclusive — neither admitted nor rejected — and queued for re-evaluation under increased fuel.

## Failure modes

- **Wire-format failure.** The interfacer cannot parse the bytes. The witness records the parse error; the message does not enter the substrate.
- **Port mismatch.** A predication kind in the message is not in the port's admit-set. The witness records the offending kind; the entire message is rejected.
- **Shape-conformance failure (strict).** A predication fails its shape's strict-rejection severity. The witness records the offending predication and the violated shape; the message is rejected.
- **Shape-conformance failure (repairable).** A predication fails a shape's repairable severity. The message is admitted, but a repair-catalog ticket is opened citing the offending predication and the applicable repair recipe.
- **Constraint failure (strict).** The candidate post-admission state would violate a strict-rejection constraint. The witness records the violating constraint; the message is rejected.
- **Federation signature failure.** A peer-substrate admission carries an invalid or absent signature. The witness records the failure; the message is rejected.
- **Fuel exhaustion.** The validation work exceeds the cited fuel. The witness records "inconclusive"; the caller may re-attempt with increased fuel.

## Position in the substrate

Admit is the substrate's *boundary intake primitive*. Per the [substrate-as-stack-composition](teaching/explanations/substrate-as-stack-composition.md) narrative, admit lives at the head of the intake stack; per the [four-component anatomy](teaching/explanations/substrate-anatomy-as-four-components.md), it sits at the input boundary. Every external content that becomes substrate-content does so through admit; the substrate's audit trail begins at admit witnesses and traces outward through interior settlement.

The pattern composes with [insertion](insertion.md) (the interior primitive admit ultimately produces), with [step](step.md) (the substrate-observable advancement admit emits), with [validate-against-shape](validate-against-shape.md) (the morphism admit invokes for per-predication conformance), and with [emit-witness](emit-witness.md) (the morphism admit invokes for every gate decision).
