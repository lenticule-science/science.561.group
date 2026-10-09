---
type: concept
class: structure
status: draft
depends-on: [refactor, invisible-automorphism-subgroup]
title: Refactor graph
description: The Cayley graph of the invisible-automorphism subgroup $NW(v^{\mathrm{code}})$ with respect to the catalog of canonical refactor generators (rename, extract, inline, move, …).
---

# Refactor graph

The Cayley graph of the [invisible-automorphism subgroup](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) $N_W(v^{\mathrm{code}})$ with respect to the catalog of canonical [refactor](../terms/refactor.md) generators (rename, extract, inline, move, …).

Vertices are codebase settlings related to $v^{\mathrm{code}}$ by an element of $N_W(v^{\mathrm{code}})$ — i.e., settlings observationally indistinguishable from $v^{\mathrm{code}}$ under $W$. Edges are catalog refactor steps. Two settlings are connected by an edge iff they differ by a single application of a catalog refactor.

## What the graph encodes

- **Connectedness** — the connected component of $v^{\mathrm{code}}$ is the set of codebase states observationally equivalent to it under $W$ and reachable by catalog operations.
- **Diameter** — the diameter of the connected component bounds the maximum number of catalog steps needed to move between two equivalent codebase states.
- **Girth** — short cycles correspond to catalog identities (rename A → B → A is the trivial cycle; extract-then-inline is a length-2 cycle).

## Catalog completeness

A catalog is *complete* for $N_W(v^{\mathrm{code}})$ iff the connected component of $v^{\mathrm{code}}$ in the refactor graph contains every settling related to $v^{\mathrm{code}}$ by an element of the invisible subgroup. Fowler's catalog is empirically near-complete for typical witness languages; rigorously characterizing the completeness gap is open. The conjecture: the gap is captured by the cohomology classes $H^n(\mathbf{T}^*, \mathcal{F}^{\mathrm{code}}_U)$ that the catalog cannot reach by composition.

## Where used

- The catalog-as-generating-set claim in [refactor](../terms/refactor.md).
- Open question: is the refactor graph connected for typical witness languages? See [composing-refactorings-safely](../../documents/articles/learning-articles/questions/composing-refactorings-safely.md).
