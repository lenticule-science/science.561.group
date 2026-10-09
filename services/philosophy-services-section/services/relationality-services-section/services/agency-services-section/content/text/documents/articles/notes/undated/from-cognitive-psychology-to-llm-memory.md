---
type: narrative
status: active
see-also:
  - ../teaching/explanations/episodic-memory.md
  - ../teaching/explanations/semantic-memory.md
  - ../teaching/explanations/retrieval-augmented-generation.md
title: From cognitive psychology to LLM memory
description: The contemporary picture of AI agent memory was assembled piecewise over half a century, drawing on cognitive psychology, neuroscience, classical AI, and contemporary deep learning.
---

# From cognitive psychology to LLM memory

The contemporary picture of AI agent memory was assembled
piecewise over half a century, drawing on cognitive
psychology, neuroscience, classical AI, and contemporary deep
learning. The arc passes through several distinct framings.

## Atkinson-Shiffrin (1968): the multi-store model

The first widely-adopted decomposition: memory is a pipeline
of *sensory register* (very brief, modality-specific) →
*short-term store* (seconds, limited capacity) → *long-term
store* (durable, large capacity), with attention gating the
first transition and rehearsal gating the second. The model
gave cognitive psychology a structural vocabulary that AI
later inherited.

## Tulving (1972): episodic vs semantic

Tulving's separation of *episodic* memory (specific events
with spatiotemporal context) from *semantic* memory (general
facts decoupled from acquisition) was the second major move.
It gave the field a typological vocabulary: not all memories
are alike; they differ in what they store, how they decay, and
how they are retrieved. The episodic/semantic distinction
shapes contemporary AI debates about whether LLMs have
episodic memory at all (see
[do-llms-have-episodic-memory](do-llms-have-episodic-memory.md)).

## Baddeley & Hitch (1974): working memory

Baddeley and Hitch refined the short-term store into *working
memory* — an active manipulation system, not a passive holding
buffer. The decomposition into phonological loop,
visuospatial sketchpad, and central executive identified
*working memory as substrate for cognition*, not just
recall. Contemporary LLM agent designers borrow the framing
when describing the in-context window as the agent's
"working memory" — though the analogy is imperfect (see
[context-as-memory](../../../../glossary/concepts/context-as-memory.md)).

## McClelland-McNaughton-O'Reilly (1995): consolidation

The complementary-learning-systems account: hippocampus does
fast episodic encoding, neocortex does slow semantic
integration, and *consolidation* (replay during quiet wake
and sleep) is the bridge. The framework solved the
stability-plasticity dilemma in a biologically grounded way
and was directly imported into deep RL as
*experience replay*.

## Classical AI: knowledge bases and case-based reasoning

In parallel, classical AI built memory architectures from a
symbolic-logic substrate: knowledge bases storing
$(\text{subject}, \text{predicate}, \text{object})$ triples
with logical inference engines, case-based reasoning systems
storing past problem-solution pairs, semantic networks,
frames. These systems implemented semantic memory well but
struggled with the unstructured perceptual input that
biological agents handle effortlessly.

## Memory networks (2014) and neural turing machines (2014)

The first fully-differentiable memory architectures: neural
networks paired with read/write heads operating on external
memory matrices. Weston et al.'s *Memory Networks* and
Graves et al.'s *Neural Turing Machine* showed that
end-to-end training over external memory was possible. They
were superseded by transformers but established the design
pattern.

## Transformers and attention (2017)

The transformer's self-attention turns out to be a *content-
addressed memory* over the input sequence. Reading from
position $i$ involves matching $i$'s query against all
positions' keys and weight-averaging their values. Each
forward pass is a memory operation. This is why
[context-as-memory](../../../../glossary/concepts/context-as-memory.md)
became plausible: the architecture *uses* its inputs as
memory.

## RAG (2020) and the externalization of knowledge

Lewis et al.'s *Retrieval-Augmented Generation* connected
LLMs to embedding-indexed vector stores, enabling
*knowledge updatable without retraining*. RETRO (Borgeaud
et al. 2022) deepened the integration. The *RAG revolution*
(see [the-rag-revolution](the-rag-revolution.md)) reshaped
production AI: most deployed LLM agents now use RAG for
factual recall, leaving the LLM weights for procedural
skill rather than fact storage.

## Where this leaves us

Contemporary LLM agents have:

- **Procedural knowledge** in weights (semantic memory of
  *how*).
- **Some semantic knowledge** in weights, increasingly
  externalized to RAG.
- **Working memory** in the context window, with
  documented limits.
- **No native episodic memory** — episodic recall, when
  needed, is implemented externally (conversation logs in
  vector stores).
- **No native consolidation** — long-term updates require
  fine-tuning, a separate slow process.

The gap from the cognitive picture is the absence of
consolidation and native episodic memory. Closing that gap
is the open architectural problem of the next decade. See
[what-is-memory-in-an-llm-agent](what-is-memory-in-an-llm-agent.md).
