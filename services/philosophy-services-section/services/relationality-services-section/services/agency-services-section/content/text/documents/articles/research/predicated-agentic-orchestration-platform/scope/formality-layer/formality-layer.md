---
type: concept
class: discipline
depends-on: [agent, skill]
see-also: [dispatch, tick]
title: Formality layer
description: The platform's pattern for matching the formality of an action's content to the cost class of agents capable of producing that action.
---

# Formality layer

The platform's pattern for matching *the formality of an action's content* to *the cost class of agents capable of producing that action*.
An action whose content is fully algebraic — closure-rule application, graph query, deterministic tool call — can be produced by a deterministic script with no inference cost.
An action whose content is structured but specifically formatted — a routine summary, a frontmatter edit, a triage classification — can be produced by a small fine-tuned classifier.
An action whose content is narrative or novel — substantive research, architecture, judgment — requires a frontier language model.

The discipline is to dispatch each piece of work to the lowest formality layer that can handle it.
A query for "what skills can be invoked at this scope?" is structurally a graph [traversal](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) of capability predications and admits the deterministic-script layer.
A request to format a triage summary admits the small-fine-tuned-classifier layer.
A request to debug a failed deployment requires the frontier model.
The substrate's [dispatch](dispatch.md) machinery reads the work's required-formality predication and routes accordingly.

Three engineering implications:

- **Layer choice is a dispatch decision.** Each agent declares which formality range it serves, as part of its capability predications.
  The platform's dispatch operator matches required-formality to agent-formality during the candidate computation.
- **Cost is bounded by the layer mix.** The platform's per-workload cost is the sum across actions of the layer-cost of each action.
  A workload routed through the lowest admissible layers is structurally cheaper than the same workload routed entirely through the highest.
  The cost-bounding behavior is what makes formality routing operative engineering, not a slogan.
- **Layer escalation is admissible.** When a lower-layer agent cannot complete the work (the script encounters an ambiguous match, the classifier produces low-confidence output), the platform escalates to the next layer.
  Escalation produces a [witness](../../teaching/explanations/witness.md) entry; the cost-per-action rises at the escalation point but the average over the workload remains bounded.

The pattern connects to the [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md) property: when the platform's skills are themselves entities, the platform's tool-call history is itself substrate-readable, and a fine-tuned classifier trained on that history is itself an entity in the platform.
The closer the platform gets to self-generation, the more layer-routing decisions it can make from its own substrate-recorded behavior.
The engineering content of *the system improves itself* lies here.
