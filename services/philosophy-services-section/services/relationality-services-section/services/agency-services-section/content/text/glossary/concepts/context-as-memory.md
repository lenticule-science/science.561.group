---
type: concept
class: contemporary
status: active
depends-on:
  - working-memory.md
see-also:
  - ../objects/context-window.md
  - ../theorems/context-window-limits.md
  - teaching/explanations/why-context-is-not-memory.md
references:
  - references/dai-transformer-xl2019.md
title: Context as memory
description: Context as memory is the contested claim that an LLM's in-context window constitutes a memory system in some cognitively or computationally meaningful sense.
---

# Context as memory

**Context as memory** is the contested claim that an LLM's
in-context window constitutes a memory system in some
cognitively or computationally meaningful sense.

## The claim

A modern LLM has a context window of $n$ tokens (currently
$n$ ranges from $\sim 4{,}000$ to several million depending
on model). In a decoder-only autoregressive LLM, each generated token may attend to preceding permitted positions under a causal mask, **not future positions**. Some other model architectures use bidirectional attention. The presence of text in the context window does **not** guarantee faithful attention, retrieval, or correct application. From the agent's
perspective, the context window contains:

- The system prompt.
- The conversation history.
- Retrieved documents (if any).
- The current input.
- Intermediate computations (if scratchpad / chain-of-thought
  is used).

Proponents claim this is "the agent's memory" — items in the
window are accessible to the agent, items outside are not.

## Why the claim is contested

The context window differs from cognitive working memory and
from classical computational memory in several ways:

- **No automatic durability from inclusion.** A single inference context is temporary. A product may retain conversation histories, write an external memory, or retrieve them later; that durability is a **separate storage and authorization action**, not a consequence of the context tokens having been presented.
- **No automatic equivalence of exposure and memory.** Context inclusion supplies a possible information source, not a guaranteed memory, endorsed proposition, or future recall. Runtime designs can select, write, reject, or retrieve durable memories; each action must be observed and attributed.
- **Lossy at scale.** Beyond a certain context length,
  retrieval from within the window degrades — the
  "lost-in-the-middle" effect. See
  [context-window-limits](../../documents/articles/notes/undated/context-window-limits.md).
- **Distinct cognitive/computational meanings.** Cognitive working memory, transformer context, external episodic stores, and fine-tuned weights are different mechanisms. An LLM uses learned computations as well as attention; the paper must not define all computation as attention or assume a human memory model.

## The compromise position

A common view: the context window is *something*, but neither
working memory nor long-term memory in the cognitive sense.
It is closer to a *scratchpad* — a passive substrate the
agent's computation reads from and writes to via the
generation process. Naming it differently (the "potential
buffer," the "in-context state") avoids importing cognitive
intuitions that mislead.

## Why this matters

The terminology shapes architectural decisions:

- If the context is "memory," then long-context models are
  memory-augmented agents.
- If the context is *not* memory but a buffer, then
  long-context models are agents with a larger buffer; they
  still need a separate memory system for persistent storage.

A concrete agent system may pair inference context with external stores such as databases, knowledge bases or retained conversation histories. Whether an individual installation actually writes, indexes, and retrieves these is an empirical architectural question; a general industry-consensus claim cannot substitute for its source.

## Status

Open. The terminology has not standardized. The architectural
choice — context vs external memory — is increasingly being
made empirically rather than from cognitive-theoretic
principles. See
[what-is-memory-in-an-llm-agent](../../documents/articles/notes/undated/what-is-memory-in-an-llm-agent.md).
