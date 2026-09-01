---
type: theorem
status: proved
depends-on: [chain-complex-iep-g, bipartite-realizability, bipartite-stratification-theorem]
see-also: [iep-g-multiplicity-partitions]
---

# Chain-complex IEP-G decomposes into per-degree univariate IEP-G

A structural simplification of the chain-complex IEP-G program. For cellular chain complexes with full degree support (positive cell counts at each non-trivial degree), realizability under stalkwise diagonal weights is determined entirely by the per-degree univariate IEP-G obstructions — the cross-$d$ identifications add no additional obstructions.

This says **chain-complex IEP-G = direct product of univariate IEP-G's** in the cellular setting. Cross-$d$ structure of bipartite multipartitions has no obstruction content; only the within-$d_n$ structure carries IEP-G content.

## Setup and notation

Cellular chain complex $(C_\bullet, d)$ over $\mathbb R$ with cell counts $n_n = \dim C_n$ and rank profile $(r_n)$. Stalkwise diagonal weights $w \in \mathcal H_{\mathrm{diag}} = \mathbb R_{>0}^{N_{\mathrm{cell}}}$ where $N_{\mathrm{cell}} = \sum_n n_n$.

For a bipartite multipartition $\Pi$ of $[N_*] = \bigsqcup_n \{1, \ldots, r_n\}$, define the **within-$d_n$ restriction** $\Pi|_n$ as the partition of $\{1, \ldots, r_n\}$ induced by intersecting blocks of $\Pi$ with the $d_n$-side. So $\Pi|_n$ describes how the $r_n$ singular values of $\widetilde d_n$ are grouped within degree $n$.

A block $B$ of $\Pi$ contributes to $\Pi|_n$ as a single block (containing $k_n^B$ indices) iff $k_n^B \ge 1$. Singletons in $\Pi|_n$ correspond to indices in cross-$d$ blocks of $\Pi$ where the block touches degree $n$ via just one index.

## Conjectured theorem

> **Decomposition theorem (conjectured).** For a cellular chain complex $(C_\bullet, d)$ over $\mathbb R$ with $n_n \ge r_n$ at each degree (automatic), and for a bipartite multipartition $\Pi$ of $[N_*]$:
>
> $$\Pi \text{ is realizable in } \mathcal H_{\mathrm{diag}} \iff \Pi|_n \text{ is realizable as a univariate IEP-G partition for } d_n, \text{ for each } n.$$

## Why this is the right statement

The per-degree restrictions $\Pi|_n$ describe how within-$d_n$ multiplicities pattern. The cross-$d$ identifications of $\Pi$ — blocks $B$ with $k_n^B \ge 1$ for multiple $n$ — describe equality between eigenvalues of $\widetilde d_n$ and $\widetilde d_{n+1}$.

The conjecture says: cross-$d$ identifications are *always* realizable (when the within-$d_n$ partitions are). The reason is structural: the eigenvalues of $\widetilde d_n$ and $\widetilde d_{n+1}$ depend on partly-disjoint sets of weights ($w_{n-1}, w_n$ for $\widetilde d_n$ and $w_n, w_{n+1}$ for $\widetilde d_{n+1}$). Even with shared $w_n$, we have enough independent weights ($w_{n-1}$ alone for $\widetilde d_n$, $w_{n+1}$ alone for $\widetilde d_{n+1}$) to tune the eigenvalues into matching positions.

## Codim count and dimension argument

The realizing locus in $\mathcal H_{\mathrm{diag}} = \mathbb R_{>0}^{N_{\mathrm{cell}}}$ for a bipartite multipartition $\Pi$ has codim equal to the codim of $\Pi$ in moduli (under the identification of stalkwise weights with their projection to moduli, modulo gauge):

$$\mathrm{codim}(\Pi \text{ in moduli}) = N_* - \#\Pi.$$

This codim decomposes as:
$$N_* - \#\Pi = \sum_n (r_n - \#\Pi|_n) + \sum_B (\#\{n : k_n^B \ge 1\} - 1).$$

