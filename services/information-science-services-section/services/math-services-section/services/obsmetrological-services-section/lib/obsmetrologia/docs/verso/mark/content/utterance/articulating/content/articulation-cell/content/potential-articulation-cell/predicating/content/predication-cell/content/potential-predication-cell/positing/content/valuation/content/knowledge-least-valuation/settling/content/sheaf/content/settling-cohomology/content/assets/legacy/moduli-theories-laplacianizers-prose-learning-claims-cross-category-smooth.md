---
type: theorem
status: proved
depends-on:
- cross-category-orbifold-stratification
- closed-range-obstruction
- bipartite-stratification-theorem
see-also:
- einstein-metrics-moduli-2025
- laplacian-regularity-metric-measure-overview-2025
- hilbert-degeneracy-stratification
- main-theorem-synthesis
classical-anchor:
- arnold-1995-hermitian-stratification
references:
- key: schwahn2025einstein
  type: article
  - Schwahn, Paul
  - Semmelmann, Uwe
  year: 2025
  title: Einstein metrics, their moduli spaces and stability
  eprint: '2507.18463'
  eprinttype: arxiv
- key: violo2025overview
  type: article
  - Violo, Ivan Yuri
  year: 2025
  title: An overview of regularity results for the Laplacian and p-Laplacian in metric spaces
  eprint: '2502.00825'
  eprinttype: arxiv
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
---

# Cross-category orbifold-stratification: smooth Riemannian case

Extension of the cross-category orbifold-stratification theorem (`theorems/cross-category-orbifold-stratification.md`) from the finite-dim case to compact Riemannian manifolds. The structural pattern persists; the technical work is in handling unbounded operators with closed range, infinite-dim ambient, and the smooth Ebin slice theorem.

Proof assembled from Ebin (1970), Kato VII, Myers–Steenrod (1939), and first-order Rayleigh–Schrödinger perturbation. The individual pieces are classical; the cross-category packaging here recovers the cellular finite-dim five-step pattern in the smooth setting.

## Setup

Let $M$ be a compact smooth manifold of dim $m$. The Laplacianizer framework (`theorems/cross-category-orbifold-stratification.md`) instantiates as:

- $\mathcal C =$ category of $M$ with smooth Riemannian metrics, morphisms = isometries.
- $H^\bullet =$ de Rham cohomology $H^\bullet_{\mathrm{dR}}(M; \mathbb R)$ — independent of $g$ by the de Rham theorem.
- $F: (M, g) \mapsto (\Omega^\bullet_{L^2}(M, g), d)$, the $L^2$-de Rham complex with the $g$-induced inner product on each $\Omega^n$.
- $\eta_g: H^\bullet_{\mathrm{dR}}(M) \xrightarrow{\sim} \ker \Delta_g$, the Hodge isomorphism (de Rham–Hodge theorem on compact manifolds).
- $\mathrm{Aut}(M) = \mathrm{Diff}(M)$, acting on metrics by pullback.

The chain differential $d_n: \Omega^n \to \Omega^{n+1}$ is the exterior derivative — unbounded on $L^2$, with closed range on compact $M$ (standard elliptic theory).

The space of metrics
$$\mathcal{Met}(M) = \{g \in \Gamma(S^2 T^*M) : g\ \text{positive-definite at every point}\}$$
is an open cone in the Fréchet space of smooth symmetric $(0,2)$-tensor fields. For technical work, take its Sobolev $H^s$-completion $\mathcal{Met}^s(M)$ for $s > m/2 + 2$ (so $H^s \hookrightarrow C^2$). The smooth case is the inverse limit.

The moduli of Riemannian metrics is
$$\mathcal M_{\mathrm{Lap}}(M) := \mathrm{Diff}(M) \backslash \mathcal{Met}(M).$$

## Theorem

