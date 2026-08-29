---
type: example
status: verified
instantiates: [complete-graph, simple-graph, planar-graph, kuratowski]
depends-on: [complete-graph, simple-graph, planar-graph, kuratowski, handshake-lemma]
---

# The complete graph K5

The [complete graph](../../../../glossary/terms/complete-graph.md) $K_5$ on five vertices: the smallest non-planar simple graph and one half of [Kuratowski's planarity obstruction](../../research-articles/kuratowski.md). Worked here as a concrete witness of non-planarity via Euler's formula.

## Step 1: The graph

Vertices: $V = \{1, 2, 3, 4, 5\}$. Edges: every two-element subset, $E = \binom{V}{2}$, so $|E| = \binom{5}{2} = 10$. Every vertex has degree 4.

Handshake-lemma check: $5 \cdot 4 = 20 = 2 \cdot 10 = 2|E|$. ✓

## Step 2: Apply Euler's formula bound

For a finite simple [planar graph](../../../../glossary/terms/planar-graph.md) with $V \geq 3$, Euler's formula gives the bound:

$$E \leq 3V - 6.$$

For $K_5$: $V = 5$, so the planarity bound is $3 \cdot 5 - 6 = 9$. But $K_5$ has $E = 10 > 9$.

## Step 3: Conclude non-planarity

$K_5$ violates the planarity bound, so $K_5$ is not planar. $\square$

## Output / Verification

$K_5$ is non-planar. The verification is direct from Euler's formula and the edge-count bound, and matches every textbook treatment ([Diestel 2017](../../bibliographies/diestel2017.md) §1.1, [Bondy–Murty 2008](../../bibliographies/bondy-murty2008.md) §10.2).

## What this exemplifies

$K_5$ is one of the two minimal non-planar graphs (the other is $K_{3,3}$); together they are *the* obstruction to planarity, by [Kuratowski's theorem](../../research-articles/kuratowski.md). This example exhibits the cleanest proof of $K_5$'s non-planarity — a direct edge-count violation of Euler's formula bound — without invoking the deeper structural arguments that prove the necessity direction of Kuratowski. It shows the corpus what concrete non-planarity arguments look like, and it serves as the witness any subsequent treatment of planarity will reuse.
