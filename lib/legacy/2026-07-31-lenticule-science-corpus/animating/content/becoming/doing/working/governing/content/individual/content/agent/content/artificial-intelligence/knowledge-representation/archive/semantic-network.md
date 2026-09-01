---
type: concept
class: classical
status: active
depends-on:
  - knowledge-representation.md
see-also:
  - knowledge-graph.md
references:
  - references/sowa-knowledge2000.md
  - references/brachman-levesque-kr2004.md
---

# Semantic network

A **semantic network** is a graphical knowledge
representation: nodes denote concepts, labeled edges
denote relations between them. The classical KR
formalism that prefigured modern knowledge graphs.

## Origins

Quillian (1968) introduced semantic networks as a
model of human memory. Subsequent developments:

- Collins-Quillian semantic memory (1969).
- Frame-based representations (Minsky 1975).
- Conceptual graphs (Sowa 1976+).
- KL-ONE family (Brachman 1979).

These shaped both AI knowledge representation and
cognitive psychology.

## Structure

The basic structure:

- **Nodes.** Concepts (Bird, Robin, Animal).
- **Labeled edges.** Relations (is-a, has-part,
  color).
- **Graph traversal.** Inference by traversing
  paths.

Beyond the basic form:

- **Inheritance.** Properties propagate down is-a
  hierarchies.
- **Default reasoning.** Inheritance with
  exceptions (penguins are birds but don't fly).
- **Multiple inheritance.** Concepts inherit from
  multiple parents.
- **Slots and fillers.** Frame-style attributes.

These extensions make semantic networks expressive
but also raise inference issues.

## The "is-a" issue

The most basic relation in semantic networks — *is-a*
— is famously ambiguous:

- **Subclass:** "Robin is-a Bird" (set inclusion).
- **Instance:** "Tweety is-a Bird" (set membership).
- **Predication:** "John is-a teacher" (role).
- **Type assignment:** various other senses.

Brachman (1983) "What IS-A is and isn't" catalogued
the confusions and motivated description-logic
disambiguation.

## Description logic descendents

Semantic networks formalized became *description
logics*:

- KL-ONE → CLASSIC → description logic family.
- Provides precise semantics for the informal
  semantic-network notation.
- Enables sound inference with decidable
  complexity.

DLs trade some semantic-network flexibility for
formal rigor.

## Modern descendents

The semantic-network tradition continues:

- **Knowledge graphs.** Direct successors at scale.
- **RDF / SPARQL.** Triple-based representation.
- **OWL ontologies.** Semantic-network ideas with
  description-logic semantics.
- **Conceptual graphs.** Sowa's tradition,
  continuing.

## Why they matter

- **Intuitive.** Human-readable graph structure.
- **Compositional.** Relations build up complex
  knowledge from simple links.
- **Bridge to KGs.** Conceptually continuous with
  modern KGs.
- **Cognitive models.** Influence in
  cognitive-science models of memory.

## In contemporary AI

- **Knowledge graphs** are the modern descendant.
- **Embedding methods** for semantic networks
  produce vector representations.
- **Question answering** over semantic networks
  remains an active research area.

## Limits

- **Ambiguous semantics** in classical form.
- **Inference can be intractable** in expressive
  variants.
- **Doesn't scale** without KG-style engineering.

## Status

Classical formalism whose ideas continue in modern
KGs and ontologies. Mostly studied as historical
foundation; live work uses KGs and DLs.
