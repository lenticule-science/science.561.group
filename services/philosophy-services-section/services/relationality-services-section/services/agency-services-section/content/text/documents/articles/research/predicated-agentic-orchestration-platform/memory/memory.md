---
type: concept
class: structure
depends-on: [session, agent]
see-also: [session]
title: Memory
description: The platform's pattern for recording what an agent has recently encountered — entities traversed, messages received, skills invoked — and what should be retained for the next tick of the same agent or session.
---

# Memory

The platform's pattern for recording what an [agent](agent.md) has recently encountered — entities traversed, messages received, skills invoked — and what should be retained for the next [tick](tick.md) of the same agent or [session](session.md).
Memory is a sub-region of the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) whose entities are *recall records*: predications connecting the agent to recently-touched entities, each carrying a relevance value in the substrate's value-domain.

Three properties make memory work on the predication substrate:

- **Relevance is a value, not a Boolean.** Each recall record carries a value indicating how strongly the agent should retain the entity.
  Positive evidence (recent traversal, presence in the session's working set) raises the relevance; negative evidence (time elapsed without further attention, explicit dismissal) lowers it.
  The substrate's value-domain (multi-valued, weighted, bilattice-valued for paraconsistent reasoning) determines what "relevance" can express.
- **Settled by closure rules.** Memory is not a separate data structure with its own retrieval algorithm; it is a sub-region of the substrate whose retention is determined by [closure rules](../../teaching/explanations/closure-rule.md) in the substrate's closure machinery.
  The relevance-decay rule, the recency-promotion rule, the explicit-dismissal rule — each is a closure rule that the substrate's closure-driven advance applies, like any other rule.
- **Capped by scope.** An agent's memory is bounded by [scope](../scope/scope.md): only entities visible at the agent's scope are admissible recall records.
  This is the engineering content of "agents do not remember what is outside their authority."

The pattern unifies what particular platform realizations sometimes treat as three separate engineering concerns — relevance scoring, recency-weighted decay, per-session memory capping — under one substrate-level discipline: each is a closure rule, and the platform's memory is the settled state of the relevant rules.
Replacing one closure rule with another tunes the memory behavior; adding a new closure rule introduces a new memory aspect.

Context-engineering concerns common to language-model-based agents — context window size, context compaction, retrieval-augmented prompts — are particular realizations of memory under specific cost and representation constraints.
Compaction, in particular, is the rewriting of memory predications into a smaller-canonical-form representation that retains the high-relevance recall records and discards the low-relevance ones, all under the same closure-rule discipline as ordinary memory advance.
