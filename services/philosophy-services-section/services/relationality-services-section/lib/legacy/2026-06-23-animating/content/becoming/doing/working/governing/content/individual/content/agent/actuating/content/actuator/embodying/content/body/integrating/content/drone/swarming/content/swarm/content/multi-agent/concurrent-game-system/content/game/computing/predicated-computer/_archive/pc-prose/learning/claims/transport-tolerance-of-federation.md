---
type: theorem
class: engineering-claim
status: proved
depends-on: [transport, transport-record, send-message, receive-message, federation-convergence, settlement-determinism]
see-also: [federation-as-substrate-join, doctrine-fidelity-compositionality]
---

# Federation convergence is independent of transport choice

**Claim.** Let $S_1$ and $S_2$ be two substrates federating per [federation-convergence](federation-convergence.md), and let $T_a$ and $T_b$ be two distinct [transports](teaching/explanations/transport.md) the substrates may use to exchange bytes. The substrates' converged predication settling is byte-identical regardless of whether the federation traffic flows over $T_a$, over $T_b$, over a mix of both, or over a sequence of changing transports.

The substrate's algebra is the federation protocol; transport choice is irrelevant to convergence.

## Why this holds

The argument follows directly from [federation-convergence](federation-convergence.md)'s structure: convergence depends on the *set of writes* $U$ delivered eventually, not on *how* they are delivered.

**Part 1: Federation convergence is order-independent.** Per [federation-convergence](federation-convergence.md) and its math foundation in [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), the converged state at each substrate is $\mathrm{cl}_p(\bigvee_k U)$ — a function of $U$, not of the order or intermediate stages of message delivery. Per the closure-merge commutation lemma, any sequence of merges produces the same converged state.

**Part 2: Different transports produce the same $U$.** Both $T_a$ and $T_b$ deliver the same canonical-form bytes; per [transport](teaching/explanations/transport.md)'s integrity-in-transit obligation, neither transport corrupts content. The deduplication in [receive-message](../morphisms/receive-message.md) is on canonical-form hash, which is transport-independent. So the set $U$ of distinct messages delivered (modulo dedup) is the same regardless of which transport carried them.

**Part 3: Mixed transport is also order-independent.** A federation that uses $T_a$ for some messages and $T_b$ for others delivers the same $U$ (by Part 2 applied to each transport individually) in some interleaved order. Per Part 1, order doesn't affect convergence.

**Part 4: Transport switching mid-federation.** When a federation switches transports (e.g., a TCP connection drops and reconnects via WebSocket), in-flight messages from the dropped connection are retransmitted on the new connection. Per [federation-convergence](federation-convergence.md)'s order-independence, retransmissions are safe — duplicates are deduplicated by hash, missed-original-deliveries are recovered by the retransmission. The converged state is unaffected.

## Engineering consequence

Several engineering consequences:

- **Multi-transport substrates.** A substrate may use different transports for different peers (HTTPS for public-internet peers, internal TCP for same-data-center peers, NATS for high-frequency event streams) without affecting convergence. Per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), the routing predications declare which transport each peer uses; the substrate's overall federation behavior is not affected by the heterogeneity.
- **Transport upgrades without downtime.** Switching from one transport to another (HTTP → WebSocket for lower latency, TCP → TLS-TCP for added security) does not require federation-state migration. The substrate continues federation seamlessly across the transport change.
- **Transport failover.** When a primary transport fails (broker outage, network partition), the substrate falls back to a secondary transport without affecting eventual convergence. Per [transport-record](../objects/transport-record.md), the substrate may declare multiple transport-records for federation flexibility.
- **Network-condition resilience.** Federation across high-latency, lossy, or unreliable networks converges as well as federation across low-latency reliable networks — just slower. Per [federation-convergence](federation-convergence.md), eventual delivery is what matters; the time-to-convergence depends on transport reliability, but the converged state does not.

## What the theorem rules out

- A transport that *modifies* content in transit (a JSON-rewriting proxy that "normalizes" fields, a translator that converts between schemas) violates Part 2 — the bytes received are not the bytes sent. Per [doctrine-fidelity-compositionality](doctrine-fidelity-compositionality.md), substrate-content translation requires an explicit doctrine-fidel bridge, not a transparent transport modification.
- A transport that drops messages permanently (best-effort with no retry, ungraceful failures) violates Part 1's eventual-delivery requirement. Federation may not converge if some messages never arrive; the substrate's response is to use at-least-once transports for federation traffic.
- A transport that introduces ordering constraints the substrate doesn't expect (in-order single-stream when the substrate's federation policy assumes per-message independence) doesn't violate the theorem but may impose unnecessary serialization. The substrate's federation behavior is correct in either case.

## What the theorem requires

- The transport provides eventual delivery (at-least-once or stronger).
- The transport provides byte-integrity in transit (per [transport](teaching/explanations/transport.md)'s integrity obligation).
- The substrate's [receive-message](../morphisms/receive-message.md) deduplicates by canonical-form hash (per [federation-convergence](federation-convergence.md)).
- The substrate's [closure-rule system](../objects/closure-rule-system.md) satisfies the [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms (the prerequisites of federation-convergence).
