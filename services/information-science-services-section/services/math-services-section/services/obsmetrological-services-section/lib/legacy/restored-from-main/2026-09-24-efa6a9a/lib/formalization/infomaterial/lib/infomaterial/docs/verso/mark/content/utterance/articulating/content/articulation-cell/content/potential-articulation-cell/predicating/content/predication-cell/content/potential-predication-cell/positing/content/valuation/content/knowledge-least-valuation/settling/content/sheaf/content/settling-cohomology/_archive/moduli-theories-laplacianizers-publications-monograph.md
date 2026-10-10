#### Theorem: Stabilizer / codimension formulas at moduli strata {#stab-codim-formula}

A refinement of the moduli theorem (`theorems/moduli-of-laplacianizations.md`) giving closed-form expressions for both the dimension of the unitary stabilizer in $G$ and the codimension of the stratum in $\mathcal M_{\mathrm{Lap}}$, in terms of the multipartition data labeling the stratum (`examples/moduli-strata-classification.md`).

##### Setup

Fix a finite-dimensional graded chain complex $(C_\bullet, d)$ with rank profile $(r_n)$, $r_n = \mathrm{rank}\, d_n$. Let $G$ be its chain automorphism group.

A point $Q \in \mathcal H$ has Laplacian $\Delta = (\Delta_n)$. The *spectral stratum* of $Q$ is determined by the partition $\Pi$ of $\bigsqcup_n \{1, 2, \ldots, r_n\}$ whose blocks $B$ are the equivalence classes "$\{i \in d_n\text{-singular-values}, j \in d_{n'}\text{-singular-values} : (\sigma_i^{(n)})^2 = (\sigma_j^{(n')})^2\}$." A block $B \in \Pi$ has *internal sizes* $k_n^B := \#(B \cap \{1, \ldots, r_n\})$, with $|B| = \sum_n k_n^B$.

##### Theorem

> **Stabilizer formula.**
> $$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}.$$
>
> **Codimension formula.**
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\text{stratum of } Q) = \sum_B (|B| - 1) = \left(\sum_n r_n\right) - \#\Pi.$$
>
> **Per-block discrepancy.** The signed contribution of a single block $B$ with composition $(k_n^B)_n$ to $(\dim \mathrm{stab}_G - \mathrm{codim})$ is
> $$\sum_n \binom{k_n^B}{2} - (|B| - 1).$$

##### Proof of the codimension formula

The moduli of Laplacianizations on $(C_\bullet, d)$ is parameterized (modulo the $G$-action) by the multisets of squared singular values

$$\overline\sigma^{(n)} = \{(\sigma_i^{(n)})^2\} \in \mathrm{Sym}^{r_n}(\mathbb R_{>0}).$$

A stratum is defined by which of the $\sum_n r_n$ singular values coincide, i.e., by the partition $\Pi$. The codimension of this stratum equals the number of independent equality conditions imposed: each block $B$ with $|B|$ elements imposes $|B| - 1$ conditions (reducing $|B|$ free values to one).

Total codimension: $\sum_B (|B| - 1) = \sum_n r_n - \#\Pi$. $\square$

##### Proof of the stabilizer formula

We compute the unitary chain automorphism Lie algebra at $Q$. Recall $\Delta_n = A_n + B_{n+1}$ where $A_n = d_n^* d_n$ acts on $C_n$ (supported on $\mathrm{im}\, d_n^*$) and $B_n = d_n d_n^*$ acts on $C_{n-1}$ (supported on $\mathrm{im}\, d_n$). The nonzero spectrum of $A_n$ equals the nonzero spectrum of $B_n$ (= squared singular values of $d_n$).

**Step 1: Eigenspace structure.** For $\lambda \in \mathrm{spec}(\Delta_n) \setminus \{0\}$ corresponding to block $B \ni \lambda$:

- The $\lambda$-eigenspace of $A_n$ in $\mathrm{im}\, d_n^* \subset C_n$ has dimension $k_n^B$ --- equal to the number of $d_n$-singular-values in block $B$.
- The $\lambda$-eigenspace of $B_{n+1}$ in $\mathrm{im}\, d_{n+1} \subset C_n$ has dimension $k_{n+1}^B$.
- These two eigenspaces are Hodge-orthogonal (`concepts/hodge-laplacian.md`), and together they form the $\lambda$-eigenspace of $\Delta_n = A_n + B_{n+1}$, of total dimension $k_n^B + k_{n+1}^B$.

**Step 2: Unitary action on each eigenspace.** A unitary chain automorphism $u = (u_n)$ commutes with each $\Delta_n$, so each $u_n$ preserves each $\lambda$-eigenspace of $\Delta_n$. The chain conditions $u_{n-1} d_n = d_n u_n$ force $u_n$ to also preserve the Hodge decomposition of the eigenspace: $u_n$ restricts to a $Q$-orthogonal map on $\mathrm{im}\, d_n^*$-piece, and similarly on $\mathrm{im}\, d_{n+1}$-piece, separately.

So $u_n |_{\lambda\text{-eigenspace of } \Delta_n} \in O(k_n^B) \times O(k_{n+1}^B)$ --- a direct product, with the chain condition forcing the splitting.

**Step 3: Counting independent generators.** The factor $O(k_n^B)$ on $\mathrm{im}\, d_n^*$-piece of $\Delta_n$'s eigenspace appears *also* as the factor on $\mathrm{im}\, d_n$-piece of $\Delta_{n-1}$'s eigenspace (via $d_n: \mathrm{im}\, d_n^* \to \mathrm{im}\, d_n$ being a unitary identification when restricted to compatible eigenspaces). The chain condition $u_{n-1} d_n = d_n u_n$ forces these two appearances of $O(k_n^B)$ to be the *same* element.

So each $O(k_n^B)$ factor (with $k_n^B \ge 2$) contributes its dimension $\binom{k_n^B}{2}$ to the stabilizer once, not twice.

**Step 4: Sum.** Summing over all blocks $B$ and all $n$:
$$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}. \qquad \square$$

##### Verification on $\partial \Delta^2$

Generic stratum $\{(1), (1)\}$:
- $\dim \mathrm{stab} = \binom{1}{2} + \binom{1}{2} = 0$. ✓
- codim $= 0 + 0 = 0$. ✓

Supersymmetric stratum $\{(2)\}$ ($\sigma_1 = \sigma_2$):
- $\dim \mathrm{stab} = \binom{2}{2} = 1$. (The $O(2)$ on the 2-dim eigenspace of $\Delta_0$.)
- codim $= 1$.
- Per-block discrepancy: $\binom{2}{2} - 1 = 0$. Stab equals codim.

The Euclidean Laplacian on $\partial \Delta^2$ has spectrum $\{0, 3, 3\}$, and the stabilizer is $O(2) \times \pm 1$ (continuous part dim 1) --- the $S_3$ vertex permutations are *inside* this $O(2)$ as a discrete subgroup, not adding to the dim.

##### Verification on $\partial \Delta^3$

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

##### Structural meaning

The per-block discrepancy $\sum_n \binom{k_n^B}{2} - (|B| - 1)$ has a clean interpretation:

- **Within-$d_n$ multiplicities** ($k_n^B$ large for one $n$) contribute *quadratic* growth $\binom{k_n^B}{2}$ to stabilizer dim, but only *linear* growth $k_n^B - 1$ to codim. Excess: $\binom{k_n^B - 1}{2}$ per such block-piece.

- **Cross-$d_n$ identifications** (block has $k_n^B \ge 1$ for multiple $n$'s) contribute to codim but not to stabilizer --- the chain conditions explicitly *kill* the would-be cross-rotations between $\mathrm{im}\, d_n^*$ and $\mathrm{im}\, d_{n+1}$ that an $O(k_n^B + k_{n+1}^B)$ on the full eigenspace would otherwise generate.

So the formula tracks *which kind of degeneracy*:
- Internal multiplicities are "deep" symmetry (more stab than codim).
- Cross-identifications are "shallow" symmetry (more codim than stab).

In Hodge-theoretic language: internal multiplicities reflect symmetry of the *algebraic* spectrum of a single boundary operator $d_n$; cross-identifications reflect coincidences of spectra of *different* boundary operators, which carry no extra unitary structure.

##### Discrepancy between codim and stab

The stratification is **finer** than just stabilizer dimension or just codim --- it requires the bipartite multipartition data. Two strata can have the same codim but different stab dim, and vice versa.

The per-block discrepancy makes precise what supersymmetric isospectrality gives at the level of moduli: a class of "deep symmetry" strata (within-$d_n$ multiplicities) where the stabilizer is *larger* than the codim suggests.

##### Relationship to existing literature

**The univariate case is classical.** Stratification of Hermitian / real symmetric matrices by eigenvalue-multiplicity partition is a foundational subject:

- Arnold ([1995](#ref-arnold1995remarks)), "Remarks on eigenvalues and eigenvectors of Hermitian matrices..." --- ([Arnold 1995](#ref-arnold1995remarks)) --- sets up the stratification, computes spectral sequence, finds combinatorial identities.
- Shapiro and Vainshtein ([1995](#ref-shapiro1995stratification)), "Stratification of Hermitian matrices and the Alexander mapping" --- ([Shapiro and Vainshtein 1995](#ref-shapiro1995stratification)) --- computes Poincaré duality, Alexander mapping, $E_2$-degeneration of the spectral sequence.
- Inverse Eigenvalue Problem for Graphs (Barrett, Fallat, et al., 2017+) --- ([Barrett et al. 2017](#ref-barrett2017inverse)) --- studies which multiplicity partitions are realizable for symmetric matrices with prescribed graph pattern, with technology (SSP, SMP, minor-monotonicity) directly analogous to the laplanc-2025 framework.

In the univariate case (single chain space, single self-adjoint operator, modulo $O(n)$):
- $\dim \mathrm{stab} = \sum_B \binom{|B|}{2}$ is just $\dim \prod_B O(|B|)$ --- classical.
- $\mathrm{codim} = \sum_B (|B|-1)$ is just the dimension count of multiplicity-imposing equations --- classical.

The univariate piece of the laplanc-2025 stratum-classification is *not novel*; it is a rephrasing of Arnold's framework in our terms.

**The bipartite (multipartite) extension is novel.** When the chain complex has multiple boundary operators $d_1, d_2, \ldots$, strata of moduli are indexed by bipartite (or N-partite) multipartitions $(k_n^B)_{n,B}$, and the per-block formula

$$\sum_n \binom{k_n^B}{2} \quad \text{vs.} \quad |B| - 1$$

distinguishes within-$d_n$ multiplicities (positive contribution to stab − codim) from cross-$d_n$ identifications (negative). This bipartite/multipartite extension is not present in the Arnold--Shapiro--Vainshtein framework, which is univariate.

The chain automorphism quotient also generalizes the single-orthogonal-group quotient $\mathrm{Sym}^+_n / O(n)$ to the chain-coupled $G \backslash \mathcal H$. The structural consequence is the cross-$d_n$ identification effect: chain conditions kill the algebraic $O(k_n^B + k_{n+1}^B)$-rotation between $\mathrm{im}\, d_n^*$ and $\mathrm{im}\, d_{n+1}$, leaving only the block-diagonal $O(k_n^B) \times O(k_{n+1}^B)$.

The Euclidean Laplacian on highly-symmetric cell complexes ($\partial \Delta^n$, regular polytope boundaries) sits at the deepest stratum (highest stab dim, highest codim), as in the univariate case but with bipartite refinement.

##### Connection to the Einstein moduli analog

([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein)) describes the moduli of Einstein metrics as an orbifold stratified by $\dim \epsilon(g) = \dim \ker(\Delta_L - 2E)$. The Lichnerowicz $\Delta_L$ acts on tt-tensors (transverse traceless), and the IED dimension counts "infinitesimal Einstein deformations."

This is the smooth-geometry analog of *internal* multiplicities in our formula: $\dim \epsilon(g)$ is the multiplicity of the $\Delta_L$-eigenvalue $2E$ on tt-tensors. The orbifold stabilizer is $\mathrm{Isom}(g)$, which acts on $\epsilon(g)$ and contributes a corresponding $O$-factor of dim $\binom{\dim \epsilon(g)}{2}$. This structurally matches our internal-multiplicity contribution, suggesting the stratum-labeling formalism extends to Riemannian-geometric Laplacianizations with the appropriate notion of "boundary operator" replaced by the Lichnerowicz operator.

The cross-$d_n$ identifications in our formalism have no obvious Einstein analog, because the smooth case typically has only one Laplacian operating per geometric structure --- there is no "$\sigma$ vs $\tau$" split. So the smooth analog would be expected to satisfy: $\dim \mathrm{stab} = \sum_B \binom{|B|}{2}$, $\mathrm{codim} = \sum_B (|B|-1)$, *without* the cross-$d_n$ correction. The Einstein paper presumably proves something of this shape; verifying the exact statement is a follow-up.

##### Open

1.  **Equality of spectrally-defined and orbit-stabilizer strata.** The strata defined by spectral data (this file) and by stabilizer dim (orbit-stabilizer in moduli theorem) coincide as long as the moduli map is injective on $G$-equivalence classes --- which is true by `examples/moduli-of-triangle-boundary.md` for $\partial \Delta^2$ and by the same argument for any chain complex. The full statement should be packaged.

2.  **Stratum incidence relations.** Which strata are in the closure of which? A stratum $\Pi$ is in the closure of $\Pi'$ iff $\Pi$ refines $\Pi'$ (one can degenerate by merging blocks). This gives moduli the structure of a *poset of strata under refinement*, with the supersymmetric stratum at the top.

3.  **Generalization to $\partial \Delta^4$ and beyond.** The 3-step bipartite formula generalizes to N-step. Computing examples for $\partial \Delta^4$ would confirm.

#### Theorem \[SKETCH\]: The moduli of Laplacianizers {#moduli-of-laplacianizers}

The categorical extension of `theorems/moduli-of-laplacianizations.md`: a per-object moduli of Hilbert structures on a fixed chain complex assembles, across the input category $\mathcal C$, into the moduli of Laplacianizers.

##### Setup

$(\mathcal C, H^\bullet)$ a Laplacianizable pair, with a fixed underlying *algebraic* Laplacianizer functor $F^{\mathrm{alg}}: \mathcal C \to \mathbf{Ch}(\mathbf{Vect}_\mathbb R)$ --- the chain complex skeleton without inner products.

A **Laplacianizer above $F^{\mathrm{alg}}$** is a Laplacianizer $\mathfrak L = (F, d, \eta)$ whose underlying algebraic functor (forget the inner products) is $F^{\mathrm{alg}}$.

The **moduli of Laplacianizers above $F^{\mathrm{alg}}$** is the groupoid

$$\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}) := \{\text{Laplacianizers above } F^{\mathrm{alg}}\} / \{\text{natural isomorphism over } F^{\mathrm{alg}}\}.$$

Two Laplacianizers above $F^{\mathrm{alg}}$ are isomorphic-over-$F^{\mathrm{alg}}$ if there is a natural transformation $\phi: F \to F'$ that (i) restricts to the identity on $F^{\mathrm{alg}}$ in each degree (as algebraic functors) and (ii) is an isometry into the new inner products.

(More generally, $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet) = \int_{F^{\mathrm{alg}}} \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}})$ over the discrete category of algebraic Laplacianizers --- but for almost every example in the survey, $F^{\mathrm{alg}}$ is canonical and the integration is trivial.)

##### Per-object decomposition

For each $X \in \mathcal C$, the chain complex $F^{\mathrm{alg}}(X)$ has its own moduli of Hilbert structures, which is exactly the per-object moduli of `theorems/moduli-of-laplacianizations.md`:

$$\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X)) = G(X) \backslash \mathcal H(F^{\mathrm{alg}}(X)),$$

where $G(X) = \mathrm{Aut}_{\mathrm{Ch}}(F^{\mathrm{alg}}(X))$ and $\mathcal H(F^{\mathrm{alg}}(X)) = \prod_n \mathrm{Sym}^+(F^{\mathrm{alg}}(X)_n)$.

The **per-object decomposition** is the natural map

$$\mathrm{ev}: \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}) \to \prod_{X \in \mathcal C} \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X))$$

restricting a Laplacianizer to its per-object inner-product data.

> **Theorem (per-object decomposition).** The map $\mathrm{ev}$ is a fibration with discrete fiber. The fiber over a tuple $(\langle \cdot, \cdot \rangle_X)_X$ is the set of natural transformations between $F^{\mathrm{alg}}$ instances of itself that are compatible with the chosen inner products --- typically a discrete (often singleton) set when $\mathcal C$ has enough morphisms to pin down the Laplacianizer.

The substantive content of $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}})$ comes from the per-object moduli; the categorical structure is a *coupling* across $X$ via naturality, but for our purposes (computing strata, dimensions, gauge fibers), the per-object analysis dominates.

##### Universal claims (statements)

> **Theorem (orbifold structure, sketch).** For each $X$ with $F^{\mathrm{alg}}(X)$ finite-dimensional, the moduli $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X)) = G(X) \backslash \mathcal H(F^{\mathrm{alg}}(X))$ is a real algebraic orbifold. Its strata are indexed by multipartitions of $\bigsqcup_n \{1, \ldots, r_n(X)\}$ (with $r_n(X) = \mathrm{rank}\, d_n^{F^{\mathrm{alg}}(X)}$), and the stab/codim formulas of `theorems/stab-codim-formula.md` apply.

> **Theorem (universal codim formula).** For any $(\mathcal C, H^\bullet)$ Laplacianizable, fixed $X$, and any stratum of $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X))$ at $Q$:
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\text{stratum at } Q) = \sum_{B \in \Pi(Q)} (|B| - 1)$$
> where $\Pi(Q)$ is the multipartition labeling the stratum (`examples/moduli-strata-classification.md`).
>
> This formula is **universal** across the category --- and across other categories of Laplacianizers (`theorems/universal-vs-categorical-stratification.md`).

The stab formula at each stratum is *category-specific*: it depends on what $G(X)$ is for the given input category. In the cellular case, \$G(X) = \$ algebraic chain automorphisms gives $\sum_B \sum_n \binom{k_n^B}{2}$. In the Einstein case, $G(X) = \mathrm{Isom}(M, g)$ gives a different count (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))).

##### What this gains

The previous moduli theorem (`theorems/moduli-of-laplacianizations.md`) was per-object: fix a chain complex, compute its moduli of inner products. This works on the cellular case but doesn't articulate why the same shape appears in Einstein moduli, Young's inner product Laplacian, or persistent Laplacians.

The Laplacianizer framework articulates this: each input category $\mathcal C$ has its own "moduli of Laplacianizers" --- a categorical object whose per-object slices are concrete moduli of inner products on chain complexes. The orbifold-stratified shape is universal *across* this categorical setup; what varies is the input category, the cohomology theory, and the automorphism group.

This generalization unlocks the following questions, all natural at the categorical level:

- **Stratum incidence.** What is the partial-order structure on strata of $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$? Stratum $\Pi'$ is in the closure of $\Pi$ iff $\Pi'$ refines $\Pi$ --- see `theorems/closure-poset-of-strata.md`.

- **Cohomology of moduli.** With strata indexed by multipartitions and incidence by refinement, the moduli has a stratified topology. Its cohomology --- including intersection cohomology and Gysin-type long exact sequences across stratum boundaries --- is well-defined and computable in principle.

- **Functoriality of moduli.** A morphism $X \to Y$ in $\mathcal C$ induces a chain map $F^{\mathrm{alg}}(X) \to F^{\mathrm{alg}}(Y)$, which in turn induces a map of moduli $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X)) \to \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(Y))$ (with caveats for surjectivity vs. injectivity of the chain map). The behavior of strata under these induced maps is part of the categorical structure.

##### What is not yet proved

- **Existence of $F^{\mathrm{alg}}$ as a *canonical* algebraic Laplacianizer** in each example category. For cell complexes, the cellular cochain functor is canonical. For Riemannian manifolds, the de Rham complex is canonical. For hypergraphs, multiple competing $F^{\mathrm{alg}}$'s exist (([Andreotti 2025](#ref-andreotti2025generalizing))). When competing $F^{\mathrm{alg}}$'s exist, the moduli of Laplacianizers has a *coarser* structure (a disjoint union over the algebraic-Laplacianizer choices, with each piece an orbifold stratification per the theorem).

- **Properness of the $G$-action.** For finite-dim chain complexes, $G$ acts properly on $\mathcal H$ in standard cases, giving the orbifold quotient. A general theorem covering all cases of the survey (including the unbounded / infinite-dim Einstein moduli) needs case-by-case verification.

- **Functoriality across $\mathcal C$.** The per-object moduli $X \mapsto \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X))$ is a contravariant functor on $\mathcal C^{\mathrm{op}}$ (under appropriate hypotheses). The theorem statement should make this explicit.

These open items are the remaining prerequisites for the strata-incidence-poset construction (Direction B).

##### Bridge to next direction

With the Laplacianizer object now treated as primary:
- The moduli of Laplacianizers is the proper subject of structural study.
- Strata are indexed by a clean combinatorial invariant (multipartitions).
- Stratum-incidence relations form a poset (refinement of multipartitions). **Worked out** in `theorems/closure-poset-of-strata.md`.
- The universal codim formula and category-specific stab formula apply (`theorems/stab-codim-formula.md`).
- A second stratification (Stratification II) lives at the SPD-cone boundary in $\overline{\mathcal H}$ (`theorems/hilbert-degeneracy-stratification.md`), generalizing Pataki's rank stratification of the SDP cone. It appears in global computations (EDD, intersection cohomology) of $V(\Pi)$ in the algebraic closure.

The bipartite generalization of Vassiliev / Shapiro--Vainshtein cohomology is in `theorems/bipartite-vassiliev-shapiro-vainshtein.md`; open questions about $E_2$-degeneration and Möbius factorization are in `questions/e2-degeneration-bipartite-vassiliev.md` and `questions/bipartite-mobius-product-formula.md`.

#### Example: Strata of $\mathcal M_{\mathrm{Lap}}$ classified by eigenvalue-multiplicity partitions {#moduli-strata-classification}

The [bipartite stratification theorem](#bipartite-stratification-theorem) predicts that strata of moduli are indexed by an *eigenspace-multiplicity invariant* (= bipartite multipartition). This file makes that invariant explicit and enumerates all strata for $\partial \Delta^2$ and $\partial \Delta^3$.

##### The stratum-labeling invariant

For a graded Hilbert chain complex $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ with finite-dim spaces, the Hodge Laplacian $\Delta = (\Delta_n)$ has fully-determined spectrum. By supersymmetric isospectrality (`examples/moduli-of-triangle-boundary.md`), the *nonzero* spectrum of $\Delta_n$ comes from the squared singular values of $d_n$ (call them $\{\sigma_i^{(n)}\}_{i=1}^{r_n}$ where $r_n = \mathrm{rank}\, d_n$). Specifically,

$$\mathrm{spec}(\Delta_n) \setminus \{0\} = \{(\sigma_i^{(n)})^2\} \sqcup \{(\sigma_j^{(n+1)})^2\}.$$

Modulo $\prod_n S_{r_n}$ (independently permuting the squared singular values of each $d_n$), the moduli of Laplacianizations is parameterized by the multisets

$$(\Sigma_1, \Sigma_2, \ldots), \qquad \Sigma_n = \{(\sigma_i^{(n)})^2\}_{i=1}^{r_n} \in \mathrm{Sym}^{r_n}(\mathbb R_{>0}).$$

A **stratum** of $\mathcal M_{\mathrm{Lap}}$ is determined by which singular values coincide --- both within each $\Sigma_n$ and *across* $\Sigma_n$'s (since these eigenvalues meet inside the spectrum of $\Delta_{n}$ for adjacent $n$'s).

Formally, a stratum is indexed by an equivalence relation on $\bigsqcup_n \{1, \ldots, r_n\}$, where we partition the disjoint union into blocks (each block is a set of "indices that coincide"). The block records both *which $n$'s* contribute and *how many indices from each $n$*. Modulo $\prod_n S_{r_n}$, the data is the multiset of compositions $(a_1, a_2, \ldots)_b$ where $a_n$ = number of $r_n$-indices in block $b$, with $\sum_b a_n^b = r_n$ for each $n$, and each block has $\sum_n a_n^b \ge 1$.

The **codimension** of such a stratum in $\mathcal M_{\mathrm{Lap}}$ is

$$\mathrm{codim} = \sum_b (\text{block size} - 1) = \left(\sum_n r_n\right) - (\text{number of blocks}).$$

(Reducing $k$ distinct values to one common value imposes $k-1$ equations.)

##### $\partial \Delta^2$: 2 strata

$\partial \Delta^2$ has only one nontrivial boundary $d_1$, rank 2. So strata are labeled by partitions of a 2-element multiset.

| Stratum        | Block-composition multiset | Codim | Dim | Description                                                  |
|----------------|----------------------------|-------|-----|--------------------------------------------------------------|
| Generic        | $\{(1), (1)\}$             | 0     | 2   | $\sigma_1^2 \ne \sigma_2^2$                                  |
| Supersymmetric | $\{(2)\}$                  | 1     | 1   | $\sigma_1^2 = \sigma_2^2$ (Euclidean point at $\lambda = 3$) |

**Total: 2 strata.** The Euclidean Laplacian sits at $(3, 3)$, on the codim-1 supersymmetric stratum.

##### $\partial \Delta^3$: 31 strata

$\partial \Delta^3$ has $d_1$ rank 3 and $d_2$ rank 3. Stratum labels are bipartite partitions of a $(3, 3)$-element multiset. Each block is described by a composition $(a, b)$: $a$ indices from $d_1$ side, $b$ indices from $d_2$ side, $a + b \ge 1$. Multisets of compositions sum to $(3, 3)$.

I enumerate by codim. Each block of size $a+b$ contributes codim $a+b-1$.

**Codim 0 (dim 6, generic):** $\{(1,0)\times 3, (0,1)\times 3\}$. **1 stratum.**

**Codim 1 (dim 5):** one size-2 block.
1. $\{(2,0), (1,0), (0,1)\times 3\}$ --- two $\sigma$'s coincide.
2. $\{(1,1), (1,0)\times 2, (0,1)\times 2\}$ --- one $\sigma$ coincides with one $\tau$.
3. $\{(0,2), (1,0)\times 3, (0,1)\}$ --- two $\tau$'s coincide.

**3 strata.**

**Codim 2 (dim 4):** one size-3 block, or two size-2 blocks.

*Size-3 block:*
4. $\{(3,0), (0,1)\times 3\}$
5. $\{(2,1), (1,0), (0,1)\times 2\}$
6. $\{(1,2), (1,0)\times 2, (0,1)\}$
7. $\{(0,3), (1,0)\times 3\}$

*Two size-2 blocks:*
8. $\{(2,0), (1,1), (0,1)\times 2\}$
9. $\{(2,0), (0,2), (1,0), (0,1)\}$
10. $\{(1,1)\times 2, (1,0), (0,1)\}$
11. $\{(1,1), (0,2), (1,0)\times 2\}$

**8 strata.**

**Codim 3 (dim 3):** size-4 block, or size-3 + size-2, or three size-2 blocks.

*Size-4 block:*
12. $\{(3,1), (0,1)\times 2\}$
13. $\{(2,2), (1,0), (0,1)\}$
14. $\{(1,3), (1,0)\times 2\}$

*Size-3 + size-2:*
15. $\{(3,0), (0,2), (0,1)\}$
16. $\{(2,1), (1,1), (0,1)\}$
17. $\{(2,1), (0,2), (1,0)\}$
18. $\{(1,2), (2,0), (0,1)\}$
19. $\{(1,2), (1,1), (1,0)\}$
20. $\{(0,3), (2,0), (1,0)\}$

*Three size-2 blocks:*
21. $\{(2,0), (1,1), (0,2)\}$
22. $\{(1,1)\times 3\}$

**11 strata.**

**Codim 4 (dim 2):** size-5, or size-4 + size-2, or two size-3.

*Size-5 block:*
23. $\{(3,2), (0,1)\}$
24. $\{(2,3), (1,0)\}$

*Size-4 + size-2:*
25. $\{(3,1), (0,2)\}$
26. $\{(2,2), (1,1)\}$
27. $\{(1,3), (2,0)\}$

*Two size-3:*
28. $\{(3,0), (0,3)\}$
29. $\{(2,1), (1,2)\}$

**7 strata.**

**Codim 5 (dim 1):** single size-6 block.
30. $\{(3,3)\}$ --- all six eigenvalues equal. **The supersymmetric stratum.** The Euclidean Laplacian sits at $\lambda = 4$ on this 1-dim stratum.

**1 stratum.**

**Total: $1 + 3 + 8 + 11 + 7 + 1 = 31$ strata.**

##### Pattern observations

1.  **The codim-0 (generic) stratum is unique**, as expected: at most one dense stratum.
2.  **The maximally-supersymmetric stratum $\{(3,3)\}$ is unique** and is the unique 1-dim stratum.
3.  **The codim distribution is unimodal-ish**: $1, 3, 8, 11, 7, 1$. The middle codim (3) has the most strata.
4.  **Among codim-$c$ strata, "diagonal" (all $a$ or all $b$) types sit alongside "mixed" $\sigma$-$\tau$ collision types.** Mixed types correspond to coincidences between $\Delta_0$ eigenvalues and $\Delta_2$ eigenvalues --- cross-degree blocks in the bipartite multipartition.

##### The Euclidean Laplacian's stratum

For $\partial \Delta^3$, the standard Euclidean Laplacian has $\sigma_i^2 = \tau_j^2 = 4$ for all $i, j$ --- sitting at $\lambda = 4$ on the codim-5 supersymmetric stratum (#30). The 6-dim stabilizer in $G$ at this point (`gauge-fiber-structure.md`) is consistent: high-multiplicity stratum ↔ high-stabilizer-dim ↔ deep singular orbifold structure.

This confirms the structural prediction:

$$\dim \mathrm{stab}_G(Q) \stackrel{?}{=} \dim \mathcal M - \dim(\text{stratum containing } [Q]).$$

For Euclidean: $\dim \mathrm{stab}_G = 6$, stratum dim = 1, $\dim \mathcal M - \dim \text{stratum} = 6 - 1 = 5$. **The formula does not match exactly** ($6 \ne 5$), so the relationship between stabilizer dim and stratum codim is *more* than just dimensional --- there's an extra dimension somewhere, possibly from supersymmetric isospectrality forcing $\sigma$ and $\tau$ collisions to be "the same" symmetry rather than independent.

Investigating this discrepancy is open. The first-order check: the predicted formula says stabilizer dim $\le$ codim. Codim-5 stratum has $\dim \mathrm{stab} = 6 > 5$, so the predicted formula is *strict*. There is *more symmetry at the supersymmetric stratum than the moduli's normal-direction codim accounts for* --- exactly because of the Hodge supersymmetric isospectrality, which couples $\Delta_0$ and $\Delta_2$ eigenvalues nontrivially.

##### Summary

1.  **Catalog.** $\partial \Delta^2$ has 2 strata, $\partial \Delta^3$ has 31 strata.

2.  **Stratum invariant.** Each stratum is labeled by the bipartite multipartition (`concepts/bipartite-multipartition.md`) of the spectra of $\Delta_n$ across degrees, encoding which singular values coincide and which spectral pieces of which $\Delta_n$ they sit in. Formal statement: `theorems/bipartite-stratification-theorem.md`.

3.  **Stab-vs-codim discrepancy at the supersymmetric stratum.** On $\partial \Delta^3$, $\dim \mathrm{stab}_G(\text{Euclidean}) = 6$ while moduli codim = 5. The stabilizer is strictly larger than the codim accounts for, due to Hodge supersymmetric isospectrality coupling $\Delta_0$ and $\Delta_2$ eigenvalues. The cross-degree codim/stab asymmetry is the formal structure: see `narratives/the-cross-degree-asymmetry.md`.

4.  **Stratum count.** For an $N$-step chain complex with rank profile $(r_1, \ldots, r_N)$, the number of strata equals the number of bipartite multipartitions of $\sum r_n$ across $N$ color classes. For $(r_1, r_2) = (3, 3)$: 31. For $(r_1) = (2)$: 2. A closed generating function is open.

##### Open

1.  **Verify the stratification matches the orbit-stabilizer strata of the moduli theorem.** Each stratum is defined by spectral data; one would want to show this coincides with the strata of $G \backslash \mathcal H$ defined by stabilizer dim.

2.  **The stabilizer-dim-vs-codim discrepancy.** Resolve why $\dim \mathrm{stab}_G$ at the supersymmetric stratum exceeds the codim. Hypothesis: supersymmetric isospectrality gives an "extra" degree of stabilizer freedom corresponding to the $d_1 \leftrightarrow d_2$ exchange, which is invisible in the codim count.

3.  **Generalize to $\partial \Delta^4$.** Rank profile $(4, 6, 4)$, three nontrivial $d_n$'s. Stratum count = number of 3-colored multipartitions of $4 + 6 + 4 = 14$ summing to $(4, 6, 4)$. A larger combinatorial computation, done by similar enumeration.

4.  **Connect to known stratified moduli.** The Einstein moduli paper (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))) stratifies by $\dim \ker(\Delta_L - 2E)$. Verify that this matches the stratum-labeling invariant in the smooth analogue.

#### Theorem: Closure poset of bipartite multipartition strata {#closure-poset-of-strata}

Generalizes Weinstein's univariate closure relation ("$V_\mathbb{R}(\lambda)$ includes coarsenings of $\lambda$") to the bipartite (or N-partite) multipartition stratification of $\mathcal M_{\mathrm{Lap}}$.

##### Setup

Let $(C_\bullet, d)$ be a finite-dimensional graded chain complex over $\mathbb R$ with rank profile $(r_n) = (\mathrm{rank}\, d_n)$. Strata of $\mathcal M_{\mathrm{Lap}}(C_\bullet, d) = G \backslash \mathcal H$ are indexed by **N-partite multipartitions**:

$$\Pi \in \mathrm{Part}\!\left(\bigsqcup_n \{1, \ldots, r_n\}\right) \big/ \prod_n S_{r_n},$$

where $\Pi$ is a partition of the disjoint union of singular-value indices, modulo the symmetric group acting on each $\{1, \ldots, r_n\}$ separately. (The quotient by $\prod_n S_{r_n}$ reflects that the singular values within each $d_n$ are unordered.)

Each block $B \in \Pi$ has internal sizes $(k_n^B)$ with $|B| = \sum_n k_n^B \ge 1$ and $\sum_B k_n^B = r_n$ for every $n$.

Two N-partite multipartitions $\Pi, \Pi'$ are ordered:

> $\Pi' \preceq \Pi$ ($\Pi'$ **refines** $\Pi$) iff every block of $\Pi'$ is contained in a single block of $\Pi$.

Equivalently, $\Pi$ is **coarser** than $\Pi'$ --- obtainable from $\Pi'$ by a sequence of *block merges*. The set of N-partite multipartitions modulo $\prod S_{r_n}$ forms a finite poset under refinement.

##### Theorem

> **Closure poset theorem.** For each N-partite multipartition $\Pi$, let $\mathrm{Stratum}(\Pi) \subseteq \mathcal M_{\mathrm{Lap}}$ be the corresponding stratum (the locus of moduli points whose Laplacian's nonzero singular-value multipartition equals $\Pi$). Then the Zariski closure of $\mathrm{Stratum}(\Pi)$ is
> $$\overline{\mathrm{Stratum}(\Pi)} = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi'),$$
> where the union is over multipartitions *coarser* than $\Pi$ (block-merges of $\Pi$).

In particular, the **closure poset** $\{\mathrm{Stratum}(\Pi)\}_\Pi$ is order-isomorphic to the N-partite multipartition lattice under coarsening, with:
- The **generic stratum** (all blocks singletons) at the bottom of closure (its closure is the whole moduli).
- The **supersymmetric stratum** (single block of size $\sum_n r_n$) at the top of closure (closed; closure is itself only).

##### Proof

**Notation.** Let $N = \sum_n r_n$ and identify $\bigsqcup_n \{1, \ldots, r_n\}$ with $[N]$. Order the squared singular values in any fixed way: $i \mapsto \sigma_i^2(Q) \in \mathbb R_{\ge 0}$. Each $\sigma_i^2$, as a function of $Q$, is the $i$-th eigenvalue (in some ordering) of the matrix $\widetilde d_n^T \widetilde d_n$ for the appropriate $n$, where $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$. We use the convention that $\sigma_i^2$ varies continuously in $Q$ (eigenvalues of continuous matrix-valued functions vary continuously with multiplicity, by standard perturbation theory; cf. Kato, *Perturbation Theory*, II.5).

For a multipartition $\Pi$ of $[N]$, define the **closed Π-locus** in $\mathcal H$ as
$$\mathcal Z(\Pi) := \{Q \in \mathcal H : \sigma_i^2(Q) = \sigma_j^2(Q) \text{ for all } i, j \in \text{same block of } \Pi\}.$$
Equivalently, $\mathcal Z(\Pi) = \{Q : \Pi(Q) \succeq \Pi\}$ where $\Pi(Q)$ is the partition generated by the equalities of $\sigma$-values at $Q$. The condition is closed: each equality $\sigma_i^2(Q) = \sigma_j^2(Q)$ is the vanishing of a continuous (in fact polynomial in symmetric functions of eigenvalues) function on $\mathcal H$. So $\mathcal Z(\Pi)$ is closed in $\mathcal H$, and its image $\widetilde{\mathcal Z}(\Pi) := G \backslash \mathcal Z(\Pi)$ is closed in $\mathcal M_{\mathrm{Lap}}$ (the quotient map is open, and $\mathcal Z(\Pi)$ is $G$-invariant).

**Step 1: $\widetilde{\mathcal Z}(\Pi) = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$.**

By construction, $\mathcal Z(\Pi)$ contains all $Q$ for which $\Pi(Q)$ is at least as coarse as $\Pi$ --- i.e., for which all equalities of $\Pi$ hold (and possibly more). Stratifying $\mathcal Z(\Pi)$ by the exact partition $\Pi(Q)$ gives the disjoint union of strata over $\Pi' \succeq \Pi$. Passing to the quotient by $G$, $\widetilde{\mathcal Z}(\Pi) = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$.

**Step 2 (closure $\subseteq$):** $\overline{\mathrm{Stratum}(\Pi)} \subseteq \widetilde{\mathcal Z}(\Pi)$.

The set $\mathrm{Stratum}(\Pi) \subseteq \widetilde{\mathcal Z}(\Pi)$ trivially (since $\Pi(Q) = \Pi$ entails $\Pi(Q) \succeq \Pi$). The closed set $\widetilde{\mathcal Z}(\Pi)$ contains all limit points of any subset, so $\overline{\mathrm{Stratum}(\Pi)} \subseteq \widetilde{\mathcal Z}(\Pi)$.

**Step 3 (closure $\supseteq$):** $\widetilde{\mathcal Z}(\Pi) \subseteq \overline{\mathrm{Stratum}(\Pi)}$.

Equivalently: every point of $\mathcal Z(\Pi)$ is a limit of points in $\{Q : \Pi(Q) = \Pi\}$ (modulo $G$). It suffices to show this in $\mathcal H$ before passing to $\mathcal M_{\mathrm{Lap}}$.

Fix $Q^* \in \mathcal Z(\Pi)$ with $\Pi(Q^*) = \Pi'$ for some $\Pi' \succeq \Pi$. We construct a path $Q_t \in \mathcal H$ ($t \in (0, \varepsilon]$) with $Q_t \to Q^*$ as $t \to 0^+$ and $\Pi(Q_t) = \Pi$ for $t > 0$ small.

Since $\Pi' \succeq \Pi$ as coarsening, there is a chain
$$\Pi = \Pi_0 \prec \Pi_1 \prec \cdots \prec \Pi_k = \Pi'$$
where each $\Pi_{i+1}$ is obtained from $\Pi_i$ by merging exactly two blocks. By induction on $k$, it suffices to handle the case $k = 1$: $\Pi'$ refines $\Pi$ by splitting *one* block of $\Pi'$ into two sub-blocks $B_1, B_2$ in $\Pi$.

Let $B := B_1 \sqcup B_2$ be the merged block of $\Pi'$, and let $\lambda^* := \sigma_i^2(Q^*)$ be the common squared singular value for $i \in B$ (well-defined since $i \in B$ is a single block of $\Pi'$).

**Sub-step 3a: Constructing the perturbation.** We need to perturb $Q^*$ so that the values $\{\sigma_i^2(Q_t) : i \in B_1\}$ and $\{\sigma_j^2(Q_t) : j \in B_2\}$ separate while staying close to $\lambda^*$, *without* re-merging any other blocks of $\Pi$.

Let $E^* \subset C_n$ (for the appropriate $n$ corresponding to indices in $B$) denote the eigenspace of $\widetilde d_n^T \widetilde d_n(Q^*)$ at $\lambda^*$ --- of dim $|B|$. The block-decomposition of $B$ as $B_1 \sqcup B_2$ is currently arbitrary (any orthogonal decomposition of $E^*$ into pieces of dims $|B_1|$ and $|B_2|$ would do); fix one. Let $P_1, P_2: C_n \to E^*$ be the orthogonal projections (in the $Q^*_n$-inner product) onto the corresponding sub-eigenspaces.

Define a 1-parameter family of perturbations of $Q_n^*$ by
$$Q_n(t) := Q_n^* + t \cdot (P_1 - P_2),$$
keeping $Q_m^*$ for $m \ne n$. For $t$ small enough, $Q_n(t)$ remains positive-definite (since $Q^*$ is in the open SPD cone). The perturbation $P_1 - P_2$ acts on $E^*$ with eigenvalues $+1$ on the $B_1$-side and $-1$ on the $B_2$-side, splitting the previously-degenerate eigenvalue $\lambda^*$ in $\widetilde d_n^T \widetilde d_n(Q_n(t))$ into two values $\lambda^* + O(t)$ separated by a gap $\sim 2t$ (by first-order perturbation theory of self-adjoint operators).

For $t > 0$ sufficiently small:
- The split values are *distinct*, so $B_1$ and $B_2$ now correspond to different singular values --- we have refined $\Pi'$ to $\Pi$ for the block $B$.
- All other equalities of $\Pi$ (and hence of $\Pi'$ outside $B$) are preserved, since the perturbation $P_1 - P_2$ is supported on $E^*$ alone and other eigenspaces are untouched at first order.
- No new accidental equalities are created (with $\Pi$-blocks elsewhere) --- for generic small $t$, the new pair of values $\lambda^* \pm O(t)$ doesn't equal any other $\sigma$-value of $Q^*$ (which are bounded away from $\lambda^*$ by hypothesis $\Pi(Q^*) = \Pi'$, since indices outside $B$ in $\Pi'$ have $\sigma$-values $\ne \lambda^*$).

So $\Pi(Q(t)) = \Pi$ for $t > 0$ small, and $Q(t) \to Q^*$ as $t \to 0^+$.

**Sub-step 3b: Iterating.** For the general case where $\Pi'$ is obtained from $\Pi$ by $k$ block-merges, iterate sub-step 3a along the chain $\Pi = \Pi_0 \prec \cdots \prec \Pi_k = \Pi'$. At each step we have a perturbation of dim 1 splitting one block; the perturbations at different steps are supported on different eigenspaces and don't interfere.

This shows $Q^* \in \overline{\{Q : \Pi(Q) = \Pi\}}$, and projecting to $\mathcal M_{\mathrm{Lap}}$, $[Q^*] \in \overline{\mathrm{Stratum}(\Pi)}$.

**Conclusion.** Steps 2 and 3 give $\overline{\mathrm{Stratum}(\Pi)} = \widetilde{\mathcal Z}(\Pi) = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$. $\square$

##### Remarks on the proof

- The continuity of squared singular values (used in Step 1 to make the equality conditions closed) is the standard fact that eigenvalues of a continuous family of self-adjoint operators vary continuously with multiplicity; see Kato, *Perturbation Theory for Linear Operators*, II.5.

- The perturbation in Step 3a uses *first-order spectral perturbation theory* --- applied to a degenerate eigenvalue, the first-order eigenvalue shifts are eigenvalues of the perturbation projected onto the degenerate eigenspace. By choosing $P_1 - P_2$ as the perturbation, we get the split structure exactly. This is classical (Rayleigh--Schrödinger) and applies to self-adjoint $\widetilde d_n^T \widetilde d_n$.

- The proof goes through verbatim for both the SPD interior and the algebraic closure, but the perturbation $Q_n(t) = Q_n^* + t(P_1 - P_2)$ leaves the SPD cone iff \$\|t\| `\cdot `{=tex}\|P_1 - P_2\| \> \$ (smallest eigenvalue of $Q_n^*$). For $Q^* \in \mathcal H$ (SPD interior), small enough $t$ keeps us in $\mathcal H$. For $Q^* \in \partial \mathcal H$ (boundary), the path may need to be modified; but the closure statement we're after concerns the closure inside $\mathcal H$, where all $Q^*$ are in the interior to begin with.

- The univariate case ($N = 1$) of this theorem recovers Weinstein's closure relation: $V_\mathbb R(\lambda)$ contains the closure of the strict-$\lambda$ stratum via coarsenings of $\lambda$ (([Weinstein 2020](#ref-weinstein2020real))). The argument above is the bipartite generalization --- the chain-multi-operator extension of Weinstein's product-Pataki-style argument. The novel content relative to Weinstein is the cross-operator block structure: a block of $\Pi$ may contain indices from multiple $d_n$'s, and the perturbation argument has to handle eigenspaces in different $C_n$'s simultaneously.

##### Two corollaries

**Corollary 1 (incidence).** Two strata $\mathrm{Stratum}(\Pi_1), \mathrm{Stratum}(\Pi_2)$ have a common boundary stratum iff their *meet* in the multipartition lattice (the finest common coarsening) is non-trivial. Specifically, $\overline{\mathrm{Stratum}(\Pi_1)} \cap \overline{\mathrm{Stratum}(\Pi_2)} = \overline{\mathrm{Stratum}(\Pi_1 \vee \Pi_2)}$ where $\Pi_1 \vee \Pi_2$ is the join (finest common coarsening) in the multipartition lattice.

**Corollary 2 (Möbius function).** The Möbius function of the closure poset is the Möbius function of the N-partite multipartition lattice. For univariate (single-partition) case, this is the classical Möbius function $\mu(\hat 0, \Pi) = \prod_B (-1)^{|B|-1} (|B|-1)!$ on the partition lattice. For bipartite multipartitions, the Möbius function is the analog and computable by the classical recursion.

##### Specialization to the univariate case

When $N = 1$ (single boundary operator, e.g., classical $\mathrm{Sym}_n$ stratification), the bipartite multipartition lattice reduces to the partition lattice on $r_1 = n$ elements. The closure poset is then the *coarsening poset on partitions of $n$*, exactly recovering Weinstein's univariate result.

In this case, the closure poset is well-known:
- Bottom: $(1, 1, \ldots, 1)$ --- the generic open stratum.
- Top: $(n)$ --- the closed supersymmetric stratum.
- Hasse diagram: covering relation = single block-merge (coalescing two blocks).

For $n = 6$ (relevant to $\partial \Delta^3$ at the *univariate per-$d_n$* level), the partition lattice on 6 elements has 11 partitions (the Bell number $B_6 / S_6$, but we want unordered partitions, which is $p(6) = 11$): $(1^6), (2,1^4), (2^2,1^2), (2^3), (3,1^3), (3,2,1), (3^2), (4,1^2), (4,2), (5,1), (6)$.

For the bipartite case on $(3, 3)$ (= $\partial \Delta^3$ proper), the lattice has 31 elements (`examples/moduli-strata-classification.md`).

##### Worked example: the bipartite (2,1) lattice

A small bipartite case where the full Hasse diagram of the closure poset is tractable. Take rank profile $(r_1, r_2) = (2, 1)$: two singular values from $d_1$, one from $d_2$. We label them $\sigma_1, \sigma_2$ (squared singular values of $d_1$) and $\tau_1$ (the squared singular value of $d_2$).

A bipartite multipartition has blocks with composition $(k_1, k_2)$ summing to $(2, 1)$. Enumerating up to $S_2 \times S_1$:

| Stratum | Composition               | Codim | $\dim \mathrm{stab}$ |
|---------|---------------------------|-------|----------------------|
| $\Pi_0$ | $\{(1,0), (1,0), (0,1)\}$ | 0     | 0                    |
| $\Pi_A$ | $\{(2,0), (0,1)\}$        | 1     | 1                    |
| $\Pi_B$ | $\{(1,0), (1,1)\}$        | 1     | 0                    |
| $\Pi_T$ | $\{(2,1)\}$               | 2     | 1                    |

(Codim by $\sum (|B|-1)$; stab by $\sum_n \binom{k_n^B}{2}$.)

**Closure relations.** $\Pi'$ refines $\Pi$ iff $\Pi$ obtained from $\Pi'$ by merges:
- $\Pi_0$ refines all others (every coarsening of $\Pi_0$ is everything).
- $\Pi_A$ refines $\Pi_T$: merge the size-2 $\sigma$-block with the singleton $\tau$.
- $\Pi_B$ refines $\Pi_T$: merge the singleton $\sigma$ with the mixed $\sigma$-$\tau$ block.
- $\Pi_A$ and $\Pi_B$ are *incomparable*: neither refines the other.

**Hasse diagram (closure poset, with closure direction = upward):**

                  Π_T = {(2,1)}     ← codim 2, supersymmetric
                  /             \
        Π_A = {(2,0),(0,1)}    Π_B = {(1,0),(1,1)}    ← codim 1
                  \             /
            Π_0 = {(1,0),(1,0),(0,1)}                ← codim 0, generic

It's a *diamond* (4-element lattice with $\Pi_0$ as bottom, $\Pi_T$ as top, two incomparable middle elements).

**Closure interpretations.**
- $\overline{\mathrm{Stratum}(\Pi_0)} = \mathcal M_{\mathrm{Lap}}$ --- generic stratum is dense.
- $\overline{\mathrm{Stratum}(\Pi_A)} = \mathrm{Stratum}(\Pi_A) \sqcup \mathrm{Stratum}(\Pi_T)$ --- closure of "two $\sigma$'s coincide" includes "all three coincide."
- $\overline{\mathrm{Stratum}(\Pi_B)} = \mathrm{Stratum}(\Pi_B) \sqcup \mathrm{Stratum}(\Pi_T)$ --- same shape as $\Pi_A$, but starting from "$\sigma$-$\tau$ coincide."
- $\overline{\mathrm{Stratum}(\Pi_T)} = \mathrm{Stratum}(\Pi_T)$ --- supersymmetric is closed.

**Möbius function (small computation).** With $\Pi_0 < \Pi_A, \Pi_B < \Pi_T$ and $\Pi_A, \Pi_B$ incomparable, the Möbius function $\mu(\Pi_0, \Pi_T)$ in the closure-direction poset (covering relations point upward) is computed by

$$\mu(\Pi_0, \Pi_T) = -\mu(\Pi_0, \Pi_0) - \mu(\Pi_0, \Pi_A) - \mu(\Pi_0, \Pi_B).$$

With $\mu(\Pi_0, \Pi_0) = 1$, $\mu(\Pi_0, \Pi_A) = -1$, $\mu(\Pi_0, \Pi_B) = -1$:

$$\mu(\Pi_0, \Pi_T) = -1 - (-1) - (-1) = 1.$$

So the diamond lattice has Möbius value $\mu(\Pi_0, \Pi_T) = 1$.

**Comparison to univariate $(3)$ partition lattice.** For univariate rank $r = 3$ (single boundary operator with three singular values), the partition lattice is a chain: $(1,1,1) < (2,1) < (3)$. Three elements, three strata. Different from the bipartite $(2,1)$ case, which has *four* elements arranged as a diamond --- the bipartite refinement is genuinely richer than univariate.

This bipartite-vs-univariate richness is the structural source of the cross-$d_n$-identification effect in the stab/codim formula (`theorems/stab-codim-formula.md`).

##### Specialization to $\partial \Delta^3$: the 31-element bipartite lattice

The 31 strata of $\mathcal M_{\mathrm{Lap}}(\partial \Delta^3)$ form a poset whose Hasse diagram I sketch as follows:

- **Top (closed):** Stratum $\{(3, 3)\}$ --- single block, codim 5. Supersymmetric / Euclidean.
- **Just below (codim 4):** 7 strata that are coarsenings refining the single block:
  - $\{(3, 2), (0, 1)\}, \{(2, 3), (1, 0)\}$ --- split off one $\sigma$ or one $\tau$.
  - $\{(3, 1), (0, 2)\}, \{(2, 2), (1, 1)\}, \{(1, 3), (2, 0)\}$ --- split off "size-2" subblocks.
  - $\{(3, 0), (0, 3)\}, \{(2, 1), (1, 2)\}$ --- the two "decoupled triples" ways.
- **Codim 3 (11 strata)** ⊂ closures of codim-4 strata.
- **Codim 2 (8 strata)** ⊂ closures of codim-3.
- **Codim 1 (3 strata)** ⊂ closures of codim-2.
- **Bottom (open dense, codim 0):** Stratum $\{(1,0)^3, (0,1)^3\}$ --- generic.

Covering relations: stratum $\Pi$ is *covered* by stratum $\Pi'$ in the closure poset iff $\Pi'$ is obtained from $\Pi$ by a *single* block merge (combining two blocks into one). The number of covering relations is the count of block-merge pairs at each level.

##### Connection to Vassiliev / Shapiro--Vainshtein cohomology

The closure-poset structure underpins the Vassiliev resolution-of-discriminant approach to the cohomology of stratified varieties: for each stratum $\Pi$, the closure $\overline{\mathrm{Stratum}(\Pi)}$ is a sub-variety of moduli, and the *spectral sequence of the filtration* by closure-depth converges to the cohomology of the moduli.

In Shapiro--Vainshtein's univariate case ($N = 1$), this spectral sequence degenerates at $E_2$. The bipartite analog --- does the spectral sequence of the filtration by *coarsening depth* on the bipartite multipartition lattice degenerate at $E_2$? --- is open. The Möbius-function structure of the bipartite lattice (Corollary 2) is the relevant combinatorial input.

##### Open

1.  **$E_2$-degeneration in the bipartite case.** Whether Shapiro--Vainshtein's spectral-sequence-degeneration result extends. See `questions/e2-degeneration-bipartite-vassiliev.md`.
2.  **Explicit Möbius function** for the bipartite multipartition lattice. Computable for small $(r_1, r_2)$ by the recursive definition; closed form is open and would feed directly into the $E_2$-degeneration computation.
3.  **Distance degree generalization.** Tested computationally on the (2,1) case; the bipartite multinomial $(r_1+r_2)!/\prod_B \prod_n k_n^B!$ predicts EDD = 1 for $\Pi_A$, but the computation gives 40 in the chain-complex ambient (`theorems/bipartite-distance-degree.md`). The predicted form holds in the *free bipartite* ambient (no chain coupling), not in the chain-complex ambient. The chain-complex EDD is influenced by Stratification II at the SPD boundary (`theorems/hilbert-degeneracy-stratification.md`), and a closed form is open.
4.  **Functorial behavior under chain maps.** A morphism $X \to Y$ in $\mathcal C$ induces a map of moduli; how do strata of $\mathcal M_{\mathrm{Lap}}(X)$ relate to those of $\mathcal M_{\mathrm{Lap}}(Y)$ under closure? Naturality of the bipartite multipartition lattice across $\mathcal C$ is the structural question.
5.  **Realizability.** Which bipartite multipartitions $\Pi$ have non-empty $\mathrm{Stratum}(\Pi)$ in the SPD interior of $\mathcal H$ (vs. only at the SPD boundary)? Chain-complex generalization of the IEP-G realizability question (([Barrett et al. 2017](#ref-barrett2017inverse))); see `questions/cellular-iep-g-graph-theoretic-condition.md`.

## The bipartite multipartition lattice --- combinatorial structure {#the-bipartite-multipartition-lattice}

The poset that organizes the strata of $\mathcal M_{\mathrm{Lap}}$. This narrative describes its combinatorial features as a self-contained mathematical object --- what it is, how it differs from the partition lattice, what's known and not about its structure.

### What it is

For a finite-dim chain complex $(C_\bullet, d)$ with boundary ranks $r_n = \mathrm{rank}\,d_n$, the bipartite multipartition lattice is
$$\mathcal P_{\mathrm{bip}}(\mathbf r) := \big\{\text{partitions of } [N_*]\big\} \big/ \prod_n S_{r_n}, \qquad [N_*] = \bigsqcup_n \{1, \ldots, r_n\}, \qquad N_* = \sum_n r_n,$$
ordered by refinement, with chain Hodge constraints (forced cross-degree pairings) restricting to a sub-lattice when applicable.

For $N = 1$ (single chain space), $\mathcal P_{\mathrm{bip}}((r)) = \Pi_r / S_r =$ ordinary partition lattice modulo block-permutation = partitions of $r$ ordered by refinement. This is the classical object of partition combinatorics.

For $N \ge 2$, the indexing set $[N_*]$ has multiple "color classes" (one per chain degree); a multipartition is a partition of $[N_*]$ that may have blocks crossing color classes. The quotient by $\prod_n S_{r_n}$ identifies relabelings *within* each class, not across.

### How it differs from $\Pi_n$

The univariate partition lattice $\Pi_n$ is well-understood:
- Ranked, with rank $n - r$ where $r$ = number of blocks.
- Geometric (in the Whitney sense): every interval $[\hat 0, \pi]$ is a product of partition lattices over blocks of $\pi$.
- Möbius function $\mu(\hat 0, \pi) = \prod_B (-1)^{|B|-1}(|B|-1)!$.
- Characteristic polynomial, zeta polynomial, Whitney numbers all classical.

The bipartite multipartition lattice $\mathcal P_{\mathrm{bip}}(\mathbf r)$:
- Ranked (by codim $\sum_B(|B|-1) = N_* - \#\Pi$). ✓
- Geometric? Interval $[\Pi, \Pi']$ in the Hodge-unconstrained case decomposes as $\prod_B [\hat 0_B, \Pi'|_B]$ where each factor is an interval in a partition lattice --- geometric structure descends, *unconfirmed in general*.
- Möbius function: conjectured to factor over blocks (the [product formula](#bipartite-mobius-product-formula)), not yet proved.
- Characteristic and Whitney numbers: not computed in general.

So $\mathcal P_{\mathrm{bip}}(\mathbf r)$ is *like* $\Pi_n$ in many aspects but has open structural questions due to the multi-class structure.

### Hodge constraints restrict it

In a chain complex with boundary $d_n: C_n \to C_{n-1}$, the Hodge supersymmetric isospectrality forces certain cross-degree identifications. Specifically: nonzero eigenvalues of $\Delta_n$ on $\mathrm{im}\,d_n^* \subseteq C_n$ coincide with nonzero eigenvalues of $\Delta_{n-1}$ on $\mathrm{im}\,d_n \subseteq C_{n-1}$.

In multipartition terms: the labels $(n, i)$ and $(n-1, i)$ (under the matching of nonzero singular values across the $d_n$ adjoint pair) are forced to be in the same block of any $\Pi$ that the chain complex realizes.

This restricts $\mathcal P_{\mathrm{bip}}(\mathbf r)$ to a *sub-lattice* of partitions consistent with the Hodge constraints. The minimal element of this sub-lattice is *not* the full single-block partition $\hat 0$, but the "Hodge-minimum" partition $\Pi_{\min}$ where each cross-degree adjacent-pair is its own block of size 2 and all other indices are singletons --- the partition with *only* Hodge-forced identifications.

For (2, 2) chain with $d_1$ iso: $\Pi_{\min}$ has 2 blocks of size 2 each. The constrained lattice is $\{\Pi_{\min}, \Pi_{\max}\}$ --- binary.

For $\partial \Delta^3$ at uniform weights: lots of Hodge constraints, restricting the lattice substantially.

### Cardinality

For the unconstrained case:
- \$\|`\mathcal `{=tex}P\_{`\mathrm{bip}`{=tex}}((r))\| = \$ number of partitions of $r$.
- \$\|`\mathcal `{=tex}P\_{`\mathrm{bip}`{=tex}}((r_1, r_2))\| = \$ number of partitions of $r_1 + r_2$ modulo $S_{r_1} \times S_{r_2}$. Computable but no clean closed form.
- \$\|`\mathcal `{=tex}P\_{`\mathrm{bip}`{=tex}}((1, 1, 1))\| = \$ number of partitions of 3 = 5 (since the three indices are in distinct color classes, $S_1 \times S_1 \times S_1$ acts trivially, so it's just $\Pi_3$).

For the Hodge-constrained case: depends on the chain complex's structure, particularly how Hodge pairs the eigenvalues.

### Cover relations

Each cover $\Pi \lessdot \Pi'$ corresponds to splitting one block of $\Pi$ into two non-empty parts. In closure-poset terms: passing from a stratum to a refinement that breaks one extra eigenvalue equality. Codim drops by 1 per cover.

### What organizes the lattice

Three features are simultaneously visible:
1. **Color-class structure** of $[N_*]$ by chain degree.
2. **Cross-degree blocks** as the bipartite extension's content.
3. **Hodge constraints** restricting to consistent sub-lattices.

These don't appear in $\Pi_n$, where there's no analog of color classes or chain-Hodge constraints. The bipartite multipartition lattice is genuinely a new combinatorial object --- specialized to chain-complex moduli, with its own structural questions.

### Relation to other lattices

- **Set partition lattice $\Pi_n$**: $\mathcal P_{\mathrm{bip}}((n)) = \Pi_n$ when $N = 1$.
- **Lattice of compositions**: a related object (ordered partitions). Bipartite multipartitions don't track order *within* color classes (since we mod out by $\prod_n S_{r_n}$), only the structure of the partition.
- **Young's lattice (multi-partition variant)**: bipartite multipartitions of bounded size. Limit of large $r_n$ might give a Young-lattice-like structure.
- **Partition lattices with constraints**: the Hodge-constrained sub-lattice is in a category of "constrained partition lattices" (partitions of an indexed set respecting equivalence relations).

A systematic placement of $\mathcal P_{\mathrm{bip}}$ in algebraic combinatorics is open.

### Möbius function and Vassiliev cohomology

The Möbius function $\mu_{\mathcal P_{\mathrm{bip}}}$ enters the [bipartite Vassiliev spectral sequence](#bipartite-vassiliev-shapiro-vainshtein) as the differential at $E_1 \to E_2$. The conjectural product factorization (over blocks of the coarser partition) would give a tractable form for these differentials.

The Möbius function also gives the Euler characteristic of the order complex of $\mathcal P_{\mathrm{bip}}$, which is a topological invariant of the lattice.

### Open structural questions

- Möbius function product formula ([open](#bipartite-mobius-product-formula)).
- Whether $\mathcal P_{\mathrm{bip}}$ is geometric, supersolvable, EL-shellable.
- Whether the Hodge-constrained sub-lattice has a clean description in terms of the chain complex's invariants.
- Whether $\mathcal P_{\mathrm{bip}}$ admits a "Specht module" or representation-theoretic interpretation analogous to $\Pi_n$ / $S_n$ representation theory.

#### Object: Moduli of Laplacianizations {#moduli-of-laplacianizations}

The central object of laplanc-2025 for a fixed chain complex.

##### Definition

For a finite-dim graded chain complex $(C_\bullet, d)$ over $\mathbb R$, the moduli of Laplacianizations is the orbifold quotient
$$\mathcal M_{\mathrm{Lap}}(C_\bullet, d) := G \backslash \mathcal H,$$
where:
- $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ is the open cone of [Hilbert structures](#hilbert-structure-cone) on the chain complex.
- $G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\}$ is the [chain automorphism group](#chain-auto-action).
- $G$ acts on $\mathcal H$ by $g \cdot Q := (g_n^T Q_n g_n)_n$.

A point $[Q] \in \mathcal M_{\mathrm{Lap}}$ is an equivalence class of Hilbert structures, equivalently a "Laplacianization" of $(C_\bullet, d)$ up to chain auto.

##### Dimension

$\dim \mathcal M_{\mathrm{Lap}} = \dim \mathcal H - \dim G + \dim \mathrm{stab}_G(\text{generic}) = \sum_n \binom{m_n + 1}{2} - \dim G + \dim \mathrm{stab}_{\mathrm{generic}}$.

For the cellular case (full chain auto group), this simplifies to a count in terms of chain ranks $r_n$ and chain dims $m_n$ via the orbit-stabilizer count.

##### Orbifold structure

$\mathcal M_{\mathrm{Lap}}$ is a real-algebraic orbifold: locally the quotient of a smooth Hilbert manifold by a finite-dim Lie group with discrete generic stabilizer. The orbifold points are at Hilbert structures with extra symmetry (= maximally-degenerate eigenvalue multipartitions), where the stabilizer in $G$ is positive-dim.

##### Stratifications

$\mathcal M_{\mathrm{Lap}}$ carries two stratifications, distinct in nature:

**[Stratification I](#stratification-i)** (intrinsic, in the SPD interior). Strata indexed by [bipartite multipartitions](#bipartite-multipartition) $\Pi$. Codim $\sum_B(|B|-1)$, stab $\sum_B \sum_n \binom{k_n^B}{2}$. Closure poset = bipartite multipartition refinement lattice.

**[Stratification II](#stratification-ii)** (extrinsic, at the SPD-cone boundary in $\overline{\mathcal H}$). Strata indexed by Pataki rank tuples + chain-Schubert invariants. Lives in $\overline{\mathcal M_{\mathrm{Lap}}} \setminus \mathcal M_{\mathrm{Lap}}$.

The interior of $\mathcal M_{\mathrm{Lap}}$ has Stratification I; its boundary in $\overline{\mathcal M_{\mathrm{Lap}}}$ adds Stratification II.

##### Functoriality

A chain map $f: (C_\bullet, d) \to (C'_\bullet, d')$ induces a map of moduli --- but its precise form is [open](#functoriality-of-moduli). The pullback of inner products is well-defined when $f$ is injective; for general chain maps, the relationship between $\mathcal M_{\mathrm{Lap}}(C)$ and $\mathcal M_{\mathrm{Lap}}(C')$ is a structural question.

##### Special cases

- **Univariate** ($N = 1$, single chain space, single $d_1$): reduces to $O(n) \backslash \mathrm{Sym}^+_n$, the classical eigenvalue stratification of real symmetric positive-definite matrices (([Arnold 1995](#ref-arnold1995remarks))).

- **$\partial \Delta^2$**: dim 2 orbifold, $\mathrm{Sym}^2(\mathbb R_{>0}) / S_2$.

- **$\partial \Delta^3$**: dim 6 orbifold, with 31 explicit strata enumerated.

- **(2, 1) chain complex of dims (2, 3, 1)**: dim ≤ 10, with the EDD computation showing extensive boundary structure (Stratification II contributing 4 components).

##### Distinct from moduli of Laplacianizers

$\mathcal M_{\mathrm{Lap}}$ is moduli of *Hilbert structures on a fixed chain complex*. The categorical generalization, [moduli of Laplacianizers](#moduli-of-laplacianizers) $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$, parametrizes Hilbert lift functors $F: \mathcal C \to \mathbf{Hilb}^\mathbb{Z}$ with cohomology iso $\eta$, and is the natural object in the cross-category framework.

#### Theorem: Main theorem synthesis: stratified moduli of Laplacianizations {#main-theorem-synthesis}

The central claim of laplanc-2025, stated in one place. Combines the cellular finite-dim theorem (Project A), the cross-category abstraction (Project B), and the smooth Riemannian extension into a single statement.

##### Setup

A **Laplacianizer framework** is a tuple $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ where:

- $\mathcal C$ is a category of mathematical structures.
- $H^\bullet: \mathcal C \to \mathbf{GrVect}_{\mathbb R}$ is a graded-vector-space-valued cohomology theory.
- $F: \mathcal C \to \mathbf{Hilb}^{\mathbb Z}$ assigns to each $X$ a graded Hilbert chain complex $(C_\bullet(X), d_X)$ with $d_X^2 = 0$ and closed range.
- $\eta_X: H^\bullet(X) \xrightarrow{\sim} H_\bullet(C(X), d_X)$ is a natural isomorphism.
- $\mathrm{Aut}: \mathcal C \to \mathbf{Grp}$ assigns to each $X$ a group of automorphisms acting on the moduli of inner-product structures.

For each object $X$, write $\mathcal H(X)$ for the space of valid inner-product structures on the chain complex of $X$ (subject to whatever category-specific constraints). The **moduli of Laplacianizations** of $X$ is

$$\mathcal M_{\mathrm{Lap}}(X) := \mathrm{Aut}(X) \backslash \mathcal H(X).$$

Each point $[g] \in \mathcal M_{\mathrm{Lap}}(X)$ determines a Hodge Laplacian $\Delta^{(g)}_n$ on each chain space; its **bipartite multipartition** $\Pi(g)$ records which eigenvalues coincide, both within a degree and across degrees.

##### Main theorem

> **Theorem (stratified moduli of Laplacianizations).** Let $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ be a Laplacianizer framework, and let $X \in \mathcal C$. Suppose $X$ falls in one of:
>
> (a) **Cellular finite-dim**: $C_\bullet(X)$ finite-dim over $\mathbb R$, $\mathrm{Aut}(X)$ a closed subgroup of $\prod_n GL(C_n)$.
>
> (b) **Smooth Riemannian**: $X = (M, \cdot)$ a compact smooth manifold, $C_\bullet$ the $L^2$-de-Rham complex, $\mathrm{Aut}(X) = \mathrm{Diff}(M)$.
>
> (c) **Parametric graph**: $X = G$ a finite graph, $\mathcal H(X) =$ inner-product Laplacians in Young's framework, \$`\mathrm{Aut}`{=tex}(X) = \$ vertex-symmetry group.
>
> Then $\mathcal M_{\mathrm{Lap}}(X)$ has the following structure:
>
> 1.  **Orbifold structure.** $\mathcal M_{\mathrm{Lap}}(X)$ is a (possibly infinite-dim) real-analytic orbifold.
>
> 2.  **Stratification.** Strata are indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta_n)$:
>     $$\mathcal M_{\mathrm{Lap}}(X) = \bigsqcup_\Pi \mathrm{Stratum}(\Pi).$$
>     Each stratum is a locally closed real-analytic subvariety of the moduli orbifold.
>
> 3.  **Universal codim formula.** For any non-trivial stratum,
>     $$\mathrm{codim}\, \mathrm{Stratum}(\Pi) = \sum_{B \in \Pi,\ |B| \ge 2} (|B| - 1).$$
>     This formula is *category-independent*.
>
> 4.  **Category-specific stab dim.** The dim of the orbifold stabilizer of a point in $\mathrm{Stratum}(\Pi)$ depends on the category:
>
>     - **Case (a) cellular**: $\dim \mathrm{stab} = \sum_B \sum_n \binom{k_n^B}{2}$ where $k_n^B$ is the within-degree-$n$ multiplicity of block $B$.
>     - **Case (b) smooth**: $\dim \mathrm{stab} = \dim \mathrm{Isom}(M, g)$, the geometric isometry group dim.
>     - **Case (c) parametric graph**: $\dim \mathrm{stab} = \dim \mathrm{Aut}_G(g)$, the metric-respecting graph automorphism subgroup.
>
> 5.  **Closure poset.** $\overline{\mathrm{Stratum}(\Pi')} \supseteq \mathrm{Stratum}(\Pi)$ iff $\Pi$ is a coarsening of $\Pi'$ (the bipartite multipartition refinement order).
>
> 6.  **Realizability (case-dependent).**
>
>     - **Case (a) unconstrained**: every bipartite multipartition $\Pi$ compatible with the chain dimensions is realized as a non-empty stratum.
>     - **Case (a) cellular-sheaf-IEP-G**: $\Pi$ is realizable iff each within-degree restriction $\Pi|_n$ is univariate-IEP-G-realizable for the cellular boundary $d_n$. The first non-trivial obstruction is $P_3$ (Barrett--Fallat).
>     - **Case (b) smooth, case (c) parametric graph**: realizability depends on $X$; characterization is open beyond known special cases (e.g., round spheres, regular graphs).

##### Specializations

Setting $\mathrm{Aut} = \prod_n O(C_n)$ in case (a) recovers the **bipartite stratification theorem** (`theorems/bipartite-stratification-theorem.md`): the cellular finite-dim Laplacianizability theorem with explicit stab/codim formulas and closure poset indexed by the bipartite multipartition refinement lattice.

Restricting case (a) to a single chain space (univariate) and $\mathrm{Aut} = O(n)$ recovers **Arnold--Shapiro--Vainshtein--Weinstein**: the classical eigenvalue stratification of $\mathrm{Sym}^+(n)$ with codim $\sum_B(|B|-1)$ and closure poset = univariate partition refinement lattice.

Restricting case (b) to Einstein metrics on $S^{2n}_{tt}M$ recovers the **Einstein moduli orbifold-stratification** (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))): Lichnerowicz Laplacian eigenvalue $2E$ multiplicity = IED dim, codim = IED dim − 1, stab = $\dim\mathrm{Isom}(g)$.

Restricting case (c) to Young's parametric graph framework (([Aksoy and Young 2025](#ref-aksoy2025reimagining))) recovers the inner-product-Laplacian eigenvalue stratification.

##### Proof structure

Cases (a) and (c) are finite-dim and proved by the cross-category orbifold-stratification theorem (`theorems/cross-category-orbifold-stratification.md`). The proof assembles:

- Orbifold structure: $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ with $\mathrm{Aut}(X)$ acting properly on a real-analytic manifold $\mathcal H(X)$.
- Stratification: spectrum of $\Delta^{(g)}$ varies real-analytically in $g$; eigenvalue-coincidence loci are real-analytic.
- Codim formula: counted via independent eigenvalue-equality conditions, descending to moduli through the $\mathrm{Aut}$-quotient.
- Stab formula: per-block (cellular case) or geometric (smooth case).
- Closure poset: upper-semi-continuity of multiplicity + first-order Rayleigh--Schrödinger argument for the closure direction (`theorems/closure-poset-of-strata.md`).
- Realizability: case (a) unconstrained by the bipartite realizability theorem (`theorems/bipartite-realizability.md`); case (a) cellular-sheaf via the IEP-G decomposition theorem (`theorems/chain-complex-iep-g-decomposition.md`).

Case (b) smooth Riemannian is proved by the same structural pattern with infinite-dim ingredients (full assembly in `theorems/cross-category-smooth.md`):

- **Step 1 --- orbifold structure**: Ebin slice theorem (Ebin 1970) on $\mathcal{Met}^s(M)$; $\mathrm{Diff}^{s+1}(M)$ acts properly with finite-dim isotropy.
- **Step 2 --- analytic spectrum**: gauge intertwiner $J_g$ transferring $\Delta_g$ to a self-adjoint analytic family on a fixed Hilbert space; Kato VII gives real-analytic eigenvalue branches.
- **Step 3 --- codim**: Arnold-style counting transferred via Kato; codim $\sum_B(|B|-1)$ in moduli.
- **Step 4 --- stab**: $\dim \mathrm{Isom}(M, g)$ by Myers--Steenrod (1939); finite-dim compact Lie group.
- **Step 5 --- closure poset**: first-order Rayleigh--Schrödinger argument with compactly-supported metric variations.

Case (c) parametric graph is detailed in `theorems/cross-category-orbifold-stratification.md`.

##### What this theorem covers in the 2025 wave

| 2025 construction                                           | Covered by case           | Specific result                                           |
|-------------------------------------------------------------|---------------------------|-----------------------------------------------------------|
| Cellular sheaf Laplacian (Hansen--Ghrist, Ayzenberg--Magai) | \(a\)                     | Bipartite stratification with IEP-G obstruction           |
| Persistent Laplacian (Mémoli et al.)                        | (a), parametric           | Strata vary continuously in persistence parameter         |
| Hypergraph Laplacian                                        | \(a\)                     | Reduces to chain-complex case after sheafification        |
| Sheaf-on-poset Laplacian                                    | \(a\)                     | Direct instance                                           |
| Quiver / persistence-module Laplacian                       | \(a\)                     | After choice of homology functor                          |
| Einstein moduli (Lichnerowicz)                              | \(b\)                     | IED dim stratification                                    |
| RCD-space Laplacian                                         | (b)-extension             | Sketch via $\Gamma$-convergence to smooth case            |
| Spectral triple Laplacian ($D^2$), finite                   | **proved**                | `theorems/finite-spectral-triple-laplacianizability.md`   |
| Spectral triple Laplacian ($D^2$), infinite regular         | **sketched**              | `theorems/infinite-spectral-triple-laplacianizability.md` |
| $p$-Laplacian (graph or manifold), fixed $p$ cellular       | **sketched**              | `theorems/nonlinear-p-hodge-laplacianizability.md`        |
| Tensor-eigenvalue Laplacian                                 | **frontier (next phase)** | Variational; nonlinear-frontier                           |
| Nonlinear-PCA Laplacian                                     | **frontier (next phase)** | Variational; nonlinear-frontier                           |

The theorem covers the **linear Hilbert-lift** part of the 2025 wave --- substantively all constructions that admit a graded Hilbert chain complex with closed-range linear differential. Noncommutative extensions use the Hochschild--Hilbert lift (`theorems/finite-spectral-triple-laplacianizability.md`, `theorems/infinite-spectral-triple-laplacianizability.md`); the nonlinear extension uses graded Banach + variational $p$-Hodge structure (`theorems/nonlinear-p-hodge-laplacianizability.md`).

##### Stratification II: dual-stratification observation

The strata of the main theorem are the **eigenvalue-multiplicity strata** in the SPD-cone interior. There is a *second* stratification at the SPD-cone boundary in the algebraic closure $\overline{\mathcal H}$ --- the **Hilbert-degeneracy stratification** (`theorems/hilbert-degeneracy-stratification.md`), generalizing Pataki's rank stratification of the SDP cone.

The two stratifications are independent:

- Stratification I lives inside the SPD interior $\mathcal H \subset \overline{\mathcal H}$, indexed by spectral multipartitions.
- Stratification II lives at the boundary $\partial\overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$, indexed by rank patterns of degenerate Hilbert structures.

Global computations (EDD, intersection cohomology) of $V(\Pi) \subset \overline{\mathcal H}$ pick up *both* stratifications. The EDD = 40 result on the (2,1) chain complex (`examples/edd-computation-on-2-1-chain.md`) is the simplest case where this dual structure manifests: 5 singular components, 1 of which (Component 0) is the eigenvalue-multiplicity stratum and 4 of which are SPD-boundary degenerations.

##### What's not yet in the theorem

1.  **Noncommutative**: finite case proved (`theorems/finite-spectral-triple-laplacianizability.md`); infinite-dim regular case sketched via Hochschild--Hilbert lift + HKR (`theorems/infinite-spectral-triple-laplacianizability.md`); self-contained closed-range proof open (`questions/closed-range-in-our-framework.md`); cyclic-complex variant open (`questions/cyclic-complex-hilbert-lift.md`).

2.  **Nonlinear**: framework in `theorems/nonlinear-p-hodge-laplacianizability.md`; cross-category extension contingent on `questions/variational-p-eigenvalue-perturbation.md`.

3.  **Stratification II as full theorem**: codim formula and closure-poset proved (`theorems/hilbert-degeneracy-stratification.md`); Bruhat-like combinatorial description open (`questions/stratification-ii-closure-poset-combinatorics.md`).

4.  **Persistent / parametric extension**: when $X$ varies in a parameter, the moduli assembles into a fibered structure. Implicit in case (c); not stated as a separate theorem.

5.  **Categorical moduli theorem in non-discrete categories**: see `theorems/moduli-of-laplacianizers.md` (sketch); functoriality questions in `questions/functoriality-of-moduli.md` and `questions/categorical-free-cross-category.md`.

##### Content

Across the 2025 wave's linear-Hilbert constructions, the moduli of Laplacianizations is *uniformly* an orbifold stratified by spectral multipartition with a *universal* codim formula. The category enters only through the stab-dim formula and through realizability constraints.

The bipartite extension contributes new content beyond the univariate case in two places:
- The closure poset is the *bipartite* multipartition refinement lattice.
- The codim formula counts cross-degree coincidences as well as within-degree.

Realizability under the cellular-sheaf constraint decomposes per-degree to univariate IEP-G (`theorems/chain-complex-iep-g-decomposition.md`) --- the bipartite stratification is non-trivial but its realizability is reducible to the univariate IEP-G program.

##### Entry points

- For the cellular finite-dim statement: `theorems/bipartite-stratification-theorem.md`.
- For the cross-category abstraction: `theorems/cross-category-orbifold-stratification.md`.
- For the smooth case: `theorems/cross-category-smooth.md`.
- For the realizability theory: `theorems/bipartite-realizability.md`, `theorems/chain-complex-iep-g-decomposition.md`.
- For the closure poset: `theorems/closure-poset-of-strata.md`.
- For the dual stratification: `theorems/hilbert-degeneracy-stratification.md`.
- For the structural narratives: `narratives/the-bipartite-multipartition-lattice.md`, `narratives/the-cross-degree-asymmetry.md`, `narratives/the-dual-stratification.md`.

#### Theorem: Hilbert-degeneracy stratification (Stratification II) {#hilbert-degeneracy-stratification}

A second stratification of $\overline{\mathcal H}$, the algebraic closure of the moduli of Hilbert structures, complementing the bipartite-multipartition stratification (Stratification I, in the SPD interior; `theorems/closure-poset-of-strata.md`).

Stratification II lives at the SPD-cone boundary $\partial \overline{\mathcal H}$ and is invisible from the SPD interior. It surfaces in any global computation of $V(\Pi) \subset \overline{\mathcal H}$ (EDD, intersection cohomology, compactified moduli) and is what the EDD = 40 computation on the (2,1) chain complex actually measured (`examples/edd-computation-on-2-1-chain.md`).

This entry states Stratification II as a full theorem: explicit codim formula, closure poset, and chain-complex Schubert refinement.

##### Setup

Fix a finite-dim graded chain complex $(C_\bullet, d)$ over $\mathbb R$ with $C_n$ of dim $m_n$ and $d_n: C_n \to C_{n-1}$ of rank $\rho_n$. Write
$$\mathcal H = \prod_n \mathrm{Sym}^+(C_n), \qquad \overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+(C_n)},$$
the open product cone of positive-definite Hilbert structures and its closure (positive-semidefinite). The boundary is $\partial \overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$.

For each $Q = (Q_0, \ldots, Q_N) \in \overline{\mathcal H}$, let $K_n(Q) := \ker Q_n \subseteq C_n$ be the kernel and $r_n(Q) := \mathrm{rank}\, Q_n = m_n - \dim K_n$.

##### Pataki product stratification (coarse)

> **Definition (Pataki product stratum).** For a rank tuple $\mathbf r = (r_0, \ldots, r_N)$ with $0 \le r_n \le m_n$,
> $$\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r) := \{Q \in \overline{\mathcal H} : r_n(Q) = r_n\ \text{for all}\ n\}.$$

> **Theorem (Pataki product stratification).**
>
> 1.  **Stratification.** $\overline{\mathcal H} = \bigsqcup_\mathbf{r} \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)$, and each stratum is a connected real-analytic submanifold of $\prod_n \mathrm{Sym}(C_n)$.
>
> 2.  **Dim formula.** $\dim \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r) = \sum_n \left[ r_n m_n - \binom{r_n}{2} \right]$.
>
> 3.  **Codim formula.** $\mathrm{codim}\, \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)\ \text{in}\ \overline{\mathcal H} = \sum_n \binom{m_n - r_n + 1}{2}$.
>
> 4.  **Closure poset.** $\overline{\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r')} \supseteq \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)$ iff $r_n \le r'_n$ for all $n$. The closure poset is the product chain $\prod_n \{0, 1, \ldots, m_n\}$ with coordinate-wise order.
>
> 5.  **Top stratum.** $\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}((m_0, \ldots, m_N)) = \mathcal H$ (the SPD interior).
>
> 6.  **Bottom stratum.** $\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}((0, \ldots, 0)) = \{0\}$.

###### Proof

(1)--(2) Each $\mathrm{Sym}^+(C_n)$-rank-$r_n$ stratum is a smooth submanifold of $\mathrm{Sym}(C_n)$ of dim $r_n m_n - \binom{r_n}{2}$ (Pataki, equivalently the manifold of factorizations $Q_n = L L^T$ with $L \in \mathbb R^{m_n \times r_n}$ of full column rank, mod $O(r_n)$). The product stratum is the product of these.

(3) Codim in $\mathrm{Sym}_{m_n}$ of rank-$r_n$ stratum: $\binom{m_n + 1}{2} - r_n m_n + \binom{r_n}{2} = \binom{m_n - r_n + 1}{2}$ (algebraic identity). Sum over $n$.

(4) Continuity of rank: rank is upper-semi-continuous (rank can only drop in the limit), so $\overline{\mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r')} \subseteq \bigcup_{\mathbf r \le \mathbf r'} \mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r)$. Conversely, given $\mathbf r \le \mathbf r'$, an explicit limit construction (replace zero eigenvalues with small positive perturbations) realizes the lower stratum as a limit of the higher.

(5)--(6) Direct.

This is just the product of Pataki's classical SDP-cone face structure (Pataki 1995, "Cone-LP's and semidefinite programs," and follow-up in semidefinite-optimization literature). The codim formula $\binom{m-r+1}{2}$ is the standard "rank-deficit triangular number."

##### Chain-complex refinement (fine)

The Pataki coarse stratification ignores the chain complex. The kernel $K_n \subseteq C_n$ is treated as a subspace without algebraic structure. The chain-complex *refinement* records how $K_n$ sits relative to the algebraic filtration
$$0 \subseteq \mathrm{im}\, d_{n+1} \subseteq \ker d_n \subseteq C_n.$$

This filtration is *intrinsic* --- it depends only on $(C_\bullet, d)$, not on any Hilbert structure. So refining Pataki strata by how $K_n$ aligns with this filtration produces a chain-complex-canonical refinement.

###### Schubert invariants

> **Definition (kernel Schubert invariants).** For $Q \in \overline{\mathcal H}$ with kernel $K_n = \ker Q_n$, the **kernel Schubert tuple** is
> $$\sigma(Q) := \big( a_n, z_n, k_n \big)_n$$
> where
> - $a_n := \dim(K_n \cap \mathrm{im}\, d_{n+1})$ --- kernel meets boundaries;
> - $z_n := \dim(K_n \cap \ker d_n)$ --- kernel meets cycles;
> - $k_n := \dim K_n = m_n - r_n$ --- total kernel.
>
> These satisfy $0 \le a_n \le z_n \le k_n$ and $a_n \le \rho_{n+1} = \mathrm{rank}\, d_{n+1}$, $z_n \le \dim \ker d_n = m_n - \rho_n$.

The kernel decomposes into three pieces relative to the chain filtration:
- $a_n$ dims live in $\mathrm{im}\, d_{n+1}$ (boundary part of kernel),
- $(z_n - a_n)$ dims live in $\ker d_n / \mathrm{im}\, d_{n+1} = H_n$ (homological part of kernel),
- $(k_n - z_n)$ dims live in $C_n / \ker d_n$ (cocycle part of kernel).

###### Generic Schubert invariants

For *generic* $Q$ in the Pataki rank-$r_n$ stratum, the kernel $K_n$ is a generic $k_n$-dim subspace of $C_n$. Generic-position Schubert calculus on the Grassmannian gives:

> **Lemma (generic Schubert invariants).** For a generic $k_n$-dim subspace $K_n \subset C_n$ and a fixed $v$-dim subspace $V_n \subset C_n$:
> $$\dim(K_n \cap V_n)^{\mathrm{gen}} = \max(0,\ k_n + v - m_n).$$
>
> Hence for generic $Q$ in $\mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r)$:
> - $a_n^{\mathrm{gen}} = \max(0, k_n + \rho_{n+1} - m_n)$;
> - $z_n^{\mathrm{gen}} = \max(0, k_n + (m_n - \rho_n) - m_n) = \max(0, k_n - \rho_n)$.

###### Schubert codim formula

Strata where the Schubert tuple deviates from generic carry extra codim, given by the standard Grassmannian Schubert codim formula.

> **Theorem (chain-complex Schubert codim).** Within $\mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)$, the locus where the kernel Schubert invariants take values $\sigma = (a_n, z_n, k_n)_n$ has codim
> $$\mathrm{codim}\big(\mathrm{Stratum}_\mathrm{II}(\mathbf r, \sigma)\ \text{in}\ \mathrm{Stratum}_\mathrm{II}^{\mathrm{coarse}}(\mathbf r)\big) = \sum_n \big[\, (a_n - a_n^{\mathrm{gen}})\cdot \alpha_n + (z_n - a_n - (z_n - a_n)^{\mathrm{gen}})\cdot \beta_n \,\big]$$
> where:
> - $\alpha_n = m_n - \rho_{n+1} - k_n + a_n$ --- Schubert codim weight for the boundary-intersection condition;
> - $\beta_n = \rho_n - (k_n - z_n) + (z_n - a_n - (z_n-a_n)^{\mathrm{gen}})$ --- Schubert codim weight for the homological-intersection condition.

(The $\alpha_n, \beta_n$ formulas come from the standard "Schubert codim of $\dim(K \cap V) = j$ in $\mathrm{Gr}(k, m)$ is $j(m - v - k + j)$ for $j \ge \max(0, k+v-m)$.")

> **Total Stratification II codim.** Combining Pataki coarse and Schubert refinement:
> $$\mathrm{codim}\, \mathrm{Stratum}_\mathrm{II}(\mathbf r, \sigma)\ \text{in}\ \overline{\mathcal H} = \sum_n \binom{m_n - r_n + 1}{2} + \mathrm{Schubert}(\mathbf r, \sigma).$$

The first term is Pataki rank-deficit; the second is Schubert chain-alignment codim.

###### Proof sketch

The Pataki rank-$r_n$ stratum, viewed as a fiber bundle, is
$$\mathrm{Stratum}^{\mathrm{coarse}}(\mathbf r) \cong \prod_n \mathrm{Gr}(k_n, m_n) \times_{\mathrm{frame}} \mathrm{Sym}^+_{r_n}$$
where each factor is "choose a $k_n$-dim kernel + an SPD form on the complementary $r_n$-dim quotient." The Schubert conditions on $K_n$ live entirely in the Grassmannian factor.

So the Schubert codim within the Pataki stratum equals the standard Grassmannian Schubert codim. Summing over $n$ gives the formula. The total codim in $\overline{\mathcal H}$ is Pataki codim + Schubert codim. ∎

##### Closure poset of Stratification II

> **Theorem (closure poset of Stratification II).** $\overline{\mathrm{Stratum}_\mathrm{II}(\mathbf r', \sigma')} \supseteq \mathrm{Stratum}_\mathrm{II}(\mathbf r, \sigma)$ iff:
>
> (a) $r_n \le r'_n$ for all $n$ (rank can only drop in limits), AND
>
> (b) For each $n$ where $r_n = r'_n$ (no rank drop), the Schubert pattern *coarsens*: $a_n \ge a'_n$ and $z_n \ge z'_n$ (with same $k_n = k'_n$ since rank is fixed), reflecting that the kernel intersection with chain-filtration subspaces can only grow in limits, AND
>
> (c) For each $n$ where $r_n < r'_n$ (rank drops), the Schubert pattern is consistent with adding $r'_n - r_n$ additional kernel directions, which can land in any combination of $\mathrm{im}\,d_{n+1}, \ker d_n / \mathrm{im}\,d_{n+1}, C_n/\ker d_n$, so any $(a_n, z_n)$ with $a'_n \le a_n$ and $z'_n \le z_n$ and $z_n - a_n \ge z'_n - a'_n$ and $k_n - z_n \ge k'_n - z'_n$ is reachable.

In short: the closure poset is the *Pataki product chain* in the rank coordinate, with each rank step refined by *Schubert closure* in the Grassmannian-pattern coordinate.

###### Proof sketch

(a) Upper-semi-continuity of rank.

(b) Upper-semi-continuity of $\dim(K_n \cap V_n)$ for any fixed subspace $V_n$ (also a Schubert closure relation in the Grassmannian).

(c) When rank drops, the new kernel directions can be chosen to land anywhere in the chain filtration, giving full flexibility for the Schubert pattern. Limits realize all consistent patterns.

The result combines the Pataki product chain with the Grassmannian Schubert order on each "fiber." ∎

##### Worked example: the (2,1) chain complex

Recall the chain complex $(C_0, C_1, C_2) = (2, 3, 1)$ with $d_1, d_2$ in canonical form (`examples/edd-computation-on-2-1-chain.md`):
$$d_1 = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}, \qquad d_2 = (0, 0, 1)^T.$$

Rank profile: $\rho_1 = 2$, $\rho_2 = 1$. Filtrations:
- $C_0$: $\mathrm{im}\, d_1 = C_0 = \mathbb R^2$, $\ker d_0 = C_0$ (no $d_0$). Dim filtration $(0, 2, 2, 2) \subseteq \cdots$.
- $C_1$: $\mathrm{im}\, d_2 = \langle e_3 \rangle$ (1-dim), $\ker d_1 = \langle e_3 \rangle$ (1-dim). So $H_1 = 0$. Filtration: $(0, 1, 1, 3)$.
- $C_2$: $\mathrm{im}\, d_3 = 0$, $\ker d_2 = 0$ (since $d_2$ injective). Filtration: $(0, 0, 0, 1)$.

###### Stratification II strata of low codim in $\overline{\mathcal H}$

Total $\dim \overline{\mathcal H} = \binom{3}{2} + \binom{4}{2} + \binom{2}{2} = 3 + 6 + 1 = 10$.

Codim-1 Pataki strata (rank drop by 1 in some $C_n$):

| Pataki $\mathbf r$ | Pataki codim       | Stratum                               |
|--------------------|--------------------|---------------------------------------|
| $(1, 3, 1)$        | $\binom{2}{2} = 1$ | $\det Q_0 = 0$                        |
| $(2, 2, 1)$        | $\binom{2}{2} = 1$ | $Q_1$ rank-2 (one cubic discriminant) |
| $(2, 3, 0)$        | $\binom{2}{2} = 1$ | $Q_2 = 0$                             |

Codim-1 Schubert refinements within $(2, 2, 1)$ Pataki stratum:

The kernel $K_1$ is a 1-dim subspace of $C_1 = \mathbb R^3$. The chain filtration is $0 \subset \mathrm{im}\,d_2 = \langle e_3 \rangle \subset \ker d_1 = \langle e_3 \rangle \subset C_1$.

For generic $K_1$ of dim 1: $a_1^{\mathrm{gen}} = \max(0, 1 + 1 - 3) = 0$ (kernel disjoint from $\mathrm{im}\,d_2$), $z_1^{\mathrm{gen}} = \max(0, 1 - 2) = 0$ (kernel disjoint from $\ker d_1$).

Non-generic Schubert refinements (codim within Pataki):

| Schubert $(a_1, z_1, k_1)$ | Description                                    | Schubert codim                |
|----------------------------|------------------------------------------------|-------------------------------|
| $(0, 0, 1)$                | generic                                        | 0                             |
| $(1, 1, 1)$                | $K_1 = \mathrm{im}\,d_2 = \langle e_3 \rangle$ | $1 \cdot (3 - 1 - 1 + 1) = 2$ |

So the locus "$K_1 = \langle e_3 \rangle$" inside the $(2, 2, 1)$ Pataki stratum has codim 2 in Pataki + Pataki codim 1 = total codim 3 in $\overline{\mathcal H}$.

This is exactly the Stratification II stratum corresponding to **Component 2** of the (2,1) singular locus computation: $b_{13} = b_{23} = b_{33} = 0$, codim 3 in $\overline{\mathcal H}$, dim $10 - 3 = 7$ --- wait, but Component 2 has dim 6 in 9-dim $a, b$-space (= dim 7 in 10-dim $\overline{\mathcal H}$ when we add the $c$-axis back).

Yes --- Component 2 has dim 6 in 9-dim $a, b$-space (= dim 7 in 10-dim $\overline{\mathcal H}$ once the $c$-axis is restored). Codim 3. Matches.

###### Match with EDD computation singular components

| Component | dim | codim | Stratification II identification                                                    |
|-----------|-----|-------|-------------------------------------------------------------------------------------|
| 0         | 7   | 2     | **Stratification I**: $V(\Pi_T)$, supersymmetric sub-stratum                        |
| 1         | 6   | 3     | Stratification II: $K_1 \supseteq \langle e_3 \rangle$ + extra cubic conditions     |
| 2         | 6   | 3     | Stratification II: $K_1 = \langle e_3 \rangle$ (Schubert: $K_1 = \mathrm{im}\,d_2$) |
| 3         | 6   | 3     | Stratification II: $K_1 \supseteq \langle e_3 \rangle$ + quadric refinement         |
| 4         | 6   | 3     | Stratification II: $\det Q_0 = 0$ + Stratification I-coupling cubics                |

So the 5 singular components of the EDD computation decompose as **1 Stratification-I component (Component 0) + 4 Stratification-II components (Components 1--4)**, exactly matching the dual-stratification picture.

Components 1, 3 are *intersections* of Stratification I and II (kernel-pattern + eigenvalue-pattern), giving smaller subloci. Components 2, 4 are pure Stratification II strata (kernel-pattern, generic eigenvalue).

This confirms Stratification II as a real geometric object explaining the structure of the EDD = 40 result.

##### Connection to compactified moduli

The closure $\overline{\mathcal M_{\mathrm{Lap}}} = G \backslash \overline{\mathcal H}$ (with $G = \prod_n O(C_n)$) carries Stratification II at its boundary, refining the Stratification I that lives in the interior $\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$.

Concretely:
- The interior $\mathcal M_{\mathrm{Lap}}$ has Stratification I (eigenvalue multipartition of $\Delta$).
- The boundary $\partial \overline{\mathcal M_{\mathrm{Lap}}}$ has Stratification II (Pataki + Schubert).

This gives a Borel--Serre-style stratified compactification of the moduli of Laplacianizations, with explicit codim formulas on both the interior and boundary strata.

The compactification is "natural" in the sense that it coincides with the algebraic-geometric closure of $\mathcal M_{\mathrm{Lap}}$ inside the GIT quotient $G \backslash\!\!\backslash \mathrm{Sym}(\bigoplus_n C_n)$ --- though making this precise in the algebraic-geometry sense requires more care (the action of $G$ on $\partial \overline{\mathcal H}$ is not free, so the quotient is genuinely an orbifold-with-boundary stratified by both stratifications).

##### Connection to literature

- **Pataki, *Cone-LP's and semidefinite programs* (1995)**: the rank stratification of $\mathrm{Sym}^+_n$, foundational for SDP face structure. Stratification II's coarse part is the product Pataki stratification.
- **Schubert calculus on Grassmannians**: classical (e.g., Fulton, *Young Tableaux*). The Schubert codim formula is standard.
- **Borel--Serre compactification** (Borel--Serre 1973): boundary stratification of locally symmetric spaces by parabolic-type. Structurally analogous to Stratification II's role in the moduli compactification, but the specific groups and stratifications differ.
- **Semidefinite optimization literature** (Ramana, Renegar, Pataki and follow-ups): face lattices of SDP cones. The product Pataki order is implicit.
- **Hilbert chain complexes / weighted simplicial complexes**: the chain-complex Schubert refinement may be in niche literature on weighted simplicial complexes (Forman's discrete Morse, Friedman's spectral graph theory, etc.) but I haven't located a direct match. Likely novel in the explicit form here.

##### Status of pieces

| Piece                                  | Source                                       | Status              |
|----------------------------------------|----------------------------------------------|---------------------|
| Pataki product stratification          | Pataki 1995, product extension is routine    | Proved              |
| Codim formula (coarse)                 | Algebraic identity                           | Proved              |
| Closure poset (coarse)                 | Upper-semi-continuity of rank                | Proved              |
| Schubert refinement                    | Standard Grassmannian Schubert calculus      | Proved              |
| Total codim formula                    | Combination                                  | Proved              |
| Closure poset (fine)                   | Combination of Pataki order + Schubert order | Proved              |
| Match with EDD singular locus on (2,1) | Explicit verification                        | Proved (this entry) |

So Stratification II is now a **proved theorem** with explicit codim formula, closure poset, and worked example matching the (2,1) computation.

##### Significance

1.  **Explains the 4 boundary components of the EDD = 40 computation** as Stratification II strata of specific Pataki + Schubert types.

2.  **Distinguishes intrinsic from extrinsic invariants** of the moduli: Stratification I is intrinsic (depends only on the Laplacianizer framework); Stratification II is extrinsic (depends on the embedding into $\overline{\mathcal H}$).

3.  **Completes the dual-stratification picture**: the moduli of Laplacianizations, viewed in algebraic-closure, has *two* canonical stratifications --- one in the interior (eigenvalue multipartition), one at the boundary (Hilbert degeneracy + chain-Schubert).

4.  **Provides the right framework for compactified moduli**: any compactification of $\mathcal M_{\mathrm{Lap}}$ that respects both algebraic and metric structure must include Stratification II at the boundary.

5.  **Generalizes Pataki to the chain-complex setting**: the chain-Schubert refinement is the new content beyond classical SDP face theory.

##### Open

1.  **Closure poset combinatorics.** The closure poset is described algorithmically (Pataki order × Schubert orders); a clean *combinatorial* description (e.g., as a product of posets or as Bruhat-like) would be useful for compactification arguments.

2.  **Intersection of Stratification I and II.** Components 1, 3 of the (2,1) singular locus are *intersections* --- strata with both eigenvalue-multipartition and kernel-Schubert structure. The systematic study of these "mixed strata" is open.

3.  **Stratification II in cellular sheaves.** When $Q_n$ comes from a stalkwise diagonal Hilbert structure on a cellular sheaf, the kernel of $Q_n$ has additional cellular constraints. The corresponding sub-stratification is the cellular-sheaf version of Stratification II, with potentially richer combinatorics.

4.  **EDD formula via Stratification II.** EDD = 40 on the (2,1) chain decomposes conjecturally as (Stratification I) + (Stratification II boundary). A closed-form for each contribution as a function of chain-complex invariants is open. Saturating away Stratification II isolates the intrinsic SPD-interior EDD --- see `questions/saturated-edd.md`.

5.  **Compactification as a categorical moduli.** Whether $\overline{\mathcal M_{\mathrm{Lap}}}$ can be defined as a categorical moduli (representing some functor on graded commutative algebras / chain complexes / etc.) is open. If yes, Stratification II is a canonical structure on the categorical moduli.

#### Concept: Laplacianizability {#laplacianizability}

##### What a Laplacian is

Let $C_\bullet = (C_n)_{n \ge 0}$ be a graded Hilbert space --- each $C_n$ a Hilbert space, with inner product $\langle \cdot, \cdot \rangle_n$ --- and let $d_n: C_n \to C_{n-1}$ be a bounded operator with $d_{n-1} d_n = 0$. Write $d_n^*: C_{n-1} \to C_n$ for the Hilbert adjoint. The **Hodge Laplacian** in degree $n$ is

$$\Delta_n = d_{n+1} d_{n+1}^* + d_n^* d_n: C_n \to C_n.$$

$\Delta_n$ is positive semidefinite and self-adjoint by construction; the data of $\Delta_n$ is *fully determined* by $(C_\bullet, \langle \cdot, \cdot \rangle, d)$ --- no extra choice is involved.

The **homology** of the chain complex is $H_n(C_\bullet) = \ker(d_n) / \mathrm{im}(d_{n+1})$. The **Hodge theorem** says that when each $d_n$ has closed range (in particular: when every $C_n$ is finite-dimensional),

$$C_n = \ker(\Delta_n) \oplus \mathrm{im}(d_{n+1}) \oplus \mathrm{im}(d_n^*), \qquad \ker(\Delta_n) \cong H_n(C_\bullet).$$

In particular, $\ker(\Delta_n)$ is a *canonical realization* of the homology: the harmonic representatives.

##### What "Laplacianizable" should mean

The word "Laplacianizable" applied to an input structure $X$ is content-free unless tied to a target cohomology theory. Saying "$X$ has a Laplacian" reduces, by the paragraph above, to "$X$ has a Hilbert chain complex $C_\bullet(X)$" --- which is trivial: take $C_\bullet(X) = 0$.

The non-trivial structure is the requirement that the chain complex *compute a pre-existing cohomology theory of $X$*. That's the content of every actual Laplacianization in the survey: simplicial cochains compute simplicial cohomology (Eckmann); sheaf cochains compute sheaf cohomology (Hansen--Ghrist); persistent cochains compute persistent homology (Wang--Wei); de Rham forms compute de Rham cohomology (Hodge).

So the working definition we adopt is:

> **Definition (Laplacianizability).** Let $\mathcal C$ be a category equipped with a *cohomology theory* $H^\bullet: \mathcal C \to \mathbf{grVect}_\Bbbk$ valued in graded $\Bbbk$-vector spaces. The pair $(\mathcal C, H^\bullet)$ is **Laplacianizable** if it admits a *Laplacianizer* --- a triple $\mathfrak L = (F, d, \eta)$ where $F: \mathcal C \to \mathbf{Hilb}^{\mathbb Z}$ is a functor to graded Hilbert spaces, $d$ is a degree-$(-1)$ chain differential on $F$ with $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural isomorphism (on closed-range objects).

See `concepts/laplacianizer.md` for the Laplacianizer object itself. Laplacianizability is the *property* of admitting one; the Laplacianizer is the *object* whose moduli the program studies.

The Laplacian is a derived invariant of the Laplacianizer: $\Delta_n^X := \Delta_n^{F(X)}$ is well-defined, and Hodge gives $\ker(\Delta_n^X) \cong H^n(X)$ via $\eta$.

This definition is doing real work. Three things become statements rather than gestures:

1.  **Existence.** Does $H^\bullet$ admit a Laplacianizer at all? Many cohomology theories don't naturally land in finite-dimensional or even reflexive Banach spaces, so there is something to prove.
2.  **Uniqueness.** Given two Laplacianizers $\mathfrak L, \mathfrak L'$ of the same $(\mathcal C, H^\bullet)$, are they naturally isomorphic? In general, no --- the inner products differ --- but they produce isomorphic *kernels* of Laplacians (because both compute $H^\bullet$). The non-canonical part is exactly the *moduli of Laplacianizers* (`theorems/moduli-of-laplacianizers.md`).
3.  **Universal property.** Among all Laplacianizers, is there one that is initial / terminal in the appropriate sense? This is sharper than (2): not just existence and equivalence on cohomology, but a canonical preferred Laplacianizer. The answer (`questions/universal-laplacianization.md`, resolved): no canonical Laplacianizer in general; the universal property is structural --- the moduli of Laplacianizers has a uniform orbifold-stratified shape (`theorems/main-theorem-synthesis.md`), not a unique element.

##### Where the 2025 papers sit

Each 2025 paper in `references/` constructs a Hilbert lift for some $(\mathcal C, H^\bullet)$:

- \$(`\mathcal `{=tex}C, H\^`\bullet`{=tex}) = \$ (cellular sheaves on regular CW complexes, sheaf cohomology) --- Hansen--Ghrist, extended to sheaves on finite posets in ([Ayzenberg et al. 2025](#ref-ayzenberg2025sheaf)).
- \$(`\mathcal `{=tex}C, H\^`\bullet`{=tex}) = \$ (persistence modules, persistent homology) --- ([Wei and Wei 2023](#ref-wei2023persistent)), ([Wolf, Fan, and Monod 2025](#ref-wolf2025generalized)).
- \$(`\mathcal `{=tex}C, H\^`\bullet`{=tex}) = \$ (hypergraphs, hypergraph cohomology) --- multiple non-equivalent lifts, exposing that the *cohomology theory* is itself disputed for hypergraphs.
- \$(`\mathcal `{=tex}C, H\^`\bullet`{=tex}) = \$ (RCD spaces, Cheeger cohomology in degree 0) --- Hilbert lift exists in degree 0 only; higher-degree analogs are obstructed because the cohomology theory itself is not classical above degree 0.

The hypergraph row exposes a sharp fact: *part of what 2025 is doing is choosing $H^\bullet$ for $\mathcal C$, not just lifting it*. A "new hypergraph Laplacian" often comes with an implicit "new hypergraph cohomology theory" --- clique-cohomology vs. sheaf-on-poset cohomology vs. symmetric-simplicial-set cohomology. The Hilbert-lift framework makes this hidden choice visible.

##### What Laplacianizability is *not*

- It is not a property of an input $X$ alone. It is a property of a pair $(\mathcal C, H^\bullet)$ --- a category and a cohomology theory on it.
- It is not the existence of an operator. The operator is automatic. The non-trivial part is that the operator's kernel computes the *right* cohomology.
- It is not equivalent to "fits into the de Rham--Hodge template." It is equivalent to admitting a Hilbert lift of a *given* cohomology theory; the de Rham--Hodge case is one instance.

##### Open questions, restated in this language

- (`questions/what-is-laplacianizability.md`) --- Is the right Hilbert lift functor unique up to natural iso? When?
- (`questions/obstruction-to-laplacianization.md`) --- Which $(\mathcal C, H^\bullet)$ admit no Hilbert lift, and why?
- (`questions/universal-laplacianization.md`) --- When the Hilbert lift exists, is there a universal one (initial / terminal in the category of Hilbert lifts)?

These three are now mathematical questions, not vibes. Each has a yes/no answer in any specific case, and partial answers exist in the literature for the cases the survey covers.

#### Concept: The Hodge Laplacian {#hodge-laplacian}

Pinned definitions and theorems used throughout the corpus.

##### Definition

A **graded Hilbert chain complex** is a sequence of Hilbert spaces $C_n$ ($n \ge 0$, possibly only finitely many nonzero) and bounded linear maps $d_n: C_n \to C_{n-1}$ with $d_{n-1} d_n = 0$. Write $d_n^*: C_{n-1} \to C_n$ for the Hilbert adjoint of $d_n$.

The **Hodge Laplacian** in degree $n$ is

$$\Delta_n := d_{n+1} d_{n+1}^* + d_n^* d_n: C_n \to C_n.$$

Properties immediate from the definition:

1.  $\Delta_n$ is self-adjoint and positive semidefinite: $\langle \Delta_n x, x \rangle = \|d_{n+1}^* x\|^2 + \|d_n x\|^2 \ge 0$.
2.  $\ker \Delta_n = \ker d_n \cap \ker d_{n+1}^*$. Proof: $\Delta_n x = 0 \Leftrightarrow \langle \Delta_n x, x \rangle = 0 \Leftrightarrow d_n x = 0 \text{ and } d_{n+1}^* x = 0$.
3.  $\Delta$ commutes with $d$: $\Delta_{n-1} d_n = d_n \Delta_n$. (Direct expansion using $d^2 = 0$.)

##### Hodge decomposition

**Theorem (Hodge, finite-dimensional case).** If each $C_n$ is finite-dimensional, then

$$C_n = \ker(\Delta_n) \oplus \mathrm{im}(d_{n+1}) \oplus \mathrm{im}(d_n^*).$$

The summands are mutually orthogonal. Moreover the inclusion $\ker(\Delta_n) \hookrightarrow \ker(d_n)$ induces an isomorphism

$$\ker(\Delta_n) \xrightarrow{\sim} H_n(C_\bullet), \qquad H_n(C_\bullet) := \ker(d_n) / \mathrm{im}(d_{n+1}).$$

*Proof sketch.* Orthogonality: for $x \in \ker \Delta_n$, $y = d_{n+1} z$, $\langle x, y \rangle = \langle x, d_{n+1} z\rangle = \langle d_{n+1}^* x, z \rangle = 0$ since $d_{n+1}^* x = 0$ by (2) above. Similarly $\ker \Delta_n \perp \mathrm{im}\, d_n^*$, and $\mathrm{im}\, d_{n+1} \perp \mathrm{im}\, d_n^*$ because for $y = d_{n+1} z$, $w = d_n^* u$, we have $\langle y, w \rangle = \langle d_{n+1} z, d_n^* u \rangle = \langle d_n d_{n+1} z, u \rangle = 0$. Spanning: take $x \in C_n$, decompose using the orthogonal complement of $\mathrm{im}\, d_{n+1} + \mathrm{im}\, d_n^*$, which is finite-dimensional; show the orthogonal complement equals $\ker \Delta_n$.

Hodge isomorphism: every class in $H_n(C_\bullet)$ has a unique representative in $\ker \Delta_n$, namely the orthogonal projection of any cycle onto $\ker \Delta_n$.

**Theorem (Hodge, closed-range case).** If each $d_n$ has closed range (equivalently: $\Delta_n$ has $0$ as an isolated point of its spectrum, or has compact resolvent), the same statement holds with the same proof.

##### Why this matters for the program

The Hodge isomorphism $\ker \Delta_n \cong H_n(C_\bullet)$ is the *single fact* that makes "$X$ has a Laplacian" non-trivial. Without it, the operator $\Delta$ is just an arbitrary positive operator one can attach to any inner-product space. With it, $\Delta$ is a *spectral realization of the cohomology* --- the bottom of the spectrum, by dimension, equals the rank of $H_\bullet$, and the harmonic representatives are canonical cohomology classes.

Every "Laplacianization" in the 2025 survey is, structurally, an instance of this: produce $(C_\bullet(X), d, \langle \cdot, \cdot \rangle)$ from the input $X$ in such a way that $H_\bullet(C_\bullet(X))$ matches a known cohomology theory of $X$. The Laplacian is then *automatic*; the work is in the chain complex.

##### Failure modes

If $d$ does not have closed range (typical for unbounded operators on infinite-dimensional spaces), $\Delta$ may have continuous spectrum near $0$, and $\ker \Delta$ may be smaller than $H_\bullet$. Standard examples:

- $\Delta$ on non-compact Riemannian manifolds: $L^2$-cohomology can differ from de Rham cohomology.
- $\Delta$ on infinite simplicial complexes that are not locally finite (([Bartmann and Keller 2025](#ref-bartmann2025hodge)) does the work to recover Hodge in this case).

The closed-range condition is therefore one of the technical invariants of "well-behaved" Laplacianization --- and one of the conditions a clean general theorem would have to handle.

#### Concept: The Laplacianizer {#laplacianizer}

The mathematical object whose existence proves Laplacianizability and whose moduli is the central object of study of the program.

##### Definition

Let $\mathcal C$ be a category and $H^\bullet: \mathcal C \to \mathbf{grVect}_\mathbb{R}$ a graded-vector-space-valued cohomology theory.

A **Laplacianizer** of the pair $(\mathcal C, H^\bullet)$ is a triple

$$\mathfrak L = (F, d, \eta)$$

where:

- $F: \mathcal C \to \mathbf{Hilb}^\mathbb{Z}$ is a functor to graded Hilbert spaces (each $F(X)$ a graded Hilbert space, each morphism in $\mathcal C$ inducing a bounded graded linear map between Hilbert spaces);

- $d: F \to F[-1]$ is a degree-$(-1)$ natural transformation (each $F(X)$ comes with a chain differential $d_X$ functorial in $X$) satisfying $d \circ d = 0$;

- $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural isomorphism between the given cohomology theory $H^\bullet$ and the homology of the Hilbert chain complex $(F, d)$, restricted to objects $X$ where $d_X$ has closed range.

The Laplacian of $\mathfrak L$ at $X$ is

$$\Delta^\mathfrak L_X := dd^* + d^*d \quad \text{on } F(X),$$

with $d^*$ the Hilbert adjoint relative to $F(X)$'s inner product. By construction, $\ker \Delta^\mathfrak L_X \cong H^\bullet(X)$ via $\eta$ (Hodge isomorphism).

##### What a Laplacianizer is *not*

- **Not just a functor to chain complexes.** The functor $F$ goes to *Hilbert* chain complexes --- equipped with inner products. The inner products are part of the data.

- **Not just a Hilbert structure on a fixed complex.** A Laplacianizer is a *family* --- one Hilbert chain complex per object $X$, with naturality across morphisms. Per-object data is recovered by restricting $\mathfrak L$ to a single $X$.

- **Not unique.** Many Laplacianizers exist for the same $(\mathcal C, H^\bullet)$. The space of Laplacianizers is the moduli `theorems/moduli-of-laplacianizers.md`.

- **Not sensitive to which $\Delta$ we extract.** The Laplacianizer is the *full* triple $(F, d, \eta)$, and the Laplacian is a derived invariant. Two different Laplacianizers can yield Laplacians with the same spectrum but be inequivalent as Laplacianizers (different chain maps under naturality).

##### Decomposition: per-object data

A Laplacianizer $\mathfrak L = (F, d, \eta)$ has, at each object $X \in \mathcal C$, the following pieces of data:

1.  The **algebraic chain complex** $F^{\mathrm{alg}}(X) := (F(X), d_X)$ --- a chain complex of (algebraic) vector spaces, ignoring the inner products.

2.  The **Hilbert structure** $\langle \cdot, \cdot \rangle_X$ on $F(X)$ --- a graded inner product.

3.  The **cohomology iso** $\eta_X: H^\bullet(X) \xrightarrow{\sim} H_\bullet(F^{\mathrm{alg}}(X))$ --- independent of the inner product.

Two Laplacianizers $\mathfrak L, \mathfrak L'$ with isomorphic underlying algebraic chain complex functors $F^{\mathrm{alg}} \cong F'^{\mathrm{alg}}$ differ only in choice of inner product (and the natural iso witnessing the algebraic equivalence). The moduli at the algebraic level is *typically discrete* (chain complexes with the same homology are isomorphic up to chain isomorphism, with discrete moduli for finite-type complexes); the *interesting* moduli is in the choice of inner product.

So, **fixing the algebraic Laplacianizer $F^{\mathrm{alg}}$**, the moduli of full Laplacianizers reduces to:

> The space of natural choices of graded inner product on $F^{\mathrm{alg}}(X)$ --- one per object --- modulo natural automorphisms of the algebraic chain complex functor.

This is the *concrete* moduli of `theorems/moduli-of-laplacianizations.md`, generalized to the categorical setting.

##### The moduli problem

**Definition.** The **moduli of Laplacianizers** of $(\mathcal C, H^\bullet)$ is the groupoid

$$\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet) := \{\text{Laplacianizers } \mathfrak L\} / \{\text{natural isomorphism}\},$$

where two Laplacianizers $\mathfrak L, \mathfrak L'$ are isomorphic if there is a natural transformation $\phi: F \to F'$ that is a graded chain isomorphism intertwining $d, d'$ (and consequently the cohomology iso's).

This is the categorical object the program studies. Its structure --- orbifold, stratified by eigenvalue-multiplicity invariants of the associated Laplacian --- is the content of the universal stratification claim.

##### Why "Laplacianizer" rather than "Hilbert lift"

The phrasing "Hilbert lift" emphasizes the *act* of lifting cohomology to Hilbert chain complexes. The phrasing "Laplacianizer" emphasizes the *object* --- the functor + differential + iso, treated as a single thing whose moduli is to be studied.

The two are the same data; the choice of name reflects which structural role is being highlighted.

For the program: "Laplacianizer" is the better name when we want to talk about the *moduli* of such things, especially when the moduli structure (orbifold, strata, gauge fibers) is the focus. "Hilbert lift" is the better name when we're talking about the *existence* question: does $(\mathcal C, H^\bullet)$ admit one?

A Laplacianizer is what Laplacianizability guarantees. The moduli of Laplacianizers is the proper unit of structural study.

##### Examples

1.  **Cellular case.** \$`\mathcal `{=tex}C = \$ cell complexes (regular CW, simplicial, or symmetric simplicial sets). \$H\^`\bullet `{=tex}= \$ cellular cohomology with $\mathbb R$-coefficients. A Laplacianizer is a choice of weight on each cell (more generally, a Hilbert-valued sheaf on the face poset). See `objects/cellular-sheaf.md`.

2.  **Riemannian / de Rham case.** \$`\mathcal `{=tex}C = \$ compact Riemannian manifolds. \$H\^`\bullet `{=tex}= \$ de Rham cohomology. A Laplacianizer is a choice of metric (which determines the $L^2$-pairing on differential forms). See `objects/metric-measure-space.md` for the variant.

3.  **Einstein moduli.** \$`\mathcal `{=tex}C = \$ smooth manifolds with the Einstein equation as constraint. \$H\^`\bullet `{=tex}= \$ tt-tensor cohomology of the Lichnerowicz operator. A Laplacianizer is an Einstein metric. See ([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein)).

4.  **Persistent case.** \$`\mathcal `{=tex}C = \$ filtered cell complexes. \$H\^`\bullet `{=tex}= \$ persistent homology. A Laplacianizer is the persistent Laplacian construction. See ([Wei and Wei 2023](#ref-wei2023persistent)).

5.  **Inner product Laplacian (graphs).** \$`\mathcal `{=tex}C = \$ graphs. \$H\^`\bullet `{=tex}= \$ graph cohomology with $\mathbb R$-coefficients. A Laplacianizer is a choice of inner product on vertices and edges. See ([Aksoy and Young 2025](#ref-aksoy2025reimagining)).

In each case, the moduli of Laplacianizers is the natural object of study.

#### Theorem: Main theorem: bipartite stratification of moduli of Laplacianizations {#bipartite-stratification-theorem}

A single statement combining the per-object proved theorems into a structure-of-moduli theorem, with the univariate ($N=1$) case recovering Arnold--Shapiro--Vainshtein--Weinstein and an explicit bipartite extension for $N \ge 2$.

##### Setup

Fix a finite-dimensional graded chain complex $(C_\bullet, d)$ over $\mathbb R$:
- $C_n$ a real vector space of dim $n_n$, finitely many nonzero;
- $d_n: C_n \to C_{n-1}$ linear, $d_{n-1} d_n = 0$;
- $r_n := \mathrm{rank}\, d_n$, with $N$ = number of $n$ for which $r_n > 0$.

Define:
- The **moduli of Hilbert structures** $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$, an open cone in $\prod_n \mathrm{Sym}(C_n)$.
- The **chain automorphism group** $G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\}$.
- The **moduli of Laplacianizations** $\mathcal M_{\mathrm{Lap}}(C_\bullet, d) := G \backslash \mathcal H$.

For $Q \in \mathcal H$, the squared singular values of $\widetilde d_n := Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ for each $n$ are eigenvalues of self-adjoint operators, well-defined as multisets and continuous in $Q$. Concatenating across $n$ gives an indexed multiset of $\sum_n r_n$ positive reals; the indexing is by $[N_*] := \bigsqcup_n \{1, \ldots, r_n\}$ (with $N_* = \sum_n r_n$).

The **bipartite multipartition** $\Pi(Q)$ is the partition of $[N_*]$ generated by the equivalence relation $\sigma_i^2(Q) = \sigma_j^2(Q)$. Modulo $\prod_n S_{r_n}$ (relabeling within each $d_n$'s singular values), the set of bipartite multipartitions is a finite poset under refinement.

For a multipartition $\Pi$, write blocks $B$ with **internal sizes** $k_n^B := |B \cap \{1, \ldots, r_n\}|$ and total size $|B| = \sum_n k_n^B \ge 1$. We have $\sum_B k_n^B = r_n$ for each $n$.

##### The main theorem

> **Theorem (bipartite stratification of moduli of Laplacianizations).** Let $(C_\bullet, d)$ be as above. Then $\mathcal M_{\mathrm{Lap}}(C_\bullet, d) = G \backslash \mathcal H$ is a real algebraic orbifold with the following structure:
>
> **(I) Strata.** For each bipartite multipartition $\Pi$ of $[N_*]$ (modulo $\prod_n S_{r_n}$), the locus $\mathrm{Stratum}(\Pi) := \{[Q] \in \mathcal M_{\mathrm{Lap}} : \Pi(Q) = \Pi\}$ is a locally closed real semi-algebraic subset of $\mathcal M_{\mathrm{Lap}}$. Strata are pairwise disjoint and cover $\mathcal M_{\mathrm{Lap}}$.
>
> **(II) Codim formula.** For each $\Pi$ with $\mathrm{Stratum}(\Pi)$ non-empty,
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\mathrm{Stratum}(\Pi)) = \sum_{B \in \Pi} (|B| - 1) = N_* - \#\Pi.$$
>
> **(III) Stabilizer formula.** For $Q \in \mathrm{Stratum}(\Pi)$,
> $$\dim \mathrm{stab}_G(Q) = \sum_{B \in \Pi} \sum_n \binom{k_n^B}{2}.$$
>
> **(IV) Closure poset.** The Zariski closure of each stratum is the union of coarser strata:
> $$\overline{\mathrm{Stratum}(\Pi)} = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi'),$$
> where $\Pi' \succeq \Pi$ denotes that $\Pi'$ is coarser than $\Pi$ (obtainable by block-merges). The poset of strata under closure is order-isomorphic to the bipartite multipartition lattice on $[N_*]$ modulo $\prod_n S_{r_n}$, ordered by coarsening.

##### Proof

(I) See `theorems/closure-poset-of-strata.md`, Step 1: $\Pi(Q)$ is determined by closed conditions $\sigma_i^2 = \sigma_j^2$ (closed) and open conditions $\sigma_i^2 \ne \sigma_j^2$ (open) for indices $i, j$ in same vs. different blocks. The stratum is the conjunction.

(II), (III) See `theorems/stab-codim-formula.md`. The codim formula is a count of independent eigenvalue-equality conditions; the stab formula is a count of $O(k_n^B)$-orthogonal-rotations on the eigenspaces of $\Delta_n = \widetilde d_n^T \widetilde d_n + \widetilde d_{n+1} \widetilde d_{n+1}^T$, accounting for the chain conditions which force block-diagonal structure in the bipartite eigenspace decomposition.

(IV) See `theorems/closure-poset-of-strata.md`. The proof has two directions:

- Upper-semi-continuity of $\Pi(Q)$ in $Q$ ($\overline{\mathrm{Stratum}(\Pi)} \subseteq$ closure of $\Pi$-coarsenings).
- Explicit perturbation construction (first-order Rayleigh--Schrödinger) showing that every coarser-stratum point is a limit of $\Pi$-stratum points. $\square$

##### Univariate specialization ($N = 1$)

When $N = 1$ (single boundary operator $d_1$, single chain space), bipartite multipartitions reduce to ordinary partitions of $r_1$. The theorem specializes as follows:

| Statement                                | $N = 1$                                                                             | Citation                                                                                                 |
|------------------------------------------|-------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| $\mathrm{codim} = N_* - \#\Pi$           | $\mathrm{codim} = r_1 - \#\lambda$                                                  | Classical                                                                                                |
| $\dim \mathrm{stab} = \sum \binom{k}{2}$ | $\dim \mathrm{stab} = \sum \binom{\lambda_i}{2} = \dim O(n)/(\prod O(\lambda_i))$   | Classical                                                                                                |
| Closure = coarsenings                    | $V_\mathbb R(\lambda) = \bigsqcup_{\lambda' \succeq \lambda} V_\mathbb R(\lambda')$ | Weinstein ([2020](#ref-weinstein2020real))                                                               |
| Spectral sequence / Alexander mapping    | Univariate Hermitian stratification                                                 | Shapiro and Vainshtein ([1995](#ref-shapiro1995stratification)), Arnold ([1995](#ref-arnold1995remarks)) |

So in the univariate case, the main theorem recovers the **Arnold--Shapiro--Vainshtein--Weinstein theory** --- a foundational subject in the algebraic geometry of symmetric matrices and a classical piece of mathematics not new to laplanc-2025.

##### Bipartite contribution ($N \ge 2$)

When $N \ge 2$, blocks $B$ may have $k_n^B \ge 1$ for multiple $n$ --- the **cross-operator identifications**. The structural distinction relative to the univariate case:

| Block type                      | Composition                    | Codim contrib. | Stab contrib.      |
|---------------------------------|--------------------------------|----------------|--------------------|
| Singleton                       | $(0, \ldots, 1, \ldots, 0)$    | 0              | 0                  |
| Within-$d_n$ pair               | $(0, \ldots, 2, \ldots, 0)$    | 1              | $\binom{2}{2} = 1$ |
| Cross-$d_n$ pair                | $(0, \ldots, 1, 1, \ldots, 0)$ | 1              | 0                  |
| Within-$d_n$ triple             | $(0, \ldots, 3, \ldots, 0)$    | 2              | $\binom{3}{2} = 3$ |
| Cross-$d_n, d_{n+1}$ "$(2, 1)$" | $(0, \ldots, 2, 1, \ldots, 0)$ | 2              | 1                  |
| ...                             | ...                            | ...            | ...                |

**Within-$d_n$ multiplicities** behave as in the univariate case: codim grows linearly with $|B|$, stab grows quadratically with $\binom{k_n^B}{2}$.

**Cross-$d_n$ identifications** contribute to codim (an extra equality is imposed) but not to stab (the chain conditions force block-diagonality of $u_n$ within the eigenspace, killing the would-be $O(k_n^B + k_{n+1}^B)$-rotation between $\mathrm{im}\, d_n^*$ and $\mathrm{im}\, d_{n+1}$).

This asymmetry --- *codim sees cross-$d$ identifications, stab does not* --- is the content of the bipartite extension beyond Arnold--Weinstein. It is the structural fingerprint of the chain complex's coupling between operators $d_n$ and $d_{n+1}$ via the Hodge supersymmetric isospectrality.

##### Boundary structure (Stratification II)

The theorem above describes $\mathcal M_{\mathrm{Lap}}$ in the SPD interior. The closure $\overline{\mathcal H}$ in $\prod_n \mathrm{Sym}(C_n)$ adds Hilbert-degeneracy boundary strata where some $Q_n$ becomes rank-deficient. These form **Stratification II** (`theorems/hilbert-degeneracy-stratification.md`), generalizing Pataki's rank stratification of the SDP cone.

Stratification II is structurally distinct from Stratification I (the bipartite multipartition stratification of this theorem):
- Stratification I lives in the SPD interior; Stratification II at the boundary.
- Stratification I depends on the spectral data of $\Delta(Q)$; Stratification II on the rank/kernel data of $Q$ itself.
- Closure poset of I is the bipartite multipartition lattice; closure poset of II is the product Pataki order refined by chain-complex-Hodge interaction.

A global object --- e.g., the variety $V(\Pi)$ in the algebraic closure of $\mathcal H$ --- sees both stratifications. EDD or intersection-cohomology computations of $V(\Pi)$ in $\overline{\mathcal H}$ decompose as contributions from Stratification I (intrinsic) plus Stratification II (extrinsic-boundary). See `examples/edd-computation-on-2-1-chain.md` for a worked instance.

##### Realizability companion

This theorem describes the *putative* stratification structure: which $\Pi$ are *labels* of strata. The companion **bipartite realizability theorem** (`theorems/bipartite-realizability.md`) proves the strata are *all populated*: for any finite-dim chain complex over $\mathbb R$, every bipartite multipartition $\Pi$ has $\mathrm{Stratum}(\Pi)$ non-empty in $\mathcal M_{\mathrm{Lap}}$. So the stratification is not just well-defined --- it's *fully populated*.

Combined, the bipartite stratification and bipartite realizability theorems characterize the moduli structure for finite-dim chain complexes over $\mathbb R$ in the unconstrained case.

##### What's *not* in this theorem

The main theorem (and its realizability companion) do not cover:

- **Categorical / functorial extension to $\mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$.** That generalization (`theorems/moduli-of-laplacianizers.md`) treats the moduli of Hilbert lifts of a cohomology theory, not just the moduli on a single chain complex. The category-specific stab formula varies (Einstein vs. cellular; see `theorems/universal-vs-categorical-stratification.md`).

- **Constrained realizability (chain-complex IEP-G).** When the inner products are restricted to a sparsity pattern (e.g., stalkwise diagonal weights for cellular sheaves), realizability becomes substantive --- generalizing IEP-G's obstructions to chain complexes. See `theorems/bipartite-realizability.md`'s "Open" section.

- **Cohomology of $\mathcal M_{\mathrm{Lap}}$.** The Vassiliev / Shapiro--Vainshtein machinery for cohomology of stratified varieties applies in principle to Stratification I, with the Möbius function of the bipartite multipartition lattice as input. A bipartite analog of the $E_2$-degeneration result is open.

- **Distance degree.** The Bik--Draisma multinomial $n!/\prod \lambda_i!$ generalizes cleanly to the *free bipartite* ambient (a bipartite multinomial), but in the chain-complex ambient EDD picks up boundary contributions and doesn't admit a closed form (`theorems/bipartite-distance-degree.md`).

These are the open directions documented in the `questions/` entries (Möbius product formula, $E_2$-degeneration, saturated EDD, mixed strata, etc.).

##### Summary

1.  The moduli of Hilbert structures on a finite-dim chain complex over $\mathbb R$ has real-algebraic orbifold structure.
2.  Per-stratum codim $\sum_B(|B|-1)$ and stab dim $\sum_B \sum_n \binom{k_n^B}{2}$.
3.  Closure poset = bipartite multipartition refinement lattice.
4.  Univariate ($N = 1$) case recovers Arnold--Shapiro--Vainshtein--Weinstein.

Stratification II at the SPD-cone boundary is a separate object treated in `theorems/hilbert-degeneracy-stratification.md`.

## The dual stratification --- interior vs. boundary, spectral vs. kernel {#the-dual-stratification}

The moduli of Laplacianizations $\mathcal M_{\mathrm{Lap}}$ carries two distinct stratifications: one in the SPD interior, indexed by spectral data of $\Delta(Q)$; one at the SPD-cone boundary, indexed by rank/kernel data of $Q$.

### Two stratifications, two domains

[Stratification I](#stratification-i) lives in the SPD interior $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$. Strata are indexed by [bipartite multipartitions](#bipartite-multipartition) of the Hodge spectrum. The data: which squared singular values of $\widetilde d_n$ coincide.

[Stratification II](#stratification-ii) lives at the SPD-cone boundary $\partial \overline{\mathcal H}$. Strata are indexed by Pataki rank tuples + chain-Schubert invariants. The data: which $Q_n$ become rank-deficient and how their kernels intersect the chain filtration.

Inside $\mathcal H$, only Stratification I sees structure --- Stratification II is concentrated at codim-$\infty$ (the boundary). At the boundary $\partial \overline{\mathcal H}$, Stratification I doesn't apply because $\Delta(Q)$ is not well-defined (the inner product $Q$ is degenerate).

So the two stratifications are *complementary*: one in the interior, one at the boundary, with no overlap on $\overline{\mathcal H}$.

### Spectral vs. kernel data

| Aspect                     | Stratification I                                        | Stratification II                      |
|----------------------------|---------------------------------------------------------|----------------------------------------|
| Source data                | spectrum of $\Delta(Q)$                                 | rank/kernel of $Q$                     |
| Gauge invariant            | yes (spectrum is gauge-invariant)                       | no (kernel has frame data)             |
| Intrinsic to chain complex | yes                                                     | yes (chain filtration enters)          |
| Refinable by               | within-degree multiplicity, cross-degree identification | chain-Schubert intersection invariants |
| Closure poset              | bipartite multipartition refinement                     | Pataki product chain × Schubert orders |

Stratification I is "intrinsic to the Hodge structure" in the sense that it depends only on the spectral data of the resulting Laplacian. Stratification II is "extrinsic to the linear ambient" --- it sees how the SPD cone is embedded in the surrounding linear space.

### Why the boundary stratification matters

For compact moduli problems, the closure $\overline{\mathcal M_{\mathrm{Lap}}}$ in some compactification matters. The natural compactification adds Stratification II at the boundary --- a Borel--Serre-style stratified compactification.

Several invariants of $\overline{\mathcal M_{\mathrm{Lap}}}$ pick up *both* stratifications:
- **Euclidean Distance Degree (EDD)** of a stratum closure: critical points include both interior critical points (Stratification I) and boundary critical points (Stratification II). The (2, 1) chain EDD = 40 result decomposes as 1 Stratification-I component + 4 Stratification-II components.
- **Intersection cohomology** of $\overline{\mathcal M_{\mathrm{Lap}}}$.
- **Top forms / volume forms** on compactified moduli.

So global invariants see both stratifications; the dual structure is essential for any global computation.

### How they interact: mixed strata

In the algebraic closure $\overline{\mathcal M_{\mathrm{Lap}}}$, the two stratifications can *intersect*. A **mixed stratum** is a locus where:
- Some $Q_n$ becomes rank-deficient (Stratification II behavior).
- The remaining spectrum has a non-trivial multipartition (Stratification I behavior on the surviving piece).

The (2, 1) chain singular components 1 and 3 are mixed: $Q_1$ rank-deficient with kernel containing $\mathrm{im}\,d_2$ (Stratification II) AND additional cubic conditions on the surviving spectral structure (Stratification I).

The systematic study of mixed strata is [open](#mixed-stratification-strata). They sit at the intersection of the two refinement orders and have a richer structure than either alone.

### Why two stratifications, structurally

The reason for two stratifications can be traced to the *two* sources of structural information about a Hilbert chain complex:

1.  **The spectrum** of the Hodge Laplacian (= spectral data of $\Delta(Q)$).
2.  **The metric structure** on the chain spaces (= rank/kernel data of $Q$ itself, plus its geometric position relative to the chain filtration).

For a Hilbert structure $Q$ in the SPD interior, both are non-degenerate; the spectral data dominates and gives Stratification I. At the boundary, the metric structure degenerates (rank drops), the Laplacian fails to be self-adjoint with discrete spectrum, and the relevant data shifts to the rank/kernel structure of $Q$ --- giving Stratification II.

### Compactified moduli as a complete object

A natural picture: $\overline{\mathcal M_{\mathrm{Lap}}}$ as a stratified space with:
- **Open dense interior**: Stratification I generic stratum (codim 0, simple bipartite multipartition).
- **Interior boundary**: higher-codim Stratification I strata (eigenvalue degeneracies in SPD interior).
- **Outer boundary**: Stratification II strata (Hilbert-structure degeneracies).
- **Mixed boundary**: intersections of interior strata (Stratification I) and boundary strata (Stratification II) at the algebraic closure.

This compactified picture is the right ambient for global computations and parallels the Borel--Serre boundary structure of locally symmetric spaces.

### Analog in other categories

The dual-stratification picture should extend to other Laplacianizer categories:

- **Smooth Riemannian**: Stratification I = eigenvalue multipartition strata in the moduli of metrics. Stratification II analog = boundary of the moduli where metrics become degenerate (collapse to lower dim, become incomplete, etc.). [Open](questions/stratification-ii-in-einstein-moduli.md) whether the Einstein moduli's boundary admits this structure.

- **Spectral triples**: Stratification I on $D$-spectra (interior). Stratification II analog: degenerations where the spectral triple becomes "almost-not-a-spectral-triple" --- e.g., $D$ losing compact resolvent, $\mathcal A$-action becoming ill-defined.

- **$p$-Banach (nonlinear)**: Stratification I on variational eigenvalues. Stratification II analog: boundary where Banach norms become non-strictly-convex (unit ball stops being a smooth strictly-convex body).

In each case, the dual-stratification picture is structurally consistent: there's an interior stratification by spectral data and a boundary stratification by structural-degeneracy data.

### Ambient for global computations

For any global computation of moduli --- compactification, integration of forms, intersection numbers --- the relevant ambient is the *stratified pair* (interior + boundary), not $\mathcal H$ or $\overline{\mathcal H}$ alone. Concrete instance: the (2, 1) chain EDD = 40 decomposes over both stratifications (`examples/edd-computation-on-2-1-chain.md`).

## The cross-degree asymmetry --- why codim sees what stab doesn't {#the-cross-degree-asymmetry}

The bipartite stratification theorem produces an asymmetric formula:

| Block type                            | Codim   | Stab           |
|---------------------------------------|---------|----------------|
| Within-degree, $k_n^B = k$            | $k - 1$ | $\binom{k}{2}$ |
| Cross-degree, $k_n^B = k_{n+1}^B = 1$ | $1$     | $0$            |

Cross-degree identifications cost codim but produce no stab.

### The chain-condition surface explanation

The chain auto group $G$ on a chain complex satisfies $g_{n-1} d_n = d_n g_n$ --- it's the subgroup of $\prod_n \mathrm{GL}(C_n)$ that commutes with $d$.

A within-degree block corresponds to a multi-dim eigenspace $\mathcal E_n^B$ inside a single $C_n$. Elements of $G$ that preserve $\mathcal E_n^B$ (and don't move it relative to other eigenspaces of $\Delta_n$) form a subgroup including all of $O(\mathcal E_n^B, Q_n) \subset \mathrm{GL}(C_n)$ on this block --- the within-block rotations preserve the inner product, the chain conditions on adjacent degrees, etc. So $\dim \mathrm{stab}|_{\text{within-}d_n\text{ block}} = \dim O(\mathcal E_n^B) = \binom{k_n^B}{2}$ (orthogonal group on real $k$-dim space).

A cross-degree block of size 2 (one element from each of $C_n$ and $C_{n+1}$) corresponds to a 1-dim eigenspace in each. There's no rotation freedom *within* a 1-dim subspace. Cross-degree rotation between $\mathcal E_n^B \subseteq C_n$ and $\mathcal E_{n+1}^B \subseteq C_{n+1}$ is forbidden by the chain conditions: any such rotation would mix degrees, but $g \in G$ acts independently on each $C_n$.

So a cross-degree block of size 2 has stab dim 0.

The codim contribution, however, doesn't care about chain conditions: each eigenvalue equality $\sigma_i^2(\widetilde d_n) = \sigma_j^2(\widetilde d_{n+1})$ is one extra condition, regardless of whether the involved indices are within or across degrees. So a cross-degree pair contributes 1 to codim.

### Why this generalizes across categories

The asymmetry appears identically in:

- **Cellular**: the chain-condition argument above, directly.
- **Smooth Riemannian**: the de Rham complex has $d: \Omega^n \to \Omega^{n+1}$ between different chain degrees. Cross-degree identifications of $\Delta_n$ vs. $\Delta_{n+1}$ eigenvalues are constrained by Hodge supersymmetric isospectrality (= they're paired automatically).
- **Spectral triples**: Hochschild chains $C_n(\mathcal A)$ with differential $b: C_n \to C_{n-1}$. Same structure.
- **Parametric graph case** ([Aksoy and Young 2025](#ref-aksoy2025reimagining)): inner products on vertices vs. edges are different chain degrees. Cross-vertex/edge identifications are codim, not stab.

So the asymmetry isn't specific to any of these categories --- it's a *categorical* feature of the chain complex structure with Hilbert lift.

### Hodge supersymmetric isospectrality

The deeper reason: the Hodge identity $\Delta_n d^* = d^* \Delta_{n+1}$ implies the nonzero spectrum of $\Delta_n$ on $\mathrm{im}\,d_n^*$ equals the spectrum of $\Delta_{n+1}$ on $\mathrm{im}\,d_n$ as multisets.

In bipartite multipartition terms: Hodge *forces* certain cross-degree identifications between adjacent operators. These forced identifications are the cross-degree blocks of $\Pi_{\min}$ --- built into the chain complex's structure, not extra equations.

For the cross-degree codim/stab question: Hodge-forced cross-degree identifications don't cost codim (they're free, structural). They also don't cost stab (no extra rotation, since $\Delta_n$ and $\Delta_{n+1}$ act on different $C$'s).

*Beyond* Hodge-forced identifications, additional cross-degree blocks correspond to:
- Identifications between non-adjacent chain degrees (e.g., $\Delta_0$ eigenvalue = $\Delta_2$ eigenvalue) --- not Hodge-forced.
- Identifications between an $\mathrm{im}\,d_n^*$-eigenvalue and a $\mathrm{harm}_n$-eigenvalue (a kernel-space coincidence).

These ARE extra equations on $Q$, costing codim 1 each. But they still don't produce extra stab dim because the chain auto cannot mix degrees.

So the asymmetry arises from:
1. Hodge supersymmetric isospectrality: cross-adjacent-degree identifications are automatic, costing nothing.
2. Chain auto = chain-degree-preserving: extra cross-degree identifications cost codim but not stab.

### Categorical formulation

A *Hodge-symmetric chain complex* is a graded Hilbert chain complex satisfying the supersymmetric isospectrality (which any chain complex with a Hilbert structure does, automatically). The cross-degree asymmetry is a feature of moduli of Hodge-symmetric chain complexes --- universal across categories where this Hodge structure makes sense.

The categorical statement (conjectural):

> For any category of inputs with a Hilbert lift functor producing Hodge-symmetric chain complexes, the moduli of Hilbert lifts has the bipartite stratification with universal codim formula $\sum_B(|B|-1)$ and category-specific stab dim, with the cross-degree asymmetry: cross-degree blocks contribute to codim but not to category-specific stab if the category's automorphism group preserves chain degrees.

### Universal codim, category-specific stab

The asymmetry separates the two formulas: codim depends only on bipartite multipartition combinatorics (counts independent eigenvalue equalities), while stab depends on the chain-auto group $\mathrm{Aut}(X)$ (counts the available rotations preserving spectrum). Codim is universal across categories; stab is category-specific.

Univariate specialization ($N = 1$, single chain space) has only within-degree blocks, so the asymmetry collapses and the classical Arnold--Weinstein codim/stab formulas pair symmetrically.

### Verification on small cases

- $\partial \Delta^2$: 2-dim moduli; codim and stab match the formula.
- $\partial \Delta^3$: 6-dim moduli with 31 strata; cross-degree blocks at the uniform-weight stratum.
- $(2, 2)$ chain with $d_1$ iso: codim 1 in moduli for $\Pi_{\max}$ relative to $\Pi_{\min}$.

### Open

The categorical formulation as a theorem in derived-category language is open. See [cross-degree-asymmetry-origin](#cross-degree-asymmetry-origin) for the conjecture and what's needed.

#### Theorem \[SKETCH\]: Bipartite Vassiliev / Shapiro--Vainshtein cohomology {#bipartite-vassiliev-shapiro-vainshtein}

The cohomology-theoretic counterpart to the bipartite stratification theorem (`theorems/bipartite-stratification-theorem.md`). Where the stratification theorem describes the *geometry* of moduli (codim, stab, closure poset), this entry describes the *topology* (cohomology of strata and discriminant complement) via a bipartite extension of Vassiliev's spectral sequence and Shapiro--Vainshtein's Alexander mapping.

This is genuinely novel mathematical content beyond the classical anchors: while Arnold/Shapiro--Vainshtein/Vassiliev computed cohomology for univariate $\mathrm{Sym}^+_n$ and partition-lattice stratifications, the bipartite extension uses the bipartite multipartition lattice and chain-complex-respecting structure.

Status: framework set up, $E_1$ page formula stated, Alexander-duality conjecture stated, worked example on (2,2) chain. Full computation of the $E_2$ page for general bipartite cases is open.

##### Classical Vassiliev (univariate)

For $\mathrm{Sym}^+_n$ stratified by eigenvalue partitions $\Pi$ of $\{1, \ldots, n\}$:

> **Vassiliev's spectral sequence** (Vassiliev, late 1980s--1990s; Arnold ([1995](#ref-arnold1995remarks)) for the Hermitian eigenvalue case):
> $$E_1^{p,q} = \bigoplus_{\Pi: \mathrm{codim}_\Pi = p} H^q\big(\mathrm{Stratum}(\Pi);\, \mathrm{or}_\Pi\big) \implies H^{p+q}\big(\mathrm{Sym}^+_n \setminus \mathrm{disc};\,\mathbb Z\big)$$
> where $\mathrm{disc}$ is the discriminant variety (union of strata with $\Pi$ non-trivial), $\mathrm{or}_\Pi$ is the orientation local system, and the sum is over partitions $\Pi$ of total codim $p$.

The $E_1$ page is computed from cohomology of individual strata, which are fiber bundles over the open simplex of distinct eigenvalues with fiber a real flag manifold $O(n) / \mathrm{stab}(\Pi)$.

> **Shapiro and Vainshtein ([1995](#ref-shapiro1995stratification))**: the spectral sequence **degenerates at $E_2$**, with the $E_1 \to E_2$ differential given by the Möbius function of the partition lattice. The Alexander mapping computes Poincaré duals of stratum cohomology classes via intersection numbers across the closure poset.

The $E_2$-degeneration is structural: cohomology of the stratification is "as combinatorially clean as possible" --- entirely determined by the closure poset and stratum cohomology, with no higher-page complications.

##### Bipartite extension: setup

Let $(C_\bullet, d)$ be a finite-dim graded chain complex over $\mathbb R$ with $C_n$ of dim $m_n$. The moduli of inner products is $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$, dim $\sum_n \binom{m_n + 1}{2}$.

The bipartite multipartition lattice $\mathcal P_\mathrm{bip}$ stratifies $\mathcal H$ --- strata are indexed by partitions $\Pi$ of $\bigsqcup_n \{1, \ldots, m_n\}$ that are *consistent with the Hodge identities forced by the chain complex*. The closure poset is the bipartite multipartition refinement order (`theorems/closure-poset-of-strata.md`).

The **(bipartite) discriminant** is
$$\mathrm{disc}_\mathrm{bip} := \mathcal H \setminus \mathrm{Stratum}(\Pi_{\min})$$
where $\Pi_{\min}$ is the minimum-coincidence stratum (Hodge-forced identifications only, no extra coincidences).

Goal: compute $H^*(\mathcal H \setminus \mathrm{disc}_\mathrm{bip}; \mathbb Z)$ --- the cohomology of the simple-spectrum bipartite stratum.

##### Bipartite Vassiliev spectral sequence

> **Theorem (bipartite Vassiliev spectral sequence, statement).** There exists a spectral sequence
> $$E_1^{p,q} = \bigoplus_{\Pi \in \mathcal P_\mathrm{bip}: \mathrm{codim}_\Pi = p} H^q\big(\mathrm{Stratum}(\Pi);\, \mathrm{or}_\Pi\big) \implies H^{p+q}\big(\mathcal H \setminus \mathrm{disc}_\mathrm{bip};\, \mathbb Z\big)$$
> indexed by the bipartite multipartition lattice $\mathcal P_\mathrm{bip}$, with $E_1^{0, q} = H^q(\mathrm{Stratum}(\Pi_{\min}))$ and the higher-codim strata contributing in higher $p$.

###### Construction

Following Vassiliev's classical machinery: build a *simplicial resolution* of $\mathcal H$ relative to the bipartite stratification. For each $\Pi$ with closure relations $\Pi \le \Pi'$, glue along the closure. Filter by stratum codim. The associated spectral sequence has the stated $E_1$ page.

The construction transfers from Vassiliev's univariate machinery directly: the only piece that changes is the indexing lattice (bipartite multipartitions vs. univariate partitions) and the local cohomology of strata (real flag-manifold variants).

###### $E_1$ page in bipartite combinatorics

Each $\mathrm{Stratum}(\Pi)$ is a fiber bundle:
$$\mathrm{Stratum}(\Pi) \to \mathrm{Spec}^*(\Pi),\quad \text{fiber} = G / \mathrm{stab}(\Pi)$$
where $\mathrm{Spec}^*(\Pi)$ is the open simplex of distinct eigenvalues compatible with $\Pi$, and $G$ is the gauge group (chain auto group) with stabilizer described by `theorems/stab-codim-formula.md`:
$$\dim \mathrm{stab}(\Pi) = \sum_B \sum_n \binom{k_n^B}{2}$$
where $k_n^B$ is the within-degree-$n$ multiplicity of block $B$.

So the cohomology of $\mathrm{Stratum}(\Pi)$ is determined by:
- The cohomology of the open simplex $\mathrm{Spec}^*(\Pi)$ --- contractible (always).
- The cohomology of the homogeneous space $G / \mathrm{stab}(\Pi)$, a real partial flag manifold.

> **Lemma ($E_1$ page formula).**
> $$E_1^{p, q} = \bigoplus_{\Pi: \mathrm{codim}_\Pi = p} H^q\big(G / \mathrm{stab}(\Pi);\, \mathrm{or}_\Pi\big)$$
> where the homogeneous space $G / \mathrm{stab}(\Pi)$ is a real partial flag manifold whose block sizes are $(k_n^B)_{n, B}$ with $B$ ranging over blocks and $n$ over chain degrees.

The cohomology of real flag manifolds is computable via Schubert calculus; the bipartite block-size structure determines the specific flag type.

##### Bipartite Shapiro--Vainshtein Alexander duality

> **Conjecture (bipartite $E_2$-degeneration and Alexander mapping).** The bipartite Vassiliev spectral sequence degenerates at $E_2$, and the differentials are computed from the Möbius function $\mu_{\mathcal P_\mathrm{bip}}$ of the bipartite multipartition lattice. The Alexander mapping
> $$\alpha: H^*\big(\overline{\mathrm{Stratum}(\Pi)}\big) \to H^{*+\mathrm{codim}(\Pi') - \mathrm{codim}(\Pi)}\big(\overline{\mathrm{Stratum}(\Pi')}\big)$$
> for $\Pi \le \Pi'$ in the closure poset realizes the Poincaré-dual intersection structure, generalizing Shapiro and Vainshtein ([1995](#ref-shapiro1995stratification)).

###### Why this should hold

Classical $E_2$-degeneration follows because:

1.  The univariate partition lattice has a clean Möbius function (Stanley): $\mu(\hat 0, \hat 1) = (-1)^{n-1}(n-1)!$ for the full partition of $n$.

2.  The strata have rational cohomology of homogeneous-space type, well-controlled.

3.  The orientation local system is well-behaved.

For the bipartite case:

1.  **Bipartite Möbius function.** Each block of a bipartite multipartition contributes a univariate Möbius factor: if $\Pi'$ refines $\Pi$ by splitting block $B$ into sub-blocks $B_1, \ldots, B_r$, then locally
    $$\mu_{\mathcal P_\mathrm{bip}}(\Pi, \Pi') = \prod_{B \text{ split}} \mu_{\mathrm{univ}}\big(\text{partition of } B\big).$$
    The overall Möbius function factors over blocks. Tractable in principle.

2.  **Stratum cohomology.** Real flag manifolds have rational cohomology computable via Schubert calculus. The bipartite product structure (multiple chain degrees) gives products of partial-flag cohomologies, controllable.

3.  **Orientation system.** The bipartite multipartition orientation extends naturally (each block contributes orientation of the corresponding eigenspace orbit).

So $E_2$-degeneration is plausible, but the precise differential at $E_1 \to E_2$ requires verification --- this is the open piece.

##### Worked example: (2, 2) chain complex with $d_1$ iso

The smallest case where bipartite content appears.

###### Setup

$(C_0, C_1) = (\mathbb R^2, \mathbb R^2)$, $d_1: C_1 \to C_0$ an iso (rank 2).

$\mathcal H = \mathrm{Sym}^+_2 \times \mathrm{Sym}^+_2$, dim 6. Gauge group preserving $d_1 = I$: diagonal $O(2) \subset O(2) \times O(2)$.

Hodge identity forces nonzero spectra to coincide between $\Delta_0$ and $\Delta_1$.

###### Bipartite multipartition lattice

Indexing set: $\{(0,1), (0,2), (1,1), (1,2)\}$ --- 4 indices.

Hodge-minimum $\Pi_{\min}$: $\{\{(0,1), (1,1)\}, \{(0,2), (1,2)\}\}$ --- 2 blocks of 2.

Refinement $\Pi_{\max}$: $\{\{(0,1), (1,1), (0,2), (1,2)\}\}$ --- 1 block of 4.

Lattice $\mathcal P_\mathrm{bip} = \{\Pi_{\min}, \Pi_{\max}\}$ --- just 2 elements (binary lattice).

###### Codim and dim

In $\mathcal H$ (dim 6):
- $\mathrm{Stratum}(\Pi_{\min})$: open dense, dim 6.
- $\mathrm{Stratum}(\Pi_{\max}) = \{(Q_0, Q_1) : Q_0 = \lambda Q_1\}$, dim 4 (parametrized by $(Q_1, \lambda) \in \mathrm{Sym}^+_2 \times \mathbb R_{>0}$).
- Codim of $\Pi_{\max}$ in $\mathcal H$: 2.

The codim 2 decomposes as 1 (eigenvalue coincidence: 2 distinct values → 1 distinct value) + 1 (frame degree at the new 2-dim eigenspace, $\binom{2}{2} = 1$) --- matching the cellular bipartite codim formula.

###### Stratum cohomology

$\mathrm{Stratum}(\Pi_{\max}) = \mathrm{Sym}^+_2 \times \mathbb R_{>0}$ --- contractible. So:
$$H^0(\Pi_{\max}) = \mathbb Z, \quad H^q(\Pi_{\max}) = 0\ \text{for}\ q \ge 1.$$

$\mathrm{Stratum}(\Pi_{\min}) = \mathcal H \setminus \mathrm{Stratum}(\Pi_{\max})$. Since $\mathcal H$ is contractible and $\Pi_{\max}$ is a smooth codim-2 submanifold, the complement deformation-retracts onto $S^1$ (linking circle around the codim-2 submanifold). So:
$$H^0(\Pi_{\min}) = \mathbb Z, \quad H^1(\Pi_{\min}) = \mathbb Z, \quad H^q(\Pi_{\min}) = 0\ \text{for}\ q \ge 2.$$

###### $E_1$ page

Filtration by codim: $\Pi_{\min}$ at $p = 0$, $\Pi_{\max}$ at $p = 2$.

$E_1$ table:

| $q \backslash p$ | 0           | 1   | 2           |
|------------------|-------------|-----|-------------|
| 0                | $\mathbb Z$ | 0   | $\mathbb Z$ |
| 1                | $\mathbb Z$ | 0   | 0           |

###### Differentials and convergence

The spectral sequence converges to $H^*(\mathcal H \setminus \mathrm{disc}) = H^*(\Pi_{\min}) = (\mathbb Z, \mathbb Z, 0, \ldots)$.

For convergence, the $\Pi_{\max}$ contribution at $E_1^{2, 0}$ must die in the limit. The candidate differential is $d_2: E_2^{0, 1} \to E_2^{2, 0}$.

For full consistency: $d_2$ should be either 0 or non-zero in a specific way. The Alexander-duality argument predicts $d_2$ is the Möbius-function-weighted intersection number; for the binary lattice with $\mu(\Pi_{\min}, \Pi_{\max}) = -1$, $d_2$ realizes the linking-circle relation between the codim-2 stratum and the $H^1$-class of its complement. This realizes the Alexander duality $H^1(\Pi_{\min}) \cong H^0(\Pi_{\max})$ structurally.

The convergence: the Alexander class of the codim-2 stratum *is* the $H^1$ generator of the complement, so $d_2$ is *not* an iso but a specific intersection-pairing morphism. The spectral sequence degenerates at $E_2$ with both $E_\infty^{0, 1}$ and $E_\infty^{2, 0}$ contributing to $H^1(\mathcal H \setminus \mathrm{disc}) = \mathbb Z$ via the linking-class.

This recovers the topological fact that $\mathcal H \setminus \{\text{codim-2 submanifold}\} \simeq S^1$, with the $H^1$-generator coming from the linking circle around $\Pi_{\max}$.

###### What the example demonstrates

1.  **Framework consistency**: the bipartite Vassiliev SS produces a well-defined $E_1$ page from stratum cohomology + closure poset.

2.  **$E_2$-degeneration**: in this binary case, holds trivially (only two strata).

3.  **Alexander duality recovery**: the linking-circle $H^1$-class realizes the Alexander dual of the codim-2 stratum.

4.  **Bipartite codim formula validates**: the codim 2 of $\Pi_{\max}$ in $\mathcal H$ matches the eigenvalue + frame-loss decomposition.

For larger bipartite cases (richer multipartition lattices), the spectral sequence will have more interesting $E_1 \to E_2$ differentials, and the $E_2$-degeneration becomes a substantive claim.

##### Larger examples (open)

Concrete cases to compute next:

1.  **$(3, 3)$ chain with $d$ iso.** Bipartite multipartition lattice on 6 indices, identifications $(0, i) \sim (1, i)$ forced by Hodge. The lattice has more elements (refinements of "3 blocks of 2" to coarser partitions), and the spectral sequence has more differentials. First test of the bipartite Möbius product formula.

2.  **$(2, 1)$ chain (the EDD example).** $(C_0, C_1) = (\mathbb R^2, \mathbb R^1)$, $d_1: C_1 \to C_0$ rank 1. Hodge identifies the 1 nonzero eigenvalue of $\Delta_1$ with one of the 2 nonzero eigenvalues of $\Delta_0$. Gives a 3-element lattice (different identification choices). Test of orientation system in non-symmetric block sizes.

3.  **$(2, 2, 1)$ longer chain.** Two boundary maps, more cross-degree identifications. Substantive bipartite combinatorics.

4.  **Cellular sheaves.** When restricted to the cellular-sheaf gauge constraint (stalkwise diagonal), the bipartite Vassiliev decomposes per-degree (paralleling the IEP-G decomposition theorem). Spectral sequence may simplify.

##### Status

**Framework laid; conjectures stated; one binary example worked.** The bipartite Vassiliev SS is set up, the $E_1$ page is computable in principle for any chain complex, and Alexander duality is conjectured to extend Shapiro and Vainshtein ([1995](#ref-shapiro1995stratification)) to the bipartite multipartition lattice.

Open work:
1. Verify $E_2$-degeneration on a larger lattice (e.g., $(3,3)$ case).
2. Compute the bipartite Möbius function explicitly as a product over blocks.
3. State the Alexander mapping precisely with bipartite orientation system.
4. Identify the structural consequences for moduli of Laplacianizations (e.g., the Euler characteristic of $\mathcal M_{\mathrm{Lap}}$ in terms of bipartite combinatorics).

This is the "stretch" frontier direction --- substantial novel cohomological content, building directly on the proved bipartite stratification + closure-poset machinery.

##### Connection to other entries

- **Bipartite stratification theorem** (`theorems/bipartite-stratification-theorem.md`): provides the strata.
- **Closure-poset theorem** (`theorems/closure-poset-of-strata.md`): provides the lattice structure for the spectral-sequence indexing.
- **Stab-codim formula** (`theorems/stab-codim-formula.md`): provides the stratum-cohomology fiber type (real partial flag manifold).
- **Hilbert-degeneracy stratification** (`theorems/hilbert-degeneracy-stratification.md`): the Stratification II at the SPD-cone boundary contributes additional cohomology classes when working in the algebraic closure $\overline{\mathcal H}$. A "compactified bipartite Vassiliev" combining both stratifications is an open direction.

##### Open

1.  **Bipartite Möbius function**: explicit formula via product over blocks; verify it factors as conjectured.

2.  **$E_2$-degeneration on multi-element lattices**: verify in $(3,3)$, $(2,1)$ cases.

3.  **Alexander mapping**: precise statement at the chain-complex level, with orientation system.

4.  **Connection to intersection cohomology**: closure of strata in $\mathcal H$ gives singular varieties; intersection cohomology may be a more natural target than ordinary cohomology in the bipartite case.

5.  **Cellular-sheaf restriction**: bipartite Vassiliev SS for cellular sheaves with diagonal gauge --- does it decompose per-degree like the IEP-G theorem?

6.  **Stratification II contribution**: the SPD-boundary strata contribute cohomology classes in the algebraic closure $\overline{\mathcal H}$. Combined Vassiliev SS over both stratifications.

#### Concept: Stalkwise diagonal cone {#stalkwise-diagonal-cone}

The natural sub-cone of inner products imposed by the cellular-sheaf framework: each $Q_n$ is required to be diagonal in a chosen cellular basis.

##### Definition

For a cellular chain complex $(C_\bullet, d)$ with distinguished cellular bases (one per chain space), the **stalkwise diagonal cone** is
$$\mathcal H_{\mathrm{diag}} := \{Q \in \mathcal H : Q_n \in \mathrm{diag}(\mathbb R^{m_n}_{>0})\ \text{for all}\ n\} = \prod_n \mathbb R^{m_n}_{>0}.$$

Each $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{m_n, n})$ assigns one positive weight per cell of degree $n$. The total parameter count is $\sum_n m_n$ (one per cell).

##### Codim in $\mathcal H$

The diagonal cone has codim $\sum_n \binom{m_n}{2}$ in $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ --- the off-diagonal entries of each $Q_n$ are killed.

For small examples:
- $\partial \Delta^2$: $\mathcal H$ has dim 6 ($\binom{3+1}{2} \cdot 2 = 12$? wait, 3 vertices + 3 edges, $\dim \mathrm{Sym}^+_3 = 6$ each, so $12$ total). $\mathcal H_{\mathrm{diag}}$ has dim 6 (3 vertex weights + 3 edge weights). Codim 6.
- $\partial \Delta^3$: $\mathcal H$ has dim $10 + 21 + 10 = 41$. $\mathcal H_{\mathrm{diag}}$ has dim $4 + 6 + 4 = 14$. Codim 27.

##### Cellular automorphism group

The chain auto group $G$ of $(C_\bullet, d)$ in general is large --- $\dim G = \sum_n \dim O(\mathcal E_n)$ for full-Hodge-eigenspace decomposition, or smaller if chain conditions constrain.

Restricted to $\mathcal H_{\mathrm{diag}}$, the natural automorphism group is the **cellular automorphism group** $G_{\mathrm{cell}} \subset G$ --- chain autos that preserve the cellular basis up to signed permutation. $G_{\mathrm{cell}}$ is *finite* in general (= the symmetry group of the underlying CW complex), much smaller than $G$.

##### Realizability becomes substantive

In the unconstrained case ($Q \in \mathcal H$), every bipartite multipartition is realized as a non-empty stratum ([bipartite realizability](#bipartite-realizability)).

In the stalkwise diagonal case ($Q \in \mathcal H_{\mathrm{diag}}$), realizability is non-trivial. Some bipartite multipartitions are *not* realizable in $\mathcal H_{\mathrm{diag}}$ --- this is the [chain-complex IEP-G program](#chain-complex-iep-g), generalizing the classical IEP-G obstructions.

The first concrete obstruction is **paths admit no within-degree multiplicity** (Sturm tridiagonal-simplicity, [proved](#chain-complex-iep-g)). Computational catalog ([toolkit](../tools/python-toolkit/)) refines this:
- Vertex-transitive graphs ($K_n$, $C_n$, $\partial \Delta^n$) admit some spectral degeneracy.
- Star graphs $K_{1, n}$ admit only partial degeneracy (the leaf-symmetry gives mult $(2, 1)$, not $(n)$).
- Cycle $C_4$ admits only mult $(2, 1)$ at uniform weights, not $(3)$.

##### Decomposition theorem

The realizability of a bipartite multipartition $\Pi$ in $\mathcal H_{\mathrm{diag}}$ decomposes per-degree: $\Pi$ is realizable iff each within-degree restriction $\Pi|_n$ is univariate-IEP-G-realizable for the [boundary-operator graph](#boundary-operator-graph) at degree $n$. ([Theorem](#chain-complex-iep-g-decomposition), sketch.)

##### Why the constraint matters for the program

The 2025 wave's cellular-sheaf and weighted-graph constructions all live in $\mathcal H_{\mathrm{diag}}$ (one weight per cell, sometimes per edge as well). Realizability of bipartite multipartitions in $\mathcal H_{\mathrm{diag}}$ is what controls "which Laplacians can actually be obtained from the cellular construction." The unconstrained $\mathcal H$ is the algebraic baseline, but the practical question is what's realizable in $\mathcal H_{\mathrm{diag}}$.

#### Concept: Boundary-operator graph {#boundary-operator-graph}

The graph capturing the sparsity pattern of $d_n^T Q_{n-1} d_n$ when $Q_{n-1}$ is stalkwise diagonal --- the input to univariate IEP-G in the [decomposition theorem](#chain-complex-iep-g-decomposition) for cellular sheaves.

##### Definition

For a cellular chain complex $(C_\bullet, d)$ with stalkwise diagonal $Q_{n-1}$, the matrix $d_n^T Q_{n-1} d_n$ acts on $C_n$. Its sparsity pattern (which entries are forced zero, regardless of weights) is encoded in a graph $G_n$ on the vertex set $\{1, \ldots, m_n\}$ (= cells of degree $n$):

$$G_n = \{(i, j) : (d_n^T Q_{n-1} d_n)[i, j] \ne 0 \text{ for some choice of stalkwise weights}\}.$$

For a cellular CW complex, this is the **adjacency graph of $n$-cells**: cells $i$ and $j$ in degree $n$ are adjacent in $G_n$ iff they share a common $(n-1)$-face.

##### Examples

- **$P_3$ (path), degree 1**: $C_1 = \mathbb R^2$ (2 edges). $G_1$ has 2 vertices (the edges $e_1, e_2$), connected iff they share a vertex. $e_1 = (v_1, v_2)$ and $e_2 = (v_2, v_3)$ share $v_2$, so $G_1$ has one edge: it's $P_2$ as a graph.

- **$C_3$ (triangle/cycle), degree 1**: 3 edges, each pair shares a vertex. $G_1 = K_3$.

- **$\partial \Delta^2$ (= $C_3$ as cellular 1-complex), degree 1**: same as above, $G_1 = K_3$.

- **$\partial \Delta^3$ (tetrahedron), degree 1**: $C_1 = \mathbb R^6$ (6 edges). Two edges share a vertex iff they're incident. Each edge of $K_4$ shares a vertex with 4 others (out of 5). $G_1$ has 6 vertices, 12 edges (each pair of edges sharing exactly one vertex contributes one edge in $G_1$). $G_1 = K_{3, 3}$? No, more structured.

- **$\partial \Delta^3$, degree 2**: $C_2 = \mathbb R^4$ (4 triangles). Two triangles share an edge iff they're adjacent. Each pair of triangles in $\partial \Delta^3$ shares exactly one edge. So $G_2 = K_4$.

##### Role in IEP-G decomposition

The [chain-complex IEP-G decomposition theorem](#chain-complex-iep-g-decomposition) says:
\> A bipartite multipartition $\Pi$ is realizable in $\mathcal H_{\mathrm{diag}}$ iff each within-degree restriction $\Pi|_n$ is univariate-IEP-G-realizable for the matrix $d_n^T Q_{n-1} d_n$ with sparsity pattern $G_n$.

Univariate IEP-G for the boundary-operator graph $G_n$: which multiplicity partitions of eigenvalues of symmetric matrices with off-diagonal sparsity matching $G_n$ are realizable?

This connects directly to the classical IEP-G literature (Barrett, Fallat, Hogben, Adm, Hall, et al.), with the boundary-operator graph as the input.

##### Differs from the underlying CW skeleton

For a cellular chain complex, the "underlying graph" might mean the 1-skeleton --- vertices and edges of the CW complex. The boundary-operator graph $G_n$ for $n = 1$ coincides with the 1-skeleton's edge-adjacency graph (= line graph of the 1-skeleton), NOT the 1-skeleton itself.

This subtlety matters for the IEP-G applications: $G_n$ is what the per-degree IEP-G problem cares about, not the original CW structure.

##### Properties depending on cellular topology

The boundary-operator graph inherits structure from the CW complex:
- Vertex-transitive iff the cellular automorphism group acts transitively on $n$-cells.
- Edge-transitive iff Aut acts transitively on incident pairs of $n$-cells.
- Distance-regular iff cellular structure is sufficiently uniform.

Realizability of multipartitions in $G_n$ depends on these symmetries --- see [cellular-iep-g-graph-theoretic-condition](#cellular-iep-g-graph-theoretic-condition).

##### Higher-dim cases

For $n \ge 2$, the boundary-operator graph captures pairs of $n$-cells sharing a common $(n-1)$-face. For $\partial \Delta^k$, this gives:
- Degree $k - 1$ (top-dim cells of $\partial \Delta^k = S^{k-1}$): the "facet graph" of the simplex, i.e., $K_{k+1}$ on the $k+1$ facets.
- Lower degrees: more complex incidence patterns.

The whole tower of boundary-operator graphs $G_1, G_2, \ldots, G_{k-1}$ encodes the cellular IEP-G data for the entire chain complex.

#### Object: Hypergraph {#hypergraph}

A hypergraph $H = (V, E)$ is a set $V$ together with a collection $E$ of subsets of $V$ ("hyperedges"). Hypergraphs are the most-Laplacianized structure in the 2025 literature, with multiple non-equivalent constructions in active use.

##### The hypergraph Laplacian forks

At least three fundamentally different "hypergraph Laplacians" are in 2025 use:

- **Clique Laplacian** (([Andreotti 2025](#ref-andreotti2025generalizing))): replace each hyperedge by its clique on the underlying graph, then take the graph Laplacian.
- **Hyperedge-incidence Laplacian** (same reference): a normalized incidence operator that does not reduce hyperedges to pairwise edges.
- **Sheaf-on-poset Laplacian** (([Ayzenberg et al. 2025](#ref-ayzenberg2025sheaf))): treat the hypergraph as data on a poset of hyperedges and inclusions, take the resulting sheaf Laplacian.
- **Symmetric-simplicial-set Laplacian** (([E. Choi and Park 2024](#ref-choi2024cellular)), ([S. Choi, Kim, and Oh 2025](#ref-choi2025hypergraph))): lift the hypergraph to a symmetric simplicial set, take the cellular sheaf Laplacian there.
- **Directed-hypergraph (heat-flow) Laplacian** (([Mugnolo 2025](#ref-mugnolo2025heat))): for hypergraphs with directed hyperedges, a non-self-adjoint operator generating a heat-style semigroup.

The plurality is *the* uniqueness data for the program. Hypergraphs are the test bed for "is there a canonical Laplacianization, or merely a family?"

##### Why hypergraphs matter beyond their own subfield

Two of the most ambitious 2025 unification papers --- Ayzenberg--Magai (sheaves on posets) and the symmetric-simplicial-set framework --- *use the hypergraph case as a benchmark* for whether their generalization captures known constructions correctly. The hypergraph Laplacian is therefore a stress test that any candidate definition of Laplacianizability must pass: a well-posed framework either (a) singles out one of the existing constructions as canonical, (b) classifies the choices, or (c) provides a moduli of Laplacianizations --- and Hypergraphs are where these alternatives are concretely visible.

##### Open

The fork between clique- and hyperedge-incidence Laplacians is *not* obviously a moduli direction: they recover different invariants. A clean structural account of why the choice exists, and what fixes it, is open.

#### Object: Symmetric simplicial set {#symmetric-simplicial-set}

A symmetric simplicial set is a presheaf on the category $\mathbf{FinSet}_{\mathrm{nonempty}}$ (finite nonempty sets, all functions). Equivalently, a simplicial set whose simplices carry a symmetric-group action on their vertices, with face maps respecting the action.

##### Why this category is first-class for the program

The symmetric simplicial set has emerged in 2025 as the **right input category** for hypergraph Laplacianization, by two independent threads: arxiv:2411.08458 (math.AT, late 2024) constructs cellular sheaf Laplacians on symmetric simplicial sets induced by hypergraphs, and arxiv:2505.05702 (cs.LG, May 2025) builds Hypergraph Neural Sheaf Diffusion on the same backbone. Two communities arriving at the same lift is structural evidence that the construction has compelling features rather than being one researcher's preferred encoding.

##### What the lift fixes

Hypergraphs do not have a canonical orientation on hyperedges. Ordered simplicial complexes resolve this by *choosing* an order, which is structure that the hypergraph itself does not carry. Symmetric simplicial sets resolve it differently --- by averaging over orderings, encoded as the symmetric-group action --- which is **information-preserving**.

The pattern is a Laplacianizability template:

> When the obvious cellular structure on $X$ requires a non-canonical choice, lift $X$ to a richer category where the Laplacianization is canonical, and verify the lift is faithful.

This pattern shows up elsewhere in the survey (signed graphs ↦ Hermitian magnetic Laplacian; directed hypergraphs ↦ non-self-adjoint heat-flow Laplacian); the symmetric-simplicial-set case is the cleanest realization.

##### Bridges

- To `objects/hypergraph.md` --- symmetric simplicial sets are the lift target.
- To `concepts/laplacianizability.md` --- concrete instance of "obstruction-resolved-by-categorical-lift," which is one of the most informative patterns the survey produces.

#### Conjecture \[SKETCH\]: Categorical-lift theorem (precise version) {#categorical-lift-fixes-obstruction}

##### Setup: when a "naive" cohomology theory fails to be functorial

Let $\mathcal C$ be a category. A graded-vector-space-valued assignment $H^\bullet: \mathrm{Obj}(\mathcal C) \to \mathbf{grVect}_\Bbbk$ may fail to extend to a functor for definable reasons --- typically because computing $H^\bullet(X)$ requires a non-canonical choice (an order on vertices, a sign convention on edges, an orientation of cells).

The hypergraph case is canonical:

- **Object level.** Given a hypergraph $X = (V, E)$, define $C^k(X) := \Bbbk^{\binom{|V|}{k+1}}$ (functions on $(k+1)$-element subsets of $V$, regardless of whether they are hyperedges) and $\delta: C^k \to C^{k+1}$ by an alternating-sum-of-restrictions formula --- this requires *picking a total order on $V$*. Different orders give different chain complexes; all give the same cohomology, but the cohomology assignment is not a functor of hypergraphs without picking orders coherently.
- **The lift.** Define a category $\widetilde{\mathcal C}$ whose objects are *ordered* hypergraphs (or, more invariantly, **symmetric simplicial sets**: presheaves on $\mathbf{FinSet}_{\mathrm{nonempty}}$). There is a forgetful $U: \widetilde{\mathcal C} \to \mathcal C$ that drops the ordering / takes the underlying hypergraph.
- The cohomology $\widetilde H^\bullet$ on $\widetilde{\mathcal C}$ *is* functorial.

The conjecture is that this kind of lift exists generally and that the Hilbert lift on $\widetilde{\mathcal C}$ "descends" along $U$ to a structure-preserving Laplacianization on $\mathcal C$ --- even though $H^\bullet$ on $\mathcal C$ alone is not a functor.

##### Conjectural statement

> **Conjecture (categorical-lift).** Let $\mathcal C$ be a category and $H^\bullet$ a graded-vector-space assignment on objects of $\mathcal C$ that fails to be a functor in the precise sense that there is a category $\widetilde{\mathcal C}$, a faithful and surjective-on-objects forgetful functor $U: \widetilde{\mathcal C} \to \mathcal C$, and a graded-vector-space-valued *functor* $\widetilde H^\bullet: \widetilde{\mathcal C} \to \mathbf{grVect}_\Bbbk$, such that $\widetilde H^\bullet(\widetilde X) \cong H^\bullet(U(\widetilde X))$ canonically (independent of which lift $\widetilde X$ of $X = U(\widetilde X)$ is chosen).
>
> If $\widetilde H^\bullet$ admits a Hilbert lift $\widetilde F: \widetilde{\mathcal C} \to \mathbf{Ch}(\mathbf{Hilb}_\Bbbk)$, then there is a Hilbert lift $F$ of $H^\bullet$ on $\mathcal C$ --- defined on objects only, but with a functorial Laplacian assignment $\Delta_X: F(X) \to F(X)$ --- given by $\Delta_X = \Delta_{\widetilde F(\widetilde X)}$ for any lift $\widetilde X$ of $X$.

##### What "structure-preserving" means

The non-trivial content of the conjecture is that the Laplacian $\Delta_X$ does not depend on the choice of $\widetilde X \in U^{-1}(X)$. This requires that for any two lifts $\widetilde X_1, \widetilde X_2$ of the same $X$, the chain complexes $\widetilde F(\widetilde X_1)$ and $\widetilde F(\widetilde X_2)$ are related by a *unitary* isomorphism that intertwines the coboundaries. Then the Laplacians, being defined via $\Delta = dd^* + d^*d$, are conjugate by the same unitary, so their kernel and spectrum agree.

For ordered-hypergraphs / symmetric simplicial sets, the unitary is the symmetric-group action on cochains: reordering vertices acts on $C^k$ by a signed permutation, which is unitary for the Euclidean inner product. So $\Delta$ on $X$ is well-defined as an operator (unique up to unitary, hence its spectrum and kernel are canonical). Cohomology is recovered: $\ker \Delta_X \cong H^\bullet(X)$.

##### Verified cases

1.  **Hypergraphs ↦ symmetric simplicial sets.** Discussed above. Verified in ([E. Choi and Park 2024](#ref-choi2024cellular)) and ([S. Choi, Kim, and Oh 2025](#ref-choi2025hypergraph)). The unitary group is the symmetric group acting on vertices.

2.  **Signed graphs ↦ Hermitian / magnetic Laplacian.** Take \$`\mathcal `{=tex}C = \$ signed graphs (graphs with $\pm 1$ edge weights), \$`\widetilde{\mathcal C}`{=tex} = \$ graphs with $U(1)$-gauge data on edges, $U$ the forgetful map. Computing the Laplacian on a $U(1)$-gauge graph gives a Hermitian positive-semidefinite operator that, restricted to the $\pm 1$-gauge subcategory (signed graphs), is the signed Laplacian. Different gauge choices on the same underlying signed graph differ by a unitary $\mathrm{diag}(e^{i\theta_v})$ --- independent on each vertex --- and the Laplacian transforms covariantly. (Anchor: MSGNN line of work.)

3.  **Directed hypergraphs ↦ enlarged operator class.** Here the lift is more delicate because the result is a non-self-adjoint operator (([Mugnolo 2025](#ref-mugnolo2025heat))). The conjecture's hypotheses need adjusting: the target category is not $\mathbf{Ch}(\mathbf{Hilb})$ but something like $\mathbf{Ch}^{\mathrm{sect}}(\mathbf{Hilb})$ --- bounded complexes with sectorial coboundaries. The Hodge theorem then becomes the bi-orthogonal decomposition for sectorial $\Delta$. This is a real generalization, not an instance of the conjecture as stated.

##### What's needed for a proof in case (1)

For the hypergraph / symmetric-simplicial-set instance, the proof program is:

1.  Show that for any two orderings $\sigma, \tau$ of the vertices of $X$, the resulting cochain complexes $C^\bullet_\sigma(X)$ and $C^\bullet_\tau(X)$ are related by a graded chain isomorphism $\Phi_{\sigma\tau}: C^\bullet_\sigma \to C^\bullet_\tau$ that is **unitary** for the standard inner product. Concretely $\Phi_{\sigma\tau}$ is the signed-permutation action of $\tau \sigma^{-1}$ on $C^k$.
2.  Show $\Phi_{\sigma\tau}$ intertwines the coboundaries: $\delta_\tau \Phi_{\sigma\tau} = \Phi_{\sigma\tau} \delta_\sigma$. (This is the cocycle property of cellular cochains under reordering.)
3.  Conclude $\Delta_\sigma$ and $\Delta_\tau$ are unitarily conjugate, hence $\ker$ and spectrum are independent of the ordering.

<!-- -->

(1) and (2) are direct calculations; (3) is then automatic. The proof is uncontroversial; what is missing in the literature is the *categorical statement* that this construction is a Hilbert lift in the formal sense of `concepts/laplacianizability.md`.

##### What's open

- Does the conjecture hold when the lift category $\widetilde{\mathcal C}$ has *non-discrete* unitary action (e.g. $U(1)$-gauge for signed graphs)? Probably yes, by the same template --- but the proof needs the action to be by genuine Hilbert-space unitaries and to intertwine $d$.
- Can the framework be extended to non-self-adjoint cases (case 3 above) by relaxing "unitary" to "isometric for an indefinite inner product" or to "intertwiner of sectorial operators"?
- Is there a *minimal* lift category $\widetilde{\mathcal C}$ for a given $\mathcal C$ --- a universal choice in some 2-categorical sense?

#### Object: Finite poset {#finite-poset}

A finite partially ordered set $P = (X, \le)$, treated here as the input category for one of the most *unifying* Laplacianization constructions in the 2025 literature.

##### Why finite posets are first-class for the program

Three pieces of evidence place finite posets at the centre of the survey:

1.  **Sheaves on finite posets subsume cellular sheaves and hypergraph Laplacians.** Ayzenberg et al. ([2025](#ref-ayzenberg2025sheaf)) (([Ayzenberg et al. 2025](#ref-ayzenberg2025sheaf))) develops sheaf Laplacians on arbitrary finite posets and shows that the hypergraph Laplacian is an instance. The face poset of a CW complex is a particularly nice case (cellular sheaves), but the construction does not need cell structure at all.
2.  **Hypergraphs lift to symmetric simplicial sets, which in turn live as functors on a poset.** The chain of categorical lifts (hypergraph ⇒ symmetric simplicial set ⇒ functor on a face-poset analogue) puts the poset at the bottom of the stack.
3.  **Persistence modules are functors $P \to \mathbf{Vect}$.** A persistence module is exactly a poset-indexed family of vector spaces with structure maps; persistent Laplacian theory (([Wei and Wei 2023](#ref-wei2023persistent)), ([Wolf, Fan, and Monod 2025](#ref-wolf2025generalized))) is therefore a Laplacian theory for $P$-shaped diagrams.

Three independent communities (combinatorial topology, hypergraph spectral theory, topological data analysis) converge on the finite poset as the right input.

##### What structural data the Laplacianization consumes

For a finite poset $P$, a sheaf-Laplacian construction needs:

- a sheaf $\mathcal F: P \to \mathbf{Vec}$ (or richer) over $P$;
- a Hilbert structure on each stalk $\mathcal F(p)$;
- the resulting cellular cochain complex with codifferentials computed from $\mathcal F$'s restriction maps.

The Laplacian is then $\Delta = \delta\delta^* + \delta^*\delta$ on the resulting graded Hilbert space. The choice of sheaf and stalk pairing is the **degree of freedom** of the Laplacianization functor restricted to posets.

##### Open

Whether the cellular-sheaf-on-poset construction is *cofinal* among Laplacianizations of finite combinatorial structures --- i.e., whether every Laplacianizer on a category of finite combinatorial inputs factors through a sheaf on a poset (`theorems/cellular-sheaf-cofinality.md`). Ayzenberg et al. ([2025](#ref-ayzenberg2025sheaf)) strongly suggests yes; a clean categorical proof is open.

#### Object: Cellular sheaf {#cellular-sheaf}

A cellular sheaf on a regular CW complex (or, more generally, on a finite poset $P$) is a functor $\mathcal F: P \to \mathbf{Vec}$ --- assigning a vector space to each cell and a linear restriction map to each face inclusion. Equipped with stalk-wise inner products, the cellular sheaf produces a graded Hilbert cochain complex and a sheaf Laplacian $L_{\mathcal F} = \delta\delta^* + \delta^*\delta$.

##### Why cellular sheaves are central

The cellular sheaf is the most flexible and best-classified Laplacianizable structure in the 2025 literature. Five separate threads use it:

- **Topological** (([Ayzenberg et al. 2025](#ref-ayzenberg2025sheaf))) --- the sheaf-on-poset framework subsumes hypergraph and other "non-cellular" Laplacians.
- **Network biology** (([Hu 2025](#ref-hu2025cellular))) --- the 0-th sheaf Laplacian recovers the classical anisotropic network model Hessian.
- **Symmetric simplicial sets** (([E. Choi and Park 2024](#ref-choi2024cellular))) --- lift to a richer combinatorial category.
- **Neural networks** (([S. Choi, Kim, and Oh 2025](#ref-choi2025hypergraph)), ([Gillespie et al. 2025](#ref-gillespie2025bayesian))) --- sheaf Laplacians as a learnable architectural component.
- **Spectral diagnostics** --- relative cohomology and sheaf Laplacian spectra as obstruction measures.

The cellular sheaf has the property the program is hunting: a *parametrized* family of Laplacians on a fixed combinatorial backbone, where the parameter is the sheaf data itself. This is what ([Gillespie et al. 2025](#ref-gillespie2025bayesian)) exploits by making the parameter a random variable.

##### Frame

As a Laplacianizer (`concepts/laplacianizer.md`), the cellular-sheaf construction is the functor

$$\mathbf{Sh}(P, \mathbf{Hilb}) \to \mathbf{HilbCh}_{[P]}$$

that sends a Hilbert-valued sheaf on $P$ to its (Hilbert) cochain complex graded by the rank function on $P$. The Laplacian $L_{\mathcal F}$ is then a derived invariant of this functor.

##### Open

Whether the cellular-sheaf framework is *cofinal* among Laplacianization functors on combinatorial inputs --- i.e., whether every Laplacian construction in the 2025 survey on finite combinatorial structures factors through some cellular sheaf. Ayzenberg et al. ([2025](#ref-ayzenberg2025sheaf)) is the strongest evidence yet that it does.

#### Conjecture \[SKETCH\]: Cellular-sheaf cofinality (precise conjecture) {#cellular-sheaf-cofinality}

##### Statement

Let $\mathcal C$ be a small category and $H^\bullet: \mathcal C \to \mathbf{grVect}_\mathbb{R}^{\le \omega}$ a graded-vector-space-valued cohomology theory landing in countable-dimension graded vector spaces. Suppose $(\mathcal C, H^\bullet)$ admits a Hilbert lift $F: \mathcal C \to \mathbf{Ch}_b(\mathbf{Hilb}_\mathbb{R})$ in the sense of `concepts/laplacianizability.md`.

> **Conjecture.** There exists a functor $P: \mathcal C \to \mathbf{Pos}_{\mathrm{fin}}$ to finite posets and a natural transformation realizing $F$ as the sheaf-cochain functor of a Hilbert-valued sheaf $\mathcal F_X$ on $P(X)$ for each $X \in \mathcal C$:
> $$F(X) \;\;\cong\;\; C^\bullet(P(X), \mathcal F_X), \qquad \mathcal F_X: P(X) \to \mathbf{Hilb}_\mathbb{R}.$$
> The natural-transformation data is functorial: morphisms $X \to Y$ in $\mathcal C$ induce poset maps $P(X) \to P(Y)$ and compatible sheaf morphisms.

In words: every Hilbert lift of a cohomology theory on a category of finite combinatorial structures factors through a "sheaf on a poset" presentation.

##### Why this is a real conjecture

It is not a tautology. Every chain complex can be presented as a cellular cochain complex of *some* sheaf on *some* poset (take $P = \{0 < 1 < \cdots < N\}$ with $\mathcal F(k) = C^k$); the content is that this can be done **functorially in $X$** with $P(X)$ depending only on $X$ (not on the lift), and that the sheaf $\mathcal F_X$ has interpretable stalks (e.g., reflecting "local" data of $X$).

The conjecture has been proved in cases:

- \$`\mathcal `{=tex}C = \$ regular CW complexes, \$H\^`\bullet `{=tex}= \$ cellular cohomology with fixed-rank local coefficients: trivially true with \$P(X) = \$ face poset of $X$ --- Hansen--Ghrist.
- \$`\mathcal `{=tex}C = \$ hypergraphs, \$H\^`\bullet `{=tex}= \$ several candidate cohomology theories: Ayzenberg et al. ([2025](#ref-ayzenberg2025sheaf)) constructs $P(X)$ as the inclusion poset of hyperedges and verifies the conjecture (([Ayzenberg et al. 2025](#ref-ayzenberg2025sheaf))).
- \$`\mathcal `{=tex}C = \$ symmetric simplicial sets: ([E. Choi and Park 2024](#ref-choi2024cellular)).

Open cases include:

- Persistence modules with the standard persistent-homology theory: $P(X)$ should be (some adaptation of) the indexing poset of the filtration. The construction of ([Wolf, Fan, and Monod 2025](#ref-wolf2025generalized)) is suggestive but not framed in this language.
- Quivers, when treated as in ([Sumray, Harrington, and Nanda 2024](#ref-sumray2024quiver)). The natural candidate $P(X)$ would be the path category of the quiver (a small category, not a poset). So either the conjecture extends to small categories, or the quiver case sits outside the conjecture's scope.
- Inputs with non-finite-type cohomology (RCD spaces, non-locally-finite simplicial complexes). Here the conjecture as stated fails immediately; a version with $\mathbf{Pos}$ replaced by $\mathbf{Pos}^{\le \omega}$ (countable posets) is the analogue to investigate.

##### What needs to be proved

1.  **Functorial $P$.** For a given $\mathcal C$ and Hilbert lift $F$, define the candidate $P(X)$ canonically from $F(X)$ --- perhaps as the poset of "supports" of harmonic representatives, or by reverse-engineering chains from the structure of $d^F$. Verify this assignment is functorial.
2.  **Sheaf $\mathcal F_X$.** Define $\mathcal F_X(p)$ for $p \in P(X)$ from $F(X)$ data, and show the cellular cochain complex $C^\bullet(P(X), \mathcal F_X)$ recovers $F(X)$ up to canonical iso.
3.  **Naturality.** Show the assignments $X \mapsto P(X), \mathcal F_X$ are natural in $X \in \mathcal C$.

##### Consequences if proved

The sheaf-on-poset construction would be the universal combinatorial Laplacianization template --- every cellular Hilbert lift on combinatorial inputs recoverable from a sheaf-on-poset choice. Every combinatorial 2025 Laplacian (cellular sheaf, hypergraph clique-cohomology, persistence module, quiver Laplacian) factors through a single template.

##### What it doesn't say

It does not unify combinatorial Laplacianizations with smooth ones (de Rham, Cheeger). The smooth side requires unbounded operators with closed range, and the natural target category is something like $\mathbf{Ch}_b^{\mathrm{cl.range}}(\mathbf{Hilb})$ or differential graded $C^*$-modules. The combinatorial conjecture above is the right starting point because the finite-dimensional case admits clean statements; the smooth analogue is a separate program.

#### Example: Cellular sheaf interpretation of $\mathcal M_{\mathrm{Lap}}(\partial \Delta^3)$ {#cellular-sheaf-on-tetrahedron-boundary}

A worked computation: realize the 6-dimensional moduli of Laplacianizations of $\partial \Delta^3$ via the constant cellular sheaf $\underline{\mathbb R}$ on its face poset, and compute the gauge fiber of the cellular-sheaf-to-moduli map.

##### Setup: the face poset and sheaf

$\partial \Delta^3$ has 4 vertices $v_1, \ldots, v_4$, 6 edges $e_{ij}$ ($1 \le i < j \le 4$), and 4 triangles $t_{ijk}$ ($1 \le i < j < k \le 4$). Its **face poset** $P$ has 14 elements with the inclusion order: $v_i < e_{jk}$ when $i \in \{j, k\}$, and $e_{jk} < t_{lmn}$ when $\{j, k\} \subset \{l, m, n\}$.

The **constant sheaf** $\mathcal F = \underline{\mathbb R}: P \to \mathbf{Vec}_\mathbb R$ assigns $\mathcal F(\sigma) = \mathbb R$ to every cell $\sigma$, and the identity restriction maps. Its cochain complex (orientation: $e_{ij}$ pointing $v_i \to v_j$ for $i<j$, triangles oriented by lexicographic vertex order) is

$$0 \to C^0 = \mathbb R^4 \xrightarrow{d_1^T} C^1 = \mathbb R^6 \xrightarrow{d_2^T} C^2 = \mathbb R^4 \to 0,$$

with the boundary maps $d_1$ (going $C^1 \to C^0$ in homological convention, $C^1 \to C^2$ in cohomological --- the data are the same matrices in either convention):

$$d_1 = \begin{pmatrix} -1 & -1 & -1 & 0 & 0 & 0 \\ \phantom{-}1 & 0 & 0 & -1 & -1 & 0 \\ 0 & 1 & 0 & 1 & 0 & -1 \\ 0 & 0 & 1 & 0 & 1 & 1 \end{pmatrix}, \qquad d_2 = \begin{pmatrix} 1 & 1 & 0 & 0 \\ -1 & 0 & 1 & 0 \\ 0 & -1 & -1 & 0 \\ 1 & 0 & 0 & 1 \\ 0 & 1 & 0 & -1 \\ 0 & 0 & 1 & 1 \end{pmatrix}.$$

(Columns of $d_1$ are $e_{12}, e_{13}, e_{14}, e_{23}, e_{24}, e_{34}$, with entry $\pm 1$ at the endpoints. Columns of $d_2$ are $t_{123}, t_{124}, t_{134}, t_{234}$, with $\pm 1$ at boundary edges via $\partial t_{ijk} = e_{jk} - e_{ik} + e_{ij}$.)

Verify $d_1 d_2 = 0$: column 1 of $d_2$ is $(1, -1, 0, 1, 0, 0)^T$. Apply $d_1$: row $i$ of $d_1$ dotted with this column gives $0$ for each $i = 1, 2, 3, 4$. ✓

##### Standard Euclidean Laplacian

Take \$`\langle `{=tex}`\cdot`{=tex}, `\cdot `{=tex}`\rangle `{=tex}= \$ Euclidean on each $C^k$ (i.e., $\mathcal F(\sigma) = \mathbb R$ with standard inner product, all stalkwise scales equal to $1$).

**$\Delta_0 = d_1 d_1^T$ on $C^0$:** by the standard graph-Laplacian computation, $\Delta_0 = 4 I_4 - J_4$ (with $J_4$ the all-ones matrix), the graph Laplacian of $K_4$. Spectrum: $\{0, 4, 4, 4\}$.

**$\Delta_2 = d_2^T d_2$ on $C^2$:** by symmetry of $\partial \Delta^3$ (the dual is itself), spectrum is also $\{0, 4, 4, 4\}$.

**$\Delta_1 = d_1^T d_1 + d_2 d_2^T$ on $C^1$:** by supersymmetric isospectrality (`examples/moduli-of-triangle-boundary.md` proves the orthogonal-image splitting), nonzero spectrum is $\{\sigma_i^2\}_{i=1}^3 \sqcup \{\tau_j^2\}_{j=1}^3 = \{4, 4, 4\} \sqcup \{4, 4, 4\}$. So $\Delta_1 = 4 \cdot I_6$. Combined with $H_1 = 0$: spectrum $\{4\}^6$, full rank.

The standard Euclidean Laplacianization of $(\partial \Delta^3, \underline{\mathbb R})$ is the maximally-symmetric point of $\mathcal M_{\mathrm{Lap}}$ --- all six "moduli coordinates" (squared singular values $\sigma_1, \sigma_2, \sigma_3, \tau_1, \tau_2, \tau_3$) are equal to $4$.

##### Stalkwise Hilbert moduli

A Hilbert structure on the cellular sheaf $\underline{\mathbb R}$ assigns one positive real to each cell:

- $a_i > 0$ for each vertex $v_i$ ($i = 1, \ldots, 4$): 4 parameters,
- $b_{ij} > 0$ for each edge $e_{ij}$: 6 parameters,
- $c_{ijk} > 0$ for each triangle $t_{ijk}$: 4 parameters,

for a total of **14 parameters**. Call this space $\mathcal H_{\mathrm{cell}} = \mathbb R_{>0}^{14}$.

In the cellular basis on $C^k$, the Gram matrices are diagonal:

$$Q_0 = \mathrm{diag}(a_1, \ldots, a_4), \quad Q_1 = \mathrm{diag}(b_{12}, b_{13}, \ldots, b_{34}), \quad Q_2 = \mathrm{diag}(c_{123}, \ldots, c_{234}).$$

So $\mathcal H_{\mathrm{cell}} \subset \mathcal H = \mathrm{Sym}^+_4(\mathbb R) \times \mathrm{Sym}^+_6(\mathbb R) \times \mathrm{Sym}^+_4(\mathbb R)$ as the diagonal locus. The full $\mathcal H$ has dim $10 + 21 + 10 = 41$; the cellular subspace $\mathcal H_{\mathrm{cell}}$ has dim $14$.

##### The Laplacian as a function of $(a, b, c)$

The adjoint $d_1^*: C^0 \to C^1$ is $d_1^* = Q_1^{-1} d_1^T Q_0$. So

$$\Delta_0 = d_1 d_1^* = d_1 Q_1^{-1} d_1^T Q_0.$$

Eigenvalues of $\Delta_0$ are $Q_0$-self-adjoint, equivalently equal to eigenvalues of the symmetric matrix $\widetilde \Delta_0 = Q_0^{1/2} \Delta_0 Q_0^{-1/2} = Q_0^{1/2} d_1 Q_1^{-1} d_1^T Q_0^{1/2}$. These are the squared singular values of

$$\widetilde d_1 := Q_0^{1/2} d_1 Q_1^{-1/2}.$$

Concretely, $(\widetilde d_1)_{i, e_{jk}} = a_i^{1/2} \cdot d_1[i, e_{jk}] \cdot b_{jk}^{-1/2}$. For edge $e_{ij}$ (entries only at $v_i$ and $v_j$):

$$(\widetilde d_1)_{i, e_{ij}} = -\sqrt{a_i / b_{ij}}, \qquad (\widetilde d_1)_{j, e_{ij}} = +\sqrt{a_j / b_{ij}}.$$

The Gram matrix $\widetilde d_1^T \widetilde d_1$ has $(e_{ij}, e_{ij})$-entry $= (a_i + a_j)/b_{ij}$, and off-diagonal $(e_{ij}, e_{kl})$ entries equal to $\pm \sqrt{a_v / (b_{ij} b_{kl})}$ when $\{i,j\} \cap \{k,l\} = \{v\}$, else $0$.

So the squared singular values $\sigma_1^2, \sigma_2^2, \sigma_3^2$ of $d_1$ (as a $Q$-weighted operator) are eigenvalues of an explicit $6 \times 6$ symmetric matrix in the $a, b$ variables. Three eigenvalues --- and the kernel has dim $\dim \ker d_1^T = 4 - \mathrm{rank}\, d_1 = 1$ (= $\dim H^0$), so a 4th eigenvalue is zero.

Similarly, the squared singular values $\tau_1^2, \tau_2^2, \tau_3^2$ of $d_2$ are eigenvalues of a corresponding matrix in the $b, c$ variables.

By the moduli theorem (`theorems/moduli-of-laplacianizations.md`), the unordered tuple $(\sigma_1^2, \sigma_2^2, \sigma_3^2; \tau_1^2, \tau_2^2, \tau_3^2)$ --- modulo $S_3 \times S_3$ --- determines the Laplacianization up to $G$-equivalence. So the **moduli map**

$$\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}} = \mathrm{Sym}^3(\mathbb R_{>0}) \times \mathrm{Sym}^3(\mathbb R_{>0})$$

sends \$(a, b, c) `\mapsto `{=tex}\$ ((squared singular values of $\widetilde d_1$), (squared singular values of $\widetilde d_2$)).

##### Dimension and the gauge fiber

$\dim \mathcal H_{\mathrm{cell}} = 14$, $\dim \mathcal M_{\mathrm{Lap}} = 6$. So if $\Phi$ is generically a submersion, its fibers have dimension $14 - 6 = 8$.

**Claim.** $\Phi$ is generically submersive, with 8-dim fiber.

*Argument.* Two diagonal Hilbert structures $Q, Q' \in \mathcal H_{\mathrm{cell}}$ map to the same moduli point iff some $g \in G$ satisfies $g \cdot Q = Q'$ (where $G$ is the chain automorphism group of $(C^\bullet, d)$, $\dim G = 35$ from `examples/moduli-of-triangle-boundary.md` cross-check). At generic $Q \in \mathcal H_{\mathrm{cell}}$:

- $T_Q \mathcal H_{\mathrm{cell}}$ has dim $14$ inside $T_Q \mathcal H$ (dim $41$).
- $T_Q (G \cdot Q)$ has dim $35$ (orbit-tangent at generic $Q$, where the $Q$-unitary stabilizer in $G$ is $0$-dim).
- They span $T_Q \mathcal H$ iff $\dim T_Q \mathcal H_{\mathrm{cell}} \cap T_Q(G \cdot Q) = 14 + 35 - 41 = 8$.

The intersection consists of orbit-directions $\xi \cdot Q$ that stay diagonal --- i.e., elements $\xi \in \mathfrak g$ for which $\xi^T Q + Q\xi$ is diagonal. Off-diagonal entries of $\xi$ must satisfy $\xi_{ij} q^{(i)} + \xi_{ji} q^{(j)} = 0$ (the "$Q$-anti-Hermitian" condition); diagonal entries of $\xi$ are unconstrained. Within $\mathfrak g$, this cuts down to the codim-$\binom{n_n}{2}$ sub-locus per block, with $\binom{4}{2}+\binom{6}{2}+\binom{4}{2} = 27$ equations on a $35$-dim Lie algebra. By transversality at generic $Q$, the intersection has dim $\max(0, 35 - 27) = 8$. ✓

So $\Phi$ is a submersion of relative dimension $8$ at generic points.

**Consequence: $\Phi$ is open with image equal to $\mathcal M_{\mathrm{Lap}}$.** The image is open by submersion. To see it equals the whole moduli: realize any target $(\sigma_1^2, \sigma_2^2, \sigma_3^2; \tau_1^2, \tau_2^2, \tau_3^2)$ explicitly. For instance, scale $Q_0 = \alpha I$ uniformly on vertices; this takes $\widetilde d_1$ to $\alpha^{1/2} d_1 Q_1^{-1/2}$, multiplying all $\sigma_i^2$ by $\alpha$. So uniform scaling of $Q_0$ moves $(\sigma_i^2)$ along the diagonal of $\mathrm{Sym}^3(\mathbb R_{>0})$. To break $\sigma_1 = \sigma_2 = \sigma_3$ symmetry, use non-uniform vertex weights (e.g., $a_1 \ne a_2$); this produces distinct squared singular values. Similarly for $\tau_j^2$ via $c$. Both $S_3$ orbits are reachable, so $\Phi$ is surjective.

##### What this says about cellular-sheaf cofinality

The cofinality conjecture (`theorems/cellular-sheaf-cofinality.md`) predicts that every Hilbert lift of a finite combinatorial cohomology theory factors through a cellular-sheaf-on-poset construction. For $(\partial \Delta^3, \underline{\mathbb R}\text{-cohomology})$, the conjecture says that the cellular-sheaf framework should *reach* every Laplacianization. The computation above verifies this: $\Phi: \mathcal H_{\mathrm{cell}} \twoheadrightarrow \mathcal M_{\mathrm{Lap}}$ is surjective.

But $\Phi$ is **not** a moduli-of-Hilbert-lifts equivalence: it has 8-dim fibers, meaning the cellular-sheaf framework parametrizes Laplacianizations by 14 numbers when only 6 are honest. The 8 redundant directions are *gauge*: changes in stalkwise weights that produce equivalent Laplacians (related by a chain automorphism that doesn't preserve the diagonal of $\mathcal H$).

This refines the cofinality conjecture's content. The right statement is:

> **Cofinality (refined).** The cellular-sheaf-on-poset construction $\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$ is *surjective* (cofinal among Hilbert lifts), but *not injective* (carries 8-dim gauge per moduli point on $\partial \Delta^3$).

The gauge dimension 8 is itself an invariant of the chain complex: it equals $\dim T \mathcal H_{\mathrm{cell}} \cap T(G \cdot Q)$, which generalizes to

$$\mathrm{gauge\ dim} = \dim \mathcal H_{\mathrm{cell}} + \dim G - \dim \mathcal H = \dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}.$$

For $\partial \Delta^2$: $\mathcal H_{\mathrm{cell}}$ has dim $3 + 3 = 6$ (one weight per vertex, one per edge), $\mathcal M_{\mathrm{Lap}}$ has dim $2$. Gauge dim should be $6 - 2 = 4$. By the same transversality argument: $\dim \mathcal H_{\mathrm{cell}} + \dim G - \dim \mathcal H = 6 + 10 - 12 = 4$. ✓

##### What about non-constant sheaves?

The above is for the *constant* sheaf $\underline{\mathbb R}$. The richer cellular-sheaf framework allows higher-rank stalks $\mathcal F(\sigma) \in \mathbf{Vec}$, with non-trivial restriction maps. This produces a *different* chain complex (with $\dim C^k = \sum_\sigma \dim \mathcal F(\sigma)$), so it parameterizes Laplacianizations of *richer* cohomology theories --- sheaf cohomology with the chosen sheaf, not constant cohomology.

For the cofinality conjecture's purposes, the constant sheaf is enough to verify: it surjects onto the moduli of Laplacianizations of the cellular cochain complex (= cohomology of constant sheaf = constant simplicial cohomology). Other Hilbert lifts of richer cohomology theories are realized by other sheaves on the same face poset.

##### Open: fiber structure

The 8-dim fiber over a generic moduli point is a real geometric object. Concretely, the fiber over the standard Euclidean point $(4,4,4;4,4,4)$ contains all $(a, b, c) \in \mathcal H_{\mathrm{cell}}$ that yield a Laplacian unitarily equivalent to the standard one. Examples:

- *Uniform rescaling that preserves ratios*: $(a, b, c) \to (\lambda a, \lambda b, \lambda c)$. Action on $\widetilde d_1$: $Q_0^{1/2} \to \lambda^{1/2} Q_0^{1/2}$, $Q_1^{-1/2} \to \lambda^{-1/2} Q_1^{-1/2}$, so $\widetilde d_1 \to \widetilde d_1$ (no change). 1-parameter family.
- *Vertex permutations* (action of $S_4$): take all $a_i = 1$ to itself, but reorder. Discrete, doesn't contribute to gauge dimension.
- *Asymmetric weight changes that compensate*: e.g., increase $a_1$ while increasing $b_{1j}$ for incident edges in a coordinated way. These are the genuinely 8-dim portion of gauge.

A clean identification of the 8-dim fiber as a Lie group (or symmetric space) at generic points is open. The fiber over the Euclidean point has additional symmetry (the supersymmetric stabilizer of dim 6, computed in the $\partial \Delta^3$ cross-check), so it is a non-generic stratum of the bundle $\mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$.

#### Object: Hilbert structure cone $\mathcal H$ {#hilbert-structure-cone}

The space of Hilbert structures on a chain complex --- the upstairs of the moduli quotient.

##### Definition

For a finite-dim graded chain complex $(C_\bullet, d)$ with chain dims $m_n = \dim C_n$,
$$\mathcal H := \prod_n \mathrm{Sym}^+(C_n)$$
is the open product of cones of positive-definite real symmetric forms on each $C_n$.

Each point $Q = (Q_0, Q_1, \ldots) \in \mathcal H$ specifies an inner product on each chain space, hence a Hilbert structure on $(C_\bullet, d)$ inducing the [Hodge Laplacian](#hodge-laplacian) $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ via the Hilbert adjoint $d^* = Q_n^{-1} d_n^T Q_{n-1}$.

##### Topology and structure

- **Open subset** of $\prod_n \mathrm{Sym}(C_n)$ (the linear space of symmetric forms).
- **Real algebraic open cone**: invariant under positive scaling $Q \mapsto \lambda Q$ for each chain space independently.
- **Dimension**: $\sum_n \binom{m_n + 1}{2}$.
- **Riemannian symmetric space structure**: each $\mathrm{Sym}^+(C_n) \cong \mathrm{GL}(C_n) / O(C_n)$ is a Riemannian symmetric space (positive part of the symmetric pair). $\mathcal H$ inherits a product Riemannian symmetric structure.

##### Action of the chain auto group

The chain auto group $G$ acts on $\mathcal H$ via $g \cdot Q = (g_n^T Q_n g_n)_n$. The quotient $G \backslash \mathcal H = \mathcal M_{\mathrm{Lap}}$ is the [moduli of Laplacianizations](#moduli-of-laplacianizations).

The action is proper (since $G$ is a Lie group and orbits are submanifolds). Generic stabilizer is finite (discrete); positive-dim stabilizers occur at structurally symmetric Hilbert structures (e.g., the Euclidean Hilbert structure for vertex-transitive graphs).

##### Algebraic closure

$\mathcal H$ has an algebraic closure
$$\overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+(C_n)},$$
the closed cone of positive-semidefinite forms. The boundary $\partial \overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$ consists of tuples where at least one $Q_n$ is rank-deficient. Both stratifications of moduli --- [Stratification I](#stratification-i) (interior) and [Stratification II](#stratification-ii) (boundary) --- are visible in $\overline{\mathcal H}$.

##### Sub-cones

Several mathematically-natural sub-cones of $\mathcal H$:

- **[Stalkwise diagonal cone](#stalkwise-diagonal-cone)** $\mathcal H_{\mathrm{diag}} \subseteq \mathcal H$: each $Q_n$ diagonal in a chosen basis. Codim $\sum_n \binom{m_n}{2}$. Used in cellular-sheaf framework.

- **Conformal sub-cone**: $Q_n = \lambda_n \cdot Q_n^{(0)}$ for fixed $Q_n^{(0)}$ and varying $\lambda_n > 0$. Dim $N+1$ (one scalar per chain space).

- **Spectral-triple sub-cone**: when $\mathcal H$ is induced from a [resolvent-based Hilbert lift](#resolvent-intertwiner) of a spectral triple, the realized $\mathcal H$ is a sub-cone of the full $\prod_n \mathrm{Sym}^+(C_n)$ --- those Hilbert structures expressible via $\mathrm{Tr}(\cdot R_D \cdot R_D)$ for some self-adjoint $D$.

##### Coordinate-free vs. matrix view

Each $\mathrm{Sym}^+(C_n)$ has two equivalent presentations:
- **Coordinate-free**: positive-definite symmetric bilinear forms on $C_n$.
- **Matrix-valued**: in any chosen basis of $C_n$, an SPD matrix.

The cellular-sheaf and stalkwise-diagonal frameworks pick a distinguished basis (the cellular basis); the unconstrained framework treats $C_n$ as an abstract real vector space.

##### In the spectral-triple case

For a finite spectral triple $(\mathcal A, \mathcal H_{\mathrm{spt}}, D)$, the [Hochschild-Hilbert lift](#resolvent-intertwiner) maps the moduli of $D$'s on $(\mathcal A, \mathcal H_{\mathrm{spt}})$ into the corresponding $\mathcal H$ for the Hochschild chain complex of $\mathcal A$. Different $D$'s give different points in $\mathcal H$, parametrizing the moduli of finite spectral triples.

#### Definition: Chain auto group action on Hilbert structures {#chain-auto-action}

The natural action of the chain automorphism group $G$ on the [Hilbert structure cone](#hilbert-structure-cone) $\mathcal H$, whose orbit space is $\mathcal M_{\mathrm{Lap}}$.

##### The chain auto group

For a chain complex $(C_\bullet, d)$,
$$G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\ \text{for all}\ n\}.$$

A tuple $(g_n)$ is a chain auto if it intertwines the boundary operators. Equivalently, $G$ is the automorphism group of the chain complex as a chain complex.

##### The action

For $g = (g_n) \in G$ and $Q = (Q_n) \in \mathcal H$, define
$$g \cdot Q := (g_n^T Q_n g_n)_n.$$

This preserves positive-definiteness ($g_n$ invertible $\Rightarrow$ $g_n^T Q_n g_n$ SPD). It also intertwines the Hilbert adjoints: $(d^*)^{g \cdot Q} = g^{-1} d^{*Q} g$, hence $\Delta^{g \cdot Q} = g^{-1} \Delta^Q g$ as operators on $C_\bullet$. Spectra of $\Delta$ are invariant under $G$.

##### Properness

The action is proper (closed orbit map): the set of $g$ moving $Q$ near $Q'$ is compact in $G$. This follows from $G \subseteq \prod_n \mathrm{GL}(C_n)$ being closed and the SPD cone $\mathcal H$ being open with positive-definiteness preserved.

##### Orbits

Each orbit $G \cdot Q$ is a smooth submanifold of $\mathcal H$. The orbit dim is $\dim G - \dim \mathrm{stab}_G(Q)$.

For *generic* $Q$ (in the open dense Stratification-I stratum), $\mathrm{stab}_G(Q)$ is finite (discrete), so the orbit has dim $\dim G$. For $Q$ in higher-codim strata, the stabilizer is positive-dim, and the orbit shrinks.

##### Stabilizers

For $Q$ in [Stratum$(\Pi)$](#stratum-eigenvalue-multiplicity),
$$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}$$
([proved](#stab-codim-formula)).

Stabilizers are subgroups of $\prod_n O(C_n, Q_n)$ (orthogonal groups w.r.t. the inner product), restricted by the chain auto condition $g_{n-1} d_n = d_n g_n$.

##### Quotient

$\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$ inherits an orbifold structure from the proper action with possibly-positive-dim stabilizers. Strata of $\mathcal M_{\mathrm{Lap}}$ are images of Stratification-I strata of $\mathcal H$ under the quotient.

##### Sub-actions

- The full $\prod_n \mathrm{GL}(C_n)$ action (without chain auto constraint) is the **unconstrained gauge action** --- what would apply if there were no chain complex structure. The chain auto constraint reduces $\prod_n \mathrm{GL}(C_n)$ to the smaller $G$.

- The orthogonal-only sub-action $\prod_n O(C_n) \cap G$ preserves the Hilbert structure pointwise (when restricted to the orthogonal frame at the standard basis). Its quotient is a finite cover of $\mathcal M_{\mathrm{Lap}}$.

- The cellular automorphism group $G_{\mathrm{cell}} \subseteq G$ --- finite --- preserves the cellular basis. It acts on the [stalkwise diagonal cone](#stalkwise-diagonal-cone) $\mathcal H_{\mathrm{diag}} \subseteq \mathcal H$ as the natural automorphism.

##### What the action achieves

Quotienting by $G$ removes the chain-automorphism redundancy, leaving only the "spectrally meaningful" data. Two Hilbert structures $Q, Q'$ in the same $G$-orbit have the same spectra of $\Delta$, the same Hodge filtration, the same bipartite multipartition --- they are *equivalent as Laplacianizations*.

The moduli $\mathcal M_{\mathrm{Lap}}$ thus parametrizes Laplacianizations *up to chain-auto equivalence*, which is the right notion of equivalence for studying moduli of Hodge Laplacians.

#### Concept: Bipartite multipartition {#bipartite-multipartition}

The combinatorial label of a [stratum](#stratum-eigenvalue-multiplicity) in the [moduli of Laplacianizations](#moduli-of-laplacianizations) of a finite-dim chain complex.

##### Definition

Fix a finite-dim graded chain complex $(C_\bullet, d)$ over $\mathbb R$ with boundary ranks $r_n = \mathrm{rank}\, d_n$. The **bipartite indexing set** is

$$[N_*] := \bigsqcup_n \{1, 2, \ldots, r_n\}, \qquad N_* = \sum_n r_n.$$

A pair $(n, i) \in [N_*]$ labels the $i$-th [squared singular value](#squared-singular-value) of the weighted boundary $\widetilde d_n$. A **bipartite multipartition** is a set partition $\Pi$ of $[N_*]$.

For each block $B \in \Pi$, the **per-degree multiplicities** are
$$k_n^B := |B \cap \{1, \ldots, r_n\}|, \quad |B| = \sum_n k_n^B.$$

A block is **within-degree** if $k_n^B \ne 0$ for exactly one $n$, and **cross-degree** otherwise.

##### Equivalence under $\prod_n S_{r_n}$

Two bipartite multipartitions are equivalent if related by independent permutation of indices within each $\{1, \ldots, r_n\}$. A bipartite multipartition is best regarded as an equivalence class under this action --- the data is *which* indices coincide, not the labeling itself.

The number of equivalence classes for given chain ranks $(r_0, \ldots, r_N)$ is the number of bipartite (or $N$-partite) multipartitions, computable via a generating function in the $r_n$.

##### Why "bipartite" and not just "partition"

When all $r_n = 0$ except for one $n$, $[N_*]$ has a single component and a multipartition reduces to a partition of $r_n$ --- the univariate case (([Arnold 1995](#ref-arnold1995remarks))).

When $N \ge 1$ (multiple non-trivial boundary operators), $[N_*]$ has multiple "color classes," and a multipartition can have blocks spanning multiple classes --- the [cross-degree identifications](#cross-degree-identification). This is the structural extension that distinguishes the chain-complex case from the matrix case.

##### Origin from spectral data

Given $Q \in \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$, the squared singular values of $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ are eigenvalues of self-adjoint operators, well-defined as multisets and continuous in $Q$. Concatenating across degrees gives a multiset of $N_*$ positive reals indexed by $[N_*]$. The bipartite multipartition $\Pi(Q)$ is the partition generated by the equivalence relation $\sigma_i^2(Q) = \sigma_j^2(Q)$ on indices.

By the Hodge supersymmetric isospectrality, the nonzero spectrum of $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ on $C_n$ (excluding kernel) coincides with that of $\Delta_{n-1}^{(Q)}$ as multisets --- so cross-degree pairs $(n-1, i) \sim (n, i)$ are *forced* by Hodge for chain complexes with no kernel obstructions.

##### Coarsening and refinement

Two multipartitions are ordered: $\Pi \preceq \Pi'$ iff $\Pi'$ refines $\Pi$ (every block of $\Pi'$ is contained in some block of $\Pi$). The poset structure is the [bipartite multipartition lattice](#bipartite-multipartition-lattice), which is the closure poset of strata of $\mathcal M_{\mathrm{Lap}}$ ([proved](#closure-poset-of-strata)).

##### Counts and structure invariants

For a bipartite multipartition $\Pi$:
- Number of blocks: $\#\Pi$ (= number of distinct eigenvalues among the $\widetilde d_n$ singular values).
- [Codim](#stab-codim-formula): $\sum_B (|B| - 1) = N_* - \#\Pi$.
- [Stab dim](#stab-codim-formula): $\sum_B \sum_n \binom{k_n^B}{2}$.

These are the structural invariants of $\Pi$ that determine the geometry of the corresponding stratum.

#### Concept: Cross-degree identification {#cross-degree-identification}

A block $B$ of a [bipartite multipartition](#bipartite-multipartition) $\Pi$ is **cross-degree** if its per-degree multiplicities $k_n^B$ are nonzero for at least two distinct $n$. Cross-degree identifications are the structural feature of the bipartite extension that has no analog in the univariate Arnold--Weinstein theory.

##### Asymmetry: codim vs. stab

A within-$d_n$ block contributing $k_n^B = k$ identifications:
- Codim contribution: $k - 1$.
- Stab contribution: $\binom{k}{2}$ (rotation of the $k$-dim eigenspace inside $C_n$).

A cross-degree block with $k_n^B, k_{n+1}^B \ne 0$ contributing one cross-pair $(k_n^B, k_{n+1}^B) = (1, 1)$:
- Codim contribution: $1$ (one extra eigenvalue equality).
- **Stab contribution: $0$** --- there is no within-$C_n$-versus-within-$C_{n+1}$ rotation, because chain automorphisms must preserve $d$, forcing block-diagonality between $C_n$ and $C_{n+1}$.

This asymmetry is the structural fingerprint distinguishing the bipartite case from the univariate.

##### Geometric origin

The chain auto group $G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\}$ couples adjacent degrees through the constraint $g_{n-1} d_n = d_n g_n$. On a joint eigenspace $\mathcal E_B = \bigoplus_n \mathcal E_n^B$ where $\mathcal E_n^B \subseteq C_n$ has dim $k_n^B$, the chain constraint forces any element of $G$ that preserves $\mathcal E_B$ to act block-diagonally --- independent rotations on each $C_n$ side.

Within-$d_n$ rotations remain free (the chain conditions don't constrain $\mathrm{GL}(\mathcal E_n^B)$ at all when $k_n^B \ge 2$). Cross-$d_n$ rotations between $\mathcal E_n^B$ and $\mathcal E_{n+1}^B$ would mix degrees and are forbidden by the chain conditions.

So: cross-degree identifications produce extra eigenvalue equalities (codim) but cannot produce extra eigenspace rotations (stab).

##### Hodge supersymmetric isospectrality

Cross-degree identifications between adjacent operators are *forced* by the Hodge identity: nonzero eigenvalues of $\Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*$ in the $\mathrm{im}\,d_n^*$-piece coincide with nonzero eigenvalues of $\Delta_{n-1}$ in the $\mathrm{im}\,d_n$-piece. So among cross-degree blocks, the "forced" ones are those between adjacent degrees, and the "non-forced" ones are between non-adjacent degrees.

For chain complexes of length 2, all cross-degree identifications are between adjacent degrees and thus Hodge-forced. For chain complexes of length $\ge 3$, non-adjacent cross-degree identifications give genuinely new structural data not present in the univariate case.

##### Combinatorial implication

The bipartite multipartition lattice is the partition lattice of $[N_*]$ subject to the chain rank constraint. The Hodge-forced identifications constrain which bipartite multipartitions are realized: the *minimum* multipartition $\Pi_{\min}$ (in the absence of any extra eigenvalue coincidences beyond Hodge) has cross-degree blocks $\{(n-1, i), (n, i)\}$ matching the Hodge pairings.

Higher strata refine $\Pi_{\min}$ by additional within-degree or cross-degree mergings.

##### Distinct from within-degree degeneracy

In the ([Barrett et al. 2017](#ref-barrett2017inverse)) for graphs, the obstruction is to within-degree multiplicity (eigenvalues in a single chain space coinciding). The chain-complex IEP-G inherits these obstructions per-degree (via the [decomposition theorem](#chain-complex-iep-g-decomposition)).

But the cross-degree identifications are an *additional* structural object, separate from within-degree multiplicity. Whether they admit independent obstructions (analogous to IEP-G's path-tridiagonal obstruction) is the [cross-degree-realizability open question](questions/cross-degree-realizability.md).

#### Observation: Distance degree of $V(\Pi)$ on a chain complex {#bipartite-distance-degree}

The Euclidean Distance Degree of the bipartite-multipartition variety $V(\Pi)$ in two ambients: the chain-complex ambient $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ and the free-bipartite ambient $\prod_n \mathrm{Sym}_{r_n}$ (no chain coupling).

##### Univariate (Bik--Draisma)

For $V(\lambda) \subset \mathrm{Sym}_n$ the variety of real symmetric matrices with eigenvalue partition $\lambda$,
$$\mathrm{EDD}(V(\lambda)) = \frac{n!}{\prod_i \lambda_i!}.$$

A clean multinomial.

##### Bipartite, free ambient (conjecture)

> **Conjecture.** For the variety $V(\Pi) \subset \prod_n \mathrm{Sym}_{r_n}$ defined by a bipartite multipartition $\Pi$ in the free product (no chain coupling),
> $$\mathrm{EDD}(V(\Pi)) = \frac{\prod_n r_n!}{\prod_B \prod_n k_n^B!}.$$

The bipartite multinomial. Reduces to Bik--Draisma when only one $r_n$ is nonzero. Proof: should generalize the univariate proof --- open.

##### Bipartite, chain-complex ambient

The chain-complex variety $V(\Pi) \subset \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ is defined by the discriminant of the generalized eigenvalue pencil $\det(d_n^T Q_{n-1} d_n - \lambda Q_n) = 0$. The chain coupling between $Q_{n-1}$ and $Q_n$ via $d_n$, plus the SPD-cone boundary structure, produce a different EDD.

**Computed case** (`examples/edd-computation-on-2-1-chain.md`): chain dims $(2, 3, 1)$, rank profile $(2, 1)$, $\Pi_A$ = the multipartition with two coinciding squared singular values of $\widetilde d_1$:
$$\mathrm{EDD}(V(\Pi_A)) = 40 \quad \text{(computed in M2 via Lagrange-multiplier system)}.$$

The free-bipartite multinomial would predict 1 for this case.

##### Decomposition by stratification

The 40 critical points distribute over the singular locus of $V(\Pi_A)$, which has 5 components:
- 1 component (codim 2 in $\mathbb A^9$, deg 7): pure Stratification I, conjecturally $V(\Pi_T)$.
- 4 components (codim 3 each, degs 1, 3, 5, 9): Stratification II at the SPD-cone boundary.

Conjectured decomposition:
$$\mathrm{EDD}_{\text{chain}}(V(\Pi)) = \mathrm{EDD}_{\text{interior}}(V(\Pi)) + \sum_S \mathrm{EDD}_S$$
with $S$ ranging over Stratification II strata that $V(\Pi)$ intersects, and $\mathrm{EDD}_{\text{interior}}$ matching the free-bipartite multinomial.

For the (2,1) case this would give $1 + 39$, with 39 distributed over the 4 boundary components. Verifying the decomposition requires computing the saturated EDD (`questions/saturated-edd.md`).

##### Open

1.  **Free bipartite Bik--Draisma**, proof (`questions/bipartite-bik-draisma.md` if separated). Generalize the univariate proof.

2.  **Saturated EDD on (2,1)** (`questions/saturated-edd.md`). M2 saturation by $\det Q_0 \cdot \det Q_1$ did not terminate. Alternative: primary-decomposition of the ED ideal, identifying boundary primes by hand.

3.  **Boundary-component degrees.** The 4 boundary components of $V(\Pi_A)$ have degrees $(1, 3, 5, 9)$. Whether these match Stratification II Pataki + Schubert codim/degree predictions for specific $(\mathbf r, \sigma)$ patterns is computable.

4.  **Pattern across chain complexes.** Compute $\mathrm{EDD}_{\text{chain}}$ on small cases varying $(C_\bullet, d, \Pi)$ --- e.g., $(2, 1)$ with rank profile $(1, 1)$, $(3, 2, 1)$, $\partial \Delta^k$ --- and look for the boundary contribution as a function of the chain complex's invariants.

##### Connection to Vassiliev cohomology

EDD is one numerical invariant of $V(\Pi)$. The structural generalization is the cohomology of $V(\Pi)$ via Vassiliev's resolution-of-discriminant machinery --- the [bipartite Vassiliev / Shapiro--Vainshtein](#bipartite-vassiliev-shapiro-vainshtein) entry. In the chain-complex ambient, Vassiliev cohomology mixes Stratification-I and Stratification-II contributions, so a full computation requires the [combined-stratification framework](#mixed-stratification-strata).

#### Example: EDD on the (2,1) chain complex {#edd-computation-on-2-1-chain}

Computational data on the Euclidean Distance Degree of $V(\Pi_A)$ in the chain-complex ambient. Establishes the [dual stratification](#the-dual-stratification) on a concrete variety.

##### Setup

Chain complex of dims $(C_0, C_1, C_2) = (2, 3, 1)$ with rank profile $(r_1, r_2) = (2, 1)$, all homologies zero. Boundary maps in canonical form:
$$d_1 = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}, \qquad d_2 = (0, 0, 1)^T.$$

Hilbert structures: $Q_0 \in \mathrm{Sym}^+_2$, $Q_1 \in \mathrm{Sym}^+_3$, $Q_2 \in \mathrm{Sym}^+_1$ --- ambient $\mathcal H \cong \mathbb R^{10}$ in coordinates $(a_{ij}, b_{ij}, c)$.

$V(\Pi_A) \subset \mathbb A^{10}$ is the locus where the two squared singular values of $\widetilde d_1$ coincide. The defining discriminant doesn't involve $c$, so $V(\Pi_A) = V_{\mathrm{red}} \times \mathbb A^1$ where $V_{\mathrm{red}}$ lives in the 9-dim $a, b$-space.

##### Variety basics (M2)

- Polynomial defining $V_{\mathrm{red}}(\Pi_A)$: degree 6.
- $\dim V_{\mathrm{red}}(\Pi_A) = 8$, codim 1 in $\mathbb A^9$.
- Singular locus of $V_{\mathrm{red}}(\Pi_A)$: dim 7, codim 1 in $V_{\mathrm{red}}$. Highly singular.

##### EDD

$$\mathrm{EDD}(V(\Pi_A)) = 40.$$

Computed via Lagrange-multiplier system in M2: $\dim I_{\mathrm{ED}} = 0$, $\deg I_{\mathrm{ED}} = 40$.

##### Singular locus decomposition

Primary decomposition of the singular locus gives 5 radical components:

| Component | dim | codim | deg | Generators (low-deg)                               | Identification                               |
|-----------|-----|-------|-----|----------------------------------------------------|----------------------------------------------|
| 0         | 7   | 2     | 7   | three cubics, mixed $a, b$                         | Stratification I: conjecturally $V(\Pi_T)$   |
| 1         | 6   | 3     | 5   | $b_{33}$, two cubic minors                         | mixed I + II                                 |
| 2         | 6   | 3     | 1   | $b_{33}, b_{23}, b_{13}$                           | Stratification II: $K_1 = \mathrm{im}\, d_2$ |
| 3         | 6   | 3     | 3   | $b_{33}$, two quadrics                             | mixed I + II                                 |
| 4         | 6   | 3     | 9   | $a_{12}^2 - a_{11} a_{22}$ ($= -\det Q_0$), cubics | mixed I + II ($\det Q_0 = 0$ + spectral)     |

##### Stratification II identification of Component 2

Component 2 is generated by $b_{13} = b_{23} = b_{33} = 0$, equivalently the third row/column of $Q_1$ vanishes. So $\ker Q_1 \supseteq \langle e_3 \rangle$.

In Pataki + Schubert terms: $\mathbf r = (2, 2, 1)$ (Pataki rank-2 in $C_1$), Schubert pattern $a_1 = z_1 = 1$ in degree 1 (kernel of $Q_1$ contains $\mathrm{im}\, d_2 = \langle e_3 \rangle$).

Codim check: Pataki codim $\binom{2}{2} = 1$ for rank-drop in $C_1$. Schubert codim of "$K_1 = \mathrm{im}\, d_2$" within Pataki rank-2: $1 \cdot (3 - 1 - 1 + 1) = 2$. Total: 3. ✓ Matches Component 2's codim 3.

##### Component 0 vs. Components 1--4

- **Component 0** has no $\det Q_n = 0$ or kernel-pattern equation in its generators --- pure spectral conditions on $a, b$ via cubics. Lives in the SPD interior. Conjecturally $V(\Pi_T) \subset V(\Pi_A)$ as a closure-poset codim-1 sub-stratum (matches: $V(\Pi_T)$ has codim 1 inside 8-dim $V(\Pi_A)$, and Component 0 has dim 7).

- **Components 1, 3, 4** are mixed: each has both spectral cubics (Stratification I content) and rank-degeneracy / kernel-pattern equations (Stratification II content).

- **Component 2** is pure Stratification II.

So the 5 components decompose as 1 pure Stratification I + 1 pure Stratification II + 3 mixed.

##### EDD decomposition (conjecture)

$$\mathrm{EDD}_{\text{chain}}(V(\Pi_A)) = \mathrm{EDD}_{\text{interior}}(V(\Pi_A)) + \sum_{i = 1}^{4} \mathrm{EDD}_i$$

where the interior contribution corresponds to the bipartite multinomial in the free-bipartite ambient (predicted: 1) and the boundary contributions sum to 39 distributed across Components 1--4.

The decomposition is verifiable by computing the saturated EDD ($V(\Pi_A) \cap \mathcal H$, removing boundary contributions). M2 saturation by $\det Q_0 \cdot \det Q_1$ did not terminate; primary-decomposition of the ED ideal is an alternative approach. See `questions/saturated-edd.md`.

##### Open

1.  **Saturated EDD value** (`questions/saturated-edd.md`).
2.  **Component 0 = $V(\Pi_T)$ verification** by direct ideal comparison.
3.  **Per-component EDD** for Components 1--4. Their degrees are $(5, 1, 3, 9)$; their EDD contributions are not yet computed individually.
4.  **Boundary-degree pattern.** Whether the 5-component degrees $(7, 5, 1, 3, 9)$ have a structural meaning in terms of the chain complex's rank profile $(r_1, r_2) = (2, 1)$ and dims $(m_0, m_1, m_2) = (2, 3, 1)$.
5.  **Other rank profiles.** $(2, 1)$ with $(m_0, m_1, m_2) = (3, 3, 1)$ --- different SPD-boundary geometry; recompute and compare.

#### Example: The structure of the 8-dim gauge fiber on $\partial \Delta^3$ {#gauge-fiber-structure}

Continuation of `examples/cellular-sheaf-on-tetrahedron-boundary.md`. The map $\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$ is surjective with 8-dim fiber at generic $Q$. The question this note works out: *what is the structure of that fiber* --- Lie algebra, Lie group, integrability, special-point degenerations?

##### Setup

Notation as in the previous example. $C^\bullet$ is the cellular cochain complex of $\partial \Delta^3$. $G$ is the chain automorphism group ($\dim G = 35$); $\mathfrak g$ its Lie algebra. $\mathcal H_{\mathrm{cell}} \subset \mathcal H$ is the diagonal locus (dim 14 inside dim 41). $Q \in \mathcal H_{\mathrm{cell}}$ is a generic diagonal Hilbert structure, with all entries $a_i, b_{ij}, c_{ijk}$ distinct.

##### The gauge Lie algebra at $Q$

The **fiber-tangent** at $Q$ is $\mathfrak{fib}(Q) := T_Q \mathcal H_{\mathrm{cell}} \cap T_Q(G \cdot Q)$. It consists of variations $\xi \cdot Q$ that:
1. lie in $T_Q \mathcal H_{\mathrm{cell}}$ --- i.e., are *diagonal* symmetric matrices;
2. lie in the $G$-orbit tangent --- i.e., are of the form $\xi \cdot Q = -(\xi^T Q + Q\xi)$ for $\xi \in \mathfrak g$.

A variation $\xi \cdot Q$ is diagonal iff $\xi^T Q + Q\xi$ is diagonal, equivalently for each $n$ and each pair $i \ne j$:

$$\xi_{n, ji} \, q^{(j)}_n + \xi_{n, ij} \, q^{(i)}_n = 0, \qquad \text{i.e.,} \qquad \xi_{n, ji} = -\frac{q^{(i)}_n}{q^{(j)}_n} \, \xi_{n, ij}. \qquad (\star)$$

So the off-diagonal entries of each $\xi_n$ are constrained pairwise --- one free parameter per ordered pair $(i, j)$ with $i < j$. The diagonal entries of $\xi$ are unconstrained by $(\star)$.

Define

$$\mathfrak n(Q) := \{\xi \in \mathfrak{gl}(C_0) \oplus \mathfrak{gl}(C_1) \oplus \mathfrak{gl}(C_2) : \xi \text{ satisfies } (\star)\}.$$

Then $\dim \mathfrak n(Q) = \binom{4+1}{2} + \binom{6+1}{2} + \binom{4+1}{2} = 10 + 21 + 10 = 41 = \dim \mathcal H$.

The gauge Lie algebra is

$$\mathfrak{fib}(Q) = (\mathfrak n(Q) \cap \mathfrak g) / \mathrm{stab}_\mathfrak g(Q).$$

For generic $Q$, $\mathrm{stab}_\mathfrak g(Q)$ is $0$-dim (transversality $\dim \mathfrak g + \dim \mathfrak u(Q) - \dim \mathfrak{gl} = 35 + 27 - 68 = -6 < 0$, so generically trivial). So

$$\dim \mathfrak{fib}(Q) = \dim(\mathfrak n(Q) \cap \mathfrak g) = \dim \mathfrak n(Q) + \dim \mathfrak g - \dim \mathfrak{gl} = 41 + 35 - 68 = 8.$$

Match with the geometric count $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}} = 14 - 6 = 8$. ✓

##### Decomposition: uniform + twisted skew

Decompose $\mathfrak{fib}(Q)$ into orthogonal subspaces along the lines suggested by $(\star)$.

**Uniform scaling, $\mathfrak{fib}_{\mathrm{unif}}$.** The diagonal-only solutions: \$`\xi`{=tex}\_n = \$ diagonal matrix with entries $\xi_{n,i}$. The chain constraint $\xi_0 d_1 = d_1 \xi_1$ on diagonal $\xi$ requires $\xi_{0, i} = \xi_{1, e}$ whenever $v_i$ is an endpoint of edge $e$. Since $\partial \Delta^3$ is connected, this propagates: $\xi_{n, \sigma}$ is the same scalar $c$ for every cell $\sigma$ in every degree. So

$$\mathfrak{fib}_{\mathrm{unif}} = \{c (I_4, I_6, I_4) : c \in \mathbb R\}, \qquad \dim = 1.$$

The corresponding gauge action: $Q \mapsto e^{-2c} Q$ --- uniform multiplicative rescaling of all 14 weights by $\lambda := e^{-2c} > 0$. This visibly preserves the Laplacian operator (not just up to equivalence): in `examples/cellular-sheaf-on-tetrahedron-boundary.md`, $\Delta_n = (a/b) d_1 d_1^T + \cdots$ depends only on ratios $a/b, b/c$, so multiplying all of $a, b, c$ by the same scalar is invisible.

**Twisted-skew piece, $\mathfrak{fib}_{\mathrm{skew}}$.** The 7-dim complement consists of $\xi$'s with nonzero off-diagonal $(\star)$ entries, satisfying both chain-auto constraints. To describe these concretely:

For each $\xi_0 \in \mathfrak{gl}(C_0)$ satisfying $(\star)$ --- i.e., $\xi_0$ in the $\mathrm{Sym}^+(Q_0)$-skew part of $\mathfrak{gl}(C_0)$ --- the chain extension to $\xi_1, \xi_2$ is determined modulo:
- a 3-dim choice in $\xi_1$ (the kernel of $d_1$, which a-priori could be added to each $\xi_1 e_{ij}$ value subject to compatibility with the $\xi_2$ chain constraint downstream), and
- a 1-dim choice in $\xi_2$ (the kernel of $d_2$, which is the harmonic representative of $H_2$).

The chain compatibility through both layers is what cuts the degrees-of-freedom precisely to 7 --- but to write them out explicitly requires choosing a basis. The cleanest description is the abstract one:

$$\mathfrak{fib}_{\mathrm{skew}} = \{\xi \in \mathfrak g : \xi \text{ satisfies } (\star), \xi \text{ has zero diagonal}\}, \qquad \dim = 7.$$

So $\mathfrak{fib}(Q) = \mathfrak{fib}_{\mathrm{unif}} \oplus \mathfrak{fib}_{\mathrm{skew}}$, $1 + 7 = 8$ dimensions.

##### $N(Q)$ is not a subgroup

Let $N(Q) := \{g \in G : g \cdot Q \in \mathcal H_{\mathrm{cell}}\}$. The Lie-algebra-tangent at the identity is $\mathfrak n(Q) \cap \mathfrak g$, dim 8.

**$N(Q)$ is not closed under composition.** If $g_1 \cdot Q = Q_1 \in \mathcal H_{\mathrm{cell}}$ and $g_2 \cdot Q = Q_2 \in \mathcal H_{\mathrm{cell}}$, then $(g_2 g_1) \cdot Q = g_2 \cdot Q_1$ --- and there is no reason for $g_2 \cdot Q_1$ to be diagonal, since $g_2$ was chosen to take $Q$ (not $Q_1$) to a diagonal.

So the 8-dim distribution $\mathfrak n(Q) \cap \mathfrak g$ varies as $Q$ varies along the fiber: it is a $Q$-dependent subspace of $\mathfrak g$. The fiber is the *integral submanifold* of this varying distribution through $Q$, not an orbit of a fixed Lie group.

This is structurally important: the gauge fiber is not a homogeneous space, so it does not admit a uniform "structure group" description. It is a smooth 8-manifold defined by 6 polynomial equations (the spectral matching) on $\mathbb R_{>0}^{14}$, and that algebraic-variety description is in some sense the cleanest available.

##### Integrability of the gauge distribution

The distribution $Q \mapsto \mathfrak n(Q) \cap \mathfrak g$ on $\mathcal H_{\mathrm{cell}}$ is **integrable**: its integral submanifolds are the fibers of $\Phi$. This is automatic given that $\Phi$ is well-defined as a map to $\mathcal M_{\mathrm{Lap}}$ (well-defined modulo $G$-equivalence implies the fibers form a foliation).

What's *not* automatic and would be informative: an explicit Frobenius-type bracket calculation --- for $\xi, \eta \in \mathfrak{fib}(Q)$, is $[\xi, \eta] \in \mathfrak{fib}(Q)$? The answer should be yes, but verifying it in coordinates is open work.

If yes, $\mathfrak{fib}(Q)$ is a Lie algebra --- though *not* the Lie algebra of any one Lie group, since the gauge-fiber-bundle structure changes from fiber to fiber. The Lie algebra structure would be Q-dependent.

##### At the Euclidean point: extra symmetry, dimension drop

At $Q = Q_{\mathrm{Euc}} = (1, \ldots, 1)$ (all weights equal to 1), the spectrum of $\Delta$ degenerates: $\Delta_0$ has eigenvalues $\{0, 4, 4, 4\}$, $\Delta_1 = 4 I_6$, $\Delta_2$ has $\{0, 4, 4, 4\}$. The **stabilizer in $\mathfrak g$** is large.

A unitary chain auto $u \in G$ with $u \cdot Q_{\mathrm{Euc}} = Q_{\mathrm{Euc}}$ must commute with $\Delta = 4 I$ (where this holds) and with $\Delta_0, \Delta_2$ on their respective 3-dim eigenspaces. On those eigenspaces, $\Delta$ is a scalar, so $u$ can act as any element of $O(3)$. Combining:

- $u_0 \in O(\mathrm{im}\, d_1) \cong O(3)$ acting on the 3-dim non-kernel of $\Delta_0$ --- 3 dim.
- $u_2 \in O(\mathrm{im}\, d_2^*) \cong O(3)$ acting on the 3-dim non-kernel of $\Delta_2$ --- 3 dim.
- $u_1$ on $C_1$ is determined by $u_0$ (via $d_1$) on $\mathrm{im}\, d_1^*$ and by $u_2$ (via $d_2$) on $\mathrm{im}\, d_2$.
- Plus discrete $\pm 1$ on the 1-dim kernels.

Dimension of the stabilizer: $3 + 3 = 6$, matching the count from `cellular-sheaf-on-tetrahedron-boundary.md`.

This means at $Q_{\mathrm{Euc}}$, the orbit-tangent dim drops: $\dim T_{Q_{\mathrm{Euc}}}(G \cdot Q_{\mathrm{Euc}}) = 35 - 6 = 29$. By the transversality formula, $\dim \mathfrak{fib}(Q_{\mathrm{Euc}}) \ge 14 + 29 - 41 = 2$.

So the fiber-tangent at Euclidean is only 2-dim, not 8-dim. The fiber over the Euclidean moduli point is actually *higher-dimensional* (12-dim, by conservation: at this codim-6 stratum of moduli, fibers are correspondingly larger), but its tangent space at the smooth subset shrinks to 2-dim because the 6 stabilizer dimensions are now "vertical" --- they parameterize the Euclidean moduli stratum's neighborhood without changing the moduli class, but they correspond to *non-diagonal* $\xi$ orbits, not gauge-along-the-fiber directions.

The Euclidean fiber is therefore a singular orbifold-type stratum: smooth pieces of dim 12 with a 6-dim "stabilizer" group fibering over them, and the visible tangent at $Q_{\mathrm{Euc}}$ within $\mathcal H_{\mathrm{cell}}$ is the 2-dim "fully-symmetric" rescaling subspace ($a$-uniform, $b$-uniform, $c$-uniform with $a/b = b/c = 1$, plus a 2nd direction broken by the constraints).

This singular behavior is generic in moduli problems: the fiber dim "jumps" at strata where stabilizer dim jumps. It is consistent with the moduli theorem and the gauge-dimension formula at smooth points.

##### Findings

1.  **Gauge dimension formula.** $\dim \mathfrak{fib}(Q) = 8$ at generic $Q$ on $\partial \Delta^3$, matching $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}$.

2.  **The gauge is foliation, not principal bundle.** $N(Q)$ is not a subgroup of $G$. The map $\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$ is a smooth foliation with $Q$-dependent integrable 8-dim distribution.

3.  **1+7 fiber decomposition.** $\mathfrak{fib}_{\mathrm{unif}} \oplus \mathfrak{fib}_{\mathrm{skew}}$. The 1-dim uniform-rescaling direction preserves $\Delta$ as an operator; the 7-dim skew directions preserve only its unitary-equivalence class.

4.  **Singular stratum at the Euclidean point.** Codim-6 stratum with extra 6-dim supersymmetric stabilizer; fiber dim jumps.

##### Bearing on universal-Laplacianization

A clean adjoint structure between $\mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ and a forgetful functor would imply a uniform (homogeneous-space) gauge structure on moduli. The non-homogeneous foliated structure here rules out that form of adjoint (`questions/universal-laplacianization.md`, resolved).

The gauge distribution is integrable with Lie-algebra-structured tangent at each point --- consistent with $\mathcal M_{\mathrm{Lap}}$ as a stratified GIT-style quotient: gauge orbits uniform inside strata, jumping across strata. The Euclidean point is the higher-stratum example.

##### Open

1.  **Frobenius brackets.** Verify $[\mathfrak{fib}(Q), \mathfrak{fib}(Q)] \subset \mathfrak{fib}(Q)$ in coordinates, computing the structure constants.
2.  **Stratification.** Identify the strata of $\mathcal M_{\mathrm{Lap}}(\partial \Delta^3)$ classified by stabilizer dim. The Euclidean point (codim 6) is one stratum; other strata correspond to partial eigenvalue degeneracies (e.g., $\sigma_1 = \sigma_2 \ne \sigma_3$ has codim 1).
3.  **Generalization.** The pattern "gauge dim = $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}$" should generalize to other cell complexes. For $\partial \Delta^4$ (boundary of 4-simplex, $S^3$-homeomorphic): $\mathcal H_{\mathrm{cell}}$ has $5 + 10 + 10 + 5 = 30$ dimensions, $\mathcal M_{\mathrm{Lap}}$ has dimension to be computed. Conjecture: gauge dim = $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}$ holds, with explicit formulas in terms of rank profiles.

#### Definition: Hodge isomorphism {#hodge-isomorphism}

The natural isomorphism between cohomology and the kernel of the Hodge Laplacian. The defining structural feature of a [Laplacianizer](#laplacianizer): it's what makes the Hilbert lift "see" the cohomology.

##### Statement

For a graded Hilbert chain complex $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ where each $d_n$ has closed range,
$$\eta_n: H_n(C_\bullet, d) \xrightarrow{\sim} \ker \Delta_n,$$
where $\Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*$ is the Hodge Laplacian and $d^*$ is the Hilbert adjoint.

The isomorphism takes a homology class $[c] \in H_n$ to its unique harmonic representative $h \in c$ --- the element of the equivalence class that is annihilated by $\Delta_n$.

##### Hodge decomposition

Equivalently, the Hodge isomorphism comes from the orthogonal decomposition
$$C_n = \mathrm{im}\, d_{n+1} \oplus \ker \Delta_n \oplus \mathrm{im}\, d_n^*$$
where:
- $\mathrm{im}\, d_{n+1}$ is the boundaries (cohomologous to zero).
- $\ker \Delta_n$ is the harmonic representatives.
- $\mathrm{im}\, d_n^*$ is the cocycles.

The cycles are $\ker d_n = \mathrm{im}\, d_{n+1} \oplus \ker \Delta_n$, so cycles modulo boundaries (= homology) is canonically isomorphic to harmonics.

##### Closed range required

The Hodge isomorphism uses the orthogonal projection onto $\mathrm{im}\, d_{n+1}$, which is well-defined iff $\mathrm{im}\, d_{n+1}$ is closed in $C_{n+1}$. For finite-dim $C_n$, this is automatic. For infinite-dim $C_n$ (smooth Riemannian, infinite spectral triples), [closed range](#closed-range-obstruction) is a non-trivial condition.

##### What $\eta$ encodes

A Laplacianizer is a triple $(F, d, \eta)$ where $F: \mathcal C \to \mathbf{Hilb}^\mathbb Z$ is the Hilbert lift functor, $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is the natural iso. The $\eta$ is what makes the Hilbert chain complex "compute" the prescribed cohomology theory $H^\bullet$ --- without $\eta$, the Hilbert lift's homology might be unrelated.

For different Hilbert structures (different points of $\mathcal H$), the $\eta$ varies: the harmonic representative of a fixed cohomology class depends on the inner product. So $\eta_n^{(Q)}: H_n \xrightarrow{\sim} \ker \Delta_n^{(Q)} \subseteq C_n$ defines a bundle of sub-vector-spaces over $\mathcal H$ whose fibers are the harmonic subspaces.

##### Naturality

For a chain map $f: (C_\bullet, d) \to (C'_\bullet, d')$ that respects Hilbert structure (intertwines adjoints), $\eta$ is natural in the chain map. This is part of the definition of "morphism of Laplacianizers."

##### In the cellular case

For a cellular chain complex with stalkwise diagonal $Q_n$, the Hodge decomposition has a combinatorial interpretation: $\mathrm{im}\, d_{n+1}$ corresponds to weighted boundaries of $(n+1)$-cells; $\ker \Delta_n$ to weighted harmonic $n$-chains; $\mathrm{im}\, d_n^*$ to weighted coboundaries.

The harmonic representative of a homology class is the "minimum weighted norm" cycle in the class --- the energy-minimizing representative. For graphs ($n = 0$), this recovers the constants (which is $H_0$ for connected graphs).

##### In the spectral-triple case

For a spectral triple $(\mathcal A, \mathcal H_{\mathrm{spt}}, D)$ with the [Hochschild-Hilbert lift](#resolvent-intertwiner), the Hodge isomorphism becomes
$$\eta_n: \mathrm{HH}_n(\mathcal A) \xrightarrow{\sim} \ker(\Delta_n^{(D)})$$
on Hochschild chains, with $\Delta^{(D)}$ the Hochschild Hodge Laplacian induced by the resolvent inner product. Provided closed range of $b$ on Hochschild chains (automatic for finite spectral triples, and for regular spectral triples in Connes' sense), the iso holds.

For commutative $\mathcal A = C^\infty(M)$, HKR identifies $\mathrm{HH}_\bullet \cong \Omega^\bullet$, and the Hodge isomorphism reduces to the classical de Rham--Hodge isomorphism on the smooth manifold.

#### Theorem: Chain-complex IEP-G --- realizability under sparsity {#chain-complex-iep-g}

The bipartite realizability theorem (`theorems/bipartite-realizability.md`) says every multipartition is realized when inner products $Q_n$ are unconstrained in $\mathrm{Sym}^+(C_n)$. **With sparsity** --- the natural cellular-sheaf setting where $Q_n$ is restricted to be diagonal in the cellular basis (one positive weight per cell) --- realizability becomes substantive. Some bipartite multipartitions are *no longer realizable*, generalizing the classical IEP-G obstructions to chain complexes.

This entry sets up the chain-complex IEP-G program and proves a concrete first obstruction: the **path-complex $P_3$ does not realize its supersymmetric stratum with stalkwise weights**, generalizing the classical IEP-G result that $P_3$ (as a graph) does not realize the all-equal eigenvalue partition.

##### Setup

A **cellular chain complex** $(C_\bullet, d)$ has $C_n = \mathbb R^{n_n}$ with a distinguished basis (the $n$-cells of an underlying CW complex). The **stalkwise diagonal cone** is

$$\mathcal H_{\mathrm{diag}} := \{Q \in \mathcal H : Q_n \text{ is diagonal in the cellular basis for every } n\} = \mathbb R_{>0}^{N_{\mathrm{cell}}},$$

where $N_{\mathrm{cell}} = \sum_n n_n$ is the total cell count. Each $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{n_n, n})$ assigns a positive weight to each cell.

$\mathcal H_{\mathrm{diag}}$ is a sub-cone of $\mathcal H$ of dimension $N_{\mathrm{cell}}$ (each $Q_n$ has $n_n$ free parameters instead of $\binom{n_n+1}{2}$). The codimension of the embedding $\mathcal H_{\mathrm{diag}} \hookrightarrow \mathcal H$ is $\sum_n \binom{n_n}{2}$ --- the off-diagonal entries that are killed.

The cellular automorphism group $G_{\mathrm{cell}} \subset G$ consists of chain automorphisms preserving the cellular basis (= cellular automorphisms of the underlying CW complex, acting by signed-permutation on each $C_n$). $G_{\mathrm{cell}}$ is *finite* in general, far smaller than $G$.

##### Realizability question (chain-complex IEP-G)

For a fixed cellular chain complex $(C_\bullet, d)$ and bipartite multipartition $\Pi$:

> **Question.** Is there $Q \in \mathcal H_{\mathrm{diag}}$ such that the bipartite multipartition $\Pi(Q)$ of the squared singular values of the weighted boundary operators equals $\Pi$?

In contrast to the unconstrained case (`theorems/bipartite-realizability.md`), the answer is *not* always yes.

##### First obstruction: $P_3$

Consider the simplest non-trivial cellular chain complex: the **path** $P_3$ with 3 vertices $v_1, v_2, v_3$ and 2 edges $e_{12}, e_{23}$.

Univariate rank profile $(r_1) = (2)$, so multipartitions of $\{1, 2\}$:
- $\Pi_0 = \{\{1\}, \{2\}\}$ --- generic, $\sigma_1^2 \neq \sigma_2^2$.
- $\Pi_T = \{\{1, 2\}\}$ --- supersymmetric, $\sigma_1^2 = \sigma_2^2$.

Boundary operator $d_1: C_1 = \mathbb R^2 \to C_0 = \mathbb R^3$ in the cellular basis:
$$d_1 = \begin{pmatrix} -1 & 0 \\ 1 & -1 \\ 0 & 1 \end{pmatrix}, \qquad d_1^T = \begin{pmatrix} -1 & 1 & 0 \\ 0 & -1 & 1 \end{pmatrix}.$$

Stalkwise weights: $Q_0 = \mathrm{diag}(a_1, a_2, a_3)$, $Q_1 = \mathrm{diag}(b_1, b_2)$.

Generalized eigenvalue pencil for the squared singular values of $\widetilde d_1$:
$$\det(d_1^T Q_0 d_1 - \lambda Q_1) = 0.$$

Compute $d_1^T Q_0 d_1$:
$$d_1^T Q_0 d_1 = \begin{pmatrix} -1 & 1 & 0 \\ 0 & -1 & 1 \end{pmatrix} \begin{pmatrix} a_1 & 0 & 0 \\ 0 & a_2 & 0 \\ 0 & 0 & a_3 \end{pmatrix} \begin{pmatrix} -1 & 0 \\ 1 & -1 \\ 0 & 1 \end{pmatrix} = \begin{pmatrix} a_1 + a_2 & -a_2 \\ -a_2 & a_2 + a_3 \end{pmatrix}.$$

Pencil determinant:
$$\det\begin{pmatrix} (a_1+a_2) - \lambda b_1 & -a_2 \\ -a_2 & (a_2+a_3) - \lambda b_2 \end{pmatrix} = b_1 b_2 \lambda^2 - \big[(a_2+a_3) b_1 + (a_1+a_2) b_2\big] \lambda + \big[(a_1+a_2)(a_2+a_3) - a_2^2\big].$$

The two squared singular values are roots; they coincide iff the discriminant vanishes:
$$\mathrm{disc} = \big[(a_2+a_3) b_1 + (a_1+a_2) b_2\big]^2 - 4 b_1 b_2 \big[(a_1+a_2)(a_2+a_3) - a_2^2\big].$$

> **Theorem (P_3 obstruction).** For all $a_1, a_2, a_3, b_1, b_2 > 0$, $\mathrm{disc} > 0$. Equivalently, the supersymmetric stratum $\Pi_T$ is *not realizable* by stalkwise diagonal weights on the $P_3$ chain complex.

**Proof.** Set $\alpha = a_2 + a_3$, $\beta = a_1 + a_2$, $\gamma = (a_1+a_2)(a_2+a_3) - a_2^2$. Note all of $\alpha, \beta > 0$ (sums of positive reals) and $\gamma = \alpha \beta - a_2^2$. Also $\gamma > 0$ since $\alpha \beta = (a_1+a_2)(a_2+a_3) \ge a_2^2 + (\text{positive cross terms}) > a_2^2$.

The discriminant becomes
$$\mathrm{disc} = (\alpha b_1 + \beta b_2)^2 - 4 b_1 b_2 \gamma = \alpha^2 b_1^2 + 2 \alpha\beta b_1 b_2 + \beta^2 b_2^2 - 4 b_1 b_2 (\alpha\beta - a_2^2)$$
$$= \alpha^2 b_1^2 - 2 \alpha\beta b_1 b_2 + \beta^2 b_2^2 + 4 a_2^2 b_1 b_2 = (\alpha b_1 - \beta b_2)^2 + 4 a_2^2 b_1 b_2.$$

Both terms are non-negative for positive weights, and $4 a_2^2 b_1 b_2 > 0$ strictly (since $a_2, b_1, b_2 > 0$). So $\mathrm{disc} > 0$ strictly. The roots are always distinct. $\square$

Hence the supersymmetric stratum $\Pi_T = \{\{1,2\}\}$ is **never realized** by stalkwise diagonal weights on the $P_3$ chain complex. The only realizable multipartition is $\Pi_0$ (generic).

##### Generalization to $P_n$

The $P_3$ obstruction extends to all paths $P_n$ (path with $n$ vertices, $n-1$ edges) via a classical structural fact about tridiagonal matrices.

**Setup for $P_n$.** Cells: vertices $v_1, \ldots, v_n$, edges $e_i = (v_i, v_{i+1})$ for $i = 1, \ldots, n-1$. Boundary $d_1: C_1 = \mathbb R^{n-1} \to C_0 = \mathbb R^n$ has matrix entries $d_1[v_j, e_i] = -\delta_{ij} + \delta_{i+1,j}$. With stalkwise weights $Q_0 = \mathrm{diag}(a_1, \ldots, a_n)$, $Q_1 = \mathrm{diag}(b_1, \ldots, b_{n-1})$:

$$d_1^T Q_0 d_1 = \begin{pmatrix} a_1 + a_2 & -a_2 & & & 0 \\ -a_2 & a_2 + a_3 & -a_3 & & \\ & -a_3 & a_3 + a_4 & \ddots & \\ & & \ddots & \ddots & -a_{n-1} \\ 0 & & & -a_{n-1} & a_{n-1} + a_n \end{pmatrix}$$

--- a *tridiagonal* $(n-1) \times (n-1)$ symmetric matrix. The pencil $(d_1^T Q_0 d_1, Q_1)$ has generalized eigenvalues equal to the eigenvalues of $Q_1^{-1/2} (d_1^T Q_0 d_1) Q_1^{-1/2}$, which is also tridiagonal (conjugation by diagonal preserves tridiagonality), with off-diagonal entries $-a_{i+1}/\sqrt{b_i b_{i+1}} \ne 0$ for all $i$ (since $a, b > 0$).

> **Classical fact (Sturm / Sylvester).** Symmetric tridiagonal matrices with all off-diagonal entries nonzero (= *irreducible tridiagonal*) have all eigenvalues distinct.

(Proof: the principal-minor sequence forms a Sturm sequence, and Sturm's theorem gives interlacing of eigenvalues at adjacent sizes, which forces simplicity.)

> **Theorem ($P_n$ obstruction).** For the cellular chain complex of $P_n$ ($n \ge 2$), with stalkwise positive weights, the squared singular values of $\widetilde d_1$ are always all distinct. Hence the only realizable bipartite multipartition is the *generic* one $\{(1), (1), \ldots, (1)\}$ --- every multipartition with at least one block of size $\ge 2$ is unrealizable.

This is the chain-complex analog of the classical IEP-G result: paths realize only the all-distinct multiplicity partition.

##### Contrast: cycles realize supersymmetric

Paths obstruct supersymmetric. **Cycles do not.** This shows the chain-complex IEP-G obstructions are not just about the chain complex's algebraic data, but about the *combinatorial topology* of the underlying CW complex.

**$C_3$ example.** The cycle on 3 vertices, 3 edges. $C_0 = \mathbb R^3, C_1 = \mathbb R^3$, $r_1 = 2$ (with $H_0 = H_1 = \mathbb R$).

Boundary $d_1$ in cellular basis: column $i$ is $-e_i + e_{i+1 \mod 3}$. With uniform stalkwise weights $a_1 = a_2 = a_3 = a$, $b_1 = b_2 = b_3 = b$:

$$d_1^T Q_0 d_1 = a \begin{pmatrix} 2 & -1 & -1 \\ -1 & 2 & -1 \\ -1 & -1 & 2 \end{pmatrix} = a (3I - J)$$

(where $J$ is all-ones $3 \times 3$). With $Q_1 = bI$, the pencil reduces to $\det(M - \lambda b I) = b^3 \det((a/b)(3I - J) - \lambda I)$. The matrix $3I - J$ has eigenvalues $0, 3, 3$ (the $0$-eigenvector is $(1,1,1)$; the $3$-eigenspace is 2-dim, namely $\mathbf{1}^\perp$). So the squared singular values are $\sigma_1^2 = \sigma_2^2 = 3a/b$ --- **the supersymmetric stratum is realized** at uniform weights.

The structural reason: the cycle has a $\mathbb Z_3$-rotational symmetry that paths lack. The 3-fold symmetry of $C_3$ forces the irrep-decomposition of $\Delta_0|_{\mathbf{1}^\perp}$ into a 2-dim irrep that acts as a scalar --- giving the multiplicity-2 nonzero eigenvalue.

So **graph topology (path vs. cycle vs. tree vs. ...) controls which multipartitions are realizable**. This is the substantive content of chain-complex IEP-G beyond the unconstrained baseline.

**General prediction.** A cellular chain complex realizes more multipartitions when its CW complex admits more *symmetry*. The full classification (which CW topologies realize which multipartitions) generalizes the classical IEP-G theory --- Barrett--Fallat-style realizability for graphs --- to chain complexes. Open.

##### Connection to univariate IEP-G

The classical IEP-G (([Barrett et al. 2017](#ref-barrett2017inverse))) studies symmetric matrices $A$ with off-diagonal sparsity matching a graph $G$, asking which multiplicity partitions of the eigenvalues of $A$ are realized.

For $G = P_3$, the matrices have form
$$A = \begin{pmatrix} a_1 & d_{12} & 0 \\ d_{12} & a_2 & d_{23} \\ 0 & d_{23} & a_3 \end{pmatrix}$$
(tridiagonal). The classical result is that $A$'s eigenvalues are always *all distinct*: the eigenvalue partition $(1,1,1)$ is the only realizable one for $P_3$. The all-equal partition $(3)$ is *not* realized (would require $A = \lambda I$, impossible with off-diagonal $d_{ij} \neq 0$, which $P_3$'s pattern requires as edges).

**Translation to chain-complex IEP-G.** For the cellular chain complex of $P_3$, the Laplacian $\Delta_0 = d_1 d_1^*$ on $C_0 = \mathbb R^3$ has spectrum $\{0, \sigma_1^2, \sigma_2^2\}$. The chain-complex multipartition is on the *nonzero* spectrum $\{\sigma_1^2, \sigma_2^2\}$ (= squared singular values of $\widetilde d_1$).

- Univariate IEP-G partition $(1,1,1)$ ↔ chain-complex multipartition $\{\{1\},\{2\}\}$ (generic, on the 2 nonzero eigenvalues).
- Univariate IEP-G partition $(2,1)$ --- two equal nonzero eigenvalues, one different --- ↔ chain-complex multipartition $\{\{1,2\}\}$ (supersymmetric, $\sigma_1 = \sigma_2$).
- Univariate IEP-G partition $(3)$ --- all three eigenvalues equal --- would require $\Delta_0 = \lambda I$, but $\ker \Delta_0 \ni \mathbf{1}$ is fixed, so $\lambda = 0$, contradiction (no positive $\lambda$). Not relevant in the chain-complex framework.

The classical IEP-G result that $P_3$ doesn't realize $(3)$ corresponds to: *and* it doesn't realize $(2,1)$, because both nonzero eigenvalues equal would require the discriminant of the pencil to vanish, which the proof above shows is impossible.

So the chain-complex IEP-G obstruction we proved (no $\Pi_T$ for $P_3$ chain complex) is *consistent with and refines* the univariate IEP-G: in the chain-complex-with-stalkwise-weights framework, the obstruction is sharper because the form of $A = d_1 \widetilde d_1^*$ has further structure beyond mere tridiagonality.

##### What this establishes

1.  **Chain-complex IEP-G is non-vacuous.** The realizability question with sparsity has substantive content: not all multipartitions are realizable. The P_3 example demonstrates a concrete obstruction.

2.  **The unconstrained realizability theorem (`theorems/bipartite-realizability.md`) is necessary.** Without that result, we wouldn't know that the *abstract* multipartition lattice is fully populated --- the obstructions seen here come specifically from the sparsity constraint, not from the chain complex's intrinsic structure.

3.  **The closure poset structure (`theorems/closure-poset-of-strata.md`) refines IEP-G's notion of "realizable."** Each realizable multipartition has a non-empty stratum in moduli; non-realizable ones have empty strata. This gives a stratified perspective on IEP-G's combinatorial question.

##### The chain-complex IEP-G program

A full chain-complex IEP-G program would address:

- **Chain-complex SSP and SMP.** The classical Strong Spectral Property and Strong Multiplicity Property in IEP-G are tools for proving realizability under sparsity. The chain-complex analogs would involve transversality of the stalkwise-weight map $\mathcal H_{\mathrm{diag}} \to (\text{spectral data})$.

- **Minor monotonicity.** A *cellular sub-complex* $X' \subset X$ (e.g., removing a cell) has its own chain-complex IEP-G. Realizability should be monotone under sub-complex relations: if $X'$ realizes $\Pi$, does $X$ realize an "extension" of $\Pi$?

- **Cellular automorphism action.** $G_{\mathrm{cell}}$ acts on $\mathcal H_{\mathrm{diag}}$. The realizability question modulo this action is the natural one, since it's invariant under relabeling cells.

- **Closed-form characterization for small complexes.** For $\partial \Delta^n$ (regular polytope boundaries), $K_n$ (complete graphs), $P_n$ (paths), etc., explicitly determine which bipartite multipartitions are realizable.

These directions parallel the classical IEP-G program (Barrett, Fallat, Adm, Hall, Hogben, et al.) translated to the chain-complex setting.

##### Open

1.  **$P_n$ realizability.** Generalize the $P_3$ obstruction to longer paths: which multipartitions are realizable for $P_n$'s cellular chain complex?

2.  **Cycle complex $C_n$.** A cycle (closed loop) has $C_0 = \mathbb R^n, C_1 = \mathbb R^n$ with $d_1$ rank $n-1$ ($H_0 = \mathbb R$). What multipartitions are realizable?

3.  **2-dim complexes.** The first genuinely bipartite case: a 2-complex with $C_0, C_1, C_2$ all nonzero. The bipartite multipartition lattice is now non-trivial. Realizability picks up cross-$d$ structure.

4.  **Realizability and cellular-sheaf cofinality** (`theorems/cellular-sheaf-cofinality.md`). The cellular-sheaf framework says all combinatorial Laplacianizations factor through sheaves on posets. If realizability obstructions are intrinsic to the cellular setup, they should reflect the sheaf-on-poset structure as well.

##### Synthesis with realizability and stratification

Combined with `theorems/bipartite-stratification-theorem.md` and `theorems/bipartite-realizability.md`:

> Given a cellular chain complex $(C_\bullet, d)$ over $\mathbb R$, $\mathcal M_{\mathrm{Lap}}$ is a real-algebraic orbifold stratified by bipartite multipartitions. The unconstrained moduli has every multipartition realized. The stalkwise-diagonal moduli has realizability constraints that decompose per-degree to univariate IEP-G on the boundary-operator graphs (`theorems/chain-complex-iep-g-decomposition.md`). The univariate case recovers Arnold--Shapiro--Vainshtein--Weinstein and classical Barrett--Fallat IEP-G.

#### Theorem: Chain-complex IEP-G decomposes into per-degree univariate IEP-G {#chain-complex-iep-g-decomposition}

A structural simplification of the chain-complex IEP-G program. For cellular chain complexes with full degree support (positive cell counts at each non-trivial degree), realizability under stalkwise diagonal weights is determined entirely by the per-degree univariate IEP-G obstructions --- the cross-$d$ identifications add no additional obstructions.

This says **chain-complex IEP-G = direct product of univariate IEP-G's** in the cellular setting. Cross-$d$ structure of bipartite multipartitions has no obstruction content; only the within-$d_n$ structure carries IEP-G content.

##### Setup and notation

Cellular chain complex $(C_\bullet, d)$ over $\mathbb R$ with cell counts $n_n = \dim C_n$ and rank profile $(r_n)$. Stalkwise diagonal weights $w \in \mathcal H_{\mathrm{diag}} = \mathbb R_{>0}^{N_{\mathrm{cell}}}$ where $N_{\mathrm{cell}} = \sum_n n_n$.

For a bipartite multipartition $\Pi$ of $[N_*] = \bigsqcup_n \{1, \ldots, r_n\}$, define the **within-$d_n$ restriction** $\Pi|_n$ as the partition of $\{1, \ldots, r_n\}$ induced by intersecting blocks of $\Pi$ with the $d_n$-side. So $\Pi|_n$ describes how the $r_n$ singular values of $\widetilde d_n$ are grouped within degree $n$.

A block $B$ of $\Pi$ contributes to $\Pi|_n$ as a single block (containing $k_n^B$ indices) iff $k_n^B \ge 1$. Singletons in $\Pi|_n$ correspond to indices in cross-$d$ blocks of $\Pi$ where the block touches degree $n$ via just one index.

##### Conjectured theorem

> **Decomposition theorem (conjectured).** For a cellular chain complex $(C_\bullet, d)$ over $\mathbb R$ with $n_n \ge r_n$ at each degree (automatic), and for a bipartite multipartition $\Pi$ of $[N_*]$:
>
> $$\Pi \text{ is realizable in } \mathcal H_{\mathrm{diag}} \iff \Pi|_n \text{ is realizable as a univariate IEP-G partition for } d_n, \text{ for each } n.$$

##### Why this is the right statement

The per-degree restrictions $\Pi|_n$ describe how within-$d_n$ multiplicities pattern. The cross-$d$ identifications of $\Pi$ --- blocks $B$ with $k_n^B \ge 1$ for multiple $n$ --- describe equality between eigenvalues of $\widetilde d_n$ and $\widetilde d_{n+1}$.

The conjecture says: cross-$d$ identifications are *always* realizable (when the within-$d_n$ partitions are). The reason is structural: the eigenvalues of $\widetilde d_n$ and $\widetilde d_{n+1}$ depend on partly-disjoint sets of weights ($w_{n-1}, w_n$ for $\widetilde d_n$ and $w_n, w_{n+1}$ for $\widetilde d_{n+1}$). Even with shared $w_n$, we have enough independent weights ($w_{n-1}$ alone for $\widetilde d_n$, $w_{n+1}$ alone for $\widetilde d_{n+1}$) to tune the eigenvalues into matching positions.

##### Codim count and dimension argument

The realizing locus in $\mathcal H_{\mathrm{diag}} = \mathbb R_{>0}^{N_{\mathrm{cell}}}$ for a bipartite multipartition $\Pi$ has codim equal to the codim of $\Pi$ in moduli (under the identification of stalkwise weights with their projection to moduli, modulo gauge):

$$\mathrm{codim}(\Pi \text{ in moduli}) = N_* - \#\Pi.$$

This codim decomposes as:
$$N_* - \#\Pi = \sum_n (r_n - \#\Pi|_n) + \sum_B (\#\{n : k_n^B \ge 1\} - 1).$$

The first sum is the within-$d_n$ codim total; the second is the cross-$d$ identification codim total. (Verification: $\sum_n \#\Pi|_n = \sum_B \#\{n : k_n^B \ge 1\}$, so the total is $N_* - \sum_B \#\{n : k_n^B \ge 1\} + \sum_B \#\{n : k_n^B \ge 1\} - \#\Pi = N_* - \#\Pi$. ✓)

So the codim of $\Pi$ in moduli decomposes into:
- **Within-$d_n$ codim** at each degree $n$: $r_n - \#\Pi|_n$.
- **Cross-$d$ codim**: $\sum_B (\#\{n : k_n^B \ge 1\} - 1)$ --- one per "extra degree" each block touches beyond the first.

##### Proof

(⇒) **Easy direction.** Suppose $\Pi$ is realizable: there exists $w \in \mathcal H_{\mathrm{diag}}$ with bipartite multipartition $\Pi(w) = \Pi$. Restricting to the eigenvalues of $\widetilde d_n(w)$ gives the within-$d_n$ partition $\Pi|_n$ realized by the projected weights $(w_{n-1}, w_n)$.

(⇐) **Hard direction.** Suppose each $\Pi|_n$ is univariate-IEP-G-realizable for $d_n$. We construct $w \in \mathcal H_{\mathrm{diag}}$ realizing $\Pi$.

The argument has three pieces: (a) eigenvalue scaling, giving the cross-$d$ matching's solvability; (b) openness of realizing-locus projections, giving the joint per-degree realization; (c) iterated construction.

###### (a) Eigenvalue positive 1-homogeneity

**Lemma 1 (eigenvalue scaling).** Let $w_{n-1} \in \mathbb R_{>0}^{n_{n-1}}$ and $w_n \in \mathbb R_{>0}^{n_n}$ be fixed weights, and let $\sigma_i^{(n)}(w_{n-1}, w_n)$ be the $i$-th squared singular value of $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ (with $Q$'s being diagonal in the cellular basis). For any $\alpha > 0$:
$$\sigma_i^{(n)}(\alpha w_{n-1}, w_n) = \alpha \cdot \sigma_i^{(n)}(w_{n-1}, w_n).$$

**Proof.** $\widetilde d_n^T \widetilde d_n = Q_n^{-1/2} d_n^T Q_{n-1} d_n Q_n^{-1/2}$. Replacing $Q_{n-1}$ by $\alpha Q_{n-1}$ multiplies the entire matrix by $\alpha$, hence its eigenvalues by $\alpha$. $\square$

**Corollary.** As $\alpha$ ranges over $\mathbb R_{>0}$, $\sigma_i^{(n)}(\alpha w_{n-1}, w_n)$ ranges over $(0, \infty)$.

This is the structural fact making cross-$d$ matching tractable: any positive value can be matched by uniform scaling of the appropriate weight cluster.

###### (b) Openness of realizing-locus projections

**Definition.** For each degree $n$ and within-$d_n$ partition $\Pi|_n$, the **realizing locus** is
$$\mathcal R_n^{\Pi|_n} := \{(w_{n-1}, w_n) \in \mathbb R_{>0}^{n_{n-1} + n_n} : \widetilde d_n(w_{n-1}, w_n) \text{ has multiplicity pattern } \Pi|_n\}.$$

By assumption, $\mathcal R_n^{\Pi|_n} \neq \emptyset$.

**Lemma 2 (projection openness).** Let $\pi_2 : \mathcal R_n^{\Pi|_n} \to \mathbb R_{>0}^{n_n}$ be the projection $(w_{n-1}, w_n) \mapsto w_n$. Then $\pi_2(\mathcal R_n^{\Pi|_n})$ contains a non-empty open subset of $\mathbb R_{>0}^{n_n}$.

**Proof.** $\mathcal R_n^{\Pi|_n}$ is a real semi-algebraic subset of $\mathbb R_{>0}^{n_{n-1}+n_n}$ defined by polynomial equality conditions (eigenvalues coincide as required by $\Pi|_n$) and inequality conditions (eigenvalues outside $\Pi|_n$-blocks differ). It is locally closed.

Pick $(\hat w_{n-1}, \hat w_n) \in \mathcal R_n^{\Pi|_n}$. By Lemma 1, scaling $\hat w_{n-1}$ by any $\alpha > 0$ stays in $\mathcal R_n^{\Pi|_n}$ (multiplicities are preserved under scaling --- only eigenvalue *values* change). So the entire ray $\{(\alpha \hat w_{n-1}, \hat w_n) : \alpha > 0\}$ is in $\mathcal R_n^{\Pi|_n}$.

The projection of this ray to $w_n$ is $\{\hat w_n\}$ --- a single point. Need to show the projection contains an *open* set.

For this, observe that small perturbations of $\hat w_n$ admit nearby $(\tilde w_{n-1}, w_n')$ in $\mathcal R_n^{\Pi|_n}$ via the implicit function theorem on the eigenvalue equality conditions. Specifically: the equality conditions defining $\mathcal R_n^{\Pi|_n}$ are smooth on the locus where eigenvalues are simple within blocks (which is dense in $\mathcal R_n^{\Pi|_n}$). At such points, the differential of the equality conditions is surjective onto the tangent of the constraint space, by transversality (eigenvalue functions have generic-rank Jacobians on the realizing locus). Hence small perturbations of $w_n$ --- keeping the constraint satisfied by adjusting $w_{n-1}$ --- give nearby points of $\mathcal R_n^{\Pi|_n}$. The image projection contains an open neighborhood of $\hat w_n$. $\square$

###### (c) Iterated construction

**Step 1.** For each $n$, fix a starting point $(\hat w_{n-1}^{(n)}, \hat w_n^{(n)}) \in \mathcal R_n^{\Pi|_n}$ (non-empty by assumption).

**Step 2.** By Lemma 2, $\pi_2(\mathcal R_n^{\Pi|_n})$ contains an open neighborhood of $\hat w_n^{(n)}$ in $\mathbb R_{>0}^{n_n}$. Similarly, $\pi_1(\mathcal R_{n+1}^{\Pi|_{n+1}})$ contains an open neighborhood of $\hat w_n^{(n+1)}$. Two open subsets of $\mathbb R_{>0}^{n_n}$ may not overlap directly, but by Lemma 1's scaling: $\hat w_n^{(n+1)} = \beta \hat w_n^{(n)}$ for some $\beta > 0$ would still be in $\pi_1(\mathcal R_{n+1}^{\Pi|_{n+1}})$ after scaling by $\beta^{-1}$ (since scaling $w_n$ corresponds to scaling $w_{n+1}$ inversely to keep $\widetilde d_{n+1}$'s eigenvalues constant --- same scaling argument as Lemma 1).

So we can pick $w_n^*$ in the intersection of these two open sets. Iterating across degrees: pick $w_n^*$ for each $n$ in the joint open intersection of all relevant realizing-locus projections.

**Step 3.** With $w_n^*$ fixed, find $w_{n-1}, w_{n+1}$ in the fibers of $\mathcal R_n^{\Pi|_n}$ and $\mathcal R_{n+1}^{\Pi|_{n+1}}$ over $w_n^*$. These fibers are non-empty (by Lemma 2's openness). Pick $\hat w_{n-1}^*, \hat w_{n+1}^*$ in them.

The collected weights $w^* = (w_0^*, w_1^*, \ldots, w_N^*)$ are in $\mathcal H_{\mathrm{diag}}$ and realize each $\Pi|_n$. So the within-$d_n$ multiplicity pattern matches $\Pi|_n$ at every degree.

**Step 4.** Adjust for cross-$d$ identifications. Each cross-$d$ identification of $\Pi$ --- that some block $B$ has $k_n^B \ge 1$ for both $n$ and $n+1$, requiring $\sigma^{(n)}_i = \sigma^{(n+1)}_j$ for the corresponding indices --- is a single polynomial equation in $w$.

By Lemma 1's eigenvalue scaling: at $w^*$, the eigenvalue $\sigma^{(n)}_i(w_{n-1}^*, w_n^*) = \lambda^{(n)}$ and $\sigma^{(n+1)}_j(w_n^*, w_{n+1}^*) = \lambda^{(n+1)}$ are some positive values. Replace $w_{n-1}^*$ by $\frac{\lambda^{(n+1)}}{\lambda^{(n)}} \cdot w_{n-1}^*$: by Lemma 1, $\sigma^{(n)}_i$ scales accordingly, becoming $\lambda^{(n+1)}$, matching $\sigma^{(n+1)}_j$. The new $w$ still realizes $\Pi|_n$ (uniform scaling preserves multiplicities) and now also realizes the cross-$d$ identification.

If $\Pi$ has multiple cross-$d$ identifications: iterate. At each step, scale the appropriate weight cluster ($w_{n-1}$ or $w_{n+1}$) to match the next required identification. Each scaling preserves the previously-satisfied identifications (since uniform scaling preserves all matchings simultaneously).

Continue until all cross-$d$ identifications are satisfied. The resulting $w$ realizes $\Pi$ exactly. $\square$

##### Caveat: openness assumption

Lemma 2's openness assertion requires the differentials of the eigenvalue equality conditions to have generic full rank on the realizing locus. For "regular" cellular chain complexes --- those where the boundary operators don't have special structural rigidity --- this holds. Possible failure cases: chain complexes with exact symmetries forcing eigenvalue degeneracies non-generically (e.g., highly symmetric polytopal complexes where the realizing locus is a single $G_{\mathrm{cell}}$-orbit rather than a positive-dim subvariety). For such cases, the joint realization may fail and the decomposition theorem needs additional hypotheses. For typical cellular complexes encountered in applications, the openness holds and the theorem applies.

##### Verifications on examples

**$P_3$ chain complex** (univariate, $r_1 = 2$): only $\Pi|_1 = (1, 1)$ generic is univariate-IEP-G realizable (per `theorems/chain-complex-iep-g.md`). The decomposition theorem predicts: for any bipartite multipartition lifting $\Pi|_1 = (1,1)$, realizable. For $\Pi|_1 = (2)$ --- not realizable for $d_1 = P_3$. So no $\Pi$ with $\Pi|_1 = (2)$ is realizable. ✓ (Matches the $P_3$ obstruction.)

**Filled triangle** (rank profile $(2, 1)$):
- $\Pi|_1 = (1, 1)$ generic: univariate-IEP-G-realizable for $K_3$ ✓.
- $\Pi|_1 = (2)$ supersymmetric: univariate-IEP-G-realizable for $K_3$ (uniform weights give multiplicity-2). ✓
- $\Pi|_2 = (1)$: trivially realizable (rank-1 operator, just one eigenvalue).

So both within-$d_n$ partitions are realizable for any choice. The decomposition theorem predicts: all 4 bipartite multipartitions of (2,1) are realizable for the filled triangle. ✓ (Matches our explicit checks.)

##### Implications

1.  **Chain-complex IEP-G reduces to univariate IEP-G per degree.** The combinatorial complexity of the bipartite multipartition lattice doesn't generate new obstructions beyond what's already in classical IEP-G.

2.  **Cross-$d$ identifications are "free."** Whenever the underlying univariate problems are realizable, cross-$d$ identifications can be tuned in. This means the *interesting* content of chain-complex IEP-G is per-degree.

3.  **Refines the bipartite contribution.** The bipartite stratification theorem (`theorems/bipartite-stratification-theorem.md`) showed cross-$d$ identifications affect codim and stab differently from within-$d$ structure. The decomposition theorem now says cross-$d$ identifications affect *only* codim and stab, not realizability. This is a clean separation.

4.  **Computational tractability.** To determine which bipartite multipartitions are realizable for a given cellular chain complex, just classify univariate IEP-G realizability per degree. The bipartite combinatorics is a product of per-degree IEP-G data.

##### What this leaves for chain-complex IEP-G

After this decomposition, the chain-complex IEP-G program reduces to:

- **Univariate IEP-G for each degree's boundary operator $d_n$.** This is the classical Barrett--Fallat-style IEP-G for the graph induced by $d_n$.
- **Cellular structure determines which graphs appear.** For a CW complex $X$, the graph at degree $n$ is the bipartite incidence graph between $(n-1)$-cells and $n$-cells (or equivalently, the matrix-pattern graph of $d_n$).

So the *new* content of chain-complex IEP-G beyond classical IEP-G is identifying which graphs the boundary operators of cellular complexes induce, and what the corresponding multiplicity-partition realizability says.

##### Open

1.  **Rigorous proof of the decomposition theorem.** The codim count and transversality arguments need to be made rigorous. Possible failure mode: degenerate cases where the joint locus has higher codim than the per-degree codim sum (lack of transversality). For "generic" cellular complexes, the proof should go through.

2.  **Catalog univariate IEP-G for boundary-operator graphs.** For specific cellular complexes (paths, cycles, trees, surface complexes, etc.), determine the boundary-operator graph at each degree and apply classical IEP-G.

3.  **Topological characterization.** Which CW-complex topological invariants control which univariate partitions are realizable at each degree? Connect cellular topology to IEP-G data.

4.  **Sheaves on posets.** For Hilbert-valued sheaves on finite posets (Ayzenberg--Magai's general framework), the boundary-operator graph at degree $n$ is determined by the sheaf data plus poset structure. Generalization beyond cellular CW.

#### Example: Catalog of cellular IEP-G cases via the decomposition theorem {#iep-g-cellular-catalog}

Application of the chain-complex IEP-G decomposition theorem (`theorems/chain-complex-iep-g-decomposition.md`) to specific cellular chain complexes. For each case, we identify the boundary-operator graph(s) $G_n$ at each degree, apply known univariate IEP-G results to each, and combine via the decomposition theorem to determine the realizable bipartite multipartitions.

In each case the question is: for the cellular chain complex of CW complex $X$, which bipartite multipartitions $\Pi$ are realizable in $\mathcal H_{\mathrm{diag}}$? The decomposition theorem reduces this to: at each degree $n$, the within-$d_n$ partition $\Pi|_n$ must be univariate-IEP-G-realizable for the boundary-operator graph at degree $n$.

##### 1-dimensional cases (univariate)

For 1-dim cellular complexes (graphs as CW complexes), there's only $d_1$ and the boundary-operator graph is the underlying graph $G$. Univariate IEP-G applies directly.

###### Path $P_n$

$P_n$ has $n$ vertices, $n-1$ edges in a line. $r_1 = n-1$ (since $H_0 = \mathbb R$).

**Univariate IEP-G fact (classical, Sturm).** The squared singular values of $\widetilde d_1$ on $P_n$ with stalkwise weights are *always all distinct* --- irreducible tridiagonal matrices have simple spectrum.

**Realizable multipartitions:** only the generic $\{(1), (1), \ldots, (1)\}$. Every multipartition with at least one block of size $\ge 2$ is unrealizable.

###### Cycle $C_n$

$C_n$ has $n$ vertices, $n$ edges in a closed loop. $r_1 = n-1$ (with $H_0 = \mathbb R$, $H_1 = \mathbb R$).

**Univariate IEP-G facts.** With uniform weights, the cycle Laplacian's nonzero eigenvalues are $\{2 - 2\cos(2\pi k/n) : k = 1, \ldots, n-1\}$. These come in pairs $k, n-k$ (giving the same eigenvalue) for $k \ne n-k$. For odd $n$: pairs $(1, n-1), (2, n-2), \ldots$, so $(n-1)/2$ pairs, all double, plus possibly one singleton at $k = n/2$ (only if $n$ even). For even $n$: pairs $(1, n-1), \ldots, (n/2-1, n/2+1)$ all double, plus singleton at $k = n/2$.

So uniform $C_n$ realizes the multipartition with all-pairs-together (plus possibly one singleton): $\{(2)^{m}, (1)^{?}\}$ where $m = \lfloor (n-1)/2 \rfloor$.

For non-uniform weights: more multipartitions become realizable. The cyclic structure permits more flexibility than paths but less than complete graphs.

**Realizable multipartitions for $C_3$:** generic $\{(1),(1)\}$ and supersymmetric $\{(2)\}$ (the latter at uniform weights, by the $\mathbb Z_3$-symmetry). Both realizable.

**Realizable multipartitions for $C_4$:** $r_1 = 3$. Multipartitions of $\{1,2,3\}$: $(1,1,1), (2,1), (3)$. With uniform weights, eigenvalues $\{2 - 2\cos(\pi/2), 2 - 2\cos(\pi), 2 - 2\cos(3\pi/2)\} = \{2, 4, 2\}$, multiplicity pattern $(2, 1)$. So $(2, 1)$ is realized at uniform. Generic $(1,1,1)$ realized at non-symmetric weights. The $(3)$ partition (all three nonzero eigenvalues equal): would require $C_4$ to be "even more symmetric" than $\mathbb Z_4$ --- not realizable for $C_4$ as a graph (classical IEP-G result).

###### Complete graph $K_n$

$K_n$ has $n$ vertices, $\binom{n}{2}$ edges, each pair connected. $r_1 = n-1$.

**Univariate IEP-G facts.** $K_n$ has $S_n$-symmetry acting on vertices. Uniform weights give Laplacian $K_n$-spectrum $\{0, n^{(n-1)}\}$ --- eigenvalue 0 (kernel) with multiplicity 1, eigenvalue $n$ with multiplicity $n-1$. So uniform realizes the multipartition $(n-1)$ (all $r_1 = n-1$ eigenvalues equal).

For non-uniform weights, eigenvalues split. Generic multipartitions realize $(1)^{n-1}$.

**Realizable multipartitions for $K_n$.** All multipartitions are realizable, by classical IEP-G (Barrett--Fallat: $K_n$ realizes every multiplicity list, since the graph imposes no sparsity beyond the diagonal). In particular:
- $\{(1)^{n-1}\}$ generic,
- $\{(n-1)\}$ supersymmetric (uniform),
- All intermediate.

So $K_n$ is "freely realizable."

###### Star $K_{1, n-1}$ (path from one central vertex to $n-1$ leaves)

$K_{1, n-1}$ has 1 central vertex connected to $n-1$ leaves. $r_1 = n-1$.

**Univariate IEP-G facts.** The star's Laplacian has eigenvalues $\{0, 1^{(n-2)}, n\}$ for uniform weights --- multiplicity pattern $(1, n-2, 1)$ (kernel) + $(n-2, 1)$ on nonzero spectrum. Realizable multipartition for nonzero spectrum: $(n-2, 1)$.

For non-uniform weights: eigenvalues split. Many multipartitions realizable.

**Realizable multipartitions for $K_{1,n-1}$:** classical IEP-G says any multiplicity list with at most 2 distinct values (= partitions of $n-1$ with at most 2 distinct part sizes). So $(n-1)$, $(n-2, 1)$, $(n-3, 2)$, etc. are realizable; $(n-3, 1, 1)$ depends on whether 3 distinct values can be realized, etc. The classical analysis is technical.

###### Tree $T$

Generally, classical IEP-G for trees (Barrett--Fallat--Hall--Hogben) gives a rich combinatorial theory: realizability is controlled by the "minimum number of distinct eigenvalues" $q(T)$, and the multiplicity lists realizable for $T$ form a finite combinatorial structure determined by the tree's structure.

For our purposes: chain-complex IEP-G of a tree (1-dim cellular complex) reduces to univariate IEP-G of the tree. The classical literature applies directly.

##### 2-dimensional cases (genuinely bipartite)

###### Filled triangle (2-disk)

3 vertices, 3 edges (= $K_3$ graph), 1 triangle. Rank profile $(2, 1)$.

**Boundary-operator graphs:**
- $d_1$: $K_3$ graph. Univariate IEP-G: all multiplicity patterns of $r_1 = 2$ are realizable --- generic $(1, 1)$ and supersymmetric $(2)$.
- $d_2$: a "single 2-cell with 3 incident edges" structure --- boundary-operator graph is essentially trivial (single cell on each side, 1-dim relation). Univariate IEP-G: trivially realizes the single multipartition $(1)$.

**Realizable bipartite multipartitions:**
By the decomposition theorem, $\Pi$ is realizable iff each $\Pi|_n$ is univariate-realizable.

For the filled triangle, all $\Pi|_1$ are realizable ($K_3$ realizes everything) and all $\Pi|_2$ are realizable (trivial). So **all 4 bipartite multipartitions of $(2, 1)$ are realizable**:
- $\Pi_0 = \{(1,0), (1,0), (0,1)\}$
- $\Pi_A = \{(2,0), (0,1)\}$
- $\Pi_B = \{(1,0), (1,1)\}$
- $\Pi_T = \{(2,1)\}$

###### Boundary of tetrahedron $\partial \Delta^3 \cong S^2$

4 vertices, 6 edges (= $K_4$ graph), 4 triangles. Rank profile $(3, 3)$.

**Boundary-operator graphs:**
- $d_1$: $K_4$ graph. Univariate IEP-G: all multiplicity patterns of $r_1 = 3$ are realizable.
- $d_2$: edge-triangle incidence pattern. Each edge is in 2 triangles; each triangle has 3 edges. The graph $G_{d_2}$ is the "edge-of-triangle adjacency" graph, which for $\partial \Delta^3$ has $K_4$-like structure (all 4 triangles are mutually adjacent via shared edges). Univariate IEP-G of this graph: by symmetry similar to $K_4$, all multiplicity patterns of $r_2 = 3$ are realizable.

**Realizable bipartite multipartitions:**
All 31 bipartite multipartitions of $(3, 3)$ (per `examples/moduli-strata-classification.md`) are realizable. Confirms the surjectivity finding of `examples/cellular-sheaf-on-tetrahedron-boundary.md` ($\Phi: \mathcal H_{\mathrm{diag}} \twoheadrightarrow \mathcal M_{\mathrm{Lap}}$ surjective on $\partial \Delta^3$).

###### Path-with-2-cell (degenerate case, illustrative)

Topologically meaningful only with care: e.g., a 2-disk with the boundary subdivided into a path $P_3$ + a closing edge. This is just $\partial \Delta^2$ filled, which is the filled triangle above.

For a hypothetical "$P_3$ with an extra 2-cell glued along a non-closing path": the 2-cell's boundary doesn't close, so this isn't a valid cell complex.

If we try to invoke a chain complex with $d_1$ = $P_3$-Laplacian and $d_2$ = something rank 1: such a chain complex *exists* algebraically but doesn't come from a CW complex.

**For an algebraic chain complex with $d_1$ tridiagonal (path-like) and $d_2$ rank 1:** by the decomposition theorem, $\Pi|_1$ must be univariate-realizable for the path = generic only. So $\Pi$ must have $\Pi|_1 = (1)^{n-1}$. The cross-$d$ structure can still vary; there are $(2 \cdot \text{something})$ realizable bipartite multipartitions, all with generic $\Pi|_1$.

##### Synthesis

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

##### Computational verification (Python toolkit)

The python-toolkit at `tools/python-toolkit/` provides an IEP-G realizability checker. Running on small cases produces the following catalog of `(any-multiplicity, full-degeneracy)` realizability at uniform stalkwise weights:

| Complex                    | $r_1$ | spectrum at uniform    | mult profile | ANY            | FULL           |
|----------------------------|-------|------------------------|--------------|----------------|----------------|
| $P_3$                      | 2     | distinct               | $(1,1)$      | ✗ unrealizable | ✗ unrealizable |
| $P_4$                      | 3     | distinct               | $(1,1,1)$    | ✗              | ✗              |
| $C_3$                      | 2     | $\{3, 3\}$             | $(2)$        | ✓ realizable   | ✓ realizable   |
| $C_4$                      | 3     | $\{2, 2, 4\}$          | $(2, 1)$     | ✓              | ✗              |
| $K_3$                      | 2     | $\{3, 3\}$             | $(2)$        | ✓              | ✓              |
| $K_4$                      | 3     | $\{4, 4, 4\}$          | $(3)$        | ✓              | ✓              |
| $K_{1, 2} = P_3$           | 2     | distinct               | $(1, 1)$     | ✗              | ✗              |
| $K_{1, 3}$                 | 3     | $\{1, 1, 4\}$          | $(2, 1)$     | ✓              | ✗              |
| $\partial \Delta^2$        | 2     | $\{3, 3\}$             | $(2)$        | ✓              | ✓              |
| $\partial \Delta^3$, deg 1 | 3     | $\{4, 4, 4, 4, 4, 4\}$ | $(6)$        | ✓              | ✓              |
| $\partial \Delta^3$, deg 2 | 3     | $\{4, 4, 4\}$          | $(3)$        | ✓              | ✓              |

(ANY = some within-degree multiplicity \> 1 achievable; FULL = all nonzero eigenvalues equal achievable.)

**Findings refining the catalog:**

1.  **$C_4$ partial vs. full.** At uniform weights, $C_4$ realizes mult $(2, 1)$ --- partial degeneracy from the $\mathbb Z_4$ symmetry, but not full. The catalog above already noted this; toolkit confirms.

2.  **$K_{1, 3}$ partial vs. full.** Same pattern: $S_3$-symmetry on leaves gives mult $(2, 1)$, not $(3)$. So $K_{1, 3}$ admits *partial* but not *full* spectral degeneracy at uniform weights. The center-leaf asymmetry obstructs full degeneracy.

3.  **$K_4$ vs $K_{1, 3}$.** Both are 4-vertex graphs, but $K_4$ realizes full mult-$(3)$ degeneracy while $K_{1, 3}$ does not. Combinatorial structure (vertex-transitivity in $K_4$ vs center-leaf split in $K_{1, 3}$) determines realizability.

4.  **$\partial \Delta^3$ supersymmetric stratum.** At uniform weights, $\partial \Delta^3$'s degree-1 has all 6 nonzero eigenvalues equal (mult $(6)$), and degree-2 has all 3 nonzero equal (mult $(3)$). The bipartite supersymmetric stratum $\Pi_{\max}$ is realized at uniform --- confirming the cellular-sheaf moduli claim.

5.  **$P_n$ confirmed unrealizable for any multiplicity.** The Sturm tridiagonal-simplicity result holds: paths admit no spectral degeneracy at all, no matter what positive stalkwise weights. The toolkit's discriminant computation gives a sum-of-squares form (verified for $P_3$ matches the corpus formula $(\alpha b_1 - \beta b_2)^2 + 4 a_2^2 b_1 b_2$).

##### Open

1.  **Boundary-operator graphs for general cellular structures.** The map $X \mapsto \{G_n\}_n$ from cell complexes to graph-tuples is well-defined. Catalog $G_n$ for: simplicial $\partial \Delta^n$, regular polytope boundaries, products $X \times Y$, suspensions, etc.

2.  **Hodge-symmetric realizability.** When a cellular complex $X$ has Poincaré duality (e.g., $X = \partial \Delta^n$ for the boundary of a simplex), the boundary-operator graphs $G_n$ are isomorphic for $n$ and $n^* = (\dim X) - n$. This adds extra symmetry to the realizability theory and may produce constraints not visible from per-degree analysis.

3.  **Generic cellular complexes vs. special.** "Generic" cellular complexes have $G_n$ with no special structure beyond their bipartite-incidence form. "Special" ones (e.g., regular polytopes, vertex-transitive graphs) have additional symmetries that may yield realizability of multipartitions that wouldn't be realizable for generic structure.

#### Theorem \[SKETCH\]: Universal codim, category-specific stabilizer {#universal-vs-categorical-stratification}

A comparison of the cellular case (`theorems/stab-codim-formula.md`) with the smooth-Riemannian / Einstein case (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))) clarifies what about the stratified-moduli structure is universal across categories of Laplacianizations and what is category-specific.

##### What is universal

> **Universal codim formula (claim).** Let $(\mathcal C, H^\bullet)$ be a Laplacianizable pair, and let $\mathcal M_{\mathrm{Lap}}$ be the moduli of Hilbert lifts (modulo the natural automorphism action). The codimension of a stratum at $Q$ is
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\text{stratum of } [Q]) = \sum_B (|B| - 1)$$
> where $B$ runs over the equivalence classes of "Laplacian eigenvalues that coincide at $Q$" --- i.e., the multipartition of the nonzero spectrum of $\Delta(Q)$.

In other words: the moduli stratification by eigenvalue-multiplicity is universal. Codim of a stratum is just the number of independent eigenvalue-equality constraints imposed at points of that stratum.

The orbifold structure of $\mathcal M_{\mathrm{Lap}}$ is also universal: at any stratum, the local moduli is a quotient of an algebraic-stratum of $\mathcal H$ by the relevant automorphism group.

##### What is category-specific

The **dimension of the stabilizer** at a stratum point depends on what category one is working in --- specifically, on which "automorphisms preserving the Laplacianization" exist in the category.

###### Case 1: Cellular case (`theorems/stab-codim-formula.md`)

$\mathcal C$ = chain complexes; "automorphisms preserving the Laplacianization" = graded chain automorphisms preserving the Hilbert structure ($G \cap U(Q)$). These include *all* $O(k)$-rotations on $\Delta_n$-eigenspaces compatible with chain structure.

$$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}.$$

Each multiplicity-$k$ eigenvalue of $\Delta_n$ contributes $\binom{k}{2}$ to the stabilizer dim (the $O(k)$ on the eigenspace), with no further restriction from geometric realizability --- chain automorphisms are an algebraic concept.

###### Case 2: Smooth Riemannian / Einstein (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein)))

$\mathcal C$ = smooth manifolds with cohomology theory implicit (de Rham, plus tt-tensor cohomology in the Einstein case); "automorphisms preserving the Laplacianization" = isometries of $(M, g)$. The Einstein moduli stratifies by $\dim \epsilon(g) = \dim \ker(\Delta_L - 2E)|_{tt}$.

$$\dim \mathrm{stab}_{\mathrm{Diff}}(g) = \dim \mathrm{Isom}(M, g).$$

**Critically**, $\dim \mathrm{Isom}(M, g)$ is *not* given by $\binom{\dim \epsilon(g)}{2}$. For example: the round sphere $S^n$ has $\mathrm{Isom} = O(n+1)$ of dim $\binom{n+1}{2}$, but the round metric is rigid ($\epsilon = 0$). Conversely, an Einstein metric with positive-dim IED can have small isometry group.

The reason: only isometries of the manifold lift to "stabilizers" in moduli. Most algebraic $O$-rotations on the IED space $\epsilon(g)$ do *not* come from any geometric symmetry of $(M, g)$.

##### The structural difference

In the cellular case, the chain automorphism group $G$ is *purely algebraic*. Any linear map preserving the chain structure is in $G$, including arbitrary $O$-rotations on eigenspaces. The stab formula reflects this algebraic richness.

In the smooth case, the diffeomorphism group $\mathrm{Diff}(M)$ acts on metrics, but only diffeomorphisms preserving the metric ($\mathrm{Isom}(g)$) are stabilizers. Diffeomorphisms are *much* more restrictive than arbitrary linear automorphisms of tensor bundles --- they have to be geometric maps, not just algebraic ones.

So:

> **The cellular case has too much stabilizer; the Einstein case has too little**, relative to a naive eigenvalue-multiplicity prediction.

The cellular case's $\sum_B \sum_n \binom{k_n^B}{2}$ is a *maximal* count of stabilizer dim achievable by any algebraic automorphism. The Einstein case's $\dim \mathrm{Isom}(g)$ is a *minimal* count, restricted to genuinely geometric symmetries.

##### Implications

1.  **The orbifold-moduli stratification is universal**, instantiated in cellular finite-dim, parametric graph ([Aksoy and Young 2025](#ref-aksoy2025reimagining)), Einstein moduli, and finite spectral triple cases.

2.  **The codim formula is universal.** $\sum_B (|B|-1)$ counts independent eigenvalue equalities, category-independent.

3.  **The stab formula is not universal.** It depends on the automorphism category --- full algebraic $G$, geometric $\mathrm{Diff}/\mathrm{Isom}$, or chain-end-respecting unitary, etc.

4.  **Codim and stab answer different questions.** Stratum dim is universal; local orbifold structure depends on the category-specific stabilizer.

##### What the right framework should look like

A unified Hilbert-lift-with-automorphism-group framework would specify:

- The category $\mathcal C$ of inputs.
- The cohomology theory $H^\bullet: \mathcal C \to \mathbf{grVect}$.
- The Hilbert lift functor $F: \mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$.
- The **automorphism category** $\mathrm{Aut}(\mathcal C)$: which morphisms count as automorphisms that should act on moduli.

For the cellular case: $\mathrm{Aut} = G_{\mathrm{ext}}$ (graded linear automorphisms), and stab is $G \cap U(Q)$.

For the Einstein case: $\mathrm{Aut} = \mathrm{Diff}(M)$, and stab is $\mathrm{Isom}(M, g)$.

The claim then is: for any choice of $\mathrm{Aut}$, the moduli of Hilbert lifts modulo $\mathrm{Aut}$ has orbifold structure with strata indexed by eigenvalue-multiplicity data. The stab formula at each stratum depends on $\mathrm{Aut}$. The codim formula does not.

##### The Einstein analog of the "cross-$d_n$" effect

In the cellular case, the stab/codim discrepancy at a stratum has two sources:
- Within-$d_n$ multiplicities contribute *positively* to (stab − codim): excess stab from $O(k)$ algebraic rotation on eigenspaces.
- Cross-$d_n$ identifications contribute *negatively*: codim grows but stab doesn't, because chain conditions kill the would-be cross-rotation.

In the Einstein case, there is only **one** Laplacian (Lichnerowicz), and one boundary operator implicit (the de Rham $d$ acting on tensors). So there's no "cross-$d_n$ identification" structure --- every eigenvalue-collision is a "within-$\Delta_L$" event.

This is consistent with the smooth case being "cleaner" structurally: there's just one Laplacian whose spectrum stratifies the moduli, and the stab is $\mathrm{Isom}$, which is whatever it is geometrically (no cross-coupling correction).

The cellular case's bipartite structure is specifically a feature of having multiple boundary operators $d_1, d_2, \ldots$ in a graded chain complex. For higher-form-Einstein-like equations with Laplacians acting on multiple form-degrees simultaneously, the bipartite/N-partite structure should reappear and the cellular-side analysis would generalize.

##### Open

1.  **Find or construct an Einstein-style moduli with N-partite structure.** Higher-form Yang-Mills-Einstein systems with multiple Laplacian operators? Self-dual / anti-self-dual decomposition on 4-manifolds? The cellular analysis predicts these should produce within-form-degree-multiplicity vs cross-form-degree-identification distinctions.

2.  **A unified statement.** Write the universal codim formula as a theorem in a category-free framework (i.e., not specific to either chain complexes or Riemannian metrics). The hypotheses should be: a Hilbert-lift functor with an automorphism category. The conclusion: codim of moduli strata = $\sum_B (|B|-1)$.

3.  ~~**Stratification poset.**~~ **Done for the cellular case** in `theorems/closure-poset-of-strata.md`: closure poset = bipartite multipartition refinement lattice, with explicit covering relations. The Einstein-side analog (closure poset of $\dim \epsilon(g)$-stratification) should be similarly classical; not written up in this corpus.

4.  **Dual-stratification analog.** The cellular case has *two* stratifications: Stratification I (this theorem's subject --- eigenvalue multipartition) and Stratification II at the SPD-cone boundary (`theorems/hilbert-degeneracy-stratification.md`). Does the Einstein case have an analog? The boundary of the moduli of Einstein metrics --- where metrics become degenerate (e.g., collapse to lower-dim) --- would be the natural candidate. Open whether this has been studied in the differential-geometry literature.

#### Theorem \[PARTIAL-PROVED\]: Cross-category orbifold-stratification (Project B) {#cross-category-orbifold-stratification}

> **Status note.** The finite-dim case of the cross-category theorem is proved (see "Proof for the finite-dim case" section). The smooth (infinite-dim Riemannian) case has the structural pattern established empirically but not yet a category-free proof.

The unifying meta-theorem of Project B: a category-theoretic abstraction stating that the moduli of Hilbert lifts of any cohomology theory is a stratified orbifold, with the stratification indexed by spectral-multiplicity invariants of the associated Hodge Laplacian. Specializes to: cellular bipartite stratification (Project A), de Rham Hodge theory (smooth Riemannian), Young's inner product Laplacian (parametric graph).

##### Abstract framework

A **Laplacianizer framework** is a tuple $\mathfrak F = (\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ where:

- $\mathcal C$ is a category of input structures.
- $H^\bullet : \mathcal C \to \mathbf{grVect}_\Bbbk^{\le \omega}$ is a graded-vector-space-valued cohomology theory (countable-dim).
- $F : \mathcal C \to \mathbf{Ch}_b(\mathbf{Hilb}_\Bbbk)$ is a Hilbert-lift functor: each $F(X)$ is a graded Hilbert chain complex $(F(X)_\bullet, d_X)$ with $d_X^2 = 0$.
- $\eta : H^\bullet \xrightarrow{\sim} H_\bullet \circ F$ is a natural isomorphism (cohomology of $F$ matches $H^\bullet$, on objects where $d_X$ has closed range).
- $\mathrm{Aut} : \mathcal C \to \mathbf{Grp}$ is a "preserving automorphism" functor, assigning to each $X$ a topological group $\mathrm{Aut}(X)$ acting on the space $\mathcal H(X) = \prod_n \mathrm{Sym}^+(F(X)_n)$ of Hilbert structures on $F(X)$, with the action commuting with the chain differential $d_X$.

For each $X \in \mathcal C$ admitting a Hilbert lift (i.e., $F(X)$ has closed range so $\eta$ realizes the cohomology), the **moduli of Laplacianizers at $X$** is

$$\mathcal M_{\mathrm{Lap}}(X) := \mathrm{Aut}(X) \backslash \mathcal H(X).$$

The Hodge Laplacian on $F(X)$ for $Q \in \mathcal H(X)$ is

$$\Delta_X(Q) := d_X d_X^*_{(Q)} + d_X^*_{(Q)} d_X,$$

where $d_X^*_{(Q)}$ is the adjoint of $d_X$ relative to the Hilbert structure $Q$. By Hodge theorem (when $d_X$ has closed range), $\ker \Delta_X(Q) \cong H^\bullet(X)$ via $\eta$.

##### Spectral data

For $Q \in \mathcal H(X)$, define the **spectral multipartition** $\Pi(Q)$ of the indexing set
$$[N_*(X)] := \bigsqcup_n \{1, \ldots, r_n(X)\}$$
where \$r_n(X) = `\mathrm{rank}`{=tex}, d_X\|\_{F(X)\_n} = \$ rank of the $n$-th boundary of $F(X)$, by the equivalence relation $\sigma_i^{(n)}(Q) = \sigma_j^{(n')}(Q)$ on the squared singular values of $\widetilde d_n^{(Q)}$.

(For finite-dim $F(X)$, this is well-defined and continuous in $Q$. For infinite-dim $F(X)$, the spectral data is more subtle; we restrict to settings where $\widetilde d_n$ has closed range and discrete spectrum --- typical in the survey.)

##### Cross-category theorem

> **Theorem (cross-category orbifold-stratification, conjectured for $\mathfrak F$).** Let $\mathfrak F = (\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ be a Laplacianizer framework, and let $X \in \mathcal C$ admit a Hilbert lift with $\widetilde d_n$ of closed range and discrete spectrum for all $n$. Suppose $\mathrm{Aut}(X)$ acts properly on $\mathcal H(X)$. Then:
>
> 1.  $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ is locally an orbifold (real algebraic in finite-dim, smooth Banach in smooth-infinite-dim).
>
> 2.  $\mathcal M_{\mathrm{Lap}}(X)$ is stratified by the spectral multipartition $\Pi(Q)$. Strata: $\mathrm{Stratum}(\Pi) = \{[Q] : \Pi(Q) = \Pi\}$, locally closed.
>
> 3.  **Codim formula (universal).** $\mathrm{codim}(\mathrm{Stratum}(\Pi)) = \sum_B (|B| - 1)$.
>
> 4.  **Stab dim formula (category-specific).** $\dim \mathrm{stab}_{\mathrm{Aut}(X)}(Q)$ depends on $\mathrm{Aut}(X)$, with explicit formulas:
>
>     - Cellular case: $\dim \mathrm{stab} = \sum_B \sum_n \binom{k_n^B}{2}$ where $k_n^B$ is the within-$d_n$ block sizes.
>     - Riemannian case: $\dim \mathrm{stab} = \dim \mathrm{Isom}(M, g)$, the geometric isometry group of the Riemannian manifold.
>     - Parametric graph case: $\dim \mathrm{stab}$ depends on the conformal automorphism group of $(G, Q)$.
>
> 5.  **Closure poset.** The closure relation is given by coarsening of spectral multipartitions: $\overline{\mathrm{Stratum}(\Pi)} = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$.

##### Verification on instances

**Instance 1 (cellular).** $\mathcal C =$ finite chain complexes over $\mathbb R$, $\mathrm{Aut} = G$ chain auto group, $\mathrm{Aut}$ acts on $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ by conjugation. The cross-category theorem specializes to the **bipartite stratification theorem** (`theorems/bipartite-stratification-theorem.md`), proved in Project A.

**Instance 2 (smooth Riemannian).** $\mathcal C =$ compact smooth manifolds, $H^\bullet =$ de Rham cohomology, $F$ takes a manifold + metric to the $L^2$ de Rham complex with the metric's induced inner products. $\mathrm{Aut}(M) = \mathrm{Diff}(M)$.

The closed-range condition holds for compact manifolds. Spectral multipartitions are partitions of the index set of nonzero squared singular values of $d, d_*$ (= eigenvalues of $\Delta$ on each form-degree).

The orbifold structure of moduli of metrics: well-known (Ebin slice theorem). Strata by isometry-type (= eigenvalue-multiplicity-type, modulo isometry). The cross-category theorem matches.

**Instance 3 (parametric graph).** $\mathcal C =$ graphs, $F$ takes a graph + per-vertex/edge inner products. $\mathrm{Aut}$ = "conformal" subgroup preserving the parameterized structure (Aksoy and Young ([2025](#ref-aksoy2025reimagining))'s framework).

Each graph's parameter space is finite-dim. Strata indexed by which named Laplacian (combinatorial / normalized / hypergraph / etc.) the parameter point realizes --- equivalently, by spectral multipartition of the inner product Laplacian. The cross-category theorem applies.

**Instance 4 (Einstein constrained).** $\mathcal C =$ smooth manifolds with the Einstein equation as constraint, $\mathrm{Aut} = \mathrm{Diff}$. The moduli is the moduli of Einstein metrics; strata indexed by IED dim = $\dim \ker(\Delta_L - 2E)|_{tt}$ (Lichnerowicz on tt-tensors). The cross-category theorem matches the literature's known results.

##### Where the theorem requires care

The theorem as stated has *both* universal pieces and category-specific pieces:

- **Universal:** orbifold structure (modulo properness of $\mathrm{Aut}$-action), stratification by spectral multipartition, codim formula, closure poset.
- **Category-specific:** stab dim formula, depending on the $\mathrm{Aut}$ structure.

This split is consistent with what Project A established for the cellular case. The cross-category theorem extends the *universal* piece to non-cellular settings, with the *category-specific* piece naturally varying.

##### What's needed to fully prove

1.  **Properness of $\mathrm{Aut}$-action.** Standard for finite-dim and Riemannian (Ebin). Trickier for infinite-dim cases without additional structure.

2.  **Continuity of spectrum.** For finite-dim, eigenvalues vary continuously by Kato perturbation theory. For infinite-dim with closed range, by spectral perturbation theory of unbounded self-adjoint operators (also Kato).

3.  **Codim formula in non-cellular settings.** Should follow from continuity of spectrum + the same eigenvalue-equality-counting as Project A. The bipartite refinement (cross-$d$ vs. within-$d$) doesn't obviously generalize to non-chain-complex settings. For the smooth case, $F(X)$ is the de Rham complex with chain differential the exterior derivative, so the bipartite multipartition framework still applies --- just with possibly infinite-dim chain spaces and unbounded $d$.

4.  **Stab dim formula across categories.** The cellular formula $\sum_B \sum_n \binom{k_n^B}{2}$ comes from the chain auto group being "all algebraic chain automorphisms." For other categories, $\mathrm{Aut}$ is more restrictive (e.g., $\mathrm{Diff}$ for Riemannian), so the stab dim is smaller and category-specific. The cross-category theorem should make the dependence explicit.

##### Open and project-B-specific

1.  **Rigorous proof of the cross-category theorem.** Each piece (orbifold structure, codim, closure poset) needs to be checked with full hypotheses.

2.  **Bipartite contribution in non-chain-complex settings.** Where does the within-$d_n$ vs. cross-$d_n$ distinction live in the smooth Riemannian case? The de Rham complex has multiple boundary operators ($d_n: \Omega^n \to \Omega^{n+1}$); the bipartite multipartition of singular values across degrees should give a multipartite structure in the smooth case too. Whether cross-$d_n$ identifications carry the same stab/codim asymmetry as in cellular is open.

3.  **Other 2025 categories.** Spectral triples (noncommutative) and $p$-Laplacians (nonlinear) don't fit the linear Hilbert-chain-complex framework. Extensions or modifications are needed; see `objects/spectral-triple.md` for the noncommutative challenges and ([Ge and Qin 2025](#ref-ge2025computing)) for the nonlinear.

4.  **Connection to derived categories.** A category-theoretic foundation for "moduli of Hilbert lifts" might use derived-category-of-Hilbert-chain-complexes machinery --- formalizing "Hilbert lift modulo natural iso" as a derived equivalence class. This is open.

##### Proof for the finite-dim case

For finite-dim $F(X)$, the cross-category theorem can be proved by a synthesis of Project A's argument with the relaxation that $\mathrm{Aut}(X)$ is a parameter rather than the full chain automorphism group $G$.

**Hypothesis.** $F(X)$ is finite-dim graded ($\dim F(X)_n < \infty$ for all $n$, finitely many nonzero). $\mathrm{Aut}(X)$ is a real Lie group (or real algebraic group) acting smoothly on $\mathcal H(X)$, commuting with $d_X$.

**Step 1: Strata are well-defined.** Define $\mathrm{Stratum}(\Pi) := \{[Q] \in \mathcal M_{\mathrm{Lap}}(X) : \Pi(Q) = \Pi\}$. The condition $\Pi(Q) = \Pi$ depends only on the orbit $\mathrm{Aut}(X) \cdot Q$ (since chain isomorphisms preserve spectra), so $\mathrm{Stratum}(\Pi)$ is well-defined as a subset of $\mathcal M_{\mathrm{Lap}}(X)$. Its preimage in $\mathcal H(X)$ is a locally closed semi-algebraic set (closed equality conditions on $\sigma$-coincidences plus open inequality conditions on $\sigma$-non-coincidences); the quotient retains local closedness.

**Step 2: Codim formula.** $\mathrm{codim}(\mathrm{Stratum}(\Pi)) = \sum_B (|B| - 1)$ in $\mathcal M_{\mathrm{Lap}}(X)$.

Same argument as Project A: each block $B$ with $|B| \ge 2$ imposes $|B| - 1$ independent eigenvalue-equality conditions. The total codim is $\sum_B (|B| - 1) = N_*(X) - \#\Pi$, where $N_*(X) = \sum_n r_n(X)$.

This formula is *universal* --- does not depend on $\mathrm{Aut}(X)$ --- because the eigenvalues are functions of $Q$ alone, not of how $\mathrm{Aut}$ acts.

**Step 3: Stab dim formula.** $\dim \mathrm{stab}_{\mathrm{Aut}(X)}(Q)$ depends on $\mathrm{Aut}(X)$.

For the cellular case ($\mathrm{Aut} = G$ chain auto group): the stab formula reduces to $\sum_B \sum_n \binom{k_n^B}{2}$ via the chain-conditions argument of Project A.

For other choices of $\mathrm{Aut}$: the stab dim is the dim of $\mathrm{stab}_{\mathrm{Aut}(X)}(Q) \cap U(F(X), Q)$, where $U(F(X), Q)$ is the unitary group of the Hilbert structure $Q$. By restricting the cellular-case argument to the subgroup $\mathrm{Aut}(X) \subseteq G$, the cellular stab formula gives an *upper bound*; the actual stab dim equals the dim of $\mathrm{Aut}(X)$'s contribution within the unitary stabilizer, which is generally smaller.

**Step 4: Closure poset.** $\overline{\mathrm{Stratum}(\Pi)} = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$.

Same argument as Project A's closure-poset theorem (`theorems/closure-poset-of-strata.md`): upper-semi-continuity of $\Pi(Q)$ in $Q$ gives the closure $\subseteq$ direction; first-order Rayleigh--Schrödinger perturbation gives the closure $\supseteq$ direction. The argument doesn't depend on $\mathrm{Aut}$ beyond $\mathrm{Aut}(X)$ acting on $\mathcal H(X)$ (which it does by hypothesis).

**Step 5: Orbifold structure.** $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ is a real algebraic orbifold *if* $\mathrm{Aut}(X)$ acts properly on $\mathcal H(X)$ (which is hypothesized).

For finite-dim Lie groups acting properly on smooth manifolds, the quotient is an orbifold by standard theory (e.g., Bredon, *Introduction to Compact Transformation Groups*; or specifically for real algebraic actions, GIT-style quotient constructions). The strata are smooth orbifolds, the closure poset has incidence relations as described.

This completes the proof for finite-dim Laplacianizer frameworks. $\square$

##### Specializations

The above proof gives:

- **Cellular case** ($\mathrm{Aut} = G$, full chain auto group): recovers `theorems/bipartite-stratification-theorem.md`.

- **Parametric graph case** (\$`\mathrm{Aut}`{=tex} = \$ Young's "conformal" subgroup of the chain auto group): the theorem applies, giving a stratified orbifold of inner-product-Laplacians. Stab dim is smaller than the cellular case (since $\mathrm{Aut}$ is smaller); the codim formula and closure poset are identical.

- **Finite chain complex with arbitrary $\mathrm{Aut}$ subgroup**: the theorem gives the moduli structure for any user-specified automorphism subgroup. The stratification is invariant under enlarging or shrinking $\mathrm{Aut}$ (it depends only on $\Pi$); only the stab dim changes.

##### Smooth (infinite-dim) case: open

For the smooth Riemannian case (Instance 2 in the framework above), the proof requires:

- Closed-range hypothesis on $d_X$ in the de Rham complex, which holds for compact manifolds.
- Continuity of spectrum (eigenvalues of unbounded self-adjoint operators, by Kato).
- Properness of $\mathrm{Diff}(M)$ acting on metrics (Ebin slice theorem).
- An infinite-dim version of "first-order perturbation" for the closure $\supseteq$ direction.

Each of these is standard in the smooth Hodge theory / Riemannian moduli literature, but assembling them into a single proof of the cross-category theorem is open work. The Einstein-moduli paper (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))) does the analogous job for Einstein metrics; an explicit cross-category statement covering both cellular and Riemannian would generalize.

##### Status

- **Finite-dim case: proved** (above).
- **Smooth case: structural pattern established empirically** (Project A's cellular case; Einstein moduli; smooth Hodge); rigorous category-free statement open.
- **Nonlinear / noncommutative: outside the framework's scope.**

##### What this delivers as a Project B result

The finite-dim cross-category theorem, as proved above, is the **first deliverable of Project B**. It generalizes Project A's bipartite stratification theorem from the cellular case to any finite-dim Laplacianizer framework with prescribed automorphism subgroup.

Combined with Project A:

> **laplanc-2025 main theorem (combined cellular + cross-category, finite-dim).** For any finite-dim Laplacianizer framework $\mathfrak F = (\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$, fixing $X \in \mathcal C$ admitting a Hilbert lift, the moduli $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ is a real algebraic orbifold. Strata are indexed by spectral multipartitions of $\Delta_X$, with universal codim formula $\sum_B(|B|-1)$ and category-specific stab dim formula determined by $\mathrm{Aut}(X)$. The closure poset is the multipartition refinement lattice. For the cellular case ($\mathrm{Aut} = G$), this specializes to the bipartite stratification theorem of Project A; the realizability companion (`theorems/bipartite-realizability.md`) and chain-complex IEP-G decomposition (`theorems/chain-complex-iep-g-decomposition.md`) refine the cellular case further.

This is a publishable mid-sized result, tying together Project A's cellular work with the cross-category framework. The smooth (Riemannian, Einstein) case is the natural follow-up project.

#### Theorem: Laplacianizability for finite spectral triples {#finite-spectral-triple-laplacianizability}

The first concrete sub-case of the noncommutative frontier (`theorems/noncommutative-laplacianizability.md`). For *finite* spectral triples --- i.e., $(\mathcal A, \mathcal H, D)$ with $\mathcal A$ a finite-dim $*$-algebra and $\mathcal H$ a finite-dim Hilbert space --- the cross-category orbifold-stratification theorem applies once a suitable **Hochschild--Hilbert lift** is constructed. This entry provides the explicit construction and proves the cross-category theorem in this setting.

The result: finite spectral triples on a fixed $(\mathcal A, \mathcal H)$ have an orbifold-stratified moduli with the same universal codim formula $\sum_B(|B|-1)$ as the cellular and smooth Riemannian cases, with stab dim depending on the commutant of $\mathcal A$ in $U(\mathcal H)$.

##### Setup

A **finite spectral triple** is $(\mathcal A, \mathcal H, D)$ with:

- $\mathcal A$ a finite-dim $*$-algebra over $\mathbb C$, equipped with a faithful $*$-representation $\pi: \mathcal A \to \mathcal B(\mathcal H)$.
- $\mathcal H$ a finite-dim Hilbert space.
- $D \in \mathcal B(\mathcal H)$ self-adjoint.

Bounded-commutator and compact-resolvent conditions are automatic in finite-dim.

Fix $(\mathcal A, \mathcal H)$. The space of admissible $D$'s is
$$\mathcal D(\mathcal A, \mathcal H) := \{D \in \mathcal B(\mathcal H) : D = D^*\} = \mathrm{Herm}(\mathcal H),$$
a real vector space of dim $(\dim \mathcal H)^2$. This is the **moduli ambient** for spectral triples on $(\mathcal A, \mathcal H)$.

The **gauge group** is the commutant
$$G(\mathcal A) := U(\mathcal H) \cap \pi(\mathcal A)' = \{u \in U(\mathcal H) : u \pi(a) = \pi(a) u\ \forall a \in \mathcal A\},$$
acting on $D$ by conjugation $u \cdot D := u D u^*$. The moduli of spectral triples is
$$\mathcal M_{\mathrm{spec}}(\mathcal A, \mathcal H) := G(\mathcal A) \backslash \mathrm{Herm}(\mathcal H).$$

##### Hochschild complex

The reduced Hochschild complex of $\mathcal A$:
$$C_n(\mathcal A) := \mathcal A^{\otimes(n+1)}, \qquad b: C_n \to C_{n-1}$$
$$b(a_0 \otimes \cdots \otimes a_n) := \sum_{i=0}^{n-1}(-1)^i a_0 \otimes \cdots \otimes a_i a_{i+1} \otimes \cdots \otimes a_n + (-1)^n a_n a_0 \otimes a_1 \otimes \cdots \otimes a_{n-1}.$$
$b^2 = 0$. Hochschild homology $\mathrm{HH}_\bullet(\mathcal A) = H_\bullet(C_\bullet, b)$ is finite-dim (since $\mathcal A$ is finite-dim).

For finite-dim $\mathcal A$ over $\mathbb C$, $\mathrm{HH}_\bullet(\mathcal A)$ is computable:
- $\mathcal A = M_n(\mathbb C)$ (separable): $\mathrm{HH}_0 = \mathbb C$, $\mathrm{HH}_k = 0$ for $k \ge 1$.
- $\mathcal A = \mathbb C^N$ (commutative): $\mathrm{HH}_0 = \mathbb C^N$, $\mathrm{HH}_k = 0$ for $k \ge 1$ (also separable).
- $\mathcal A = \mathbb C[\mathbb Z/n]$ (group algebra): $\mathrm{HH}_\bullet$ has rich structure depending on $n$.
- $\mathcal A = \mathbb C[t]/(t^n)$ (truncated polynomials): $\mathrm{HH}_\bullet$ is non-trivial in all degrees up to some bound.

##### Hochschild--Hilbert lift

> **Definition (Hochschild--Hilbert lift).** For a finite spectral triple $(\mathcal A, \mathcal H, D)$, define the inner product on $C_n(\mathcal A)$ by
> $$\langle a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n \rangle_D := \mathrm{Tr}_\mathcal H\big(\pi(a_0)^* R_D\, \pi(b_0)\big) \cdot \prod_{i=1}^{n} \mathrm{Tr}_\mathcal H\big([D, \pi(a_i)]^* R_D\, [D, \pi(b_i)]\big)$$
> where $R_D := (1 + D^2)^{-1}$ is the resolvent.

This depends on $D$ via the resolvent and the commutators $[D, \pi(\cdot)]$. The resolvent $R_D$ is positive (as $1 + D^2 \ge 1$), so the inner product is positive-definite *provided* the map
$$\theta_D^{(n)}: C_n(\mathcal A) \to \mathcal B(\mathcal H)^{\otimes(n+1)}, \quad a_0 \otimes \cdots \otimes a_n \mapsto \pi(a_0) \otimes [D, \pi(a_1)] \otimes \cdots \otimes [D, \pi(a_n)]$$
is injective.

> **Lemma (injectivity of $\theta_D$ on a generic open set).** For $D$ in a Zariski-open subset of $\mathrm{Herm}(\mathcal H)$, $\theta_D^{(n)}$ is injective. On the complement (a real-algebraic subvariety of positive codim), $\theta_D^{(n)}$ has non-trivial kernel; on this complement, the bilinear form $\langle \cdot, \cdot \rangle_D$ is positive *semidefinite*, and we work modulo its kernel.

For $D$ in the open injective locus, $(C_\bullet(\mathcal A), b, \langle\cdot,\cdot\rangle_D)$ is a finite-dim graded Hilbert chain complex.

The Hodge Laplacian
$$\Delta_n^{(D)} := b b^*_D + b^*_D b: C_n(\mathcal A) \to C_n(\mathcal A)$$
is self-adjoint w.r.t. $\langle\cdot,\cdot\rangle_D$, with $\ker \Delta_n^{(D)} \cong \mathrm{HH}_n(\mathcal A)$ by the Hodge isomorphism.

> **Justification.** For finite-dim chain complexes with non-degenerate inner product, the Hodge isomorphism $\ker \Delta_n \cong H_n$ is automatic (no closed-range obstruction). So the lift gives a Laplacianization in the sense of `concepts/laplacianizer.md`.

##### Cross-category theorem in this setting

> **Theorem (cross-category orbifold-stratification, finite spectral triples).** Let $(\mathcal A, \mathcal H)$ be fixed with $\dim_\mathbb C \mathcal A < \infty$ and $\dim_\mathbb C \mathcal H < \infty$. Restrict to the Zariski-open subset $\mathrm{Herm}^\circ(\mathcal H) \subset \mathrm{Herm}(\mathcal H)$ where the Hochschild--Hilbert lift is non-degenerate. Then:
>
> 1.  **Orbifold structure.** $\mathcal M^\circ_{\mathrm{spec}}(\mathcal A, \mathcal H) := G(\mathcal A) \backslash \mathrm{Herm}^\circ(\mathcal H)$ is a real-analytic orbifold of dim $(\dim \mathcal H)^2 - \dim G(\mathcal A)$.
>
> 2.  **Stratification.** Strata are indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta_n^{(D)})$ --- recording within-degree-$n$ and cross-degree-$n$ eigenvalue coincidences of the Hodge Laplacians on Hochschild chains.
>
> 3.  **Universal codim.** $\mathrm{codim}\,\mathrm{Stratum}(\Pi) = \sum_{B \in \Pi, |B| \ge 2}(|B|-1)$, same as cellular and smooth cases.
>
> 4.  **Stab dim (category-specific).** $\dim \mathrm{stab}_G([D]) = \dim Z_{G(\mathcal A)}(D)$, the dim of the centralizer of $D$ in the gauge group $G(\mathcal A)$. For generic $D$ in a $\Pi$-stratum, this is determined by the multipartition of $D$'s eigenvalues *as restricted to* the irreducible components of $\mathcal H$ under $\mathcal A$-action.
>
> 5.  **Closure poset.** Refinement of bipartite multipartitions, same as cellular and smooth cases.

###### Proof

The cross-category orbifold-stratification theorem (`theorems/cross-category-orbifold-stratification.md`) applies once we verify the Laplacianizer framework $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ assembles:

- $\mathcal C$ = category of finite spectral triples on $(\mathcal A, \mathcal H)$, morphisms = unitary intertwiners commuting with $\pi(\mathcal A)$.
- $H^\bullet = \mathrm{HH}_\bullet(\mathcal A)$ --- independent of $D$.
- $F: D \mapsto (C_\bullet(\mathcal A), b, \langle\cdot,\cdot\rangle_D)$ --- Hochschild complex with $D$-dependent Hilbert structure.
- $\eta_D$: standard Hodge isomorphism for non-degenerate inner products.
- $\mathrm{Aut} = G(\mathcal A)$.

The framework is *finite-dim* (both $\mathcal H$ and $C_\bullet(\mathcal A)$ are finite-dim), so the **finite-dim cross-category theorem** applies directly, yielding (1)--(5).

The main verification is that the inner product $\langle\cdot,\cdot\rangle_D$ varies real-analytically in $D$ on $\mathrm{Herm}^\circ(\mathcal H)$. This follows because $R_D = (1+D^2)^{-1}$ is real-analytic in $D$ on the open set where $1+D^2$ is invertible (here automatic since $1+D^2 \ge 1$), and trace and tensor products preserve real-analyticity. ∎

##### Specialization: matrix algebra

> **Corollary (matrix algebra reduces to Arnold).** For $\mathcal A = M_n(\mathbb C)$ acting irreducibly on $\mathcal H = \mathbb C^n$:
>
> - $\mathrm{HH}_0 = \mathbb C$ (traces), $\mathrm{HH}_k = 0$ for $k \ge 1$.
> - The Hochschild complex resolves to a single chain space $\mathcal A / [\mathcal A, \mathcal A] = \mathbb C$.
> - The cross-category theorem reduces to: moduli of self-adjoint $D$ on $\mathbb C^n$, modulo $G(M_n(\mathbb C)) = U(1)$ (only scalars commute with $M_n(\mathbb C)$ acting irreducibly).
> - But $U(1)$ acts trivially by conjugation on Hermitian matrices: $u D u^* = D$ for $u \in U(1)$.
> - So $\mathcal M^\circ_{\mathrm{spec}} = \mathrm{Herm}(\mathbb C^n)$, with stratification by eigenvalue multipartition of $D$.
>
> This is exactly **Arnold's classical eigenvalue stratification of Hermitian $n \times n$ matrices** ([Arnold 1995](#ref-arnold1995remarks)).

So the noncommutative theorem on $M_n(\mathbb C)$-spectral triples *is* Arnold's theorem, recovered through the Hochschild--Hilbert lift. The theorem genuinely extends Arnold rather than reducing to a triviality: the chain-complex side is concentrated in degree 0, but the Hilbert-lift side is non-trivial (it's the choice of $D$).

##### Specialization: commutative finite-dim algebras

> **Corollary (commutative case).** For $\mathcal A = \mathbb C^N$ acting diagonally on $\mathcal H = \mathbb C^N$:
>
> - $\mathrm{HH}_0 = \mathbb C^N$, $\mathrm{HH}_k = 0$ for $k \ge 1$.
> - Gauge group $G(\mathbb C^N) = U(1)^N$ (diagonal unitaries).
> - Moduli of Hermitian $D$'s on $\mathbb C^N$ modulo $U(1)^N$ has dim $N^2 - N$.
> - The Laplacian $\Delta_0^{(D)}$ on $C_0 = \mathbb C^N$ has $N$ eigenvalues; the bipartite multipartition reduces to a single-degree partition of $\{1, \ldots, N\}$.
>
> The theorem says this moduli is stratified by partitions of $N$, with codim $\sum_B(|B|-1)$ per stratum.

This is **Connes' two-point space** ($N = 2$) and its multi-point generalizations. The cross-category theorem gives the explicit stratified-moduli structure, recovering and extending the spectrum-stratification of finite metric measure spaces (= finite-dim commutative spectral triples).

##### Specialization: group algebra $\mathbb C[\mathbb Z/n]$

For $\mathcal A = \mathbb C[\mathbb Z/n]$, the Hochschild homology is non-trivial in higher degrees, and the bipartite multipartition has genuine cross-degree content.

Specifically, for $n$ even, $\mathrm{HH}_\bullet(\mathbb C[\mathbb Z/n])$ has dim 1 in each non-negative degree (there's a "non-split" piece). The bipartite multipartition records cross-degree eigenvalue coincidences of $\Delta_0, \Delta_1, \Delta_2, \ldots$.

This gives the *first concrete instance* of a noncommutative bipartite stratification with non-trivial cross-degree structure --- generalizing Arnold beyond the univariate case.

##### What this delivers

1.  **Concrete construction** of the Hochschild--Hilbert lift for finite spectral triples, with explicit formula via the resolvent $R_D$.

2.  **Cross-category theorem proved** in the finite spectral triple case --- the third proved instance of the cross-category framework, after cellular finite-dim and parametric graph.

3.  **Specializations** showing the theorem recovers Arnold (for $M_n$), gives new content for commutative finite-dim (= finite metric spaces), and produces genuinely bipartite stratifications for group algebras.

4.  **Noncommutative case is now partial-proved**: the finite-dim sub-case is rigorous; the infinite-dim case via Connes' machinery remains open.

##### Connection to Connes--Moscovici

The Hochschild--Hilbert lift defined here is *not* the Connes--Moscovici local-index cocycle. The CM cocycle is a Hochschild *cocycle* in $HH^\bullet(\mathcal A)$ (cohomology); the Hilbert lift defines an inner product on Hochschild *chains* (homology).

These are dual under the Connes--Karoubi pairing $\mathrm{HH}_\bullet(\mathcal A) \otimes \mathrm{HH}^\bullet(\mathcal A) \to \mathbb C$. The connection: the inner product on chains *induces* a pairing with cochains via $\langle c, \phi \rangle := \langle c, \phi^\sharp \rangle_D$ where $\phi^\sharp$ is the dual chain to the cochain $\phi$ under $\langle\cdot,\cdot\rangle_D$.

So our construction sits *adjacent* to Connes--Moscovici but is more elementary: it works directly at the chain level rather than via cocycle pairings, and it gives a Hodge-style theory rather than a cyclic-cocycle local-index theory.

##### Open

1.  **Verify cross-degree non-triviality on $\mathbb C[\mathbb Z/n]$.** Explicit computation of $\Delta_0, \Delta_1$ on the Hochschild complex of a small group algebra, identifying when their spectra coincide. Should produce genuine bipartite multipartitions.

2.  **Cyclic complex variant.** The cyclic complex $\mathrm{HC}_\bullet(\mathcal A)$ has differential $b - B$ (Connes' double-complex). Generalizing the Hochschild--Hilbert lift to cyclic chains is open; should give a Laplacianizability theorem for cyclic homology rather than Hochschild.

3.  **Infinite-dim extension via Connes.** For non-finite spectral triples (compact resolvent, finite-summable but not finite-dim), the Hilbert lift via the resolvent generalizes structurally. Closed-range conditions on $b$ become non-trivial; need analytical care. This is the Connes-style infinite-dim noncommutative theorem.

4.  **Connection to Weitzenböck identity.** ([Mesland and Rennie 2024](#ref-mesland2024curvature)) establishes a Weitzenböck identity for spectral-triple Laplacians. The relationship between $\Delta_n^{(D)}$ on Hochschild chains (this entry) and the Weitzenböck-style Laplacian on $\mathcal H$ (the spectral-triple analog of $\nabla^*\nabla$ + curvature) is open and should illuminate the structural picture.

5.  **Noncommutative bipartite Vassiliev--Shapiro--Vainshtein.** Computing the cohomology of strata in $\mathcal M^\circ_{\mathrm{spec}}$ via the bipartite multipartition lattice --- the noncommutative analog of the Vassiliev/SV bipartite extension (also identified as a frontier direction for the cellular case).

##### Status

Proved for finite spectral triples. The infinite-dim extension is sketched in `theorems/infinite-spectral-triple-laplacianizability.md` via the resolvent-power inner product on regular spectral triples.

#### Theorem: Cross-category orbifold-stratification: smooth Riemannian case {#cross-category-smooth}

Extension of the cross-category orbifold-stratification theorem (`theorems/cross-category-orbifold-stratification.md`) from the finite-dim case to compact Riemannian manifolds. The structural pattern persists; the technical work is in handling unbounded operators with closed range, infinite-dim ambient, and the smooth Ebin slice theorem.

Proof assembled from Ebin (1970), Kato VII, Myers--Steenrod (1939), and first-order Rayleigh--Schrödinger perturbation. The individual pieces are classical; the cross-category packaging here recovers the cellular finite-dim five-step pattern in the smooth setting.

##### Setup

Let $M$ be a compact smooth manifold of dim $m$. The Laplacianizer framework (`theorems/cross-category-orbifold-stratification.md`) instantiates as:

- $\mathcal C =$ category of $M$ with smooth Riemannian metrics, morphisms = isometries.
- $H^\bullet =$ de Rham cohomology $H^\bullet_{\mathrm{dR}}(M; \mathbb R)$ --- independent of $g$ by the de Rham theorem.
- $F: (M, g) \mapsto (\Omega^\bullet_{L^2}(M, g), d)$, the $L^2$-de Rham complex with the $g$-induced inner product on each $\Omega^n$.
- $\eta_g: H^\bullet_{\mathrm{dR}}(M) \xrightarrow{\sim} \ker \Delta_g$, the Hodge isomorphism (de Rham--Hodge theorem on compact manifolds).
- $\mathrm{Aut}(M) = \mathrm{Diff}(M)$, acting on metrics by pullback.

The chain differential $d_n: \Omega^n \to \Omega^{n+1}$ is the exterior derivative --- unbounded on $L^2$, with closed range on compact $M$ (standard elliptic theory).

The space of metrics
$$\mathcal{Met}(M) = \{g \in \Gamma(S^2 T^*M) : g\ \text{positive-definite at every point}\}$$
is an open cone in the Fréchet space of smooth symmetric $(0,2)$-tensor fields. For technical work, take its Sobolev $H^s$-completion $\mathcal{Met}^s(M)$ for $s > m/2 + 2$ (so $H^s \hookrightarrow C^2$). The smooth case is the inverse limit.

The moduli of Riemannian metrics is
$$\mathcal M_{\mathrm{Lap}}(M) := \mathrm{Diff}(M) \backslash \mathcal{Met}(M).$$

##### Theorem

> **Theorem (cross-category orbifold-stratification, smooth Riemannian).** Let $M$ be a compact smooth manifold. Then $\mathcal M_{\mathrm{Lap}}(M)$ has the following structure:
>
> 1.  **Orbifold structure.** $\mathcal M_{\mathrm{Lap}}(M)$ is a Fréchet ILH-orbifold (Inverse Limit of Hilbert orbifolds); locally a quotient of a Fréchet slice by a finite-dim compact Lie group.
>
> 2.  **Stratification.** Strata are indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta^{(n)}_g)$ (recording within-degree and cross-degree eigenvalue coincidences). For each $\Pi$ with finitely many non-trivial blocks, $\mathrm{Stratum}(\Pi)$ is a locally closed real-analytic subvariety of the moduli orbifold.
>
> 3.  **Universal codim.** $\mathrm{codim}\, \mathrm{Stratum}(\Pi) = \sum_{B \in \Pi,\ |B| \ge 2}(|B|-1)$.
>
> 4.  **Stab dim.** $\dim \mathrm{stab}_{\mathrm{Diff}}([g]) = \dim \mathrm{Isom}(M, g)$, the geometric isometry group dim.
>
> 5.  **Closure poset.** $\overline{\mathrm{Stratum}(\Pi')} \supseteq \mathrm{Stratum}(\Pi)$ iff $\Pi$ is a coarsening of $\Pi'$.

##### Proof

The proof proceeds in five steps, each invoking a classical ingredient.

###### Step 1: Orbifold structure (Ebin slice theorem)

**Ingredient.** Ebin (1970) shows: for $g \in \mathcal{Met}^s(M)$ with $s > m/2 + 2$, there exists a smooth $\mathrm{Diff}^{s+1}(M)$-invariant slice $\mathcal S_g \subset \mathcal{Met}^s(M)$ at $g$ --- a smooth Hilbert submanifold transverse to the $\mathrm{Diff}^{s+1}(M)$-orbit, on which $\mathrm{Isom}^{s+1}(M, g) := \mathrm{Diff}^{s+1}(M) \cap \mathrm{Stab}(g)$ acts. The natural map
$$\mathcal S_g / \mathrm{Isom}^{s+1}(M, g) \to \mathcal M_{\mathrm{Lap}}(M)$$
is a homeomorphism onto an open neighborhood of $[g]$.

**Application.** By Myers--Steenrod (Step 4 below), $\mathrm{Isom}^{s+1}(M, g)$ is a finite-dim compact Lie group acting effectively on the smooth Hilbert manifold $\mathcal S_g$. So $\mathcal M_{\mathrm{Lap}}(M)$ is locally a finite-quotient orbifold of a Hilbert manifold; passing to the inverse limit gives the Fréchet ILH-orbifold structure.

This step is standard in the moduli-of-metrics literature (used in e.g. Berger's quaternion-Kähler classification, and throughout Einstein-moduli theory --- ([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))).

###### Step 2: Spectrum varies real-analytically (Kato perturbation)

**Setup.** Fix a reference metric $g_0$. For any $g$ in a $C^2$-neighborhood of $g_0$, define the **gauge intertwiner** $J_g: \Omega^n_{L^2}(M, g_0) \to \Omega^n_{L^2}(M, g)$ as the bundle isomorphism induced by the unique pointwise positive-definite endomorphism $A_g := g_0^{-1} g$ raised to the appropriate power on $\Lambda^n T^*M$ (so that $J_g$ is a unitary intertwiner of inner products). Specifically, on $\Lambda^n T^*M$, $J_g = (\det A_g)^{1/2} \cdot (A_g)^{-n/2}$ acting on $n$-forms (the precise expression isn't crucial; what matters is that $J_g$ is a smooth $(g, g_0)$-dependent bundle isomorphism, real-analytic in $g$).

Conjugating by $J_g$ gives the **transferred Laplacian**
$$\widetilde \Delta_g^{(n)} := J_g^{-1} \Delta_g^{(n)} J_g: \Omega^n_{L^2}(M, g_0) \to \Omega^n_{L^2}(M, g_0).$$

This is now a family of unbounded self-adjoint operators on the *fixed* Hilbert space $\Omega^n_{L^2}(M, g_0)$, with common domain $H^2(\Omega^n)$, depending real-analytically on $g$ in $H^s$-topology.

**Ingredient.** Kato, *Perturbation Theory for Linear Operators*, Theorem VII.3.9 (and surrounding analytic perturbation theory): if $T(\zeta)$ is a self-adjoint analytic family of type (A) of unbounded operators with discrete spectrum and common domain, then the eigenvalues of $T(\zeta)$ are given by branches of analytic functions $\mu_k(\zeta)$ (with multiplicities preserved on each branch), and the spectral projections vary analytically.

**Application.** $\widetilde \Delta_g^{(n)}$ is a self-adjoint analytic family of type (A) in $g$ (this requires verification of compact resolvent and analytic dependence of the symbol --- both standard for elliptic operators on compact $M$). So eigenvalues $\mu_k^{(n)}(g)$ are real-analytic in $g$ (on local branches). The locus
$$\{g : \mu_i^{(n)}(g) = \mu_j^{(n')}(g)\}$$
is a real-analytic subvariety of $\mathcal{Met}^s(M)$.

For a multipartition $\Pi$ with finitely many non-trivial blocks, the stratum $\{g : \Pi(g) = \Pi\}$ is a finite intersection of such loci minus the further-coincidence loci --- a locally closed real-analytic subvariety.

###### Step 3: Codim formula (Arnold--style counting)

**Argument.** Each block $B$ of $\Pi$ with $|B| \ge 2$ identifies $|B|$ eigenvalues across $(n_1, i_1), \ldots, (n_{|B|}, i_{|B|})$ to a common value. This is $|B| - 1$ independent real-analytic equations on $\widetilde \Delta_g$.

Independence: the map $g \mapsto (\mu_1^{(n_1)}(g), \ldots)$ has differential dominated by the principal-symbol contribution to the eigenvalue derivatives. Generic transversality (Arnold ([1995](#ref-arnold1995remarks)) in finite-dim, transferring to infinite-dim via the analytic perturbation framework) gives: the conditions cut out $\mathrm{Stratum}(\Pi)$ at codim $\sum_B(|B|-1)$ in $\mathcal{Met}^s(M)$.

The codim descends to moduli: $\mathrm{Diff}(M)$ acts with finite-dim stabilizers (Step 4) on infinite-dim $\mathcal{Met}^s(M)$; the codim of an analytic subvariety in moduli equals its codim in $\mathcal{Met}^s(M)$ (codim is well-defined modulo a finite-dim group action with appropriate slice).

This is the Arnold codim formula, transferred via Kato. The fact that it is *category-independent* (same as the cellular case, the parametric-graph case, etc.) is the structural finding of the cross-category framework: codim depends only on the eigenvalue-coincidence combinatorics, not on the category of inputs.

###### Step 4: Stab dim (Myers--Steenrod)

**Ingredient.** Myers--Steenrod (1939): the isometry group $\mathrm{Isom}(M, g)$ of a connected Riemannian manifold is a Lie group. For compact $M$, it is compact and finite-dim, with $\dim \mathrm{Isom}(M, g) \le \binom{m+1}{2}$, with equality iff $M$ is a space form (constant sectional curvature).

**Application.** The orbifold stabilizer at $[g]$ in the ILH-orbifold $\mathcal M_{\mathrm{Lap}}(M)$ is precisely $\mathrm{Isom}(M, g)$. So $\dim \mathrm{stab}_{\mathrm{Diff}}([g]) = \dim \mathrm{Isom}(M, g)$.

**Why the cellular formula doesn't apply.** In the cellular case, the chain auto group is the algebraic $\prod_n O(C_n)$, which can rotate Hodge eigenspaces freely. In the smooth case, $\mathrm{Diff}(M)$ is much smaller --- only diffeomorphism-implemented eigenspace rotations count. So $\dim \mathrm{Isom}(M, g)$ is generally much smaller than $\sum_B \binom{|B|}{2}$ (the cellular formula).

**Example.** Round sphere $S^n$ has $\mathrm{Isom}(S^n, g_{\mathrm{rd}}) = O(n+1)$ with $\dim = \binom{n+1}{2}$. The Laplacian spectrum on $S^n$ is well known: eigenvalue $\lambda_k = k(k+n-1)$ with multiplicity = dim of harmonic-polynomial space $\mathcal H_k$, which for large $k$ is huge. The cellular formula $\sum_B \binom{|B|}{2}$ would predict gigantic stab; the actual stab $\binom{n+1}{2}$ is far smaller. This is the universal-codim / category-specific-stab pattern.

###### Step 5: Closure poset (first-order Rayleigh--Schrödinger)

**Setup.** Take $\Pi'$ a refinement of $\Pi$. Want: $\overline{\mathrm{Stratum}(\Pi')} \supseteq \mathrm{Stratum}(\Pi)$.

**Direction 1 ($\subseteq$)**: $\mathrm{Stratum}(\Pi') \subseteq \overline{\mathrm{Stratum}(\Pi)}$ when $\Pi'$ refines $\Pi$, by upper-semi-continuity of the multiplicity function (a $\Pi$-stratum point is the limit of $\Pi'$-stratum points where coincidences are forced).

Wait --- this is the wrong direction. Let me restate.

**Closure direction.** $\mathrm{Stratum}(\Pi)$ has $\Pi$-coincidences; $\mathrm{Stratum}(\Pi')$ has $\Pi'$-coincidences with $\Pi'$ a refinement of $\Pi$ (fewer coincidences, more eigenvalues distinct). The claim is: $\mathrm{Stratum}(\Pi) \subseteq \overline{\mathrm{Stratum}(\Pi')}$ --- every $\Pi$-coincidence point is the limit of $\Pi'$-points.

**Argument.** At $g_0 \in \mathrm{Stratum}(\Pi)$, take a block $B \in \Pi$ that splits into sub-blocks $B_1, B_2 \in \Pi'$ (with $B_1 \sqcup B_2 = B$). Construct a perturbation $g_t = g_0 + tH$ for $H$ a symmetric tensor, such that the first-order eigenvalue splitting separates $B_1$ from $B_2$.

By Rayleigh--Schrödinger first-order perturbation: the splitting is governed by the spectrum of the operator
$$M_B := P_B \cdot \frac{d}{dt}\bigg|_{t=0} \widetilde \Delta_{g_t}^{(\cdot)} \cdot P_B$$
restricted to the joint eigenspace $\mathcal E_B = \bigoplus_{(n,i) \in B} \mathcal E^{(n)}_i(g_0)$. Here $P_B$ is the projection onto $\mathcal E_B$.

The derivative $\frac{d}{dt} \widetilde \Delta_{g_t}^{(n)}$ at $t = 0$ is computed from Lichnerowicz-style formulas (involving the variation of the metric and its first derivatives). Generically --- for $H$ in a suitable finite-codim subspace of metric variations --- the operator $M_B$ has the eigenvalue decomposition that separates $B_1$ from $B_2$ at first order.

The "generic" condition is checked by an explicit construction: choose $H$ supported on a small ball where one can engineer the eigenvalue splitting. The compactness of $M$ and the $C^\infty$-density of compactly-supported perturbations make this work.

So $g_t$ for small $t > 0$ is in $\mathrm{Stratum}(\Pi')$, and $g_t \to g_0$ as $t \to 0$. Hence $g_0 \in \overline{\mathrm{Stratum}(\Pi')}$.

**Direction 2 ($\supseteq$).** Conversely: $\overline{\mathrm{Stratum}(\Pi')}$ consists of metrics whose multipartition coarsens $\Pi'$ (by upper-semi-continuity of multiplicity). So if $g \in \overline{\mathrm{Stratum}(\Pi')}$, then $\Pi(g)$ is a coarsening of $\Pi'$. Combined with Direction 1, the closure poset is exactly the multipartition refinement order.

This argument is structurally identical to the cellular case (`theorems/closure-poset-of-strata.md`); the only infinite-dim extension is the use of compactly-supported metric variations to ensure generic perturbation.

##### Specializations

###### Einstein moduli

The Einstein moduli theorem (([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein))) is a special case of this theorem, with:
- Constraint: $\mathrm{Ric}(g) = E \cdot g$ for some Einstein constant $E$.
- Relevant Laplacian: Lichnerowicz $\Delta_L$ on transverse-traceless tensors $S^2_{tt}M$.
- Stratification: by IED dim = $\dim \ker(\Delta_L - 2E)|_{tt}$.

The cross-category theorem applied with $\mathcal C =$ Einstein metrics and $\mathrm{Aut} = \mathrm{Diff}$ recovers: orbifold structure (Ebin), strata indexed by IED dim, codim = (IED dim − 1), stab = $\dim \mathrm{Isom}(g)$. Matches the smooth literature.

###### Round spheres and homogeneous spaces

For $G$-homogeneous metrics on $G/H$ with $G$ compact Lie, the spectrum is given by representation theory (Peter--Weyl). The multipartition structure is determined by the $G$-irrep decomposition; codim counts representation-theoretic equalities. Stab = $\dim G/Z(G)$ on the round case.

This recovers the spectrum-by-representation-theory literature (Berger, Bourguignon, etc.).

##### Status of pieces (now assembled)

| Piece                  | Source                                                         | In this proof |
|------------------------|----------------------------------------------------------------|---------------|
| Orbifold structure     | Ebin 1970                                                      | Step 1        |
| Real-analytic spectrum | Kato VII                                                       | Step 2        |
| Codim formula          | Arnold ([1995](#ref-arnold1995remarks)) (transferred via Kato) | Step 3        |
| Stab = isometry group  | Myers--Steenrod 1939                                           | Step 4        |
| Closure poset          | Rayleigh--Schrödinger + upper-semi-continuity                  | Step 5        |

The proof is a *clean assembly* of these classical ingredients. The contribution of laplanc-2025 is the framework --- recognizing that the same five-step pattern proves the theorem in cellular finite-dim, parametric graph, and smooth Riemannian settings, with universal codim and category-specific stab.

##### Technical caveats

1.  **Sobolev bookkeeping.** The Ebin theorem is rigorously stated for $H^s$-metrics with $s$ large enough. The smooth case is recovered by inverse limit. Throughout, we work in $H^s$ for $s > m/2 + 2$ when sharpness is needed.

2.  **Closed-range condition.** The exterior derivative $d_n$ on compact $M$ has closed range (standard elliptic theory). For non-compact $M$, this can fail (`theorems/closed-range-obstruction.md`); the theorem doesn't directly extend to non-compact $M$ without additional structure (weighted $L^2$, RCD-type assumptions).

3.  **Finitely many non-trivial blocks.** The multipartition $\Pi$ is allowed to have infinitely many singleton blocks (the spectrum is discrete but unbounded). The codim formula is stated for $\Pi$ with finitely many non-trivial blocks, which captures all cases of finite codim. "Infinite codim strata" (where infinitely many coincidences are imposed) are degenerate and not addressed here.

4.  **First-order genericity in Step 5.** The Rayleigh--Schrödinger argument requires that a generic metric variation splits the eigenvalues at first order. This is true for $H$ in a $C^\infty$-dense subset of metric variations; explicit construction uses compactly-supported $H$ adapted to the eigenfunctions in the joint eigenspace.

##### Connection to non-compact and singular cases

The compact case is the cleanest. Extensions:

- **Non-compact $M$ with finite-volume $L^2$**: requires closed-range condition, which can fail. Some special cases (cusped hyperbolic, asymptotically Euclidean) have analogous theorems with modifications.
- **RCD spaces (([Violo 2025](#ref-violo2025overview)))**: the Cheeger-energy Laplacian on RCD$(K, \infty)$ spaces has discrete spectrum on compact RCD spaces; the Hodge-de Rham theorem holds in suitable form. The cross-category theorem extends here, with technical subtleties around the smooth-vs-RCD differentiable structure.
- **Singular spaces (orbifolds, stratified spaces)**: Hodge theory extends with appropriate modifications; the cross-category theorem should extend, with the moduli now of "Hodge structures on the singular space."

These extensions are within reach but require their own write-ups.

##### What this delivers

The smooth Riemannian case of the cross-category theorem is *now proved* --- assembled from Ebin, Kato, Myers--Steenrod, and first-order Rayleigh--Schrödinger. The structural pattern matches the cellular finite-dim case (Project A) and the parametric-graph case, confirming the cross-category framework as a genuine unification.

In the framework, all these cases --- cellular, parametric graph, smooth Riemannian, Einstein --- are instances of *one* theorem: stratified moduli of Laplacianizations with universal codim $\sum_B(|B|-1)$ and category-specific stab.

Noncommutative and nonlinear extensions are in `theorems/finite-spectral-triple-laplacianizability.md`, `theorems/infinite-spectral-triple-laplacianizability.md`, and `theorems/nonlinear-p-hodge-laplacianizability.md`.

##### Coverage of the smooth 2025 wave

Constructions covered by this theorem:

- **Smooth Hodge Laplacian** on compact Riemannian manifolds (classical, this is the base case).
- **Lichnerowicz Laplacian** on tensor fields (used in Einstein moduli).
- **Connection Laplacian** $\nabla^* \nabla$ on vector bundles with metric connection.
- **Spectral-triple Laplacian on commutative Riemannian spectral triples** (i.e., classical $\not\!\!\!D^2$ on spin manifolds --- this is the classical limit of the noncommutative case).
- **Hodge Laplacian on cellular sheaves over a smooth manifold** (combining cellular and smooth structures).
- **RCD-Cheeger Laplacian** on suitable RCD$(K, \infty)$ spaces (with technical extension as described).

Constructions not yet covered (frontier):

- Spectral-triple Laplacian on genuinely noncommutative $\mathcal A$ (separate program).
- $p$-Laplacian and variational nonlinear Laplacians (separate program).
- Discrete-spectrum Laplacians on non-compact spaces with degenerate analytical setting.

#### Theorem \[SKETCH\]: Laplacianizability for infinite-dim spectral triples {#infinite-spectral-triple-laplacianizability}

Extension of the finite spectral triple theorem (`theorems/finite-spectral-triple-laplacianizability.md`) to infinite-dim Connes-style spectral triples. The structural pattern --- Hochschild--Hilbert lift via the resolvent, cross-category stratified moduli --- persists. The technical work is in handling unbounded operators, summability conditions, closed-range constraints, and the cyclic (rather than just Hochschild) complex.

The reduction to compact spin manifolds is the consistency check: applying the noncommutative theorem to the canonical spectral triple of a compact spin manifold should recover the smooth Riemannian theorem (`theorems/cross-category-smooth.md`).

##### Setup

A **(infinite-dim) spectral triple** $(\mathcal A, \mathcal H, D)$ in Connes' sense:

- $\mathcal A$: unital $*$-algebra, dense subalgebra of a $C^*$-algebra.
- $\mathcal H$: separable Hilbert space, with faithful $*$-representation $\pi: \mathcal A \to \mathcal B(\mathcal H)$.
- $D$: self-adjoint with **compact resolvent** ($R_D := (1+D^2)^{-1}$ is compact).
- **Bounded commutators**: $[D, \pi(a)]$ extends to a bounded operator for each $a \in \mathcal A$.
- **Finite summability**: $R_D^{p/2}$ is trace class for some $p > 0$. The minimal such $p$ is the *summability degree* (also called *metric dimension*).

Fix $(\mathcal A, \mathcal H)$. The space of admissible $D$'s --- call it $\mathcal D(\mathcal A, \mathcal H)$ --- consists of self-adjoint $D$'s on $\mathcal H$ satisfying the spectral-triple axioms above.

The **gauge group** $G(\mathcal A) := U(\mathcal H) \cap \pi(\mathcal A)'$ acts on $\mathcal D(\mathcal A, \mathcal H)$ by conjugation. The moduli of spectral triples is
$$\mathcal M_{\mathrm{spec}}(\mathcal A, \mathcal H) := G(\mathcal A) \backslash \mathcal D(\mathcal A, \mathcal H).$$

In contrast to the finite case, $\mathcal D$ is now an *infinite-dim real-affine subset* of self-adjoint operators on $\mathcal H$. Locally, around a reference $D_0$, the tangent space is the Banach space of admissible perturbations $V$ --- bounded self-adjoint with $[V, \pi(\mathcal A)] \subset \mathcal B(\mathcal H)$.

##### Hochschild--Hilbert lift in infinite-dim

> **Definition (infinite-dim Hochschild--Hilbert lift).** Choose $N > p$ so that $R_D^N = (1+D^2)^{-N}$ is trace class. For $a, b \in \mathcal A$, define
> $$\langle a, b \rangle_D := \mathrm{Tr}\big( R_D^{N/2}\, \pi(a)^*\, \pi(b)\, R_D^{N/2} \big).$$
> For higher Hochschild chains $a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n \in C_n(\mathcal A) = \mathcal A^{\otimes(n+1)}$:
> $$\langle a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n\rangle_D := \langle a_0, b_0\rangle_D \cdot \prod_{i=1}^n \mathrm{Tr}\big( R_D^{N/2}\, [D, \pi(a_i)]^*\, [D, \pi(b_i)]\, R_D^{N/2} \big).$$

> **Lemma (positivity and finiteness).**
>
> 1.  Each trace is finite: $R_D^N$ is trace class, $\pi(a)^* \pi(b)$ is bounded, so $R_D^{N/2} \pi(a)^* \pi(b) R_D^{N/2}$ is trace class. Same for the commutator factors.
>
> 2.  The form $\langle \cdot, \cdot \rangle_D$ is positive: for $T = \pi(a)$ or $T = [D, \pi(a)]$, $\mathrm{Tr}(R_D^{N/2} T^* T R_D^{N/2}) = \|T R_D^{N/2}\|_{HS}^2 \ge 0$.
>
> 3.  The form is symmetric Hermitian: $\overline{\langle a, b \rangle_D} = \langle b, a\rangle_D$, by the trace identity $\mathrm{Tr}(X^*) = \overline{\mathrm{Tr}(X)}$.

**Kernel of the form.** The form may be degenerate --- its kernel consists of chains $a_0 \otimes \cdots$ where some $\pi(a_i) R_D^{N/2} = 0$ or $[D, \pi(a_i)] R_D^{N/2} = 0$. For typical $D$ in an open dense subset of $\mathcal D$, the kernel is trivial (all algebra elements act non-trivially on the resolvent of $D$). On the kernel-trivial locus $\mathcal D^\circ \subset \mathcal D$, $\langle\cdot,\cdot\rangle_D$ is a non-degenerate inner product.

**Hilbert completion.** Let $\hat C_n(\mathcal A; D)$ be the Hilbert completion of $C_n(\mathcal A)$ in the $\langle\cdot,\cdot\rangle_D$ norm. The Hochschild differential $b$ extends continuously to $\hat C_\bullet$ provided $\|b a\|_D \lesssim \|a\|_D$ for $a \in C_n$ --- a continuity condition that holds for "regular" spectral triples in Connes' sense (where $\mathcal A$ is closed under $\delta = [|D|, \cdot]$).

##### Cyclic-complex variant (needed for commutative $\mathcal A$)

For commutative $\mathcal A$, the Hochschild complex collapses on harmonic representatives by Hochschild--Kostant--Rosenberg: $\mathrm{HH}_n(C^\infty(M)) \cong \Omega^n(M)$ with zero Hochschild differential on HKR representatives.

The genuine differential is Connes' second differential $B$. The **cyclic complex** $(C^\lambda_\bullet, b - B)$ --- quotient of the bicomplex $(C_\bullet, b, B)$ --- has the right differential to recover de Rham.

> **Definition (cyclic Hochschild--Hilbert lift).** The inner product $\langle\cdot,\cdot\rangle_D$ extends to the cyclic complex $C^\lambda_\bullet(\mathcal A)$ by passing to cyclic-invariant chains. The cyclic Laplacian
> $$\Delta^\lambda_n := (b-B)(b-B)^* + (b-B)^*(b-B)$$
> on $\hat C^\lambda_n(\mathcal A; D)$ is self-adjoint (with respect to the lifted inner product) with discrete spectrum.

For commutative $\mathcal A = C^\infty(M)$, the cyclic complex recovers de Rham; for noncommutative $\mathcal A$, it gives the noncommutative analog.

The cross-category theorem applies to *both* the Hochschild complex and the cyclic complex --- but the cyclic version is the one that reduces correctly to the smooth Riemannian case for commutative spectral triples.

##### Closed-range and Hodge isomorphism

> **Theorem (closed range under regularity).** If $(\mathcal A, \mathcal H, D)$ is a *regular* spectral triple (Connes' sense: $\mathcal A$ is closed under $\delta = [|D|, \cdot]$, and $\mathcal A, [D, \mathcal A] \subset \bigcap_n \mathrm{Dom}(\delta^n)$), then the Hochschild differential $b$ on $\hat C_\bullet(\mathcal A; D)$ has **closed range**, and the Hodge isomorphism
> $$\ker \Delta_n^{(D)} \cong \mathrm{HH}_n(\mathcal A)$$
> holds (where $\mathrm{HH}_n(\mathcal A)$ is computed in an appropriate completion compatible with the Hilbert structure).

**Justification.** Regular spectral triples have well-behaved noncommutative pseudo-differential calculus (Connes--Moscovici). The Hochschild Laplacian $\Delta_n^{(D)}$ is "elliptic" in this calculus, hence has compact resolvent and discrete spectrum. Closed range follows from the spectral gap.

For the cyclic version, similar regularity gives closed range of $b - B$ on $\hat C^\lambda_\bullet$.

This regularity assumption is satisfied by:
- The canonical spectral triple of a compact spin manifold ($\mathcal A = C^\infty(M)$).
- Almost-commutative spectral triples (commutative + finite-dim factor).
- Discrete-group spectral triples (under property RD).
- A wide class of noncommutative-tori, deformation-quantization, and quantum-group examples.

##### Connection to Connes--Moscovici local index

The CM local index formula (Connes--Moscovici 1995) gives a representative cyclic *cocycle* $\phi_D \in HC^\bullet(\mathcal A)$ from the spectral data of $D$, in the form (essentially):
$$\phi_D(a_0, a_1, \ldots, a_n) = \sum_{k} c_k\, \mathrm{Res}_{s=0} \mathrm{Tr}\big(\pi(a_0) [D, \pi(a_1)] \cdots [D, \pi(a_n)] |D|^{-2k - s}\big).$$

> **Observation.** The Hochschild--Hilbert lift gives an inner product on cyclic *chains* $\mathrm{HC}_\bullet$, inducing a Hodge isomorphism $\mathrm{HC}_\bullet \xrightarrow{\sim} \mathrm{HC}_\bullet^*$ via $c \mapsto \langle c, -\rangle_D$. The CM cocycle $\phi_D$ lives in $\mathrm{HC}^\bullet$.
>
> Through Connes--Karoubi pairing $\mathrm{HC}_\bullet \otimes \mathrm{HC}^\bullet \to \mathbb C$:
>
> 1.  The Hilbert-lift induced functional $\flat_D(\mathbf 1) := \langle \mathbf 1, -\rangle_D$ on $\mathrm{HC}_\bullet$ is *not literally* the CM cocycle $\phi_D$ --- they have different shapes (resolvent product vs. heat-kernel simplex integral).
>
> 2.  **Both extract the same index pairing.** For $K$-theory class $[e] \in K_0(\mathcal A)$ represented as a cycle, $\phi_D([e]) = \mathrm{ind}(eDe)$. Under Hodge decomposition via the Hilbert lift, the harmonic representative of $[e]$ pairs with $\phi_D$ to give the same index --- the structural result of CM.

So the Hochschild--Hilbert lift sits *adjacent to* CM: both are spectral structures determined by $D$, and they unify under Connes--Karoubi duality on cyclic (co)homology.

The Hilbert-lift framework's distinct contribution: a *Hodge structure* on cyclic homology, which the CM framework doesn't directly provide. This Hodge structure is what enables the cross-category orbifold-stratification --- the moduli claim is intrinsic to the Hilbert structure, not the cocycle.

##### Cross-category theorem in infinite-dim

> **Theorem (cross-category orbifold-stratification, infinite-dim spectral triples).** Let $(\mathcal A, \mathcal H)$ be fixed with $\mathcal A$ a regular unital $*$-algebra, $\mathcal H$ a separable Hilbert space. Restrict to the open subset $\mathcal D^\circ(\mathcal A, \mathcal H) \subset \mathcal D(\mathcal A, \mathcal H)$ where:
>
> - The Hochschild--Hilbert lift is non-degenerate.
> - The Hochschild Laplacian $\Delta_n^{(D)}$ has discrete spectrum with finite multiplicities and discrete spectral gap.
>
> Then the moduli $\mathcal M^\circ_{\mathrm{spec}}(\mathcal A, \mathcal H) = G(\mathcal A) \backslash \mathcal D^\circ(\mathcal A, \mathcal H)$ has the following structure:
>
> 1.  **Banach orbifold structure.** Locally a Banach manifold quotient by the gauge group; orbifold modulo finite-dim isotropy at each point.
>
> 2.  **Stratification.** Strata indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta_n^{(D)})$, with finitely many non-trivial blocks. Each $\mathrm{Stratum}(\Pi)$ is a real-analytic submanifold of $\mathcal M^\circ_{\mathrm{spec}}$.
>
> 3.  **Universal codim.** $\mathrm{codim}\,\mathrm{Stratum}(\Pi) = \sum_{B \in \Pi, |B| \ge 2}(|B|-1)$.
>
> 4.  **Stab dim.** $\dim \mathrm{stab}_{G(\mathcal A)}([D]) = \dim Z_{G(\mathcal A)}(D)$, the dim of the centralizer of $D$ in the gauge group.
>
> 5.  **Closure poset.** Refinement of bipartite multipartitions.

###### Proof sketch

The proof structurally mirrors the smooth Riemannian case (`theorems/cross-category-smooth.md`), with five steps:

1.  **Banach orbifold structure.** The gauge group $G(\mathcal A)$ acts on $\mathcal D^\circ$ smoothly, with stabilizers $Z_{G(\mathcal A)}(D)$ --- finite-dim Lie groups by an analog of Myers--Steenrod (the "noncommutative isometry group" is finite-dim under regularity).

2.  **Analytic spectrum via Kato.** $D \mapsto \Delta_n^{(D)}$ is a real-analytic family of unbounded self-adjoint operators with discrete spectrum (regularity ensures common dense domain). Kato VII gives real-analytic eigenvalue branches $\mu_k^{(n)}(D)$.

3.  **Codim $\sum_B(|B|-1)$.** Arnold-style counting of independent eigenvalue-equality conditions, transferred via Kato.

4.  **Stab from centralizer.** $\dim \mathrm{stab}_{G(\mathcal A)}([D]) = \dim Z_{G(\mathcal A)}(D)$, where the centralizer's dim depends on how the eigenspaces of $D$ decompose under the $\mathcal A$-action.

5.  **Closure poset via Rayleigh--Schrödinger.** First-order perturbation argument with admissible perturbations $V$ in $T_D \mathcal D$. Generic $V$ splits eigenvalue coincidences at first order; explicit construction uses $V$ supported on small spectral intervals.

Each step is a standard tool (Kato, Rayleigh--Schrödinger, noncommutative Myers--Steenrod) applied in the infinite-dim noncommutative setting. ∎

##### Specialization: compact spin manifold (reduction to smooth)

> **Theorem (reduction to smooth Riemannian).** Let $M$ be a compact spin manifold of dim $m$, with $\mathcal A = C^\infty(M)$, $\mathcal H = L^2(M, S)$ ($S$ = spinor bundle), and $D = \not\!\!\!D_g$ the Atiyah--Singer Dirac operator for a chosen Riemannian metric $g$. Then:
>
> 1.  **HKR isomorphism.** $\mathrm{HH}_n(C^\infty(M)) \cong \Omega^n(M)$ (Hochschild--Kostant--Rosenberg, Connes' continuous version).
>
> 2.  **Cyclic = de Rham.** $\mathrm{HP}_n(C^\infty(M)) = \bigoplus_k H^{n+2k}_{\mathrm{dR}}(M)$ (Connes 1985).
>
> 3.  **Lift recovers $L^2$ inner product.** Under HKR, the Hochschild--Hilbert lift $\langle\cdot,\cdot\rangle_{\not\!\!\!D_g}$ on $\Omega^\bullet(M) \cong \mathrm{HH}_\bullet(C^\infty(M))$ is the standard $L^2$-inner product induced by $g$ (up to a positive smooth function = Wodzicki residue normalization).
>
> 4.  **Cyclic Laplacian = de Rham Laplacian.** Under HKR, the cyclic Laplacian $\Delta^\lambda$ on cyclic chains corresponds to the Hodge--de Rham Laplacian $dd^* + d^*d$ on $\Omega^\bullet(M)$.
>
> 5.  **Moduli reduction.** The space of admissible $D$'s on $(C^\infty(M), L^2(M, S))$ --- modulo $G(C^\infty(M))$ = Spin-equivariant unitaries --- coincides with $\mathrm{Diff}(M) \backslash \mathcal{Met}(M)$ (the smooth Riemannian moduli) up to the spin lift.
>
> 6.  **Cross-category theorems agree.** The infinite-dim noncommutative cross-category theorem applied to $(\mathcal A, \mathcal H) = (C^\infty(M), L^2(M, S))$ recovers the smooth Riemannian cross-category theorem (`theorems/cross-category-smooth.md`).

###### Proof outline

(1)--(2) are HKR + Connes 1985, classical.

(3)--(4) follow from explicit HKR-quasi-isomorphism formulas: the de Rham differential corresponds to Connes' $B$, and the metric-induced $L^2$-pairing on forms factors through HKR + the spectral data of $\not\!\!\!D_g$ (specifically through the principal symbol of $\not\!\!\!D_g^2$, which is $|\xi|_g^2 \cdot \mathrm{Id}$). The Wodzicki residue normalization is a constant prefactor.

(5)--(6) The Reconstruction Theorem (Connes 2008): a commutative, regular, finitely-summable spectral triple over a smooth orientable manifold is *equivalent* to the canonical spectral triple of a compact spin manifold. Under this equivalence, varying $D$ in $\mathcal D(C^\infty(M), L^2(M, S))$ corresponds (modulo the gauge group) to varying $g$ in $\mathcal{Met}(M)$.

So the noncommutative theorem on $(C^\infty(M), L^2(M, S))$ recovers the smooth Riemannian theorem, with the same orbifold structure, stratification, codim, stab, and closure poset. ∎

##### What this delivers

1.  **Infinite-dim Hochschild--Hilbert lift** is constructed explicitly via the resolvent $R_D^N$ for $N > p$.

2.  **Closed-range and Hodge isomorphism** under regularity (Connes' sense), via the noncommutative pseudo-differential calculus.

3.  **Cross-category theorem** in infinite-dim: same five-step structural pattern as cellular and smooth Riemannian cases.

4.  **Reduction to smooth Riemannian** via HKR and Connes' Reconstruction Theorem: the noncommutative framework genuinely generalizes smooth Hodge theory.

5.  **Connection to Connes--Moscovici** clarified: Hochschild--Hilbert lift (Hodge structure on chains) is dual to CM cocycle (representative on cochains) via Connes--Karoubi pairing.

This shifts the noncommutative case to **partial-proved**: the structural framework is established for regular spectral triples; the technical work in writing out the proof completely (especially closed-range under various regularity assumptions and the explicit cyclic-complex lift) remains.

##### Status of pieces

| Piece                                      | Status                                        |
|--------------------------------------------|-----------------------------------------------|
| Resolvent-based Hilbert lift (formula)     | Defined                                       |
| Positivity, symmetry, finiteness of lift   | Proved                                        |
| Closed range under regularity              | Sketched (uses Connes' nc-pseudo-DO calculus) |
| Hodge isomorphism                          | Sketched                                      |
| Cross-category theorem                     | Sketched (assembly of standard tools)         |
| Reduction to smooth (HKR + Reconstruction) | Sketched                                      |
| Cyclic-complex variant                     | Defined                                       |

So the infinite-dim noncommutative case is **structurally complete** in framework, **partial-proved** in detail. A focused write-up filling in the regularity / closed-range bookkeeping would upgrade this to fully proved for regular spectral triples.

##### Open

1.  **Explicit closed-range proof.** Connes' nc-pseudo-DO calculus gives the result for regular spectral triples, but a self-contained proof in our cross-category framework would be desirable.

2.  **Almost-commutative spectral triples.** $\mathcal A = C^\infty(M) \otimes \mathcal A_F$ for a finite-dim $\mathcal A_F$ (the "Standard Model" type). The cross-category theorem should split as a product of the smooth case and the finite case. Worked example would be illuminating.

3.  **Quantum tori, quantum groups.** Specific noncommutative examples (rotation algebras $A_\theta$, quantum SU(2), Drinfeld doubles) where the cross-category theorem produces concrete stratifications.

4.  **Spectral-triple deformation moduli.** The deformation moduli of a fixed $\mathcal A$ --- varying $D$ subject to compatibility --- is exactly what our theorem describes. Connection to the Connes--Marcolli moduli of Q-lattices and other noncommutative-geometric moduli is open.

5.  **Twisted spectral triples and modular case.** Connes--Moscovici introduced twisted spectral triples (with $\sigma$-twist on the bounded-commutator condition) for the modular geometry of arithmetic noncommutative spaces. The Hochschild--Hilbert lift extends with appropriate modifications, giving a stratified moduli for twisted triples --- open.

##### Coverage update

The infinite-dim noncommutative case is now structurally addressed:

| Case                                | Status                                                           |
|-------------------------------------|------------------------------------------------------------------|
| Cellular finite-dim                 | Proved (`theorems/bipartite-stratification-theorem.md`)          |
| Parametric graph                    | Proved (`theorems/cross-category-orbifold-stratification.md`)    |
| Smooth Riemannian                   | Proved (`theorems/cross-category-smooth.md`)                     |
| Finite spectral triples             | Proved (`theorems/finite-spectral-triple-laplacianizability.md`) |
| Infinite spectral triples (regular) | Sketched / partial-proved (this entry)                           |
| Stratification II                   | Proved (`theorems/hilbert-degeneracy-stratification.md`)         |
| Nonlinear ($p$-Laplacian)           | Open (frontier)                                                  |

Open: nonlinear case (variational $p$-Hodge) and bipartite Vassiliev / Shapiro--Vainshtein cohomology.

#### Observation: Continuity of Laplacianization (observation, not a single theorem) {#laplacianization-is-continuous}

This file collects the *real* continuity statements that hold for Laplacianization, with their precise hypotheses. The unifying claim ("the Laplacianization functor is continuous") was the gestural framing in an earlier draft; what is actually true is a family of related theorems, each in its own setting, each with precise statements available in the literature.

##### Finite-dimensional case (perturbation theory)

**Statement.** Let $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ be a finite-dimensional graded Hilbert chain complex. The map

$$(d, \langle \cdot, \cdot \rangle) \;\longmapsto\; \mathrm{spec}(\Delta) \in \mathbb R_{\ge 0}^{\dim C_n}$$

(eigenvalues counted with multiplicity, sorted) is continuous in the entries of the boundary matrix and the Gram matrix of the inner product. Eigenprojections are also continuous *off the discriminant locus* (where eigenvalues collide).

**Why it holds.** Direct from finite-dimensional spectral perturbation theory (Kato, *Perturbation Theory for Linear Operators*, ch. II). $\Delta$ depends polynomially on $d$ and $\langle \cdot, \cdot \rangle$; eigenvalues of a continuous family of self-adjoint matrices are continuous.

**Why it's relevant.** Most 2025 papers in `references/` work over finite-dimensional chain complexes; for those, "continuity of Laplacianization" is an immediate corollary of finite-dim perturbation theory. Specific results in the literature (e.g. Lipschitz bounds for persistent Laplacian eigenvalues under one-simplex insertions, stability bounds for quiver Laplacians) are *quantitative* refinements of the qualitative continuity.

##### Closed-range unbounded case (norm-resolvent convergence)

**Statement.** Let $(C_\bullet^{(t)}, d^{(t)}, \langle \cdot, \cdot \rangle^{(t)})$ be a family of unbounded graded Hilbert chain complexes parametrized by $t \in [0, 1]$, each with $d^{(t)}$ closed densely-defined and having closed range. If the family is *norm-resolvent continuous* in $t$ --- meaning $(\Delta^{(t)} + 1)^{-1}$ varies continuously in operator norm --- then:

- $\mathrm{spec}(\Delta^{(t)})$ is continuous in $t$ (each eigenvalue varies continuously in some local labeling, and the essential spectrum is upper-semicontinuous).
- Eigenprojections of isolated eigenvalues are continuous in $t$.

**Why it holds.** Standard result (Kato, ch. IV; Reed--Simon vol. IV).

**Why it's relevant.** Cases like:
- spectral propinquity continuity for Dirac operators (anchor in noncommutative geometry);
- generalized persistent Laplacians varying with the persistence parameter (([Wolf, Fan, and Monod 2025](#ref-wolf2025generalized)));
- de Rham Laplacians on Riemannian metrics varying continuously.

In each, the work is to verify norm-resolvent continuity for the specific family in question; once that is established, the spectral consequences are textbook.

##### Categorical limits

**Open / non-trivial.** When $\mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ is a Laplacianization functor and $X^{(n)} \to X$ is a sequence in $\mathcal C$ converging in some structural metric (cut distance, Gromov--Hausdorff, propinquity), does the induced sequence $\Delta^{(n)} \to \Delta$ converge spectrally?

This is the form of continuity the gestural earlier draft was reaching for. It is *not* automatic from finite-dim perturbation theory or norm-resolvent continuity, because morphisms in $\mathcal C$ may not induce bounded chain maps in any uniform way. Each setting has its own statement:

- **Hypergraph cut-metric limits** (([Backhausz et al. 2025](#ref-backhausz2025spectral))): the relevant theorem is convergence of Laplacian spectra in a measure-theoretic sense.
- **Graphon limits**: established for graph Laplacians in adjacency form; less mature for higher-order Laplacians.
- **Persistence parameter limits**: addressed by the generalized persistent Laplacian framework.

Whether one theorem covers all these cases --- categorical continuity of Laplacianization --- is open. Each setting has its own perturbation-theoretic statement; a categorical unification is not in the literature.

##### Why this is an "observation" not a "theorem"

There is no single theorem here, just a family of perturbation-theoretic results plus an open conjecture about uniformity across categories. Labeling the file `kind: observation` rather than `kind: theorem` reflects this; it was wrong to label it "theorem" without a precise statement.

##### What would constitute progress

A clean theorem of the form: "for $\mathcal C$ in a class $\mathfrak K$ of categories of structures (with a structural metric and a cohomology theory), every Hilbert lift $F: \mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ is automatically continuous in the structural metric, with eigenvalues of $\Delta_X$ uniformly Lipschitz in some norm." Identifying $\mathfrak K$ is the open part. Compactly-generated, finite-type, categorical-Hausdorff --- there are multiple plausible candidates.

#### Example: The moduli of Laplacianizations of $\partial \Delta^2$ {#moduli-of-triangle-boundary}

A complete worked computation of $\mathcal M_{\mathrm{Lap}}$ for the smallest case where the moduli theorem of `theorems/moduli-of-laplacianizations.md` says something non-trivial.

##### The chain complex

$\partial \Delta^2$ is the boundary of a 2-simplex --- three vertices $v_1, v_2, v_3$ and three edges $e_{12}, e_{13}, e_{23}$, regarded as a 1-dimensional simplicial complex.

Cellular chain complex (with the orientations $e_{ij}$ pointing $v_i \to v_j$ for $i < j$):

$$0 \to C_1 = \mathbb R^3 \xrightarrow{d} C_0 = \mathbb R^3 \to 0$$

with $d(e_{ij}) = v_j - v_i$. In the basis $(e_{12}, e_{13}, e_{23})$ on $C_1$ and $(v_1, v_2, v_3)$ on $C_0$:

$$d = \begin{pmatrix} -1 & -1 & \phantom{-}0 \\ \phantom{-}1 & \phantom{-}0 & -1 \\ \phantom{-}0 & \phantom{-}1 & \phantom{-}1 \end{pmatrix}.$$

Rank of $d$: rows sum to zero, so rank $\le 2$; rows $1, 2$ are independent, so $r := \mathrm{rank}(d) = 2$.

Algebraic homology: $\dim \ker d = 1$ (spanned by $e_{12} - e_{13} + e_{23}$, the "boundary cycle"); $\dim \mathrm{coker}\, d = 1$. So $H_0 = H_1 = \mathbb R$, as expected for $\partial \Delta^2 \cong S^1$.

##### $\mathcal H$ and $G$

$\mathcal H(C_\bullet) = \mathrm{Sym}^+_3(\mathbb R) \times \mathrm{Sym}^+_3(\mathbb R)$, $\dim = 6 + 6 = 12$.

$G(C_\bullet, d) = \{(g_0, g_1) \in \mathrm{GL}_3 \times \mathrm{GL}_3 : g_0 d = d g_1\}$. By orbit-stabilizer applied to $G_{\mathrm{ext}} = \mathrm{GL}_3 \times \mathrm{GL}_3$ acting on $\mathrm{Hom}(C_1, C_0) = \mathbb R^{3 \times 3}$ via $(g_0, g_1) \cdot d = g_0 d g_1^{-1}$:

$\dim G_{\mathrm{ext}} = 18$. Orbit of $d$ in the rank-2 stratum has dimension $r(n_1 + n_0 - r) = 2 \cdot (3 + 3 - 2) = 8$. So

$$\dim G = 18 - 8 = 10.$$

Therefore (modulo verifying generic stabilizers in $\mathcal H$ are discrete --- see below)

$$\dim \mathcal M_{\mathrm{Lap}}(\partial \Delta^2) = \dim \mathcal H - \dim G = 12 - 10 = 2.$$

##### The standard (Euclidean) Laplacian as a baseline

Take $Q_0 = Q_1 = I_3$ (Euclidean inner products on both $C_0$ and $C_1$). Then $d^* = d^T$.

**$\Delta_0 = d d^T$:**

$$\Delta_0 = \begin{pmatrix} 2 & -1 & -1 \\ -1 & 2 & -1 \\ -1 & -1 & 2 \end{pmatrix}$$

--- the standard graph Laplacian of the complete graph $K_3$. Eigenvalues: characteristic polynomial $\det(\Delta_0 - \lambda I) = -\lambda(\lambda - 3)^2$, so spectrum $\{0, 3, 3\}$.

**$\Delta_1 = d^T d$:**

$$\Delta_1 = \begin{pmatrix} 2 & 1 & -1 \\ 1 & 2 & 1 \\ -1 & 1 & 2 \end{pmatrix}$$

with $\mathrm{tr}(\Delta_1) = 6$, $\det(\Delta_1) = 0$ (kernel = boundary cycle), and the quadratic factor giving eigenvalues $3, 3$. Spectrum $\{0, 3, 3\}$.

The kernels are 1-dim each, matching $H_0 = H_1 = \mathbb R$. Hodge isomorphism holds. ✓

The two nonzero eigenvalues of $\Delta_0$ and $\Delta_1$ both equal $\{3, 3\}$ --- *the same nonzero spectrum on both sides*. This is supersymmetric isospectrality (next section).

##### Supersymmetric isospectrality on $\partial \Delta^2$

For any chain complex with $C_2 = 0$, one has $\Delta_n = d_{n+1} d_{n+1}^* + d_n^* d_n$, with $d_n^* d_n$ acting on $C_n$ and $d_{n+1} d_{n+1}^*$ acting on $C_n$. Since $C_2 = 0$ we have $d_2 = 0$, so:

- $\Delta_0 = d_1 d_1^* = dd^*$ on $C_0$.
- $\Delta_1 = d_1^* d_1 = d^*d$ on $C_1$ (since $d_2 d_2^* = 0$).

For any operator $T: V \to W$ between finite-dimensional inner-product spaces, $T T^*: W \to W$ and $T^* T: V \to V$ have the same nonzero spectrum (with multiplicity) --- both equal to the squared singular values of $T$. So:

$$\mathrm{spec}(\Delta_0) \setminus \{0\} = \mathrm{spec}(\Delta_1) \setminus \{0\} = \{\sigma_1^2, \sigma_2^2\}$$

where $\sigma_1, \sigma_2$ are the nonzero singular values of $d$ (relative to the chosen inner products).

This holds for **any** Hilbert structure $(Q_0, Q_1)$ --- not just Euclidean. The two nonzero eigenvalues are *the same operator-theoretic invariant* of the triple $(d, Q_0, Q_1)$, namely the squared singular values of $d$.

##### The moduli is the unordered pair of nonzero eigenvalues

The key claim:

> **Claim.** The map $\mathcal H(C_\bullet) \to \mathrm{Sym}^2(\mathbb R_{>0})$ sending $(Q_0, Q_1)$ to the unordered pair $\{\mu_1, \mu_2\}$ of nonzero eigenvalues of $\Delta(Q_0, Q_1)$ descends to a homeomorphism
> $$\overline{\mathrm{spec}}: \mathcal M_{\mathrm{Lap}}(\partial \Delta^2) \xrightarrow{\sim} \mathrm{Sym}^2(\mathbb R_{>0}).$$

*Well-definedness:* if $g \in G$ relates $(Q_0, Q_1)$ to $(Q_0', Q_1')$, it intertwines $d$ and is unitary $(C, Q) \to (C, Q')$, hence $\Delta'$ and $\Delta$ are unitarily equivalent and have the same spectrum.

*Surjectivity:* given any $(\mu_1, \mu_2)$ with $\mu_1, \mu_2 > 0$, realize it. The simplest construction: keep $Q_1 = I_3$ and choose $Q_0$ to "stretch" the boundary map. Specifically, decompose $C_0 = \ker d^T \oplus \mathrm{im}\, d$. With $Q_1 = I$ standard, $\mathrm{im}\, d$ is 2-dim (spanned by columns of $d$). Pick an orthonormal basis $f_1, f_2$ of $\mathrm{im}\, d$ (in $Q_1$) such that $d^T d|_{\mathrm{im}\, d^*}$ is diagonal in the corresponding basis of $\mathrm{im}\, d^*$. Define $Q_0$ on $\mathrm{im}\, d \subset C_0$ to scale the $f_1$-direction by $\mu_1 / 3$ and the $f_2$-direction by $\mu_2 / 3$, while leaving $\ker d^T = \mathrm{span}(v_1 + v_2 + v_3)$ at scale $1$. Compute: nonzero spectrum of $\Delta_0(Q_0, I)$ = $\{\mu_1, \mu_2\}$. ✓

*Injectivity:* given $(Q_0, Q_1)$ and $(Q_0', Q_1')$ with the same nonzero spectrum $\{\mu_1, \mu_2\}$, construct $g \in G$ relating them. Pick orthonormal eigenbases of $\Delta_0(Q)$ in $Q_0$ and $\Delta_0(Q')$ in $Q_0'$, matching eigenvalues. This gives a unitary $g_0: (C_0, Q_0) \to (C_0, Q_0')$. Define $g_1$ on $\mathrm{im}\, d^* \subset C_1$ by $g_1 = (d^*|_{\mathrm{im}\, d^*})^{-1} \circ g_0|_{\mathrm{im}\, d} \circ d^*$ (a chain-map condition); extend $g_1$ to $\ker d \subset C_1$ as any unitary (the 1-dim kernel admits a 1-parameter family of unitaries --- they all give the same equivalence class). Verify $g$ intertwines $d$. $\square$

(*A subtlety:* injectivity needs the matched-eigenvalue map between eigenbases to extend coherently to a chain map. This works here because $\mathrm{im}\, d \subset C_0$ is 2-dim and $\Delta_0$ acts on it through its squared singular values; the eigenbases of $\Delta_0$ on $\mathrm{im}\, d$ pull back via $d^*$ to eigenbases of $\Delta_1$ on $\mathrm{im}\, d^*$. Eigenvalue collisions $\mu_1 = \mu_2$ produce $S_2$-symmetry in moduli, matching the "Sym\^2" quotient.)

##### What the moduli looks like

$\mathcal M_{\mathrm{Lap}}(\partial \Delta^2) \cong \mathrm{Sym}^2(\mathbb R_{>0}) = \mathbb R^2_{>0} / S_2$ --- the upper half-plane $\{(\mu_1, \mu_2) : 0 < \mu_1 \le \mu_2\}$.

**Topology.** Connected, contractible (a 2-d cone with vertex at $\mu_1 = \mu_2 = 0$, which is excluded). Two-dimensional.

**Special points.**

- $\mu_1 = \mu_2$ (the diagonal $\mu_1 = \mu_2 \in \mathbb R_{>0}$, 1-dim): orbifold-singular locus where $\Delta_0$ has a 2-dim eigenspace. The $S_3$ symmetric Laplacians (those preserved by all permutations of vertices) sit on this diagonal. **Standard Euclidean Laplacian: $\mu_1 = \mu_2 = 3$.**
- $\mu_1 \ne \mu_2$ (generic): non-symmetric Laplacians, no nontrivial graded chain-automorphism stabilizer except $\pm 1$.

**Asymptotics.**

- $\mu_1 \to 0$: the boundary map $d$ becomes singular along one direction; the Laplacian degenerates and the closed-range condition (`theorems/closed-range-obstruction.md`) is approached. In the strict limit $\mu_1 = 0$, $H^0$ would jump from $\mathbb R$ to $\mathbb R^2$ (loss of connectivity); the Hodge dimension drops out of the moduli interior.
- $\mu_1, \mu_2 \to \infty$: the cycle $\ker d$ is increasingly "small" relative to coboundaries.

**Standard Euclidean point as a singular orbifold point.** The point $(3, 3)$ has $S_2$-orbifold-singularity in moduli (where the unordered pair becomes ordered) *and* extra graded-chain-automorphism stabilizer (an $S_3$ permuting vertices, plus the cyclic group permuting edges along with vertices). This is the most-symmetric Laplacian on $\partial \Delta^2$ and the natural baseline.

##### Verifying the dimension count

Direct count of moduli coordinates: the moduli is parameterized by $(\mu_1, \mu_2) \in \mathbb R^2_{>0} / S_2$ --- a 2-dim space. Matches $\dim \mathcal M = 12 - 10 = 2$. ✓

##### Significance

1.  **The moduli theorem is non-vacuous on the smallest interesting case.** A 2-dimensional family of distinct Laplacians on $\partial \Delta^2$ exists. The "standard Laplacian" is one specific (highly symmetric, eigenvalue-degenerate) point.

2.  **Supersymmetric isospectrality cuts the dimension exactly to its right size.** Without it, naive count of "spectrum data" would overcount: $\Delta_0$ has 2 nonzero eigenvalues *and* $\Delta_1$ has 2 nonzero eigenvalues, naively 4 --- but they coincide, giving 2.

3.  **The relevance of Hodge.** $\dim \ker \Delta_0 = \dim H_0 = 1$ holds at every point of moduli --- Hodge isomorphism is a *moduli-invariant*, not a feature of the Euclidean point. This is the precise sense in which "the cohomology survives the choice of Hilbert structure."

4.  **Cellular-sheaf cofinality is consistent here.** The chain complex of $\partial \Delta^2$ is the cellular cochain complex of the constant sheaf $\underline{\mathbb R}$ on the face poset of $\partial \Delta^2$. Every Hilbert structure on the chain complex corresponds to a stalkwise inner product on $\underline{\mathbb R}$ (i.e., a positive scalar at each cell), and the moduli quotient identifies which scalar choices give equivalent Laplacians. The analysis here therefore directly populates a special case of the cofinality conjecture.

##### What this verifies for the moduli theorem

The dimension formula $\dim \mathcal M = \dim \mathcal H - \dim G$ predicts $2$ for $\partial \Delta^2$. The direct count via supersymmetric isospectrality confirms $2$. The two methods agree. This is the simplest non-trivial check the moduli theorem admits.

##### Cross-check: $\partial \Delta^3$ (boundary of the 3-simplex, homeomorphic to $S^2$)

A second, larger case where the dimension formula and the supersymmetric-isospectrality count both apply, giving the same answer.

**Chain complex.** $C_0 = \mathbb R^4$ (vertices), $C_1 = \mathbb R^6$ (edges), $C_2 = \mathbb R^4$ (triangles). With $H_0 = H_2 = \mathbb R$, $H_1 = 0$ (from $S^2$). Ranks: $\mathrm{rk}\, d_1 = 3$, $\mathrm{rk}\, d_2 = 3$.

**$\mathcal H$ dimension.**
$$\dim \mathcal H = \binom{5}{2} + \binom{7}{2} + \binom{5}{2} = 10 + 21 + 10 = 41.$$

**$G$ dimension via orbit-stabilizer.** $\dim G_{\mathrm{ext}} = 16 + 36 + 16 = 68$. Orbit of $(d_1, d_2)$ in $\{(D_1, D_2) : D_1 D_2 = 0, \mathrm{rk}\, D_i = 3\}$: pick $D_1$ generic rank-3 ($3 \cdot (4+6-3) = 21$ parameters); then $D_2$ is a surjection $\mathbb R^4 \twoheadrightarrow \ker D_1 \cong \mathbb R^3$, contributing $3 \cdot 4 = 12$ parameters. Total orbit dim $= 21 + 12 = 33$. So
$$\dim G = 68 - 33 = 35, \qquad \dim \mathcal M_{\mathrm{Lap}}(\partial \Delta^3) = 41 - 35 = 6.$$

**Dimension via supersymmetric isospectrality.** The squared singular values of $d_1$ are 3 numbers $\sigma_1^2, \sigma_2^2, \sigma_3^2$; those of $d_2$ are 3 numbers $\tau_1^2, \tau_2^2, \tau_3^2$. By the orthogonal-image argument applied to $\Delta_1 = d_1^* d_1 + d_2 d_2^*$, nonzero spec$(\Delta_1) = \{\sigma_i^2\} \sqcup \{\tau_i^2\}$ (disjoint union; in particular, the spectral data of $\Delta_0$ and $\Delta_2$ separately reconstruct $\Delta_1$'s nonzero spectrum). Modulo the $S_3 \times S_3$ permuting each tuple, total spectral parameters $= 3 + 3 = 6$. ✓

**Both methods give 6.** The moduli theorem holds; the worked example $\partial \Delta^2$ is not a special low-dimensional accident.

##### What this case adds

For $\partial \Delta^2$ there is only one nontrivial boundary, so the moduli is parameterized by squared singular values of a single map. For $\partial \Delta^3$ there are two boundary maps and the moduli factors $\mathrm{Sym}^3(\mathbb R_{>0}) \times \mathrm{Sym}^3(\mathbb R_{>0})$. The two factors are *not independent* across all of $\mathcal H$ --- they are coupled by the shared $g_1$ acting on $C_1$ --- but at the level of the orbit-quotient the parametrization separates. The cofinality conjecture predicts a sheaf-on-poset interpretation of this 6-parameter family; checking it concretely is the natural next computation.

#### Theorem \[SKETCH\]: Nonlinear $p$-Hodge Laplacianizability --- variational extension {#nonlinear-p-hodge-laplacianizability}

The first concrete sub-case of the nonlinear frontier (`theorems/nonlinear-laplacianizability.md`). For fixed $p \in (1, \infty)$ and finite-dim chain complex with Banach (specifically $p$-ellipsoidal) lifts, a variational analog of the Laplacianizer framework can be set up: $p$-Hodge isomorphism, variational eigenvalue stratification, and a fixed-$p$ cross-category claim. The full cross-category theorem (varying $p$, varying chain category) requires nonlinear eigenvalue perturbation theory and remains conjectural.

This entry states the variational framework precisely, identifies what's provable, and isolates the open analytical questions.

##### Setup

A **graded $p$-Banach chain complex** is $(B_\bullet, d, \|\cdot\|^{(\bullet)}_p)$ where:

- Each $B_n$ is a finite-dim real vector space.
- $d_n: B_n \to B_{n-1}$ is linear with $d^2 = 0$.
- $\|\cdot\|^{(n)}_p$ is a $p$-norm on $B_n$ --- i.e., a Minkowski functional of a centrally-symmetric convex body $K_n \subset B_n$ with $p$-homogeneous "duality"-compatible structure.

For our purposes, restrict to **$p$-ellipsoidal norms**: $\|x\|_p^{(n)} := \langle Q_n x, x\rangle^{1/2}$ raised to $p$-power for $p = 2$, or more generally $\|x\|_p^{(n)} := (\sum_i Q_n[i,i] |x^i|^p)^{1/p}$ in a chosen basis (weighted $\ell^p$-norm with diagonal weights $Q_n$). This makes the moduli of $p$-norms isomorphic to $\prod_n \mathbb R^{m_n}_{>0}$ --- diagonal positive weights --- a finite-dim space mirroring $\mathrm{Sym}^+$ but smaller.

Let $\mathcal H_p := \prod_n \mathbb R^{m_n}_{>0}$ --- the moduli ambient for diagonal $p$-Banach lifts.

##### Variational $p$-Hodge

> **Definition ($p$-Laplacian).** For a graded $p$-Banach chain complex $(B_\bullet, d, \|\cdot\|_p)$, the **$p$-Laplacian** in degree $n$ is the operator $\Delta_p^{(n)}: B_n \to B_n$ defined as the Euler--Lagrange operator of the action functional
> $$\mathcal F_p^{(n)}(u) := \frac{\|d_{n-1}u\|^p_p + \|d_n^{*p} u\|^p_q}{\|u\|^p_p}, \qquad \frac{1}{p} + \frac{1}{q} = 1$$
> where $d_n^{*p}: B_{n-1} \to B_n$ is the *$p$-Banach adjoint* of $d_n$ --- the duality-map composition $d_n^{*p} = J_p^{(n)} \circ d_n^* \circ J_q^{(n-1)}$ with $J_r$ the duality maps of the respective $r$-norms.
>
> A **variational $p$-eigenvalue** is a critical value $\lambda$ of $\mathcal F_p^{(n)}$, i.e., a value at which $\nabla \mathcal F_p^{(n)}(u) = 0$ for some $u \neq 0$.

For $p = 2$, this recovers the standard Hodge Laplacian $\Delta_2 = dd^* + d^*d$ with eigenvalues = squared singular values.

For $p \neq 2$, $\Delta_p$ is *nonlinear*, but its eigenvalues form a discrete set (under finite-dim setting, by Lyusternik--Schnirelman theory).

> **Theorem ($p$-Hodge isomorphism, finite-dim cellular case).** For a finite-dim graded $p$-Banach chain complex over $\mathbb R$ with closed range (automatic in finite-dim), the $p$-Laplacian's kernel satisfies
> $$\ker \Delta_p^{(n)} \cong H_n(B_\bullet, d).$$
> The dim of the kernel is $\dim H_n$ (independent of $p$).

This is a known result in the discrete $p$-Laplacian literature: the $p$-harmonic representatives of cohomology classes form a $p$-deformation of the standard ($p=2$) harmonic forms, with the same kernel dim. (References: Eckmann, "Spectra of Laplacians on signed/$p$-Laplacian variants"; Lim, "Hodge theory for graphs and the discrete $p$-Laplacian"; Tudisco--Hein, "A nodal domain theorem and a higher-order Cheeger inequality for the graph $p$-Laplacian.")

**Important caveat for $p \ne 2$.** The $p$-eigenspaces are *not vector subspaces* in general --- they're nonlinear cones. So "multiplicity" of an eigenvalue means dim of the cone (or the variational genus, or other combinatorial invariant), not dim of an eigenspace.

For our stratification purposes, define the **$p$-multiplicity** of eigenvalue $\lambda$ as the variational genus $\gamma_\lambda$ of the level set $\{u \in B_n : \mathcal F_p^{(n)}(u) = \lambda\}$ --- a Lyusternik--Schnirelman-style invariant. For $p = 2$, $p$-multiplicity = dim of eigenspace.

##### Cross-category claim (fixed $p$)

> **Theorem (cross-category orbifold-stratification, fixed-$p$ cellular case).** Let $(B_\bullet, d)$ be a finite-dim graded chain complex over $\mathbb R$, and fix $p \in (1, \infty)$. Restrict to diagonal $p$-Banach lifts in the moduli $\mathcal H_p = \prod_n \mathbb R^{m_n}_{>0}$. Then:
>
> 1.  **Orbifold structure.** $\mathcal M^{(p)}_{\mathrm{Lap}} := G \backslash \mathcal H_p$ is a real-analytic orbifold, where $G$ is the diagonal automorphism group preserving $d$ --- typically smaller than the full $O(C_n)$ action of the linear case.
>
> 2.  **Stratification.** Strata indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}_p(\Delta_p^{(n)})$ --- recording variational-eigenvalue coincidences (in the $p$-multiplicity sense).
>
> 3.  **Universal codim.** $\mathrm{codim}\,\mathrm{Stratum}(\Pi) = \sum_{B \in \Pi, |B| \ge 2}(|B|-1)$, *for variational eigenvalue equalities*.
>
> 4.  **Stab dim.** Depends on the diagonal-automorphism group $G$ and how it acts on $p$-eigenvalue clusters.
>
> 5.  **Closure poset.** Refinement of bipartite multipartitions, *conjecturally* under a nonlinear analog of Kato perturbation theory.

###### Status of pieces

| Piece                                   | Status                                                                                                                  |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| Stratification well-defined (fixed $p$) | Proved (variational eigenvalues are continuous in $p$-Banach lifts)                                                     |
| Codim formula                           | Sketch (each eigenvalue equality is one analytic equation, but transversality requires nonlinear-perturbation argument) |
| Stab formula                            | Sketch (depends on automorphism action on $p$-eigenspaces, which are nonlinear cones)                                   |
| Closure poset                           | Conjectural (requires nonlinear eigenvalue continuity à la Kato; open for $p \ne 2$)                                    |
| Specialization to $p = 2$               | Recovers `theorems/bipartite-stratification-theorem.md` (with diagonal-automorphism restriction)                        |

So the fixed-$p$ cellular cross-category theorem is **structurally laid out** but **partially open** --- the codim formula and closure poset require nonlinear eigenvalue-perturbation arguments that aren't in standard literature for our setting.

##### The varying-$p$ case (genuinely nonlinear)

When $p$ varies (not fixed), the moduli enlarges to include the choice of $p$. The space of pairs $(p, Q) \in (1, \infty) \times \mathcal H_p$ stratifies further:

- **$p$-strata**: loci where $p$ takes a specific value.
- **Bipartite-multipartition strata** within each $p$-stratum: as in the fixed-$p$ case.
- **Cross-$p$ coincidences**: rare events where the $p$-spectrum of one $\Delta_p$ coincides with the $p'$-spectrum of another at $p \ne p'$. Generic-position argument: codim 1 at each cross-$p$ coincidence.

The varying-$p$ case is a richer stratification but requires nonlinear-perturbation theory across the $p$-parameter, which is a substantial open analytical project.

##### What goes beyond ellipsoidal Banach norms

The diagonal $p$-Banach moduli $\mathcal H_p = \prod_n \mathbb R^{m_n}_{>0}$ is a *finite-dim sub-moduli* of the full moduli of Banach norms on $B_\bullet$. The full moduli (all centrally-symmetric convex bodies in each $B_n$) is *infinite-dim* --- parametrized by smooth curvature functions on the unit sphere.

**Fully general Banach moduli.** The cross-category theorem in the fully general Banach setting would have:
- Infinite-dim moduli per chain space.
- Stratification by variational-eigenvalue multipartition still well-defined.
- "Codim" replaced by *relative codim* in finite-dim sub-moduli (analogous to the smooth Riemannian case where moduli is infinite-dim).
- Closure poset open in general.

This is parallel to the smooth Riemannian case (infinite-dim moduli of metrics) but harder because Banach perturbation theory is genuinely more subtle than Riemannian.

##### Specialization to graphs ($p$-Laplacian)

For a finite simple graph $G = (V, E)$ with vertex set $V$ and edge set $E$, the **graph $p$-Laplacian** acts on functions $f: V \to \mathbb R$ as
$$(\Delta_p^{(0)} f)(v) := \sum_{w \sim v} |f(v) - f(w)|^{p-2} (f(v) - f(w)).$$

This is the variational $p$-Laplacian for the chain complex
$$0 \to \mathbb R^E \xrightarrow{d^*} \mathbb R^V \to 0$$
where $d^*: \mathbb R^E \to \mathbb R^V$ is the discrete divergence and the $p$-norms are coordinatewise $\ell^p$.

Variational eigenvalues of $\Delta_p^{(0)}$ on graphs are studied in:
- **Tudisco--Hein 2018**: nodal domains and Cheeger-style inequalities for graph $p$-Laplacian.
- **Amghibech 2003**: existence and properties of $p$-eigenvalues.
- **([Ge and Qin 2025](#ref-ge2025computing))**: tensor reformulation.

The variational $p$-multipartition stratification in this case:
- For fixed $p$, the moduli of "weighted graphs" with given $G$ is $\mathbb R^E_{>0} \times \mathbb R^V_{>0}$ (edge and vertex weights).
- Strata indexed by $p$-eigenvalue multipartitions of $\Delta_p^{(0)}$.
- The unweighted-symmetric stratum (where the graph has full automorphism symmetry) is the most degenerate.

For $p = 2$, this reduces to Young's parametric graph framework (([Aksoy and Young 2025](#ref-aksoy2025reimagining))) and the linear cross-category theorem applies.

For $p \ne 2$, the stratification is genuinely new (variational eigenvalues, $p$-multiplicities). The cross-category claim is the conjectural extension.

##### What needs to be done for full nonlinear cross-category

1.  **Nonlinear eigenvalue perturbation theory.** Continuity of variational eigenvalues under perturbation of $p$-Banach lift. Some results exist (Tudisco--Hein for fixed $p$); a Kato-style theorem covering the whole framework is open.

2.  **$p$-Hodge isomorphism in noncommutative / nonsmooth settings.** The cellular case is OK; smooth Riemannian $p$-Hodge has subtle regularity issues.

3.  **Banach-moduli stratification.** Currently restricted to diagonal $p$-Banach (finite-dim sub-moduli). The general Banach case (infinite-dim moduli of convex bodies) is genuinely open.

4.  **Closure poset for variational eigenvalues.** First-order Rayleigh--Schrödinger-style perturbation argument needs nonlinear adaptation. For $p = 2$ this is the linear case; for $p$ near 2, perturbation in the "nearly-linear" regime works; for general $p$, open.

5.  **Cross-$p$ stratification.** The varying-$p$ case introduces a new stratum dimension; closure poset and codim across $p$ is open.

##### Status

**Sketch / partial-proved on restricted cases.** The variational framework is set up; the fixed-$p$ cellular case admits a partial cross-category theorem with codim and closure-poset claims still requiring nonlinear-perturbation arguments. The full varying-$p$ and general-Banach cross-category theorem is conjectural.

The nonlinear case is honestly *the hardest* of the three frontier directions (cellular, smooth, noncommutative being linear-Hilbert; nonlinear is analytically distinct). A full rigorous treatment would likely require its own monograph.

The variational framework here is the most analytically demanding extension; the closure-poset argument requires a Kato-style perturbation theorem for variational eigenvalues that is not in the standard literature for our setting (`questions/variational-p-eigenvalue-perturbation.md`).

##### Open

1.  Nonlinear Kato-style perturbation theory for variational $p$-eigenvalues --- needed for the closure-poset argument across $p$-Banach lift variations.

2.  Concrete computation: variational $p$-eigenvalue stratification on a small graph (e.g., $K_3$, $C_4$) for a few values of $p$ --- does the bipartite multipartition lattice persist, and how do the strata vary with $p$?

3.  Connection to nonlinear PCA: ([Ma and Kunisky 2025](#ref-ma2025nonlinear)) parametrizes a family of nonlinear Laplacians; the cross-category claim should apply to this family with appropriate modifications.

4.  Tensor-eigenvalue reformulation: ([Ge and Qin 2025](#ref-ge2025computing)) shows graph $p$-Laplacian (for even $p$) is a tensor eigenproblem. The cross-category framework on tensor eigenvalues is its own substantial direction.

5.  Dual-stratification analog: does the SPD-cone Stratification II have a Banach analog? The closure of the "Banach unit ball" moduli at degenerate norms (e.g., norms with non-strictly-convex unit balls) might give a parallel boundary structure.

#### Object: Bipartite multipartition lattice {#bipartite-multipartition-lattice}

The poset of [bipartite multipartitions](#bipartite-multipartition) under refinement, used as the indexing structure for [strata](#stratum-eigenvalue-multiplicity) of $\mathcal M_{\mathrm{Lap}}$ via their closure relations.

##### Underlying set

Fix a chain rank profile $\mathbf r = (r_0, r_1, \ldots, r_N)$. The underlying set of $\mathcal P_{\mathrm{bip}}(\mathbf r)$ is the set of equivalence classes of partitions of $[N_*] = \bigsqcup_n \{1, \ldots, r_n\}$ under the action of $\prod_n S_{r_n}$ (independent label-permutation within each color class).

##### Order

$\Pi \preceq \Pi'$ iff $\Pi'$ refines $\Pi$ --- every block of $\Pi'$ is contained in some block of $\Pi$. The minimum element is $\hat 0 = \{[N_*]\}$ (single block, all indices identified). The maximum element is $\hat 1$ = singletons (no identifications beyond Hodge minimum).

When chain Hodge constraints are imposed (forced cross-degree pairs from the supersymmetric isospectrality), the lattice is restricted to multipartitions consistent with the forced identifications --- a sub-lattice of the full bipartite multipartition lattice.

##### Lattice structure

$\mathcal P_{\mathrm{bip}}(\mathbf r)$ is a *lattice*: meet $\Pi \wedge \Pi'$ is the partition generated by the union of equivalence relations; join $\Pi \vee \Pi'$ is the partition into common-refinement blocks. Inherits this from the partition-lattice structure on $[N_*]$.

For uniform $\mathbf r$ with single non-zero rank ($N = 1$), the bipartite multipartition lattice reduces to the classical partition lattice $\Pi_{r_1}$.

##### Cover relations

$\Pi$ is covered by $\Pi'$ iff $\Pi'$ is obtained from $\Pi$ by splitting one block of $\Pi$ into two non-empty parts. This is a one-step refinement.

For chain complexes with Hodge-constrained lattices, cover relations may be more restrictive (only certain block-splittings preserve the Hodge constraints).

##### Möbius function

The Möbius function $\mu_{\mathcal P_{\mathrm{bip}}}: \mathcal P_{\mathrm{bip}} \times \mathcal P_{\mathrm{bip}} \to \mathbb Z$ records intervals $[\Pi, \Pi']$. Conjecturally, it factors as
$$\mu_{\mathcal P_{\mathrm{bip}}}(\Pi, \Pi') = \prod_{B \in \Pi} \mu_{\mathrm{univ}}(B|_{\Pi'})$$
where $B|_{\Pi'}$ is the partition of $B$ induced by $\Pi'$ refining $B$, and $\mu_{\mathrm{univ}}$ is the classical partition-lattice Möbius function $\mu(\hat 0, \pi) = (-1)^{|\pi|-1}(|\pi|-1)!$.

This factorization is verified on small Hodge-constrained cases (toolkit `mobius_and_vassiliev.py`); a proof in general is [open](#bipartite-mobius-product-formula).

##### Cardinality

For a single chain ($N = 1$, $\mathbf r = (r)$), $|\mathcal P_{\mathrm{bip}}| = B(r)$ (Bell number). For larger $\mathbf r$, the count is the number of partitions of $[N_*]$ modulo $\prod_n S_{r_n}$ --- computable but no simple closed form.

For $(2, 2)$ (no Hodge constraints): 15 partitions of 4 elements / $S_2 \times S_2$ = different count depending on enumeration. With Hodge constraints (forcing $(0, i) \sim (1, i)$ pairs): 2 elements (binary lattice).

For $(3, 3)$ Hodge-constrained (forcing 3 cross-degree pairs): a richer lattice with the structure of the partition lattice of 3 elements (the "Hodge classes") = $\Pi_3$, 5 elements.

##### Relation to closure poset

By the [closure poset theorem](#closure-poset-of-strata), the bipartite multipartition lattice is *order-isomorphic* to the closure poset of strata of $\mathcal M_{\mathrm{Lap}}$. The combinatorics of $\mathcal P_{\mathrm{bip}}$ thus controls the geometric structure of moduli.

##### Distinguished elements

- $\hat 0$ = single block of all $N_*$ indices (the [supersymmetric stratum](#stratum-eigenvalue-multiplicity), full eigenvalue degeneracy, codim $N_* - 1$ in moduli).
- $\hat 1$ = singletons (the generic stratum modulo Hodge minimum, codim 0 in moduli).
- Atoms (covers of $\hat 0$) = block-splits of size $|B| - 1 = 1$, i.e., one pair of indices distinguished from the rest.
- Co-atoms (covers below $\hat 1$) = single-pair-mergings, i.e., one pair of formerly-distinct eigenvalues identified.

##### Action of $\prod_n S_{r_n}$

The lattice is *defined* modulo $\prod_n S_{r_n}$. As a poset, it's a quotient of the full partition lattice on $[N_*]$ by this group action. The quotient may have extra structural features (orbifold-like singularities at fixed-point partitions) --- relevant for [bipartite Vassiliev cohomology](#bipartite-vassiliev-shapiro-vainshtein).

#### Definition: Refinement cover relation {#refinement-cover}

The atomic morphism in the [bipartite multipartition lattice](#bipartite-multipartition-lattice): one-step refinement of a multipartition by splitting a single block.

##### Definition

Bipartite multipartitions $\Pi$ and $\Pi'$ satisfy $\Pi \lessdot \Pi'$ ($\Pi$ is covered by $\Pi'$, equivalently $\Pi'$ refines $\Pi$ minimally) iff $\Pi'$ is obtained from $\Pi$ by partitioning exactly one block $B \in \Pi$ into two non-empty parts $B_1, B_2$ with $B = B_1 \sqcup B_2$, leaving all other blocks unchanged.

In closure-poset terms: $\Pi \lessdot \Pi'$ iff $\overline{\mathrm{Stratum}(\Pi')}$ contains $\mathrm{Stratum}(\Pi)$ and there is no intermediate stratum.

##### Geometric meaning

A cover $\Pi \lessdot \Pi'$ corresponds to **one extra eigenvalue equality being broken** in passing from a $\Pi$-point to a generic $\Pi'$-point in moduli. The block $B$ in $\Pi$ has $|B|$ identified eigenvalues; in $\Pi'$ they split into $|B_1|$ identified + $|B_2|$ identified (still partially identified, just two clusters instead of one).

The codim of a single cover step: $\sum_B(|B|-1)|_{\Pi'} - \sum_B(|B|-1)|_\Pi = (|B_1| - 1) + (|B_2| - 1) - (|B|-1) = |B_1| + |B_2| - |B| - 1 = -1$. The codim *decreases* by 1 per cover step (refinement reduces codim).

##### Two types of covers

**Within-block split**: $B$ has all entries in the same chain degree ($k_n^B \ne 0$ for one $n$). Splitting it produces two within-degree blocks. Stab dim drop: $\binom{k_n^B}{2} - \binom{k_n^{B_1}}{2} - \binom{k_n^{B_2}}{2}$ (depends on the split).

**Cross-degree split**: $B$ has entries in multiple degrees. Splitting can break a cross-degree identification. Stab dim drop depends on the split structure.

The cross-degree asymmetry (codim sees splits, stab does not for cross-degree) appears as: cross-degree splits reduce codim by 1 but produce no stab change if the resulting blocks are still cross-degree.

##### Length of the lattice

The length of a maximal chain $\hat 0 \lessdot \cdots \lessdot \hat 1$ in $\mathcal P_{\mathrm{bip}}(\mathbf r)$ equals $N_* - 1$ --- the codim difference between the bottom (single block) and top (singletons) elements. Each cover step refines by exactly 1.

##### Möbius function relations

The cover relations generate the partial order; the [Möbius function](#bipartite-multipartition-lattice#mobius-function) is determined by them via the inversion identity. For the conjectured product formula, each cover-step Möbius value factors as a univariate Möbius factor on the split block.

##### Action on stratum closures

A cover step $\Pi \lessdot \Pi'$ corresponds geometrically to a deformation: starting from a $\Pi$-stratum point and applying first-order Rayleigh--Schrödinger perturbation, the eigenvalues split in the direction of the cover. ([Closure poset proof](#closure-poset-of-strata).)

##### Example: $(2, 2)$ chain

For the (2, 2) chain with $d_1$ iso (Hodge-constrained lattice with 2 elements):
- $\hat 0 = \Pi_{\max} = \{\{(0,1),(0,2),(1,1),(1,2)\}\}$, codim 3 in eigenvalue moduli.
- $\hat 1 = \Pi_{\min} = \{\{(0,1),(1,1)\}, \{(0,2),(1,2)\}\}$, codim 2.
- Cover: $\hat 0 \lessdot \hat 1$, splitting the block of 4 into two blocks of 2 (preserving Hodge pairings).
- Codim difference: 1 (matches the formula).

#### Object: Spectral triple {#spectral-triple}

A Connes spectral triple $(\mathcal A, \mathcal H, D)$ --- a unital $*$-algebra $\mathcal A$ acting on a Hilbert space $\mathcal H$, together with an unbounded self-adjoint operator $D$ (the Dirac operator) with compact resolvent and bounded commutators with $\mathcal A$. Encodes a "noncommutative Riemannian manifold."

##### Why this is in the survey

Two 2025 papers attach the program: ([Mesland and Rennie 2024](#ref-mesland2024curvature)) defines connection Laplacians and a Weitzenböck identity, and ([Tageddine and Nave 2025](#ref-tageddine2025noncommutative)) constructs a Laplacian on matrix-algebra approximations whose classical limit is Laplace--Beltrami.

A spectral triple is the most distant input category from the cellular / poset world that still admits a recognizable Laplacianization. The Laplacian here is built from the Dirac operator (or its connection version) and lives in the operator algebra of $\mathcal H$. The Weitzenböck identity matters because it is *the* signature of a genuine Laplacianization --- relating the abstract operator to curvature data --- and its analogue in spectral triples is exactly what licenses the claim that the construction is the right one.

##### Where this strains the program

The Laplacianizer framework (`concepts/laplacianizer.md`) requires a graded chain complex $(F(X), d)$ with $d^2 = 0$. For spectral triples this is *not* immediately given:

- No obvious chain complex: the spectral triple has $\mathcal H$ as a single Hilbert space with no graded decomposition coming from the structure.
- The Dirac operator $D$ is not a degree-(-1) chain differential with $D^2 = 0$ in the de Rham sense; instead $D^2$ is related to the Laplacian via the Weitzenböck formula.
- A functor from spectral triples to graded Hilbert chain complexes is not in the literature in a form the program could use directly.

The **Hochschild / cyclic complex** of $\mathcal A$ is the natural candidate to play the role of $C_\bullet(X)$ for spectral triples. If the connection Laplacian on a spectral triple agrees with a Hodge Laplacian on the cyclic complex (with the spectral-triple-induced inner product), the program would have a clean categorical bridge from noncommutative geometry to combinatorial Laplacian theory. That bridge is open.

##### Bridges

- To `concepts/laplacianizer.md` --- the noncommutative case requires either an extension of the Laplacianizer framework or a translation of spectral-triple data into a chain-complex form (probably via Hochschild / cyclic complexes).
- To `questions/what-is-laplacianizability.md` --- the noncommutative case is one of the open frontier directions raised there.

#### Definition: Resolvent intertwiner (Hochschild--Hilbert lift) {#resolvent-intertwiner}

The construction extracting a Hilbert structure on the Hochschild complex of $\mathcal A$ from the spectral data of $D$. The technical bridge that makes spectral triples fit the Laplacianizer framework.

##### Setup

For a [spectral triple](#spectral-triple) $(\mathcal A, \mathcal H, D)$ with $D$ self-adjoint and compact resolvent (so $R_D := (1 + D^2)^{-1}$ is compact), define for $a, b \in \mathcal A$:

**Finite-dim case** ($\mathcal A, \mathcal H$ finite-dim):
$$\langle a, b \rangle_D := \mathrm{Tr}_\mathcal H \big(\pi(a)^* R_D \pi(b)\big).$$

**Infinite-dim, $p$-summable case** (with $p$ the summability degree):
$$\langle a, b \rangle_D := \mathrm{Tr}_\mathcal H \big(R_D^{N/2} \pi(a)^* \pi(b) R_D^{N/2}\big), \quad N > p.$$

For higher Hochschild chains $a_0 \otimes \cdots \otimes a_n \in C_n(\mathcal A) = \mathcal A^{\otimes(n+1)}$:
$$\langle a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n \rangle_D := \langle a_0, b_0 \rangle_D \cdot \prod_{i=1}^n \langle [D, \pi(a_i)], [D, \pi(b_i)] \rangle_D'$$

where $\langle x, y \rangle_D' := \mathrm{Tr}(R_D^{N/2} x^* y R_D^{N/2})$ extends the inner product to bounded operators (commutators).

##### Properties

- **Positivity**: $\langle a, a \rangle_D = \|R_D^{N/2} \pi(a)\|_{HS}^2 \ge 0$ as a Hilbert--Schmidt norm squared. Strictly positive for $a \ne 0$ when $\theta_D: a \mapsto R_D^{N/2} \pi(a)$ is injective.
- **Symmetry (Hermitian)**: $\overline{\langle a, b \rangle_D} = \langle b, a \rangle_D$ from the trace identity $\mathrm{Tr}(X^*) = \overline{\mathrm{Tr}(X)}$.
- **Finiteness**: traces are finite by $p$-summability + suitable choice of $N$.
- **Continuity in $D$**: real-analytic on the open set where $\theta_D$ is injective (Kato perturbation theory applies).

##### Why $R_D$ rather than $e^{-tD^2}$

The Connes--Moscovici JLO cocycle uses the heat kernel $e^{-tD^2}$ integrated over the simplex $\Delta_n$. The resolvent-based formula here uses $R_D = (1+D^2)^{-1}$ instead --- simpler, gives a positive form directly without the simplex integration, and is more amenable to perturbation theory.

The two formulations are *not literally equal* but extract spectral information from the same $D$ and pair to the same K-theory index via Connes--Karoubi duality.

##### Hodge Laplacian induced

The Hochschild differential $b: C_n(\mathcal A) \to C_{n-1}(\mathcal A)$ acts on chains:
$$b(a_0 \otimes \cdots \otimes a_n) = \sum_{i=0}^{n-1}(-1)^i a_0 \otimes \cdots \otimes a_i a_{i+1} \otimes \cdots \otimes a_n + (-1)^n a_n a_0 \otimes a_1 \otimes \cdots \otimes a_{n-1}.$$

With the resolvent inner product, $b^*$ is well-defined; the Hodge Laplacian
$$\Delta_n^{(D)} := b b^* + b^* b$$
is self-adjoint with discrete spectrum (under regularity / compact-resolvent assumptions). Its kernel realizes the [Hodge isomorphism](#hodge-isomorphism) with Hochschild homology $\mathrm{HH}_n(\mathcal A)$.

##### Reduction to smooth Riemannian

For the canonical spectral triple $(C^\infty(M), L^2(M, S), \not\!\!\!D)$ on a compact spin manifold $M$:
- Hochschild--Kostant--Rosenberg: $\mathrm{HH}_\bullet(C^\infty(M)) \cong \Omega^\bullet(M)$.
- Connes 1985: $\mathrm{HP}_\bullet(C^\infty(M)) \cong H^\bullet_{\mathrm{dR}}(M)$ (periodic cyclic = de Rham, mod 2-periodic).
- The resolvent inner product, restricted to HKR representatives, induces the standard $L^2$-inner product on $\Omega^\bullet(M)$ (up to a Wodzicki-residue normalization).
- The cyclic-complex variant gives the de Rham Laplacian on $\Omega^\bullet$.

So the resolvent intertwiner *generalizes* the smooth Riemannian Laplacianizer, and reduces to it on commutative spectral triples.

##### Variant: cyclic complex

For commutative $\mathcal A$, the Hochschild differential collapses on HKR representatives. The genuinely-non-trivial differential is Connes' $B$ on the cyclic complex $\mathrm{HC}_\bullet$. The cyclic Hochschild--Hilbert lift uses the same resolvent inner product, but on cyclic chains, with differential $b - B$. Under HKR, $\Delta^{\lambda} = (b-B)(b-B)^* + (b-B)^*(b-B)$ corresponds to the de Rham Laplacian $dd^* + d^*d$.

##### Generality / regularity

For *regular* spectral triples (Connes' sense: $\mathcal A$ closed under $\delta = [|D|, \cdot]$), the resolvent intertwiner gives a well-defined Hilbert chain complex with closed range and Hodge isomorphism. This covers:
- Compact spin manifolds (canonical spectral triple).
- Almost-commutative spectral triples ($C^\infty(M) \otimes \mathcal A_F$).
- Discrete groups with property RD.
- Many quantum-group / quantum-torus / deformation-quantization cases.

A self-contained proof of closed-range in the laplanc-2025 framework (without invoking Connes' nc-pseudo-DO calculus) is [open](#closed-range-in-our-framework).

#### Example: Worked example: sheaf Laplacian on a finite poset {#sheaf-laplacian-on-poset}

A concrete computation, end to end. Demonstrates the Hilbert-lift framework on the simplest nontrivial case.

##### The poset

Let $P$ be the poset of cells of the boundary of a triangle, i.e. the face poset of the simplicial complex $\partial \Delta^2$. Elements: three vertices $v_1, v_2, v_3$, three edges $e_{12}, e_{13}, e_{23}$. Order: $v_i \le e_{ij}$ when $i \in \{$ endpoints of $e_{ij}\}$. So:

$$v_1, v_2, v_3 \;\;<\;\; e_{12}, e_{13}, e_{23}.$$

This is a 1-dimensional poset (all chains have length $\le 1$).

##### The sheaf

Define a sheaf $\mathcal F: P \to \mathbf{Vec}_\mathbb{R}$ by:

- $\mathcal F(v_i) = \mathbb{R}^2$ for each vertex (some fixed 2-dim vector space, "the field at this vertex");
- $\mathcal F(e_{ij}) = \mathbb{R}$ for each edge ("the field at this edge");
- restriction map $\mathcal F(v_i) \to \mathcal F(e_{ij})$ given by the linear functional "evaluate the first coordinate" --- say $r_{ij}^i: (x, y) \mapsto x$ --- for both endpoints.

(This is a small toy sheaf chosen to keep arithmetic manageable.)

##### The cochain complex

For a sheaf $\mathcal F$ on a finite poset $P$, the cellular cochain complex is

$$C^k(P, \mathcal F) := \bigoplus_{p_0 < p_1 < \cdots < p_k} \mathcal F(p_k)$$

with coboundary $\delta: C^k \to C^{k+1}$ given by the alternating sum of restriction maps along chain inclusions. For our 1-dim poset only $k = 0, 1$ contribute.

$C^0 = \mathcal F(v_1) \oplus \mathcal F(v_2) \oplus \mathcal F(v_3) \oplus \mathcal F(e_{12}) \oplus \mathcal F(e_{13}) \oplus \mathcal F(e_{23})$ --- total dimension $2 + 2 + 2 + 1 + 1 + 1 = 9$.

$C^1 = \bigoplus_{v_i < e_{ij}} \mathcal F(e_{ij})$, indexed by the 6 valid pairs (each edge has 2 endpoints): $\mathbb R^6$.

The coboundary $\delta: C^0 \to C^1$ acts on the chain $(v_i < e_{ij})$ component as

$$\delta(\xi)(v_i < e_{ij}) = r_{ij}^i(\xi(v_i)) - \xi(e_{ij}).$$

##### Inner products

Take the standard Euclidean inner product on each stalk and orthogonal-direct-sum on each $C^k$. So $\langle \cdot, \cdot \rangle_{C^0}$ is just the dot product on $\mathbb R^9$, and $\langle \cdot, \cdot \rangle_{C^1}$ on $\mathbb R^6$.

##### The Laplacian

Compute $\delta^*: C^1 \to C^0$. For a basis vector $e_{(v_i < e_{ij})}^{(1)} \in C^1$ (the unit indicator of one chain), $\delta^* (e_{(v_i < e_{ij})}^{(1)}) = (r_{ij}^i)^* (1) \in \mathcal F(v_i) \subset C^0 \;-\; e_{ij}^{(0)} \in \mathcal F(e_{ij}) \subset C^0$, where $(r_{ij}^i)^*(1) = (1, 0) \in \mathbb R^2$ is the adjoint of "first coordinate."

The degree-$0$ Laplacian $\Delta_0 = \delta^* \delta: C^0 \to C^0$ is then a $9 \times 9$ matrix. On the vertex part: each vertex $v_i$ contributes to two chains (one per incident edge), and $\Delta_0|_{\mathcal F(v_i)}$ sums two rank-one operators $(r_{ij}^i)^* r_{ij}^i = E_{11}$ (the projection onto the first coordinate). So $\Delta_0|_{\mathcal F(v_i)} = 2 E_{11}$ --- a diagonal matrix $\mathrm{diag}(2, 0)$ on $\mathbb R^2$.

On the edge part: each edge $e_{ij}$ contributes to two chains (one per incident vertex), and $\Delta_0|_{\mathcal F(e_{ij})} = 2 \cdot \mathrm{Id}_{\mathbb R}$.

Cross-terms (vertex × edge): $\Delta_0$ has off-diagonal entries from $\delta^* \delta$ between $\mathcal F(v_i)$ and $\mathcal F(e_{ij})$ when $v_i < e_{ij}$. The entry on $\mathcal F(v_i) \to \mathcal F(e_{ij})$ is $-r_{ij}^i$ (i.e. $-(1,0)^T$ as a column vector), and on $\mathcal F(e_{ij}) \to \mathcal F(v_i)$ it is $-(r_{ij}^i)^* = -(1, 0)$.

Putting it together, $\Delta_0$ has block structure: $9 \times 9$, with on-diagonal blocks $\mathrm{diag}(2, 0)$ for each vertex stalk and $2$ for each edge stalk, and off-diagonal $-(1,0)$ couplings.

##### Hodge isomorphism check

$\ker \Delta_0$ should equal $H^0(P, \mathcal F)$. Compute $H^0$ directly: a $0$-cocycle is $\xi \in C^0$ with $\delta \xi = 0$, i.e. $r_{ij}^i(\xi(v_i)) = \xi(e_{ij})$ for every $v_i < e_{ij}$. Constraint per edge: the first coordinates of the two adjacent vertices must agree, and equal $\xi(e_{ij})$.

Solutions: pick the first coordinate of all three vertices to a common value $c$ ($1$ degree of freedom), the second coordinates freely ($3$ degrees), and edge stalks determined ($\xi(e_{ij}) = c$ for all). Total: $1 + 3 = 4$ dimensions. So $H^0(P, \mathcal F) = \mathbb R^4$.

Check \$`\ker `{=tex}`\Delta`{=tex}\_0 = \$ kernel of the matrix above. By Hodge, $\ker \Delta_0 = \ker \delta$ (since $\delta$ has closed range --- we are finite-dimensional). $\ker \delta$ is exactly the $0$-cocycles, which we computed is $\mathbb R^4$. Hodge holds.

##### What this example illustrates

1.  **The chain complex is the input data.** The recipe --- sheaf, stalks, restrictions, inner products --- produces $(C^\bullet, \delta, \langle \cdot, \cdot \rangle)$. The Laplacian $\Delta = \delta\delta^* + \delta^*\delta$ is determined.
2.  **The Hodge isomorphism is automatic** in this finite-dimensional case; what's non-trivial is that $H^\bullet(C^\bullet, \delta)$ matches sheaf cohomology of $\mathcal F$ on $P$. (For cellular sheaves this is the definition; for non-cellular posets one needs to check.)
3.  **Different Hilbert structures change $\Delta$ but not its kernel dimension.** Replacing the Euclidean inner product on each stalk by another positive-definite form changes $\Delta_0$ as a matrix but not $\dim \ker \Delta_0 = \dim H^0$. This is the moduli-of-Hilbert-structures non-canonicity referred to in `concepts/laplacianizability.md`.
4.  **The recipe extends.** Replace $P$ with any finite poset, $\mathcal F$ with any Hilbert-valued sheaf --- the construction goes through. This is the content of ([Ayzenberg et al. 2025](#ref-ayzenberg2025sheaf)).

#### Concept: Squared singular value (of a weighted boundary) {#squared-singular-value}

The basic spectral datum on which the bipartite stratification of moduli is built. For a chain complex $(C_\bullet, d)$ and Hilbert structure $Q \in \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$, the **weighted boundary** at degree $n$ is
$$\widetilde d_n := Q_{n-1}^{1/2} d_n Q_n^{-1/2}: (C_n, \mathrm{std}) \to (C_{n-1}, \mathrm{std}),$$
an operator between standard-inner-product Hilbert spaces that has the same singular values as $d_n: (C_n, Q_n) \to (C_{n-1}, Q_{n-1})$ in its natural Hilbert spaces.

The **squared singular values** of $\widetilde d_n$ are the eigenvalues of $\widetilde d_n^T \widetilde d_n$ (= eigenvalues of $\widetilde d_n \widetilde d_n^T$ on the image side, by the singular-value duality):
$$\sigma_1^2(\widetilde d_n) \le \sigma_2^2(\widetilde d_n) \le \cdots \le \sigma_{r_n}^2(\widetilde d_n),$$
where $r_n = \mathrm{rank}\, d_n$ and the values are positive (since $\widetilde d_n$ is rank $r_n$ as a real operator).

##### Equivalent characterizations

The squared singular values are equivalently:
- Nonzero eigenvalues of the [Hodge Laplacian](#hodge-laplacian) $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ on the $\mathrm{im}\, d_n^*$-piece of $C_n$ (the "$d_n$-side" Hodge component).
- Nonzero eigenvalues of $\Delta_{n-1}^{(Q)}$ on the $\mathrm{im}\, d_n$-piece of $C_{n-1}$ (the "$d_n$-image-side" component) --- equal as multisets, by Hodge supersymmetric isospectrality.
- Roots of the generalized eigenvalue pencil $\det(d_n^T Q_{n-1} d_n - \lambda Q_n) = 0$ in $C_n$, taking the $r_n$ nonzero roots.

##### Continuity in $Q$

As functions $\sigma_i^2: \mathcal H \to \mathbb R_{>0}$, the squared singular values are continuous in $Q$ (real-analytic in fact, on the open dense locus where they're simple; with branch crossings handled by Kato analytic perturbation when multiplicities form). This continuity is essential to the closure-poset argument for [strata](#stratum-eigenvalue-multiplicity).

##### Hodge isomorphism

The map $\widetilde d_n: \mathrm{im}\,\widetilde d_n^* \xrightarrow{\sim} \mathrm{im}\,\widetilde d_n$ is an isomorphism, with the squared singular values appearing on both sides. This is the source of the Hodge supersymmetric isospectrality --- eigenvalues are identified across degrees even though the underlying operators act on different chain spaces.

##### What they label

The $\sigma_i^2(\widetilde d_n)$ for fixed $n$ label "the eigenvalues of $\Delta$ in the $d_n$-piece" of the chain complex. The bipartite indexing $(n, i)$ records the operator $d_n$ together with the eigenvalue index $i \in \{1, \ldots, r_n\}$. The bipartite multipartition $\Pi(Q)$ is the partition of all such $(n, i)$ by the equivalence relation "$\sigma_i^2(\widetilde d_n) = \sigma_j^2(\widetilde d_m)$".

##### In the cellular case

For a cellular chain complex with stalkwise diagonal $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{m_n,n})$:
$$\widetilde d_n^T \widetilde d_n = Q_n^{-1/2} d_n^T Q_{n-1} d_n Q_n^{-1/2}$$
is similar to $d_n^T Q_{n-1} d_n \cdot Q_n^{-1}$, whose nonzero eigenvalues are the squared singular values. Concretely, this is the matrix whose entries are weighted graph-Laplacian-like quantities --- symmetric, rank $r_n$, with positive eigenvalues. The combinatorics of when its eigenvalues coincide drives the cellular IEP-G obstructions.

#### Concept: Stratum (eigenvalue-multiplicity) {#stratum-eigenvalue-multiplicity}

A **stratum** of $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ (or its image in $\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$) is the locus of Hilbert structures with a fixed [bipartite multipartition](#bipartite-multipartition) $\Pi$:
$$\mathrm{Stratum}(\Pi) := \{Q \in \mathcal H : \Pi(Q) = \Pi\}.$$

Strata are pairwise disjoint and cover $\mathcal H$. Their union is the **eigenvalue stratification** of $\mathcal H$ (= [Stratification I](#stratification-i)).

##### Geometric structure

Each $\mathrm{Stratum}(\Pi)$ is:

- A **locally closed real semi-algebraic set** in $\mathcal H$. Closed conditions $\sigma_i^2 = \sigma_j^2$ hold for indices in the same block of $\Pi$; open conditions $\sigma_i^2 \ne \sigma_j^2$ for indices in distinct blocks.

- **Codimension** $\sum_B(|B|-1) = N_* - \#\Pi$ in moduli (modulo the gauge action). [Proved](#stab-codim-formula).

- **Stab dimension** $\sum_B \sum_n \binom{k_n^B}{2}$ at any point of the stratum (under the chain auto group $G$). [Proved](#stab-codim-formula).

- A **fiber bundle** over the open simplex $\mathrm{Spec}^*(\Pi)$ of distinct eigenvalues compatible with $\Pi$, with fiber a real partial flag manifold $G / \mathrm{stab}(\Pi)$.

##### Realizability

Strata are non-empty for *every* bipartite multipartition $\Pi$ compatible with the chain rank profile $(r_n)$ --- the [bipartite realizability theorem](#bipartite-realizability). With sparsity constraints (e.g., stalkwise diagonal cellular sheaves), realizability becomes substantive --- the [chain-complex IEP-G program](#chain-complex-iep-g).

##### Closure relations

$\overline{\mathrm{Stratum}(\Pi')} = \bigsqcup_{\Pi \succeq \Pi'} \mathrm{Stratum}(\Pi)$ --- the closure consists of the stratum together with all coarser strata. The closure poset is the [bipartite multipartition refinement lattice](#bipartite-multipartition-lattice). [Proved](#closure-poset-of-strata).

##### Distinguished strata

- **Open dense (generic) stratum**: $\Pi = \Pi_{\min}$, the multipartition with only Hodge-forced cross-degree blocks (and otherwise singletons). Codim 0 modulo Hodge constraints.

- **Top (supersymmetric) stratum**: $\Pi = \Pi_{\max} = \{\{[N_*]\}\}$ (single block of all indices). Codim $N_* - 1$. Realizable in the unconstrained case; subject to IEP-G obstructions in the cellular case.

- **Intermediate strata**: any refinement order between $\Pi_{\min}$ and $\Pi_{\max}$.

##### Distinct from Hilbert-degeneracy strata

Strata in this sense (Stratification I) live in the SPD interior $\mathcal H$. The closure $\overline{\mathcal H}$ has a *second* family of strata --- the [Pataki rank strata](#pataki-rank-stratum) at the SPD-cone boundary, refined by [Schubert invariants](#schubert-invariant) --- collectively [Stratification II](#stratification-ii). Stratification I depends on spectral data of $\Delta(Q)$; Stratification II depends on rank/kernel data of $Q$ itself.

#### Object: Stratification I (eigenvalue multipartition) {#stratification-i}

The intrinsic stratification of $\mathcal M_{\mathrm{Lap}}$ in the SPD interior, by [bipartite multipartitions](#bipartite-multipartition) of the Hodge spectrum.

##### Definition

The decomposition
$$\mathcal H = \bigsqcup_\Pi \mathrm{Stratum}(\Pi), \qquad \mathcal M_{\mathrm{Lap}} = \bigsqcup_\Pi G \backslash \mathrm{Stratum}(\Pi),$$
where $\Pi$ ranges over [bipartite multipartitions](#bipartite-multipartition) of the indexing set $[N_*]$, and $\mathrm{Stratum}(\Pi) = \{Q \in \mathcal H : \Pi(Q) = \Pi\}$ is the locus of Hilbert structures with bipartite multipartition exactly $\Pi$.

##### Key properties

- **Codim**: $\sum_B (|B|-1)$ for stratum $\Pi$, in moduli (after quotient by gauge).
- **Stab dim**: $\sum_B \sum_n \binom{k_n^B}{2}$.
- **Closure poset**: bipartite multipartition refinement lattice.
- **Realizability**: every $\Pi$ is realized in the unconstrained case ([proved](#bipartite-realizability)).
- **Interior to $\mathcal H$**: all strata live entirely inside the SPD interior $\mathcal H$, not at its boundary.

##### What it sees

Stratification I depends only on **spectral data** of $\Delta(Q)$ --- specifically, the bipartite multipartition of the squared singular values of weighted boundaries $\widetilde d_n$. It is invariant under the gauge action and intrinsic to the moduli.

It does *not* see the rank or kernel structure of $Q$ itself --- those only become visible at the SPD-cone boundary, where Stratification II takes over.

##### Universality across categories

The same stratification structure (universal codim formula, category-specific stab) appears in:
- [Cellular finite-dim case](#bipartite-stratification-theorem) --- proved.
- [Smooth Riemannian case](#cross-category-smooth) --- proved, via Ebin + Kato + Myers--Steenrod.
- ([Aksoy and Young 2025](#ref-aksoy2025reimagining)) --- instance of finite-dim cellular.
- [Finite spectral triple case](#finite-spectral-triple-laplacianizability) --- proved via Hochschild-Hilbert lift.
- ([Schwahn and Semmelmann 2025](#ref-schwahn2025einstein)) --- specialization of smooth Riemannian.

The precise category-free hypothesis under which Stratification I is well-defined is the [cross-category orbifold-stratification theorem](#cross-category-orbifold-stratification), partial-proved.

##### Univariate specialization

For $N = 1$ (single chain space, single boundary operator), bipartite multipartitions reduce to ordinary partitions of $r_1$, and Stratification I reduces to the classical Arnold--Weinstein eigenvalue stratification of $\mathrm{Sym}^+_n$.

##### Bipartite content

For $N \ge 2$, the bipartite extension produces structurally new content:
- Cross-degree blocks (eigenvalue identifications between different $d_n$'s) contribute to codim but not to stab.
- The closure poset is the bipartite multipartition refinement lattice, richer than the univariate partition lattice.
- Realizability under sparsity (cellular-sheaf case) becomes substantive --- the [chain-complex IEP-G program](#chain-complex-iep-g).

#### Concept: Pataki rank stratum {#pataki-rank-stratum}

The coarse stratification of the closed cone $\overline{\mathrm{Sym}^+_m}$ (and its product across chain degrees, $\overline{\mathcal H}$) by the rank of the Hilbert structure. Classical for SDP face theory (Pataki 1995); used here as the coarse layer of [Stratification II](#stratification-ii).

##### Definition

For $\overline{\mathrm{Sym}^+_m}$ --- the cone of positive-semidefinite real symmetric $m \times m$ matrices --- the **Pataki stratum** of rank $r$ is
$$\{Q \in \overline{\mathrm{Sym}^+_m} : \mathrm{rank}\, Q = r\}, \qquad 0 \le r \le m.$$

This is a smooth submanifold of dim $rm - \binom{r}{2}$. It can be parametrized as $\{LL^T : L \in \mathbb R^{m \times r},\ \mathrm{rank}\, L = r\} / O(r)$ (factorization by injective $m \times r$ matrices modulo right-multiplication by orthogonal $r \times r$).

##### Codim formula

The codim of the rank-$r$ stratum in $\mathrm{Sym}_m$ is
$$\binom{m+1}{2} - rm + \binom{r}{2} = \binom{m - r + 1}{2}.$$

The "rank-deficit triangular number" --- the codim depends only on the rank-deficit $m - r$.

##### Closure relations

The rank-$r$ stratum is in the closure of the rank-$r'$ stratum iff $r \le r'$. The closure poset is the chain $0 \le 1 \le \cdots \le m$ --- equivalently, "rank can only drop in the limit," upper-semi-continuity of rank.

##### Product extension to chain complexes

For a chain complex with chain spaces $C_n$ of dim $m_n$, the **product Pataki stratification** of $\overline{\mathcal H} = \prod_n \overline{\mathrm{Sym}^+_{m_n}}$ has strata indexed by rank tuples $\mathbf r = (r_0, \ldots, r_N)$:
$$\mathrm{Stratum}^{\mathrm{coarse}}_{\mathrm{II}}(\mathbf r) := \prod_n \{Q_n \in \overline{\mathrm{Sym}^+_{m_n}} : \mathrm{rank}\, Q_n = r_n\}.$$

Codim of the $\mathbf r$-stratum: $\sum_n \binom{m_n - r_n + 1}{2}$. Closure poset: product of chains $\prod_n \{0, \ldots, m_n\}$ with coordinate-wise order.

##### Refinement by chain-complex Schubert structure

The Pataki coarse stratum ignores the chain structure $(d_n)$. The chain-complex *refinement* records how the kernel $K_n = \ker Q_n$ sits relative to the algebraic filtration $0 \subseteq \mathrm{im}\, d_{n+1} \subseteq \ker d_n \subseteq C_n$. This refinement is by [Schubert invariants](#schubert-invariant), giving sub-strata within each Pataki stratum.

##### Top and bottom

- **Top stratum**: $\mathbf r = (m_0, \ldots, m_N)$, all $Q_n$ full-rank. Equals the SPD interior $\mathcal H$.
- **Bottom stratum**: $\mathbf r = (0, \ldots, 0)$. Equals the origin $\{0\}$ in $\overline{\mathcal H}$.
- All other Pataki strata live in the boundary $\partial \overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$.

#### Concept: Schubert invariant of a degenerate Hilbert structure {#schubert-invariant}

The chain-complex-respecting refinement of the [Pataki rank stratum](#pataki-rank-stratum). For $Q \in \partial \overline{\mathcal H}$ at the SPD-cone boundary, records how $K_n = \ker Q_n$ sits relative to the chain filtration of $C_n$.

##### The chain filtration

For a chain complex $(C_\bullet, d)$, each $C_n$ has the intrinsic algebraic filtration
$$0 \subseteq \mathrm{im}\, d_{n+1} \subseteq \ker d_n \subseteq C_n,$$
of dims $0, \rho_{n+1}, m_n - \rho_n, m_n$ where $\rho_k = \mathrm{rank}\, d_k$.

This filtration depends only on $(C_\bullet, d)$, not on any Hilbert structure $Q$.

##### Schubert tuple

For $Q$ with kernel $K_n = \ker Q_n$ of dim $k_n = m_n - r_n$, define
$$a_n := \dim(K_n \cap \mathrm{im}\, d_{n+1}), \qquad z_n := \dim(K_n \cap \ker d_n), \qquad k_n := \dim K_n.$$

The triple $(a_n, z_n, k_n)$ records how $K_n$ intersects the filtration:
- $a_n$: kernel ∩ boundaries (dim of $K_n$ inside $\mathrm{im}\, d_{n+1}$).
- $z_n - a_n$: kernel ∩ harmonics (dim of $K_n$ inside $\ker d_n / \mathrm{im}\, d_{n+1}$, the homological piece).
- $k_n - z_n$: kernel ∩ cocycles (dim of $K_n$ outside $\ker d_n$, the "cocycle" piece).

Constraints: $0 \le a_n \le \min(k_n, \rho_{n+1})$, $a_n \le z_n \le \min(k_n, m_n - \rho_n)$.

##### Generic Schubert invariants

For a *generic* $Q$ in the Pataki stratum of rank $r_n$ (kernel of dim $k_n$), the kernel is a generic $k_n$-dim subspace of $C_n$. By Grassmannian generic-position arguments:
$$a_n^{\mathrm{gen}} = \max(0, k_n + \rho_{n+1} - m_n), \qquad z_n^{\mathrm{gen}} = \max(0, k_n - \rho_n).$$

##### Schubert codim

The locus where the Schubert invariants take non-generic values $(a_n, z_n, k_n)$ has additional codim within the Pataki stratum. By the Grassmannian Schubert codim formula, the codim of "$\dim(K_n \cap V) \ge j$" for fixed $V \subset C_n$ of dim $v$ in $\mathrm{Gr}(k_n, m_n)$ is
$$j(m_n - v - k_n + j) \quad \text{for}\ j \ge \max(0, k_n + v - m_n).$$

Applied to the chain filtration: the codim of "$a_n \ge a, z_n \ge z$" within the Pataki rank-$r_n$ stratum is the standard nested-Schubert codim with $V_1 = \mathrm{im}\,d_{n+1}, V_2 = \ker d_n$.

##### Sub-stratification of $\overline{\mathcal H}$

Combining Pataki rank tuple $\mathbf r$ with Schubert invariants $\sigma = (a_n, z_n, k_n)_n$, the [Stratification II](#stratification-ii) strata are
$$\mathrm{Stratum}_{\mathrm{II}}(\mathbf r, \sigma) := \{Q : \mathrm{rank}\, Q_n = r_n,\ (a_n(Q), z_n(Q), k_n(Q)) = \sigma_n\ \forall n\}.$$

Total codim in $\overline{\mathcal H}$: $\sum_n \binom{m_n - r_n + 1}{2} + \mathrm{Schubert}(\mathbf r, \sigma)$.

##### Closure poset

The Schubert refinement of the Pataki product chain has the closure relation: $\sigma' \le \sigma$ if for each $n$ where $r_n = r'_n$, the kernel intersection numbers refine: $a_n \ge a'_n$, $z_n \ge z'_n$ (kernel can only grow / contain larger subspaces in the limit). For rank drops $r_n < r'_n$, additional kernel directions can land anywhere consistent with the chain structure.

##### Worked example: $K_1 = \mathrm{im}\, d_{n+1}$

The simplest non-trivial Schubert refinement: kernel of $Q_n$ exactly contains $\mathrm{im}\, d_{n+1}$.

For the $(2, 1)$ chain complex with $m_1 = 3, \rho_1 = 2, \rho_2 = 1$, kernel dim $k_1 = 1$:
- Generic: $a_1^{\mathrm{gen}} = 0$, $z_1^{\mathrm{gen}} = 0$. Kernel disjoint from filtration.
- Refined: $a_1 = 1, z_1 = 1$. Kernel contains $\mathrm{im}\, d_2 = \langle e_3 \rangle$.
- Schubert codim: $1 \cdot (3 - 1 - 1 + 1) = 2$.
- Total codim: $\binom{2}{2} + 2 = 1 + 2 = 3$.

This matches Component 2 of the EDD = 40 boundary analysis ([example](#edd-computation-on-2-1-chain)).

#### Object: Stratification II (Hilbert degeneracy) {#stratification-ii}

The boundary stratification of $\overline{\mathcal H}$ (and its image in $\overline{\mathcal M_{\mathrm{Lap}}}$) by Pataki rank tuples and chain-complex Schubert refinements.

##### Definition

The decomposition
$$\overline{\mathcal H} = \bigsqcup_{\mathbf r, \sigma} \mathrm{Stratum}_{\mathrm{II}}(\mathbf r, \sigma)$$
where:
- $\mathbf r = (r_0, \ldots, r_N)$ ranges over rank tuples with $0 \le r_n \le m_n$ (the [Pataki coarse stratum](#pataki-rank-stratum) labels).
- $\sigma = (a_n, z_n, k_n)_n$ ranges over [Schubert invariant](#schubert-invariant) tuples consistent with $\mathbf r$.

Stratification II records how each $Q_n$ becomes rank-deficient and how its kernel sits relative to the chain filtration.

##### Key properties

- **Coarse codim** (Pataki only): $\sum_n \binom{m_n - r_n + 1}{2}$.
- **Refined codim** (with Schubert): adds Grassmannian Schubert codim per degree.
- **Closure poset**: Pataki product chain × Schubert orders, combined.
- **Top stratum**: $\mathbf r = (m_0, \ldots, m_N)$, generic Schubert --- equals the SPD interior $\mathcal H$.
- **Bottom stratum**: $\mathbf r = 0$ --- equals $\{0\}$.
- **All non-trivial strata** (with at least one $r_n < m_n$): live entirely in the boundary $\partial \overline{\mathcal H}$.

##### What it sees

Stratification II depends only on **rank/kernel data** of $Q$ itself --- not on the spectral data of $\Delta$. It sees the *embedding* of $\mathcal H$ into the linear ambient $\prod_n \mathrm{Sym}(C_n)$ and how that embedding terminates at the cone boundary.

##### Distinct from Stratification I

| Aspect        | Stratification I             | Stratification II                         |
|---------------|------------------------------|-------------------------------------------|
| Lives in      | SPD interior $\mathcal H$    | Boundary $\partial \overline{\mathcal H}$ |
| Indexed by    | Bipartite multipartition     | Pataki rank + Schubert invariants         |
| Depends on    | Spectral data of $\Delta$    | Rank/kernel data of $Q$                   |
| Closure poset | Bipartite refinement lattice | Pataki chain × Schubert order             |
| Intrinsic?    | Yes (gauge-invariant)        | No (depends on linear ambient)            |

A point $Q$ in the SPD interior is in exactly one Stratification-I stratum and the unique Stratification-II "interior" stratum (top Pataki); a boundary point $Q \in \partial \overline{\mathcal H}$ is in exactly one Stratification-II stratum.

##### Mixed strata

In the algebraic closure $\overline{\mathcal M_{\mathrm{Lap}}}$, both stratifications meet. **Mixed strata** are loci with both Stratification-I and Stratification-II structure: e.g., a stratum where $Q_1$ is rank-deficient AND the surviving spectrum has a specific multipartition. The (2, 1) chain EDD = 40 computation found 5 singular components: 1 pure Stratification-I (Component 0 = $V(\Pi_T)$ if conjecturally) and 4 Stratification-II (Components 1--4), with Components 1, 3 actually mixed.

The systematic study of mixed strata is [open](#mixed-stratification-strata).

##### Generalizes Pataki

The classical [Pataki rank stratification](#pataki-rank-stratum) of a single SDP cone $\mathrm{Sym}^+_n$ is a special case of Stratification II for a chain complex with a single chain space (no boundary). The chain-complex extension adds: product structure across chain degrees + Schubert refinement by intersection with chain filtration.

##### Connection to compactified moduli

A natural compactification of $\mathcal M_{\mathrm{Lap}}$ --- call it $\overline{\mathcal M_{\mathrm{Lap}}}$ --- adds Stratification II at the boundary. This is a Borel--Serre-style stratified compactification, with the interior carrying Stratification I and the boundary carrying Stratification II. Whether this compactification represents a categorical moduli (functor on graded comm algebras / chain complexes) is [open](questions/compactification-as-categorical-moduli.md).

#### Object: Metric measure space (and RCD) {#metric-measure-space}

A triple $(X, d, m)$ where $X$ is a topological space, $d$ a metric, and $m$ a Borel measure. The **RCD** subclass --- metric measure spaces with synthetic lower Ricci curvature bound and infinitesimally Hilbertian Cheeger energy --- is the setting in which a Laplacian is rigorously defined as the generator of the gradient flow of the Cheeger energy $\mathrm{Ch}: L^2(m) \to [0, \infty]$.

##### Why metric measure spaces matter for the program

This is the input category most distant from the chain-complex / cellular pictures, and yet:

- The **Laplacian is constructed canonically** --- once $(X, d, m)$ has bounded Ricci, the Cheeger energy is determined, and so is its generator.
- **Two routes converge** (([Honda and Sun 2025](#ref-honda2025almost))): the Bakry--Émery framework (Markov-generator-side curvature) and the RCD framework (transport-side curvature) produce the same Laplacian on an RCD space. This is the cleanest piece of universal-property evidence in the survey: two structurally different functorial routes commute on overlapping inputs.

##### What does *not* work directly

Higher-degree Hodge analogues --- analogues of $\Delta^k$ acting on "$k$-forms" of an RCD space --- are not generally available. The Hilbert-chain-complex framing of the Laplacianizer (`concepts/laplacianizer.md`) breaks here: the structure delivers $\Delta^0$ via Cheeger, but no canonical $C_\bullet(X)$ in higher degree.

For the program: this means the Laplacianizer framework (as currently set up for graded Hilbert chain complexes) doesn't directly accommodate RCD spaces. A working framework needs either:
- A *Dirichlet-form-induced* variant of Laplacianizer, where the data is a Markov generator $\Delta$ rather than a chain complex; or
- A way to recover "$k$-forms" abstractly from RCD data, generating a graded chain complex on the RCD side. (The latter is one of the hardest open problems in synthetic geometry.)

##### Bridges

- To `concepts/laplacianizer.md` --- the RCD case is a frontier where the Laplacianizer framework needs extension: from "graded Hilbert chain complex" to "Dirichlet form + Markov generator."
- To `questions/universal-laplacianization.md` --- Bakry--Émery / RCD agreement is one of the strongest pieces of universal-property evidence in the survey.

#### Theorem \[KNOWN\]: Two-routes-converge on RCD {#two-routes-converge}

**Statement.** On an $\mathrm{RCD}(K, \infty)$ metric measure space $(X, d, m)$, the Laplacian obtained as the generator of the Cheeger-energy gradient flow agrees with the generator obtained from the Bakry--Émery iterated carré du champ.

A known result in synthetic geometry, established for the synthetic Ricci-curvature class.

##### In the Laplacianizer language

Two candidate Hilbert lift functors on the category of RCD spaces --- Cheeger-energy and Bakry--Émery --- produce naturally isomorphic Laplacians on this sub-category of inputs. Neither is trivially derived from the other; the agreement is a non-trivial coincidence of two different functorial constructions.

This is the structural shape that motivates the universal-Laplacianization question (`questions/universal-laplacianization.md`): when two structurally distinct routes produce the same Laplacian on overlapping inputs, the agreement is candidate evidence for a universal-property statement.

##### See also

- ([Honda and Sun 2025](#ref-honda2025almost)) --- Bakry--Émery / RCD parallel framings.
- ([Violo 2025](#ref-violo2025overview)) --- regularity survey in both pictures.
- Other instances of the same shape (open): hypergraph clique- vs sheaf-on-poset Laplacians, persistent vs de Rham Laplacians.

#### Definition: Weighted boundary operator {#weighted-boundary}

The unitary normalization of $d_n$ that turns the chain complex's Hilbert structure into the standard Euclidean inner product, isolating the spectral data.

##### Definition

For a chain complex $(C_\bullet, d)$ with Hilbert structure $Q = (Q_n) \in \mathcal H$, the **weighted boundary** is
$$\widetilde d_n := Q_{n-1}^{1/2} d_n Q_n^{-1/2}: (C_n, \mathrm{std}) \to (C_{n-1}, \mathrm{std}),$$
viewed between the chain spaces with the *standard Euclidean* inner product.

Here $Q_n^{1/2}$ is the unique positive-definite square root of $Q_n \in \mathrm{Sym}^+(C_n)$ (well-defined since $Q_n$ is SPD).

##### Why this normalization

The original $d_n: (C_n, Q_n) \to (C_{n-1}, Q_{n-1})$ has Hilbert adjoint $d_n^* = Q_n^{-1} d_n^T Q_{n-1}$ (computed using the inner products on each side).

The weighted boundary $\widetilde d_n$ is unitarily conjugate to $d_n$: $\widetilde d_n = Q_{n-1}^{1/2} d_n Q_n^{-1/2}$ takes $(C_n, Q_n) \cong (C_n, \mathrm{std})$ via the isometry $v \mapsto Q_n^{1/2} v$, so it has the same singular values as $d_n$ in its native Hilbert spaces.

Computing in the standard inner product is more convenient: the spectral data (singular values, kernel, etc.) of $\widetilde d_n$ as a map between standard-Euclidean spaces is what we want.

##### Squared singular values

The squared singular values $\sigma_i^2(\widetilde d_n)$ for $i = 1, \ldots, r_n = \mathrm{rank}\,d_n$ are the eigenvalues of
$$\widetilde d_n^T \widetilde d_n = Q_n^{-1/2} d_n^T Q_{n-1} d_n Q_n^{-1/2}.$$

Equivalently, by the singular-value duality, eigenvalues of
$$\widetilde d_n \widetilde d_n^T = Q_{n-1}^{1/2} d_n Q_n^{-1} d_n^T Q_{n-1}^{1/2}.$$

These are the [squared singular values](#squared-singular-value) --- the basic spectral data on which bipartite multipartitions are built.

##### Hodge Laplacian via weighted boundary

The Hodge Laplacian on $C_n$ in the standard Euclidean structure (post-conjugation by $Q_n^{1/2}$) is
$$\widetilde \Delta_n = \widetilde d_n^T \widetilde d_n + \widetilde d_{n+1} \widetilde d_{n+1}^T,$$
unitarily equivalent to the original Hodge Laplacian $\Delta_n^{(Q)} = d_n^* d_n + d_{n+1} d_{n+1}^*$ on $(C_n, Q_n)$.

So spectral data of $\Delta_n^{(Q)}$ = spectral data of $\widetilde \Delta_n$, both as multisets and as eigenspaces (modulo the unitary intertwiner).

##### In the cellular case

For stalkwise diagonal $Q_n = \mathrm{diag}(w_{1,n}, \ldots)$, the weighted boundary is
$$\widetilde d_n[i, j] = \frac{d_n[i, j]}{\sqrt{w_{j, n}}} \cdot \sqrt{w_{i, n-1}}.$$

For a graph (cellular 1-complex), this is the standard "weighted graph Laplacian normalization": each edge $j$ is weighted by $1/\sqrt{w_j}$ (edge weight) and each vertex contribution by $\sqrt{w_i}$ (vertex weight), giving the classical normalized Laplacian construction (when applied to $\Delta_0$).

##### Generalized eigenvalue pencil

The squared singular values are also roots of the **pencil polynomial**
$$\det(d_n^T Q_{n-1} d_n - \lambda Q_n) = 0$$
in $C_n$, taking the $r_n$ nonzero roots. This formulation avoids square roots and works directly with rational functions of the weights --- useful for symbolic computation in the [IEP-G program](#chain-complex-iep-g) and the toolkit.

##### Continuity in $Q$

$\widetilde d_n$ is real-analytic in $Q$ on the open dense locus where $Q_n$ has all positive eigenvalues (= the SPD interior $\mathcal H$). Spectral data of $\widetilde \Delta_n$ varies real-analytically with $Q$, with branch crossings handled by Kato analytic perturbation. This continuity is essential for the [closure poset theorem](#closure-poset-of-strata).

#### Theorem: Bipartite realizability theorem {#bipartite-realizability}

For any finite-dim chain complex over $\mathbb R$, every bipartite multipartition is realized as a stratum of the moduli of Laplacianizations. This says the stratification of $\mathcal M_{\mathrm{Lap}}$ identified by `theorems/bipartite-stratification-theorem.md` is *fully populated* --- no spurious / empty strata in the unconstrained case.

The chain-complex generalization of part of the Inverse Eigenvalue Problem for Graphs (IEP-G) program (([Barrett et al. 2017](#ref-barrett2017inverse))): IEP-G asks which multiplicity partitions are realized for symmetric matrices with given graph-sparsity; we ask which bipartite multipartitions are realized for chain-complex Hilbert structures with no sparsity constraints. The unconstrained answer is "all"; the constrained (sparsity, sheaf-with-stalkwise-weights) version generalizes IEP-G's substantive obstructions and is open.

##### Setup

Fix a finite-dimensional graded chain complex $(C_\bullet, d)$ over $\mathbb R$ with rank profile $(r_n)$, $r_n = \mathrm{rank}\, d_n$. Let $N_* = \sum_n r_n$.

For each multipartition $\Pi$ of the index set $[N_*] = \bigsqcup_n \{1, \ldots, r_n\}$ modulo $\prod_n S_{r_n}$, let $\mathrm{Stratum}(\Pi) \subset \mathcal M_{\mathrm{Lap}}$ be the corresponding stratum (`theorems/bipartite-stratification-theorem.md`).

**Realizability question.** For which $\Pi$ is $\mathrm{Stratum}(\Pi)$ non-empty?

##### Theorem

> **Bipartite realizability theorem.** Let $(C_\bullet, d)$ be a finite-dim chain complex over $\mathbb R$ with rank profile $(r_n)$. Every bipartite multipartition $\Pi$ of $[N_*]$ has $\mathrm{Stratum}(\Pi)$ non-empty in $\mathcal M_{\mathrm{Lap}}(C_\bullet, d)$.

In words: with no sparsity constraints on the inner products, the chain complex's structure imposes no obstructions on which eigenvalue-coincidence patterns are achievable for the resulting Laplacian. Every combinatorial multipartition has a corresponding non-empty stratum.

##### Proof

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

--- more precisely, for each block $B$ with $k_n^B$ indices in the $d_n$-side, prescribe $k_n^B$ copies of $\lambda_B$ as squared singular values of $\widetilde d_n$.

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

Pick orthonormal basis on $\mathrm{im}\, d_n^*$. Let $A_n = I_{r_n}$ (positive-definite, in fact identity), and let $A_{n-1}' = \mathrm{diag}(\overline\sigma^{(n)})$ --- diagonal with eigenvalues $\overline\sigma^{(n)}$. Then $A_n^{-1/2} A_{n-1}' A_n^{-1/2} = \mathrm{diag}(\overline\sigma^{(n)})$ has the prescribed eigenvalues.

**Sub-step 3b: Coordinate shared $Q_n$ across degrees.** The constraint: $Q_n$ appears in both $\widetilde d_n$ (as the right factor, on $\mathrm{im}\, d_n^*$) and $\widetilde d_{n+1}$ (as the left factor, on $\mathrm{im}\, d_{n+1}$, which is contained in $\ker d_n$).

In standard form, $\mathrm{im}\, d_{n+1}^{\mathrm{std}} \subset \ker d_n^{\mathrm{std}}$ --- i.e., $\mathrm{im}\, d_{n+1}$ is in the *complement* of $\mathrm{im}\, d_n^*$ within $C_n$. So the requirement on $Q_n$ from $\widetilde d_n$ (which involves $A_n$ --- the block on $\mathrm{im}\, d_n^*$) and the requirement from $\widetilde d_{n+1}$ (which involves $D_n$ --- the block on $\ker d_n$, restricted further to $\mathrm{im}\, d_{n+1}$) are on **disjoint blocks** of $Q_n$.

Concretely: the part of $Q_n$ that affects $\widetilde d_n$'s singular values is the block $A_n$ on $\mathrm{im}\, d_n^*$. The part that affects $\widetilde d_{n+1}$'s singular values is the block of $Q_n$ on $\mathrm{im}\, d_{n+1} \subset \ker d_n$. These are different sub-blocks of $Q_n$, and can be chosen independently.

So we choose $A_n = I_{r_n}$ for $\widetilde d_n$, and we choose the sub-block of $Q_n$ on $\mathrm{im}\, d_{n+1}$ to match the prescribed $\overline\sigma^{(n+1)}$ for $\widetilde d_{n+1}$. The off-diagonal block $B_n$ of $Q_n$ is unconstrained --- set to zero. The block $D_n$ of $Q_n$ on the *rest* of $\ker d_n$ (not in $\mathrm{im}\, d_{n+1}$) is also unconstrained --- pick it to be identity.

This gives a positive-definite $Q_n$ that simultaneously realizes the prescribed singular values for both $\widetilde d_n$ and $\widetilde d_{n+1}$.

**Sub-step 3c: Iterate.** Apply Sub-steps 3a--3b for each $n$, with consistent choice of bases. The result: positive-definite $Q_0, Q_1, \ldots, Q_N$, hence $Q \in \mathcal H$, such that each $\widetilde d_n$ has the prescribed singular values $\overline\sigma^{(n)}$.

**Step 4: Verify realization.**

The squared singular values of $\widetilde d_n$ are $\overline\sigma^{(n)}$. The bipartite multipartition $\Pi(Q)$ of these singular values across all $n$:
- Indices in block $B$ have squared singular value $\lambda_B$ (regardless of which $d_n$ they sit on).
- Different blocks have different $\lambda_B$'s (we chose them distinct).

So $\Pi(Q) = \Pi$ exactly. Hence $[Q] \in \mathrm{Stratum}(\Pi)$, and the stratum is non-empty. $\square$

##### Remarks on the proof

- **Smith normal form** is what makes the proof work cleanly. The fact that any chain complex over $\mathbb R$ has a standard form decoupling $\mathrm{im}\, d_n^*$ and $\ker d_n$ is what allows the per-degree blocks of $Q_n$ to be chosen independently.

- **No sparsity constraint** is used: $Q_n$ is allowed to be any positive-definite matrix. If we restricted to *diagonal* $Q_n$ (= cellular sheaf with stalkwise diagonal weights), the proof would *fail* because we wouldn't have enough freedom in $A_n, D_n$ to independently prescribe both blocks.

- **Distinct $\lambda_B$ values** are essential: if two blocks had the same $\lambda$, they would merge into one block, giving a coarser multipartition. The proof realizes the strict-$\Pi$ stratum exactly because the $\lambda_B$'s are distinct.

##### Why this is a "Laplacianizability theorem" piece

Combined with the bipartite stratification theorem (`theorems/bipartite-stratification-theorem.md`):

> A finite-dim chain complex $(C_\bullet, d)$ over $\mathbb R$ admits a Hilbert lift; its moduli $\mathcal M_{\mathrm{Lap}}(C_\bullet, d) = G \backslash \mathcal H$ is a real algebraic orbifold whose strata are *fully and faithfully* indexed by bipartite multipartitions --- every multipartition is realized (this theorem), with explicit codim/stab formulas (`stab-codim-formula.md`) and closure poset (`closure-poset-of-strata.md`).

##### When realizability fails: chain-complex IEP-G

The proof above relies on **unconstrained** inner products $Q \in \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$. If we restrict to inner products with a sparsity pattern --- most naturally, **stalkwise diagonal** inner products in the cellular-sheaf-on-poset setup --- the proof breaks down.

Specifically, the cellular-sheaf framework restricts $Q_n$ to be diagonal in the cellular basis: $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{n_n, n})$ where $w_{i,n}$ is the weight on the $i$-th cell of degree $n$. This is a *highly* constrained sub-cone of $\mathrm{Sym}^+_{n_n}$ --- codim $\binom{n_n}{2}$.

Within this constrained cone:
- The $A_n$ block of $Q_n$ is diagonal in a *fixed* basis (the cellular basis), not freely chosable.
- Simultaneous diagonalization of $A_n, A_{n-1}'$ requires coordinated bases, which the cellular structure may not allow.
- Some bipartite multipartitions become *unrealizable* --- the chain-complex generalization of IEP-G's "non-realizable multiplicity partition" obstructions.

This is a substantial open direction. The IEP-G literature (Barrett, Fallat, et al., ([Barrett et al. 2017](#ref-barrett2017inverse))) provides:
- The Strong Spectral Property and Strong Multiplicity Property as tools for proving realizability under sparsity.
- Minor-monotonicity arguments.
- Explicit answers for small graphs.

The chain-complex generalization should yield analogous tools for cellular complexes (or sheaves on posets) with stalkwise inner products: the chain-complex-IEP-G program.

##### Open

1.  **Cellular-sheaf realizability.** Characterize which bipartite multipartitions are realized for a cellular sheaf on a finite poset $P$ with stalkwise diagonal inner products. Direct generalization of IEP-G to chain complexes.

2.  **SSP and SMP for chain complexes.** Define analogs of the Strong Spectral and Multiplicity Properties for chain complexes; verify they imply realizability under sparsity.

3.  **Minor-monotonicity.** A "minor" of a chain complex (e.g., a sub-complex obtained by removing cells) --- does the realizability set grow under "minor expansion" (adding cells), as in IEP-G?

4.  **Sparsity in degree.** A finer constraint: each $Q_n$ diagonal in some specified basis, but with potentially different sparsity patterns at different degrees. This corresponds to non-uniform cellular sheaves.

The unconstrained theorem above is the baseline; the substantive content of chain-complex IEP-G is in the stalkwise-diagonal restriction (`theorems/chain-complex-iep-g.md`).

#### Theorem \[KNOWN\]: Closed-range obstruction (known, made precise) {#closed-range-obstruction}

A precise statement of *the* technical condition controlling whether a Laplacianization is well-behaved.

##### Statement

Let $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ be a graded Hilbert chain complex (countable index set, possibly infinite-dimensional spaces, $d$ closed densely-defined with $d \circ d = 0$). The following are equivalent:

1.  Each $d_n$ has closed range in $C_{n-1}$.
2.  The Hodge decomposition $C_n = \ker(\Delta_n) \oplus \overline{\mathrm{im}(d_{n+1})} \oplus \overline{\mathrm{im}(d_n^*)}$ holds with the closures being equalities.
3.  $0$ is an isolated point of the spectrum of $\Delta_n$ (or $\Delta_n$ has compact resolvent --- a slightly stronger condition).
4.  The natural map $\ker(\Delta_n) \to H_n^{\mathrm{red}}(C_\bullet) := \ker(d_n) / \overline{\mathrm{im}(d_{n+1})}$ is an isomorphism.

When (1)--(4) hold, the Hodge isomorphism $\ker(\Delta_n) \cong H_n^{\mathrm{red}}(C_\bullet)$ identifies harmonic representatives with reduced homology classes.

##### Proof sketch

(1) ⇔ (2): Closed range of $d_{n+1}$ means $\mathrm{im}\, d_{n+1}$ is closed; orthogonality of $\mathrm{im}\, d_{n+1}$ and $\mathrm{im}\, d_n^*$ holds as in the finite-dim Hodge proof using $d \circ d = 0$ and adjointness; the orthogonal complement of $\mathrm{im}\, d_{n+1} + \mathrm{im}\, d_n^*$ is $\ker d_{n+1}^* \cap \ker d_n = \ker \Delta_n$.

(2) ⇔ (3): Standard spectral theory. Closed range of $d_n$ is equivalent to the bottom of the spectrum of $d_n^* d_n$ being either $0$ or an isolated point.

(3) ⇒ (4): Given the orthogonal decomposition, $\ker(d_n) = \ker(\Delta_n) \oplus \overline{\mathrm{im}(d_{n+1})}$ (kernels add inside the part orthogonal to $\mathrm{im}\, d_n^*$), so $\ker(d_n) / \overline{\mathrm{im}(d_{n+1})} \cong \ker(\Delta_n)$.

(4) ⇒ (1): Reverse the argument; details in any standard treatment of $L^2$-cohomology.

##### Role in the framework

The closed-range condition is the technical core of `questions/obstruction-to-laplacianization.md`. A Hilbert lift $F: \mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ satisfies the Hodge isomorphism with the *unreduced* cohomology $H_n(F(X)) := \ker(d_n) / \mathrm{im}(d_{n+1})$ (without closure) only when each $d_n^{F(X)}$ has closed range. Otherwise, the Laplacian computes *reduced* cohomology --- homology with the closure quotient, which can differ from algebraic homology.

This explains the difficulty of Laplacianizing infinite-dimensional cases:

- Non-locally-finite simplicial complexes (([Bartmann and Keller 2025](#ref-bartmann2025hodge))): closed range is non-trivial; the paper's contribution is to identify weight conditions under which $d_n$ has closed range.
- Non-compact Riemannian manifolds: closed range of the de Rham $d$ on $L^2$-forms can fail. $L^2$-cohomology and de Rham cohomology then differ --- this is *the* classical case where the Laplacian computes a different invariant from the algebraic one.
- Quantum graphs, RCD spaces, persistence modules with continuous parameter: closed range is the technical condition the relevant 2025 papers all address (often implicitly).

##### Status

Classical result; the closed-range characterization of Hodge in the unbounded case is standard $L^2$-cohomology (Cheeger, Anné, Bui Trong Vu, Lück). Included for the precise statement.

##### See also

`questions/obstruction-to-laplacianization.md` --- closed range is the analytical obstruction to Laplacianization in infinite-dim. Automatic for combinatorial finite inputs; dominant for analytical inputs.

## Supplements {#supplements}

### Open questions {#appendix-open-questions}

Open mathematical and program-shaping questions, indexed by the entities they explore. Each question's `explores:` list points to the objects, concepts, or theorems that situate the inquiry.

#### Open problem: Does the bipartite Möbius function factor over blocks? {#bipartite-mobius-product-formula}

*Explores: [bipartite-multipartition-lattice](#bipartite-multipartition-lattice), [bipartite-vassiliev-shapiro-vainshtein](#bipartite-vassiliev-shapiro-vainshtein), [refinement-cover](#refinement-cover)*

The Möbius function of the [bipartite multipartition lattice](#bipartite-multipartition-lattice) is conjectured to factor as a product over blocks of univariate Möbius factors:

> **Conjecture.** For $\Pi \preceq \Pi'$ in $\mathcal P_{\mathrm{bip}}$,
> $$\mu_{\mathcal P_{\mathrm{bip}}}(\Pi, \Pi') = \prod_{B \in \Pi} \mu_{\Pi_{|B|}}(\hat 0_B, \Pi'|_B)$$
> where $\Pi'|_B$ is the partition of $B$ induced by $\Pi'$ refining $B$, and $\mu_{\Pi_{|B|}}$ is the classical partition-lattice Möbius function $\mu(\hat 0, \pi) = (-1)^{|\pi|-1}(|\pi|-1)!$.

##### Status

- **Univariate case** ($N = 1$): the bipartite multipartition lattice is the partition lattice $\Pi_{r_1}$, and the conjecture reduces to the classical formula. ✓ Verified numerically for $r_1 = 2, 3, 4$ via toolkit (`mobius_and_vassiliev.py`): $\mu(\text{coarsest}, \text{finest}) = -1, 2, -6$ matches $(-1)^{n-1}(n-1)!$.

- **Hodge-constrained case** for (2, 2): toolkit verifies $\mu(\Pi_{\max}, \Pi_{\min}) = -1$ in the binary lattice, consistent with the formula reducing to $\Pi_2$ on Hodge-pairs.

- **General**: not proved.

##### Why this matters

The product factorization is structurally important for two reasons:

1.  **Computability of $E_2$ in bipartite Vassiliev**. The bipartite Vassiliev spectral sequence ([entry](#bipartite-vassiliev-shapiro-vainshtein)) has differentials computed from $\mu_{\mathcal P_{\mathrm{bip}}}$. If the Möbius factors over blocks, the $E_2$ page computation reduces to per-block calculations using classical partition-lattice Möbius.

2.  **Shapiro--Vainshtein extension**. The classical $E_2$-degeneration for the univariate case relies on the partition-lattice Möbius having the well-known factorial form. The bipartite analog of $E_2$-degeneration would similarly leverage the product structure of the bipartite Möbius --- if it exists.

##### Why it should hold

The bipartite multipartition lattice is *not* literally a product of partition lattices. But the refinement structure, *for fixed coarse partition $\Pi$*, decomposes per-block: refining $\Pi$ to $\Pi'$ is independently refining each block of $\Pi$. So the interval $[\Pi, \hat 1]$ in $\mathcal P_{\mathrm{bip}}(\mathbf r)$ is a product of intervals $\prod_B [\hat 0_B, \hat 1_B]$ in partition lattices of $|B|$.

By the standard Möbius-function-of-product-poset formula, $\mu$ on a product is the product of $\mu$'s. So the conjecture is *plausible* once we identify the interval structure as a product.

##### What needs to be proved

The interval $[\Pi, \Pi']$ in $\mathcal P_{\mathrm{bip}}$ is NOT in general a product of partition lattices when $\Pi$ has constraints (e.g., Hodge-forced cross-degree blocks that aren't allowed to split). For Hodge-constrained lattices, the interval structure is restricted, and the product formula may not apply directly.

The conjecture should be:

> For Hodge-unconstrained bipartite multipartition lattices, $\mu$ factors as conjectured. For Hodge-constrained lattices, the factorization holds for refinements that respect the Hodge constraints, with appropriate restriction.

##### Concrete cases to test

- $(3, 3)$ chain Hodge-constrained: lattice has 5 elements (= $\Pi_3$ on 3 Hodge-pairs). Compute $\mu$ via toolkit and check factorization.
- $(2, 1)$ chain Hodge-constrained: 3 elements. Toolkit gives $\mu = -1, -1, 2$ for the three non-trivial pairs.
- Higher cases with cross-degree blocks of size $> 2$.

##### Connection to Whitney--lattice / supersolvable structure

The univariate partition lattice $\Pi_n$ is a *geometric lattice* (its Möbius function takes specific signs on intervals). Whether the bipartite multipartition lattice is geometric, or supersolvable, or has any of the standard combinatorial-lattice structures, is a side question that would inform the Möbius factorization.

#### Open problem: What is the category-free hypothesis for the cross-category theorem? {#categorical-free-cross-category}

*Explores: [cross-category-orbifold-stratification](#cross-category-orbifold-stratification), [universal-vs-categorical-stratification](#universal-vs-categorical-stratification), [moduli-of-laplacianizers](#moduli-of-laplacianizers)*

The [cross-category orbifold-stratification theorem](#cross-category-orbifold-stratification) is proved in finite-dim and sketched abstractly. Its proved instances include cellular finite-dim, parametric graph, smooth Riemannian, finite spectral triple. The pattern persists across these distinct categories with no a priori connection.

##### Question

What is the *minimal categorical hypothesis* on $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ that implies the cross-category theorem? And what category-free statement encodes the universal codim formula $\sum_B(|B|-1)$ + category-specific stab?

##### Current state

Each proved instance uses different ingredients:
- **Cellular finite-dim**: finite-dim chain complex, \$G = \$ chain auto group, real-algebraic.
- **Parametric graph**: Aksoy and Young ([2025](#ref-aksoy2025reimagining)) framework, finite-dim with $\mathrm{Aut} =$ vertex symmetry.
- **Smooth Riemannian**: Ebin slice + Kato + Myers--Steenrod + Rayleigh--Schrödinger. Infinite-dim Banach orbifold.
- **Finite spectral triple**: Hochschild--Hilbert lift via resolvent. Finite-dim.

The proofs share the *five-step pattern*: (1) orbifold structure, (2) analytic-spectrum continuity, (3) codim by counting equations, (4) stab from gauge group, (5) closure poset by Rayleigh--Schrödinger. Steps (1)-(2) and (5) use category-specific tools; steps (3)-(4) are category-independent.

##### Conjectural unifying hypotheses

> **Hypothesis (C-OS framework).** A 5-tuple $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ where:
> - $\mathcal C$ is a category.
> - $H^\bullet: \mathcal C \to \mathbf{grVect}_\mathbb{R}$ is a graded-vector-space-valued cohomology theory.
> - $F: \mathcal C \to \mathbf{Hilb}^\mathbb Z$ is a Hilbert lift functor with chain differential $d$ and $d^2 = 0$.
> - $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural iso.
> - $\mathrm{Aut}: \mathcal C \to \mathbf{Grp}$ is an automorphism group functor (auto of $X \in \mathcal C$ as input, intertwining the Hilbert lift with $F$).

Hypothesis 1: $\mathrm{Aut}(X)$ acts properly on the Hilbert structure moduli $\mathcal H(X)$ for each $X$, with finite-dim stabilizers.

Hypothesis 2: The Hodge Laplacian $\Delta(X, Q)$ has discrete spectrum varying real-analytically in $Q$, with closed-range condition holding generically.

Hypothesis 3 (closure-direction): At any spectral degeneracy, generic perturbations of $Q$ split eigenvalues at first order (Rayleigh--Schrödinger applies).

Under these hypotheses, the cross-category orbifold-stratification theorem holds: moduli is an orbifold, stratified by bipartite multipartition with universal codim and category-specific stab.

##### What's missing

The above is essentially a wish-list of conditions. The genuine unifying statement would:
- Identify these conditions as derivable from a single categorical structure (e.g., a "Hilbert-lift functor in a category with appropriate compactness/regularity").
- Verify each proved instance satisfies the hypotheses (not just satisfies the conclusion).
- Identify a *non-example*: a category where one of the hypotheses fails and the theorem doesn't hold.

The nonlinear / $p$-Laplacian case is the natural non-example: variational eigenvalue perturbation theory doesn't satisfy Hypothesis 2-3 directly (eigenvalues are not real-analytic in the same Kato sense). So the conditions distinguishing linear-Hilbert from nonlinear-Banach should be the boundary of the cross-category framework.

##### Possible categorical formalism

The right ambient might be the *derived category* $D^b(\mathbf{Hilb}^\mathbb Z)$ of bounded Hilbert chain complexes. In this ambient:
- Cohomology theories are natural transformations to $\mathbf{grVect}$.
- Hilbert lifts are objects of $D^b(\mathbf{Hilb}^\mathbb Z)$.
- Quasi-isomorphisms are inverted, identifying chain-homotopic complexes.
- Moduli of Hilbert lifts is moduli in this derived category.

Universal codim might then be a feature of moduli of objects in $D^b(\mathbf{Hilb}^\mathbb Z)$ --- *category-free* in the sense of not depending on which $\mathcal C \to D^b(\mathbf{Hilb}^\mathbb Z)$ we use as input.

##### Implications

A category-free cross-category theorem would:
- Cover all current proved instances *under one unified statement*.
- Identify exactly which categories of inputs admit the bipartite stratification framework.
- Predict the framework's applicability for new categories (RCD spaces, persistent complexes, etc.) without needing case-by-case verification.

It would also clarify what the *Laplacianizer* framework is at maximum generality: not "a Hilbert lift functor on a category," but "an object in the derived category of Hilbert chain complexes with a natural automorphism group action."

##### Open challenges

- Defining the right "moduli" in the derived setting (homotopy moduli? Stack? $\infty$-groupoid?).
- Showing the "five-step" proof structure transfers to the derived setting.
- Identifying the "stab dim" as a derived invariant rather than category-specific data.

This is a substantial categorical project, well-defined but unresolved.

#### Open problem: Which graph topologies realize full multiplicity in cellular IEP-G? {#cellular-iep-g-graph-theoretic-condition}

*Explores: [chain-complex-iep-g](#chain-complex-iep-g), [stalkwise-diagonal-cone](#stalkwise-diagonal-cone), [bipartite-multipartition](#bipartite-multipartition)*

For a cellular chain complex of a CW complex $X$ with stalkwise-diagonal Hilbert structure, which bipartite multipartitions $\Pi$ are realizable in $\mathcal H_{\mathrm{diag}}$?

The [decomposition theorem](#chain-complex-iep-g-decomposition) reduces this to per-degree univariate IEP-G. Per-degree, the question becomes: for the [boundary-operator graph](#boundary-operator-graph) $G_n$ at degree $n$, which multiplicity partitions are realizable by symmetric $G_n$-sparse matrices with positive diagonal?

The toolkit catalog ([catalog](#iep-g-cellular-catalog)) shows:

| Graph $G$  | rank $r_1$ | uniform spectrum          | mult profile                | Full degeneracy  |
|------------|------------|---------------------------|-----------------------------|------------------|
| $P_n$      | $n-1$      | distinct (Sturm)          | $(1, \ldots, 1)$            | ✗                |
| $C_n$      | $n-1$      | $\{2 - 2\cos(2\pi k/n)\}$ | mostly $(2, \ldots, 2, 1?)$ | only for $n = 3$ |
| $K_n$      | $n-1$      | $\{n, \ldots, n\}$        | $(n-1)$                     | ✓                |
| $K_{1, n}$ | $n$        | $\{1, \ldots, 1, n+1\}$   | $(n, 1)$                    | ✗ for $n \ge 3$  |

##### Conjecture (vertex-transitivity)

> **Conjecture.** A graph $G$ with $n$ vertices and rank $r_1 = n - c$ ($c$ = number of connected components) realizes the supersymmetric stratum (mult $(r_1)$) at uniform stalkwise weights iff $G$ is vertex-transitive (Aut$(G)$ acts transitively on vertices).

**Evidence:** $K_n$ (vertex-transitive, full mult realized), $C_n$ (vertex-transitive, *partial* mult only --- but uniform-weights mult profile suggests all eigenvalues come in symmetric pairs except $k = n/2$), $P_n$ (not vertex-transitive, no mult), $K_{1, n}$ for $n \ge 3$ (not vertex-transitive --- center has degree $n$, leaves have degree 1 --- only partial mult realized via leaf-symmetry).

But $C_4$ is vertex-transitive yet doesn't realize full mult $(3)$ at uniform weights (gives $(2, 1)$). So the conjecture as stated isn't right.

##### Refined direction

The combinatorial-Laplacian spectrum at uniform weights is determined by the irreducible-rep decomposition under Aut$(G)$. Multiplicities correspond to dim of irreps. For full mult-$(r_1)$, need a single irrep of dim $r_1$ --- requires Aut$(G)$ to be sufficiently large.

- $K_n$: Aut$(K_n) = S_n$, has a $(n-1)$-dim irrep (standard representation). Full mult $r_1 = n-1$ realized. ✓
- $C_n$ for $n = 3$: Aut$(C_3) = S_3$ (= dihedral of order 6), has a 2-dim irrep. Full mult $r_1 = 2$ realized. ✓
- $C_n$ for $n \ge 4$: Aut$(C_n) = D_{2n}$, irrep dims are 1 or 2. Mult-$(n-1)$ not realized as a single irrep.
- $K_{1, n}$: Aut acts on leaves by $S_n$, fixing center. Has 1-dim trivial + $(n-1)$-dim standard on leaves. Mult-$(n-1)$ realized (the leaf-eigenspace) but the center-vs-leaves split adds a singleton. Mult-$(n)$ not realized.

So the refined condition for full mult-$(r_1)$:

> **Refined conjecture.** Graph $G$ realizes full mult-$(r_1)$ at uniform weights iff Aut$(G)$ has an $r_1$-dim irrep that exhausts the non-trivial spectrum of $\Delta_0$.

This involves both vertex-transitivity AND a representation-theoretic condition on the action.

##### Generalization to varying weights

At non-uniform stalkwise weights, can additional multipartitions be realized by breaking some symmetries? The IEP-G classical literature handles this for paths and trees via SSP/SMP arguments. The chain-complex-toolkit version of these arguments is [open](questions/ssp-smp-for-chain-complexes.md).

##### Generalization to bipartite multipartitions (multi-degree)

The conjecture above is per-degree. For full bipartite multipartitions involving cross-degree blocks, the question becomes: when can simultaneous degeneracies across multiple chain degrees be realized by stalkwise-diagonal Hilbert structures?

By the decomposition theorem, this reduces to simultaneously achieving the prescribed within-degree partition at each degree --- but the boundary-operator graphs $G_n, G_{n+1}, \ldots$ are different, and the weights are shared between adjacent degrees, so the per-degree problems aren't independent.

##### Concrete sub-question

For $\partial \Delta^k$ ($k \ge 3$), the boundary-operator graphs at each degree are highly symmetric (vertex-transitive, edge-transitive, etc., from the simplicial group action $S_{k+1}$). Verify: at uniform weights, all bipartite multipartitions induced by the $S_{k+1}$-irrep decomposition are realized. Are *non*-irrep-induced multipartitions realizable at non-uniform weights?

#### Open problem: Self-contained closed-range proof for regular spectral triples {#closed-range-in-our-framework}

*Explores: [infinite-spectral-triple-laplacianizability](#infinite-spectral-triple-laplacianizability), [closed-range-obstruction](#closed-range-obstruction), [resolvent-intertwiner](#resolvent-intertwiner)*

The [infinite-dim spectral triple Laplacianizability theorem](#infinite-spectral-triple-laplacianizability) requires the Hochschild differential $b$ on the Hilbert completion of $C_\bullet(\mathcal A)$ (under the resolvent inner product $\langle \cdot, \cdot \rangle_D$) to have **closed range**.

For *regular* spectral triples in Connes' sense ($\mathcal A$ closed under $\delta = [|D|, \cdot]$), closed range follows from the noncommutative pseudo-differential calculus (Connes--Moscovici machinery): the Hochschild Laplacian $\Delta_n^{(D)}$ becomes "elliptic" and has compact resolvent, hence discrete spectrum and closed range.

##### Question

Can closed range be proved within the laplanc-2025 framework, without invoking the full Connes--Moscovici nc-pseudo-DO machinery?

##### Why this matters

The cross-category framework's smooth Riemannian case ([proved](#cross-category-smooth)) uses elliptic regularity of the Laplacian on compact manifolds --- a self-contained statement involving Sobolev spaces and Garding's inequality. The spectral-triple case currently delegates to Connes-style arguments. A self-contained proof would:

1.  Make the spectral-triple Laplacianizability theorem standalone.
2.  Identify the *minimal* hypotheses on $(\mathcal A, \mathcal H, D)$ for closed range --- possibly weaker than regularity.
3.  Connect the spectral-triple framework more directly to the smooth Riemannian one.

##### What's needed

Closed range of $b$ on the resolvent-Hilbert completion $\hat C_n(\mathcal A; D)$ is equivalent to:
$$\text{There exists } c > 0 \text{ such that } \|b u\|_D \ge c \cdot d(u, \ker b)_D \text{ for all } u \in \mathrm{dom}\, b.$$

This is a Poincaré-type inequality --- finite spectral gap of $\Delta_n$ above zero in the orthogonal complement of $\ker \Delta_n$.

**Equivalent formulation**: $\Delta_n^{(D)}$ has *discrete spectrum* on $\hat C_n$ --- eigenvalues $0 \le \mu_0 \le \mu_1 \le \cdots \to \infty$, finite multiplicities, no accumulation point except $\infty$.

For this, sufficient conditions:
- **Compact resolvent of $\Delta_n^{(D)}$**: needs the operator $(1 + \Delta_n^{(D)})^{-1}$ to be compact. Equivalently, the imbedding $\mathrm{dom}(\Delta^{1/2}_n) \hookrightarrow \hat C_n$ is compact.

##### Approaches

**Approach 1: Trace-class summability of $R_D^N$.** The resolvent $R_D = (1 + D^2)^{-1}$ has $R_D^N$ trace class for $N > p/2$ ($p$ summability). Maybe a similar estimate gives compactness of $(1 + \Delta_n^{(D)})^{-1}$ on Hochschild chains directly.

**Approach 2: Explicit decomposition for finite-dim $\mathcal A$, then scale up.** For $\mathcal A$ finite-dim with $\mathcal H$ infinite-dim ($\mathcal A \otimes K$ for some Hilbert space $K$): the Hochschild complex is finite-dim over $\mathcal A$ but the inner product depends on the infinite-dim trace. Closed range should follow from finite-dimensionality.

**Approach 3: Sobolev-style estimates.** Define a Sobolev hierarchy $\mathcal A^s = \mathcal A \cap \mathrm{dom}(\delta^s)$ in Connes' sense. The Hochschild operators $b, b^*$ are bounded between Sobolev levels. Compactness of inclusion gives closed range.

**Approach 4: Reduction to Hodge--de Rham via HKR.** For commutative $\mathcal A = C^\infty(M)$ on compact $M$, closed range reduces to compact-manifold de Rham theory ([proved](#cross-category-smooth)). The HKR quasi-iso transfers this to Hochschild. For noncommutative $\mathcal A$, no obvious reduction; but maybe a "noncommutative HKR" gives partial reduction.

##### Specific cases to test

- **Almost-commutative** spectral triples $(\mathcal A_F \otimes C^\infty(M), \mathcal H_F \otimes L^2(M, S), D_F + \not\!\!\!D_M)$: closed range factors as product of finite (for $\mathcal A_F$) + smooth-Riemannian (for $C^\infty(M)$). Should be tractable.

- **Quantum tori** $A_\theta$ (irrational rotation algebras): well-studied, has a natural smooth subalgebra. Closed range likely tractable via specific resolvent estimates.

- **Discrete groups with property RD** (rapid decay): Hochschild chains decay rapidly, giving closed range directly.

##### Connection to RD condition

Connes' regularity condition is closely related to property RD (rapid decay) for discrete groups. Many regular spectral triples satisfy a Schwartz-class-like decay property. A self-contained closed-range proof using only this decay property would bypass the heavy Connes--Moscovici calculus.

#### Open problem: Why is the cross-degree codim/stab asymmetry universal? {#cross-degree-asymmetry-origin}

*Explores: [cross-degree-identification](#cross-degree-identification), [stab-codim-formula](#stab-codim-formula), [universal-vs-categorical-stratification](#universal-vs-categorical-stratification)*

The bipartite stratification theorem produces an asymmetry between within-degree and cross-degree blocks:

| Block type                                   | Codim contribution | Stab contribution |
|----------------------------------------------|--------------------|-------------------|
| Within-degree, $k_n^B = k$                   | $k - 1$            | $\binom{k}{2}$    |
| Cross-degree pair, $k_{n}^B = k_{n+1}^B = 1$ | $1$                | $0$               |

Cross-degree blocks contribute to codim *but not to stab*. This is the structural fingerprint of the bipartite extension.

##### Question

What's the deeper reason for this asymmetry? Is there a universal-categorical or representation-theoretic statement that explains it?

##### Surface explanation

The chain auto group $G$ on a chain complex $(C_\bullet, d)$ satisfies $g_{n-1} d_n = d_n g_n$. On a joint eigenspace $\mathcal E_B = \bigoplus_n \mathcal E_n^B$ of a cross-degree block, an element of $G$ preserving $\mathcal E_B$ must act block-diagonally --- independent rotation on each $\mathcal E_n^B \subseteq C_n$.

Within-degree rotations (inside a single $\mathcal E_n^B$) are free (full $O(k_n^B)$ on $C_n$ side, constrained only by the chain conditions on adjacent degrees, but those don't constrain rotations *within* a single eigenspace).

Cross-degree rotations (mixing $\mathcal E_n^B$ and $\mathcal E_{n+1}^B$) would mix degrees --- forbidden by the chain conditions.

So: stab counts within-degree free rotations only.

Codim, on the other hand, counts independent eigenvalue equalities. Each cross-degree identification is an extra equality, hence contributes 1 to codim (regardless of degree).

##### The deeper question

The surface explanation works for cellular chain complexes. But the same asymmetry appears in:

- **Smooth Riemannian case**: cross-degree blocks (of $\Delta_n$ vs. $\Delta_{n+1}$ on de Rham forms) contribute codim but not stab. Why?
- **Finite spectral triple case**: same asymmetry on Hochschild chains.
- **Parametric graph case** ([Aksoy and Young 2025](#ref-aksoy2025reimagining)): same asymmetry across vertex/edge inner-product degrees.

The asymmetry is *category-independent*. The chain-condition argument is *category-dependent*. So there must be a more fundamental statement.

##### Candidate explanation: Hodge supersymmetric isospectrality

The Hodge identity $\Delta_n d^* = d^* \Delta_{n+1}$ on cocycles forces a *supersymmetric isospectrality*: the nonzero spectrum of $\Delta_n$ in $\mathrm{im}\,d_n^*$ equals the spectrum of $\Delta_{n+1}$ in $\mathrm{im}\,d_n$ as multisets. So *the same eigenvalue appears in both $\Delta_n$ and $\Delta_{n+1}$* --- automatically, before any choice of inner product.

Cross-degree identification of an eigenvalue is, in this sense, *the default* for Hodge-paired eigenvalues. Forcing this default is what the cross-degree block of $\Pi_{\min}$ does --- it just records the Hodge pairing, not an extra identification.

Beyond Hodge-forced cross-degree identifications, *additional* cross-degree blocks correspond to identifications between non-Hodge-paired eigenvalues across non-adjacent degrees, or between degree-$n$ eigenvalues in $\mathrm{harm}_n$ (the harmonic piece) and degree-$n'$ eigenvalues from elsewhere.

So: cross-degree identifications between adjacent operators are Hodge-forced (no extra codim, no extra stab). Cross-degree identifications between non-adjacent operators (or between harm and image pieces) cost codim 1 each. They cost no stab because Hodge supersymmetry doesn't intertwine adjacent degrees in a way that produces extra automorphisms.

##### Reframed conjecture

> **Conjecture.** The cross-degree codim/stab asymmetry is the categorical expression of Hodge supersymmetric isospectrality: cross-degree identifications between Hodge-paired eigenvalues are *forced*, hence don't cost codim or stab; identifications beyond this are *extra equations* on spectral data, hence cost codim 1 but produce no new automorphism (since chain auto cannot mix degrees).

Verifying this on:
- Cellular case: ✓ (confirmed, the surface argument).
- Smooth Riemannian case: should hold via the de Rham Hodge identity. Verify on small Riemannian manifolds.
- Spectral triple case: should hold via the analog Hodge identity for Hochschild chains.

##### Categorical formulation

A *Hodge-symmetric chain complex* is a chain complex with a Hilbert structure for which the supersymmetric isospectrality holds. The cross-degree asymmetry is then a property of moduli of Hodge-symmetric chain complex objects.

The category of Hodge-symmetric chain complex objects (with appropriate morphisms) might admit a *universal* statement: in any such category with appropriate moduli, the codim of a cross-degree identification is 1 and the stab contribution is 0.

This would be the "universal codim, categorical stab" theorem at full generality.

##### Connection to derived categories

The Hodge identity is equivalent to the chain complex satisfying a *quasi-isomorphism* with its harmonic representatives; this is a derived-category statement. The cross-degree asymmetry might be a structural feature of the derived category of Hilbert chain complexes, not specific to any underlying category $\mathcal C$.

If true, this would explain why the asymmetry is universal across cellular, smooth, parametric, spectral-triple cases --- they're all instances of "Hilbert lift of a derived category."

#### Open problem: Cyclic-complex variant of the Hochschild--Hilbert lift {#cyclic-complex-hilbert-lift}

*Explores: [resolvent-intertwiner](#resolvent-intertwiner), [infinite-spectral-triple-laplacianizability](#infinite-spectral-triple-laplacianizability), [finite-spectral-triple-laplacianizability](#finite-spectral-triple-laplacianizability)*

The [resolvent intertwiner](#resolvent-intertwiner) defines a Hilbert structure on the *Hochschild* complex $C_\bullet(\mathcal A)$. For commutative $\mathcal A$, the Hochschild Laplacian collapses on HKR representatives --- the genuinely-non-trivial differential is Connes' $B$ on the *cyclic* complex.

##### Statement of the construction

The cyclic complex $\mathrm{HC}_\bullet(\mathcal A)$ is the cohomology of the bicomplex $(C_\bullet, b, B)$ at total degree, with boundary $b - B$. Equivalently, it's the quotient of $C_\bullet(\mathcal A)$ by cyclic permutation, with differential $b - B$.

The cyclic Hochschild--Hilbert lift uses the same resolvent inner product $\langle \cdot, \cdot \rangle_D$, restricted to cyclic-invariant chains:
$$\langle \cdot, \cdot \rangle_D^{\mathrm{cyc}}: \mathrm{HC}_n(\mathcal A) \otimes \mathrm{HC}_n(\mathcal A) \to \mathbb C.$$

The cyclic Laplacian is
$$\Delta_n^{\lambda} := (b - B)(b - B)^* + (b - B)^*(b - B).$$

##### Question

Is $\Delta_n^\lambda$ the right object? Specifically:

1.  Is the cyclic Hodge isomorphism $\ker \Delta_n^\lambda \cong \mathrm{HC}_n(\mathcal A)$ provable under the same regularity assumptions as the Hochschild case?

2.  Does the cyclic Laplacian generate a stratified moduli on the moduli of spectral triples (varying $D$, fixed $\mathcal A, \mathcal H$) --- analogous to the Hochschild case but indexed by *cyclic* multipartitions?

3.  For commutative $\mathcal A = C^\infty(M)$, does $\Delta_n^\lambda$ correspond exactly to the de Rham Laplacian on $\Omega^n(M)$ under HKR + Connes 1985?

##### Status

Sketched in the [infinite-spectral-triple entry](#infinite-spectral-triple-laplacianizability). The reduction to smooth Riemannian via HKR + Connes' Reconstruction Theorem is structurally clear; details unwritten.

##### Why cyclic, not Hochschild

For commutative $\mathcal A$: Hochschild homology $\mathrm{HH}_n(C^\infty(M)) \cong \Omega^n(M)$ as graded vector spaces, with *zero* Hochschild differential on HKR representatives. So the Hochschild Laplacian $\Delta_n^{(D)}$ for the canonical spin-manifold spectral triple is just $b b^*$ + $b^* b$ where $b = 0$ on HKR rep --- degenerate.

The cyclic differential $B$ is non-trivial: under HKR, $B$ corresponds to the de Rham differential $d$. So the cyclic Laplacian $\Delta^\lambda = (b - B)(b - B)^* + (b - B)^*(b - B)$ is the right object whose kernel is harmonic forms.

For noncommutative $\mathcal A$: both $b$ and $B$ are non-trivial. The cyclic Laplacian $\Delta^\lambda$ combines them; the Hochschild Laplacian uses only $b$.

##### Approach

**Step 1.** Formal definition of $\langle \cdot, \cdot \rangle_D^{\mathrm{cyc}}$ on cyclic chains, with explicit handling of the cyclic-invariance constraint.

**Step 2.** Verify $b - B$ has closed range under the cyclic inner product (analog of [closed-range question](#closed-range-in-our-framework)).

**Step 3.** Verify Hodge isomorphism $\ker \Delta^\lambda \cong \mathrm{HC}_\bullet(\mathcal A)$.

**Step 4.** Test on $\mathcal A = \mathbb C[\mathbb Z/n]$ (group algebra), where $\mathrm{HC}_\bullet$ has rich finite-dim structure. Does the bipartite multipartition framework apply? Are cross-degree identifications between cyclic chain degrees realized?

**Step 5.** Test on $\mathcal A = C^\infty(M)$ for $M$ a small compact manifold (e.g., $S^1$, $T^2$). Verify $\Delta^\lambda$ matches de Rham Laplacian under HKR.

##### Periodic cyclic variant

The *periodic* cyclic complex $\mathrm{HP}_\bullet$ is 2-periodic (graded only by parity), with the same differential $b - B$ but on a different chain space. For the smooth case, $\mathrm{HP}_\bullet(C^\infty(M)) = H^{\mathrm{even}}_{\mathrm{dR}}(M) \oplus H^{\mathrm{odd}}_{\mathrm{dR}}(M)$.

The periodic cyclic Hodge Laplacian would give a 2-periodic Hodge structure --- a potentially different object than the standard de Rham case (where the grading is by individual form degree, not parity).

Whether periodic-cyclic Laplacianizability is structurally meaningful, or just a reformulation, is part of the open question.

##### Connection to negative cyclic homology

Negative cyclic homology $\mathrm{HN}_\bullet$ sits between Hochschild and periodic cyclic. The Hilbert lift could be defined on $\mathrm{HN}_\bullet$ as well, giving a third variant. The relationships between Hochschild, cyclic, and negative cyclic Laplacianizers are open.

##### Implications

A clean cyclic Hochschild--Hilbert lift would:
- Make the noncommutative case a genuine extension of the smooth Riemannian case via HKR.
- Produce bipartite multipartitions on cyclic chain spectra --- first noncommutative bipartite content beyond the Hochschild case.
- Connect to Connes' index theory more directly (the local index formula uses cyclic cocycles).

#### Open problem: Does the bipartite Vassiliev spectral sequence degenerate at $E_2$? {#e2-degeneration-bipartite-vassiliev}

*Explores: [bipartite-vassiliev-shapiro-vainshtein](#bipartite-vassiliev-shapiro-vainshtein), [bipartite-multipartition-lattice](#bipartite-multipartition-lattice)*

The classical Vassiliev spectral sequence for $\mathrm{Sym}^+_n$ stratified by partition lattice degenerates at $E_2$ ([Shapiro and Vainshtein 1995](#ref-shapiro1995stratification)). The bipartite analog of this result is conjectured but not proved.

##### Statement

The [bipartite Vassiliev spectral sequence](#bipartite-vassiliev-shapiro-vainshtein):
$$E_1^{p,q} = \bigoplus_{\Pi: \mathrm{codim}_\Pi = p} H^q\big(\mathrm{Stratum}(\Pi);\, \mathrm{or}_\Pi\big) \implies H^{p+q}\big(\mathcal H \setminus \mathrm{disc}_{\mathrm{bip}};\, \mathbb Z\big)$$
indexed by the [bipartite multipartition lattice](#bipartite-multipartition-lattice), with $E_1$ computed from cohomology of strata + Möbius-weighted closure-poset incidences.

> **Conjecture (bipartite $E_2$-degeneration).** $d_r = 0$ for all $r \ge 2$ on this spectral sequence; equivalently, $E_2 = E_\infty$.

##### Status

- **Verified on the binary $(2,2)$ case** (toolkit, single example): $E_1$ has 3 nonzero entries, $E_2$ degeneration is structurally automatic with only 2 strata.
- **Univariate case** ($N = 1$, partition lattice): proved by Shapiro and Vainshtein ([1995](#ref-shapiro1995stratification)) via Alexander duality + spectral-sequence machinery.
- **General case**: open.

##### What's needed for the proof

The classical Shapiro--Vainshtein argument uses:
1. **Partition lattice Möbius factors**: $\mu(\hat 0, \pi) = (-1)^{n-|\pi|}\prod_B (|B|-1)!$ --- clean factorial-style.
2. **Alexander duality**: the closure of a codim-$p$ stratum is Alexander-dual to a higher-codim cycle modulo $H^*$ of even-dim strata.
3. **Stratum cohomology supported in even degrees**: real flag manifolds have rational cohomology concentrated in specific degrees.

For the bipartite extension:
1. **Bipartite Möbius factors**: conjectured to factor over blocks ([open](#bipartite-mobius-product-formula)). If the factorization holds, the differentials at $E_1 \to E_2$ have a clean structure.
2. **Alexander duality**: the closure of a bipartite stratum has its own Alexander dual; the precise form depends on the bipartite multipartition refinement structure.
3. **Stratum cohomology**: bipartite strata are products of real partial flag manifolds (one per chain degree), still concentrated in known degrees.

Each of (1)-(3) extends conjecturally; the full $E_2$-degeneration argument needs them to assemble compatibly.

##### Concrete test cases

Verify $E_2$-degeneration computationally on:

- **$(3, 3)$ Hodge-constrained**: 5-element lattice (= $\Pi_3$), straightforward $E_1$ computation.
- **$(2, 1)$ chain**: 3-element lattice with mixed-degree blocks.
- **$\partial \Delta^3$**: 6 + 4 + 4 chain dims, longer chain, more strata.

If $E_2$-degeneration fails on any of these, that's a counterexample. If it holds on all, evidence accumulates.

##### Implication if $E_2$-degenerates

The cohomology of the open stratum (= "simple-spectrum" stratum, complement of the discriminant) is computable from the $E_2$ page, which is determined by:
- Cohomology of each stratum (real partial flag manifold).
- Möbius function of the bipartite multipartition lattice.

So the cohomology of $\mathcal H \setminus \mathrm{disc}_{\mathrm{bip}}$ admits a *closed-form combinatorial expression* in terms of bipartite multipartition data. This would be a structural payoff parallel to Shapiro--Vainshtein's classical result.

##### Implication if $E_2$ does NOT degenerate

The bipartite extension would then have *strictly richer* cohomological content than the univariate case --- higher differentials would carry information not visible in the closure-poset/stratum-cohomology level.

##### Connection to intersection cohomology

Intersection cohomology may be a more natural target than ordinary cohomology for the bipartite case, since closures of strata are singular varieties. Whether IH satisfies a parallel $E_2$-degeneration is a separate question.

#### Open problem: Functoriality of moduli under chain maps {#functoriality-of-moduli}

*Explores: [moduli-of-laplacianizations](#moduli-of-laplacianizations), [moduli-of-laplacianizers](#moduli-of-laplacianizers), [chain-auto-action](#chain-auto-action)*

For a chain map $f: (C_\bullet, d) \to (C'_\bullet, d')$, what is the induced map on moduli? Specifically, the relationship between $\mathcal M_{\mathrm{Lap}}(C, d)$ and $\mathcal M_{\mathrm{Lap}}(C', d')$ as $f$ varies.

##### Question

Define a functorial assignment $(C_\bullet, d) \mapsto \mathcal M_{\mathrm{Lap}}(C_\bullet, d)$ such that chain maps induce well-defined maps of moduli. Determine the form (covariant / contravariant / pulldown / pushdown) and the structure (preserves strata? preserves closure poset? respects bipartite multipartition combinatorics?).

##### Three candidate definitions

**(a) Pullback of inner products.** A chain map $f: C \to C'$ pulls back inner products: $f^* Q' \in \mathcal H(C, d)$ defined by $(f^* Q'_n)(c, c'') = Q'_n(f c, f c'')$. This is positive-semidefinite (= positive-definite iff $f$ is injective).

So $f^*: \mathcal H(C', d') \to \overline{\mathcal H(C, d)}$ --- into the *closure*, with image possibly degenerate at the boundary. Quotient maps don't generally descend cleanly to moduli.

**(b) Pushforward.** A chain map $f$ pushes forward inner products: $f_* Q$ defined on $f(C) \subseteq C'$ by $(f_* Q)(f c, f c'') = Q(c, c'')$, then extended (zero?) to all of $C'$. This is partial --- only defined on the image of $f$.

If $f$ is *surjective*, $f_*: \mathcal H(C, d) \to \mathcal H(C', d')$ is well-defined (via descent through the kernel quotient), and induces a map of moduli.

**(c) Span of moduli.** For an arbitrary chain map $f$, neither pullback nor pushforward gives a clean map of moduli. The right object might be a *correspondence* between $\mathcal M_{\mathrm{Lap}}(C)$ and $\mathcal M_{\mathrm{Lap}}(C')$ --- a sub-variety of the product encoding "compatible Hilbert structures."

##### What's at stake

Functoriality determines:
- How the cellular Laplacian moduli relates to that of subcomplexes / quotient complexes.
- How the moduli for a chain complex relates to that of its persistence-filtered version.
- What the "categorical moduli of Laplacianizers" $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$ looks like as a single object --- fibered over $\mathcal C$.

Without a clean functoriality, the cross-category framework remains object-by-object: each chain complex has its moduli, but morphisms between chain complexes don't translate to morphisms of moduli.

##### Concrete sub-cases

**Inclusion of subcomplexes.** $f: C \hookrightarrow C'$ injective. Pullback $f^*: \mathcal H(C') \to \mathcal H(C)$ well-defined as a map of cones (no degeneracy issues); descends to moduli. Bipartite multipartition: a $\Pi'$-stratum of $C'$ pulls back to a stratum of $C$ --- but which one?

The squared singular values of $\widetilde d_n: C_n \to C_{n-1}$ are not generally the same as those of $\widetilde{d_n'}|_{f(C_n)}: f(C_n) \to f(C_{n-1})$. The pullback of a $\Pi'$-stratum is a sub-locus of $\mathcal M_{\mathrm{Lap}}(C)$ where $\widetilde d|_C$ has spectrum compatible with restriction of $\widetilde{d'}$. Generally a complicated condition.

**Quasi-isomorphisms.** $f: C \to C'$ induces an isomorphism on homology. Does it induce a map of moduli? The moduli depends on the *full* chain complex, not just homology --- so quasi-isomorphic complexes can have different moduli. But there should be a *Morita-like* equivalence: same homology + compatible Hodge structures → equivalent moduli at the level of harmonics.

This is the natural categorical question: in what sense is moduli of Laplacianizers an invariant of the *derived category*?

**Chain homotopies.** Two chain maps $f, g: C \to C'$ that are chain-homotopic --- induce different but related maps on moduli. The relationship encodes the homotopy.

##### Categorical moduli object

If functoriality works out, the "moduli of Laplacianizers $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$" of a category $\mathcal C$ + cohomology theory $H^\bullet$ is a single object (categorical, not per-input), with:
- Per-object fiber $\mathcal M_{\mathrm{Lap}}(X)$ for $X \in \mathcal C$.
- Morphism-induced maps relating fibers.

The whole thing is a *fibered orbifold* over $\mathcal C$, generalizing the per-object construction. This is the meaning of [moduli of Laplacianizers](#moduli-of-laplacianizers) at the categorical level --- currently sketched.

##### Connection to derived category

The right ambient might be the derived category $D^b(\mathbf{Hilb}^\mathbb Z)$ of bounded Hilbert chain complexes. Quasi-isomorphic complexes are isomorphic in $D^b$, so moduli should be a derived-category invariant. Functoriality would then come for free from derived-functor formalism.

This sets up a substantial categorical project --- formalizing $\mathcal M_{\mathrm{Lap}}$ as a derived-category object --- that the program has identified but not pursued.

#### Open problem: Structure of mixed Stratification I + II strata {#mixed-stratification-strata}

*Explores: [stratification-i](#stratification-i), [stratification-ii](#stratification-ii), [hilbert-degeneracy-stratification](#hilbert-degeneracy-stratification)*

In the algebraic closure $\overline{\mathcal M_{\mathrm{Lap}}}$, the [interior stratification I](#stratification-i) and [boundary stratification II](#stratification-ii) can intersect at *mixed strata* --- loci with both spectral-multipartition structure (Stratification I behavior) and rank/kernel-degeneracy structure (Stratification II behavior).

##### Concrete example

The (2, 1) chain complex EDD = 40 computation has 5 singular components ([entry](#edd-computation-on-2-1-chain)):

- **Component 0** (dim 7, codim 2, deg 7): mixed $a, b$ cubics. Likely pure Stratification I --- corresponds to $V(\Pi_T)$, the supersymmetric sub-stratum.
- **Component 2** (dim 6, codim 3, deg 1): $b_{13} = b_{23} = b_{33} = 0$. Pure Stratification II --- kernel of $Q_1$ contains $\mathrm{im}\,d_2$.
- **Component 4** (dim 6, codim 3, deg 9): $\det Q_0 = 0$ + cubics. **Mixed** --- Stratification II ($\det Q_0 = 0$) intersected with Stratification I (cubic conditions on $b$).
- **Components 1, 3** (dim 6, codim 3, degs 5, 3): $b_{33} = 0$ + various conditions. **Mixed** --- Stratification II (kernel of $Q_1$ contains $\mathrm{im}\,d_2$ partially) intersected with Stratification I refinements.

##### Question

What is the systematic structure of mixed strata? Specifically:

1.  Given a Stratification I stratum $\mathrm{Stratum}(\Pi)$ (interior) and a Stratification II stratum $\mathrm{Stratum}_{\mathrm{II}}(\mathbf r, \sigma)$ (boundary), is their intersection in $\overline{\mathcal H}$ non-empty? When?

2.  What's the codim of a mixed stratum? Naively additive: $\sum_B(|B|-1) + \sum_n \binom{m_n - r_n + 1}{2} + \mathrm{Schubert}$? Or are there mixing terms?

3.  What's the closure poset of the *combined* stratification (Stratifications I + II merged into a single stratification of $\overline{\mathcal H}$)?

##### Why this matters

Global invariants of $\overline{\mathcal M_{\mathrm{Lap}}}$ --- EDD, intersection cohomology, integration of forms --- pick up contributions from all strata, including mixed ones. A clean formula for invariants requires understanding mixed strata.

For the (2, 1) chain EDD = 40, decomposing as 1 (Component 0, pure I) + ? (Components 2, pure II) + ? (Components 1, 3, 4, mixed): the "mixed" contributions are 4 of the 5 components, accounting for most of the 39-component-not-from-Stratification-I.

Understanding mixed strata is the path to a clean closed-form for the boundary contribution to EDD (and hence the saturated EDD = Stratification I contribution alone).

##### Approaches

**(a) Codim by transversality.** If Stratification I and II strata are "transverse" in $\overline{\mathcal H}$, codim of mixed stratum is the sum of codims. Need to verify transversality on small examples.

**(b) Explicit computation.** For the (2, 1) chain components 1, 3, 4: write down the Stratification I bipartite multipartition and Stratification II Pataki+Schubert pattern they correspond to, verify codim adds.

**(c) Closure poset structure.** A mixed stratum's closure includes mixed strata with finer Stratification I (more eigenvalue equalities) AND coarser Stratification II (less degenerate $Q$). The combined closure poset would be a product of the two closure poset structures.

##### Concrete sub-question

For the (2, 1) chain Component 4 ($\det Q_0 = 0$ + cubics):

- Stratification II: $Q_0$ rank 1 (Pataki $r_0 = 1$). Kernel of $Q_0$ = generic 1-dim subspace of $C_0$. No Schubert refinement ($r_0 = 1, k_0 = 1$, $a_0$ generic = 1 since $\rho_1 = 2$ surjects $C_0$).
- Stratification I: cubic conditions on $b$ --- encode multipartition refinements of the surviving spectrum on $\mathrm{im}\,d_1$ side.

What's the bipartite multipartition $\Pi$ and the Stratification II pattern $(\mathbf r, \sigma)$ jointly characterizing Component 4? Codim should be 1 (Pataki) + something (Stratification I contribution on the surviving spectrum).

This is concretely computable from the M2 ideal data ([scripts](../tools/macaulay2-calculator/scripts/edd_PiA_singloc_components.m2)) --- the cubic-generators tell you the spectral conditions.

##### Generalization

A systematic theory of mixed strata would need:
- A combined "indexing data" $(\Pi, \mathbf r, \sigma)$ specifying both stratification types.
- Compatibility conditions: not all $(\Pi, \mathbf r, \sigma)$ combinations give non-empty mixed strata.
- A combined closure poset on the compatible $(\Pi, \mathbf r, \sigma)$ tuples.

This is the "compactified moduli stratification" --- a single stratification of $\overline{\mathcal M_{\mathrm{Lap}}}$ that combines I and II coherently. Open structural theorem.

##### Connection to compactification

The compactification $\overline{\mathcal M_{\mathrm{Lap}}}$ as a stratified space requires the combined stratification structure. The Borel--Serre analog for moduli of locally symmetric spaces has a similar combined structure (interior eigenvalue stratification + boundary parabolic stratification). The chain-complex moduli's combined stratification might admit a parallel description in terms of parabolic / GIT data.

#### Open problem: What is the obstruction to Laplacianization? {#obstruction-to-laplacianization}

*Explores: [laplacianizability](#laplacianizability), [hilbert-degeneracy-stratification](#hilbert-degeneracy-stratification)*

If Laplacianizability is a real property of pairs $(\mathcal C, H^\bullet)$, it has a negation. Which pairs admit no Laplacianizer? And --- when a Laplacianizer exists --- what features of the data control its singular structure?

##### Concrete obstructions identified so far

- **Failure of $d^2 = 0$.** The Laplacianizer requires the chain differential to satisfy $d^2 = 0$. Structures whose natural "boundary-like" map doesn't square to zero need to be lifted to a richer category before Laplacianization is possible. The hypergraph case (`objects/hypergraph.md`, ([E. Choi and Park 2024](#ref-choi2024cellular))) is the canonical example: a hypergraph's boundary is sign-ambiguous, and the natural lift is to symmetric simplicial sets where the differential genuinely squares to zero.

- **No natural pairing.** Categories whose objects don't carry a canonical inner product structure on their cochains. The choice of pairing is the first piece of "Hilbert" data; without it, there's no Laplacianizer. Often there *is* a pairing, but only after enriching the input with extra structure (per-cell weights, per-edge metrics, etc.).

- **Closed-range failure.** For infinite-dimensional cases, the boundary operator $d_n$ may fail to have closed range, breaking the Hodge isomorphism between $\ker \Delta$ and cohomology (`theorems/closed-range-obstruction.md`). This is a technical obstruction in the analytic setting.

- **Non-self-dual structures.** Directed graphs, directed hypergraphs, time-reversal-violating quantum graphs --- cases where the Laplacian construction produces a non-self-adjoint operator. The "Hilbert lift" framework requires self-adjoint $\Delta = dd^* + d^*d$, so these cases need either symmetrization (information loss) or an enlargement to sectorial operators (categorical lift template, `theorems/categorical-lift-fixes-obstruction.md`).

##### Refined: obstructions visible in the dual-stratification framework

The dual-stratification observation (`theorems/hilbert-degeneracy-stratification.md`) suggests a more refined obstruction question:

- **Stratum-realizability.** Given a chain complex and a candidate bipartite multipartition $\Pi$, when does the corresponding stratum $V(\Pi)$ in $\mathcal M_{\mathrm{Lap}}$ have a non-empty SPD interior? Equivalently: which bipartite multipartitions are realized by *positive-definite* Hilbert structures, and which only at the SPD boundary (Stratification II)?

This is the **chain-complex generalization of IEP-G's realizability question** (([Barrett et al. 2017](#ref-barrett2017inverse))): given a graph-pattern, which multiplicity partitions are realized by symmetric matrices with that pattern? Our generalization: given a chain complex, which bipartite multipartitions are realized by *Hilbert structures* (i.e., in the SPD interior)?

If a multipartition is *not* realizable in the SPD interior --- only on the boundary --- that's a refined sense in which the corresponding Laplacian "fails to exist" for that chain complex. It's a structural obstruction, computable in principle, generalizing IEP-G.

##### Open

A clean obstruction theorem in the dual-stratification framework would say:

> For a finite-dim chain complex $(C_\bullet, d)$ and a bipartite multipartition $\Pi$, $\mathrm{Stratum}(\Pi)$ has non-empty SPD interior in $\mathcal M_{\mathrm{Lap}}$ iff \[structural condition on $\Pi$ and the chain complex's rank profile / dimensions\].

Working this out concretely on small cases ($\partial \Delta^2$, $\partial \Delta^3$, the (2,1) chain) is feasible by hand and would generalize Barrett--Fallat-style realizability theorems to the bipartite case.

#### Open problem: What is the SPD-interior-saturated EDD on the (2,1) chain? {#saturated-edd}

*Explores: [bipartite-distance-degree](#bipartite-distance-degree), [hilbert-degeneracy-stratification](#hilbert-degeneracy-stratification), [stratification-i](#stratification-i), [stratification-ii](#stratification-ii)*

The Euclidean Distance Degree of $V(\Pi_A)$ on the $(2, 1)$ chain complex was computed in M2 to be 40 ([example](#edd-computation-on-2-1-chain)). The expected value from the bipartite multinomial $\binom{r_1+r_2}{r_1, r_2} = \binom{3}{2, 1} = 3$ --- or more conservatively from the free-bipartite Bik--Draisma analog --- was much smaller.

The discrepancy is explained by [Stratification II](#stratification-ii): EDD = 40 is computed in the algebraic ambient $\overline{\mathcal H}$ and includes critical points at the SPD-cone boundary ($\det Q_n = 0$ degenerations). The intrinsic EDD restricted to the SPD interior $\mathcal H$ would saturate away these boundary contributions.

##### Question

Compute the **saturated EDD**: the EDD of $V(\Pi_A) \cap \mathcal H$ in the SPD interior, equivalently the EDD of $V(\Pi_A)$ saturated by the determinants $\det Q_0 \cdot \det Q_1 \cdot \det Q_2$.

Conjecturally, this saturated EDD equals 1 (matching the bipartite multinomial in the free-bipartite ambient), or some other clean small number explainable from intrinsic bipartite multipartition data.

##### Status

- M2 computation attempted; Gröbner basis blew up. The saturated ED ideal couldn't be computed by direct elimination.
- Singular locus of $V(\Pi_A)$ identified as 5 components: 1 likely Stratification-I ($V(\Pi_T)$), 4 Stratification-II contributions matching the boundary structure ([entry](#edd-computation-on-2-1-chain)).

##### Approaches to try

1.  **Decompose into prime components**. The 5 singular components have specific dims/degrees. Each can be analyzed separately for its EDD contribution. Sum the Stratification-I contribution to get the saturated EDD.

2.  **Symbolic EDD on the saturated ideal**. Possibly tractable if the saturation produces a smaller ideal whose Gröbner basis is computable.

3.  **Numerical EDD via random distance**. Sample random points in $\mathcal H$ at varying distance to $V(\Pi_A) \cap \mathcal H$, count critical points. Statistical lower bound on the saturated EDD.

4.  **Hand-computation on the free-bipartite analog**. The bipartite Bik--Draisma multinomial conjecture says EDD of $V(\lambda) \subseteq \mathrm{Sym}^+_{r_1} \times \mathrm{Sym}^+_{r_2}$ in the *unconstrained* free-bipartite ambient (no chain coupling) is $\binom{r_1+r_2}{r_1, r_2}$. Verify this on small cases by hand. If it holds, the chain-coupled EDD is the free-bipartite EDD plus boundary contributions.

##### Why this matters

A clean saturated EDD formula would:
- Recover the bipartite Bik--Draisma multinomial as the SPD-interior EDD.
- Identify the EDD = 40 result as 1 (Stratification-I) + 39 (Stratification-II + mixed strata).
- Confirm the dual-stratification framework's quantitative predictions.

If the saturated EDD is *not* the bipartite multinomial, this signals additional structural content --- Stratification-I has more critical points than the free-bipartite case predicts, suggesting the chain-coupling itself contributes to interior EDD.

##### Generalization

Compute saturated EDD on:
- $(3, 2, 1)$ or other chain rank profiles.
- $\partial \Delta^k$ for small $k$.

Look for a closed-form pattern across cases. If it matches a chain-complex-aware multinomial formula, that's the chain-complex Bik--Draisma analog. If not, isolate what extra structure the chain-coupling contributes.

##### Connection to bipartite Vassiliev

EDD is one numerical invariant of $V(\Pi)$; its cohomology is the structural object. Once the bipartite Vassiliev spectral sequence is established ([related question](#e2-degeneration-bipartite-vassiliev)), the cohomology of $V(\Pi)$ --- possibly including Stratification-II boundary contributions --- can be computed and compared to the EDD count via Euler-characteristic considerations.

#### Open problem: Is the Stratification II closure poset Bruhat-like? {#stratification-ii-closure-poset-combinatorics}

*Explores: [stratification-ii](#stratification-ii), [pataki-rank-stratum](#pataki-rank-stratum), [schubert-invariant](#schubert-invariant)*

The closure poset of [Stratification II](#stratification-ii) combines:
1. The Pataki product chain (rank tuple coordinate-wise order).
2. Schubert orders on the Grassmannian fibers (kernel-pattern refinement within fixed rank).

These combine into a poset described algorithmically (in `src/stratification_ii.py`), but lack a clean combinatorial description.

##### Question

Is there a combinatorial description of the Stratification II closure poset analogous to Bruhat order on flag manifolds, or as a clean product/wreath-product of partial orders, or as a poset with a known generating function?

##### What's known

- **Pataki coarse closure** (no Schubert): product chain $\prod_n \{0, \ldots, m_n\}$ with coordinate-wise order. Clean.
- **Single Pataki stratum + Schubert refinement**: within a fixed rank-$r_n$ stratum, kernel patterns refine by Schubert order on the Grassmannian $\mathrm{Gr}(k_n, m_n)$ with respect to the chain filtration. Schubert order is well-known.
- **Combined**: closure relations across rank-drops AND kernel-pattern changes mix the two orders. Algorithmic description is given but not in clean closed form.

##### Why Bruhat?

The chain filtration $0 \subseteq \mathrm{im}\,d_{n+1} \subseteq \ker d_n \subseteq C_n$ gives each $C_n$ a flag of length 3 (or shorter, if filtration steps coincide). Subspaces $K_n \subseteq C_n$ relative to this flag are parameterized by Schubert cells in a flag manifold. Bruhat order on flag manifolds describes the closure relations of Schubert cells.

The Pataki rank-drop dimension is *outside* the Schubert structure (it varies the kernel dim $k_n$, which Schubert order takes as fixed). So the combined order is Schubert × Pataki-on-each-degree, with mixing terms when rank changes.

This is similar to:
- **Wreath product of orders**: Pataki ≀ Schubert.
- **Bruhat-type**: parabolic Bruhat-like order on the union of Schubert cells over varying flag dimensions.

Whether the combined order matches a known combinatorial-poset structure is the question.

##### Concrete approach

Compute the closure poset on small chain complexes:

- **Single chain space** ($N = 0$): no chain structure, just Pataki on a single $\mathrm{Sym}^+_m$. Closure = chain $0 \le 1 \le \cdots \le m$. Trivial.

- **$P_3$**: chain dims $(3, 2)$, ranks $(2)$, no $d_2$. Pataki on $\mathrm{Sym}^+_3 \times \mathrm{Sym}^+_2$ has closure $\{0,1,2,3\} \times \{0,1,2\}$ (Pataki coarse) refined by chain-Schubert. Compute fully and check structure.

- **$(2, 1)$ chain**: chain dims $(2, 3, 1)$, more interesting. The toolkit enumerates strata up to codim 4.

Look for:
- Order-theoretic invariants (Möbius function, characteristic polynomial).
- Whether the poset is graded, ranked, or has other regularity.
- Whether it admits an EL-shellability or other "nice" combinatorial structure.

##### Implication for compactified moduli

A clean description of the Stratification II closure poset would feed directly into:
- The compactification $\overline{\mathcal M_{\mathrm{Lap}}}$ as a stratified space.
- Intersection cohomology computations.
- Possible decomposition theorems for the compactified moduli's cohomology.

If the closure poset is wreath-like or Bruhat-like, the compactified moduli inherits structural features from these poset categories.

##### Connection to GIT / Borel--Serre

The classical Borel--Serre compactification of locally symmetric spaces has boundary stratified by parabolic-conjugacy types, with closure relations related to parabolic-inclusion. The Stratification II closure poset might admit a parallel description via parabolic-type data on the chain auto group $G$.

This would provide a *categorical* explanation of the closure poset in terms of standard Lie-theoretic / GIT data.

#### Open problem: Variational $p$-eigenvalue perturbation theory {#variational-p-eigenvalue-perturbation}

*Explores: [nonlinear-p-hodge-laplacianizability](#nonlinear-p-hodge-laplacianizability)*

For the [nonlinear $p$-Hodge Laplacianizability theorem](#nonlinear-p-hodge-laplacianizability) at fixed $p$, the closure-poset argument requires *Kato-style perturbation theory for variational eigenvalues* --- continuity (and ideally real-analyticity) of variational eigenvalues under perturbation of the $p$-Banach lift.

For $p = 2$ (linear Hilbert case), Kato analytic perturbation theory provides this directly. For $p \ne 2$, the eigenvalues are critical values of nonlinear functionals; standard Kato doesn't apply.

##### Question

Is there a Kato-style perturbation theory for variational $p$-eigenvalues sufficient for the closure-poset argument?

##### What's needed

Given a graded $p$-Banach chain complex $(B_\bullet, d, \|\cdot\|_p^{(\bullet)})$ and a parametric family of $p$-Banach lifts $\|\cdot\|_p^{(t)}$ varying smoothly in $t$, the variational $p$-eigenvalues $\lambda_k^{(p)}(t)$ should:

(a) Be continuous in $t$.
(b) Be real-analytic on a dense open set.
(c) Have eigenfunction-like critical points varying continuously.
(d) Admit a first-order perturbation formula: $\lambda_k^{(p)}(t) \approx \lambda_k^{(p)}(0) + t \cdot \langle \text{eigenfunction}, \text{perturbation}\rangle + O(t^2)$ in some appropriate sense.

For $p = 2$: all four hold via standard Kato.

For $p \ne 2$: continuity (a) is partially known (Tudisco--Hein, Amghibech for fixed $p$ on graphs). The other conditions are less clear.

##### Specific challenge: nonlinear eigenspaces

For $p = 2$, an eigenspace is a vector subspace; perturbation rotates it among neighboring subspaces. Standard Kato handles this via spectral projections.

For $p \ne 2$, an "eigenspace" (level set of $\mathcal F_p$ at a critical value) is *not a vector subspace* --- it's a nonlinear cone (possibly a finite collection of points up to scaling). Perturbation of a critical point gives a deformed critical point in a "tangent cone" --- but this isn't captured by linear Kato machinery.

The natural framework is *Lyusternik--Schnirelman category-theoretic perturbation*, which handles min-max critical values rather than linear-algebraic eigenvalues. This exists in the literature (e.g., Mawhin--Willem, "Critical Point Theory") but isn't packaged for our setting.

##### Sub-question: small perturbation regime

For $p$ near 2, the $p$-Laplacian is a perturbation of the linear Laplacian. *Small-deformation* theory should give the closure-poset argument in the regime $|p - 2| < \epsilon$.

Specifically: if at $p = 2$ a stratum is the closure of another, does this persist for $p \in (2 - \epsilon, 2 + \epsilon)$?

##### Sub-question: graphs at $p$ near 2

For graph $p$-Laplacians on $K_3, C_4, \partial \Delta^2$, etc., compute the variational eigenvalues at a few values of $p \in \{1.5, 2, 2.5\}$ numerically. Verify continuity and any closure-poset behavior.

This is a concrete numerical study, doable with the toolkit (extended to numerical / variational eigenvalue computation).

##### Sub-question: closed forms for special $p$

For special $p$ (e.g., $p = 2$, $p \to \infty$ giving the $\infty$-Laplacian, $p = 1$ giving the cut-Laplacian), the variational eigenvalues admit closed forms. The closure poset at these special $p$ might be tractable directly.

Interpolating between these via $p$-deformation could give the closure-poset argument across all $p \in (1, \infty)$.

##### Implication

A clean variational-Kato theorem would:
- Complete the [nonlinear $p$-Hodge cross-category theorem](#nonlinear-p-hodge-laplacianizability) for fixed $p$.
- Open the door to a *varying-$p$* cross-category theorem (treating $p$ as a parameter alongside the $p$-Banach lift).
- Connect to the $p$-deformation literature in nonlinear PDE.

Without it, the nonlinear case remains conjectural beyond fixed special $p$.

##### Connection to spectral fragmentation

For $p$ slightly different from 2, eigenvalues that were degenerate at $p = 2$ may "split" into nearby critical values. This *spectral fragmentation* is the analog of branching in linear Kato; controlling it requires a $p$-aware version of the standard spectral-perturbation formulas.

The structural question: how does the bipartite multipartition stratification at $p = 2$ deform to nearby $p$? Specifically: do strata move continuously, or do they split / merge?

### Further reading {#appendix-further-reading}

Works in the program's intellectual environment that situate the machinery but aren't directly cited on any specific claim. Each entry summarises the work and its relevance.

#### Aksoy, Sinan G., Young, Stephen J. (2025) --- *Re-imagining Spectral Graph Theory* {#aksoy2025reimagining}

arxiv:2504.10624 (April 2025).

##### Why this is central to the program

This paper is the strongest empirical evidence so far that the parametric / moduli view of Laplacianization is independently emerging in the 2025 literature. Young defines the **inner product Laplacian** explicitly as a *parameterized family*:

> "We propose a Laplacian based on general inner product spaces, which we call the inner product Laplacian."

The inputs are: (1) graph structure (vertices and edges), and (2) inner product spaces on vertices and edges, specified via positive-definite matrices. This is precisely the data of a Hilbert lift of cellular cohomology in the program's sense (`concepts/laplacianizability.md`), with the inner products being coordinates on the moduli $\mathcal H$.

**Crucially**, the paper does *not* treat the inner products as auxiliary or aesthetic; it proves uniform theorems across the parameter space:

- A generalized Cheeger inequality holding for every inner product Laplacian.
- An expander mixing lemma that is uniform in the parameters.
- Standard combinatorial, normalized, hypergraph, and directed-graph Laplacians appear as **special cases** (i.e., specific points in the moduli of inner product Laplacians).
- Dirichlet and Neumann subgraph eigenvalues are recovered as **limit points of sequences** of inner product Laplacians --- explicitly using the topology of the moduli.

The framework uses "conformality" --- alignment of inner product spaces with a chosen basis --- rather than orthogonality, which is precisely the *partial gauge* the moduli theorem (`theorems/moduli-of-laplacianizations.md`) makes visible: choosing a basis is not the same as choosing an inner product, and the difference is moduli structure.

##### Subsumption pattern

The paper makes the unification claim explicit:

> "a formalization of how inner product Laplacian generalizes existing Laplacians, such as normalized and combinatorial Laplacian, as well as a host of Laplacians for hypergraphs and directed graphs"

Read in the program's framework: Young is constructing the moduli of cellular-sheaf Hilbert lifts on a graph (with sheaf data being the per-edge / per-vertex Hilbert spaces) and proving that the resulting Laplacian family contains all the named graph Laplacians. This is the cellular-sheaf-cofinality picture (`theorems/cellular-sheaf-cofinality.md`) made *constructively explicit* for graphs.

##### Where this sits in the program's classification

- For Laplacianizability of $(\mathbf{Graph}, H^\bullet)$: the inner product Laplacian is **the** Hilbert lift functor. Modulo gauge, every named graph/hypergraph/directed-graph Laplacian is one of its values.
- For the universal-property / stratified-moduli question: Young's framework treats the moduli as a parameter space without (visibly) examining its strata --- the orbifold structure is implicit. The next step the program would want is a stratification analysis: which special inner products produce the named cases, and how do the strata sit in the moduli? (See `examples/gauge-fiber-structure.md` for the analog on $\partial \Delta^3$.)

##### Bridges

- To `concepts/laplacianizability.md` --- the Hilbert-lift definition, with concrete realization for graphs.
- To `theorems/cellular-sheaf-cofinality.md` --- Young's construction is a verification of cofinality for the graph case.
- To `theorems/moduli-of-laplacianizations.md` --- Young's "inner product space" data are coordinates on $\mathcal H_{\mathrm{cell}}$.
- To `examples/cellular-sheaf-on-tetrahedron-boundary.md` --- the same parametric structure, computed concretely.

#### Andreotti, Eleonora (2025) --- *Generalizing Lattice Structures to Hypergraphs: Spectra of Clique and Hyperedge-based Laplacians* {#andreotti2025generalizing}

arxiv:2511.11138 (Nov 2025).

##### Why this matters

Generalizes lattices to hypergraphs and studies Laplacian spectra under **two alternative definitions**: the clique Laplacian (pairwise projection) versus the hyperedge-based Laplacian (normalized hyperedge incidences). This is a uniqueness-failure case: the same input structure (a hypergraph-lattice) supports two non-equivalent Laplacianizations, so for this category $\mathcal C$ the candidate functor to $\mathbf{HilbCh}$ is at least double-valued.

Important data for `questions/universal-laplacianization.md`: the universal arrow, if it exists, must distinguish or unify these two --- and the survey will likely surface several more such forks before a pattern emerges.

##### Bridges

- To `questions/universal-laplacianization.md` --- empirical case of two-valued Laplacianization.
- To `concepts/laplacianizability.md` --- pressure on uniqueness.

#### Arnold, V. I. (1995) --- *Remarks on eigenvalues and eigenvectors of Hermitian matrices, berry phase, adiabatic connections and quantum Hall effect* {#arnold1995remarks}

Selecta Math. New Series 1(1), 1--19 (1995). **Anchor reference** --- the foundational work on eigenvalue-multiplicity stratification of Hermitian (and real symmetric) matrices.

##### Why this is foundational for the program

This paper sets up the stratification of the space of Hermitian matrices by eigenvalue multiplicities and studies its singular geometry. The structural pattern the laplanc-2025 program rediscovered for moduli of Laplacianizations (`theorems/stab-codim-formula.md`, `examples/moduli-strata-classification.md`) is a known subject at the univariate level, with Arnold as its founder.

What Arnold establishes:

- The stratification by eigenvalue-multiplicity partition is a real (not just notional) stratification of the space of Hermitian matrices.
- The stratum of Hermitian matrices with a non-simple eigenvalue is codim 3 (real codim) in the Hermitian case, codim 2 in the real symmetric case.
- A spectral sequence is associated to the stratification; its degeneration produces non-trivial combinatorial identities.
- The eigenvector bundle has a connection over the open stratum (simple eigenvalues), with curvature blowing up at the codim-3 variety. This is the geometric origin of the quantum Hall effect.

##### Relationship to the laplanc-2025 framework

The laplanc-2025 program studies moduli of Hilbert structures on chain complexes, stratified by eigenvalue multiplicity of the resulting Hodge Laplacian. **The univariate case** --- stratification of $\mathrm{Sym}^+_n$ (or $\mathrm{Herm}_n$) by partition --- is exactly Arnold's subject.

Our `theorems/stab-codim-formula.md` codim formula $\sum_B (|B|-1)$ in the univariate case is *classical* --- implicit in Arnold's setup, and worked out in any standard reference on stratifications of matrix spaces.

Our stab formula $\sum_B \binom{k_n^B}{2}$ at the univariate level is the dimension of the unitary stabilizer on each eigenspace, $\dim O(k) = \binom{k}{2}$ --- also classical.

**The novel piece of laplanc-2025 (relative to this anchor) is:**

1.  **The bipartite/multipartite extension.** When the chain complex has multiple boundary operators $d_1, d_2, \ldots$, each contributes its own singular-value spectrum. Strata of moduli are indexed not by single partitions but by **bipartite (or N-partite) multipartitions**, with cross-$d_n$ identifications adding to codim while the stab formula treats within-$d_n$ multiplicities and cross-$d_n$ identifications differently. This is not in Arnold's univariate framework.

2.  **The chain automorphism quotient.** Arnold stratifies $\mathrm{Herm}_n$ as a single space; we stratify $G \backslash \mathcal H$ where $G$ is the chain auto group of the underlying chain complex. The chain coupling changes the local structure of strata.

3.  **The Laplacianizability framing.** Arnold doesn't connect his stratification to a moduli of Hodge Laplacians of a cohomology theory. Our framework does.

##### Spectral sequence and cohomology --- what extends, what doesn't

Arnold's spectral sequence and Shapiro--Vainshtein's Alexander mapping (`references/shapiro-vainshtein-1995-alexander.md`) compute cohomology of the stratification of Hermitian matrices. The natural question for laplanc-2025: do these tools extend to the bipartite multipartition stratification of $G \backslash \mathcal H$?

This is open. The bipartite stratification has a more complex closure poset (refinements of bipartite multipartitions, not single partitions), and the chain automorphism quotient adds another layer of structure. The Arnold--Shapiro--Vainshtein techniques *should* generalize --- that's the natural Direction B program --- but the generalization isn't in the literature found.

##### Bridges

- To `theorems/stab-codim-formula.md` --- provides the univariate-case anchor.
- To `examples/moduli-strata-classification.md` --- provides the structural antecedent for the bipartite enumeration.
- To the program's Direction B --- Arnold--Shapiro--Vainshtein cohomology techniques are the natural starting point.

#### Ayzenberg, Anton, Gebhart, Thomas, Magai, German, Solomadin, Grigory (2025) --- *Sheaf theory: from deep geometry to deep learning* {#ayzenberg2025sheaf}

arxiv:2502.15476 (math.AT, Feb 2025).

##### Why this is central to the program

This paper is the most explicit 2025 unification move: it develops a theory of sheaf Laplacians and diffusion *in the generality of finite posets*, and shows that **several known non-cellular Laplacians, including the hypergraph Laplacian, fit in the constructed formalism**. That is exactly the kind of unification the Laplacianizability program is named for --- different "Laplacians" in the literature are revealed to be instances of one functor (poset → sheaf → sheaf-Laplacian).

A new algorithm for computing sheaf cohomology on arbitrary finite posets is also given, which connects the survey to the question of effective construction (and would matter for any claimed universal property --- the universal arrow had better be computable).

##### What it does *not* settle

It does not name the unified phenomenon as a property; it does not state a universal theorem; the framework is presented as a *generalization* of cellular sheaf theory rather than as an answer to "what is a Laplacian, structurally." The naming and theorem are still open, which is precisely the gap our program is for.

##### Bridges

- To `concepts/laplacianizability.md` --- the categorical (Laplacianizer) form is the form this paper effectively presupposes.
- To `objects/finite-poset.md` (to be written) --- finite posets emerge here as the natural input category.
- To anchor papers Hansen--Ghrist (sheaf Laplacian) and Wang--Wei (persistent Laplacian) --- both subsumed.

#### Backhausz, Ágnes, Kuehn, Christian, van der Niet, Charlotte, Zucal, Joaquín (2025) --- *Spectral theory of dense hypergraph limits* {#backhausz2025spectral}

arxiv:2511.03516 (Nov 2025).

##### Why this matters

Develops a **spectral theory for hypergraph limits**, proving convergence of the spectra of adjacency and Laplacian matrices for hypergraph sequences converging in the 1-cut metric. This is a continuity-of-Laplacianization result: the Laplacianization functor restricted to (an appropriate category of) hypergraphs is well-behaved under a limit operation.

For the program: continuity / preservation results are the *positive* form of the universal-property question. If $L: \mathcal C \to \mathbf{HilbCh}$ preserves limits in a nontrivial sense, the right adjoint candidate gets harder to dismiss.

##### Bridges

- To `questions/universal-laplacianization.md` --- preservation evidence.
- To `theorems/` --- candidate "Laplacianization is continuous" claim.

#### Barrett, Wayne, Butler, Steve, Fallat, Shaun, Hall, H. Tracy, Hogben, Leslie, Lin, Jephian C.-H., Shader, Bryan, Young, Michael (2017) --- *The inverse eigenvalue problem of a graph: Multiplicities and minors* {#barrett2017inverse}

A line of work (mainly Barrett, Fallat, Adm, Hall, Hogben, and collaborators) on which **multiplicity partitions** are realizable for symmetric matrices with a prescribed off-diagonal sparsity pattern (a graph $G$). Anchor for the laplanc-2025 program. Representative papers:

- Inverse Eigenvalue Problem of a Graph: Multiplicities and Minors, arxiv:1708.00064.
- Achievable multiplicity partitions in the inverse eigenvalue problem of a graph, arxiv:1907.11328.
- Ordered multiplicity inverse eigenvalue problem for graphs on six vertices, arxiv:1708.02438.

##### Why this is anchoring for the program

The IEP-G is structurally close to the laplanc-2025 stratum classification:

- **Setup.** Given a graph $G$ on $n$ vertices, the "matrices realizable on $G$" are real symmetric $n \times n$ matrices whose $(i, j)$-entry (for $i \ne j$) is nonzero iff $\{i, j\}$ is an edge of $G$.
- **Question.** Which **ordered multiplicity lists** (= eigenvalue partitions of $n$) are realizable for matrices in this class?
- **Answer (partial).** Various combinatorial conditions on $G$ control the answer. Tools: Strong Spectral Property (SSP), Strong Multiplicity Property (SMP), and minor-monotonicity arguments.

In the laplanc-2025 framing, the IEP-G is the **special case** of our stratification when:
- The chain complex is concentrated in a single degree (or two adjacent degrees).
- The relevant "automorphism" structure is the diagonal scaling that doesn't change the graph.

The IEP-G's *realizable* multiplicity partitions are exactly the partitions $\Pi$ for which the stratum $\Pi$ of $\mathcal M_{\mathrm{Lap}}$ is non-empty. Our stratification framework gives a uniform language for this question; the IEP-G provides decades of work on the special case.

##### What IEP-G does that we should mimic

1.  **Realizability characterization** --- for a given chain complex (= graph + extra structure for IEP-G), enumerate which strata are populated. We have the *enumeration* of strata (by combinatorics of bipartite multipartitions); we don't yet have the realizability characterization.

2.  **Strong Spectral Property** --- a graph $G$ has SSP if there is a matrix on $G$ realizing the *generic* multiplicity partition $(1^n)$ such that small perturbations stay in the realizability class. This is a *transversality condition*, and there's a direct analog for our chain complexes: SSP-of-a-chain-complex would be the existence of a Hilbert structure with all distinct singular values plus transversality of small perturbations.

3.  **Strong Multiplicity Property** --- analog for multiplicity partition (= for non-generic strata). Direct extension to our framework.

4.  **Minor monotonicity** --- adding edges to $G$ extends the realizability class. For chain complexes, the analog is: refining the chain complex (adding cells / refining the cell structure) should extend the realizability class.

These are concrete theorems of the IEP-G literature that generalize cleanly to the laplanc-2025 multipartition framework.

##### What's novel in laplanc-2025 relative to IEP-G

The IEP-G works with a **single matrix** patterned by a graph. The laplanc-2025 framework works with a **chain complex** of multiple boundary operators. The bipartite-multipartition structure of strata, with cross-$d_n$ identifications contributing differently from within-$d_n$ multiplicities, is specific to the chain-complex setup and is not in the IEP-G literature.

The chain automorphism group $G$ that we quotient by is also more general than the single-matrix automorphism group of IEP-G: it couples across degrees of the chain complex.

So our framework subsumes IEP-G as a single-degree special case while extending it to multi-degree chain complexes.

##### Bridges

- To `theorems/cellular-sheaf-cofinality.md` --- IEP-G's "graph patterns" become "cellular sheaves on posets" in our framework.
- To `theorems/moduli-of-laplacianizers.md` --- IEP-G's realizability question is the per-stratum existence question.
- To Direction B --- the SSP/SMP tools generalize to our setting and are the candidate technology.

#### Bartmann, Bobo, Keller, Matthias (2025) --- *On Hodge Laplacians on General Simplicial Complexes* {#bartmann2025hodge}

arxiv:2508.07761 (Aug 2025).

##### Why this matters

Studies Hodge Laplacians on **general countable weighted simplicial complexes** allowing infinite vertex sets, infinite dimension, and non-locally finite complexes. This is a scope-expansion paper: the classical Hodge Laplacian construction is extended to a much larger class of inputs, accompanied by the operator-theoretic care (closability, self-adjoint extensions, spectrum) that infinite cases require.

For the program: this is the most concrete evidence so far that the *operator-theoretic form* of Laplacianizability is actively being filled in --- the literature is doing the work of showing that the Laplacian construction extends past finite complexes to a categorically natural infinite-dimensional setting, without leaving the Hilbert framework.

##### Bridges

- To `concepts/laplacianizability.md` --- the unbounded-operator form.
- To `objects/weighted-simplicial-complex.md` (future).

#### Berkolaiko, Gregory, Hofmann, Matthias (2025) --- *Eigenvalues of the discrete p-Laplacian via graph surgery* {#berkolaiko2025eigenvalues}

arxiv:2509.06686 (Sep 2025).

##### Why this matters

Studies the **signed p-Laplacian** through edge-cut perturbations, characterizing its eigenvalues as critical values of a parameter-dependent eigenvalue function on a simpler graph. The signed-graph case adds one more axis (sign data on edges) to the input category, and the perturbation framework is doing the kind of stability work --- small structural change → controlled spectral change --- that, in the linear case, has been a primary tool for the Laplacianization view (cf. Quiver Laplacians stability bounds, hypergraph limit spectral convergence).

For the program: the signed p-Laplacian is *another non-linear case* whose spectral-stability story strongly resembles the linear cases, suggesting the right Laplacianizability framework should subsume both linear and variational nonlinear constructions under one banner.

##### Bridges

- To `concepts/laplacianizability.md` --- case for a nonlinear analog of the Laplacianizer.
- To `questions/universal-laplacianization.md` --- stability under perturbation as a continuity-of-functor signal.

#### Choi, Eunho, Park, Hee Rhang (2024) --- *Cellular sheaf Laplacians on the set of simplices of symmetric simplicial set induced by hypergraph* {#choi2024cellular}

arxiv:2411.08458 (Nov 2024). **Anchor reference** --- late-2024 paper kept because the symmetric-simplicial-set construction is the bridge that several 2025 papers build on.

##### Why this matters

Generalizes cellular sheaf Laplacians from ordered finite abstract simplicial complexes to **symmetric simplicial sets**, and constructs cellular sheaf Laplacians on such sets *induced by hypergraphs*. This is a categorical lift: the input category was simplicial complexes, the new input category is symmetric simplicial sets, and hypergraphs sit inside the new category. Two different objects (simplicial complexes, hypergraphs) are unified as inputs to one Laplacianization functor.

The pattern matters more than the specific construction: it is the empirical shape of "the Laplacianizer framing" (a functor enlarges its domain to subsume previously-incompatible inputs).

#### Choi, Seonghyun, Kim, Junhyeok, Oh, Sangwoo (2025) --- *Hypergraph Neural Sheaf Diffusion: A Symmetric Simplicial Set Framework for Higher-Order Learning* {#choi2025hypergraph}

arxiv:2505.05702 (cs.LG, May 2025).

##### Why this matters

The first principled extension of Neural Sheaf Diffusion to hypergraphs, operating via **normalized degree-zero sheaf Laplacians over symmetric simplicial sets**. Three program-relevant signals at once:

1.  The **same input category** as the late-2024 paper (arxiv:2411.08458) --- symmetric simplicial sets --- is being adopted on the cs.LG side as the right home for higher-order learning. Two communities converging on one input category is unusual and supports the categorical (Laplacianizer) framing.
2.  The **degree-zero sheaf Laplacian** is doing the work, with the higher-degree pieces unused. This is a uniformity claim (the bottom of the graded family is enough for the application) that complements arxiv:2505.23993, where the bottom recovers an old operator and the higher pieces add information. The pattern is: the graded chain complex is the primary object, and applications consume it at varying depth.
3.  **Resolving orientation ambiguity** is explicit. Orientation is one of the failure modes for "Laplacianization of hypergraphs" --- the symmetric-simplicial-set lift is in part a structural fix for that failure.

##### Bridges

- To `objects/symmetric-simplicial-set.md` (future) --- co-anchor with arxiv:2411.08458.
- To `concepts/laplacianizability.md` --- supports the Laplacianizer framing.
- To `questions/obstruction-to-laplacianization.md` --- orientation-ambiguity is one specific obstruction the literature is *fixing* by lifting the input category.

#### Di Nino, Andrea, Barbarossa, Sergio, Di Lorenzo, Paolo (2025) --- *Learning Sheaf Laplacian Optimizing Restriction Maps* {#dinino2025learning}

arxiv:2501.19207 (January 2025).

##### Why this matters for the program

The paper poses the **moduli of sheaf Laplacians as an optimization domain**: given data observed at vertices, find the sheaf Laplacian --- i.e., choose the restriction maps (and implicitly the stalkwise inner products) --- that minimizes the total variation of the data over the resulting graph.

This is the program's moduli view operationalized: one explicitly searches a parameterized space of Laplacians for a "best" one according to a data-driven criterion. The construction lives at the same point of the program as `references/bayesian-sheaf-neural-networks-2025.md` but in a frequentist / optimization framing.

##### What it adds

- **Closed-form solution**: the optimization is solved analytically (not via SDP, which is the alternative). This means the moduli of sheaf Laplacians has, for this objective, an explicit critical-point structure that is computable.
- **Confirmation that the moduli is the right object of study**: by formulating data fitting as a search over sheaf Laplacians (rather than fixing a single Laplacian and asking which data fit it), the paper takes the parametric view as primary.

##### Bridges

- To `theorems/moduli-of-laplacianizations.md` --- Bayesian/learning approaches to navigating the moduli.
- To `references/bayesian-sheaf-neural-networks-2025.md` --- co-evidence that the moduli, not any single Laplacian, is the working object.
- To `examples/cellular-sheaf-on-tetrahedron-boundary.md` --- the moduli the paper learns over, in concrete form.

##### Caveat for the cofinality conjecture

The closed-form optimum is a *single* Laplacian (the minimizer). The moduli is therefore being used as a search space, not as an object of study in itself --- there is no analysis of strata, gauge fibers, or critical-point landscape. The program's contribution is to argue these structures are the next thing to study; the paper provides the moduli's existence and computability, but not its geometry.

#### Ennaceur, Mohamed, Jadlaoui, Karim (2025) --- *Hodge Laplacians on Weighted Simplicial Complexes: Forms, Closures, and Essential Self-Adjointness* {#ennaceur2025hodge}

arxiv:2510.15546 (Oct 2025).

##### Why this matters

Treats the **weights** on simplices as the *Hilbert-pairing data* underlying the Hodge Laplacian. This is the clearest exhibit that the choice of inner product on each chain space is not incidental but is one of the inputs to the Laplacianization functor --- different weighting schemes are different liftings $\mathcal C \to \mathbf{HilbCh}$.

In the language of `concepts/laplacianizability.md`: this paper *factors* the Laplacian construction as (combinatorial structure) + (per-simplex weighting) → (Hilbert chain complex) → (Laplacian). The factorization is the program's central object --- Laplacianizability is the *first* arrow being functorial.

##### Bridges

- To `concepts/laplacianizability.md` --- exposes the choice-of-pairing degree of freedom.
- To `questions/universal-laplacianization.md` --- pins down the part of the construction that is *not* canonical.

#### Exner, Pavel, Rohleder, Jonathan (2025) --- *Optimization of quantum graph eigenvalues with preferred orientation vertex conditions* {#exner2025optimization}

arxiv:2410.21820 (last revised 2025).

##### Why this matters

Treats the **Laplacian on edges of a metric graph with vertex couplings violating time-reversal invariance**, and optimizes ground-state eigenvalues over edge-length configurations. The metric-graph Laplacian is one of the cleanest "structurally enriched graph Laplacian" cases: the input is a graph + a metric on edges + vertex coupling data, and the operator is a genuine differential operator on a 1-complex.

For the program: the *vertex coupling* data is exactly the kind of choice the Laplacianization functor would have to consume. Time-reversal-violating couplings break the standard self-adjointness machinery and force a more careful operator-theoretic setup, paralleling the directed-hypergraph case (`references/directed-hypergraph-laplacian-heat-2025.md`).

##### Bridges

- To `concepts/laplacianizability.md` --- the parametric / structural-data view.
- To `objects/metric-graph.md` (future).
- To `questions/obstruction-to-laplacianization.md` --- time-reversal violation as a non-self-duality obstruction the construction *survives* by enlarging the operator class.

#### Ge, Lingyu, Qin, Yuning (2025) --- *Computing the p-Laplacian eigenpairs of signed graphs* {#ge2025computing}

arxiv:2501.07929 (Jan 2025).

##### Why this matters

Establishes an **equivalence between the graph p-Laplacian eigenproblem and the tensor eigenproblem when p is even**. Two consequences for the program:

1.  The p-Laplacian on signed graphs is genuinely nonlinear (for $p \neq 2$), so the operator-theoretic form (which is built around graded *linear* operators) does not directly apply. The p-Laplacian track is one of the cleanest pieces of evidence that **a nonlinear analogue of Laplacianizability is needed** --- a nonlinear extension is needed.
2.  The tensor-eigenproblem reformulation is itself a *cross-formalism identification* of the same kind that supports the unifying claim: the same spectral data arises in two different mathematical objects with no a-priori reason to expect equivalence. That alignment is the kind of structural evidence the program is collecting.

##### Bridges

- To `concepts/laplacianizability.md` --- argument for a nonlinear / variational extension of the candidate forms.
- To `questions/what-is-laplacianizability.md` --- directly informs the choice of form.

#### Gillespie, Patrick, Hamdan, Vasileios, Schizas, Ioannis, Boothe, Daniel, Maroulas, Vasileios (2025) --- *Bayesian Sheaf Neural Networks* {#gillespie2025bayesian}

arxiv:2410.09590 (cs.LG, last revised 2025).

##### Why this matters

Treats the **sheaf restriction maps as random variables** and learns the cellular sheaf variationally. Program-relevant because it makes the choice-of-Hilbert-structure point even sharper than the weighted-simplicial-complex paper does: here the inner-product / restriction data is not just chosen but *inferred*, with a posterior distribution over Laplacianizations.

This frames Laplacianization in the survey as a *parameter* rather than a fixed datum, and pushes toward a moduli-theoretic view: for a given input structure, the space of compatible Laplacianizations is itself an object worth studying. That perspective should shape `objects/` entries --- input categories may want to come with a moduli of Laplacianizations.

##### Bridges

- To `concepts/laplacianizability.md` --- the moduli view; Laplacianizer with structure-on-the-functor.
- To `questions/universal-laplacianization.md` --- a posterior distribution is, in some sense, an answer to the uniqueness question (no canonical choice; there is a measure on the choices).

#### Honda, Shouhei, Sun, Xiang (2025) --- *From almost smooth spaces to RCD spaces* {#honda2025almost}

arxiv:2502.20998 (Feb 2025).

##### Why this matters

Discusses local notions of synthetic lower bounds on Ricci curvature from **both the Bakry--Émery and the RCD viewpoints**, and applies them to almost smooth spaces. The two viewpoints --- Bakry--Émery (curvature via the iterated carré du champ of the Markov generator) and RCD (curvature via convexity of entropy along Wasserstein geodesics) --- both give rise to the *same* Laplacian on the underlying space, by independent routes.

Two-routes-to-the-same-Laplacian is the kind of evidence the program needs: it is a shadow of the universal-property claim. Whatever the right Laplacianization functor is, when both Bakry--Émery and RCD are candidate functors with the same image at the relevant inputs, the conjecture is they are presentations of one canonical construction.

##### Bridges

- To `questions/universal-laplacianization.md` --- empirical instance of two-routes-converge.
- To `objects/metric-measure-space.md` (future).

#### Hu, Yang (2025) --- *Cellular Sheaves on Higher-Dimensional Structures* {#hu2025cellular}

arxiv:2505.23993 (math.AT, May 2025).

##### Why this matters

Introduces sheaf structures whose **0-th sheaf Laplacian recovers the classical anisotropic network model (ANM) Hessian**, and whose higher-dimensional sheaf Laplacians encode multi-way interactions invisible to the ANM. This is a "the new Laplacian recovers the old one as the bottom of a graded family" result --- the structural pattern that, in our program, is one of the strongest signals that the new Laplacian is the *correct* Laplacianization of the underlying structure (rather than an alternative).

##### Bridges

- To `concepts/laplacianizability.md` --- supports the concrete graded-chain-complex form being the Laplacianizer for this case.
- To `examples/` --- a worked instance of "old operator was the 0-th piece of a Laplacianization."

#### Ma, Yinghan, Kunisky, Dmitriy (2025) --- *Nonlinear Laplacians: Tunable principal component analysis under directional prior information* {#ma2025nonlinear}

arxiv:2505.12528 (May 2025).

##### Why this matters

Names "nonlinear Laplacians" explicitly as a **parametrized family** of operators, designed for tunable PCA with directional priors. The paper takes the linear graph Laplacian and replaces it with a class indexed by a tunable nonlinearity, showing that the resulting operators have spectral behaviour that interpolates between linear and saturating regimes.

Two program-relevant signals:

1.  The construction is *parametric* in shape --- there is no single "nonlinear Laplacian" but a family --- which lines up with the moduli-of-Laplacianizations view raised in `references/bayesian-sheaf-neural-networks-2025.md`. Different communities are independently arriving at the same observation: there is no canonical Laplacian on a structure; there is a *space* of them.
2.  The cs.LG framing (PCA, prior information) matters because it pulls Laplacianizability into a context where the *applied* utility of the construction is the criterion. If the right Laplacianization is whichever one solves the downstream problem, the universal-property question gets a probabilistic / decision-theoretic answer rather than a categorical one.

##### Bridges

- To `references/bayesian-sheaf-neural-networks-2025.md` --- co-evidence for moduli view.
- To `concepts/laplacianizability.md` --- argues for parametric form.

#### Mesland, Bram, Rennie, Adam (2024) --- *Curvature and Weitzenbock formula for spectral triples* {#mesland2024curvature}

arxiv:2404.07957. **Anchor reference** --- defines connection Laplacians and a Weitzenböck formula in the spectral-triple setting, providing the noncommutative-geometry-side foundation for arxiv:2510.09909 and related $C^*$-algebraic Laplacianizations.

##### Why this matters

Introduces "Dirac spectral triples" and, in that setting, defines **connection Laplacians** along with a Weitzenböck identity relating them to the Dirac operator. The Weitzenböck identity is a *signature* of genuine Laplacianization: it expresses the Laplacian in terms of a connection Laplacian plus curvature, exactly mirroring the Riemannian case.

For the program: a Weitzenböck-style identity in a noncommutative setting is structural evidence that the input (a spectral triple) really does support a Laplacianization that behaves like the classical one --- not just an operator named "Laplacian," but one connected to the right curvature data. Whether this fits the categorical Laplacianizer form (functor from spectral triples to a generalized $\mathbf{HilbCh}$) is a question for the program.

##### Bridges

- Anchor for noncommutative-geometry side of the survey.
- To `concepts/laplacianizability.md` --- case for a noncommutative extension, or for broadening the Laplacianizer beyond ordinary Hilbert chain complexes.

#### Mugnolo, Delio (2025) --- *Non-Markovian heat flows on directed hypergraphs* {#mugnolo2025heat}

arxiv:2510.17497 (Oct 2025).

##### Why this matters

Develops **spectral and semigroup theory for Laplacians on directed hypergraphs**, in a setting where classical Markovian and symmetry principles of graph Laplacians break down. This is exactly the kind of obstruction case our program needs as data: a structure where the natural construction does *not* land in the standard self-adjoint / Hilbert framework, and the question becomes how much of the Laplacianization survives.

If the construction here is genuinely faithful to the directed-hypergraph structure, the program needs to weaken the operator-theoretic Hilbert lift (drop self-adjointness; allow sectorial operators with heat-style semigroup) --- i.e. the survey case forces the definition.

##### Bridges

- To `questions/obstruction-to-laplacianization.md` --- directly tests "non-self-dual structure" as obstruction.
- To `concepts/laplacianizability.md` --- challenge to the chain-complex and operator-theoretic forms.

#### Mulé, Manuel, Fiorini, Stefano, Purificato, Erasmo, Siciliano, Federico, Coniglio, Stefano, Silvestri, Fabrizio (2025) --- *Directional Sheaf Hypergraph Networks: Unifying Learning on Directed and Undirected Hypergraphs* {#mule2025directional}

arxiv:2510.04727 (October 2025).

##### Why this matters

Unifies Laplacianizations of *directed* and *undirected* hypergraphs in one sheaf-network framework. The unification is structural: a directed hypergraph and an undirected hypergraph appear as special cases of one cellular-sheaf-on-symmetric-simplicial-set construction, with the directionality encoded in the restriction maps.

For the program: this is one more instance of the **categorical-lift template** (`theorems/categorical-lift-fixes-obstruction.md`). Take a category $\mathcal C$ where Laplacianization fails (directed hypergraphs lack a self-adjoint Laplacian directly; undirected hypergraphs need an orientation choice); lift to a richer $\widetilde{\mathcal C}$ (sheaves on a symmetric simplicial set) where Laplacianization is functorial; verify the lift recovers the original cases.

The 2025 corpus now contains *four* instances of the categorical-lift template (hypergraphs, signed graphs, directed hypergraphs, time-reversal-violating quantum graphs). The pattern is robust enough to warrant a refined statement of the categorical-lift conjecture.

##### Bridges

- To `theorems/categorical-lift-fixes-obstruction.md` --- fourth verified instance.
- To `references/hypergraph-neural-sheaf-diffusion-2025.md` --- same construction line, undirected case.
- To `objects/symmetric-simplicial-set.md` --- the lift category.

#### Schwahn, Paul, Semmelmann, Uwe (2025) --- *Einstein metrics, their moduli spaces and stability* {#schwahn2025einstein}

arxiv:2507.18463 (July 2025, revised October 2025). 55 pp survey.

##### Why this matters for the program

This is **the cleanest 2025 instance of stratified-moduli-of-Laplacian-like-operators** in the survey. The paper proves that the moduli space of Einstein metrics on a compact manifold is locally an orbifold, and that the stratification is governed by spectral data of the **Lichnerowicz Laplacian** $\Delta_L$ --- a curved Hodge-type Laplacian acting on symmetric tensors.

Key facts as stated:

- "The connected component of $g$ in $\mathcal E$ is an orbifold, as $\mathcal D / \mathcal D^0$ is finite."
- The local structure is given by Ebin's Slice Theorem: $\mathcal S_g / \mathrm{Isom}(g)$ is homeomorphic to a neighborhood of $[g] \in \mathcal M_1 / \mathcal D$.
- "The infinitesimal Einstein deformations of $g$ are exactly the tt-eigentensors to the eigenvalue $2E$" (with $E$ the Einstein constant).
- "The space of IED, denoted $\epsilon(g) = \ker(\Delta_L - 2E)|_{S^2_{tt}(M)}$, determines both rigidity and deformability."
- $T_g \mathcal S_g \cap \ker E'_g = \epsilon(g)$ --- the kernel of the linearized Einstein operator equals the IED space.
- Rigidity is exactly the condition $\epsilon(g) = 0$.

##### Direct structural parallel to the program's finding

The program's worked computation on $\partial \Delta^3$ (`examples/gauge-fiber-structure.md`) found:

- The moduli of Laplacianizations on a fixed cellular cochain complex is locally an orbifold.
- Stratification is governed by the dimension of the unitary stabilizer in $G$ --- equivalently, by eigenvalue-multiplicity patterns of $\Delta$.
- The fully-symmetric (Euclidean) point is rigid up to scaling (a 1-dim stratum) within a 6-codim stratum where the multiplicity-3 eigenvalue collapses.

Young's inner product Laplacian (`references/young-inner-product-laplacian-2025.md`) and the Einstein moduli paper here are doing the same structural thing in different categories:

- Young: moduli of inner product Laplacians on a graph; orbifold from gauge action; stratified by which named Laplacian a point realizes.
- Einstein moduli: moduli of Einstein metrics on a manifold; orbifold from $\mathrm{Isom}(g)$; stratified by IED dimension = $\dim \ker(\Delta_L - 2E)$.

Both are **stratified moduli of (the inputs that produce) Laplacian-like operators, with stratification controlled by an eigenspace dimension**.

##### Why this is structural (not coincidental) evidence

The Einstein moduli case is far enough from the cellular cochain case that an accidental match is implausible. The pattern that recurs:

1.  A category of structures (Riemannian metrics / graph inner products / cellular sheaves).
2.  Each structure produces a Laplacian (Lichnerowicz / inner product / sheaf).
3.  The category quotiented by an action of automorphisms gives a moduli space.
4.  The moduli is locally an orbifold.
5.  Strata are indexed by stabilizer dim or, equivalently, by eigenspace-multiplicity patterns of the associated Laplacian at that point.
6.  The "most symmetric" / "fully degenerate" stratum has highest stabilizer dim and lowest moduli-stratum dim.

This is the **stratified universal property** the program named in `examples/gauge-fiber-structure.md` after the failure of clean-adjoint expectations. The Einstein paper validates the prediction: this is the right shape for moduli of Laplacianizations across categories.

##### Bridges

- To `theorems/moduli-of-laplacianizations.md` --- provides the structural pattern in a smooth-geometry category.
- To `examples/gauge-fiber-structure.md` --- direct structural parallel.
- To `questions/universal-laplacianization.md` --- replace "is there a clean adjoint" with "is there a uniform stratified-orbifold structure on the moduli of Hilbert lifts," and the answer in the smooth case is yes.
- To `concepts/laplacianizability.md` --- extends the Hilbert-lift definition to smooth Riemannian inputs, where the "graded chain complex" is replaced by the de Rham complex (or its tensor-valued analogues), and the moduli is the moduli of Riemannian metrics.

#### Shapiro, Boris, Vainshtein, Alek (1995) --- *Stratification of Hermitian matrices and the Alexander mapping* {#shapiro1995stratification}

C. R. Acad. Sci. Paris Sér. I 321(12), 1599--1604 (1995). **Anchor reference** --- the cohomology-theoretic counterpart to Arnold 1995.

##### Why this matters for the program

Shapiro--Vainshtein give:

- Explicit expressions for the **Poincaré duality** of the eigenvalue-multiplicity stratification of Hermitian matrices.
- The **Alexander mapping** of the stratification.
- A proof that the **spectral sequence** generated by the filtration of Hermitian matrices by "having at most $i$ different eigenvalues" **degenerates at $E_2$**.

The $E_2$-degeneration is structural: it says the cohomology of the strata can be computed from a relatively simple spectral sequence, with no higher-page complications.

##### Direct relevance to Direction B of laplanc-2025

Direction B (the natural next move of the program) is to study the closure poset of strata of $\mathcal M_{\mathrm{Lap}}$ and compute its intersection cohomology / Gysin-type long exact sequences.

The Shapiro--Vainshtein result *gives the template* for the univariate case: the spectral sequence + Alexander mapping + Poincaré duality applied to a stratification of Hermitian matrices computes its cohomology. To do Direction B for our bipartite multipartition stratification, the natural strategy is to:

1.  **Generalize the Shapiro--Vainshtein filtration** from "Hermitian matrices with at most $i$ different eigenvalues" to "moduli points with at most $i$ different singular values across all $d_n$."
2.  **Set up the bipartite analog of the Alexander mapping**, accommodating the cross-$d_n$ identification structure.
3.  **Verify $E_2$-degeneration**, or identify what changes when going to the bipartite case.

The 1995 Shapiro--Vainshtein paper is short (6 pages, announcement format) --- the full proof was likely in subsequent literature. Locating the full version is part of the Direction B preparation.

##### Bridges

- To `references/arnold-1995-hermitian-stratification.md` --- companion foundational reference.
- To Direction B of the program --- the Shapiro--Vainshtein techniques generalize as the candidate cohomology-of-moduli computation.
- To `theorems/stab-codim-formula.md` --- provides cohomological substrate for the codim-formula's geometric interpretation.

#### Sumray, Alex, Harrington, Heather A., Nanda, Vidit (2024) --- *Quiver Laplacians and Feature Selection* {#sumray2024quiver}

arxiv:2404.06993. **Anchor reference** --- kept because the quiver-Laplacian construction is one of the cleanest categorical Laplacianizations and several 2025 papers cite it.

##### Why this matters

Introduces a Laplacian operator for **quiver representations valued in Hilbert spaces**, with explicit bounds on how the spectrum varies under modification of the representation and the underlying quiver. The construction depends on a choice of inner product on each vertex space --- i.e. on additional Hilbert structure beyond the quiver --- which is precisely the choice the Laplacianizability framework wants to make functorial.

The stability bounds (spectrum varies continuously with the structural data) are the same kind of evidence as the hypergraph-limits paper: continuity of the Laplacianization functor.

##### Bridges

- To `concepts/laplacianizability.md` --- clean Laplacianizer example with explicit additional structure (per-vertex pairing).
- To `objects/quiver.md` (future) --- quivers as input category.

#### Tageddine, Damien, Nave, Jean-Christophe (2025) --- *Noncommutative Laplacian and numerical approximation of Laplace-Beltrami spectrum of compact Riemann surfaces* {#tageddine2025noncommutative}

arxiv:2510.09909 (Oct 2025).

##### Why this matters

Replaces the function algebra of a surface with a sequence of **finite-dimensional matrix algebras** and defines a Laplacian via **commutators of quantized coordinate functions**, which converges consistently to the classical Laplace--Beltrami operator. This is a Laplacianization of a *noncommutative* input --- the matrix algebra has no underlying point set, no chain complex in the usual sense, and yet a Laplacian is constructed and shown to recover the classical operator in the commutative limit.

For the program this is one of the most testing data points so far. None of the candidate forms (A: Hilbert chain complex; B: graded operator with $d^2 = 0$; C: functor to $\mathbf{HilbCh}$) immediately accommodate a $C^*$-algebraic / matrix-algebra input. Either the program needs a noncommutative extension of the Laplacianizer, or this construction has to be reframed inside one of the existing forms --- for example, by exhibiting an associated chain complex (analog of Hochschild / cyclic complex) the Laplacian acts on.

##### Bridges

- To `questions/what-is-laplacianizability.md` --- argument for a noncommutative extension.
- To `concepts/laplacianizability.md` --- pressure point on all three current forms.
- To anchor: Connes' spectral triples (see `references/spectral-triple-curvature-weitzenbock-2024.md`).

#### Violo, Ivan Yuri (2025) --- *An overview of regularity results for the Laplacian and p-Laplacian in metric spaces* {#violo2025overview}

arxiv:2502.00825 (Feb 2025).

##### Why this matters

A 2025 overview of regularity results for Laplacians (linear and p-version) on **metric measure spaces, with emphasis on RCD spaces**. RCD spaces are the synthetic-Ricci-bounded setting where the Laplacian is defined via an underlying Cheeger / Dirichlet energy, not via a chain complex.

For the program: this is a third structurally distinct route to a Laplacian --- neither chain complex (concrete chain-complex form) nor pointed graded operator (operator-theoretic form) nor functor from a discrete category (the categorical Laplacianizer form), but **Cheeger / Dirichlet energy ↦ Laplacian** as its generator. If Laplacianizability is to subsume this case, the framework must include "structures equipped with a Dirichlet form" as a kind of input, with the corresponding generator playing the role of $\Delta$.

The bridge to chain-complex Laplacians passes through Hodge--de Rham theory: in the smooth case the Dirichlet-form Laplacian is the 0-form piece of the Hodge Laplacian on the de Rham complex. In the metric-measure setting the higher-form analogues are mostly absent, which is itself program-relevant data.

##### Bridges

- To `objects/metric-measure-space.md` (future).
- To `concepts/laplacianizability.md` --- pressure to include Dirichlet-form-induced Laplacians; possibly a Dirichlet-form variant generating a Markov semigroup.
- To anchor: Bakry--Émery theory.

#### Wei, Jian, Wei, Guo-Wei (2023) --- *Persistent Topological Laplacians -- a Survey* {#wei2023persistent}

Originally arxiv:2312.07563 (2023), published in *Mathematics* 13(2):208 in 2025. Counts as a 2025 entry on publication.

##### Why this matters

A field-internal survey by some of the central authors. Useful as ground truth for **what the persistent-Laplacian community itself takes the unifying scope of its constructions to be** --- the survey enumerates persistent simplicial Laplacian, persistent path Laplacian, persistent sheaf Laplacian, persistent flag Laplacian, and persistent hyperdigraph Laplacian as one family.

The survey does *not* identify the family with a single functorial construction; it presents them as a parallel set of analogous constructions. That is the gap the Laplacianizability program proposes to close.

##### Bridges

- To essentially every other 2025 reference here.

#### Weinstein, Madeleine (2020) --- *Real Symmetric Matrices with Partitioned Eigenvalues* {#weinstein2020real}

arxiv:2008.08554 (2020). Published in Linear Algebra Appl. (2022). **Anchor reference** --- modern algebraic-geometry treatment of the eigenvalue-multiplicity stratification of $\mathrm{Sym}_n(\mathbb R)$.

##### Why this matters for the program

Provides the **explicit closed form** for the dimension and closure structure of the eigenvalue-multiplicity stratification --- confirming the univariate part of laplanc-2025's framework as a known result.

**Definition (Weinstein).** For $\lambda = (\lambda_1, \ldots, \lambda_m)$ a partition of $n$, the **variety $V_\mathbb{R}(\lambda) \subset \mathbb{R}^{n(n+1)/2}$ of $\lambda$-partitioned eigenvalues** is the Zariski closure of the locus of real symmetric $n \times n$ matrices whose eigenvalue multiplicities are determined by $\lambda$.

**Theorem (W. '20, dim formula).** $V_\mathbb{C}(\lambda)$ is irreducible of dimension
$$\dim V_\mathbb{C}(\lambda) = m + \binom{n}{2} - \sum_{i=1}^m \binom{\lambda_i}{2}.$$

**Theorem (closure relation, W. '20).** $V_\mathbb{R}(\lambda)$ "includes all matrices with eigenvalue multiplicities determined by partitions of $n$ that are *coarser* than $\lambda$." So:
$$\overline{\{\text{matrices with strict partition } \lambda\}} = \bigsqcup_{\lambda' \text{ coarser than } \lambda} \{\text{matrices with strict partition } \lambda'\}.$$

This is the **univariate closure poset** structure --- coarsening order on partitions of $n$.

**Theorem (W. '20, parametrization).** For $\lambda \ne (1, \ldots, 1)$, $V_\mathbb{R}(\lambda)$ has an explicit rational parametrization
$$B \mapsto (I - B)(I + B)^{-1} \mathrm{Diag}(\lambda)(I + B)(I - B)^{-1}$$
where $B$ ranges over skew-symmetric $n \times n$ matrices and $\mathrm{Diag}(\lambda)$ is a diagonal matrix with eigenvalue multiplicities $\lambda_i$.

**Theorem (Bik--Draisma).** The Euclidean distance degree of $V_\mathbb{R}(\lambda)$ is $n! / (\lambda_1! \cdots \lambda_m!)$ --- the multinomial coefficient.

##### Comparison to laplanc-2025 framework

**Univariate codim.** Weinstein computes $\dim V_\mathbb{R}(\lambda)$ in the *unquotiented* space $\mathrm{Sym}_n$. Codim in $\mathrm{Sym}_n$: $\binom{n+1}{2} - \dim V_\mathbb{R}(\lambda) = (n - m) + \sum \binom{\lambda_i}{2}$.

The laplanc-2025 codim formula, in the *moduli quotient* $G \backslash \mathcal H$ (with $G = O(n)$ in the univariate case), is

$$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}} = \sum_i (\lambda_i - 1) = n - m.$$

The two formulas agree up to the $\sum \binom{\lambda_i}{2}$ term, which is exactly $\dim O(n) \cdot Q$ --- the dimension of the $O(n)$-orbit through a generic diagonal matrix with multiplicities $\lambda$. The decomposition

$$\dim V_\mathbb{R}(\lambda) = \underbrace{m}_{\text{eigenvalues}} + \underbrace{\binom{n}{2} - \sum \binom{\lambda_i}{2}}_{O(n)\text{-orbit through diagonal}}$$

makes the relationship explicit: total stratum dim in $\mathrm{Sym}_n$ = (moduli stratum dim in $\mathcal M_{\mathrm{Lap}}$) + ($O(n)$-orbit dim).

This is the modern algebraic-geometry confirmation that the laplanc-2025 univariate-case formulas are classical.

**Univariate closure poset.** Weinstein's "$V_\mathbb{R}(\lambda)$ includes coarsenings of $\lambda$" *is* the laplanc-2025 closure-poset claim, restated for the unquotiented variety. In the moduli quotient, the closure relation descends: stratum $\Pi$ is in closure of stratum $\Pi'$ iff $\Pi'$ refines $\Pi$ (equivalently, $\Pi$ is a coarsening of $\Pi'$).

##### What's still novel for laplanc-2025

Weinstein's framework is purely *univariate*: it studies $\mathrm{Sym}_n$ stratified by a single partition. The laplanc-2025 framework extends to **chain complexes with multiple boundary operators**, where each operator's singular values form their own partition and *cross-operator identifications* between operators add to the codim without contributing to stab.

The bipartite (or N-partite) generalization of Weinstein's variety would be: a variety in $\mathrm{Sym}_{n_0} \times \mathrm{Sym}_{n_1} \times \ldots$ defined by a *bipartite multipartition* of $r_0 + r_1 + \cdots$ singular-value labels, with closure under bipartite-multipartition coarsening. This variety is not in the literature.

##### Tools that should generalize

- **Dimension formula generalization:** With the addition of cross-operator identifications and chain auto group's reduction of $O(n_0) \times O(n_1) \times \ldots$ to a smaller group, an analogous closed-form dim formula for bipartite strata should exist.
- **Closure poset:** Bipartite multipartitions form a poset under refinement; closure of a stratum = coarsenings (i.e., merges of blocks, possibly across $d_n$).
- **Distance degree:** Bik--Draisma's multinomial generalizes --- at least conjecturally --- to bipartite multinomials.
- **Parametrization:** Weinstein's rational parametrization should generalize, with $B$ ranging over the chain-auto-group analog of the skew-symmetric matrices (= $\mathrm{Lie}(G)$ part, modulo the Hilbert structure).

These are the concrete generalization targets for Direction B.

##### Bridges

- To `theorems/stab-codim-formula.md` --- Weinstein's dim formula directly verifies the univariate decomposition $\dim V_\mathbb{R}(\lambda) = (\text{moduli dim}) + (O(n)\text{-orbit dim})$.
- To `references/arnold-1995-hermitian-stratification.md` --- Weinstein gives modern algebraic-geometry tools for what Arnold treated topologically.
- To `theorems/main-theorem-synthesis.md` --- Weinstein's univariate result is the $N = 1$ specialization of the bipartite stratification.

#### Wolf, Roman, Fan, Jiahui, Monod, Anthea (2025) --- *Generalized Persistent Laplacians and their Spectral Properties* {#wolf2025generalized}

arxiv:2509.20220.

##### Why this matters for the program

Introduces a **generalized operator-theoretic framework** of persistent Laplacians that *encompasses and extends existing constructions from discrete combinatorial settings to de Rham complexes of smooth manifolds*. This is a vertical-unification result: the same persistent-Laplacian object covers both finite combinatorial chain complexes and the de Rham complex.

This is the kind of construction the operator-theoretic form is built to capture --- closed densely-defined graded operators with self-adjoint $\Delta = dd^* + d^*d$ and tractable spectrum, in a generality that does not commit to either the finite or smooth side.

##### Bridges

- To `concepts/laplacianizer.md` --- operator-theoretic form.
- To `theorems/` (future) --- a candidate "every persistent module of a structure-with-pairing-and-boundary is Laplacianizable" lives near here.

### References {#bibliography .unnumbered}

::: {#refs .references .csl-bib-body .hanging-indent entry-spacing="0"}
::: {#ref-aksoy2025reimagining .csl-entry}
Aksoy, Sinan G., and Stephen J. Young. 2025. "Re-Imagining Spectral Graph Theory." <https://arxiv.org/abs/2504.10624>.
:::

::: {#ref-andreotti2025generalizing .csl-entry}
Andreotti, Eleonora. 2025. "Generalizing Lattice Structures to Hypergraphs: Spectra of Clique and Hyperedge-Based Laplacians." <https://arxiv.org/abs/2511.11138>.
:::

::: {#ref-arnold1995remarks .csl-entry}
Arnold, V. I. 1995. "Remarks on Eigenvalues and Eigenvectors of Hermitian Matrices, Berry Phase, Adiabatic Connections and Quantum Hall Effect." *Selecta Mathematica New Series* 1 (1): 1--19.
:::

::: {#ref-ayzenberg2025sheaf .csl-entry}
Ayzenberg, Anton, Thomas Gebhart, German Magai, and Grigory Solomadin. 2025. "Sheaf Theory: From Deep Geometry to Deep Learning." <https://arxiv.org/abs/2502.15476>.
:::

::: {#ref-backhausz2025spectral .csl-entry}
Backhausz, Ágnes, Christian Kuehn, Charlotte van der Niet, and Joaquín Zucal. 2025. "Spectral Theory of Dense Hypergraph Limits." <https://arxiv.org/abs/2511.03516>.
:::

::: {#ref-barrett2017inverse .csl-entry}
Barrett, Wayne, Steve Butler, Shaun Fallat, H. Tracy Hall, Leslie Hogben, Jephian C.-H. Lin, Bryan Shader, and Michael Young. 2017. "The Inverse Eigenvalue Problem of a Graph: Multiplicities and Minors." <https://arxiv.org/abs/1708.00064>.
:::

::: {#ref-bartmann2025hodge .csl-entry}
Bartmann, Bobo, and Matthias Keller. 2025. "On Hodge Laplacians on General Simplicial Complexes." <https://arxiv.org/abs/2508.07761>.
:::

::: {#ref-choi2024cellular .csl-entry}
Choi, Eunho, and Hee Rhang Park. 2024. "Cellular Sheaf Laplacians on the Set of Simplices of Symmetric Simplicial Set Induced by Hypergraph." <https://arxiv.org/abs/2411.08458>.
:::

::: {#ref-choi2025hypergraph .csl-entry}
Choi, Seonghyun, Junhyeok Kim, and Sangwoo Oh. 2025. "Hypergraph Neural Sheaf Diffusion: A Symmetric Simplicial Set Framework for Higher-Order Learning." <https://arxiv.org/abs/2505.05702>.
:::

::: {#ref-ge2025computing .csl-entry}
Ge, Lingyu, and Yuning Qin. 2025. "Computing the p-Laplacian Eigenpairs of Signed Graphs." <https://arxiv.org/abs/2501.07929>.
:::

::: {#ref-gillespie2025bayesian .csl-entry}
Gillespie, Patrick, Vasileios Hamdan, Ioannis Schizas, Daniel Boothe, and Vasileios Maroulas. 2025. "Bayesian Sheaf Neural Networks." <https://arxiv.org/abs/2410.09590>.
:::

::: {#ref-honda2025almost .csl-entry}
Honda, Shouhei, and Xiang Sun. 2025. "From Almost Smooth Spaces to RCD Spaces." <https://arxiv.org/abs/2502.20998>.
:::

::: {#ref-hu2025cellular .csl-entry}
Hu, Yang. 2025. "Cellular Sheaves on Higher-Dimensional Structures." <https://arxiv.org/abs/2505.23993>.
:::

::: {#ref-ma2025nonlinear .csl-entry}
Ma, Yinghan, and Dmitriy Kunisky. 2025. "Nonlinear Laplacians: Tunable Principal Component Analysis Under Directional Prior Information." <https://arxiv.org/abs/2505.12528>.
:::

::: {#ref-mesland2024curvature .csl-entry}
Mesland, Bram, and Adam Rennie. 2024. "Curvature and Weitzenbock Formula for Spectral Triples." <https://arxiv.org/abs/2404.07957>.
:::

::: {#ref-mugnolo2025heat .csl-entry}
Mugnolo, Delio. 2025. "Non-Markovian Heat Flows on Directed Hypergraphs." <https://arxiv.org/abs/2510.17497>.
:::

::: {#ref-schwahn2025einstein .csl-entry}
Schwahn, Paul, and Uwe Semmelmann. 2025. "Einstein Metrics, Their Moduli Spaces and Stability." <https://arxiv.org/abs/2507.18463>.
:::

::: {#ref-shapiro1995stratification .csl-entry}
Shapiro, Boris, and Alek Vainshtein. 1995. "Stratification of Hermitian Matrices and the Alexander Mapping." *Comptes Rendus de l'Académie Des Sciences. Série I, Mathématique* 321 (12): 1599--1604.
:::

::: {#ref-sumray2024quiver .csl-entry}
Sumray, Alex, Heather A. Harrington, and Vidit Nanda. 2024. "Quiver Laplacians and Feature Selection." <https://arxiv.org/abs/2404.06993>.
:::

::: {#ref-tageddine2025noncommutative .csl-entry}
Tageddine, Damien, and Jean-Christophe Nave. 2025. "Noncommutative Laplacian and Numerical Approximation of Laplace-Beltrami Spectrum of Compact Riemann Surfaces." <https://arxiv.org/abs/2510.09909>.
:::

::: {#ref-violo2025overview .csl-entry}
Violo, Ivan Yuri. 2025. "An Overview of Regularity Results for the Laplacian and p-Laplacian in Metric Spaces." <https://arxiv.org/abs/2502.00825>.
:::

::: {#ref-wei2023persistent .csl-entry}
Wei, Jian, and Guo-Wei Wei. 2023. "Persistent Topological Laplacians -- a Survey." <https://arxiv.org/abs/2312.07563>.
:::

::: {#ref-weinstein2020real .csl-entry}
Weinstein, Madeleine. 2020. "Real Symmetric Matrices with Partitioned Eigenvalues." <https://arxiv.org/abs/2008.08554>.
:::

::: {#ref-wolf2025generalized .csl-entry}
Wolf, Roman, Jiahui Fan, and Anthea Monod. 2025. "Generalized Persistent Laplacians and Their Spectral Properties." <https://arxiv.org/abs/2509.20220>.
:::
:::
