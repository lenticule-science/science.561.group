---
name: inferring
description: "The morphism that consumes a query and produces an inference by dispatching the query across adapter-and-model pairs. Used by the dispatching family of skills (dispatching-work, dispatching-an-inquiry, dispatching-logical-inference, dispatching-to-a-logical-inference-model). Emits a dispatch-witness row per dispatch hop."
specializing: working
agent-noun: inferer
gerund: inferring
imperative: infer
originating: query
terminating: inference
---

An **inferring** transformer takes a query and produces an inference by selecting an adapter and a model and dispatching the query across the pair.
Each dispatch hop emits a dispatch-witness row recording the chosen receiver, the outcome, the attempts made, and any error returned.

Helper modules supporting the dispatching skills live at this directory:

- [the witness writer](_witness.mjs) — appends a dispatch-witness row at [the inferring cell log](inferring.jsonl) per dispatch hop.
  Imported by every dispatching-* script.
- [the rank-candidates helper](_rank-candidates.mjs) — adapter-and-model candidate ranking used by the dispatching skills.
- [the adapters subdir](adapters/) — wire-format adapters per receiver kind.
- [the models subdir](models/) — model records.

Dispatching is a separate concern from logging-a-turn.
A turn is one user-assistant exchange; a dispatch is one hop in the inference pipeline.
The two carry different schemas and accumulate at different jsonl paths.
