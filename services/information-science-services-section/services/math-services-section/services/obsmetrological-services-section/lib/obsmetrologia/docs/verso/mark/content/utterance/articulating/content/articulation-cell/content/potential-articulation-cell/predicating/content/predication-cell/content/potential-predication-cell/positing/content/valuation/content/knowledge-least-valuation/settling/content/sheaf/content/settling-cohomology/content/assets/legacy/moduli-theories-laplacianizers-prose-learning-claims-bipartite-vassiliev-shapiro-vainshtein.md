---
type: theorem
status: sketch
depends-on:
- closure-poset-of-strata
- bipartite-stratification-theorem
- stab-codim-formula
see-also:
- hilbert-degeneracy-stratification
- main-theorem-synthesis
classical-anchor:
- arnold-1995-hermitian-stratification
- shapiro-vainshtein-1995-alexander
references:
- key: arnold1995remarks
  type: article
  - Arnold, V. I.
  year: 1995
  title: Remarks on eigenvalues and eigenvectors of Hermitian matrices, berry phase, adiabatic connections and quantum Hall
    effect
  journal: Selecta Mathematica New Series
  volume: 1
  number: 1
  pages: 1–19
- key: shapiro1995stratification
  type: article
  - Shapiro, Boris
  - Vainshtein, Alek
  year: 1995
  title: Stratification of Hermitian matrices and the Alexander mapping
  journal: Comptes Rendus de l'Académie des Sciences. Série I, Mathématique
  volume: 321
  number: 12
  pages: 1599–1604
---

# Bipartite Vassiliev / Shapiro–Vainshtein cohomology

The cohomology-theoretic counterpart to the bipartite stratification theorem (`theorems/bipartite-stratification-theorem.md`). Where the stratification theorem describes the *geometry* of moduli (codim, stab, closure poset), this entry describes the *topology* (cohomology of strata and discriminant complement) via a bipartite extension of Vassiliev's spectral sequence and Shapiro–Vainshtein's Alexander mapping.

This is genuinely novel mathematical content beyond the classical anchors: while Arnold/Shapiro–Vainshtein/Vassiliev computed cohomology for univariate $\mathrm{Sym}^+_n$ and partition-lattice stratifications, the bipartite extension uses the bipartite multipartition lattice and chain-complex-respecting structure.

Status: framework set up, $E_1$ page formula stated, Alexander-duality conjecture stated, worked example on (2,2) chain. Full computation of the $E_2$ page for general bipartite cases is open.

## Classical Vassiliev (univariate)

For $\mathrm{Sym}^+_n$ stratified by eigenvalue partitions $\Pi$ of $\{1, \ldots, n\}$:

> **Vassiliev's spectral sequence** (Vassiliev, late 1980s–1990s; @arnold1995remarks for the Hermitian eigenvalue case):
> $$E_1^{p,q} = \bigoplus_{\Pi: \mathrm{codim}_\Pi = p} H^q\big(\mathrm{Stratum}(\Pi);\, \mathrm{or}_\Pi\big) \implies H^{p+q}\big(\mathrm{Sym}^+_n \setminus \mathrm{disc};\,\mathbb Z\big)$$
> where $\mathrm{disc}$ is the discriminant variety (union of strata with $\Pi$ non-trivial), $\mathrm{or}_\Pi$ is the orientation local system, and the sum is over partitions $\Pi$ of total codim $p$.

The $E_1$ page is computed from cohomology of individual strata, which are fiber bundles over the open simplex of distinct eigenvalues with fiber a real flag manifold $O(n) / \mathrm{stab}(\Pi)$.

> **@shapiro1995stratification**: the spectral sequence **degenerates at $E_2$**, with the $E_1 \to E_2$ differential given by the Möbius function of the partition lattice. The Alexander mapping computes Poincaré duals of stratum cohomology classes via intersection numbers across the closure poset.

The $E_2$-degeneration is structural: cohomology of the stratification is "as combinatorially clean as possible" — entirely determined by the closure poset and stratum cohomology, with no higher-page complications.

## Bipartite extension: setup

Let $(C_\bullet, d)$ be a finite-dim graded chain complex over $\mathbb R$ with $C_n$ of dim $m_n$. The moduli of inner products is $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$, dim $\sum_n \binom{m_n + 1}{2}$.

The bipartite multipartition lattice $\mathcal P_\mathrm{bip}$ stratifies $\mathcal H$ — strata are indexed by partitions $\Pi$ of $\bigsqcup_n \{1, \ldots, m_n\}$ that are *consistent with the Hodge identities forced by the chain complex*. The closure poset is the bipartite multipartition refinement order (`theorems/closure-poset-of-strata.md`).