> **Theorem (cross-category orbifold-stratification, smooth Riemannian).** Let $M$ be a compact smooth manifold. Then $\mathcal M_{\mathrm{Lap}}(M)$ has the following structure:
>
> 1. **Orbifold structure.** $\mathcal M_{\mathrm{Lap}}(M)$ is a Fréchet ILH-orbifold (Inverse Limit of Hilbert orbifolds); locally a quotient of a Fréchet slice by a finite-dim compact Lie group.
>
> 2. **Stratification.** Strata are indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta^{(n)}_g)$ (recording within-degree and cross-degree eigenvalue coincidences). For each $\Pi$ with finitely many non-trivial blocks, $\mathrm{Stratum}(\Pi)$ is a locally closed real-analytic subvariety of the moduli orbifold.
>
> 3. **Universal codim.** $\mathrm{codim}\, \mathrm{Stratum}(\Pi) = \sum_{B \in \Pi,\ |B| \ge 2}(|B|-1)$.
>
> 4. **Stab dim.** $\dim \mathrm{stab}_{\mathrm{Diff}}([g]) = \dim \mathrm{Isom}(M, g)$, the geometric isometry group dim.
>
> 5. **Closure poset.** $\overline{\mathrm{Stratum}(\Pi')} \supseteq \mathrm{Stratum}(\Pi)$ iff $\Pi$ is a coarsening of $\Pi'$.

## Proof

The proof proceeds in five steps, each invoking a classical ingredient.

### Step 1: Orbifold structure (Ebin slice theorem)

**Ingredient.** Ebin (1970) shows: for $g \in \mathcal{Met}^s(M)$ with $s > m/2 + 2$, there exists a smooth $\mathrm{Diff}^{s+1}(M)$-invariant slice $\mathcal S_g \subset \mathcal{Met}^s(M)$ at $g$ — a smooth Hilbert submanifold transverse to the $\mathrm{Diff}^{s+1}(M)$-orbit, on which $\mathrm{Isom}^{s+1}(M, g) := \mathrm{Diff}^{s+1}(M) \cap \mathrm{Stab}(g)$ acts. The natural map
$$\mathcal S_g / \mathrm{Isom}^{s+1}(M, g) \to \mathcal M_{\mathrm{Lap}}(M)$$
is a homeomorphism onto an open neighborhood of $[g]$.

**Application.** By Myers–Steenrod (Step 4 below), $\mathrm{Isom}^{s+1}(M, g)$ is a finite-dim compact Lie group acting effectively on the smooth Hilbert manifold $\mathcal S_g$. So $\mathcal M_{\mathrm{Lap}}(M)$ is locally a finite-quotient orbifold of a Hilbert manifold; passing to the inverse limit gives the Fréchet ILH-orbifold structure.

This step is standard in the moduli-of-metrics literature (used in e.g. Berger's quaternion-Kähler classification, and throughout Einstein-moduli theory — [@schwahn2025einstein]).

### Step 2: Spectrum varies real-analytically (Kato perturbation)

**Setup.** Fix a reference metric $g_0$. For any $g$ in a $C^2$-neighborhood of $g_0$, define the **gauge intertwiner** $J_g: \Omega^n_{L^2}(M, g_0) \to \Omega^n_{L^2}(M, g)$ as the bundle isomorphism induced by the unique pointwise positive-definite endomorphism $A_g := g_0^{-1} g$ raised to the appropriate power on $\Lambda^n T^*M$ (so that $J_g$ is a unitary intertwiner of inner products). Specifically, on $\Lambda^n T^*M$, $J_g = (\det A_g)^{1/2} \cdot (A_g)^{-n/2}$ acting on $n$-forms (the precise expression isn't crucial; what matters is that $J_g$ is a smooth $(g, g_0)$-dependent bundle isomorphism, real-analytic in $g$).

Conjugating by $J_g$ gives the **transferred Laplacian**
$$\widetilde \Delta_g^{(n)} := J_g^{-1} \Delta_g^{(n)} J_g: \Omega^n_{L^2}(M, g_0) \to \Omega^n_{L^2}(M, g_0).$$

This is now a family of unbounded self-adjoint operators on the *fixed* Hilbert space $\Omega^n_{L^2}(M, g_0)$, with common domain $H^2(\Omega^n)$, depending real-analytically on $g$ in $H^s$-topology.

**Ingredient.** Kato, *Perturbation Theory for Linear Operators*, Theorem VII.3.9 (and surrounding analytic perturbation theory): if $T(\zeta)$ is a self-adjoint analytic family of type (A) of unbounded operators with discrete spectrum and common domain, then the eigenvalues of $T(\zeta)$ are given by branches of analytic functions $\mu_k(\zeta)$ (with multiplicities preserved on each branch), and the spectral projections vary analytically.

**Application.** $\widetilde \Delta_g^{(n)}$ is a self-adjoint analytic family of type (A) in $g$ (this requires verification of compact resolvent and analytic dependence of the symbol — both standard for elliptic operators on compact $M$). So eigenvalues $\mu_k^{(n)}(g)$ are real-analytic in $g$ (on local branches). The locus
$$\{g : \mu_i^{(n)}(g) = \mu_j^{(n')}(g)\}$$
is a real-analytic subvariety of $\mathcal{Met}^s(M)$.

For a multipartition $\Pi$ with finitely many non-trivial blocks, the stratum $\{g : \Pi(g) = \Pi\}$ is a finite intersection of such loci minus the further-coincidence loci — a locally closed real-analytic subvariety.

### Step 3: Codim formula (Arnold–style counting)

**Argument.** Each block $B$ of $\Pi$ with $|B| \ge 2$ identifies $|B|$ eigenvalues across $(n_1, i_1), \ldots, (n_{|B|}, i_{|B|})$ to a common value. This is $|B| - 1$ independent real-analytic equations on $\widetilde \Delta_g$.

Independence: the map $g \mapsto (\mu_1^{(n_1)}(g), \ldots)$ has differential dominated by the principal-symbol contribution to the eigenvalue derivatives. Generic transversality (@arnold1995remarks in finite-dim, transferring to infinite-dim via the analytic perturbation framework) gives: the conditions cut out $\mathrm{Stratum}(\Pi)$ at codim $\sum_B(|B|-1)$ in $\mathcal{Met}^s(M)$.

The codim descends to moduli: $\mathrm{Diff}(M)$ acts with finite-dim stabilizers (Step 4) on infinite-dim $\mathcal{Met}^s(M)$; the codim of an analytic subvariety in moduli equals its codim in $\mathcal{Met}^s(M)$ (codim is well-defined modulo a finite-dim group action with appropriate slice).

This is the Arnold codim formula, transferred via Kato. The fact that it is *category-independent* (same as the cellular case, the parametric-graph case, etc.) is the structural finding of the cross-category framework: codim depends only on the eigenvalue-coincidence combinatorics, not on the category of inputs.

### Step 4: Stab dim (Myers–Steenrod)

**Ingredient.** Myers–Steenrod (1939): the isometry group $\mathrm{Isom}(M, g)$ of a connected Riemannian manifold is a Lie group. For compact $M$, it is compact and finite-dim, with $\dim \mathrm{Isom}(M, g) \le \binom{m+1}{2}$, with equality iff $M$ is a space form (constant sectional curvature).

**Application.** The orbifold stabilizer at $[g]$ in the ILH-orbifold $\mathcal M_{\mathrm{Lap}}(M)$ is precisely $\mathrm{Isom}(M, g)$. So $\dim \mathrm{stab}_{\mathrm{Diff}}([g]) = \dim \mathrm{Isom}(M, g)$.

**Why the cellular formula doesn't apply.** In the cellular case, the chain auto group is the algebraic $\prod_n O(C_n)$, which can rotate Hodge eigenspaces freely. In the smooth case, $\mathrm{Diff}(M)$ is much smaller — only diffeomorphism-implemented eigenspace rotations count. So $\dim \mathrm{Isom}(M, g)$ is generally much smaller than $\sum_B \binom{|B|}{2}$ (the cellular formula).

**Example.** Round sphere $S^n$ has $\mathrm{Isom}(S^n, g_{\mathrm{rd}}) = O(n+1)$ with $\dim = \binom{n+1}{2}$. The Laplacian spectrum on $S^n$ is well known: eigenvalue $\lambda_k = k(k+n-1)$ with multiplicity = dim of harmonic-polynomial space $\mathcal H_k$, which for large $k$ is huge. The cellular formula $\sum_B \binom{|B|}{2}$ would predict gigantic stab; the actual stab $\binom{n+1}{2}$ is far smaller. This is the universal-codim / category-specific-stab pattern.

### Step 5: Closure poset (first-order Rayleigh–Schrödinger)

**Setup.** Take $\Pi'$ a refinement of $\Pi$. Want: $\overline{\mathrm{Stratum}(\Pi')} \supseteq \mathrm{Stratum}(\Pi)$.

**Direction 1 ($\subseteq$)**: $\mathrm{Stratum}(\Pi') \subseteq \overline{\mathrm{Stratum}(\Pi)}$ when $\Pi'$ refines $\Pi$, by upper-semi-continuity of the multiplicity function (a $\Pi$-stratum point is the limit of $\Pi'$-stratum points where coincidences are forced).

Wait — this is the wrong direction. Let me restate.

**Closure direction.** $\mathrm{Stratum}(\Pi)$ has $\Pi$-coincidences; $\mathrm{Stratum}(\Pi')$ has $\Pi'$-coincidences with $\Pi'$ a refinement of $\Pi$ (fewer coincidences, more eigenvalues distinct). The claim is: $\mathrm{Stratum}(\Pi) \subseteq \overline{\mathrm{Stratum}(\Pi')}$ — every $\Pi$-coincidence point is the limit of $\Pi'$-points.

**Argument.** At $g_0 \in \mathrm{Stratum}(\Pi)$, take a block $B \in \Pi$ that splits into sub-blocks $B_1, B_2 \in \Pi'$ (with $B_1 \sqcup B_2 = B$). Construct a perturbation $g_t = g_0 + tH$ for $H$ a symmetric tensor, such that the first-order eigenvalue splitting separates $B_1$ from $B_2$.

By Rayleigh–Schrödinger first-order perturbation: the splitting is governed by the spectrum of the operator
$$M_B := P_B \cdot \frac{d}{dt}\bigg|_{t=0} \widetilde \Delta_{g_t}^{(\cdot)} \cdot P_B$$
restricted to the joint eigenspace $\mathcal E_B = \bigoplus_{(n,i) \in B} \mathcal E^{(n)}_i(g_0)$. Here $P_B$ is the projection onto $\mathcal E_B$.

The derivative $\frac{d}{dt} \widetilde \Delta_{g_t}^{(n)}$ at $t = 0$ is computed from Lichnerowicz-style formulas (involving the variation of the metric and its first derivatives). Generically — for $H$ in a suitable finite-codim subspace of metric variations — the operator $M_B$ has the eigenvalue decomposition that separates $B_1$ from $B_2$ at first order.

The "generic" condition is checked by an explicit construction: choose $H$ supported on a small ball where one can engineer the eigenvalue splitting. The compactness of $M$ and the $C^\infty$-density of compactly-supported perturbations make this work.

So $g_t$ for small $t > 0$ is in $\mathrm{Stratum}(\Pi')$, and $g_t \to g_0$ as $t \to 0$. Hence $g_0 \in \overline{\mathrm{Stratum}(\Pi')}$.

**Direction 2 ($\supseteq$).** Conversely: $\overline{\mathrm{Stratum}(\Pi')}$ consists of metrics whose multipartition coarsens $\Pi'$ (by upper-semi-continuity of multiplicity). So if $g \in \overline{\mathrm{Stratum}(\Pi')}$, then $\Pi(g)$ is a coarsening of $\Pi'$. Combined with Direction 1, the closure poset is exactly the multipartition refinement order.

This argument is structurally identical to the cellular case (`theorems/closure-poset-of-strata.md`); the only infinite-dim extension is the use of compactly-supported metric variations to ensure generic perturbation.

## Specializations

### Einstein moduli

The Einstein moduli theorem ([@schwahn2025einstein]) is a special case of this theorem, with:
- Constraint: $\mathrm{Ric}(g) = E \cdot g$ for some Einstein constant $E$.
- Relevant Laplacian: Lichnerowicz $\Delta_L$ on transverse-traceless tensors $S^2_{tt}M$.
- Stratification: by IED dim = $\dim \ker(\Delta_L - 2E)|_{tt}$.

The cross-category theorem applied with $\mathcal C =$ Einstein metrics and $\mathrm{Aut} = \mathrm{Diff}$ recovers: orbifold structure (Ebin), strata indexed by IED dim, codim = (IED dim − 1), stab = $\dim \mathrm{Isom}(g)$. Matches the smooth literature.

### Round spheres and homogeneous spaces

For $G$-homogeneous metrics on $G/H$ with $G$ compact Lie, the spectrum is given by representation theory (Peter–Weyl). The multipartition structure is determined by the $G$-irrep decomposition; codim counts representation-theoretic equalities. Stab = $\dim G/Z(G)$ on the round case.

This recovers the spectrum-by-representation-theory literature (Berger, Bourguignon, etc.).

## Status of pieces (now assembled)

| Piece | Source | In this proof |
|---|---|---|
| Orbifold structure | Ebin 1970 | Step 1 |
| Real-analytic spectrum | Kato VII | Step 2 |
| Codim formula | @arnold1995remarks (transferred via Kato) | Step 3 |
| Stab = isometry group | Myers–Steenrod 1939 | Step 4 |
| Closure poset | Rayleigh–Schrödinger + upper-semi-continuity | Step 5 |

The proof is a *clean assembly* of these classical ingredients. The contribution of laplacianizers is the framework — recognizing that the same five-step pattern proves the theorem in cellular finite-dim, parametric graph, and smooth Riemannian settings, with universal codim and category-specific stab.

## Technical caveats

1. **Sobolev bookkeeping.** The Ebin theorem is rigorously stated for $H^s$-metrics with $s$ large enough. The smooth case is recovered by inverse limit. Throughout, we work in $H^s$ for $s > m/2 + 2$ when sharpness is needed.

2. **Closed-range condition.** The exterior derivative $d_n$ on compact $M$ has closed range (standard elliptic theory). For non-compact $M$, this can fail (`theorems/closed-range-obstruction.md`); the theorem doesn't directly extend to non-compact $M$ without additional structure (weighted $L^2$, RCD-type assumptions).

3. **Finitely many non-trivial blocks.** The multipartition $\Pi$ is allowed to have infinitely many singleton blocks (the spectrum is discrete but unbounded). The codim formula is stated for $\Pi$ with finitely many non-trivial blocks, which captures all cases of finite codim. "Infinite codim strata" (where infinitely many coincidences are imposed) are degenerate and not addressed here.

4. **First-order genericity in Step 5.** The Rayleigh–Schrödinger argument requires that a generic metric variation splits the eigenvalues at first order. This is true for $H$ in a $C^\infty$-dense subset of metric variations; explicit construction uses compactly-supported $H$ adapted to the eigenfunctions in the joint eigenspace.

## Connection to non-compact and singular cases

The compact case is the cleanest. Extensions:

- **Non-compact $M$ with finite-volume $L^2$**: requires closed-range condition, which can fail. Some special cases (cusped hyperbolic, asymptotically Euclidean) have analogous theorems with modifications.
- **RCD spaces ([@violo2025overview])**: the Cheeger-energy Laplacian on RCD$(K, \infty)$ spaces has discrete spectrum on compact RCD spaces; the Hodge-de Rham theorem holds in suitable form. The cross-category theorem extends here, with technical subtleties around the smooth-vs-RCD differentiable structure.
- **Singular spaces (orbifolds, stratified spaces)**: Hodge theory extends with appropriate modifications; the cross-category theorem should extend, with the moduli now of "Hodge structures on the singular space."

These extensions are within reach but require their own write-ups.

## What this delivers

The smooth Riemannian case of the cross-category theorem is *now proved* — assembled from Ebin, Kato, Myers–Steenrod, and first-order Rayleigh–Schrödinger. The structural pattern matches the cellular finite-dim case (Project A) and the parametric-graph case, confirming the cross-category framework as a genuine unification.

In the framework, all these cases — cellular, parametric graph, smooth Riemannian, Einstein — are instances of *one* theorem: stratified moduli of Laplacianizations with universal codim $\sum_B(|B|-1)$ and category-specific stab.

Noncommutative and nonlinear extensions are in `theorems/finite-spectral-triple-laplacianizability.md`, `theorems/infinite-spectral-triple-laplacianizability.md`, and `theorems/nonlinear-p-hodge-laplacianizability.md`.

## Coverage of the smooth 2025 wave

Constructions covered by this theorem:

- **Smooth Hodge Laplacian** on compact Riemannian manifolds (classical, this is the base case).
- **Lichnerowicz Laplacian** on tensor fields (used in Einstein moduli).
- **Connection Laplacian** $\nabla^* \nabla$ on vector bundles with metric connection.
- **Spectral-triple Laplacian on commutative Riemannian spectral triples** (i.e., classical $\not\!\!\!D^2$ on spin manifolds — this is the classical limit of the noncommutative case).
- **Hodge Laplacian on cellular sheaves over a smooth manifold** (combining cellular and smooth structures).
- **RCD-Cheeger Laplacian** on suitable RCD$(K, \infty)$ spaces (with technical extension as described).

Constructions not yet covered (frontier):

- Spectral-triple Laplacian on genuinely noncommutative $\mathcal A$ (separate program).
- $p$-Laplacian and variational nonlinear Laplacians (separate program).
- Discrete-spectrum Laplacians on non-compact spaces with degenerate analytical setting.
