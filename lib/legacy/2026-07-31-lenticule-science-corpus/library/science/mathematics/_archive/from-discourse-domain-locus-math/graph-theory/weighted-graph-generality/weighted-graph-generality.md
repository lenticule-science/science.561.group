---
type: question
class: scoping
status: open
explores: [weighted-graph]
depends-on: [weighted-graph, graph]
---

# Weighted-graph generality

At what level of generality should the corpus commit to a definition of [weighted graph](../objects/weighted-graph.md)? Three plausible commitments are on the table, each with a different downstream cost: $W = \mathbb{R}_{\geq 0}$ (textbook default; trivially correct but gives up the algebraic generalizations), $W$ a semiring (covers shortest paths, max-flow, and tropical-semiring constructions; standard in algorithmic algebraic graph theory), or $W$ a residuated lattice (covers the [bilattice](../../algebra/objects/bilattice.md) substrate and connects to the [predication-categories](../../categories/theories/predication-categories/_index.md) machinery via shared algebraic structure). The question is what to write in the object note's body and frontmatter without prejudicing any of the three readings.

## Decomposition

- **Sub-question A.** Is the semiring level a uniform improvement over $\mathbb{R}_{\geq 0}$, or are there results that work for $\mathbb{R}_{\geq 0}$ and break at the semiring level (for example, results requiring the order on $W$ to be a total order, or requiring negative weights for potential-difference arguments)?
- **Sub-question B.** Does the residuated-lattice level connect honestly to the corpus's [predication fiber algebra](../../categories/theories/predication-categories/objects/predication-fiber-algebra.md) substrate, or is the connection cosmetic? A weighted graph valued in a residuated lattice is not the same object as a [predication fibration](../../categories/theories/predication-categories/objects/predication-fibration.md); pretending it is would over-claim.
- **Sub-question C.** Should the corpus instead carry *three* objects (`real-weighted-graph`, `semiring-weighted-graph`, `lattice-weighted-graph`) and let `weighted-graph` be the umbrella concept?

## What is established

- The [weighted-graph](../objects/weighted-graph.md) object as currently written commits to a *parameterized* $W$ and lists the three plausible choices. This is a deliberate non-decision — the parameterization is honest, but it is not a structural commitment.
- The textbook references ([Diestel 2017](references/diestel2017.md), [Bondy–Murty 2008](references/bondy-murty2008.md)) take $W = \mathbb{R}$ and treat it as a notational convenience.
- Algebraic-graph-theory texts treat semiring-valued graphs as a natural generalization with its own theorems (semiring shortest-path algorithms, the matrix-multiplication semiring trick).

## What remains open

The open work is a *commitment*: choose one definition, write the consequences down, and accept the others as derived or as separate objects. The corpus's [theory-discipline](../../../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/specifications/theory-discipline.md) treats this kind of unresolved generality as a *staging diagnostic*: a `weighted-graph` object that lists three possible definitions without committing to one is a smaller version of a staging area.

## Why this matters

The choice constrains downstream graph-theory results: shortest-path algorithms need a semiring at minimum, capacity-bounded flow needs an ordered semiring, and the corpus's own integration with the bilattice substrate needs a residuated lattice. Picking the wrong level is recoverable; picking three at once is not. The question should be resolved before any algorithmic-graph-theory child theory is opened.
