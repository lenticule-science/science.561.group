---
type: question
class: scoping
status: open
explores: [quiver, directed-graph]
depends-on: [quiver, directed-graph]
---

# Quiver vs. directed graph

Should the corpus carry [quiver](../../../../glossary/terms/quiver.md) and [directed-graph](../../../../glossary/terms/directed-graph.md) as two separate object notes, or as one note with two terminological aliases? The combinatorial structure is the same — vertex set, edge set, source and target maps — but the downstream uses are distinct: graph theorists usually work with $E \subseteq V \times V$ (no parallel edges), while representation theorists work with the pair-of-functions presentation $s, t : E \to V$ (parallel edges natural). The question is whether the structural difference is real or terminological.

## Decomposition

- **Sub-question A.** Is the relation-vs.-pair-of-functions distinction structural? When parallel edges are admitted, the two presentations are isomorphic in $\mathbf{Set}$, but the morphism categories differ: $\mathbf{Digrph}_{\text{relation}}$ has functions on vertex sets, $\mathbf{Quiv}$ has natural transformations of $\bullet \rightrightarrows \bullet$-presheaves which automatically include the edge-action. The morphism distinction *is* structural.
- **Sub-question B.** Does the corpus already commit to one presentation by writing $E \subseteq V \times V$ in [directed-graph](../../../../glossary/terms/directed-graph.md)? Yes — and the [multigraph](../../../../glossary/terms/multigraph.md) note carries the pair-of-functions presentation for the undirected case. The asymmetry between digraph (relation) and multigraph (pair-of-functions) is currently uncodified.
- **Sub-question C.** Is "quiver" the right name for the directed multigraph, or is "directed multigraph" clearer? "Quiver" is established in representation theory (Gabriel, Bourbaki) but unfamiliar in graph theory.

## What is established

- The current corpus has separate notes for [directed-graph](../../../../glossary/terms/directed-graph.md) (relation presentation, no parallel edges) and [quiver](../../../../glossary/terms/quiver.md) (pair-of-functions presentation, parallel edges natural).
- The [multigraph](../../../../glossary/terms/multigraph.md) note uses the pair-of-functions presentation for the undirected case; quiver is its directed analogue.
- The [predication fibration](../../../../glossary/terms/predication-fibration.md) acts on a quiver-shaped object (the predicate category's underlying graph of generators), not a digraph in the strict relation sense.

## What remains open

A single decision about presentation: commit either to the relation form (and treat quivers as "directed multigraphs", with parallel edges always carrying explicit edge-tokens) or to the pair-of-functions form throughout (and treat the simple-relation case as the special case where $(s, t) : E \to V \times V$ is injective). The current state — two notes that are *almost* the same object — is a curation diagnostic.

## Why this matters

The downstream uses (small categories as quivers with composition; the corpus's `depends-on:` graph as a digraph) inherit whichever presentation the object note picks. A bad choice produces friction every time a theory wants to reuse the structure; a good choice produces a single object that both representation theorists and graph theorists recognize as their own. The question is corpus-shaped, not mathematical: the answer is a curation decision, not a theorem.
