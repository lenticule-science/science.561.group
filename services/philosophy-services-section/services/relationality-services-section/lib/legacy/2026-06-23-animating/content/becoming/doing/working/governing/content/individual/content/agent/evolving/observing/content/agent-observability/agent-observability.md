---

title: "Agent Observability"
description: "The practice of instrumenting agentic systems to make their decisions, tool calls, state transitions, and failure modes inspectable — tracing the causal chain from input to action."
defines: Agent Observability
domain: agents
measures: agentic-system
requires: agent-orchestration
enables: agent-evaluation, agent-self-improvement
delivered-via: langgraph, pydantic-ai
date-created: 2026-03-29
---

Agent observability is the practice of instrumenting [agentic systems](./agentic-system.md) to make their decisions, [tool calls](./tool-use.md), state transitions, and failure modes inspectable.
In traditional software, observability means logs, metrics, and traces.
In agentic systems, observability must additionally capture *why* the model made each decision — what context it saw, what alternatives it considered, and what state it was operating on.

Observability matters more in agentic systems than in conversational LLM use because agents are stateful and errors compound.
Anthropic's engineering blog on their production multi-agent research system states this directly: "minor failures cascade into entirely different trajectories."
A wrong tool call in step 3 changes the state that step 4 operates on, which changes step 5's plan, which produces an output unrelated to the original goal.
Without tracing, diagnosing the root cause requires manually reconstructing the agent's reasoning across every step.

### The observability stack

The emerging standard for agent observability (2025) organizes instrumentation into seven layers:

1. **Sessions.** Multi-turn interaction containers.
  Each user engagement is a session; sessions persist across connection interruptions.
2. **Traces.** End-to-end processing of a single request.
  A trace captures everything that happens between receiving a goal and producing a result.
3. **Spans.** Logical units of work within a trace — a single LLM call, a tool invocation, a retrieval operation, a state update.
  Spans nest: a "plan execution" span contains child spans for each tool call.
4. **Events.** Significant milestones within spans — checkpoint saves, human approvals, error recoveries, state mutations.
5. **Generations.** Individual LLM calls with full input/output.
  The most token-expensive layer to log, but essential for debugging prompt-level issues.
6. **Retrievals.** [RAG](../../../terms/retrieval-augmented-generation.md) query tracking — what was searched, what was returned, what was injected into context.
7. **Tool calls.** External API execution monitoring — arguments sent, results received, latency, errors.

### What to measure

**Token usage per step.** Anthropic's production data shows token usage explains 80% of performance variance on complex tasks.
Tracking tokens per tool call, per agent, per workflow reveals where budget is spent and where compression would help.

**Decision traces.** Record the model's reasoning at each branching point — what state it observed, what action it chose, what alternatives existed.
[LangGraph](./langgraph.md)'s checkpoint system provides this for graph-based workflows; PydanticAI's Logfire integration provides it through OpenTelemetry traces.

**Failure classification.** Categorize failures by type (hallucinated tool call, schema validation error, timeout, permission denied, context overflow) and by recovery strategy (retry, escalate to human, abort, adapt).
This produces a failure taxonomy specific to the system.

**Latency breakdown.** Total response time decomposed into LLM inference time, tool execution time, retrieval time, and coordination overhead.
In [multi-agent systems](./multi-agent-system.md), inter-agent communication latency dominates at scale.

### Observability and privacy

Logging full LLM inputs and outputs captures user data, proprietary information, and potentially sensitive content.
Anthropic's recommendation: track decision patterns and interaction structures rather than conversation contents.
Log the shape of the trace (which tools were called, in what order, with what result types) rather than the full text.
