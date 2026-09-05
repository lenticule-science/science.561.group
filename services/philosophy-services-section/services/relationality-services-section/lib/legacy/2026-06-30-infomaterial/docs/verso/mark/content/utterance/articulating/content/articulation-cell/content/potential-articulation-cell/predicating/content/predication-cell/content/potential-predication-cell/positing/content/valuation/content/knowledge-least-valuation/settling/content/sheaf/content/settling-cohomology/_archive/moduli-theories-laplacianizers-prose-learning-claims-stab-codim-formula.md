---
type: theorem
status: proved
depends-on:
- hodge-laplacian
- moduli-of-laplacianizations
see-also:
- moduli-strata-classification
- gauge-fiber-structure
references:
- key: arnold1995remarks
  type: article
  authors:
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
  authors:
  - Shapiro, Boris
  - Vainshtein, Alek
  year: 1995
  title: Stratification of Hermitian matrices and the Alexander mapping
  journal: Comptes Rendus de l'Académie des Sciences. Série I, Mathématique
  volume: 321
  number: 12
  pages: 1599–1604
- key: barrett2017inverse
  type: article
  authors:
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
- key: schwahn2025einstein
  type: article
  authors:
  - Schwahn, Paul
  - Semmelmann, Uwe
  year: 2025
  title: Einstein metrics, their moduli spaces and stability
  eprint: '2507.18463'
  eprinttype: arxiv
---

# Stabilizer / codimension formulas at moduli strata

A refinement of the moduli theorem (`theorems/moduli-of-laplacianizations.md`) giving closed-form expressions for both the dimension of the unitary stabilizer in $G$ and the codimension of the stratum in $\mathcal M_{\mathrm{Lap}}$, in terms of the multipartition data labeling the stratum (`examples/moduli-strata-classification.md`).

## Setup

Fix a finite-dimensional graded chain complex $(C_\bullet, d)$ with rank profile $(r_n)$, $r_n = \mathrm{rank}\, d_n$. Let $G$ be its chain automorphism group.

A point $Q \in \mathcal H$ has Laplacian $\Delta = (\Delta_n)$. The *spectral stratum* of $Q$ is determined by the partition $\Pi$ of $\bigsqcup_n \{1, 2, \ldots, r_n\}$ whose blocks $B$ are the equivalence classes "$\{i \in d_n\text{-singular-values}, j \in d_{n'}\text{-singular-values} : (\sigma_i^{(n)})^2 = (\sigma_j^{(n')})^2\}$." A block $B \in \Pi$ has *internal sizes* $k_n^B := \#(B \cap \{1, \ldots, r_n\})$, with $|B| = \sum_n k_n^B$.

## Theorem

> **Stabilizer formula.**
> $$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}.$$
>
> **Codimension formula.**
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\text{stratum of } Q) = \sum_B (|B| - 1) = \left(\sum_n r_n\right) - \#\Pi.$$
>
> **Per-block discrepancy.** The signed contribution of a single block $B$ with composition $(k_n^B)_n$ to $(\dim \mathrm{stab}_G - \mathrm{codim})$ is
> $$\sum_n \binom{k_n^B}{2} - (|B| - 1).$$

## Proof of the codimension formula

The moduli of Laplacianizations on $(C_\bullet, d)$ is parameterized (modulo the $G$-action) by the multisets of squared singular values

$$\overline\sigma^{(n)} = \{(\sigma_i^{(n)})^2\} \in \mathrm{Sym}^{r_n}(\mathbb R_{>0}).$$

A stratum is defined by which of the $\sum_n r_n$ singular values coincide, i.e., by the partition $\Pi$. The codimension of this stratum equals the number of independent equality conditions imposed: each block $B$ with $|B|$ elements imposes $|B| - 1$ conditions (reducing $|B|$ free values to one).

Total codimension: $\sum_B (|B| - 1) = \sum_n r_n - \#\Pi$. $\square$

## Proof of the stabilizer formula

