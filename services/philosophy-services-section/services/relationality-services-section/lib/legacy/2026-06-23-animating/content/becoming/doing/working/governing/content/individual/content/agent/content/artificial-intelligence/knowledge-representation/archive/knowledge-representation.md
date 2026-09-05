---
title: "Knowledge representation"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: >
  The study of how knowledge is encoded for machine
  use: ontologies, knowledge graphs, description
  logics, semantic networks, frames, neurosymbolic
  hybrids, and (recently) implicit knowledge in
  foundation-model parameters. Spans symbolic
  approaches (formal logic, structured schemas) and
  subsymbolic ones (embeddings, neural representations),
  with neurosymbolic systems aiming to integrate.
position: >
  Sibling under
  [artificial-intelligence/theories](../_index.md). The
  representational substrate question for AI: how is
  knowledge stored, queried, updated, integrated.
  Adjacent to [reasoning](../reasoning/_index.md)
  (which uses knowledge), and to
  [memory](../memory/_index.md) (which is the agent-
  scale instance of knowledge storage). Closely linked
  to [causal-reasoning](../causal-reasoning/_index.md)
  through structured causal models as a kind of KR.
---

The knowledge-representation theory addresses how AI
systems encode the information they need:

**Symbolic representations.** Formal logic
(description logics, OWL), structured schemas
(ontologies, taxonomies), graphs (knowledge graphs,
RDF). Strong semantics; precise inference;
maintainable. Hard to scale; brittle to
under-specification.

**Subsymbolic representations.** Distributed embeddings,
neural-network parameters, learned representations.
Scale well; tolerate noise; interpolate. Lack precise
semantics; opaque; hard to update.

**Neurosymbolic hybrids.** Combine symbolic structure
with subsymbolic learning. Active research; mature
applications mixed.

**Knowledge graphs at scale.** Web-scale KGs (Google
KG, Wikidata, DBpedia) demonstrate symbolic
representation working at massive scale via heavy
engineering.

**Foundation models as knowledge bases.** Recent
question: do LLMs *implicitly* contain large knowledge
bases in their parameters? If so, what kind?

**Updating, integration, alignment.** Cross-cutting
operational concerns: how to add new knowledge,
integrate sources, align ontologies.
