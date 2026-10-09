---
type: question
class: open
status: open
depends-on:
  - ../theorems/coordination-overhead-grows-superlinearly.md
  - ../objects/coordination-graph.md
  - teaching/explanations/coordination-topology.md
see-also:
  - ../theorems/saturation-threshold.md
  - references/masft2025.md
---

# Is superlinear coordination overhead growth a structural lower bound?

## Question

Is the superlinear (approximately quadratic) growth of coordination overhead with agent count a necessary property of multi-agent LLM architectures, or is it an artifact of current communication protocols and serialization patterns that future architectures could overcome?

## Background

The [coordination-overhead-grows-superlinearly](../theorems/coordination-overhead-grows-superlinearly.md) theorem documents empirical evidence of approximately quadratic latency growth from the MASFT study (arXiv 2503.13657, March 2025).
The theorem notes that this is a characteristic of the text-message-passing coordination model of 2024–2025 and may not generalize to architectures with parallel execution, shared memory, or sub-millisecond inference.

The intuitive reason for superlinear growth is that every agent must be contextually informed of the current state: in text-message-passing systems, each agent receives a full context before each step.
The cost of distributing context grows with the number of agents (O(n)) and with context size (O(context length)).
If context length grows with the number of coordination steps (which also grows with n), the result can be worse than O(n²).

## Lower bound argument

A basic lower bound argument: suppose each agent must receive at least one bit of information per coordination round to know what other agents have done.
With n agents, there are n(n-1)/2 pairs of agents.
If all-to-all information distribution is required (every agent knows what every other agent did), the minimum communication is Θ(n²) per round.
This is a lower bound for any all-to-all coordination protocol.

However, most practical coordination does not require all-to-all information.
In an orchestrator-workers topology, only the orchestrator needs full information; workers need only their assigned subtasks and results.
The communication cost for orchestrator-workers is O(n) per round, not O(n²).

This suggests that the quadratic growth observed in the MASFT study may be an artifact of peer-to-peer and heavily-interconnected coordination topologies, not a fundamental lower bound for all topologies.

## Open subquestions

1. **What is the communication complexity lower bound for specific topologies?** Orchestrator-workers: O(n).
  Pipeline: O(1) (each agent talks to one neighbor).
  Peer-to-peer: Ω(n²) for all-to-all.
  Can different topologies achieve different growth classes?

2. **What if agents share a common state layer?** In shared-memory multi-agent systems, agents read and write to a common store rather than passing messages.
  Communication is mediated by the store.
  Does this reduce coordination overhead, or does contention on the shared state introduce new superlinear costs?

3. **Does the LLM inference cost dominate?** In systems where inference is the bottleneck (milliseconds per step), coordination message passing may be negligible.
  The quadratic growth observed may be primarily LLM invocation overhead (each agent makes model calls proportional to the number of messages it receives) rather than network communication overhead.

4. **What does the saturation threshold become under lower-overhead architectures?** If coordination overhead is reduced by an order of magnitude, does the saturation threshold shift from ~4 agents to ~40?
  Or does the capability-gain curve also saturate earlier?