We compute the unitary chain automorphism Lie algebra at $Q$. Recall $\Delta_n = A_n + B_{n+1}$ where $A_n = d_n^* d_n$ acts on $C_n$ (supported on $\mathrm{im}\, d_n^*$) and $B_n = d_n d_n^*$ acts on $C_{n-1}$ (supported on $\mathrm{im}\, d_n$). The nonzero spectrum of $A_n$ equals the nonzero spectrum of $B_n$ (= squared singular values of $d_n$).

**Step 1: Eigenspace structure.** For $\lambda \in \mathrm{spec}(\Delta_n) \setminus \{0\}$ corresponding to block $B \ni \lambda$:

- The $\lambda$-eigenspace of $A_n$ in $\mathrm{im}\, d_n^* \subset C_n$ has dimension $k_n^B$ — equal to the number of $d_n$-singular-values in block $B$.
- The $\lambda$-eigenspace of $B_{n+1}$ in $\mathrm{im}\, d_{n+1} \subset C_n$ has dimension $k_{n+1}^B$.
- These two eigenspaces are Hodge-orthogonal (`concepts/hodge-laplacian.md`), and together they form the $\lambda$-eigenspace of $\Delta_n = A_n + B_{n+1}$, of total dimension $k_n^B + k_{n+1}^B$.

**Step 2: Unitary action on each eigenspace.** A unitary chain automorphism $u = (u_n)$ commutes with each $\Delta_n$, so each $u_n$ preserves each $\lambda$-eigenspace of $\Delta_n$. The chain conditions $u_{n-1} d_n = d_n u_n$ force $u_n$ to also preserve the Hodge decomposition of the eigenspace: $u_n$ restricts to a $Q$-orthogonal map on $\mathrm{im}\, d_n^*$-piece, and similarly on $\mathrm{im}\, d_{n+1}$-piece, separately.

So $u_n |_{\lambda\text{-eigenspace of } \Delta_n} \in O(k_n^B) \times O(k_{n+1}^B)$ — a direct product, with the chain condition forcing the splitting.

**Step 3: Counting independent generators.** The factor $O(k_n^B)$ on $\mathrm{im}\, d_n^*$-piece of $\Delta_n$'s eigenspace appears *also* as the factor on $\mathrm{im}\, d_n$-piece of $\Delta_{n-1}$'s eigenspace (via $d_n: \mathrm{im}\, d_n^* \to \mathrm{im}\, d_n$ being a unitary identification when restricted to compatible eigenspaces). The chain condition $u_{n-1} d_n = d_n u_n$ forces these two appearances of $O(k_n^B)$ to be the *same* element.

So each $O(k_n^B)$ factor (with $k_n^B \ge 2$) contributes its dimension $\binom{k_n^B}{2}$ to the stabilizer once, not twice.

**Step 4: Sum.** Summing over all blocks $B$ and all $n$:
$$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}. \qquad \square$$

## Verification on $\partial \Delta^2$

Generic stratum $\{(1), (1)\}$:
- $\dim \mathrm{stab} = \binom{1}{2} + \binom{1}{2} = 0$. ✓
- codim $= 0 + 0 = 0$. ✓

Supersymmetric stratum $\{(2)\}$ ($\sigma_1 = \sigma_2$):
- $\dim \mathrm{stab} = \binom{2}{2} = 1$. (The $O(2)$ on the 2-dim eigenspace of $\Delta_0$.)
- codim $= 1$.
- Per-block discrepancy: $\binom{2}{2} - 1 = 0$. Stab equals codim.

The Euclidean Laplacian on $\partial \Delta^2$ has spectrum $\{0, 3, 3\}$, and the stabilizer is $O(2) \times \pm 1$ (continuous part dim 1) — the $S_3$ vertex permutations are *inside* this $O(2)$ as a discrete subgroup, not adding to the dim.

## Verification on $\partial \Delta^3$

Generic stratum $\{(1,0)^3, (0,1)^3\}$:
- $\dim \mathrm{stab} = 0$, codim $= 0$. ✓

