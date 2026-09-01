---
type: theorem
status: sketch
depends-on: [finite-spectral-triple-laplacianizability, cross-category-orbifold-stratification, cross-category-smooth, noncommutative-laplacianizability]
see-also: [spectral-triple-curvature-weitzenbock-2024, noncommutative-laplacian-2025, stratified-moduli-of-laplacianizations]
classical-anchor: [arnold-1995-hermitian-stratification]
---

# Laplacianizability for infinite-dim spectral triples

Extension of the finite spectral triple theorem ([finite-spectral-triple-laplacianizability](finite-spectral-triple-laplacianizability.md)) to infinite-dim Connes-style spectral triples. The structural pattern — Hochschild–Hilbert lift via the resolvent, cross-category stratified moduli — persists. The technical work is in handling unbounded operators, summability conditions, closed-range constraints, and the cyclic (rather than just Hochschild) complex.

The reduction to compact spin manifolds is the consistency check: applying the noncommutative theorem to the canonical spectral triple of a compact spin manifold should recover the smooth Riemannian theorem ([cross-category-smooth](cross-category-smooth.md)).

## Setup

A **(infinite-dim) spectral triple** $(\mathcal A, \mathcal H, D)$ in Connes' sense:

- $\mathcal A$: unital $*$-algebra, dense subalgebra of a $C^*$-algebra.
- $\mathcal H$: separable Hilbert space, with faithful $*$-representation $\pi: \mathcal A \to \mathcal B(\mathcal H)$.
- $D$: self-adjoint with **compact resolvent** ($R_D := (1+D^2)^{-1}$ is compact).
- **Bounded commutators**: $[D, \pi(a)]$ extends to a bounded operator for each $a \in \mathcal A$.
- **Finite summability**: $R_D^{p/2}$ is trace class for some $p > 0$. The minimal such $p$ is the *summability degree* (also called *metric dimension*).

Fix $(\mathcal A, \mathcal H)$. The space of admissible $D$'s — call it $\mathcal D(\mathcal A, \mathcal H)$ — consists of self-adjoint $D$'s on $\mathcal H$ satisfying the spectral-triple axioms above.

The **gauge group** $G(\mathcal A) := U(\mathcal H) \cap \pi(\mathcal A)'$ acts on $\mathcal D(\mathcal A, \mathcal H)$ by conjugation. The moduli of spectral triples is
$$\mathcal M_{\mathrm{spec}}(\mathcal A, \mathcal H) := G(\mathcal A) \backslash \mathcal D(\mathcal A, \mathcal H).$$

In contrast to the finite case, $\mathcal D$ is now an *infinite-dim real-affine subset* of self-adjoint operators on $\mathcal H$. Locally, around a reference $D_0$, the tangent space is the Banach space of admissible perturbations $V$ — bounded self-adjoint with $[V, \pi(\mathcal A)] \subset \mathcal B(\mathcal H)$.

## Hochschild–Hilbert lift in infinite-dim

> **Definition (infinite-dim Hochschild–Hilbert lift).** Choose $N > p$ so that $R_D^N = (1+D^2)^{-N}$ is trace class. For $a, b \in \mathcal A$, define
> $$\langle a, b \rangle_D := \mathrm{Tr}\big( R_D^{N/2}\, \pi(a)^*\, \pi(b)\, R_D^{N/2} \big).$$
> For higher Hochschild chains $a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n \in C_n(\mathcal A) = \mathcal A^{\otimes(n+1)}$:
> $$\langle a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n\rangle_D := \langle a_0, b_0\rangle_D \cdot \prod_{i=1}^n \mathrm{Tr}\big( R_D^{N/2}\, [D, \pi(a_i)]^*\, [D, \pi(b_i)]\, R_D^{N/2} \big).$$

> **Lemma (positivity and finiteness).**
>
> 1. Each trace is finite: $R_D^N$ is trace class, $\pi(a)^* \pi(b)$ is bounded, so $R_D^{N/2} \pi(a)^* \pi(b) R_D^{N/2}$ is trace class. Same for the commutator factors.
>
> 2. The form $\langle \cdot, \cdot \rangle_D$ is positive: for $T = \pi(a)$ or $T = [D, \pi(a)]$, $\mathrm{Tr}(R_D^{N/2} T^* T R_D^{N/2}) = \|T R_D^{N/2}\|_{HS}^2 \ge 0$.
>
> 3. The form is symmetric Hermitian: $\overline{\langle a, b \rangle_D} = \langle b, a\rangle_D$, by the trace identity $\mathrm{Tr}(X^*) = \overline{\mathrm{Tr}(X)}$.

