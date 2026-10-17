---
type: theorem
status: proved
depends-on:
- bipartite-stratification-theorem
- closure-poset-of-strata
- stab-codim-formula
see-also:
- iep-g-multiplicity-partitions
- cellular-sheaf-cofinality
- hilbert-degeneracy-stratification
references:
- key: barrett2017inverse
  type: article
  - Barrett, Wayne
  - Butler, Steve
  - Fallat, Shaun
  - Hall, H. Tracy
  - Hogben, Leslie
  - Lin, Jephian C.-H.
  - Shader, Bryan
  - Young, Michael
  year: 2017
  title: 'The inverse eigenvalue problem of a graph: Multiplicities and minors'
  eprint: '1708.00064'
  eprinttype: arxiv
---

# Bipartite realizability theorem

For any finite-dim chain complex over $\mathbb R$, every bipartite multipartition is realized as a stratum of the moduli of Laplacianizations. This says the stratification of $\mathcal M_{\mathrm{Lap}}$ identified by `theorems/bipartite-stratification-theorem.md` is *fully populated* — no spurious / empty strata in the unconstrained case.

The chain-complex generalization of part of the Inverse Eigenvalue Problem for Graphs (IEP-G) program ([@barrett2017inverse]): IEP-G asks which multiplicity partitions are realized for symmetric matrices with given graph-sparsity; we ask which bipartite multipartitions are realized for chain-complex Hilbert structures with no sparsity constraints. The unconstrained answer is "all"; the constrained (sparsity, sheaf-with-stalkwise-weights) version generalizes IEP-G's substantive obstructions and is open.

## Setup

Fix a finite-dimensional graded chain complex $(C_\bullet, d)$ over $\mathbb R$ with rank profile $(r_n)$, $r_n = \mathrm{rank}\, d_n$. Let $N_* = \sum_n r_n$.

For each multipartition $\Pi$ of the index set $[N_*] = \bigsqcup_n \{1, \ldots, r_n\}$ modulo $\prod_n S_{r_n}$, let $\mathrm{Stratum}(\Pi) \subset \mathcal M_{\mathrm{Lap}}$ be the corresponding stratum (`theorems/bipartite-stratification-theorem.md`).

**Realizability question.** For which $\Pi$ is $\mathrm{Stratum}(\Pi)$ non-empty?

## Theorem

> **Bipartite realizability theorem.** Let $(C_\bullet, d)$ be a finite-dim chain complex over $\mathbb R$ with rank profile $(r_n)$. Every bipartite multipartition $\Pi$ of $[N_*]$ has $\mathrm{Stratum}(\Pi)$ non-empty in $\mathcal M_{\mathrm{Lap}}(C_\bullet, d)$.

In words: with no sparsity constraints on the inner products, the chain complex's structure imposes no obstructions on which eigenvalue-coincidence patterns are achievable for the resulting Laplacian. Every combinatorial multipartition has a corresponding non-empty stratum.

## Proof

It suffices to construct, for each multipartition $\Pi$, a Hilbert structure $Q \in \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ such that the weighted boundary operators $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ have squared singular values realizing $\Pi$.

**Step 1: Reduction to standard form.** By Smith normal form (over $\mathbb R$, equivalently rank-revealing factorization), each boundary operator $d_n$ is conjugate via $\mathrm{GL}(C_n) \times \mathrm{GL}(C_{n-1})$ to a *standard form* $d_n^{\mathrm{std}}$:
$$d_n^{\mathrm{std}}: \mathbb R^{n_n} \to \mathbb R^{n_{n-1}}, \quad d_n^{\mathrm{std}}(e_i) = \begin{cases} f_i & 1 \le i \le r_n \\ 0 & i > r_n \end{cases}$$
where $\{e_i\}, \{f_i\}$ are basis adapted to the rank-revealing decomposition $C_n = \mathrm{im}\, d_n^* \oplus \ker d_n$ and $C_{n-1} = \mathrm{im}\, d_n \oplus \ker d_n^T$.

The chain complex is in standard form when consecutive $d_n^{\mathrm{std}}, d_{n+1}^{\mathrm{std}}$ satisfy $d_n^{\mathrm{std}} d_{n+1}^{\mathrm{std}} = 0$, which forces $\mathrm{im}\, d_{n+1}^{\mathrm{std}} \subset \ker d_n^{\mathrm{std}}$. Choosing the ranks-revealing bases consistently across $n$ achieves this.

Realizability is invariant under chain-complex isomorphism (since $G$-action is changed accordingly). So we may assume $d_n = d_n^{\mathrm{std}}$ for all $n$.

**Step 2: Decoupled per-degree construction.**

Pick distinct positive reals $\lambda_B > 0$, one per block $B \in \Pi$, all distinct from each other.

For each $n$, prescribe the squared singular values of $\widetilde d_n$ as the multiset

$$\{\lambda_B : B \in \Pi, k_n^B = 1\}^{(\text{per index})} \cup \{\lambda_B^{(k_n^B \text{ copies})} : B \in \Pi, k_n^B \ge 1\}$$