Supersymmetric stratum $\{(3,3)\}$:
- $\dim \mathrm{stab} = \binom{3}{2} + \binom{3}{2} = 3 + 3 = 6$. ✓ (Matches the $O(\mathrm{im}\, d_1) \times O(\mathrm{im}\, d_2^*)$ count from `examples/cellular-sheaf-on-tetrahedron-boundary.md`.)
- codim $= |B| - 1 = 6 - 1 = 5$. ✓
- Per-block discrepancy: $3 + 3 - 5 = 1$. Stab exceeds codim by 1.

Stratum $\{(3, 0), (0, 1)^3\}$ ($\sigma_1 = \sigma_2 = \sigma_3$, $\tau$'s distinct):
- $\dim \mathrm{stab} = \binom{3}{2} = 3$. (Just the $O(\mathrm{im}\, d_1) = O(3)$ on the 3-dim eigenspace.)
- codim $= (3-1) + 0 + 0 + 0 = 2$.
- Per-block discrepancy: $3 - 2 = 1$.

Stratum $\{(1, 1), (1, 0)^2, (0, 1)^2\}$ ($\sigma_1 = \tau_1$, others distinct):
- $\dim \mathrm{stab} = \binom{1}{2} + \binom{1}{2} + \cdots = 0$.
- codim $= 1$.
- Per-block discrepancy: $0 - 1 = -1$.

Stratum $\{(2, 1), (1, 0), (0, 1)^2\}$ (size-3 mixed block):
- $\dim \mathrm{stab} = \binom{2}{2} + \binom{1}{2} = 1$.
- codim $= (3-1) + 0 + 0 + 0 = 2$.
- Per-block discrepancy: $1 - 2 = -1$.

All consistent with the per-block formula.

## Structural meaning

The per-block discrepancy $\sum_n \binom{k_n^B}{2} - (|B| - 1)$ has a clean interpretation:

- **Within-$d_n$ multiplicities** ($k_n^B$ large for one $n$) contribute *quadratic* growth $\binom{k_n^B}{2}$ to stabilizer dim, but only *linear* growth $k_n^B - 1$ to codim. Excess: $\binom{k_n^B - 1}{2}$ per such block-piece.

- **Cross-$d_n$ identifications** (block has $k_n^B \ge 1$ for multiple $n$'s) contribute to codim but not to stabilizer — the chain conditions explicitly *kill* the would-be cross-rotations between $\mathrm{im}\, d_n^*$ and $\mathrm{im}\, d_{n+1}$ that an $O(k_n^B + k_{n+1}^B)$ on the full eigenspace would otherwise generate.

So the formula tracks *which kind of degeneracy*:
- Internal multiplicities are "deep" symmetry (more stab than codim).
- Cross-identifications are "shallow" symmetry (more codim than stab).

In Hodge-theoretic language: internal multiplicities reflect symmetry of the *algebraic* spectrum of a single boundary operator $d_n$; cross-identifications reflect coincidences of spectra of *different* boundary operators, which carry no extra unitary structure.

## Discrepancy between codim and stab

The stratification is **finer** than just stabilizer dimension or just codim — it requires the bipartite multipartition data. Two strata can have the same codim but different stab dim, and vice versa.

The per-block discrepancy makes precise what supersymmetric isospectrality gives at the level of moduli: a class of "deep symmetry" strata (within-$d_n$ multiplicities) where the stabilizer is *larger* than the codim suggests.

## Relationship to existing literature

**The univariate case is classical.** Stratification of Hermitian / real symmetric matrices by eigenvalue-multiplicity partition is a foundational subject:

- @arnold1995remarks, "Remarks on eigenvalues and eigenvectors of Hermitian matrices..." — [@arnold1995remarks] — sets up the stratification, computes spectral sequence, finds combinatorial identities.
- @shapiro1995stratification, "Stratification of Hermitian matrices and the Alexander mapping" — [@shapiro1995stratification] — computes Poincaré duality, Alexander mapping, $E_2$-degeneration of the spectral sequence.
- Inverse Eigenvalue Problem for Graphs (Barrett, Fallat, et al., 2017+) — [@barrett2017inverse] — studies which multiplicity partitions are realizable for symmetric matrices with prescribed graph pattern, with technology (SSP, SMP, minor-monotonicity) directly analogous to the laplacianizers framework.

In the univariate case (single chain space, single self-adjoint operator, modulo $O(n)$):
- $\dim \mathrm{stab} = \sum_B \binom{|B|}{2}$ is just $\dim \prod_B O(|B|)$ — classical.
- $\mathrm{codim} = \sum_B (|B|-1)$ is just the dimension count of multiplicity-imposing equations — classical.

The univariate piece of the laplacianizers stratum-classification is *not novel*; it is a rephrasing of Arnold's framework in our terms.

**The bipartite (multipartite) extension is novel.** When the chain complex has multiple boundary operators $d_1, d_2, \ldots$, strata of moduli are indexed by bipartite (or N-partite) multipartitions $(k_n^B)_{n,B}$, and the per-block formula

$$\sum_n \binom{k_n^B}{2} \quad \text{vs.} \quad |B| - 1$$

distinguishes within-$d_n$ multiplicities (positive contribution to stab − codim) from cross-$d_n$ identifications (negative). This bipartite/multipartite extension is not present in the Arnold–Shapiro–Vainshtein framework, which is univariate.

The chain automorphism quotient also generalizes the single-orthogonal-group quotient $\mathrm{Sym}^+_n / O(n)$ to the chain-coupled $G \backslash \mathcal H$. The structural consequence is the cross-$d_n$ identification effect: chain conditions kill the algebraic $O(k_n^B + k_{n+1}^B)$-rotation between $\mathrm{im}\, d_n^*$ and $\mathrm{im}\, d_{n+1}$, leaving only the block-diagonal $O(k_n^B) \times O(k_{n+1}^B)$.

The Euclidean Laplacian on highly-symmetric cell complexes ($\partial \Delta^n$, regular polytope boundaries) sits at the deepest stratum (highest stab dim, highest codim), as in the univariate case but with bipartite refinement.

## Connection to the Einstein moduli analog

[@schwahn2025einstein] describes the moduli of Einstein metrics as an orbifold stratified by $\dim \epsilon(g) = \dim \ker(\Delta_L - 2E)$. The Lichnerowicz $\Delta_L$ acts on tt-tensors (transverse traceless), and the IED dimension counts "infinitesimal Einstein deformations." 

This is the smooth-geometry analog of *internal* multiplicities in our formula: $\dim \epsilon(g)$ is the multiplicity of the $\Delta_L$-eigenvalue $2E$ on tt-tensors. The orbifold stabilizer is $\mathrm{Isom}(g)$, which acts on $\epsilon(g)$ and contributes a corresponding $O$-factor of dim $\binom{\dim \epsilon(g)}{2}$. This structurally matches our internal-multiplicity contribution, suggesting the stratum-labeling formalism extends to Riemannian-geometric Laplacianizations with the appropriate notion of "boundary operator" replaced by the Lichnerowicz operator.

The cross-$d_n$ identifications in our formalism have no obvious Einstein analog, because the smooth case typically has only one Laplacian operating per geometric structure — there is no "$\sigma$ vs $\tau$" split. So the smooth analog would be expected to satisfy: $\dim \mathrm{stab} = \sum_B \binom{|B|}{2}$, $\mathrm{codim} = \sum_B (|B|-1)$, *without* the cross-$d_n$ correction. The Einstein paper presumably proves something of this shape; verifying the exact statement is a follow-up.

## Open

1. **Equality of spectrally-defined and orbit-stabilizer strata.** The strata defined by spectral data (this file) and by stabilizer dim (orbit-stabilizer in moduli theorem) coincide as long as the moduli map is injective on $G$-equivalence classes — which is true by `examples/moduli-of-triangle-boundary.md` for $\partial \Delta^2$ and by the same argument for any chain complex. The full statement should be packaged.

2. **Stratum incidence relations.** Which strata are in the closure of which? A stratum $\Pi$ is in the closure of $\Pi'$ iff $\Pi$ refines $\Pi'$ (one can degenerate by merging blocks). This gives moduli the structure of a *poset of strata under refinement*, with the supersymmetric stratum at the top.

3. **Generalization to $\partial \Delta^4$ and beyond.** The 3-step bipartite formula generalizes to N-step. Computing examples for $\partial \Delta^4$ would confirm.
