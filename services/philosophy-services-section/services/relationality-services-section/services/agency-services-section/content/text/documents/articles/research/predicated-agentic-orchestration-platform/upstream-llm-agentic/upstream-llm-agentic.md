---
type: narrative
status: current
recaps: [agent, skill, runbook, dispatch, memory, session]
introduces: []
discusses: [agent, skill, runbook, dispatch, formality-layer]
title: "Upstream stream: LLM-era agentic computing"
description: This narrative situates the agential-orchestration-platform against the upstream stream of LLM-era agentic computing — the post-2022 lineage that ran from ReAct's interleaved reasoning-and-action through the function-calling and…
---

# Upstream stream: LLM-era agentic computing

This narrative situates the agential-orchestration-platform against the upstream stream of *LLM-era agentic computing* — the post-2022 lineage that ran from ReAct's interleaved reasoning-and-action through the function-calling and Assistants surfaces of OpenAI and Anthropic, the academic surveys consolidating the field's four-component architecture, and the long-horizon generative-agent demonstrations like Smallville.
The platform inherits the field's engineering shape and reformulates each component as substrate content.

## What the stream consists of

Three sub-currents:

- **The agent-loop pattern.** [Yao et al. (2023, ReAct)](../skill/tool-use-as-skill-invocation/yao-et-al2023/yao-et-al2023.md) introduces the interleaved thought-action-observation pattern.
  [Schick et al. (2023, Toolformer)](../skill/tool-use-as-skill-invocation/schick-et-al2023/schick-et-al2023.md) demonstrates *learned* tool use at the model level.
  The pattern is the load-bearing engineering shape that propagated into every subsequent agent framework.
- **Long-horizon, persistent-memory agents.** [Park et al. (2023, Generative Agents)](../park-et-al2023/park-et-al2023.md) demonstrates that LLM agents with persistent memory streams, reflection, and hierarchical planning produce coherent multi-day social behavior in simulation.
  The architecture became the canonical reference for *long-horizon* LLM agents.
- **Field surveys and industry standardization.** [Wang et al. (2024)](../wang-et-al2024/wang-et-al2024.md) and [Xi et al. (2023)](../xi-et-al2023/xi-et-al2023.md) survey the LLM-agent field, converging on a profile-memory-planning-action four-component view.
  [Hong et al. (2024, MetaGPT)](../hong-et-al2024/hong-et-al2024.md) is representative of the LLM-orchestration-framework genre.
  [OpenAI Assistants and Function Calling](../openai-agents-docs/openai-agents-docs.md) and [Anthropic Building Effective Agents](../anthropic-agent-loops/anthropic-agent-loops.md) document the de facto industry surface that LLM applications coalesced around.

## What the platform borrows

- **The interleaved reason-act-observe loop.** ReAct's pattern is structurally the platform's tick / dispatch / runbook cycle restated for LLM-mediated agents: each tick may emit a reasoning predication (a "thought") and a skill invocation (an "act"), with the post-act substrate state read by the next tick.
  The engineering insight that *reasoning needs to be inspectable trace, not opaque internal model state* is the platform's commitment.
- **Typed tools as first-class.** The OpenAI / Anthropic function-calling surfaces establish that agents need typed external functionality with schema'd parameters and return values.
  The platform's [tool-use-as-skill-invocation](../skill/tool-use-as-skill-invocation/tool-use-as-skill-invocation.md) concept names the substrate-content reformulation: a tool is a skill, the schema is a substrate-recorded shape, the result is substrate-content typed by the value-domain.
- **Persistent memory across sessions.** The Generative Agents architecture demonstrates that long-horizon agents need substrate-resident memory (the *memory stream*).
  The platform's [scratchpad-as-session-memory-projection](../memory/scratchpad-as-session-memory-projection/scratchpad-as-session-memory-projection.md) concept names the relationship: the LLM-era scratchpad is recovered as a session-scoped projection of the substrate's memory predications, with cross-session and long-horizon memory as agent-scoped predications above the session.
- **Reflection and hierarchical planning.** Park et al.'s reflection cycle (synthesize higher-level inferences from recent memories) and hierarchical planning (decompose goals top-down into action sequences) are skill-invocation patterns the platform admits as substrate-content runbooks.
  Reflections become inference predications; hierarchical plans become nested runbooks.
