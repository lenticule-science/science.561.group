---
type: narrative
status: current
introduces:
  - ../objects/graph.md
  - ../objects/directed-graph.md
discusses:
  - ../examples/seven-bridges-of-konigsberg.md
depends-on:
  - ../objects/graph.md
  - ../objects/directed-graph.md
  - ../examples/seven-bridges-of-konigsberg.md
  - ../teaching/explanations/degree.md
  - ../theorems/handshake-lemma.md
  - ../theorems/eulerian-circuit-criterion.md
  - ../references/euler1736.md
  - ../references/diestel2017.md
---

# From Königsberg to networks

Graph theory has a date of birth: 1736, in a paper by Leonhard Euler answering a townspeople's puzzle from the city of Königsberg. The puzzle was concrete — could a person walk through the city crossing each of its seven bridges exactly once? — and Euler's response made two moves that look obvious in retrospect and were unprecedented at the time. First, he stripped away the geography: the islands and the riverbanks became four points, the bridges became seven lines, and the question was now about an abstract object that did not exist in mathematics until he drew it. Second, he proved the answer was no, *and* explained why no such walk could exist for any analogous configuration whose vertices did not all have even degree. He had invented [graphs](../objects/graph.md) and proved the [first theorem about them](../theorems/eulerian-circuit-criterion.md), and the proof reduced to a [counting argument about degrees](../theorems/handshake-lemma.md). The paper is reproduced — and its modern English translation discussed — in every introductory graph-theory text; the corpus cites [Euler 1736](../references/euler1736.md) directly and walks through the result in [the seven-bridges example](../examples/seven-bridges-of-konigsberg.md).

The two moves Euler made are still the moves graph theory makes today. The first — strip away whatever the vertices and edges *are* and treat them as abstract tokens — is what graph theory contributes to the rest of mathematics: a *language* in which any system of pairwise relations can be written down, asked questions of, and answered. The second — recover concrete questions about specific systems by interpreting the abstract result back into the system's terms — is what graph theory contributes to the rest of the world: cities, networks, dependency systems, social graphs, parse trees, control flow, knowledge graphs are all studied with the same combinatorial machinery because they are all the same abstract object in different clothes. A road network is a [weighted graph](../objects/weighted-graph.md). A state machine is a [labelled directed graph](../objects/labelled-graph.md). A taxonomy is a [tree](../objects/tree.md). A `depends-on:` system is a [DAG](../objects/dag.md). The corpus's own `depends-on:` graph is a small example of the last category, and the [dependency-soundness-iff-dag](../theorems/dependency-soundness-iff-dag.md) result that this directory proves is what underwrites the corpus's claim that its dependency machinery is well-founded.

The historical arc from 1736 to now passes through several waves. After Euler, the subject was largely dormant for a century. In the mid-1800s Cayley's enumeration of trees, Hamilton's icosian game, and Kirchhoff's electrical-network theorems revived it as a working subject. Around 1900, Petersen and Heawood — and a long history of attempts on the four-colour problem — opened the modern theory of graph colouring and connectivity. The 20th century saw graph theory become a core branch of combinatorics with deep links to algebra (spectral graph theory; graph homomorphisms as constraint satisfaction), topology (planar graphs and surfaces; the [Kuratowski theorem](../theorems/kuratowski.md); the Robertson–Seymour graph-minors program; the [four-colour theorem](../theorems/four-colour.md), proved in 1976), probability (random graphs from Erdős–Rényi onward), and computation (efficient algorithms on graphs as the substrate of modern computer science). The textbook reference for the current state is [Diestel 2017](../references/diestel2017.md), with [Bondy–Murty 2008](../references/bondy-murty2008.md) as the standard alternative.

The corpus does not try to recapitulate that history. The point of this directory is to carry just enough graph theory that the corpus's own load-bearing claims about [DAGs](../objects/dag.md), [partial orders](../../order/objects/partial-order.md), and the structure of dependency systems are typed against an actual graph-theory directory rather than against asserted-but-not-defined notions. Most of the textbook external theory — the algorithmic results, spectral and probabilistic graph theory, the deep colouring theorems, the geometry of planar embeddings — is named-as-deferred in the directory's [_index](../_index.md). What is here is what the rest of the corpus actually depends on: the basic [objects](../objects/) and [concepts](../teaching/explanations/), the morphisms that move between them, a small handful of theorems that justify the load-bearing claims, and honest open work tracked in [questions](../learning/questions/). Euler's puzzle is the directory's anchor not just for tradition but because it remains the cleanest small instance of the general pattern: a concrete question about a concrete system, abstracted into a typed combinatorial object, answered by a structural theorem, and the answer interpreted back into the original concrete terms. That round-trip is what graph theory does for the corpus.
