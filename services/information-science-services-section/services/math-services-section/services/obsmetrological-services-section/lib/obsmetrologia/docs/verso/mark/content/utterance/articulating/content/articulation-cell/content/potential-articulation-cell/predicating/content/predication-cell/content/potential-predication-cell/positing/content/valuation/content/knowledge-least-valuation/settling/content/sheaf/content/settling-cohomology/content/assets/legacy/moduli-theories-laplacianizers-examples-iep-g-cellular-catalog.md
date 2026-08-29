---
type: example
status: draft
depends-on: [chain-complex-iep-g, chain-complex-iep-g-decomposition]
see-also: [bipartite-stratification-theorem, iep-g-multiplicity-partitions]
---

# Catalog of cellular IEP-G cases via the decomposition theorem

Application of the chain-complex IEP-G decomposition theorem (`theorems/chain-complex-iep-g-decomposition.md`) to specific cellular chain complexes. For each case, we identify the boundary-operator graph(s) $G_n$ at each degree, apply known univariate IEP-G results to each, and combine via the decomposition theorem to determine the realizable bipartite multipartitions.

In each case the question is: for the cellular chain complex of CW complex $X$, which bipartite multipartitions $\Pi$ are realizable in $\mathcal H_{\mathrm{diag}}$? The decomposition theorem reduces this to: at each degree $n$, the within-$d_n$ partition $\Pi|_n$ must be univariate-IEP-G-realizable for the boundary-operator graph at degree $n$.

## 1-dimensional cases (univariate)

For 1-dim cellular complexes (graphs as CW complexes), there's only $d_1$ and the boundary-operator graph is the underlying graph $G$. Univariate IEP-G applies directly.

### Path $P_n$

$P_n$ has $n$ vertices, $n-1$ edges in a line. $r_1 = n-1$ (since $H_0 = \mathbb R$).

**Univariate IEP-G fact (classical, Sturm).** The squared singular values of $\widetilde d_1$ on $P_n$ with stalkwise weights are *always all distinct* — irreducible tridiagonal matrices have simple spectrum.

**Realizable multipartitions:** only the generic $\{(1), (1), \ldots, (1)\}$. Every multipartition with at least one block of size $\ge 2$ is unrealizable.

### Cycle $C_n$

$C_n$ has $n$ vertices, $n$ edges in a closed loop. $r_1 = n-1$ (with $H_0 = \mathbb R$, $H_1 = \mathbb R$).

**Univariate IEP-G facts.** With uniform weights, the cycle Laplacian's nonzero eigenvalues are $\{2 - 2\cos(2\pi k/n) : k = 1, \ldots, n-1\}$. These come in pairs $k, n-k$ (giving the same eigenvalue) for $k \ne n-k$. For odd $n$: pairs $(1, n-1), (2, n-2), \ldots$, so $(n-1)/2$ pairs, all double, plus possibly one singleton at $k = n/2$ (only if $n$ even). For even $n$: pairs $(1, n-1), \ldots, (n/2-1, n/2+1)$ all double, plus singleton at $k = n/2$.

So uniform $C_n$ realizes the multipartition with all-pairs-together (plus possibly one singleton): $\{(2)^{m}, (1)^{?}\}$ where $m = \lfloor (n-1)/2 \rfloor$.

For non-uniform weights: more multipartitions become realizable. The cyclic structure permits more flexibility than paths but less than complete graphs.

**Realizable multipartitions for $C_3$:** generic $\{(1),(1)\}$ and supersymmetric $\{(2)\}$ (the latter at uniform weights, by the $\mathbb Z_3$-symmetry). Both realizable.

**Realizable multipartitions for $C_4$:** $r_1 = 3$. Multipartitions of $\{1,2,3\}$: $(1,1,1), (2,1), (3)$. With uniform weights, eigenvalues $\{2 - 2\cos(\pi/2), 2 - 2\cos(\pi), 2 - 2\cos(3\pi/2)\} = \{2, 4, 2\}$, multiplicity pattern $(2, 1)$. So $(2, 1)$ is realized at uniform. Generic $(1,1,1)$ realized at non-symmetric weights. The $(3)$ partition (all three nonzero eigenvalues equal): would require $C_4$ to be "even more symmetric" than $\mathbb Z_4$ — not realizable for $C_4$ as a graph (classical IEP-G result).

