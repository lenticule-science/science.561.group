---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - episodic-memory.md
  - semantic-memory.md
references: []
title: Procedural memory
description: Procedural memory is memory of how to perform skills, expressed as capacity to execute rather than as retrievable proposition.
---

# Procedural memory

**Procedural memory** is memory of *how to perform skills*,
expressed as capacity to execute rather than as retrievable
proposition. Knowing how to ride a bicycle, type, parse
visual scenes, or recognize speech are all procedural.

## What distinguishes procedural memory

- **Implicit access.** The agent uses the memory without being
  able to verbalize its content. A skilled pianist plays the
  piece without explicit recall of finger positions.
- **Slow acquisition, slow decay.** Procedural skills are
  acquired through extensive practice and decay slowly when
  unused. Contrast with episodic memory, which is acquired
  fast and decays fast.
- **Performance-based evaluation.** The "content" of a
  procedural memory is measured by behavior, not by
  introspection.

## Computational analogs

Procedural memory in AI systems is typically *embodied in
weights*:

- **Trained classifier weights** are procedural memory of "how
  to classify."
- **Trained policy weights** in
  [reinforcement-learning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/reinforcement-learning/_index.md)
  are procedural memory of "how to act in this domain."
- **Compiled programs and tool-use scripts** are explicit
  procedural memory in the symbolic stack.
- **In-context examples** in LLM few-shot prompts function as
  *temporary* procedural memory: "here's how to format
  outputs like this."

## Procedural vs declarative

The cognitive-psychology literature contrasts *procedural*
(implicit, performance-based) with *declarative* (episodic +
semantic, explicit, retrievable). The contrast roughly aligns
with the AI distinction between *parametric* (in-weights,
implicit) and *external memory* (retrievable).

## In LLM agents

LLM agents have:

- **Procedural knowledge in weights** — the model knows how
  to write Python, how to summarize, how to translate, all
  via training.
- **Procedural knowledge in context** — few-shot examples
  configure the model into a temporary skill for the
  duration of the context.
- **Procedural knowledge in tools** — tool-use grants access
  to procedures (compute, search, code execution) that are
  not in the model's weights.

The distinction matters for capability evaluation: a model
with no in-weights skill at $X$ may still be able to do $X$
via tools, and a model with strong in-weights skill at $X$
may sandbag when explicitly asked.

## Limits

Procedural memory is hard to introspect, hard to inspect, and
hard to edit without retraining. This is the substrate of the
[interpretability](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/interpretability/_index.md) program
and of the difficulty of correcting mis-trained behaviors
without forgetting useful ones.
