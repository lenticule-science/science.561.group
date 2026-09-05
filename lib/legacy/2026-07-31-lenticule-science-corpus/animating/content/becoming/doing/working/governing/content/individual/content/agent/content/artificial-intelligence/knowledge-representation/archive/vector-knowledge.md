---
type: concept
class: contemporary
status: active
depends-on:
  - knowledge-representation.md
see-also:
  - ../objects/knowledge-graph-embedding.md
  - neurosymbolic.md
references:
  - references/petroni-langmodelskbs2019.md
  - references/ji-survey-kg2021.md
---

# Vector knowledge

**Vector knowledge** is knowledge encoded as vectors
in continuous spaces — embeddings of words, entities,
relations, sentences, or whole documents. The
subsymbolic counterpart to graph- and logic-based KR.

## The shift

Traditional KR represents knowledge symbolically:
- "Paris is the capital of France" as
  $\text{capital}(\text{Paris}, \text{France})$.

Vector KR represents the same knowledge as relations
between continuous vectors:
- $\text{Paris}$, $\text{France}$, $\text{capital}$
  as embeddings.
- Knowledge encoded *implicitly* in the geometry of
  the embedding space.

This shift mirrors NN representation learning more
broadly: from explicit symbols to learned
distributed representations.

## Forms of vector knowledge

### Word embeddings

Word2vec, GloVe, fastText: words mapped to vectors
where geometric relations encode semantic relations
(king - man + woman ≈ queen).

### Entity embeddings

Knowledge-graph entities mapped to vectors enabling:
- Similarity computation.
- Algebraic completion (TransE: $h + r \approx t$).
- Downstream feature use.

### Sentence / passage embeddings

Sentence-BERT and successors: full sentences mapped
to vectors for similarity, retrieval, and
classification.

### Foundation-model parameters as KB

Per Petroni et al. 2019: pre-trained language models
contain substantial factual knowledge in their
parameters, queryable via prompting. The parameters
*are* the knowledge representation.

### Multimodal embeddings

CLIP and successors: images and text in a shared
vector space.

## What vector knowledge supports

- **Similarity / retrieval.** Find related items by
  vector distance.
- **Algebraic operations.** Vector arithmetic on
  meanings.
- **Smooth interpolation.** Operations have
  continuous semantics.
- **Generalization.** Patterns extend smoothly to
  novel inputs.
- **Multi-modal integration.** Different modalities
  in shared spaces.
- **Scale.** Methods scale to billions of items.

## What it doesn't support (well)

- **Precise inference.** Vectors don't have crisp
  semantic boundaries.
- **Verification.** Hard to check what a vector
  encodes.
- **Targeted update.** Updating one fact may affect
  unrelated regions.
- **Auditability.** Hard to inspect what's stored.
- **Structured query.** SPARQL-style queries don't
  apply.

## The retrieval-augmented turn

A practical pattern emerging:

- Use vector embeddings for *retrieval* (find
  candidate facts).
- Use symbolic / textual representation for
  *reasoning* (generate, verify).
- Combination: dense retrieval + LLM generation
  (RAG).

This pattern hedges between the strengths of vector
and symbolic forms.

## In contemporary AI

- **Search.** Dense retrieval has displaced
  keyword search in many applications.
- **RAG.** Standard pattern for grounding LLMs.
- **Recommendation.** Vector similarity for
  recommendation.
- **Code search.** Embedding-based code retrieval.
- **Multimodal search.** CLIP-style cross-modal
  retrieval.

## Critiques

- **Conflation.** Vectors blur distinct
  knowledge categories.
- **Hallucination risk.** Vector retrieval +
  generation can produce false content.
- **Update difficulty.** Large embedding spaces are
  hard to keep current.
- **Lack of structure.** Without symbolic structure,
  composing knowledge is fragile.

## Status

Vector knowledge is now the dominant form for
deployed AI systems. Symbolic KR continues in
specific niches (formal verification, regulated
domains, structured query). Active research on
combining the two for stronger systems.
