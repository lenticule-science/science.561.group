---
type: question
class: theory-internal
status: open
depends-on:
  - ../morphisms/graph-homomorphism.md
  - ../objects/directed-graph.md
see-also:
  - ../../../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/objects/relation-graph.md
---

# Typed graph homomorphism — what is the right formalisation?

## Statement

The corpus's own relation graph is a *typed multi-graph*: each edge has a relation type drawn from the discipline's finite alphabet (`depends-on`, `see-also`, `realizes`, `instantiates`, `defines`, etc.). What is the right notion of *typed graph homomorphism* — a structure-preserving map between typed multi-graphs that respects edge typing?

## Why it matters

The discipline's validation rules include several *edge-typing* rules (e.g., "`realizes` runs from `definition` to `concept`"). A typed-graph-homomorphism formalisation would let the discipline state these rules as constraints on a homomorphism into a *type-graph* — a small fixed graph whose vertices are note types and whose typed edges are the admissible edge-type / source-type / target-type triples. The discipline's edge-typing rules would become a single statement: every relation graph admits a homomorphism into the type graph.

This would also clarify the relationship between [predication-categories](../../../../../science/theories/information/theories/knowledge-systems/theories/predication-categories/) and the typed-multi-graph framing: the predication graph would become a *typed* graph in this sense, with the bilattice valuation an additional enrichment.

## What would count as an acceptable answer

A formal definition of typed multi-graph and typed homomorphism, with the following properties verified:

1. The category of typed multi-graphs and typed homomorphisms is closed under standard constructions (products, coproducts, equalizers, coequalizers — at least the ones that exist in the untyped setting).
2. The forgetful functor to the category of multi-graphs is well-behaved (faithful; admits a left or right adjoint corresponding to "trivial typing" / "discrete typing").
3. The discipline's edge-typing rules are exactly the homomorphism-into-type-graph constraints.

## Bounds

- The answer should not commit to a specific category-theoretic framework beyond what the corpus's own [categories](../../categories/) theory carries. If the corpus has not yet developed the relevant adjoint-functor machinery, the answer can use a more elementary set-theoretic formulation.
- The answer should *not* require collapsing the bilattice valuation into the typed-edge structure. The valuation is an additional layer; the typed-edge formalisation is the substrate it sits on.