**Kernel of the form.** The form may be degenerate — its kernel consists of chains $a_0 \otimes \cdots$ where some $\pi(a_i) R_D^{N/2} = 0$ or $[D, \pi(a_i)] R_D^{N/2} = 0$. For typical $D$ in an open dense subset of $\mathcal D$, the kernel is trivial (all algebra elements act non-trivially on the resolvent of $D$). On the kernel-trivial locus $\mathcal D^\circ \subset \mathcal D$, $\langle\cdot,\cdot\rangle_D$ is a non-degenerate inner product.

**Hilbert completion.** Let $\hat C_n(\mathcal A; D)$ be the Hilbert completion of $C_n(\mathcal A)$ in the $\langle\cdot,\cdot\rangle_D$ norm. The Hochschild differential $b$ extends continuously to $\hat C_\bullet$ provided $\|b a\|_D \lesssim \|a\|_D$ for $a \in C_n$ — a continuity condition that holds for "regular" spectral triples in Connes' sense (where $\mathcal A$ is closed under $\delta = [|D|, \cdot]$).

## Cyclic-complex variant (needed for commutative $\mathcal A$)

For commutative $\mathcal A$, the Hochschild complex collapses on harmonic representatives by Hochschild–Kostant–Rosenberg: $\mathrm{HH}_n(C^\infty(M)) \cong \Omega^n(M)$ with zero Hochschild differential on HKR representatives.

The genuine differential is Connes' second differential $B$. The **cyclic complex** $(C^\lambda_\bullet, b - B)$ — quotient of the bicomplex $(C_\bullet, b, B)$ — has the right differential to recover de Rham.

> **Definition (cyclic Hochschild–Hilbert lift).** The inner product $\langle\cdot,\cdot\rangle_D$ extends to the cyclic complex $C^\lambda_\bullet(\mathcal A)$ by passing to cyclic-invariant chains. The cyclic Laplacian
> $$\Delta^\lambda_n := (b-B)(b-B)^* + (b-B)^*(b-B)$$
> on $\hat C^\lambda_n(\mathcal A; D)$ is self-adjoint (with respect to the lifted inner product) with discrete spectrum.

For commutative $\mathcal A = C^\infty(M)$, the cyclic complex recovers de Rham; for noncommutative $\mathcal A$, it gives the noncommutative analog.

The cross-category theorem applies to *both* the Hochschild complex and the cyclic complex — but the cyclic version is the one that reduces correctly to the smooth Riemannian case for commutative spectral triples.

## Closed-range and Hodge isomorphism

