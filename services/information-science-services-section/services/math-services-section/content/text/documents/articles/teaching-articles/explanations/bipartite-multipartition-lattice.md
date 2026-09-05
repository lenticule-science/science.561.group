---
type: explanation
article-kind: narrative
discusses: [bipartite-multipartition, bipartite-multipartition-lattice, refinement-cover]
recaps: [closure-poset-of-strata, stab-codim-formula]
---

# The bipartite multipartition lattice — combinatorial structure

The poset that organizes the strata of $\mathcal M_{\mathrm{Lap}}$. This narrative describes its combinatorial features as a self-contained mathematical object — what it is, how it differs from the partition lattice, what's known and not about its structure.

## What it is

For a finite-dim chain complex $(C_\bullet, d)$ with boundary ranks $r_n = \mathrm{rank}\,d_n$, the bipartite multipartition lattice is
$$\mathcal P_{\mathrm{bip}}(\mathbf r) := \big\{\text{partitions of } [N_*]\big\} \big/ \prod_n S_{r_n}, \qquad [N_*] = \bigsqcup_n \{1, \ldots, r_n\}, \qquad N_* = \sum_n r_n,$$
ordered by refinement, with chain Hodge constraints (forced cross-degree pairings) restricting to a sub-lattice when applicable.

For $N = 1$ (single chain space), $\mathcal P_{\mathrm{bip}}((r)) = \Pi_r / S_r =$ ordinary partition lattice modulo block-permutation = partitions of $r$ ordered by refinement. This is the classical object of partition combinatorics.

For $N \ge 2$, the indexing set $[N_*]$ has multiple "color classes" (one per chain degree); a multipartition is a partition of $[N_*]$ that may have blocks crossing color classes. The quotient by $\prod_n S_{r_n}$ identifies relabelings *within* each class, not across.

## How it differs from $\Pi_n$

The univariate partition lattice $\Pi_n$ is well-understood:
- Ranked, with rank $n - r$ where $r$ = number of blocks.
- Geometric (in the Whitney sense): every interval $[\hat 0, \pi]$ is a product of partition lattices over blocks of $\pi$.
- Möbius function $\mu(\hat 0, \pi) = \prod_B (-1)^{|B|-1}(|B|-1)!$.
- Characteristic polynomial, zeta polynomial, Whitney numbers all classical.

