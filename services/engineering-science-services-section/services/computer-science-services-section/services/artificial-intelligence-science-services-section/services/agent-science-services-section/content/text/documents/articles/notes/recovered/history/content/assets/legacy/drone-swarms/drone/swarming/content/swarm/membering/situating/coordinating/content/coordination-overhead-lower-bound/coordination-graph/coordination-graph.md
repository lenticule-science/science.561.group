---
type: object
class: structural
status: active
depends-on:
  - teaching/explanations/coordination-topology.md
  - teaching/explanations/agentic-system.md
see-also:
  - ../morphisms/agent-composition.md
  - ../objects/delegation-record.md
  - ../theorems/coordination-overhead-grows-superlinearly.md
  - ../theorems/saturation-threshold.md
  - ../terms/multi-agent-system.md
  - ../texts/multi-agent-failure-modes.md
references:
  - references/masft2025.md
  - references/anthropic2024.md
---

# Coordination graph

The coordination graph of a multi-agent system is the directed graph $G = (V, E)$ where the vertex set $V$ is the set of participating agents (plus a designated entry vertex representing the human principal) and the edge set $E$ represents communication links: an edge $(A, B) \in E$ means agent $A$ can send messages to agent $B$ in the course of coordination.

## Graph structure and topology

The coordination graph's structural properties correspond directly to the [coordination topology](teaching/explanations/coordination-topology.md):

**Orchestrator-workers:** A star graph.
The orchestrator is the hub; workers are leaves.
All edges point from hub to leaves (task assignment) and from leaves to hub (result delivery).
Worker-to-worker edges are absent.

**Peer-to-peer:** A complete or near-complete directed graph.
Any agent can message any other.
Maximum communication paths, maximum potential for coordination overhead.

**Pipeline:** A directed path graph.
Each agent has at most one incoming edge (from the prior stage) and one outgoing edge (to the next stage).
Acyclic.

**Debate/consensus:** A fan-out from an input source to N agents, then a fan-in from N agents to an arbitrator.
The graph has a bipartite structure between the debate agents and the arbitrator.

## Edge semantics

Edges in the coordination graph carry semantic content:

- **Task delegation edge** $(A, B)$: agent $A$ assigns a subtask to agent $B$.
  Accompanied by a [delegation record](delegation-record.md).
- **Message edge** $(A, B)$: agent $A$ sends a peer message to agent $B$ for coordination.
- **Result edge** $(A, B)$: agent $A$ returns results to agent $B$ (typically the inverse of a task delegation edge).

Accounting for edge semantics is necessary for accountability tracing: a task delegation edge creates an accountability obligation on $A$ for $B$'s outputs.
A message edge does not.

## Overhead and graph density

[Coordination overhead](../theorems/coordination-overhead-grows-superlinearly.md) is related to graph density: more edges mean more messages, more synchronization points, and more opportunities for cascading misinterpretation (MASFT, arXiv 2503.13657).
A complete graph on $n$ agents has $n(n-1)$ directed edges; its overhead is maximal for $n$ agents.
A star graph on $n$ agents has $2(n-1)$ directed edges; its overhead is proportional to worker count, not to worker count squared.

Choosing the sparsest graph that achieves the coordination goal is a design principle: add edges only where communication is required.

## Non-interference and graph structure

The open problem of non-interference in multi-agent systems (see [formal-non-interference-in-multi-agent](questions/formal-non-interference-in-multi-agent.md)) is a question about the coordination graph: can we prove that agents whose subgraphs are disjoint (no shared edges or vertices) cannot produce conflicting state changes?
For agents with disjoint action targets — writing to non-overlapping file sets, operating on non-overlapping database partitions — non-interference follows from the disjointness of their environmental targets, not from the graph structure alone.
Formalizing this requires specifying the mapping from graph structure to environmental target overlap.
