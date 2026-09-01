---
type: concept
class: structural
status: active
depends-on:
  - agentic-system.md
  - delegation-chain.md
see-also:
  - ../objects/coordination-graph.md
  - ../morphisms/agent-composition.md
  - ../morphisms/delegation.md
  - ../theorems/coordination-overhead-grows-superlinearly.md
  - ../theorems/saturation-threshold.md
  - ../theorems/single-agent-parity-below-saturation.md
  - ../terms/multi-agent-system.md
  - ../texts/multi-agent-failure-modes.md
  - ../texts/orchestration-vs-choreography-survey.md
references:
  - references/masft2025.md
  - references/anthropic2024.md
---

# Coordination topology

Coordination topology is the structural pattern governing how multiple agents relate and communicate.
It specifies the graph structure of agent relationships (who talks to whom), the control regime (who decides what), and the data flow (who holds what state).

Four topologies cover the overwhelming majority of multi-agent deployments as of 2024–2026:

## Orchestrator-workers

A central orchestrator agent decomposes a task, assigns subtasks to worker agents, collects results, and synthesizes a response.
The orchestrator controls the workflow; workers execute in isolation and report back.
This is the most common topology in production agentic systems.

*Control regime:* Centralized — the orchestrator decides all task assignments and sequencing.

*Data flow:* Hub-and-spoke — all communication passes through the orchestrator.
No worker-to-worker communication.

*Characteristic failure modes:* Orchestrator becomes a bottleneck; single point of failure; worker failures require orchestrator-level recovery.

*Examples:* Claude Code subagent model, most frameworks' "manager" pattern.

## Peer-to-peer

Agents communicate directly without a central coordinator.
Each agent publishes its capabilities and other agents invoke them as needed.
Coordination is emergent rather than designed.

*Control regime:* Decentralized — agents decide their own actions based on messages received.

*Data flow:* Arbitrary — any agent can message any other directly.

*Characteristic failure modes:* Coordination requires agents to discover each other; cascading misinterpretation propagates without a single recovery point; accountability is diffuse.

*Examples:* Claude Agent SDK's TeammateTool, A2A-based agent networks.

## Pipeline

Agents execute in a fixed sequence.
Each agent transforms the output of the previous one.
The topology is a directed acyclic graph where each node is an agent.

*Control regime:* Sequential — execution order is fixed by the pipeline definition.

*Data flow:* Linear — output of stage N is the input to stage N+1.

*Characteristic failure modes:* Error propagation is deterministic (MASFT's "cascading misinterpretation"); early-stage errors amplify through later stages; no opportunity for recovery at intermediate stages.

*Examples:* Draft-review-format pipelines; preprocessing chains.

## Debate / consensus

Multiple agents independently address the same problem, then compare or critique each other's outputs.
Disagreement signals low confidence; agreement provides error reduction.
The system resolves by voting, averaging, or a designated arbitrator.

*Control regime:* Parallel with arbitrated convergence.

*Data flow:* Fan-out (single input → N agents) then fan-in (N outputs → arbitrator).

*Characteristic failure modes:* N× token consumption regardless of query difficulty; agents that converge on the same wrong answer produce false confidence; arbitration adds a single point of failure.

*Examples:* LLM debate (Du et al., 2023), ensemble critique pipelines.

## Topology selection and overhead

Coordination topology is the primary determinant of coordination overhead.
Orchestrator-workers has predictable overhead proportional to worker count.
Peer-to-peer has overhead that grows with the number of message paths (O(n²) in the worst case).
Pipeline has overhead proportional to pipeline depth.
Debate multiplies compute by N.

The saturation threshold — beyond which coordination overhead exceeds the benefit of specialization — is approximately four agents regardless of topology (MASFT study, arXiv 2503.13657).
Above this threshold, adding agents increases cost faster than it increases capability.