— more precisely, for each block $B$ with $k_n^B$ indices in the $d_n$-side, prescribe $k_n^B$ copies of $\lambda_B$ as squared singular values of $\widetilde d_n$.

This gives a multiset $\overline\sigma^{(n)}$ of $r_n$ positive reals (with multiplicities encoding the block-structure of $\Pi$ restricted to $d_n$-side).

**Step 3: Solve for $Q$ realizing the prescription.**

For each $n$, construct $Q_{n-1}, Q_n$ such that the squared singular values of $\widetilde d_n^{\mathrm{std}} = Q_{n-1}^{1/2} d_n^{\mathrm{std}} Q_n^{-1/2}$ are $\overline\sigma^{(n)}$.

In standard form, $d_n^{\mathrm{std}}$ acts as identity on $\mathrm{im}\, d_n^*$ and zero elsewhere. So
$$(\widetilde d_n^{\mathrm{std}})^T \widetilde d_n^{\mathrm{std}} = Q_n^{-1/2} (d_n^{\mathrm{std}})^T Q_{n-1} d_n^{\mathrm{std}} Q_n^{-1/2}.$$

Decompose $C_n = \mathrm{im}\, d_n^* \oplus \ker d_n$ (the standard-form Hodge decomposition). Block-decompose $Q_n$ as
$$Q_n = \begin{pmatrix} A_n & B_n \\ B_n^T & D_n \end{pmatrix}$$
where $A_n$ is on $\mathrm{im}\, d_n^*$, $D_n$ on $\ker d_n$, $B_n$ off-diagonal.

Similarly decompose $Q_{n-1}$ on $\mathrm{im}\, d_n \oplus \ker d_n^T$ as $\begin{pmatrix} A_{n-1}' & B_{n-1}' \\ {B'_{n-1}}^T & D_{n-1}' \end{pmatrix}$.

The equation $(\widetilde d_n^{\mathrm{std}})^T \widetilde d_n^{\mathrm{std}}$ on $\mathrm{im}\, d_n^*$ reduces to $A_n^{-1/2} A_{n-1}' A_n^{-1/2}$, and we want this to have prescribed eigenvalues $\overline\sigma^{(n)}$ (= squared singular values of $\widetilde d_n$).

**Sub-step 3a: Choose per-degree.** For each $n$, simultaneous diagonalization of $A_n$ and $A_{n-1}'$ achieves prescribed eigenvalues of $A_n^{-1/2} A_{n-1}' A_n^{-1/2}$:

Pick orthonormal basis on $\mathrm{im}\, d_n^*$. Let $A_n = I_{r_n}$ (positive-definite, in fact identity), and let $A_{n-1}' = \mathrm{diag}(\overline\sigma^{(n)})$ — diagonal with eigenvalues $\overline\sigma^{(n)}$. Then $A_n^{-1/2} A_{n-1}' A_n^{-1/2} = \mathrm{diag}(\overline\sigma^{(n)})$ has the prescribed eigenvalues.

**Sub-step 3b: Coordinate shared $Q_n$ across degrees.** The constraint: $Q_n$ appears in both $\widetilde d_n$ (as the right factor, on $\mathrm{im}\, d_n^*$) and $\widetilde d_{n+1}$ (as the left factor, on $\mathrm{im}\, d_{n+1}$, which is contained in $\ker d_n$).

In standard form, $\mathrm{im}\, d_{n+1}^{\mathrm{std}} \subset \ker d_n^{\mathrm{std}}$ — i.e., $\mathrm{im}\, d_{n+1}$ is in the *complement* of $\mathrm{im}\, d_n^*$ within $C_n$. So the requirement on $Q_n$ from $\widetilde d_n$ (which involves $A_n$ — the block on $\mathrm{im}\, d_n^*$) and the requirement from $\widetilde d_{n+1}$ (which involves $D_n$ — the block on $\ker d_n$, restricted further to $\mathrm{im}\, d_{n+1}$) are on **disjoint blocks** of $Q_n$.

Concretely: the part of $Q_n$ that affects $\widetilde d_n$'s singular values is the block $A_n$ on $\mathrm{im}\, d_n^*$. The part that affects $\widetilde d_{n+1}$'s singular values is the block of $Q_n$ on $\mathrm{im}\, d_{n+1} \subset \ker d_n$. These are different sub-blocks of $Q_n$, and can be chosen independently.

So we choose $A_n = I_{r_n}$ for $\widetilde d_n$, and we choose the sub-block of $Q_n$ on $\mathrm{im}\, d_{n+1}$ to match the prescribed $\overline\sigma^{(n+1)}$ for $\widetilde d_{n+1}$. The off-diagonal block $B_n$ of $Q_n$ is unconstrained — set to zero. The block $D_n$ of $Q_n$ on the *rest* of $\ker d_n$ (not in $\mathrm{im}\, d_{n+1}$) is also unconstrained — pick it to be identity.

This gives a positive-definite $Q_n$ that simultaneously realizes the prescribed singular values for both $\widetilde d_n$ and $\widetilde d_{n+1}$.

**Sub-step 3c: Iterate.** Apply Sub-steps 3a–3b for each $n$, with consistent choice of bases. The result: positive-definite $Q_0, Q_1, \ldots, Q_N$, hence $Q \in \mathcal H$, such that each $\widetilde d_n$ has the prescribed singular values $\overline\sigma^{(n)}$.

**Step 4: Verify realization.**

The squared singular values of $\widetilde d_n$ are $\overline\sigma^{(n)}$. The bipartite multipartition $\Pi(Q)$ of these singular values across all $n$:
- Indices in block $B$ have squared singular value $\lambda_B$ (regardless of which $d_n$ they sit on).
- Different blocks have different $\lambda_B$'s (we chose them distinct).

So $\Pi(Q) = \Pi$ exactly. Hence $[Q] \in \mathrm{Stratum}(\Pi)$, and the stratum is non-empty. $\square$

## Remarks on the proof

- **Smith normal form** is what makes the proof work cleanly. The fact that any chain complex over $\mathbb R$ has a standard form decoupling $\mathrm{im}\, d_n^*$ and $\ker d_n$ is what allows the per-degree blocks of $Q_n$ to be chosen independently.

- **No sparsity constraint** is used: $Q_n$ is allowed to be any positive-definite matrix. If we restricted to *diagonal* $Q_n$ (= cellular sheaf with stalkwise diagonal weights), the proof would *fail* because we wouldn't have enough freedom in $A_n, D_n$ to independently prescribe both blocks.

- **Distinct $\lambda_B$ values** are essential: if two blocks had the same $\lambda$, they would merge into one block, giving a coarser multipartition. The proof realizes the strict-$\Pi$ stratum exactly because the $\lambda_B$'s are distinct.

## Why this is a "Laplacianizability theorem" piece

Combined with the bipartite stratification theorem (`theorems/bipartite-stratification-theorem.md`):

> A finite-dim chain complex $(C_\bullet, d)$ over $\mathbb R$ admits a Hilbert lift; its moduli $\mathcal M_{\mathrm{Lap}}(C_\bullet, d) = G \backslash \mathcal H$ is a real algebraic orbifold whose strata are *fully and faithfully* indexed by bipartite multipartitions — every multipartition is realized (this theorem), with explicit codim/stab formulas (`stab-codim-formula.md`) and closure poset (`closure-poset-of-strata.md`).

## When realizability fails: chain-complex IEP-G

The proof above relies on **unconstrained** inner products $Q \in \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$. If we restrict to inner products with a sparsity pattern — most naturally, **stalkwise diagonal** inner products in the cellular-sheaf-on-poset setup — the proof breaks down.

Specifically, the cellular-sheaf framework restricts $Q_n$ to be diagonal in the cellular basis: $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{n_n, n})$ where $w_{i,n}$ is the weight on the $i$-th cell of degree $n$. This is a *highly* constrained sub-cone of $\mathrm{Sym}^+_{n_n}$ — codim $\binom{n_n}{2}$.

