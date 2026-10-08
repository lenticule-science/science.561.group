---
type: concept
class: memory
status: sketch
depends-on: [memory, session, event-log, yao-et-al2023, park-et-al2023]
see-also: [tool-use-as-skill-invocation, practical-reasoning-as-runbook-execution]
title: Scratchpad as session memory projection
description: "The platform's reformulation of the LLM-era scratchpad / agent context window / memory stream discipline (ReAct, Generative Agents): the LLM-mediated agent's working memory is recovered as a projection of the substrate's session-scoped…"
---

# Scratchpad as session memory projection

The platform's reformulation of the LLM-era *scratchpad* / *agent context window* / *memory stream* discipline ([ReAct](../../skill/tool-use-as-skill-invocation/yao-et-al2023/yao-et-al2023.md), [Generative Agents](../../park-et-al2023/park-et-al2023.md)): the LLM-mediated agent's working memory is recovered as a *projection* of the substrate's session-scoped predications, restricted to the format the LLM can read in its context window.

The classical view: an LLM agent's working memory is the *prompt buffer* — a finite-length text window containing the system prompt, the agent's persona, the conversation history, recent tool calls and results, and any retrieved long-term memories.
The buffer is opaque to the framework above the LLM (its content is just text the model reads); long-horizon memory is implemented as an external store (vector DB, summary cache) with retrieval feeding selected snippets back into the buffer.

The platform's reformulation: the agent's memory is the substrate's session-scoped predications — a region of the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) restricted to the agent's current [session](session.md) per the [extend-restrict-adjoint](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/extend-restrict-adjoint.md) discipline.
The LLM-readable scratchpad is a *projection* of this substrate region into a text format the model can consume; long-horizon memory is the agent's predications above the session level.

Three structural identifications:

- **Conversation history** ↔ substrate predications on message entities in the session.
  Each message is a substrate entity; the conversation thread is a sequence of message-relation predications.
- **Tool-call results** ↔ skill-invocation witnesses with their result predications.
  The classical scratchpad's "Tool: search; Result: [...]" entries are projections of substrate witness chains.
- **Retrieved long-term memories** ↔ the result of dispatch over the agent's predications above the session level, ranked and projected into the scratchpad.
  Park et al.'s recency-importance-relevance ranking corresponds to the platform's dispatch-ranking discipline applied to memory retrieval.

The projection direction is one-way at the LLM-call boundary: the substrate projects relevant predications into the scratchpad text the LLM reads; the LLM emits a response; the response is parsed and admitted to the substrate as new predications.
The LLM does not directly read or write substrate predications; it operates on a text projection of them.

Three engineering consequences:

- **Federation across LLM and non-LLM agents.** Two agents in the same scope share the substrate's session predications regardless of whether each is LLM-mediated.
  An LLM agent's scratchpad and a deterministic agent's runbook context are the same substrate-content underneath; the projection is what differs.
- **Long-horizon memory is structural, not bolted on.** The classical-LLM-agent pattern requires a separately-maintained vector DB or summary cache for long-horizon memory; the platform inherits long-horizon memory from the substrate's normal scope discipline (predications above the session level persist by default; predications at the session level are session-bounded).
- **Auditable reasoning trace.** The classical scratchpad is auditable only insofar as the application logs the prompt buffer; trace entries are unstructured text.
  The substrate's session predications are typed and witnessed; auditing is a substrate traversal producing a structured trace of the agent's deliberation.

The concept is *sketch* status: it names the relationship between LLM-era scratchpads and substrate session memory so the [upstream-llm-agentic](../../upstream-llm-agentic/upstream-llm-agentic.md) narrative has an atomized referent.
A theorem-level statement of the projection's properties (faithfulness, lossy compression at the prompt-window boundary, recoverability of substrate predications from a parsed scratchpad) is left for follow-up work.
