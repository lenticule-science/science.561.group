---
type: concept
class: graph
depends-on: [stalkwise-diagonal-cone]
see-also: [chain-complex-iep-g, chain-complex-iep-g-decomposition, cellular-iep-g-graph-theoretic-condition]
---

# Boundary-operator graph

The graph capturing the sparsity pattern of $d_n^T Q_{n-1} d_n$ when $Q_{n-1}$ is stalkwise diagonal — the input to univariate IEP-G in the [decomposition theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/chain-complex-iep-g-decomposition.md) for cellular sheaves.

## Definition

For a cellular chain complex $(C_\bullet, d)$ with stalkwise diagonal $Q_{n-1}$, the matrix $d_n^T Q_{n-1} d_n$ acts on $C_n$. Its sparsity pattern (which entries are forced zero, regardless of weights) is encoded in a graph $G_n$ on the vertex set $\{1, \ldots, m_n\}$ (= cells of degree $n$):

$$G_n = \{(i, j) : (d_n^T Q_{n-1} d_n)[i, j] \ne 0 \text{ for some choice of stalkwise weights}\}.$$

For a cellular CW complex, this is the **adjacency graph of $n$-cells**: cells $i$ and $j$ in degree $n$ are adjacent in $G_n$ iff they share a common $(n-1)$-face.

## Examples

- **$P_3$ (path), degree 1**: $C_1 = \mathbb R^2$ (2 edges). $G_1$ has 2 vertices (the edges $e_1, e_2$), connected iff they share a vertex. $e_1 = (v_1, v_2)$ and $e_2 = (v_2, v_3)$ share $v_2$, so $G_1$ has one edge: it's $P_2$ as a graph.

- **$C_3$ (triangle/cycle), degree 1**: 3 edges, each pair shares a vertex. $G_1 = K_3$.

- **$\partial \Delta^2$ (= $C_3$ as cellular 1-complex), degree 1**: same as above, $G_1 = K_3$.

- **$\partial \Delta^3$ (tetrahedron), degree 1**: $C_1 = \mathbb R^6$ (6 edges). Two edges share a vertex iff they're incident. Each edge of $K_4$ shares a vertex with 4 others (out of 5). $G_1$ has 6 vertices, 12 edges (each pair of edges sharing exactly one vertex contributes one edge in $G_1$). $G_1 = K_{3, 3}$? No, more structured.

- **$\partial \Delta^3$, degree 2**: $C_2 = \mathbb R^4$ (4 triangles). Two triangles share an edge iff they're adjacent. Each pair of triangles in $\partial \Delta^3$ shares exactly one edge. So $G_2 = K_4$.

## Role in IEP-G decomposition

The [chain-complex IEP-G decomposition theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/chain-complex-iep-g-decomposition.md) says:
> A bipartite multipartition $\Pi$ is realizable in $\mathcal H_{\mathrm{diag}}$ iff each within-degree restriction $\Pi|_n$ is univariate-IEP-G-realizable for the matrix $d_n^T Q_{n-1} d_n$ with sparsity pattern $G_n$.

Univariate IEP-G for the boundary-operator graph $G_n$: which multiplicity partitions of eigenvalues of symmetric matrices with off-diagonal sparsity matching $G_n$ are realizable?

This connects directly to the classical IEP-G literature (Barrett, Fallat, Hogben, Adm, Hall, et al.), with the boundary-operator graph as the input.

## Differs from the underlying CW skeleton

For a cellular chain complex, the "underlying graph" might mean the 1-skeleton — vertices and edges of the CW complex. The boundary-operator graph $G_n$ for $n = 1$ coincides with the 1-skeleton's edge-adjacency graph (= line graph of the 1-skeleton), NOT the 1-skeleton itself.

This subtlety matters for the IEP-G applications: $G_n$ is what the per-degree IEP-G problem cares about, not the original CW structure.

## Properties depending on cellular topology

The boundary-operator graph inherits structure from the CW complex:
- Vertex-transitive iff the cellular automorphism group acts transitively on $n$-cells.
- Edge-transitive iff Aut acts transitively on incident pairs of $n$-cells.
- Distance-regular iff cellular structure is sufficiently uniform.

Realizability of multipartitions in $G_n$ depends on these symmetries — see [cellular-iep-g-graph-theoretic-condition](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/questions/cellular-iep-g-graph-theoretic-condition.md).

## Higher-dim cases

For $n \ge 2$, the boundary-operator graph captures pairs of $n$-cells sharing a common $(n-1)$-face. For $\partial \Delta^k$, this gives:
- Degree $k - 1$ (top-dim cells of $\partial \Delta^k = S^{k-1}$): the "facet graph" of the simplex, i.e., $K_{k+1}$ on the $k+1$ facets.
- Lower degrees: more complex incidence patterns.

The whole tower of boundary-operator graphs $G_1, G_2, \ldots, G_{k-1}$ encodes the cellular IEP-G data for the entire chain complex.
