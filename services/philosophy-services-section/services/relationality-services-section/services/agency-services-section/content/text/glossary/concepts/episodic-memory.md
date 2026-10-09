---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - semantic-memory.md
  - memory-consolidation.md
  - ../objects/memory-trace.md
  - questions/do-llms-have-episodic-memory.md
references:
  - references/tulving1972.md
title: Episodic memory
description: "Episodic memory is memory of specific events tagged with spatiotemporal context: what happened, when, where, with whom."
---

# Episodic memory

**Episodic memory** is memory of *specific events* tagged with
spatiotemporal context: what happened, when, where, with whom.
The term is due to Tulving (1972), who introduced it in
contrast to *semantic* memory (general facts decoupled from
context).

## What makes a memory episodic

An episodic memory has three structural features:

- **Specificity.** It refers to a particular event, not a
  generic class. "I had coffee at 9am yesterday" is episodic;
  "coffee is a beverage" is semantic.
- **Spatiotemporal indexing.** The memory is tied to a "when
  and where" of the original event. The temporal index is
  what allows the agent to order memories and answer
  "before/after" queries.
- **Autonoetic accompaniment.** In humans, episodic recall is
  accompanied by a sense of *re-experiencing* the original
  event — a phenomenology classical AI memory architectures
  do not attempt to model and contemporary LLM agents do not
  exhibit.

## Encoding and retrieval

Episodic memories are *encoded* at the time of the original
event, with the encoding shaped by attention, salience, and
emotional valence. They are *retrieved* via partial-match
queries (a smell triggers recall of a meal; seeing a face
triggers recall of a conversation). Both processes are lossy
and reconstructive: the retrieved memory is rebuilt from
fragments, not replayed verbatim.

## Computational analogs

In AI systems:

- **Case-based reasoning** stores past problem-solution pairs
  and retrieves the most similar case for a new problem. The
  case is the episodic record.
- **Experience replay** in [reinforcement-learning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/reinforcement-learning/_index.md)
  stores transition tuples $(s, a, r, s')$ and replays them
  for off-policy learning. Each tuple is an episodic trace.
- **Vector memory stores** in LLM agents store embeddings of
  past interactions, retrievable by similarity to a current
  query. See [retrieval-augmented-generation](retrieval-augmented-generation.md).

## In LLM agents

Whether LLM agents have episodic memory in the cognitive sense
is contested. The standard architecture provides:

- **Within-context** access to all tokens in the current
  context window (which contain the current "episode").
- **Across-context** access only via external memory stores
  (RAG, tool-call logs).
- **No automatic encoding** of past interactions into
  long-term memory; this requires explicit scaffolding.

See [do-llms-have-episodic-memory](../../documents/articles/notes/undated/do-llms-have-episodic-memory.md).

## Limits

Episodic memory has well-known limits:

- **Decay** — memories degrade with time absent rehearsal.
- **Interference** — similar memories blur into each other.
- **Reconstructive errors** — retrieval may fill in plausible
  but false details.

These limits motivate the cognitive distinction from semantic
memory (which is more robust because re-encoded across many
episodes) and from procedural memory (which is more robust
because expressed as capability rather than retrievable trace).
