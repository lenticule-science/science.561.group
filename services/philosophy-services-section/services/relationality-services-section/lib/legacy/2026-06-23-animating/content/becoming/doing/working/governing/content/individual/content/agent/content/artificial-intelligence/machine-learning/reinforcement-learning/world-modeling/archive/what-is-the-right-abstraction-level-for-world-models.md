---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/latent-world-model.md
  - ../objects/latent-state-space.md
see-also:
  - teaching/explanations/world-models-vs-simulators.md
references:
  - references/lecun-jepa2022.md
---

# What is the right abstraction level for world models?

## The question

At what level of abstraction should a world model represent the
environment? Pixels and raw signals? Object-level
representations (entities, properties, relations)? Concept-level
representations (cup, on-table, agent-intent)? Linguistic
representations? Mathematical/causal abstractions?

## Why it is open

Each level has tradeoffs:

**Raw signal level (pixels, audio, sensor readings).** The
model has access to all available information and is not biased
by an a priori abstraction. But the dimensionality is enormous;
prediction is dominated by irrelevant detail; transfer across
domains is poor. Pixel-prediction world models (early Dreamer)
spend most of their capacity on visual-detail reconstruction
that doesn't matter for planning.

**Latent (learned) level.** A learned compression of raw signal
into a representation chosen by the training objective.
Capacity-efficient and specialized to the data; but the
representation is not identifiable
([latent-world-model-identifiability](../theorems/latent-world-model-identifiability.md)),
not interpretable, and doesn't transfer across data sources.

**Object-level.** Decompose the world into entities with
properties and relations (object-centric representations).
Aligns with natural inductive biases (compositionality, object
permanence, locality). But requires either explicit object
detection upstream or self-supervised object discovery, both of
which are open problems.

**Concept-level / symbolic.** Represent the world in terms of
high-level abstractions (cup, table, on, holding). Transfer-
friendly and compositional. But the symbols don't ground in
sensor data without an interface layer; classical symbolic AI
foundered on this.

**Linguistic / LLM-style.** Represent the world the way text
describes it. Massive prior exists from web data. But suffers
the [llm-world-model-incoherence](../theorems/llm-world-model-incoherence.md)
problem: linguistic descriptions are not faithful enough to
underlying dynamics for reliable forward simulation.

**Mathematical / causal.** Represent the world as a causal
graph or differential equations. Maximally compositional,
maximally transferable, but requires the structural form to be
known and rarely available for novel domains.

## What would resolve it

The question may not have a single answer. The right level
likely depends on the task:

- *Manipulation control:* Object-level or latent-level pixel
  representations.
- *Long-horizon planning:* Concept-level or symbolic.
- *Causal reasoning:* Mathematical / causal.
- *Communication and high-level reasoning:* Linguistic.

Resolving the question may mean characterizing **which abstraction
level matches which task**, and developing architectures that
maintain *multiple* levels simultaneously, with translation
between them. Hierarchical world models (latent dynamics within
object-level dynamics within concept-level dynamics) are an
active area of research.

## Why it matters

The choice of abstraction level constrains what an agent can
plan over, what transfers between tasks, what is interpretable,
and what is data-efficient to learn. Getting it wrong is
expensive: pixel-level world models that under-perform
object-level ones; symbolic models that can't perceive; LLM
representations that can't simulate physics. Getting it right
is the central architectural question for any world-model-based
agent.
