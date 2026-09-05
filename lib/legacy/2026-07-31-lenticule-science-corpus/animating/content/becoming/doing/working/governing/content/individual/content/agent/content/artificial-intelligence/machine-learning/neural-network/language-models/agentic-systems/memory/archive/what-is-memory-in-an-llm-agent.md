---
type: question
status: open
see-also:
  - teaching/explanations/context-as-memory.md
  - teaching/explanations/retrieval-augmented-generation.md
  - teaching/explanations/why-context-is-not-memory.md
---

# What is memory in an LLM agent?

## The question

The word "memory" in LLM-agent contexts is overloaded. It can
refer to:

- The model's parametric weights (long-term storage of
  procedural and semantic knowledge).
- The in-context window (working buffer of current
  computation).
- The KV-cache (short-term computational substrate during
  generation).
- The conversation history buffer (recent turns held for
  inclusion in the prompt).
- The vector store (external semantic memory for RAG).
- The structured-data store (databases, knowledge graphs).
- Tool-call results stored across turns.

Are these all "memory"? Some of them? Should the field
adopt a unified terminology, and if so what?

## Why this matters

Architectural decisions follow terminology:

- If "memory" is the context window, designers focus on
  growing context length.
- If "memory" is the vector store, designers focus on
  retrieval quality.
- If "memory" includes parametric weights, the discussion
  encompasses fine-tuning and continual learning.
- If "memory" is everything that persists, the discussion
  expands to include all session-state management.

Different sub-communities (research labs, framework authors,
production engineers, cognitive-AI theorists) use the term
differently. Cross-conversation confusion is common.

## Candidate framings

- **Functional.** "Memory" is whatever serves the role of
  storing-and-later-retrieving information. By this
  criterion, all the components above qualify, and the
  answer is "all of them, by different mechanisms."
- **Mechanism.** "Memory" is reserved for substrates whose
  primary purpose is storage rather than computation. Weights
  qualify (semantic memory by parameterization); context
  does not (it's working substrate).
- **Cognitive.** "Memory" requires functional analogs to
  episodic / semantic / procedural / working memory in the
  cognitive-psychology sense. Context window approximates
  working memory; vector store approximates semantic memory;
  episodic memory has no native analog.
- **Engineering.** "Memory" is whatever is *not* the model
  weights and *not* the in-flight inference state. Context,
  buffers, vector stores, databases — all "memory."

The terminology has not converged.

## Why the question is hard

LLM agents differ from biological agents in ways that
disrupt the cognitive vocabulary:

- The same parametric substrate stores procedural skill and
  semantic facts, contra the cognitive separation.
- Context window has no cognitive analog (closest is working
  memory, but with different cost structure and persistence).
- Updates to long-term storage require expensive batch
  operations (fine-tuning), unlike the continuous
  consolidation of biological memory.
- The architecture is *compositional* — multiple substrates
  with explicit transfers between them, designed by
  engineers — in a way biological memory is not.

Importing cognitive vocabulary wholesale obscures these
differences. Adopting an entirely engineering vocabulary
loses the explanatory power of the cognitive picture.

## Status

Open. Production practice is converging on engineering
vocabulary (context, retrieval, store, buffer); research
literature retains cognitive vocabulary; cognitive-science
crossover work negotiates between them. The field has not
settled.
