---
type: concept
class: discipline
depends-on: [witness, origin]
see-also: [insertion, source-of-truth]
---

# Reification

The substrate's discipline that *every claim entering substrate content arrives inside a structured envelope* — a sender-attributed, content-addressed message that carries the claim's payload alongside the substrate predications recording its origin, sender identity, send time, event ordinal, and the claim's subject-predicate-object decomposition. There is no admission path that bypasses reification: a claim cannot enter the substrate without first being reified.

The discipline is the substrate's answer to the engineering question "where do claims come from?" A substrate without reification has claims floating freely, with no recorded sender, no origin, no admissibility check at the boundary. Auditing such a substrate is impossible: the same claim might have been inserted by a trusted operator or by a stray runtime call, and the substrate has no way to tell.

## Structural commitment

A reified message carries:

- **A sender identifier.** A content-addressed reference to the entity that emitted the claim. The sender is itself a substrate entity (per [self-representation](self-representation.md)); its predications determine its trust class, its authorization fiber, and its declared role.
- **A message identifier.** A content-addressed reference to the message envelope itself. Two messages with byte-identical content yield the same identifier, which makes message-replay idempotent.
- **The claim's payload.** The subject-predicate-object triple the message asserts, plus its substrate value-domain value.
- **An origin predication.** Per [origin](origin.md), the immediate cause of the message — which operator, which closure-rule application, which external boundary emitted it.
- **A send-time predication.** The substrate-recorded time at which the message was admitted.
- **An event-ordinal.** The sequence number assigned by the substrate when the message was admitted to the [event log](../objects/event-log.md), guaranteeing total ordering across the messages a substrate has accepted.
- **An asserts-claim predication.** A meta-predication recording that the message asserts a particular claim, with sub-predications naming the claim's subject, predicate, and object explicitly. The decomposition is what makes the payload SPO-recoverable from the substrate's content alone, without re-parsing the original envelope.

A claim's content and the message that introduced it are both substrate-resident: the claim lives in the appropriate fiber; the message lives in the messages region of the substrate, with predications connecting it to the claim it introduced.

## The boundary primitive

A substrate's reification primitive is the only admission path. Two shapes appear in particular implementations:

- **Single-claim convenience.** A primitive that accepts one claim plus the sender's identity, constructs the reified envelope, admits it through the substrate's closure machinery, runs the substrate's settlement to its bounded fixed-point, and returns the resulting substrate state plus the addresses of derived claims.
- **Batch primitive.** A primitive that accepts a sender-attributed envelope carrying many claims, asserts the identity, message-record, and payload predications through the substrate's closure machinery in one pass, and returns the resulting substrate state. The batch primitive is required when claim throughput is high enough that single-claim cloning is unaffordable; the discipline is preserved by *what* gets asserted, not by literally cloning per claim.

Substrate primitives that bypass reification — a bare assertion that does not record a sender, an "internal" admission used for runtime conveniences — are violations to be diagnosed. The substrate's audit checks that every claim has a corresponding message-record predication; missing message-records mark substrate-level violations.

## Engineering consequences

- **Audit is structural.** Every claim's origin is queryable by traversing message-record predications backward. Reasoning about who introduced what at which moment is reading substrate content; no separate audit log is needed.
- **Replay is deterministic.** The reified envelopes form an append-only sequence; replaying the sequence reproduces the substrate's state byte-for-byte, modulo declared elision (per [source-of-truth](source-of-truth.md)).
- **Authorization composes at admission.** Per [scope-as-predication](teaching/explanations/scope-as-predication.md), the sender's authorization fiber composes with the claim's required-authorization fiber at admission time. The composition's result is the admission decision, recorded in the message envelope as a substrate-level field.
- **Federation crosses cleanly.** Per [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md), reified messages cross substrate boundaries with their sender attribution intact. The receiving substrate verifies the sender's signed witness against its known identity predications and admits or rejects by the same admission discipline as for local messages.
- **Multi-writer substrates converge.** Two writers asserting the same claim independently produce two messages with the same payload but different sender identities; both messages are admitted, the substrate's value-domain join produces a single canonical claim from the two contributions, and the substrate's audit records both attribution chains.

## Position in the substrate

Reification is the structural realization of "no claim arrives unowned." It is the substrate's input contract — what the substrate's I/O surface admits, and what the substrate's algebra processes. Reification is upstream of [insertion](../morphisms/insertion.md): a reified message is what insertion operates on, after the message has cleared admission. Without reification, every other substrate discipline (audit, replay, federation, authorization) loses its anchor — there is no recorded *who said this* to ground the derived disciplines on.

The pattern composes with [witness](witness.md) (every reified message produces a witness chain rooted in the message-record), with [origin](origin.md) (the message's origin predication is the immediate cause; provenance is the chain back through prior messages), and with [event-log](../objects/event-log.md) (the reified message is what the event log records).
