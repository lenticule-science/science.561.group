---
type: concept
class: foundational
status: active
depends-on: []
see-also:
  - ontology.md
  - knowledge-graph.md
  - vector-knowledge.md
references:
  - references/brachman-levesque-kr2004.md
  - references/sowa-knowledge2000.md
title: Knowledge representation
description: Knowledge representation (KR) is the encoding of knowledge in forms suitable for machine storage, querying, and inference.
---

# Knowledge representation

**Knowledge representation** (KR) is the encoding of
knowledge in forms suitable for machine storage,
querying, and inference. The substrate question for
any AI system that uses knowledge.

## Two traditions

### Symbolic KR

- **Form.** Logical formulas, structured schemas,
  graphs of explicit entities and relations.
- **Examples.** Description logics, OWL ontologies,
  RDF triples, frames, semantic networks.
- **Strengths.** Precise semantics, sound inference,
  human-readable, explicit auditability.
- **Weaknesses.** Brittle to under-specification,
  expensive to construct, hard to scale, fails
  gracefully poorly.

### Subsymbolic KR

- **Form.** Distributed embeddings, neural network
  parameters, learned representations.
- **Examples.** Word embeddings, transformer
  parameters, KG embeddings.
- **Strengths.** Scale, noise tolerance, smooth
  generalization, learned from data.
- **Weaknesses.** Opaque, lack precise semantics,
  hard to update, hard to verify.

The two traditions have largely run on parallel
tracks; **neurosymbolic** approaches aim to combine
them.

## What KR provides

Across approaches, KR systems aim to support:

- **Storage.** Efficiently store domain knowledge.
- **Query.** Answer questions over stored knowledge.
- **Inference.** Derive new knowledge from existing.
- **Update.** Add, modify, retract knowledge.
- **Integration.** Combine knowledge from multiple
  sources.
- **Explanation.** Make derivations inspectable.

Different KR formalisms offer different
combinations of these capabilities.

## The KR formalisms

A non-exhaustive map:

- **Propositional logic.** Boolean facts; weak
  expressiveness.
- **First-order logic.** Quantifiers, predicates;
  expressive but undecidable in general.
- **Description logics.** Decidable fragments of
  FOL; the OWL family.
- **Frames / scripts.** Object-with-slots
  representation; precursor to OO and KGs.
- **Semantic networks.** Graphs with labeled edges;
  KG-precursor.
- **Knowledge graphs.** Modern semantic-network
  successor; web-scale; (entity, relation, entity)
  triples.
- **Conceptual graphs.** Sowa's graphical FOL.
- **Probabilistic KR.** Bayesian networks, Markov
  logic networks, ProbLog.
- **Neural KR.** Embeddings, transformer parameters.

Each has its niche.

## Operational concerns

Beyond formalisms, real KR systems face:

- **Scale.** Web-scale data demands compromises in
  expressiveness and inference completeness.
- **Update / dynamics.** Knowledge changes; updating
  is harder than creating.
- **Source integration.** Different ontologies,
  different schemas, conflicting facts.
- **Quality.** Noise, errors, biases in source data
  propagate.
- **Provenance.** Where did this fact come from? How
  certain is it?

Production KR systems devote substantial effort to
these meta-problems beyond the core representation.

## In contemporary AI

- **Knowledge graphs.** Google KG, Wikidata,
  DBpedia, enterprise KGs. Web-scale symbolic KR
  with industrial impact.
- **KG embeddings.** Bridge symbolic structure to
  continuous space for ML downstream.
- **Foundation models as implicit KBs.** LLMs encode
  enormous amounts of factual knowledge in
  parameters.
- **Retrieval-augmented generation.** Combine
  parametric knowledge with retrieved structured
  data.
- **Neurosymbolic systems.** Active research on
  hybrids.

## Limits

- **Symbolic.** Hard to scale and maintain;
  brittle.
- **Subsymbolic.** Opaque; updating-without-
  retraining hard; verification difficult.
- **Hybrid.** Engineering complexity; theoretical
  understanding incomplete.
- **Universal-KR illusion.** No single representation
  is right for all uses.

## Status

Foundational and pluralist. Different applications use
different formalisms. Active research on
neurosymbolic integration and on understanding
foundation-model implicit knowledge.