The **(bipartite) discriminant** is
$$\mathrm{disc}_\mathrm{bip} := \mathcal H \setminus \mathrm{Stratum}(\Pi_{\min})$$
where $\Pi_{\min}$ is the minimum-coincidence stratum (Hodge-forced identifications only, no extra coincidences).

Goal: compute $H^*(\mathcal H \setminus \mathrm{disc}_\mathrm{bip}; \mathbb Z)$ — the cohomology of the simple-spectrum bipartite stratum.

## Bipartite Vassiliev spectral sequence

> **Theorem (bipartite Vassiliev spectral sequence, statement).** There exists a spectral sequence
> $$E_1^{p,q} = \bigoplus_{\Pi \in \mathcal P_\mathrm{bip}: \mathrm{codim}_\Pi = p} H^q\big(\mathrm{Stratum}(\Pi);\, \mathrm{or}_\Pi\big) \implies H^{p+q}\big(\mathcal H \setminus \mathrm{disc}_\mathrm{bip};\, \mathbb Z\big)$$
> indexed by the bipartite multipartition lattice $\mathcal P_\mathrm{bip}$, with $E_1^{0, q} = H^q(\mathrm{Stratum}(\Pi_{\min}))$ and the higher-codim strata contributing in higher $p$.

### Construction

Following Vassiliev's classical machinery: build a *simplicial resolution* of $\mathcal H$ relative to the bipartite stratification. For each $\Pi$ with closure relations $\Pi \le \Pi'$, glue along the closure. Filter by stratum codim. The associated spectral sequence has the stated $E_1$ page.

The construction transfers from Vassiliev's univariate machinery directly: the only piece that changes is the indexing lattice (bipartite multipartitions vs. univariate partitions) and the local cohomology of strata (real flag-manifold variants).

### $E_1$ page in bipartite combinatorics

Each $\mathrm{Stratum}(\Pi)$ is a fiber bundle:
$$\mathrm{Stratum}(\Pi) \to \mathrm{Spec}^*(\Pi),\quad \text{fiber} = G / \mathrm{stab}(\Pi)$$
where $\mathrm{Spec}^*(\Pi)$ is the open simplex of distinct eigenvalues compatible with $\Pi$, and $G$ is the gauge group (chain auto group) with stabilizer described by `theorems/stab-codim-formula.md`:
$$\dim \mathrm{stab}(\Pi) = \sum_B \sum_n \binom{k_n^B}{2}$$
where $k_n^B$ is the within-degree-$n$ multiplicity of block $B$.

So the cohomology of $\mathrm{Stratum}(\Pi)$ is determined by:
- The cohomology of the open simplex $\mathrm{Spec}^*(\Pi)$ — contractible (always).
- The cohomology of the homogeneous space $G / \mathrm{stab}(\Pi)$, a real partial flag manifold.

> **Lemma ($E_1$ page formula).**
> $$E_1^{p, q} = \bigoplus_{\Pi: \mathrm{codim}_\Pi = p} H^q\big(G / \mathrm{stab}(\Pi);\, \mathrm{or}_\Pi\big)$$
> where the homogeneous space $G / \mathrm{stab}(\Pi)$ is a real partial flag manifold whose block sizes are $(k_n^B)_{n, B}$ with $B$ ranging over blocks and $n$ over chain degrees.

The cohomology of real flag manifolds is computable via Schubert calculus; the bipartite block-size structure determines the specific flag type.

## Bipartite Shapiro–Vainshtein Alexander duality

> **Conjecture (bipartite $E_2$-degeneration and Alexander mapping).** The bipartite Vassiliev spectral sequence degenerates at $E_2$, and the differentials are computed from the Möbius function $\mu_{\mathcal P_\mathrm{bip}}$ of the bipartite multipartition lattice. The Alexander mapping
> $$\alpha: H^*\big(\overline{\mathrm{Stratum}(\Pi)}\big) \to H^{*+\mathrm{codim}(\Pi') - \mathrm{codim}(\Pi)}\big(\overline{\mathrm{Stratum}(\Pi')}\big)$$
> for $\Pi \le \Pi'$ in the closure poset realizes the Poincaré-dual intersection structure, generalizing @shapiro1995stratification.

### Why this should hold

Classical $E_2$-degeneration follows because:

1. The univariate partition lattice has a clean Möbius function (Stanley): $\mu(\hat 0, \hat 1) = (-1)^{n-1}(n-1)!$ for the full partition of $n$.

2. The strata have rational cohomology of homogeneous-space type, well-controlled.

3. The orientation local system is well-behaved.

For the bipartite case:

