---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/protocol.md
  - ../objects/agent-population.md
see-also:
  - teaching/explanations/byzantine-fault-tolerance.md
references: []
---

# Leader election

**Leader election** is the procedure by which a distributed group of agents collectively designates one agent as the *leader* — coordinator, primary, sequencer — for a defined task or epoch.
It is a foundational primitive of distributed coordination.

## Why leaders matter

Centralized coordination is simpler than fully decentralized coordination.
A designated leader can:

- Sequence operations (impose order).
- Allocate resources (decide who gets what).
- Mediate communication (route messages).
- Adjudicate disagreements (break ties).

But the leader is a *single point of failure* — if it crashes, coordination stops.
Leader election protocols provide a way to designate a leader *and* recover by electing a new one if the current leader fails.

## Standard protocols

- **Bully algorithm.** Highest-ID agent claims leadership; others defer.
  On failure detection, election restarts.
- **Ring-based.** Agents arranged in logical ring; token passes around; highest-priority candidate wins.
- **Raft leader election.** Randomized timeouts; agents start elections when they suspect leader failure; majority votes elect.
- **Paxos leader.** Implicit in proposer role; multiple proposers serialize through phase 1.
- **Chang-Roberts** (ring-based, simple).

Each varies in messages required, latency, fault tolerance.

## Properties to prove

- **Safety.** At most one leader at a time (in any particular epoch).
- **Liveness.** Eventually a leader is elected (assuming sufficiently many non-faulty agents).
- **Termination.** Election completes in finite time.
- **Uniqueness.** All correct agents agree on the current leader.

Achieving all simultaneously requires assumptions about the failure model and synchrony.

## Failure models

Leader election protocols differ in what failures they tolerate:

- **Crash failures.** Agents stop; never resume.
  Tolerable by simple protocols.
- **Crash-recovery failures.** Agents stop and restart.
  Requires persistent state.
- **Omission failures.** Messages lost.
  Requires retransmission and timeout-based detection.
- **Byzantine failures.** Agents behave arbitrarily, including lying or sending different messages to different recipients.
  Requires BFT-style protocols.

Stronger failure models require more agents and more complex protocols (per [byzantine-bound](../theorems/byzantine-bound.md)).

## In multi-agent AI

Leader election appears when:

- **Multi-agent orchestration designates a coordinator.** Among agents, one selects subtasks for others.
- **Failure recovery in agent systems.** Detecting and replacing a failed coordinator agent.
- **Distributed AI training.** Selecting parameter- server roles, gradient-aggregation coordinators.
- **Decentralized AI coordination.** Where agents from different developers must select a temporary coordinator without prior trust.

## Limits

- **Liveness vs partition tolerance.** Per [cap-coordination-impossibility](../theorems/cap-coordination-impossibility.md), some failure scenarios preclude both progress and consistency simultaneously.
- **Spurious elections.** False failure detection causes unnecessary elections, hurting throughput.
- **Split-brain.** Network partitions can produce multiple leaders; safety violations follow if not handled.

## Status

Mature distributed-systems area.
Application to AI multi-agent contexts is active, especially as agent ecosystems become decentralized and require coordination without prior trust.
