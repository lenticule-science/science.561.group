---
type: question
status: open
explores: [chain-complex-iep-g, stalkwise-diagonal-cone, bipartite-multipartition]
---

# Which graph topologies realize full multiplicity in cellular IEP-G?

For a cellular chain complex of a CW complex $X$ with stalkwise-diagonal Hilbert structure, which bipartite multipartitions $\Pi$ are realizable in $\mathcal H_{\mathrm{diag}}$?

The [decomposition theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/chain-complex-iep-g-decomposition.md) reduces this to per-degree univariate IEP-G. Per-degree, the question becomes: for the [boundary-operator graph](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/boundary-operator-graph.md) $G_n$ at degree $n$, which multiplicity partitions are realizable by symmetric $G_n$-sparse matrices with positive diagonal?

The toolkit catalog ([catalog](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/examples/iep-g-cellular-catalog/iep-g-cellular-catalog.md)) shows:

| Graph $G$ | rank $r_1$ | uniform spectrum | mult profile | Full degeneracy |
|---|---|---|---|---|
| $P_n$ | $n-1$ | distinct (Sturm) | $(1, \ldots, 1)$ | ✗ |
| $C_n$ | $n-1$ | $\{2 - 2\cos(2\pi k/n)\}$ | mostly $(2, \ldots, 2, 1?)$ | only for $n = 3$ |
| $K_n$ | $n-1$ | $\{n, \ldots, n\}$ | $(n-1)$ | ✓ |
| $K_{1, n}$ | $n$ | $\{1, \ldots, 1, n+1\}$ | $(n, 1)$ | ✗ for $n \ge 3$ |

## Conjecture (vertex-transitivity)

> **Conjecture.** A graph $G$ with $n$ vertices and rank $r_1 = n - c$ ($c$ = number of connected components) realizes the supersymmetric stratum (mult $(r_1)$) at uniform stalkwise weights iff $G$ is vertex-transitive (Aut$(G)$ acts transitively on vertices).

**Evidence:** $K_n$ (vertex-transitive, full mult realized), $C_n$ (vertex-transitive, *partial* mult only — but uniform-weights mult profile suggests all eigenvalues come in symmetric pairs except $k = n/2$), $P_n$ (not vertex-transitive, no mult), $K_{1, n}$ for $n \ge 3$ (not vertex-transitive — center has degree $n$, leaves have degree 1 — only partial mult realized via leaf-symmetry).

But $C_4$ is vertex-transitive yet doesn't realize full mult $(3)$ at uniform weights (gives $(2, 1)$). So the conjecture as stated isn't right.

## Refined direction

The combinatorial-Laplacian spectrum at uniform weights is determined by the irreducible-rep decomposition under Aut$(G)$. Multiplicities correspond to dim of irreps. For full mult-$(r_1)$, need a single irrep of dim $r_1$ — requires Aut$(G)$ to be sufficiently large.

- $K_n$: Aut$(K_n) = S_n$, has a $(n-1)$-dim irrep (standard representation). Full mult $r_1 = n-1$ realized. ✓
- $C_n$ for $n = 3$: Aut$(C_3) = S_3$ (= dihedral of order 6), has a 2-dim irrep. Full mult $r_1 = 2$ realized. ✓
- $C_n$ for $n \ge 4$: Aut$(C_n) = D_{2n}$, irrep dims are 1 or 2. Mult-$(n-1)$ not realized as a single irrep.
- $K_{1, n}$: Aut acts on leaves by $S_n$, fixing center. Has 1-dim trivial + $(n-1)$-dim standard on leaves. Mult-$(n-1)$ realized (the leaf-eigenspace) but the center-vs-leaves split adds a singleton. Mult-$(n)$ not realized.

So the refined condition for full mult-$(r_1)$:

> **Refined conjecture.** Graph $G$ realizes full mult-$(r_1)$ at uniform weights iff Aut$(G)$ has an $r_1$-dim irrep that exhausts the non-trivial spectrum of $\Delta_0$.

This involves both vertex-transitivity AND a representation-theoretic condition on the action.

## Generalization to varying weights

At non-uniform stalkwise weights, can additional multipartitions be realized by breaking some symmetries? The IEP-G classical literature handles this for paths and trees via SSP/SMP arguments. The chain-complex-toolkit version of these arguments is [open](questions/ssp-smp-for-chain-complexes.md).

## Generalization to bipartite multipartitions (multi-degree)

The conjecture above is per-degree. For full bipartite multipartitions involving cross-degree blocks, the question becomes: when can simultaneous degeneracies across multiple chain degrees be realized by stalkwise-diagonal Hilbert structures?

By the decomposition theorem, this reduces to simultaneously achieving the prescribed within-degree partition at each degree — but the boundary-operator graphs $G_n, G_{n+1}, \ldots$ are different, and the weights are shared between adjacent degrees, so the per-degree problems aren't independent.

## Concrete sub-question

For $\partial \Delta^k$ ($k \ge 3$), the boundary-operator graphs at each degree are highly symmetric (vertex-transitive, edge-transitive, etc., from the simplicial group action $S_{k+1}$). Verify: at uniform weights, all bipartite multipartitions induced by the $S_{k+1}$-irrep decomposition are realized. Are *non*-irrep-induced multipartitions realizable at non-uniform weights?