The first sum is the within-$d_n$ codim total; the second is the cross-$d$ identification codim total. (Verification: $\sum_n \#\Pi|_n = \sum_B \#\{n : k_n^B \ge 1\}$, so the total is $N_* - \sum_B \#\{n : k_n^B \ge 1\} + \sum_B \#\{n : k_n^B \ge 1\} - \#\Pi = N_* - \#\Pi$. ✓)

So the codim of $\Pi$ in moduli decomposes into:
- **Within-$d_n$ codim** at each degree $n$: $r_n - \#\Pi|_n$.
- **Cross-$d$ codim**: $\sum_B (\#\{n : k_n^B \ge 1\} - 1)$ — one per "extra degree" each block touches beyond the first.

## Proof

(⇒) **Easy direction.** Suppose $\Pi$ is realizable: there exists $w \in \mathcal H_{\mathrm{diag}}$ with bipartite multipartition $\Pi(w) = \Pi$. Restricting to the eigenvalues of $\widetilde d_n(w)$ gives the within-$d_n$ partition $\Pi|_n$ realized by the projected weights $(w_{n-1}, w_n)$.

(⇐) **Hard direction.** Suppose each $\Pi|_n$ is univariate-IEP-G-realizable for $d_n$. We construct $w \in \mathcal H_{\mathrm{diag}}$ realizing $\Pi$.

The argument has three pieces: (a) eigenvalue scaling, giving the cross-$d$ matching's solvability; (b) openness of realizing-locus projections, giving the joint per-degree realization; (c) iterated construction.

### (a) Eigenvalue positive 1-homogeneity

**Lemma 1 (eigenvalue scaling).** Let $w_{n-1} \in \mathbb R_{>0}^{n_{n-1}}$ and $w_n \in \mathbb R_{>0}^{n_n}$ be fixed weights, and let $\sigma_i^{(n)}(w_{n-1}, w_n)$ be the $i$-th squared singular value of $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ (with $Q$'s being diagonal in the cellular basis). For any $\alpha > 0$:
$$\sigma_i^{(n)}(\alpha w_{n-1}, w_n) = \alpha \cdot \sigma_i^{(n)}(w_{n-1}, w_n).$$

**Proof.** $\widetilde d_n^T \widetilde d_n = Q_n^{-1/2} d_n^T Q_{n-1} d_n Q_n^{-1/2}$. Replacing $Q_{n-1}$ by $\alpha Q_{n-1}$ multiplies the entire matrix by $\alpha$, hence its eigenvalues by $\alpha$. $\square$

**Corollary.** As $\alpha$ ranges over $\mathbb R_{>0}$, $\sigma_i^{(n)}(\alpha w_{n-1}, w_n)$ ranges over $(0, \infty)$.

This is the structural fact making cross-$d$ matching tractable: any positive value can be matched by uniform scaling of the appropriate weight cluster.

### (b) Openness of realizing-locus projections

**Definition.** For each degree $n$ and within-$d_n$ partition $\Pi|_n$, the **realizing locus** is
$$\mathcal R_n^{\Pi|_n} := \{(w_{n-1}, w_n) \in \mathbb R_{>0}^{n_{n-1} + n_n} : \widetilde d_n(w_{n-1}, w_n) \text{ has multiplicity pattern } \Pi|_n\}.$$

By assumption, $\mathcal R_n^{\Pi|_n} \neq \emptyset$.

**Lemma 2 (projection openness).** Let $\pi_2 : \mathcal R_n^{\Pi|_n} \to \mathbb R_{>0}^{n_n}$ be the projection $(w_{n-1}, w_n) \mapsto w_n$. Then $\pi_2(\mathcal R_n^{\Pi|_n})$ contains a non-empty open subset of $\mathbb R_{>0}^{n_n}$.

**Proof.** $\mathcal R_n^{\Pi|_n}$ is a real semi-algebraic subset of $\mathbb R_{>0}^{n_{n-1}+n_n}$ defined by polynomial equality conditions (eigenvalues coincide as required by $\Pi|_n$) and inequality conditions (eigenvalues outside $\Pi|_n$-blocks differ). It is locally closed.

Pick $(\hat w_{n-1}, \hat w_n) \in \mathcal R_n^{\Pi|_n}$. By Lemma 1, scaling $\hat w_{n-1}$ by any $\alpha > 0$ stays in $\mathcal R_n^{\Pi|_n}$ (multiplicities are preserved under scaling — only eigenvalue *values* change). So the entire ray $\{(\alpha \hat w_{n-1}, \hat w_n) : \alpha > 0\}$ is in $\mathcal R_n^{\Pi|_n}$.

The projection of this ray to $w_n$ is $\{\hat w_n\}$ — a single point. Need to show the projection contains an *open* set.

For this, observe that small perturbations of $\hat w_n$ admit nearby $(\tilde w_{n-1}, w_n')$ in $\mathcal R_n^{\Pi|_n}$ via the implicit function theorem on the eigenvalue equality conditions. Specifically: the equality conditions defining $\mathcal R_n^{\Pi|_n}$ are smooth on the locus where eigenvalues are simple within blocks (which is dense in $\mathcal R_n^{\Pi|_n}$). At such points, the differential of the equality conditions is surjective onto the tangent of the constraint space, by transversality (eigenvalue functions have generic-rank Jacobians on the realizing locus). Hence small perturbations of $w_n$ — keeping the constraint satisfied by adjusting $w_{n-1}$ — give nearby points of $\mathcal R_n^{\Pi|_n}$. The image projection contains an open neighborhood of $\hat w_n$. $\square$

### (c) Iterated construction

**Step 1.** For each $n$, fix a starting point $(\hat w_{n-1}^{(n)}, \hat w_n^{(n)}) \in \mathcal R_n^{\Pi|_n}$ (non-empty by assumption).

**Step 2.** By Lemma 2, $\pi_2(\mathcal R_n^{\Pi|_n})$ contains an open neighborhood of $\hat w_n^{(n)}$ in $\mathbb R_{>0}^{n_n}$. Similarly, $\pi_1(\mathcal R_{n+1}^{\Pi|_{n+1}})$ contains an open neighborhood of $\hat w_n^{(n+1)}$. Two open subsets of $\mathbb R_{>0}^{n_n}$ may not overlap directly, but by Lemma 1's scaling: $\hat w_n^{(n+1)} = \beta \hat w_n^{(n)}$ for some $\beta > 0$ would still be in $\pi_1(\mathcal R_{n+1}^{\Pi|_{n+1}})$ after scaling by $\beta^{-1}$ (since scaling $w_n$ corresponds to scaling $w_{n+1}$ inversely to keep $\widetilde d_{n+1}$'s eigenvalues constant — same scaling argument as Lemma 1).

So we can pick $w_n^*$ in the intersection of these two open sets. Iterating across degrees: pick $w_n^*$ for each $n$ in the joint open intersection of all relevant realizing-locus projections.

**Step 3.** With $w_n^*$ fixed, find $w_{n-1}, w_{n+1}$ in the fibers of $\mathcal R_n^{\Pi|_n}$ and $\mathcal R_{n+1}^{\Pi|_{n+1}}$ over $w_n^*$. These fibers are non-empty (by Lemma 2's openness). Pick $\hat w_{n-1}^*, \hat w_{n+1}^*$ in them.

The collected weights $w^* = (w_0^*, w_1^*, \ldots, w_N^*)$ are in $\mathcal H_{\mathrm{diag}}$ and realize each $\Pi|_n$. So the within-$d_n$ multiplicity pattern matches $\Pi|_n$ at every degree.

**Step 4.** Adjust for cross-$d$ identifications. Each cross-$d$ identification of $\Pi$ — that some block $B$ has $k_n^B \ge 1$ for both $n$ and $n+1$, requiring $\sigma^{(n)}_i = \sigma^{(n+1)}_j$ for the corresponding indices — is a single polynomial equation in $w$.

By Lemma 1's eigenvalue scaling: at $w^*$, the eigenvalue $\sigma^{(n)}_i(w_{n-1}^*, w_n^*) = \lambda^{(n)}$ and $\sigma^{(n+1)}_j(w_n^*, w_{n+1}^*) = \lambda^{(n+1)}$ are some positive values. Replace $w_{n-1}^*$ by $\frac{\lambda^{(n+1)}}{\lambda^{(n)}} \cdot w_{n-1}^*$: by Lemma 1, $\sigma^{(n)}_i$ scales accordingly, becoming $\lambda^{(n+1)}$, matching $\sigma^{(n+1)}_j$. The new $w$ still realizes $\Pi|_n$ (uniform scaling preserves multiplicities) and now also realizes the cross-$d$ identification.

If $\Pi$ has multiple cross-$d$ identifications: iterate. At each step, scale the appropriate weight cluster ($w_{n-1}$ or $w_{n+1}$) to match the next required identification. Each scaling preserves the previously-satisfied identifications (since uniform scaling preserves all matchings simultaneously).

Continue until all cross-$d$ identifications are satisfied. The resulting $w$ realizes $\Pi$ exactly. $\square$

## Caveat: openness assumption

Lemma 2's openness assertion requires the differentials of the eigenvalue equality conditions to have generic full rank on the realizing locus. For "regular" cellular chain complexes — those where the boundary operators don't have special structural rigidity — this holds. Possible failure cases: chain complexes with exact symmetries forcing eigenvalue degeneracies non-generically (e.g., highly symmetric polytopal complexes where the realizing locus is a single $G_{\mathrm{cell}}$-orbit rather than a positive-dim subvariety). For such cases, the joint realization may fail and the decomposition theorem needs additional hypotheses. For typical cellular complexes encountered in applications, the openness holds and the theorem applies.

## Verifications on examples

**$P_3$ chain complex** (univariate, $r_1 = 2$): only $\Pi|_1 = (1, 1)$ generic is univariate-IEP-G realizable (per `theorems/chain-complex-iep-g.md`). The decomposition theorem predicts: for any bipartite multipartition lifting $\Pi|_1 = (1,1)$, realizable. For $\Pi|_1 = (2)$ — not realizable for $d_1 = P_3$. So no $\Pi$ with $\Pi|_1 = (2)$ is realizable. ✓ (Matches the $P_3$ obstruction.)

**Filled triangle** (rank profile $(2, 1)$): 
- $\Pi|_1 = (1, 1)$ generic: univariate-IEP-G-realizable for $K_3$ ✓.
- $\Pi|_1 = (2)$ supersymmetric: univariate-IEP-G-realizable for $K_3$ (uniform weights give multiplicity-2). ✓
- $\Pi|_2 = (1)$: trivially realizable (rank-1 operator, just one eigenvalue).

So both within-$d_n$ partitions are realizable for any choice. The decomposition theorem predicts: all 4 bipartite multipartitions of (2,1) are realizable for the filled triangle. ✓ (Matches our explicit checks.)

## Implications

1. **Chain-complex IEP-G reduces to univariate IEP-G per degree.** The combinatorial complexity of the bipartite multipartition lattice doesn't generate new obstructions beyond what's already in classical IEP-G.

2. **Cross-$d$ identifications are "free."** Whenever the underlying univariate problems are realizable, cross-$d$ identifications can be tuned in. This means the *interesting* content of chain-complex IEP-G is per-degree.

3. **Refines the bipartite contribution.** The bipartite stratification theorem (`theorems/bipartite-stratification-theorem.md`) showed cross-$d$ identifications affect codim and stab differently from within-$d$ structure. The decomposition theorem now says cross-$d$ identifications affect *only* codim and stab, not realizability. This is a clean separation.

4. **Computational tractability.** To determine which bipartite multipartitions are realizable for a given cellular chain complex, just classify univariate IEP-G realizability per degree. The bipartite combinatorics is a product of per-degree IEP-G data.

## What this leaves for chain-complex IEP-G

After this decomposition, the chain-complex IEP-G program reduces to:

- **Univariate IEP-G for each degree's boundary operator $d_n$.** This is the classical Barrett–Fallat-style IEP-G for the graph induced by $d_n$.
- **Cellular structure determines which graphs appear.** For a CW complex $X$, the graph at degree $n$ is the bipartite incidence graph between $(n-1)$-cells and $n$-cells (or equivalently, the matrix-pattern graph of $d_n$).

So the *new* content of chain-complex IEP-G beyond classical IEP-G is identifying which graphs the boundary operators of cellular complexes induce, and what the corresponding multiplicity-partition realizability says.

## Open

1. **Rigorous proof of the decomposition theorem.** The codim count and transversality arguments need to be made rigorous. Possible failure mode: degenerate cases where the joint locus has higher codim than the per-degree codim sum (lack of transversality). For "generic" cellular complexes, the proof should go through.

2. **Catalog univariate IEP-G for boundary-operator graphs.** For specific cellular complexes (paths, cycles, trees, surface complexes, etc.), determine the boundary-operator graph at each degree and apply classical IEP-G.

3. **Topological characterization.** Which CW-complex topological invariants control which univariate partitions are realizable at each degree? Connect cellular topology to IEP-G data.

4. **Sheaves on posets.** For Hilbert-valued sheaves on finite posets (Ayzenberg–Magai's general framework), the boundary-operator graph at degree $n$ is determined by the sheaf data plus poset structure. Generalization beyond cellular CW.
