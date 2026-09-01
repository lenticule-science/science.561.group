---
type: concept
class: contemporary
status: active
depends-on:
  - multi-agent-system.md
see-also:
  - ../objects/joint-policy.md
  - ../objects/protocol.md
  - teaching/explanations/the-orchestration-pattern.md
references: []
---

# Agent orchestration

**Agent orchestration** is the contemporary engineering practice of composing multiple LLM-based agents into structured systems — pipelines, supervisor-worker hierarchies, debate-style protocols, peer collaboration networks — so that the composite achieves goals no single agent could.

## What's new about contemporary orchestration

LLM agents present new orchestration possibilities and problems compared to classical multi-agent systems:

- **Agents are highly capable individuals.** A single LLM agent can perform complex tasks; the question is when orchestrating multiple is beneficial vs costly.
- **Communication is natural language.** Inter-agent messages are typically text, with protocols implicit rather than explicit.
- **Roles are flexible.** A single LLM can be prompted into any of multiple roles; orchestration assigns roles rather than instantiating fixed-purpose agents.
- **Trust is contextual.** Agents can hallucinate, misunderstand, or be jailbroken; downstream agents consuming their outputs face truth-verification problems classical MAS doesn't have.

## Common patterns

- **Pipeline.** Agent A's output is Agent B's input.
  Used for sequential refinement (draft → critique → revise).
- **Supervisor-worker.** A supervisor agent decomposes tasks and dispatches to worker agents; collects results and synthesizes.
  Common in code-agent frameworks.
- **Debate.** Multiple agents argue different positions; a judge agent (or human) decides.
  Used to surface reasoning errors.
- **Critic-actor.** One agent acts; another critiques.
  Loop until convergence.
- **Swarm.** Many parallel agents on related subproblems; results aggregated.
- **Roundtable.** Agents take turns contributing; ordered consensus-building.
- **Tree-of-experts.** Hierarchical decomposition with specialized leaf agents.

## Design dimensions

- **Agent count.** Two?
  A handful?
  Hundreds?
- **Role specialization.** Generic agents vs specialized prompts/tools.
- **Communication topology.** Star (supervisor), pipeline, full mesh, hierarchical.
- **Coordination protocol.** Turn-taking, parallel, triggered.
- **Termination.** When does the system stop?
  Fixed rounds, convergence detection, supervisor decision.
- **Failure handling.** What happens when an agent fails or produces garbage?

## Why orchestration is hard

- **Cascading errors.** Errors in upstream agents propagate; long pipelines compound mistakes.
- **Coordination overhead.** Multiple agents take more tokens, more compute, more latency.
- **Truth verification.** Downstream agents can't reliably tell whether upstream output is correct.
- **Goal misalignment.** Agents prompted with related but different goals may pull in different directions.
- **Accountability gap.** When the composite system makes a mistake, identifying which agent's error is hard.

## What classical MAS theory contributes

- **Mechanism design** — for ensuring agents are incentivized to be honest.
- **Voting and aggregation** — for combining outputs from multiple agents.
- **Byzantine fault tolerance** — for handling adversarial or unreliable agents.
- **Communication-protocol design** — for structuring inter-agent message exchange.

But classical theory was developed for self-interested strategic agents in repeated games; LLM agents are neither self-interested in the classical sense nor strategically optimizing across rounds.
The fit is imperfect; orchestration practice has largely outpaced formal theory.

## Status

Active engineering practice with rapidly accumulating patterns and frameworks (LangGraph, CrewAI, AutoGen, OpenAI Swarm, etc.).
The empirical question of when orchestration helps vs hurts is partially understood: multi-agent systems often outperform single agents on complex tasks, but at substantial token cost, and the gains are uneven across task types.
