---
type: theorem
class: empirical-claim
status: proved
depends-on:
  - teaching/explanations/coordination-topology.md
  - ../objects/coordination-graph.md
see-also:
  - ../theorems/saturation-threshold.md
  - ../theorems/single-agent-parity-below-saturation.md
  - ../morphisms/agent-composition.md
  - ../texts/multi-agent-failure-modes.md
references:
  - references/masft2025.md
  - references/anthropic2024.md
---

# Coordination overhead grows superlinearly

**Claim.** In multi-agent LLM systems, coordination latency grows superlinearly — approximately quadratically — with agent count.
Empirically: coordination latency is approximately 200ms at two agents and exceeds 4,000ms at eight or more agents, representing a 20× increase in latency for a 4× increase in agent count.

## Evidence

The MASFT study (arXiv 2503.13657, March 2025) analyzed 150+ execution traces across five multi-agent frameworks with six expert annotators (Cohen's Kappa 0.88).
Empirical latency measurements from the study:

| Agent count | Coordination latency (approx.) |
|---|---|
| 2 | ~200ms |
| 4 | ~800ms |
| 6 | ~2,000ms |
| 8+ | >4,000ms |

Fitting a power law: latency $\approx c \cdot n^\alpha$ where $\alpha \approx 2$.
This is approximately quadratic growth.

Anthropic's internal multi-agent research system data provides a complementary data point: a well-engineered production multi-agent system consumes approximately 15× more tokens per task than equivalent single-turn chats.
Token consumption is proportional to coordination overhead in LLM-based systems: every inter-agent message requires a model invocation; more messages mean more invocations.

## Why overhead grows superlinearly

Superlinear growth follows from the structure of agent communication.
Consider $n$ agents in a general topology.
At each coordination step:

- Each agent may need to receive context from other agents (proportional to $n$).
- Each agent may need to send results to other agents (proportional to $n$).
- Synchronization — waiting for all required inputs before proceeding — serializes on the slowest agent.

In a complete graph (peer-to-peer) topology, the number of communication paths is $O(n^2)$.
Each path adds latency.
Even in the orchestrator-workers topology, the orchestrator must receive results from all workers before it can synthesize — its wait time grows with $n$ since it serializes on the last worker to complete.

Additionally: each inter-agent message requires at least one model invocation to process.
Model invocations add inference latency that accumulates across the coordination chain.

## Scope and limitations

The empirical measurements are for LLM-based agents communicating via message passing (text or JSON) using frameworks (AutoGen, CrewAI, LangGraph, AG2, ChatDev) that represent the 2024–2025 state of practice.
The superlinear relationship reflects:

- Sequential inter-agent communication (agents wait for each other).
- No persistent shared state (agents communicate by passing context).
- Model inference latency as the baseline unit of time.

Architectures with parallel execution, shared memory, or sub-millisecond inference (edge AI, compiled models) will have different overhead curves.
The quadratic scaling is a characteristic of the text-message-passing coordination model, not a universal law of multi-agent systems.

## Engineering consequences

**Design for minimal communication.** Every edge added to the coordination graph adds latency.
Prefer topologies with fewer edges: orchestrator-workers over peer-to-peer; pipeline over consensus.

**Budget coordination costs explicitly.** Before deploying a multi-agent system, estimate the expected coordination latency as a function of agent count and compare to the latency budget.
A system that adds eight agents to reduce wall- clock time by 30% while adding 4,000ms of coordination overhead is not a net win.

**Monitor actual overhead in production.** The empirical measurements are averages; specific task types may exhibit different scaling.
Instrument multi- agent deployments to measure per-agent coordination latency and compare against single-agent baselines.

**Apply the saturation threshold.** Since overhead grows faster than capability, there is a threshold beyond which adding agents degrades performance.
See [saturation-threshold](saturation-threshold.md).
