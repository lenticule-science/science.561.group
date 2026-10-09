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
on model). Within this window, the model attends to all
tokens with full bidirectional access. From the agent's
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

- **No persistence across sessions.** When the conversation
  ends, the context is gone. There is no consolidation into
  long-term storage.
- **No automatic encoding.** The agent does not choose what
  to remember. Whatever falls in the context is "remembered";
  whatever falls out is gone.
- **Lossy at scale.** Beyond a certain context length,
  retrieval from within the window degrades — the
  "lost-in-the-middle" effect. See
  [context-window-limits](../../documents/articles/notes/undated/context-window-limits.md).
- **No procedural component.** Working memory in cognitive
  psychology includes manipulation; the LLM's context
  participates in computation only via attention.

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

Most production agent architectures have settled on the
second view, pairing models with explicit memory stores
(vector databases, knowledge bases, conversation history
logs) rather than relying on context length alone.

## Status

Open. The terminology has not standardized. The architectural
choice — context vs external memory — is increasingly being
made empirically rather than from cognitive-theoretic
principles. See
[what-is-memory-in-an-llm-agent](../../documents/articles/notes/undated/what-is-memory-in-an-llm-agent.md).
