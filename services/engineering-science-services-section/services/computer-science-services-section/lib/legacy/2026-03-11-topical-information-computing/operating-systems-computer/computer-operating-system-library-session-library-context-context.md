---
name: context
description: A structured piece of information injected into a session so that subsequent generation can use precise vocabulary instead of stretching for a vague word. A context bundles a source (where it comes from), a body (the information itself), and a trigger (what called for its injection).
injecting: context
naming: context
sourcing: context
---

Entity record for context.
A context is a unit of information made available to a session to ground generation.
Each context has three load-bearing fields: a *source* (the path or origin of the information), a *body* (the bytes injected), and a *trigger* (what condition fired the injection — a watchlist hit, a tool call, a SessionStart event, an explicit request).
The data shape is fixed at [the JSON schema](context.schema.json); the EAVT log of contexts emitted at this position is at [context.jsonl](context.jsonl).

Sub-structures specialize context by trigger kind, by body kind, or by source kind.
Each specialization carries its own entry under [the library subtree](library/).
