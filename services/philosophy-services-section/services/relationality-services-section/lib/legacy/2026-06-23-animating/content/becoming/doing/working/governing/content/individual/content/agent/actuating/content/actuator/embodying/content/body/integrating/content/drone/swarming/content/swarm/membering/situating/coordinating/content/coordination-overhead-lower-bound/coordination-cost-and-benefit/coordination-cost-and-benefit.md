---
type: narrative
class: conceptual-walkthrough
status: active
depends-on:
  - ../teaching/explanations/coordination-topology.md
  - ../theorems/coordination-overhead-grows-superlinearly.md
  - ../theorems/saturation-threshold.md
  - ../theorems/single-agent-parity-below-saturation.md
see-also:
  - ../morphisms/agent-composition.md
  - ../objects/coordination-graph.md
  - ../texts/multi-agent-failure-modes.md
references:
  - ../references/masft2025.md
  - ../references/anthropic2024.md
---

# Coordination cost and benefit: when multi-agent systems pay

The premise of multi-agent AI systems is simple: specialized agents working together can solve problems that a single agent cannot.
The evidence from the MASFT study (arXiv 2503.13657, March 2025) is sobering: the premise is conditionally true, and many multi-agent deployments fail the conditions.

## The baseline comparison is harder than it looks

The naive comparison — multi-agent versus single-agent — understates the competition.
The correct comparison is multi-agent versus best-of-N single-agent, where N is the number of agents in the multi-agent system.

If you deploy four specialized agents to solve a task, you are spending the compute equivalent of four single-agent runs.
The question is not whether four agents together are better than one agent alone — of course they often are.
The question is whether four agents coordinating are better than four independent runs of the best single agent you have, taking the best result.

The MASFT study found that in many configurations, the coordinated multi-agent system performed worse than this best-of-four baseline.
Coordination overhead ate the gains from specialization.

## The three cases where coordination pays

There are exactly three situations where multi-agent coordination overcomes its overhead:

**Case 1: Capability disjointness.** The task requires capabilities that cannot coexist in a single agent's environment.
A software engineering task that requires simultaneously running a code execution sandbox and browsing live web documentation cannot be done by a single agent with both — the environments interfere.
Two agents, each with one environment, solve this.

Capability disjointness is the cleanest case for multi-agent coordination.
The single agent cannot do the task at all; the multi-agent system can.
No comparison to best-of-N applies because the single agent is simply not a candidate.

**Case 2: Independent parallelism.** The task decomposes into subtasks with no data dependencies between them, and wall-clock time is the binding constraint.
Running four independent research threads in parallel and synthesizing results can return in one-quarter of the time.

The key word is independent.
If the subtasks have dependencies — the output of subtask A is required for subtask B — then parallelism is not available.
And if wall-clock time is not the binding constraint — if the user will wait — then sequential single-agent execution is simpler and more reliable.

**Case 3: Diversity for hallucination reduction.** Multiple agents independently reasoning about the same problem and comparing results reduces hallucination at the cost of N× compute.
The debate and consensus patterns implement this.

The cost is real: N× compute, plus coordination overhead.
The benefit is available only when hallucination is the primary failure mode and the task admits a comparison mechanism between agents' outputs.
Mathematical problem solving, code generation with test-based validation, and structured data extraction with schema checking all support this pattern.

## The three cases where coordination does not pay

**Insufficient task complexity.** If a single agent can reliably solve the task, adding agents adds overhead without adding capability.
Multi-agent systems make sense when tasks exceed single-agent capability — not when they merely could be divided.

**Poor subtask independence.** If subtasks share state, subtask B requires A's output, or agents need to stay synchronized, the dependencies eat the parallelism and add coordination latency without shortening wall-clock time.

**Below saturation.** When agent count is low and specialization overlap is high, the [saturation threshold](../theorems/saturation-threshold.md) is reached early.
The MASFT study found gains plateau at approximately four agents across the tested frameworks.
Adding a fifth agent is adding coordination overhead in exchange for marginal specialization.

## The design principle

**Single agent first.** Start with a single well-tooled agent and measure performance.
Identify the specific bottleneck that the agent cannot overcome: capability limit, wall-clock time, reliability.
Design the multi-agent system to address the specific bottleneck — not to appear more sophisticated.

**Measure against the right baseline.** When evaluating multi-agent performance, always compare to best-of-N single-agent with the same compute budget.
If the multi-agent system does not clearly exceed this baseline, do not deploy it.

**Sparse coordination graphs.** Every edge in the coordination graph is a source of latency, message passing overhead, and potential misinterpretation.
Use the sparsest graph that achieves the task: orchestrator-workers over peer-to-peer; pipeline over consensus; unidirectional over bidirectional where possible.
