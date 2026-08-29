---
type: question
class: scoping
status: open
explores: [multigraph, simple-graph, graph]
depends-on: [multigraph, simple-graph, graph]
---

# Multigraph first-class

Is [multigraph](../../../../glossary/terms/multigraph.md) the *primary* graph object, with [simple-graph](../../../../glossary/terms/simple-graph.md) the special case (no parallel edges, no loops), or is it the other way around? The current notes treat [graph](../../../../glossary/terms/graph.md) as the umbrella, simple as a refinement, multi as a generalization — but the choice of which direction is "the" generalization affects how morphisms, [quotient-graph](../../../../glossary/terms/quotient-graph.md), and [line-graph](../../../../glossary/terms/line-graph.md) are best stated.

## Decomposition

- **Sub-question A.** Are the corpus's load-bearing graph applications mostly simple-graph applications (so simple should be primary) or mostly multigraph applications (so multi should be primary)? The [seven bridges of Königsberg](../../teaching-articles/examples/seven-bridges-of-konigsberg.md) is a multigraph; the [dependency-graph-of-this-corpus](../../teaching-articles/examples/dependency-graph-of-this-corpus.md) is a simple digraph; the [predication fibration](../../../../glossary/terms/predication-fibration.md) acts on a quiver (directed multigraph). The corpus is mixed.
- **Sub-question B.** Do morphism statements get cleaner in one presentation? [Quotient-graph](../../../../glossary/terms/quotient-graph.md) lands naturally in $\mathbf{MultiGrph}$ (parallel edges and loops appear from contractions); [line-graph](../../../../glossary/terms/line-graph.md) is cleanly defined on multigraphs. So morphism work suggests multigraph-primary.
- **Sub-question C.** Is the textbook tradition's preference for simple-graph-primary historical (Diestel, Bondy–Murty) or substantive? [Diestel 2017](../../bibliographies/diestel2017.md) explicitly notes that the choice is "by convention" and that some chapters recover multigraphs as the natural setting (matchings, edge-colourings).

## What is established

- The notes as currently written declare [graph](../../../../glossary/terms/graph.md) as the umbrella and place both refinements ([simple-graph](../../../../glossary/terms/simple-graph.md), [multigraph](../../../../glossary/terms/multigraph.md)) as `depends-on: [graph]`. This is a non-commitment.
- The morphism work in `morphisms/` lands in $\mathbf{MultiGrph}$ when worked through carefully.

## What remains open

A choice between three options: keep the umbrella (current state, honest about non-commitment); promote multigraph to primary (heavier upfront, lighter downstream for morphism work); promote simple-graph to primary (lighter upfront, requires explicit multigraph hops downstream). Each has a different cost; none is wrong.

## Why this matters

The choice affects the cleanest statement of half a dozen later theorems and almost every morphism. It also affects which textbook the corpus's notation matches; readers transferring in from one textbook tradition will find one choice transparent and another awkward. The current state is fine for the directory's first round of population, but the question should be revisited before a child theory of graph-theory is opened.
