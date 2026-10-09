---
type: theorem
class: proved
status: active
depends-on:
  - teaching/explanations/common-knowledge.md
see-also:
  - ../../../theorems/cap-coordination-impossibility.md
references: []
---

# Common-knowledge impossibility (coordinated attack)

**Statement.** No protocol over a network where messages may be lost can establish common knowledge of *any* contingent fact among two or more parties.

## The classical formulation: coordinated attack

Two generals, each commanding an army on opposite hills overlooking an enemy in a valley.
They wish to attack *simultaneously* — coordinated attack succeeds, isolated attack fails.
They can communicate only via messengers who may be captured.

**Question.** Can they establish common knowledge of an attack time?

**Answer.** No.

## Proof sketch

Suppose general A sends a messenger with "attack at dawn."
A doesn't know if the messenger arrived; A is not willing to attack without confirmation.
So A waits for acknowledgment.

B receives the message.
B knows the attack time but doesn't know A knows that B knows.
B sends an acknowledgment messenger; doesn't know if it arrived.
B won't attack without confirmation that A received the ack.

A receives the ack.
A knows B knows the attack time but doesn't know B knows that A knows.
So A sends an ack of the ack...

This is an infinite regress.
At every level $k$, the sending agent doesn't know whether the depth-$k$ acknowledgment arrived; common knowledge is *never* established.

Formal proofs (Halpern & Moses 1990) make this precise: no protocol with bounded message exchange can establish common knowledge of a contingent fact when message loss is possible.

## Reach

The result extends:

- **Multiple agents.** Generalizes to $n$ agents.
- **Probabilistic message loss.** Even with arbitrarily small loss probability, the result holds.
- **Asynchronous networks.** Holds in standard asynchronous models.
- **All contingent facts.** Holds for any fact whose truth depends on agent actions.

The result is *robust* to weakening the assumptions.

## What is achievable

Despite the impossibility:

- **Common knowledge of *necessary* facts** (truths independent of contingencies) can be assumed as background.
- **$\epsilon$-common knowledge** (common knowledge to some finite depth $k$) is achievable by exchanging $k$ messages.
- **Probabilistic common knowledge** can be approximated arbitrarily closely with high-reliability channels.
- **Practical coordination** uses approximations and trust shortcuts.

## Implications for multi-agent AI

- **Distributed AI systems** cannot achieve true common knowledge across networks; protocols must approximate.
- **Coordination failures** in multi-agent AI may reflect this fundamental limit.
- **Multi-agent learning** under common-knowledge assumptions may produce theoretically sound but practically unrealizable strategies.
- **Trust infrastructure** (cryptographic protocols, trusted intermediaries) substitutes for true common knowledge in many real systems.

## Connection to other impossibilities

The common-knowledge impossibility connects to:

- **FLP impossibility** (asynchronous consensus).
- **CAP** (consistency-availability-partition trade- off).
- **Byzantine bound** (fault-tolerant agreement thresholds).

All express *what cannot be achieved* in distributed multi-agent settings; together they bound the design space.

## Limits and refinements

- **Synchronous reliable networks** can achieve common knowledge through public broadcast (the impossibility assumes asynchronous + lossy).
- **Cryptographic accumulators** (modern blockchains) approximate common knowledge through different mechanisms.
- **Common belief** (likely common knowledge) is more achievable than strict common knowledge.

## Status

Foundational impossibility of distributed-systems theory.
Halpern & Moses 1990 is the standard reference.
Implications for multi-agent AI are substantial: any multi-agent system requiring true common knowledge for correctness has a fundamental obstacle.
