---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - context-as-memory.md
  - ../objects/memory-buffer.md
  - ../objects/context-window.md
references:
  - references/baddeley-hitch1974.md
title: Working memory
description: Working memory is the limited-capacity potential store in which a cognitive system manipulates information for the current task.
---

# Working memory

**Working memory** is the limited-capacity potential store in
which a cognitive system manipulates information for the
current task. The term is due to Baddeley & Hitch (1974), who
proposed a multi-component model: a phonological loop, a
visuospatial sketchpad, and a central executive coordinating
them. Later additions include the episodic buffer.

## Distinguishing features

- **Active.** Working memory holds information *currently in
  use* by ongoing computation, not stored away for later.
- **Limited capacity.** The classical estimate is "seven plus
  or minus two" chunks (Miller 1956); more recent estimates
  put the limit lower (3-4 chunks for novel content).
- **Volatile.** Contents decay quickly without rehearsal;
  interrupting attention causes loss.
- **Manipulable.** Unlike short-term storage that just holds,
  working memory permits operations on its contents:
  comparison, transformation, combination.

## Computational analogs

In AI systems, working memory has analogs at several levels:

- **CPU registers and L1 cache** are the lowest-level
  computational analog: small, fast, manipulated by the
  current operation.
- **The activation state** of a recurrent neural network
  during a single forward pass.
- **The KV-cache** of an LLM during generation — recent tokens
  are immediately accessible to attention; older tokens fall
  out of cache.
- **The [context-window](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/objects/context-window.md)** of an
  LLM as a whole. This is the analogy the
  [context-as-memory](context-as-memory.md) literature
  pursues, with caveats.

## Working vs short-term

The cognitive-psychology literature distinguishes working
memory from *short-term memory*: short-term is passive
holding; working is active manipulation. In AI the analogous
distinction is between *cache* (passive holding) and the
*currently-being-attended-to portion of cache* (active).

## In LLM agents

LLM agents' working-memory analog is the in-context state
plus the activation state during generation. This permits
manipulation of items currently in attention but is bounded
by the context window's capacity. Beyond that bound, items
fall out of working memory and must be re-introduced via
external retrieval. See
[context-window-limits](../../documents/articles/notes/undated/context-window-limits.md).

## Limits

Working memory's capacity bound is a load-bearing constraint
on cognition: tasks requiring more simultaneous items than
working memory can hold must be decomposed via external
storage (notebooks, scratch space) or via chunking. The
analog in LLM agents is the use of [scratchpad](inference-time-search.md)
prompting, intermediate result storage, and tool-mediated
memory extension.