> **Theorem (closed range under regularity).** If $(\mathcal A, \mathcal H, D)$ is a *regular* spectral triple (Connes' sense: $\mathcal A$ is closed under $\delta = [|D|, \cdot]$, and $\mathcal A, [D, \mathcal A] \subset \bigcap_n \mathrm{Dom}(\delta^n)$), then the Hochschild differential $b$ on $\hat C_\bullet(\mathcal A; D)$ has **closed range**, and the Hodge isomorphism
> $$\ker \Delta_n^{(D)} \cong \mathrm{HH}_n(\mathcal A)$$
> holds (where $\mathrm{HH}_n(\mathcal A)$ is computed in an appropriate completion compatible with the Hilbert structure).

**Justification.** Regular spectral triples have well-behaved noncommutative pseudo-differential calculus (Connes–Moscovici). The Hochschild Laplacian $\Delta_n^{(D)}$ is "elliptic" in this calculus, hence has compact resolvent and discrete spectrum. Closed range follows from the spectral gap.

For the cyclic version, similar regularity gives closed range of $b - B$ on $\hat C^\lambda_\bullet$.

This regularity assumption is satisfied by:
- The canonical spectral triple of a compact spin manifold ($\mathcal A = C^\infty(M)$).
- Almost-commutative spectral triples (commutative + finite-dim factor).
- Discrete-group spectral triples (under property RD).
- A wide class of noncommutative-tori, deformation-quantization, and quantum-group examples.

## Connection to Connes–Moscovici local index

The CM local index formula (Connes–Moscovici 1995) gives a representative cyclic *cocycle* $\phi_D \in HC^\bullet(\mathcal A)$ from the spectral data of $D$, in the form (essentially):
$$\phi_D(a_0, a_1, \ldots, a_n) = \sum_{k} c_k\, \mathrm{Res}_{s=0} \mathrm{Tr}\big(\pi(a_0) [D, \pi(a_1)] \cdots [D, \pi(a_n)] |D|^{-2k - s}\big).$$

> **Observation.** The Hochschild–Hilbert lift gives an inner product on cyclic *chains* $\mathrm{HC}_\bullet$, inducing a Hodge isomorphism $\mathrm{HC}_\bullet \xrightarrow{\sim} \mathrm{HC}_\bullet^*$ via $c \mapsto \langle c, -\rangle_D$. The CM cocycle $\phi_D$ lives in $\mathrm{HC}^\bullet$.
>
> Through Connes–Karoubi pairing $\mathrm{HC}_\bullet \otimes \mathrm{HC}^\bullet \to \mathbb C$:
>
> 1. The Hilbert-lift induced functional $\flat_D(\mathbf 1) := \langle \mathbf 1, -\rangle_D$ on $\mathrm{HC}_\bullet$ is *not literally* the CM cocycle $\phi_D$ — they have different shapes (resolvent product vs. heat-kernel simplex integral).
>
> 2. **Both extract the same index pairing.** For $K$-theory class $[e] \in K_0(\mathcal A)$ represented as a cycle, $\phi_D([e]) = \mathrm{ind}(eDe)$. Under Hodge decomposition via the Hilbert lift, the harmonic representative of $[e]$ pairs with $\phi_D$ to give the same index — the structural result of CM.

So the Hochschild–Hilbert lift sits *adjacent to* CM: both are spectral structures determined by $D$, and they unify under Connes–Karoubi duality on cyclic (co)homology.

The Hilbert-lift framework's distinct contribution: a *Hodge structure* on cyclic homology, which the CM framework doesn't directly provide. This Hodge structure is what enables the cross-category orbifold-stratification — the moduli claim is intrinsic to the Hilbert structure, not the cocycle.

## Cross-category theorem in infinite-dim

> **Theorem (cross-category orbifold-stratification, infinite-dim spectral triples).** Let $(\mathcal A, \mathcal H)$ be fixed with $\mathcal A$ a regular unital $*$-algebra, $\mathcal H$ a separable Hilbert space. Restrict to the open subset $\mathcal D^\circ(\mathcal A, \mathcal H) \subset \mathcal D(\mathcal A, \mathcal H)$ where:
>
> - The Hochschild–Hilbert lift is non-degenerate.
> - The Hochschild Laplacian $\Delta_n^{(D)}$ has discrete spectrum with finite multiplicities and discrete spectral gap.
>
> Then the moduli $\mathcal M^\circ_{\mathrm{spec}}(\mathcal A, \mathcal H) = G(\mathcal A) \backslash \mathcal D^\circ(\mathcal A, \mathcal H)$ has the following structure:
>
> 1. **Banach orbifold structure.** Locally a Banach manifold quotient by the gauge group; orbifold modulo finite-dim isotropy at each point.
>
> 2. **Stratification.** Strata indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta_n^{(D)})$, with finitely many non-trivial blocks. Each $\mathrm{Stratum}(\Pi)$ is a real-analytic submanifold of $\mathcal M^\circ_{\mathrm{spec}}$.
>
> 3. **Universal codim.** $\mathrm{codim}\,\mathrm{Stratum}(\Pi) = \sum_{B \in \Pi, |B| \ge 2}(|B|-1)$.
>
> 4. **Stab dim.** $\dim \mathrm{stab}_{G(\mathcal A)}([D]) = \dim Z_{G(\mathcal A)}(D)$, the dim of the centralizer of $D$ in the gauge group.
>
> 5. **Closure poset.** Refinement of bipartite multipartitions.

### Proof sketch

The proof structurally mirrors the smooth Riemannian case ([cross-category-smooth](cross-category-smooth.md)), with five steps:

