---
type: narrative
status: active
see-also:
  - ../teaching/explanations/agent-orchestration.md
  - ../objects/protocol.md
---

# The orchestration pattern

Since 2022, the dominant pattern in applied multi-agent AI has been *agent orchestration*: composing multiple LLM-based agents into structured systems — pipelines, supervisor-worker hierarchies, debate protocols, peer networks — that achieve goals beyond what any single agent could.
The pattern has become standard infrastructure for production AI applications.
This narrative tracks how it emerged and what it requires.

## Why orchestration emerged

Single LLM agents are powerful but bounded:

- **Context window limits.** Long tasks exceed any single context.
- **Tool-use scope.** A single agent specialized for one task family is awkward for others.
- **Reasoning quality.** Multi-step reasoning often benefits from explicit decomposition into specialized sub-tasks.
- **Verification.** A single agent cannot reliably critique its own output; multiple agents can cross- check.
- **Specialization.** Different prompts, models, or tools excel at different sub-tasks.

Orchestration addresses these by composing many specialized agent instances rather than relying on one.

## The patterns that emerged

By 2024 several recurring orchestration patterns had crystallized:

**Pipeline.** Sequential transformation: agent A produces output → agent B refines → agent C verifies.
Used for content generation with quality stages, code generation with review steps, research workflows with synthesis stages.

**Supervisor-worker.** A supervisor decomposes tasks and dispatches to worker agents; collects and synthesizes results.
Common in code-agent frameworks (Devin, SWE- agent) and complex task systems.

**Debate.** Multiple agents argue different positions; a judge agent decides.
Used to surface reasoning errors and elicit calibrated answers (AI Safety via Debate; Anthropic's debate research).

**Critic-actor.** One agent acts; another critiques.
Iterate to convergence.
Common in self-improving generation systems.

**Swarm.** Many parallel agents on related sub-problems; results aggregated.
Used for search, exploration, brainstorming.

**Roundtable.** Agents take turns contributing to a shared deliberation.
Used for collaborative planning, multi-perspective analysis.

**Tree-of-experts.** Hierarchical decomposition with specialized leaf agents.
Used for complex problem-solving requiring diverse expertise.

## The frameworks

By 2025 several frameworks formalized orchestration patterns:

- **LangGraph** (LangChain).
  Directed graph of agent nodes with explicit state transitions.
- **CrewAI.** Role-based crews with hierarchical delegation.
- **AutoGen** (Microsoft).
  Multi-agent conversation framework with diverse interaction patterns.
- **OpenAI Swarm.** Lightweight multi-agent orchestration with handoffs.
- **Anthropic's research-mode patterns.** Multi-agent patterns for research-style workflows.

Each framework imposes a set of orchestration primitives (roles, tasks, handoffs, state) that channel design decisions.

## What orchestration delivers

- **Decomposition.** Complex tasks split into manageable sub-tasks each agent can handle.
- **Specialization.** Sub-tasks routed to agents tuned for them.
- **Verification.** Cross-agent review catches errors single agents miss.
- **Parallelism.** Independent sub-tasks executed concurrently.
- **Modularity.** Agent updates don't require system rewrites.

Empirically, multi-agent systems often outperform single agents on complex benchmarks (coding, research, analysis) — but at substantially higher token cost.

## What orchestration demands

- **Coordination overhead.** Multi-agent systems use more tokens, more compute, more latency.
- **Failure handling.** Errors in upstream agents propagate; systems need fallback and retry logic.
- **Truth verification.** Agents cannot reliably tell whether other agents' outputs are correct.
- **Goal alignment.** Agents prompted with related but different goals may pull in different directions.
- **Accountability.** When the composite system makes a mistake, identifying which agent erred is hard.
- **Observability.** Multi-agent systems are harder to debug than single agents; better tracing infrastructure is needed.

## What classical multi-agent theory contributes

Classical multi-agent theory contributes design vocabulary:

- **Mechanism design** for ensuring honest reporting.
- **Voting** for aggregating multiple agents' outputs.
- **Byzantine fault tolerance** for handling adversarial agents.
- **Communication-protocol design** for structuring exchange.

But the fit is imperfect.
Classical theory was developed for self-interested strategic agents in repeated games; LLM agents are neither self-interested in the classical sense nor strategically optimizing across rounds.
The orchestration patterns are *engineered conventions*, not derived from theoretical analysis.

## Where this is going

The field is at an early stage analogous to early distributed systems:

- *Patterns* are being identified, named, codified.
- *Frameworks* are emerging to support common patterns.
- *Best practices* (loosely shared) are forming.
- *Theoretical analysis* lags practice substantially.

What's missing:

- A *theory of orchestration* explaining when which pattern is appropriate.
- *Verification methods* for multi-agent system correctness.
- *Cost models* predicting orchestration overhead.
- *Robustness analysis* for adversarial conditions.

The next phase will likely involve clearer engineering patterns alongside developing theoretical frameworks that catch up to and constrain the patterns.
Whether classical multi-agent theory will adapt or be supplanted by new theory specific to LLM-agent systems is open.
