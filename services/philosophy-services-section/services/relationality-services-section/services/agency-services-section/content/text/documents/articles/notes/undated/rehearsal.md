---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/memory-trace.md
see-also:
  - consolidation.md
  - forgetting.md
references:
  - references/mcclelland-mcnaughton-oreilly1995.md
title: Rehearsal
description: Rehearsal is the repeated re-activation of a memory trace, delaying its forgetting and promoting its consolidation into long-term storage.
---

# Rehearsal

**Rehearsal** is the repeated re-activation of a memory
[trace](memory-trace.md), delaying its forgetting
and promoting its consolidation into long-term storage.

## Two purposes

- **Maintenance rehearsal.** Keeps an item in working memory
  / short-term store by refreshing its trace before decay.
  Required only as long as the item is needed for current
  task; does not promote long-term consolidation by itself.
- **Elaborative rehearsal.** Connects the new item to
  existing semantic structure ("this is like X, this
  contradicts Y"). Promotes long-term consolidation and
  improves later retrievability.

The distinction (Craik & Watkins 1973) explains why mere
repetition without engagement produces poor long-term
retention while engaged study does not require many
repetitions.

## Computational analogs

- **Experience replay.** RL agents replay stored transitions
  to the value network; this is rehearsal in the
  computational sense — re-presenting old data to delay its
  effective forgetting (which would happen if the agent's
  weights drifted away from old experience without replay).
- **Generative replay.** Replay *imagined* (model-generated)
  versions of old experiences. Avoids storing the originals.
  Quality bounded by the generator.
- **Distillation.** A teacher model's outputs are replayed
  to a student during student training, transferring
  knowledge. A form of rehearsal across models.
- **In-context examples.** Few-shot examples in an LLM
  prompt act as ephemeral rehearsal: the model "rehearses"
  the pattern during inference, instantiating it for the
  current task.

## Rehearsal and forgetting

Rehearsal is the canonical *anti-forgetting* operation. The
forgetting curve (Ebbinghaus) is steep without rehearsal;
distributed rehearsal (the *spacing effect*) flattens it
substantially. The spacing effect generalizes from human
memory to neural networks: spaced repetition of training
examples can outperform massed repetition.

## In LLM agents

Operationally, rehearsal in LLM agents takes several forms:

- **Conversation summary refresh** — periodically summarize
  conversation history and re-include the summary in the
  prompt, "rehearsing" the older context.
- **Tool-result re-ingestion** — when a tool returns a
  result, the agent may store it and reference it in
  subsequent turns, rehearsing it.
- **Reflection prompts** — the agent reviews its own
  reasoning, re-activating the relevant traces.

These are weak analogs of cognitive rehearsal. None modifies
the agent's parametric memory; all operate on external or
in-context substrate.

## Open questions

Whether *deliberate, agent-initiated* rehearsal is necessary
for capable long-running LLM agents is an open architectural
question. Some agent frameworks include explicit reflection /
rehearsal steps; others rely entirely on retrieval at need
without rehearsal.
