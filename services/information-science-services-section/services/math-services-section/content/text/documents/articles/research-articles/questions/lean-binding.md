---
type: question
class: external
status: open
explores: [graph, directed-graph, dag, tree, dependency-soundness-iff-dag]
depends-on: [graph, directed-graph, dag]
title: Lean binding
description: How should this directory's typed notes bind to mathlib's Mathlib.Combinatorics.SimpleGraph and Mathlib.Combinatorics.Quiver?
---

# Lean binding

How should this directory's typed notes bind to mathlib's `Mathlib.Combinatorics.SimpleGraph` and `Mathlib.Combinatorics.Quiver`? Mathlib has live, well-developed coverage of finite graph theory, and the corpus's discipline includes a `lean:` frontmatter field on objects, morphisms, and theorems for exactly this kind of binding. None of this directory's notes currently carry a `lean:` field. The question is which to add and in what order.

## Decomposition

- **Sub-question A.** Which mathlib namespace matches each object? `SimpleGraph` covers [graph](../../../../glossary/terms/graph.md), [simple-graph](../../../../glossary/terms/simple-graph.md), [bipartite-graph](../../../../glossary/terms/bipartite-graph.md), [complete-graph](../../../../glossary/terms/complete-graph.md), and most of the undirected machinery. `Quiver` covers [quiver](../../../../glossary/terms/quiver.md) and [directed-graph](../../../../glossary/terms/directed-graph.md) (with an injective source-target map). `SimpleGraph.Connected`, `SimpleGraph.Path`, `SimpleGraph.Subgraph` cover the relevant concepts. There is no settled mathlib treatment of multigraphs or weighted graphs — those would require corpus-side authoring.
- **Sub-question B.** Which theorems can mathlib prove for us? Mathlib has the [handshake-lemma](../handshake-lemma.md) (`SimpleGraph.sum_degrees_eq_twice_card_edges`), [tree-equivalences](../tree-equivalences.md) (`SimpleGraph.IsTree.iff_existsUnique_path` and friends), and at least sketches of the bipartite characterization. The [dependency-soundness-iff-dag](../dependency-soundness-iff-dag.md) theorem and the [dag-topological-sort](../dag-topological-sort.md) construction are not in mathlib in this exact form, though they can be assembled from `Quiver.Path` and finite-set machinery.
- **Sub-question C.** Should this directory open a `lean/` subdirectory with concrete `.lean` files, or should the binding be by `lean:` frontmatter pointer to a separate Lean project? The corpus convention (per predication-categories) has been the latter.

## What is established

- *Initial bindings now exist* on five proved theorems: [handshake-lemma](../handshake-lemma.md), [tree-equivalences](../tree-equivalences.md), [eulerian-circuit-criterion](../eulerian-circuit-criterion.md), [bipartite-iff-no-odd-cycle](../bipartite-iff-no-odd-cycle.md), and [dag-topological-sort](../dag-topological-sort.md) carry `lean:` frontmatter pointing at the matching mathlib namespace and (where it exists) the matching named lemma. Three of the five (handshake-lemma, tree-equivalences, eulerian-circuit-criterion) bind to lemmas mathlib already has; bipartite-iff-no-odd-cycle binds to a mathlib lemma whose exact name has varied across revisions; dag-topological-sort points at the `Quiver.Path` machinery and is marked corpus-side-deferred (mathlib does not carry the existence theorem as a single named result).
- Mathlib has substantial coverage; the remaining proved theorem ([dependency-soundness-iff-dag](../dependency-soundness-iff-dag.md)) is corpus-specific and not in mathlib in any form.
- The peer math theory predication-categories has Lean-bound theorems and serves as the binding-style exemplar.

## What remains open

- *Verify the bindings against a pinned mathlib commit.* The current `lean:` entries name modules and lemmas without checking that the names compile; the next step is to pin a mathlib revision and confirm that each named lemma resolves to the intended statement.
- *Author the corpus-side Lean module for [dag-topological-sort](../dag-topological-sort.md).* The proof would assemble from `Quiver.Path` acyclicity, `Finset.induction`, and either Kahn or DFS-post-order. This is the smallest non-mathlib Lean obligation in the directory.
- *Decide on the [dependency-soundness-iff-dag](../dependency-soundness-iff-dag.md) binding.* The theorem is corpus-specific (its statement quantifies over typed corpus notes), so any Lean version requires first formalising "typed corpus note" — significant work that may belong in the FARS toolkit's Lean-binding rather than in this directory.
- *Bind the two `sketch` theorems by citation rather than by formalisation.* [four-colour](../four-colour.md) has a Coq formalisation (Gonthier 2008) and [kuratowski](../kuratowski.md) is in mathlib piecewise; both should carry `lean:` entries pointing at the citation rather than at corpus-side proofs.

## Why this matters

A graph-theory directory in a corpus that has a Lean-binding discipline and is *not* Lean-bound is a curation diagnostic — the binding work is feasible, the upstream library exists, and the absence is conspicuous. Closing this question is part of promoting graph-theory from "theory-discipline-conformant" to "formally-verified at the level the rest of the math directory aspires to".
