---
type: concept
class: classical
status: active
depends-on:
  - multi-agent-system.md
  - ../objects/protocol.md
see-also:
  - ../theorems/byzantine-bound.md
  - ../theorems/cap-coordination-impossibility.md
  - ../morphisms/leader-election.md
references:
  - references/lamport-byzantine1982.md
---

# Byzantine fault tolerance

**Byzantine fault tolerance** (BFT) is the property of a distributed multi-agent protocol that allows the system to reach correct agreement *despite arbitrary failures* of some agents — not just crash failures, but agents that may behave maliciously, send conflicting messages to different recipients, or otherwise deviate from the protocol in arbitrary ways.

## The Byzantine generals problem

Lamport, Shostak & Pease (1982) framed the problem allegorically: Byzantine generals surrounding a city must agree to attack or retreat.
Some generals are traitors who may send arbitrary lies.
Loyal generals must reach agreement on a single action.

The problem captures the essential challenge: distributed agents must agree despite the presence of arbitrarily- faulty participants whose messages cannot be trusted.

## The fundamental bound

The [byzantine-bound](../theorems/byzantine-bound.md): Byzantine consensus among $n$ agents tolerating $f$ arbitrary faults requires $n > 3f$.
With $f$ traitors, loyal agents need at least $2f + 1$ (a strict majority) to outvote them, plus $f$ extra to absorb the noise — total $3f + 1$.

The bound is *tight*: protocols exist achieving consensus with $n = 3f + 1$ agents under various assumptions.

## Standard BFT protocols

- **PBFT (Practical Byzantine Fault Tolerance)** (Castro & Liskov 1999).
  The first practical BFT protocol; three-phase commit (pre-prepare, prepare, commit) with view changes on suspected leader failure.
  Tolerates $f$ Byzantine faults with $3f + 1$ replicas.
- **Tendermint, Paxos+BFT extensions, HotStuff.** Modern BFT protocols with various optimizations (linear message complexity, leader rotation).
- **Nakamoto consensus** (Bitcoin).
  A different BFT approach using economic incentives and probabilistic finality rather than deterministic agreement.

## Assumptions

BFT protocols typically assume:

- **Synchronous or partially-synchronous network.** Bounded message delays at least sometimes.
- **Cryptographic authentication.** Messages are signed; agents cannot forge other agents' messages.
- **Static membership.** The agent set is known in advance (some protocols relax this).

Different assumption sets yield different protocols; weakening assumptions generally weakens results.

## Why BFT matters for multi-agent AI

- **Distributed AI training.** When training across untrusted nodes (federated learning, decentralized training), Byzantine robustness matters.
- **Multi-agent decision systems.** When decisions aggregate across agents that may be compromised or malfunctioning, BFT-style aggregation provides guarantees.
- **AI debate and oversight.** When multiple AI agents evaluate each other, robustness to a fraction being compromised is desirable.
- **AI marketplaces.** Where agents from different developers transact, BFT-style consensus protocols govern shared state.

## Limits

- **Compute and message overhead.** BFT protocols are expensive; consensus per decision typically requires $O(n^2)$ or $O(n^3)$ messages.
- **Latency.** Multi-round protocols add latency.
- **Composition.** Composing multiple BFT components yields complex correctness arguments.
- **Strong adversary assumptions.** "Arbitrary" faults are the worst case; real faults may be less adversarial, allowing weaker protocols.

## Status

Foundational area of distributed systems with active research.
Modern protocols have substantially reduced the overhead of classical BFT; integration with multi-agent AI systems is an emerging area.