- **The workflows-vs-agents distinction.** Anthropic's *Building Effective Agents* distinguishes deterministic LLM-orchestrated workflows from fully-agentic loops.
  The platform admits both shapes uniformly through the [runbook](../teaching/explanations/runbook.md) discipline: a deterministic workflow is a no-branching runbook; a fully-agentic loop is a runbook whose every step is "dispatch against current state."
- **The four-component vocabulary.** Wang et al.'s profile-memory-planning-action consolidation gives the platform a useful taxonomy for cross-mapping.
  The platform's [agent](../teaching/explanations/agent.md), [memory](../teaching/explanations/memory.md), [runbook](../teaching/explanations/runbook.md), and [skill-invocation](../skill/skill-invocation/skill-invocation.md) are the four components, with the platform's specific reformulation that all four are substrate content.

## Where the platform diverges

- **Substrate content, not separate engineering layers.** The published LLM-agent stream implements the four components as separate engineering concerns: profile in the prompt prefix; memory in a vector database; planning in an external orchestrator (LangGraph, AutoGen, MetaGPT); action in a tool router.
  The platform makes all four the substrate's content — same store, same operators, same federation, same witness chain.
  Per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md), this is the platform's defining commitment for the agential layer.
- **Reasoning trace as substrate content, not prompt buffer.** ReAct's thoughts are tokens in the LLM's prompt buffer; subsequent calls re-read the buffer to ground the next thought.
  The platform's thoughts are substrate predications: witnessed, federation-replicable, queryable through the substrate's normal operators, available to other agents in the same scope.
  Reasoning becomes auditable shared content, not single-agent private state.
- **Tool calls as typed skill invocations, not opaque model emissions.** Function-calling treats tool invocations as model-emitted JSON objects executed by the application.
  The platform makes tool invocations *first-class substrate operators* with full pre/post-condition discipline, capability checking against the agent's authorization fiber, and witnessing in the event log.
  The model's role is reduced to *selecting* a skill and arguments; the substrate's role is the actual invocation discipline.
- **Memory as substrate, not external store.** The Generative Agents architecture stores the memory stream in a separate data structure with retrieval-by-similarity.
  The platform's memory is the substrate's event log restricted to the agent's session and observation predications, with retrieval by the substrate's [query-language](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/query-language.md) and [dispatch](../teaching/explanations/dispatch.md) over the predication graph (importance, recency, and relevance computable from substrate-content properties).
- **Multi-agent orchestration as substrate federation, not framework glue.** MetaGPT, AutoGen, CrewAI, ChatDev coordinate multiple LLM agents through framework-level message routing, role-assignment templates, and SOP-encoded prompt chains.
  The platform makes inter-agent coordination *substrate federation*: agents are substrate entities, messages are predications, SOPs are runbooks, federation across substrate instances is value-domain join.
  There is no orchestration framework; the substrate is the orchestrator.
- **Workflow / agent shape as runtime parameter, not architectural choice.** The Anthropic *workflows-vs-agents* distinction is, in published practice, a *design-time* choice baked into the application's architecture.
  The platform makes it a *runbook structure* parameter — the same agent ticks the same dispatch loop, with the runbook's branching structure determining how much agency vs. determinism is in play at any step.

## What the stream lacks that the platform supplies

The published LLM-agent stream has a strong industry surface (OpenAI Assistants, Anthropic agents, LangChain / LangGraph / CrewAI / AutoGen frameworks) and an active research literature, but the stream lacks: (i) substrate-content provenance — agent decisions are not natively auditable, with provenance bolted on through external logging; (ii) federation across vendor / instance boundaries — agent state is vendor-locked or framework-locked; (iii) bilattice value-domain — contradictions in agent observations explode the agent's coherent reasoning rather than being represented and acted on; (iv) self-representation of agent machinery — skills, runbooks, governance rules are framework code, not substrate content the agent can read about itself.

The platform's contribution is supplying all four through the substrate-content reformulation: every LLM-agent component becomes substrate content, inheriting witnessing, federation, the bilattice domain, and self-representation from the substrate without re-engineering.
The composite-theory positioning narrative at [predicated-agentic-computing](../predicated-agentic-computing/predicated-agentic-computing.md) returns to this point: the LLM-era stream supplies the agent surface; the predication-and-logic stream supplies the substrate; the composite is *predicated agentic computing*.
