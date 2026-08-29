---
type: morphism
class: structure-preserving-map
status: settled
depends-on: [graph, vertex, edge, adjacency]
realizes: [adjacency]
symbol: f
see-also:
  - ../objects/directed-graph.md
---

# Graph homomorphism

A **graph homomorphism** $f : G \to H$ between two [graphs](../objects/graph.md) $G = (V_G, E_G)$ and $H = (V_H, E_H)$ is a function $f : V_G \to V_H$ on vertex sets such that whenever $\{u, v\} \in E_G$, also $\{f(u), f(v)\} \in E_H$ — adjacency is preserved. Graph homomorphisms are the morphisms of the category of graphs and are the natural notion of "structural map" between graphs.

## Signature

$$f : V_G \to V_H \quad \text{such that} \quad \{u, v\} \in E_G \implies \{f(u), f(v)\} \in E_H.$$

For [directed graphs](../objects/directed-graph.md), the condition is the asymmetric version: $(u, v) \in E_G \implies (f(u), f(v)) \in E_H$. For [labelled graphs](../objects/labelled-graph.md), the labels must additionally agree: $\ell_H(f(v)) = \ell_G(v)$ for vertex labels and $\ell_H(f(e)) = \ell_G(e)$ for edge labels.

## What homomorphisms commit to

1. **Edges are sent to edges.** A homomorphism does not invent edges in $H$ where there were none in $G$, but it can collapse parallel structure: two distinct edges in $G$ may be mapped to the same edge in $H$ (if their endpoints collapse), and two distinct vertices in $G$ may be mapped to the same vertex in $H$.
2. **Non-edges may become edges.** A pair of vertices that is *not* an edge in $G$ may map to a pair that *is* an edge in $H$. This is the asymmetry of the homomorphism definition: it preserves edges, not non-edges.
3. **Composition is composition of functions.** Two homomorphisms $\varphi: G \to H$ and $\psi: H \to K$ compose to a homomorphism $\psi \circ \varphi: G \to K$. The identity function on vertices is a homomorphism. Together these make the category $\mathbf{Grph}$ of graphs and homomorphisms.

## Special homomorphisms

- An **isomorphism** is a homomorphism with a two-sided inverse — equivalently, a [graph isomorphism](graph-isomorphism.md). Isomorphic graphs are "the same graph up to relabelling."
- An **embedding** (or *injective homomorphism*) is a homomorphism whose underlying vertex map is injective. An embedding witnesses $G$ as a [subgraph](../objects/subgraph.md) of $H$ (see [subgraph inclusion](subgraph-inclusion.md)).
- A **quotient** is a surjective homomorphism that identifies vertices according to an equivalence relation (see [quotient morphism](quotient-graph.md)).
- An **endomorphism** is a homomorphism from a graph to itself. The set of endomorphisms of a graph forms a monoid under composition.
- An **automorphism** is an isomorphism from a graph to itself; the set of automorphisms forms a group, the *automorphism group* of the graph.

## Composition

Composition is just function composition on the underlying vertex sets. The category $\mathbf{Grph}$ has all small limits and colimits; products are built via Cartesian products of vertex sets with the *categorical-product* edge condition.

## Homomorphism and graph colouring

The set of homomorphisms $G \to K_n$ (where $K_n$ is the complete graph on $n$ vertices) is in bijection with the set of proper $n$-colourings of $G$. This makes graph colouring a homomorphism question: $G$ is $n$-colourable iff there exists a homomorphism $G \to K_n$, equivalently iff $G$'s *chromatic number* $\chi(G) \leq n$. Many graph-colouring results are best stated in this form. Reference: [Diestel 2017](references/diestel2017.md) §1.1.