Within this constrained cone:
- The $A_n$ block of $Q_n$ is diagonal in a *fixed* basis (the cellular basis), not freely chosable.
- Simultaneous diagonalization of $A_n, A_{n-1}'$ requires coordinated bases, which the cellular structure may not allow.
- Some bipartite multipartitions become *unrealizable* — the chain-complex generalization of IEP-G's "non-realizable multiplicity partition" obstructions.

This is a substantial open direction. The IEP-G literature (Barrett, Fallat, et al., [@barrett2017inverse]) provides:
- The Strong Spectral Property and Strong Multiplicity Property as tools for proving realizability under sparsity.
- Minor-monotonicity arguments.
- Explicit answers for small graphs.

The chain-complex generalization should yield analogous tools for cellular complexes (or sheaves on posets) with stalkwise inner products: the chain-complex-IEP-G program.

## Open

1. **Cellular-sheaf realizability.** Characterize which bipartite multipartitions are realized for a cellular sheaf on a finite poset $P$ with stalkwise diagonal inner products. Direct generalization of IEP-G to chain complexes.

2. **SSP and SMP for chain complexes.** Define analogs of the Strong Spectral and Multiplicity Properties for chain complexes; verify they imply realizability under sparsity.

3. **Minor-monotonicity.** A "minor" of a chain complex (e.g., a sub-complex obtained by removing cells) — does the realizability set grow under "minor expansion" (adding cells), as in IEP-G?

4. **Sparsity in degree.** A finer constraint: each $Q_n$ diagonal in some specified basis, but with potentially different sparsity patterns at different degrees. This corresponds to non-uniform cellular sheaves.

The unconstrained theorem above is the baseline; the substantive content of chain-complex IEP-G is in the stalkwise-diagonal restriction (`theorems/chain-complex-iep-g.md`).