1. **Banach orbifold structure.** The gauge group $G(\mathcal A)$ acts on $\mathcal D^\circ$ smoothly, with stabilizers $Z_{G(\mathcal A)}(D)$ — finite-dim Lie groups by an analog of Myers–Steenrod (the "noncommutative isometry group" is finite-dim under regularity).

2. **Analytic spectrum via Kato.** $D \mapsto \Delta_n^{(D)}$ is a real-analytic family of unbounded self-adjoint operators with discrete spectrum (regularity ensures common dense domain). Kato VII gives real-analytic eigenvalue branches $\mu_k^{(n)}(D)$.

3. **Codim $\sum_B(|B|-1)$.** Arnold-style counting of independent eigenvalue-equality conditions, transferred via Kato.

4. **Stab from centralizer.** $\dim \mathrm{stab}_{G(\mathcal A)}([D]) = \dim Z_{G(\mathcal A)}(D)$, where the centralizer's dim depends on how the eigenspaces of $D$ decompose under the $\mathcal A$-action.

5. **Closure poset via Rayleigh–Schrödinger.** First-order perturbation argument with admissible perturbations $V$ in $T_D \mathcal D$. Generic $V$ splits eigenvalue coincidences at first order; explicit construction uses $V$ supported on small spectral intervals.

Each step is a standard tool (Kato, Rayleigh–Schrödinger, noncommutative Myers–Steenrod) applied in the infinite-dim noncommutative setting. ∎

## Specialization: compact spin manifold (reduction to smooth)

