---
type: morphism
class: substrate-primitive
realizes: [witness]
depends-on: [witness, event-log, canonical-form]
see-also: [insertion, settle]
---

# Emit witness

The operator that produces a [witness](teaching/explanations/witness.md) entry for a substrate operation and appends it to the [event log](../objects/event-log.md). Emit-witness is the substrate's primitive for *recording what just happened*; every operator that changes substrate state ends with an emit-witness invocation.

## Signature

`emit-witness(operator-id, input-hashes, output-hashes, repair-entries, origin) → (witness-id, event-log-position)`

Inputs:

- **`operator-id`** — reference to the operator (closure rule, skill, primitive operator, etc.) being witnessed.
- **`input-hashes`** — the canonical hashes of the operator's inputs.
- **`output-hashes`** — the canonical hashes of the operator's outputs.
- **`repair-entries`** — references to any [repair](teaching/explanations/repair.md) records produced during the operation, in the order they fired.
- **`origin`** — per [origin](teaching/explanations/origin.md), which entity caused this operation.

Outputs:

- **`witness-id`** — the canonical-hash content-id of the resulting witness entity.
- **`event-log-position`** — the new position in the event log after appending.

## Operational semantics

Emit-witness proceeds in five steps:

1. *Compose the witness entity.* Create a witness predication-graph entity carrying the operator-id, input-hashes, output-hashes, repair-entries, origin, and the substrate's operator-specification version active at the time of the operation. The entity's `closure-kind` predication is `witness`.
2. *Canonicalize.* The witness entity's content is canonicalized per [canonical-form](teaching/explanations/canonical-form.md).
3. *Hash.* Compute the witness-id (canonical hash) of the witness content.
4. *Persist.* Write the witness entity to the [content-addressed store](../objects/content-addressed-store.md) via [PutCell](put-cell.md). Append the witness-id to the event log; the new event log position is returned.
5. *Verify.* The substrate's invariant — that the witness's recorded hashes resolve to the substrate-stored content — is checked: input-hashes and output-hashes must each correspond to substrate-resident cells (not yet retired). Failure aborts.

## Engineering invariants

- **Atomic.** The witness either appears in the event log (at a definite position) or it does not. Partial emissions are not admissible.
- **Content-addressed.** The witness-id is the canonical hash of the witness's content; two witnesses with identical content are the same witness.
- **Replayable.** Re-executing the witnessed operator on its declared inputs produces the same outputs and the same witness-id. (See [replayability](../theorems/replayability-from-determinism.md) [pending future re-derivation in clean form].)
- **Origin-cited.** Every witness has an origin; per the [origin](teaching/explanations/origin.md) discipline, no anonymous witnesses.

## Failure modes

- **Cited cells not present.** A witness whose input-hashes or output-hashes do not resolve to substrate-resident cells is rejected; the operator must persist the cells before emitting the witness.
- **Specification version mismatch.** A witness emitted citing a non-current operator-specification version is suspect; the substrate may admit it (deterministic replay) or reject it (live emission), per implementation policy.

## Position in the substrate

Emit-witness is the substrate's *single point at which operations become history*. Every operator that changes state ends with an emit-witness call; if the call doesn't happen, the operation didn't happen for audit purposes. The discipline is what makes the [event log](../objects/event-log.md) the single source of truth: the log is the cumulative chain of emit-witness invocations.