1. **Bipartite Möbius function.** Each block of a bipartite multipartition contributes a univariate Möbius factor: if $\Pi'$ refines $\Pi$ by splitting block $B$ into sub-blocks $B_1, \ldots, B_r$, then locally
$$\mu_{\mathcal P_\mathrm{bip}}(\Pi, \Pi') = \prod_{B \text{ split}} \mu_{\mathrm{univ}}\big(\text{partition of } B\big).$$
The overall Möbius function factors over blocks. Tractable in principle.

2. **Stratum cohomology.** Real flag manifolds have rational cohomology computable via Schubert calculus. The bipartite product structure (multiple chain degrees) gives products of partial-flag cohomologies, controllable.

3. **Orientation system.** The bipartite multipartition orientation extends naturally (each block contributes orientation of the corresponding eigenspace orbit).

So $E_2$-degeneration is plausible, but the precise differential at $E_1 \to E_2$ requires verification — this is the open piece.

## Worked example: (2, 2) chain complex with $d_1$ iso

The smallest case where bipartite content appears.

### Setup

$(C_0, C_1) = (\mathbb R^2, \mathbb R^2)$, $d_1: C_1 \to C_0$ an iso (rank 2).

$\mathcal H = \mathrm{Sym}^+_2 \times \mathrm{Sym}^+_2$, dim 6. Gauge group preserving $d_1 = I$: diagonal $O(2) \subset O(2) \times O(2)$.

Hodge identity forces nonzero spectra to coincide between $\Delta_0$ and $\Delta_1$.

### Bipartite multipartition lattice

Indexing set: $\{(0,1), (0,2), (1,1), (1,2)\}$ — 4 indices.

Hodge-minimum $\Pi_{\min}$: $\{\{(0,1), (1,1)\}, \{(0,2), (1,2)\}\}$ — 2 blocks of 2.

Refinement $\Pi_{\max}$: $\{\{(0,1), (1,1), (0,2), (1,2)\}\}$ — 1 block of 4.

Lattice $\mathcal P_\mathrm{bip} = \{\Pi_{\min}, \Pi_{\max}\}$ — just 2 elements (binary lattice).

### Codim and dim

In $\mathcal H$ (dim 6):
- $\mathrm{Stratum}(\Pi_{\min})$: open dense, dim 6.
- $\mathrm{Stratum}(\Pi_{\max}) = \{(Q_0, Q_1) : Q_0 = \lambda Q_1\}$, dim 4 (parametrized by $(Q_1, \lambda) \in \mathrm{Sym}^+_2 \times \mathbb R_{>0}$).
- Codim of $\Pi_{\max}$ in $\mathcal H$: 2.

The codim 2 decomposes as 1 (eigenvalue coincidence: 2 distinct values → 1 distinct value) + 1 (frame degree at the new 2-dim eigenspace, $\binom{2}{2} = 1$) — matching the cellular bipartite codim formula.

### Stratum cohomology

$\mathrm{Stratum}(\Pi_{\max}) = \mathrm{Sym}^+_2 \times \mathbb R_{>0}$ — contractible. So:
$$H^0(\Pi_{\max}) = \mathbb Z, \quad H^q(\Pi_{\max}) = 0\ \text{for}\ q \ge 1.$$

$\mathrm{Stratum}(\Pi_{\min}) = \mathcal H \setminus \mathrm{Stratum}(\Pi_{\max})$. Since $\mathcal H$ is contractible and $\Pi_{\max}$ is a smooth codim-2 submanifold, the complement deformation-retracts onto $S^1$ (linking circle around the codim-2 submanifold). So:
$$H^0(\Pi_{\min}) = \mathbb Z, \quad H^1(\Pi_{\min}) = \mathbb Z, \quad H^q(\Pi_{\min}) = 0\ \text{for}\ q \ge 2.$$

### $E_1$ page

Filtration by codim: $\Pi_{\min}$ at $p = 0$, $\Pi_{\max}$ at $p = 2$.

$E_1$ table:

| $q \backslash p$ | 0 | 1 | 2 |
|---|---|---|---|
| 0 | $\mathbb Z$ | 0 | $\mathbb Z$ |
| 1 | $\mathbb Z$ | 0 | 0 |

### Differentials and convergence

The spectral sequence converges to $H^*(\mathcal H \setminus \mathrm{disc}) = H^*(\Pi_{\min}) = (\mathbb Z, \mathbb Z, 0, \ldots)$.

For convergence, the $\Pi_{\max}$ contribution at $E_1^{2, 0}$ must die in the limit. The candidate differential is $d_2: E_2^{0, 1} \to E_2^{2, 0}$.

For full consistency: $d_2$ should be either 0 or non-zero in a specific way. The Alexander-duality argument predicts $d_2$ is the Möbius-function-weighted intersection number; for the binary lattice with $\mu(\Pi_{\min}, \Pi_{\max}) = -1$, $d_2$ realizes the linking-circle relation between the codim-2 stratum and the $H^1$-class of its complement. This realizes the Alexander duality $H^1(\Pi_{\min}) \cong H^0(\Pi_{\max})$ structurally.

The convergence: the Alexander class of the codim-2 stratum *is* the $H^1$ generator of the complement, so $d_2$ is *not* an iso but a specific intersection-pairing morphism. The spectral sequence degenerates at $E_2$ with both $E_\infty^{0, 1}$ and $E_\infty^{2, 0}$ contributing to $H^1(\mathcal H \setminus \mathrm{disc}) = \mathbb Z$ via the linking-class.

This recovers the topological fact that $\mathcal H \setminus \{\text{codim-2 submanifold}\} \simeq S^1$, with the $H^1$-generator coming from the linking circle around $\Pi_{\max}$.

### What the example demonstrates

1. **Framework consistency**: the bipartite Vassiliev SS produces a well-defined $E_1$ page from stratum cohomology + closure poset.

2. **$E_2$-degeneration**: in this binary case, holds trivially (only two strata).

3. **Alexander duality recovery**: the linking-circle $H^1$-class realizes the Alexander dual of the codim-2 stratum.

4. **Bipartite codim formula validates**: the codim 2 of $\Pi_{\max}$ in $\mathcal H$ matches the eigenvalue + frame-loss decomposition.

For larger bipartite cases (richer multipartition lattices), the spectral sequence will have more interesting $E_1 \to E_2$ differentials, and the $E_2$-degeneration becomes a substantive claim.

## Larger examples (open)

Concrete cases to compute next:

1. **$(3, 3)$ chain with $d$ iso.** Bipartite multipartition lattice on 6 indices, identifications $(0, i) \sim (1, i)$ forced by Hodge. The lattice has more elements (refinements of "3 blocks of 2" to coarser partitions), and the spectral sequence has more differentials. First test of the bipartite Möbius product formula.

2. **$(2, 1)$ chain (the EDD example).** $(C_0, C_1) = (\mathbb R^2, \mathbb R^1)$, $d_1: C_1 \to C_0$ rank 1. Hodge identifies the 1 nonzero eigenvalue of $\Delta_1$ with one of the 2 nonzero eigenvalues of $\Delta_0$. Gives a 3-element lattice (different identification choices). Test of orientation system in non-symmetric block sizes.

3. **$(2, 2, 1)$ longer chain.** Two boundary maps, more cross-degree identifications. Substantive bipartite combinatorics.

4. **Cellular sheaves.** When restricted to the cellular-sheaf gauge constraint (stalkwise diagonal), the bipartite Vassiliev decomposes per-degree (paralleling the IEP-G decomposition theorem). Spectral sequence may simplify.

## Status

**Framework laid; conjectures stated; one binary example worked.** The bipartite Vassiliev SS is set up, the $E_1$ page is computable in principle for any chain complex, and Alexander duality is conjectured to extend @shapiro1995stratification to the bipartite multipartition lattice.

Open work:
1. Verify $E_2$-degeneration on a larger lattice (e.g., $(3,3)$ case).
2. Compute the bipartite Möbius function explicitly as a product over blocks.
3. State the Alexander mapping precisely with bipartite orientation system.
4. Identify the structural consequences for moduli of Laplacianizations (e.g., the Euler characteristic of $\mathcal M_{\mathrm{Lap}}$ in terms of bipartite combinatorics).

This is the "stretch" frontier direction — substantial novel cohomological content, building directly on the proved bipartite stratification + closure-poset machinery.

## Connection to other entries

- **Bipartite stratification theorem** (`theorems/bipartite-stratification-theorem.md`): provides the strata.
- **Closure-poset theorem** (`theorems/closure-poset-of-strata.md`): provides the lattice structure for the spectral-sequence indexing.
- **Stab-codim formula** (`theorems/stab-codim-formula.md`): provides the stratum-cohomology fiber type (real partial flag manifold).
- **Hilbert-degeneracy stratification** (`theorems/hilbert-degeneracy-stratification.md`): the Stratification II at the SPD-cone boundary contributes additional cohomology classes when working in the algebraic closure $\overline{\mathcal H}$. A "compactified bipartite Vassiliev" combining both stratifications is an open direction.

## Open

1. **Bipartite Möbius function**: explicit formula via product over blocks; verify it factors as conjectured.

2. **$E_2$-degeneration on multi-element lattices**: verify in $(3,3)$, $(2,1)$ cases.

3. **Alexander mapping**: precise statement at the chain-complex level, with orientation system.

4. **Connection to intersection cohomology**: closure of strata in $\mathcal H$ gives singular varieties; intersection cohomology may be a more natural target than ordinary cohomology in the bipartite case.

5. **Cellular-sheaf restriction**: bipartite Vassiliev SS for cellular sheaves with diagonal gauge — does it decompose per-degree like the IEP-G theorem?

6. **Stratification II contribution**: the SPD-boundary strata contribute cohomology classes in the algebraic closure $\overline{\mathcal H}$. Combined Vassiliev SS over both stratifications.