The bipartite multipartition lattice $\mathcal P_{\mathrm{bip}}(\mathbf r)$:
- Ranked (by codim $\sum_B(|B|-1) = N_* - \#\Pi$). ✓
- Geometric? Interval $[\Pi, \Pi']$ in the Hodge-unconstrained case decomposes as $\prod_B [\hat 0_B, \Pi'|_B]$ where each factor is an interval in a partition lattice — geometric structure descends, *unconfirmed in general*.
- Möbius function: conjectured to factor over blocks (the [product formula](../../research-articles/questions/bipartite-mobius-product-formula.md)), not yet proved.
- Characteristic and Whitney numbers: not computed in general.

So $\mathcal P_{\mathrm{bip}}(\mathbf r)$ is *like* $\Pi_n$ in many aspects but has open structural questions due to the multi-class structure.

## Hodge constraints restrict it

In a chain complex with boundary $d_n: C_n \to C_{n-1}$, the Hodge supersymmetric isospectrality forces certain cross-degree identifications. Specifically: nonzero eigenvalues of $\Delta_n$ on $\mathrm{im}\,d_n^* \subseteq C_n$ coincide with nonzero eigenvalues of $\Delta_{n-1}$ on $\mathrm{im}\,d_n \subseteq C_{n-1}$.

In multipartition terms: the labels $(n, i)$ and $(n-1, i)$ (under the matching of nonzero singular values across the $d_n$ adjoint pair) are forced to be in the same block of any $\Pi$ that the chain complex realizes.

This restricts $\mathcal P_{\mathrm{bip}}(\mathbf r)$ to a *sub-lattice* of partitions consistent with the Hodge constraints. The minimal element of this sub-lattice is *not* the full single-block partition $\hat 0$, but the "Hodge-minimum" partition $\Pi_{\min}$ where each cross-degree adjacent-pair is its own block of size 2 and all other indices are singletons — the partition with *only* Hodge-forced identifications.

For (2, 2) chain with $d_1$ iso: $\Pi_{\min}$ has 2 blocks of size 2 each. The constrained lattice is $\{\Pi_{\min}, \Pi_{\max}\}$ — binary.

For $\partial \Delta^3$ at uniform weights: lots of Hodge constraints, restricting the lattice substantially.

## Cardinality

For the unconstrained case:
- $|\mathcal P_{\mathrm{bip}}((r))| = $ number of partitions of $r$.
- $|\mathcal P_{\mathrm{bip}}((r_1, r_2))| = $ number of partitions of $r_1 + r_2$ modulo $S_{r_1} \times S_{r_2}$. Computable but no clean closed form.
- $|\mathcal P_{\mathrm{bip}}((1, 1, 1))| = $ number of partitions of 3 = 5 (since the three indices are in distinct color classes, $S_1 \times S_1 \times S_1$ acts trivially, so it's just $\Pi_3$).

For the Hodge-constrained case: depends on the chain complex's structure, particularly how Hodge pairs the eigenvalues.

## Cover relations

Each cover $\Pi \lessdot \Pi'$ corresponds to splitting one block of $\Pi$ into two non-empty parts. In closure-poset terms: passing from a stratum to a refinement that breaks one extra eigenvalue equality. Codim drops by 1 per cover.

## What organizes the lattice

Three features are simultaneously visible:
1. **Color-class structure** of $[N_*]$ by chain degree.
2. **Cross-degree blocks** as the bipartite extension's content.
3. **Hodge constraints** restricting to consistent sub-lattices.

These don't appear in $\Pi_n$, where there's no analog of color classes or chain-Hodge constraints. The bipartite multipartition lattice is genuinely a new combinatorial object — specialized to chain-complex moduli, with its own structural questions.

## Relation to other lattices

- **Set partition lattice $\Pi_n$**: $\mathcal P_{\mathrm{bip}}((n)) = \Pi_n$ when $N = 1$.
- **Lattice of compositions**: a related object (ordered partitions). Bipartite multipartitions don't track order *within* color classes (since we mod out by $\prod_n S_{r_n}$), only the structure of the partition.
- **Young's lattice (multi-partition variant)**: bipartite multipartitions of bounded size. Limit of large $r_n$ might give a Young-lattice-like structure.
- **Partition lattices with constraints**: the Hodge-constrained sub-lattice is in a category of "constrained partition lattices" (partitions of an indexed set respecting equivalence relations).

A systematic placement of $\mathcal P_{\mathrm{bip}}$ in algebraic combinatorics is open.

## Möbius function and Vassiliev cohomology

The Möbius function $\mu_{\mathcal P_{\mathrm{bip}}}$ enters the [bipartite Vassiliev spectral sequence](../../research-articles/bipartite-vassiliev-shapiro-vainshtein.md) as the differential at $E_1 \to E_2$. The conjectural product factorization (over blocks of the coarser partition) would give a tractable form for these differentials.

The Möbius function also gives the Euler characteristic of the order complex of $\mathcal P_{\mathrm{bip}}$, which is a topological invariant of the lattice.

## Open structural questions

- Möbius function product formula ([open](../../research-articles/questions/bipartite-mobius-product-formula.md)).
- Whether $\mathcal P_{\mathrm{bip}}$ is geometric, supersolvable, EL-shellable.
- Whether the Hodge-constrained sub-lattice has a clean description in terms of the chain complex's invariants.
- Whether $\mathcal P_{\mathrm{bip}}$ admits a "Specht module" or representation-theoretic interpretation analogous to $\Pi_n$ / $S_n$ representation theory.
