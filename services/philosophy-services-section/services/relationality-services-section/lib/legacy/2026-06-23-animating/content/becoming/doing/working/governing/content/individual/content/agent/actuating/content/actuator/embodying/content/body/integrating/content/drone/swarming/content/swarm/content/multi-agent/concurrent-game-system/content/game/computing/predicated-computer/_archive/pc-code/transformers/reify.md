---
type: morphism
class: composed-operator
realizes: [reification]
depends-on: [insertion, witness]
see-also: [emit-witness]
---

# Reify

The operator that wraps an incoming claim in the substrate's reified-message envelope, attributes it to a content-addressed sender, and admits it through the substrate's primary admission path. Reify is the substrate's input contract realized as an operator: the only way for a claim to enter the substrate's content is through reify.

## Signature

`reify(claim, sender-identifying-pairs, scope) → (reified-event, witness)`

Inputs:

- **`claim`** — the subject-predicate-object payload the sender wants to admit. The payload's value (in the substrate's value-domain) may be implicit ($t$ by default for asserted claims) or explicit.
- **`sender-identifying-pairs`** — a set of predications declaring the sender's identity. These are content-addressed: the same identifying pairs always produce the same sender ID.
- **`scope`** — the [scope](teaching/explanations/scope.md) the claim is being admitted into. Determines the active vocabulary, the applicable [shapes](theories/agential-orchestration-platform/concepts/shape.md), the relevant authorization fiber.

Outputs:

- **`reified-event`** — the structured envelope that carries the claim alongside its substrate predications: sender ID, message ID, send time, event ordinal, origin, asserts-claim decomposition. The envelope is the substrate's input contract realized; per [reification](teaching/explanations/reification.md), no claim enters substrate content without one.
- **`witness`** — the witness chain entry recording the reification: the hash before, the envelope's content, the hash after, the canonical-form serialization that produced the message ID.

## Operational semantics

Reify proceeds in five steps:

1. *Derive sender ID.* Canonicalize the sender-identifying-pairs and hash them. The result is `sender:<canonical-hash>`. Per [hash-discipline](teaching/explanations/hash-discipline.md), the hash is implementation-stable: the same identifying pairs produce the same sender ID across substrates.
2. *Construct message envelope.* Build the predications recording: sender ID, asserts-claim decomposition (subject, predicate, object as separate predications), declared time (per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md)), origin (per [origin](teaching/explanations/origin.md)).
3. *Compute message ID.* Canonicalize the envelope and hash. The result is `message:<canonical-hash>`.
4. *Assign event ordinal.* The substrate's event log assigns the next ordinal to the envelope. The ordinal is monotonic per substrate; per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), it is *not* part of the message ID's content hash.
5. *Admit through insertion.* The substrate's [insertion](insertion.md) primitive admits the envelope's predications: the message-record predications (recording the message itself), the sender-identity predications (if the sender is new to the substrate), the asserts-claim predications. Insertion produces witness entries; the composed witness is the result of reify.

## Engineering invariants

- **Idempotent.** Reifying the same claim from the same sender twice produces the same message ID. The substrate's content-addressed deduplication treats the second admission as a no-op. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), this holds because canonical-form is deterministic.
- **Sender-attributable.** The reified-event's witness records the sender ID. Every claim in the substrate is traceable to the sender that admitted it.
- **Shape-validated.** Per [validate-against-shape](validate-against-shape.md), the substrate's admission discipline runs the claim against the active scope's shapes. A claim that violates a shape produces a contested predication ($\top$) or an admission rejection per the substrate's policy; the rejection is itself a substrate event with its own witness.
- **Authorization-checked.** Per [scope-as-predication](teaching/explanations/scope-as-predication.md), the sender's authorization fiber is composed against the scope's policy at admission time. An unauthorized claim is rejected with the rejection's reason (the contradicting authorization predication) recorded.

## Failure modes

- **Sender identity ambiguous.** The sender-identifying-pairs are insufficient to uniquely identify the sender (the pairs are empty, or the canonicalization produces a collision). The substrate rejects the reify; the rejection is itself a substrate event.
- **Scope rejects vocabulary.** The claim's predicate is not in the scope's vocabulary. Per [vocabulary-completeness](teaching/explanations/vocabulary-completeness.md), this surfaces as vocabulary debt. The substrate's response is to reject the reify or to admit the claim alongside a vocabulary-debt predication, depending on policy.
- **Shape violation.** The claim's payload does not fit the active scope's shape. The reify either fails or admits the claim as contested ($\top$ value), depending on policy.

## Position in the substrate

Reify is the substrate's *input boundary primitive*. Per [reification](teaching/explanations/reification.md), it is the only admission path; there is no bypass primitive. The reify operator's structural shape determines the substrate's audit, replay, federation, and authorization disciplines: every other discipline anchors on the assumption that every claim's origin and admission is recorded by reify.

The morphism composes with [insertion](insertion.md) (the underlying primitive that performs the cell-level write), with [emit-witness](emit-witness.md) (the substrate operator that records the witness chain entry), with [validate-against-shape](validate-against-shape.md) (the shape-check applied at admission), and with [coherence-glue](coherence-glue.md) (when the reified claim conflicts with existing content, coherence-glue applies the substrate's repair recipe to resolve).
