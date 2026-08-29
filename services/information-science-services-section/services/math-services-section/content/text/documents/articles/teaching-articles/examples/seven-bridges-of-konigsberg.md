---
type: example
status: verified
instantiates: [eulerian-circuit-criterion, multigraph, handshake-lemma]
depends-on: [eulerian-circuit-criterion, multigraph, graph, degree, traversal, cycle]
---

# Seven bridges of Königsberg

The founding example of graph theory: the 1736 puzzle of whether one can walk through the Prussian city of Königsberg crossing each of its seven bridges exactly once. The example instantiates the necessity direction of the [Eulerian-circuit criterion](../../research-articles/eulerian-circuit-criterion.md): the Königsberg multigraph has four vertices of odd [degree](../../../../glossary/terms/degree.md), so no Eulerian circuit (and in fact no Eulerian *trail*, since more than two vertices have odd degree) exists. Reproduced from [Euler 1736](../../bibliographies/euler1736.md).

## Step 1: Abstract the geography

Königsberg has two riverbanks (north $N$ and south $S$) and two islands ($A$ and $B$) in the river Pregel. Strip away the geography. The four landmasses become four vertices: $V = \{N, S, A, B\}$.

## Step 2: Abstract the bridges

There are seven bridges. Each is an unordered pair of landmasses (multiple bridges may join the same pair, so this is a [multigraph](../../../../glossary/terms/multigraph.md), not a [simple graph](../../../../glossary/terms/simple-graph.md)). The historical configuration:

| Bridge | Endpoints |
|---|---|
| $e_1$ | $N$–$A$ |
| $e_2$ | $N$–$A$ |
| $e_3$ | $S$–$A$ |
| $e_4$ | $S$–$A$ |
| $e_5$ | $N$–$B$ |
| $e_6$ | $S$–$B$ |
| $e_7$ | $A$–$B$ |

So $|E| = 7$, with parallel edges $e_1 \parallel e_2$ and $e_3 \parallel e_4$.

## Step 3: Compute the degrees

| Vertex | Incident edges | Degree |
|---|---|---|
| $N$ | $e_1, e_2, e_5$ | 3 |
| $S$ | $e_3, e_4, e_6$ | 3 |
| $A$ | $e_1, e_2, e_3, e_4, e_7$ | 5 |
| $B$ | $e_5, e_6, e_7$ | 3 |

Degree sum: $3 + 3 + 5 + 3 = 14 = 2 \cdot 7 = 2 |E|$, verifying the [handshake lemma](../../research-articles/handshake-lemma.md). All four vertices have odd degree.

## Step 4: Apply the Eulerian-circuit criterion

By the necessity direction of the [Eulerian-circuit criterion](../../research-articles/eulerian-circuit-criterion.md), an Eulerian circuit (closed walk using every edge exactly once) requires every vertex to have even degree. The Königsberg multigraph has *four* vertices of odd degree. So no Eulerian circuit exists.

Even an Eulerian *trail* (open walk using every edge exactly once, allowed to start and end at distinct vertices) requires *exactly two* vertices of odd degree. The Königsberg multigraph has four. So no Eulerian trail exists either.

## Output / Verification

**Result:** It is impossible to walk through Königsberg crossing each of the seven bridges exactly once.

The result is verified by direct computation of the four degrees and direct application of the criterion's necessity direction. Reproducible by drawing the multigraph and counting incidences at each vertex.

## What this exemplifies

This is the *founding* example of graph theory. The structural moves it requires — abstract concrete geography into vertices and edges; recognize parallel edges (so the object is a multigraph, not a simple graph); compute a graph invariant (the degree sequence); apply a theorem characterizing the property of interest (Eulerian-circuit existence) in terms of the invariant — are the moves graph theory makes whenever it is applied to a concrete problem. Without this example as the anchor, the [Eulerian-circuit criterion](../../research-articles/eulerian-circuit-criterion.md) is an abstract claim; with it, the criterion is the answer to a question someone actually asked. See [Euler 1736](../../bibliographies/euler1736.md) and [Diestel 2017](../../bibliographies/diestel2017.md) §1.8.
