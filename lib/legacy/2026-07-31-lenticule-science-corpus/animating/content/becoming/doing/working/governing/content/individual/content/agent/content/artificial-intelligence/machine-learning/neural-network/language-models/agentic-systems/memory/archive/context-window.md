---
type: object
class: contemporary
status: active
depends-on: []
see-also:
  - teaching/explanations/context-as-memory.md
  - teaching/explanations/working-memory.md
  - ../theorems/context-window-limits.md
references:
  - references/dai-transformer-xl2019.md
---

# Context window

A **context window** is the fixed-size token buffer over which
an LLM's attention operates. It contains the system prompt,
prior conversation turns, retrieved documents, and the
current input — everything the model can directly attend to
in producing the next token.

## Sizes

Context window size has grown by orders of magnitude:

- Early transformers (GPT-2): $\sim 1{,}000$ tokens.
- GPT-3 era: $\sim 2{,}000$-$4{,}000$ tokens.
- 2023-era frontier models: $32{,}000$-$200{,}000$ tokens.
- Long-context models (2024+): $1{,}000{,}000$+ tokens.

The growth is enabled by architectural changes (flash
attention, sparse attention, ring attention) and infrastructure
investment.

## What's in the window

A typical context window for a deployed agent contains, in
order:

- System prompt: persona, tools, constraints.
- Tool definitions: available functions and their signatures.
- Conversation history: prior turns of the dialogue.
- Retrieved documents (if any).
- Current user query.
- Scratchpad / chain-of-thought (if any).

Each of these consumes tokens. The total must fit within the
window; eviction or summarization is required when it does
not.

## Properties

- **Bidirectional.** The model attends to all tokens in the
  window, in both directions, with full quadratic attention
  (or efficient approximations for long context).
- **Non-persistent.** When the conversation ends or the
  window overflows, the contents are gone. There is no
  consolidation to long-term storage.
- **Lossy at scale.** Beyond a context-length threshold,
  in-window retrieval degrades — items in the middle of long
  contexts are systematically less likely to be attended to
  than items at the start or end. See
  [context-window-limits](../theorems/context-window-limits.md).

## Cost

Context window operations dominate inference cost for LLM
agents:

- **Per-token compute.** For full attention, $O(n^2)$ in
  context length. For efficient attention, $O(n \log n)$ or
  $O(n)$ with constant factor depending on the algorithm.
- **Per-token memory.** KV-cache grows linearly with context
  length; this is often the binding constraint.
- **Per-call cost.** Most API providers charge per input
  token; long contexts cost proportionally more.

## Versus memory

The [context-as-memory](teaching/explanations/context-as-memory.md)
debate turns on whether the context window is *memory* in any
useful sense. The contemporary architectural consensus
treats it more like a *buffer* — a working space the agent
fills with retrieved memories from external stores, rather
than a memory itself. Persistent memory is supplied by
external stores (vector indexes, databases) the agent
queries through tool calls or RAG pipelines.