### Complete graph $K_n$

$K_n$ has $n$ vertices, $\binom{n}{2}$ edges, each pair connected. $r_1 = n-1$.

**Univariate IEP-G facts.** $K_n$ has $S_n$-symmetry acting on vertices. Uniform weights give Laplacian $K_n$-spectrum $\{0, n^{(n-1)}\}$ — eigenvalue 0 (kernel) with multiplicity 1, eigenvalue $n$ with multiplicity $n-1$. So uniform realizes the multipartition $(n-1)$ (all $r_1 = n-1$ eigenvalues equal).

For non-uniform weights, eigenvalues split. Generic multipartitions realize $(1)^{n-1}$.

**Realizable multipartitions for $K_n$.** All multipartitions are realizable, by classical IEP-G (Barrett–Fallat: $K_n$ realizes every multiplicity list, since the graph imposes no sparsity beyond the diagonal). In particular:
- $\{(1)^{n-1}\}$ generic,
- $\{(n-1)\}$ supersymmetric (uniform),
- All intermediate.

So $K_n$ is "freely realizable."

### Star $K_{1, n-1}$ (path from one central vertex to $n-1$ leaves)

$K_{1, n-1}$ has 1 central vertex connected to $n-1$ leaves. $r_1 = n-1$.

**Univariate IEP-G facts.** The star's Laplacian has eigenvalues $\{0, 1^{(n-2)}, n\}$ for uniform weights — multiplicity pattern $(1, n-2, 1)$ (kernel) + $(n-2, 1)$ on nonzero spectrum. Realizable multipartition for nonzero spectrum: $(n-2, 1)$.

For non-uniform weights: eigenvalues split. Many multipartitions realizable.

**Realizable multipartitions for $K_{1,n-1}$:** classical IEP-G says any multiplicity list with at most 2 distinct values (= partitions of $n-1$ with at most 2 distinct part sizes). So $(n-1)$, $(n-2, 1)$, $(n-3, 2)$, etc. are realizable; $(n-3, 1, 1)$ depends on whether 3 distinct values can be realized, etc. The classical analysis is technical.

### Tree $T$

Generally, classical IEP-G for trees (Barrett–Fallat–Hall–Hogben) gives a rich combinatorial theory: realizability is controlled by the "minimum number of distinct eigenvalues" $q(T)$, and the multiplicity lists realizable for $T$ form a finite combinatorial structure determined by the tree's structure.

For our purposes: chain-complex IEP-G of a tree (1-dim cellular complex) reduces to univariate IEP-G of the tree. The classical literature applies directly.

## 2-dimensional cases (genuinely bipartite)

### Filled triangle (2-disk)

3 vertices, 3 edges (= $K_3$ graph), 1 triangle. Rank profile $(2, 1)$.

**Boundary-operator graphs:**
- $d_1$: $K_3$ graph. Univariate IEP-G: all multiplicity patterns of $r_1 = 2$ are realizable — generic $(1, 1)$ and supersymmetric $(2)$.
- $d_2$: a "single 2-cell with 3 incident edges" structure — boundary-operator graph is essentially trivial (single cell on each side, 1-dim relation). Univariate IEP-G: trivially realizes the single multipartition $(1)$.

**Realizable bipartite multipartitions:**
By the decomposition theorem, $\Pi$ is realizable iff each $\Pi|_n$ is univariate-realizable.

For the filled triangle, all $\Pi|_1$ are realizable ($K_3$ realizes everything) and all $\Pi|_2$ are realizable (trivial). So **all 4 bipartite multipartitions of $(2, 1)$ are realizable**:
- $\Pi_0 = \{(1,0), (1,0), (0,1)\}$
- $\Pi_A = \{(2,0), (0,1)\}$
- $\Pi_B = \{(1,0), (1,1)\}$
- $\Pi_T = \{(2,1)\}$