> **Theorem (reduction to smooth Riemannian).** Let $M$ be a compact spin manifold of dim $m$, with $\mathcal A = C^\infty(M)$, $\mathcal H = L^2(M, S)$ ($S$ = spinor bundle), and $D = \not\!\!\!D_g$ the Atiyah–Singer Dirac operator for a chosen Riemannian metric $g$. Then:
>
> 1. **HKR isomorphism.** $\mathrm{HH}_n(C^\infty(M)) \cong \Omega^n(M)$ (Hochschild–Kostant–Rosenberg, Connes' continuous version).
>
> 2. **Cyclic = de Rham.** $\mathrm{HP}_n(C^\infty(M)) = \bigoplus_k H^{n+2k}_{\mathrm{dR}}(M)$ (Connes 1985).
>
> 3. **Lift recovers $L^2$ inner product.** Under HKR, the Hochschild–Hilbert lift $\langle\cdot,\cdot\rangle_{\not\!\!\!D_g}$ on $\Omega^\bullet(M) \cong \mathrm{HH}_\bullet(C^\infty(M))$ is the standard $L^2$-inner product induced by $g$ (up to a positive smooth function = Wodzicki residue normalization).
>
> 4. **Cyclic Laplacian = de Rham Laplacian.** Under HKR, the cyclic Laplacian $\Delta^\lambda$ on cyclic chains corresponds to the Hodge–de Rham Laplacian $dd^* + d^*d$ on $\Omega^\bullet(M)$.
>
> 5. **Moduli reduction.** The space of admissible $D$'s on $(C^\infty(M), L^2(M, S))$ — modulo $G(C^\infty(M))$ = Spin-equivariant unitaries — coincides with $\mathrm{Diff}(M) \backslash \mathcal{Met}(M)$ (the smooth Riemannian moduli) up to the spin lift.
>
> 6. **Cross-category theorems agree.** The infinite-dim noncommutative cross-category theorem applied to $(\mathcal A, \mathcal H) = (C^\infty(M), L^2(M, S))$ recovers the smooth Riemannian cross-category theorem ([cross-category-smooth](cross-category-smooth.md)).

### Proof outline

(1)–(2) are HKR + Connes 1985, classical.

(3)–(4) follow from explicit HKR-quasi-isomorphism formulas: the de Rham differential corresponds to Connes' $B$, and the metric-induced $L^2$-pairing on forms factors through HKR + the spectral data of $\not\!\!\!D_g$ (specifically through the principal symbol of $\not\!\!\!D_g^2$, which is $|\xi|_g^2 \cdot \mathrm{Id}$). The Wodzicki residue normalization is a constant prefactor.

(5)–(6) The Reconstruction Theorem (Connes 2008): a commutative, regular, finitely-summable spectral triple over a smooth orientable manifold is *equivalent* to the canonical spectral triple of a compact spin manifold. Under this equivalence, varying $D$ in $\mathcal D(C^\infty(M), L^2(M, S))$ corresponds (modulo the gauge group) to varying $g$ in $\mathcal{Met}(M)$.

So the noncommutative theorem on $(C^\infty(M), L^2(M, S))$ recovers the smooth Riemannian theorem, with the same orbifold structure, stratification, codim, stab, and closure poset. ∎

## What this delivers

1. **Infinite-dim Hochschild–Hilbert lift** is constructed explicitly via the resolvent $R_D^N$ for $N > p$.

2. **Closed-range and Hodge isomorphism** under regularity (Connes' sense), via the noncommutative pseudo-differential calculus.

3. **Cross-category theorem** in infinite-dim: same five-step structural pattern as cellular and smooth Riemannian cases.

4. **Reduction to smooth Riemannian** via HKR and Connes' Reconstruction Theorem: the noncommutative framework genuinely generalizes smooth Hodge theory.

5. **Connection to Connes–Moscovici** clarified: Hochschild–Hilbert lift (Hodge structure on chains) is dual to CM cocycle (representative on cochains) via Connes–Karoubi pairing.

This shifts the noncommutative case to **partial-proved**: the structural framework is established for regular spectral triples; the technical work in writing out the proof completely (especially closed-range under various regularity assumptions and the explicit cyclic-complex lift) remains.

## Status of pieces

| Piece | Status |
|---|---|
| Resolvent-based Hilbert lift (formula) | Defined |
| Positivity, symmetry, finiteness of lift | Proved |
| Closed range under regularity | Sketched (uses Connes' nc-pseudo-DO calculus) |
| Hodge isomorphism | Sketched |
| Cross-category theorem | Sketched (assembly of standard tools) |
| Reduction to smooth (HKR + Reconstruction) | Sketched |
| Cyclic-complex variant | Defined |

So the infinite-dim noncommutative case is **structurally complete** in framework, **partial-proved** in detail. A focused write-up filling in the regularity / closed-range bookkeeping would upgrade this to fully proved for regular spectral triples.

## Open

1. **Explicit closed-range proof.** Connes' nc-pseudo-DO calculus gives the result for regular spectral triples, but a self-contained proof in our cross-category framework would be desirable.

2. **Almost-commutative spectral triples.** $\mathcal A = C^\infty(M) \otimes \mathcal A_F$ for a finite-dim $\mathcal A_F$ (the "Standard Model" type). The cross-category theorem should split as a product of the smooth case and the finite case. Worked example would be illuminating.

3. **Quantum tori, quantum groups.** Specific noncommutative examples (rotation algebras $A_\theta$, quantum SU(2), Drinfeld doubles) where the cross-category theorem produces concrete stratifications.

4. **Spectral-triple deformation moduli.** The deformation moduli of a fixed $\mathcal A$ — varying $D$ subject to compatibility — is exactly what our theorem describes. Connection to the Connes–Marcolli moduli of Q-lattices and other noncommutative-geometric moduli is open.

5. **Twisted spectral triples and modular case.** Connes–Moscovici introduced twisted spectral triples (with $\sigma$-twist on the bounded-commutator condition) for the modular geometry of arithmetic noncommutative spaces. The Hochschild–Hilbert lift extends with appropriate modifications, giving a stratified moduli for twisted triples — open.

## Coverage update

The infinite-dim noncommutative case is now structurally addressed:

| Case | Status |
|---|---|
| Cellular finite-dim | Proved ([bipartite-stratification-theorem](bipartite-stratification-theorem.md)) |
| Parametric graph | Proved ([cross-category-orbifold-stratification](cross-category-orbifold-stratification.md)) |
| Smooth Riemannian | Proved ([cross-category-smooth](cross-category-smooth.md)) |
| Finite spectral triples | Proved ([finite-spectral-triple-laplacianizability](finite-spectral-triple-laplacianizability.md)) |
| Infinite spectral triples (regular) | Sketched / partial-proved (this entry) |
| Stratification II | Proved ([hilbert-degeneracy-stratification](hilbert-degeneracy-stratification.md)) |
| Nonlinear ($p$-Laplacian) | Open (frontier) |

Open: nonlinear case (variational $p$-Hodge) and bipartite Vassiliev / Shapiro–Vainshtein cohomology.