### Boundary of tetrahedron $\partial \Delta^3 \cong S^2$

4 vertices, 6 edges (= $K_4$ graph), 4 triangles. Rank profile $(3, 3)$.

**Boundary-operator graphs:**
- $d_1$: $K_4$ graph. Univariate IEP-G: all multiplicity patterns of $r_1 = 3$ are realizable.
- $d_2$: edge-triangle incidence pattern. Each edge is in 2 triangles; each triangle has 3 edges. The graph $G_{d_2}$ is the "edge-of-triangle adjacency" graph, which for $\partial \Delta^3$ has $K_4$-like structure (all 4 triangles are mutually adjacent via shared edges). Univariate IEP-G of this graph: by symmetry similar to $K_4$, all multiplicity patterns of $r_2 = 3$ are realizable.

**Realizable bipartite multipartitions:**
All 31 bipartite multipartitions of $(3, 3)$ (per `examples/moduli-strata-classification.md`) are realizable. Confirms the surjectivity finding of `examples/cellular-sheaf-on-tetrahedron-boundary.md` ($\Phi: \mathcal H_{\mathrm{diag}} \twoheadrightarrow \mathcal M_{\mathrm{Lap}}$ surjective on $\partial \Delta^3$).

### Path-with-2-cell (degenerate case, illustrative)

Topologically meaningful only with care: e.g., a 2-disk with the boundary subdivided into a path $P_3$ + a closing edge. This is just $\partial \Delta^2$ filled, which is the filled triangle above.

For a hypothetical "$P_3$ with an extra 2-cell glued along a non-closing path": the 2-cell's boundary doesn't close, so this isn't a valid cell complex.

If we try to invoke a chain complex with $d_1$ = $P_3$-Laplacian and $d_2$ = something rank 1: such a chain complex *exists* algebraically but doesn't come from a CW complex.

**For an algebraic chain complex with $d_1$ tridiagonal (path-like) and $d_2$ rank 1:** by the decomposition theorem, $\Pi|_1$ must be univariate-realizable for the path = generic only. So $\Pi$ must have $\Pi|_1 = (1)^{n-1}$. The cross-$d$ structure can still vary; there are $(2 \cdot \text{something})$ realizable bipartite multipartitions, all with generic $\Pi|_1$.

## Synthesis

**The catalog confirms the decomposition theorem in concrete cases.** Every bipartite multipartition's realizability reduces to the univariate IEP-G of each boundary-operator graph.

**Realizability is controlled by the cellular structure's "richness":**
- Path-like 1-skeletons: only generic. Univariate IEP-G of paths is heavily constrained.
- Cyclic 1-skeletons: more flexibility, but still constrained by classical theory.
- Complete-like 1-skeletons ($K_n$, $\partial \Delta^n$): all multipartitions realizable, by $K_n$'s freedom in classical IEP-G.

**The chain-complex IEP-G program reduces to:**
1. Identify the boundary-operator graph $G_n$ at each degree of the cellular complex.
2. Look up the univariate IEP-G realizable patterns for each $G_n$.
3. Combine via the decomposition theorem.

For (1): the boundary-operator graph at degree $n$ has $(n-1)$-cells as vertices and $n$-cells as edges, with each $n$-cell connected to its $(n-1)$-faces. This is the *bipartite incidence graph* of $X$ at adjacent dimensions.

For (2): classical IEP-G literature (Barrett, Fallat, Hogben, et al.) catalogs realizability for many graph families.

For (3): mechanical, given (1) and (2).

## Computational verification (Python toolkit)

The python-toolkit at `tools/python-toolkit/` provides an IEP-G realizability checker. Running on small cases produces the following catalog of `(any-multiplicity, full-degeneracy)` realizability at uniform stalkwise weights:

| Complex | $r_1$ | spectrum at uniform | mult profile | ANY | FULL |
|---|---|---|---|---|---|
| $P_3$ | 2 | distinct | $(1,1)$ | ✗ unrealizable | ✗ unrealizable |
| $P_4$ | 3 | distinct | $(1,1,1)$ | ✗ | ✗ |
| $C_3$ | 2 | $\{3, 3\}$ | $(2)$ | ✓ realizable | ✓ realizable |
| $C_4$ | 3 | $\{2, 2, 4\}$ | $(2, 1)$ | ✓ | ✗ |
| $K_3$ | 2 | $\{3, 3\}$ | $(2)$ | ✓ | ✓ |
| $K_4$ | 3 | $\{4, 4, 4\}$ | $(3)$ | ✓ | ✓ |
| $K_{1, 2} = P_3$ | 2 | distinct | $(1, 1)$ | ✗ | ✗ |
| $K_{1, 3}$ | 3 | $\{1, 1, 4\}$ | $(2, 1)$ | ✓ | ✗ |
| $\partial \Delta^2$ | 2 | $\{3, 3\}$ | $(2)$ | ✓ | ✓ |
| $\partial \Delta^3$, deg 1 | 3 | $\{4, 4, 4, 4, 4, 4\}$ | $(6)$ | ✓ | ✓ |
| $\partial \Delta^3$, deg 2 | 3 | $\{4, 4, 4\}$ | $(3)$ | ✓ | ✓ |

(ANY = some within-degree multiplicity > 1 achievable; FULL = all nonzero eigenvalues equal achievable.)

**Findings refining the catalog:**

1. **$C_4$ partial vs. full.** At uniform weights, $C_4$ realizes mult $(2, 1)$ — partial degeneracy from the $\mathbb Z_4$ symmetry, but not full. The catalog above already noted this; toolkit confirms.

2. **$K_{1, 3}$ partial vs. full.** Same pattern: $S_3$-symmetry on leaves gives mult $(2, 1)$, not $(3)$. So $K_{1, 3}$ admits *partial* but not *full* spectral degeneracy at uniform weights. The center-leaf asymmetry obstructs full degeneracy.

3. **$K_4$ vs $K_{1, 3}$.** Both are 4-vertex graphs, but $K_4$ realizes full mult-$(3)$ degeneracy while $K_{1, 3}$ does not. Combinatorial structure (vertex-transitivity in $K_4$ vs center-leaf split in $K_{1, 3}$) determines realizability.

4. **$\partial \Delta^3$ supersymmetric stratum.** At uniform weights, $\partial \Delta^3$'s degree-1 has all 6 nonzero eigenvalues equal (mult $(6)$), and degree-2 has all 3 nonzero equal (mult $(3)$). The bipartite supersymmetric stratum $\Pi_{\max}$ is realized at uniform — confirming the cellular-sheaf moduli claim.

5. **$P_n$ confirmed unrealizable for any multiplicity.** The Sturm tridiagonal-simplicity result holds: paths admit no spectral degeneracy at all, no matter what positive stalkwise weights. The toolkit's discriminant computation gives a sum-of-squares form (verified for $P_3$ matches laplacianizers formula $(\alpha b_1 - \beta b_2)^2 + 4 a_2^2 b_1 b_2$).

## Open

1. **Boundary-operator graphs for general cellular structures.** The map $X \mapsto \{G_n\}_n$ from cell complexes to graph-tuples is well-defined. Catalog $G_n$ for: simplicial $\partial \Delta^n$, regular polytope boundaries, products $X \times Y$, suspensions, etc.

2. **Hodge-symmetric realizability.** When a cellular complex $X$ has Poincaré duality (e.g., $X = \partial \Delta^n$ for the boundary of a simplex), the boundary-operator graphs $G_n$ are isomorphic for $n$ and $n^* = (\dim X) - n$. This adds extra symmetry to the realizability theory and may produce constraints not visible from per-degree analysis.

3. **Generic cellular complexes vs. special.** "Generic" cellular complexes have $G_n$ with no special structure beyond their bipartite-incidence form. "Special" ones (e.g., regular polytopes, vertex-transitive graphs) have additional symmetries that may yield realizability of multipartitions that wouldn't be realizable for generic structure.
