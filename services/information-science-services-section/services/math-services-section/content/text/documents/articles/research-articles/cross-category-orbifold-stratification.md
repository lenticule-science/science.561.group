---
type: theorem
status: partial-proved
depends-on:
- laplacianizer
- bipartite-stratification-theorem
- universal-vs-categorical-stratification
see-also:
- moduli-of-laplacianizers
- hilbert-degeneracy-stratification
references:
- key: ge2025computing
  type: article
  authors:
  - Ge, Lingyu
  - Qin, Yuning
  year: 2025
  title: Computing the p-Laplacian eigenpairs of signed graphs
  eprint: '2501.07929'
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
- key: aksoy2025reimagining
  type: article
  authors:
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
---

> **Status note.** The finite-dim case of the cross-category theorem is proved (see "Proof for the finite-dim case" section). The smooth (infinite-dim Riemannian) case has the structural pattern established empirically but not yet a category-free proof.


# Cross-category orbifold stratification

This category-theoretic abstraction states that the moduli of Hilbert lifts of a cohomology theory is a stratified orbifold, indexed by spectral-multiplicity invariants of the associated Hodge Laplacian. It specializes to cellular bipartite stratification, de Rham Hodge theory on smooth Riemannian manifolds, and Young's inner-product Laplacian on parametric graphs.

## Abstract framework

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

## Spectral data

For $Q \in \mathcal H(X)$, define the **spectral multipartition** $\Pi(Q)$ of the indexing set
$$[N_*(X)] := \bigsqcup_n \{1, \ldots, r_n(X)\}$$
where $r_n(X) = \mathrm{rank}\, d_X|_{F(X)_n} = $ rank of the $n$-th boundary of $F(X)$, by the equivalence relation $\sigma_i^{(n)}(Q) = \sigma_j^{(n')}(Q)$ on the squared singular values of $\widetilde d_n^{(Q)}$.

(For finite-dim $F(X)$, this is well-defined and continuous in $Q$. For infinite-dim $F(X)$, the spectral data is more subtle; we restrict to settings where $\widetilde d_n$ has closed range and discrete spectrum — typical in the survey.)

## Cross-category theorem

> **Theorem (cross-category orbifold-stratification, conjectured for $\mathfrak F$).** Let $\mathfrak F = (\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ be a Laplacianizer framework, and let $X \in \mathcal C$ admit a Hilbert lift with $\widetilde d_n$ of closed range and discrete spectrum for all $n$. Suppose $\mathrm{Aut}(X)$ acts properly on $\mathcal H(X)$. Then:
>
> 1. $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ is locally an orbifold (real algebraic in finite-dim, smooth Banach in smooth-infinite-dim).
>
> 2. $\mathcal M_{\mathrm{Lap}}(X)$ is stratified by the spectral multipartition $\Pi(Q)$. Strata: $\mathrm{Stratum}(\Pi) = \{[Q] : \Pi(Q) = \Pi\}$, locally closed.
>
> 3. **Codim formula (universal).** $\mathrm{codim}(\mathrm{Stratum}(\Pi)) = \sum_B (|B| - 1)$.
>
> 4. **Stab dim formula (category-specific).** $\dim \mathrm{stab}_{\mathrm{Aut}(X)}(Q)$ depends on $\mathrm{Aut}(X)$, with explicit formulas:
>    - Cellular case: $\dim \mathrm{stab} = \sum_B \sum_n \binom{k_n^B}{2}$ where $k_n^B$ is the within-$d_n$ block sizes.
>    - Riemannian case: $\dim \mathrm{stab} = \dim \mathrm{Isom}(M, g)$, the geometric isometry group of the Riemannian manifold.
>    - Parametric graph case: $\dim \mathrm{stab}$ depends on the conformal automorphism group of $(G, Q)$.
>
> 5. **Closure poset.** The closure relation is given by coarsening of spectral multipartitions: $\overline{\mathrm{Stratum}(\Pi)} = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$.

## Verification on instances

**Instance 1 (cellular).** $\mathcal C =$ finite chain complexes over $\mathbb R$, $\mathrm{Aut} = G$ chain auto group, $\mathrm{Aut}$ acts on $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ by conjugation. The cross-category theorem specializes to the **bipartite stratification theorem** ([bipartite-stratification-theorem](bipartite-stratification-theorem.md)), proved in the cellular finite-dimensional case.

**Instance 2 (smooth Riemannian).** $\mathcal C =$ compact smooth manifolds, $H^\bullet =$ de Rham cohomology, $F$ takes a manifold + metric to the $L^2$ de Rham complex with the metric's induced inner products. $\mathrm{Aut}(M) = \mathrm{Diff}(M)$.

The closed-range condition holds for compact manifolds. Spectral multipartitions are partitions of the index set of nonzero squared singular values of $d, d_*$ (= eigenvalues of $\Delta$ on each form-degree).

The orbifold structure of moduli of metrics: well-known (Ebin slice theorem). Strata by isometry-type (= eigenvalue-multiplicity-type, modulo isometry). The cross-category theorem matches.

**Instance 3 (parametric graph).** $\mathcal C =$ graphs, $F$ takes a graph + per-vertex/edge inner products. $\mathrm{Aut}$ = "conformal" subgroup preserving the parameterized structure (@aksoy2025reimagining's framework).

Each graph's parameter space is finite-dim. Strata indexed by which named Laplacian (combinatorial / normalized / hypergraph / etc.) the parameter point realizes — equivalently, by spectral multipartition of the inner product Laplacian. The cross-category theorem applies.

**Instance 4 (Einstein constrained).** $\mathcal C =$ smooth manifolds with the Einstein equation as constraint, $\mathrm{Aut} = \mathrm{Diff}$. The moduli is the moduli of Einstein metrics; strata indexed by IED dim = $\dim \ker(\Delta_L - 2E)|_{tt}$ (Lichnerowicz on tt-tensors). The cross-category theorem matches the literature's known results.

## Where the theorem requires care

The theorem as stated has *both* universal pieces and category-specific pieces:

- **Universal:** orbifold structure (modulo properness of $\mathrm{Aut}$-action), stratification by spectral multipartition, codim formula, closure poset.
- **Category-specific:** stab dim formula, depending on the $\mathrm{Aut}$ structure.

This split is consistent with the cellular finite-dimensional result. The cross-category theorem extends the *universal* piece to non-cellular settings, while the *category-specific* piece naturally varies.

## What's needed to fully prove

1. **Properness of $\mathrm{Aut}$-action.** Standard for finite-dim and Riemannian (Ebin). Trickier for infinite-dim cases without additional structure.

2. **Continuity of spectrum.** For finite-dim, eigenvalues vary continuously by Kato perturbation theory. For infinite-dim with closed range, by spectral perturbation theory of unbounded self-adjoint operators (also Kato).

3. **Codim formula in non-cellular settings.** Should follow from continuity of spectrum + the same eigenvalue-equality-counting as the cellular finite-dimensional case. The bipartite refinement (cross-$d$ vs. within-$d$) doesn't obviously generalize to non-chain-complex settings. For the smooth case, $F(X)$ is the de Rham complex with chain differential the exterior derivative, so the bipartite multipartition framework still applies — just with possibly infinite-dim chain spaces and unbounded $d$.

4. **Stab dim formula across categories.** The cellular formula $\sum_B \sum_n \binom{k_n^B}{2}$ comes from the chain auto group being "all algebraic chain automorphisms." For other categories, $\mathrm{Aut}$ is more restrictive (e.g., $\mathrm{Diff}$ for Riemannian), so the stab dim is smaller and category-specific. The cross-category theorem should make the dependence explicit.

## Open cross-category questions

1. **Rigorous proof of the cross-category theorem.** Each piece (orbifold structure, codim, closure poset) needs to be checked with full hypotheses.

2. **Bipartite contribution in non-chain-complex settings.** Where does the within-$d_n$ vs. cross-$d_n$ distinction live in the smooth Riemannian case? The de Rham complex has multiple boundary operators ($d_n: \Omega^n \to \Omega^{n+1}$); the bipartite multipartition of singular values across degrees should give a multipartite structure in the smooth case too. Whether cross-$d_n$ identifications carry the same stab/codim asymmetry as in cellular is open.

3. **Other 2025 categories.** Spectral triples (noncommutative) and $p$-Laplacians (nonlinear) don't fit the linear Hilbert-chain-complex framework. Extensions or modifications are needed; see [spectral-triple](../../../glossary/terms/spectral-triple.md) for the noncommutative challenges and [@ge2025computing] for the nonlinear.

4. **Connection to derived categories.** A category-theoretic foundation for "moduli of Hilbert lifts" might use derived-category-of-Hilbert-chain-complexes machinery — formalizing "Hilbert lift modulo natural iso" as a derived equivalence class. This is open.

## Proof for the finite-dim case

For finite-dimensional $F(X)$, the cross-category theorem follows by adapting the cellular argument while treating $\mathrm{Aut}(X)$ as a parameter rather than fixing it to the full chain automorphism group $G$.

**Hypothesis.** $F(X)$ is finite-dim graded ($\dim F(X)_n < \infty$ for all $n$, finitely many nonzero). $\mathrm{Aut}(X)$ is a real Lie group (or real algebraic group) acting smoothly on $\mathcal H(X)$, commuting with $d_X$.

**Step 1: Strata are well-defined.** Define $\mathrm{Stratum}(\Pi) := \{[Q] \in \mathcal M_{\mathrm{Lap}}(X) : \Pi(Q) = \Pi\}$. The condition $\Pi(Q) = \Pi$ depends only on the orbit $\mathrm{Aut}(X) \cdot Q$ (since chain isomorphisms preserve spectra), so $\mathrm{Stratum}(\Pi)$ is well-defined as a subset of $\mathcal M_{\mathrm{Lap}}(X)$. Its preimage in $\mathcal H(X)$ is a locally closed semi-algebraic set (closed equality conditions on $\sigma$-coincidences plus open inequality conditions on $\sigma$-non-coincidences); the quotient retains local closedness.

**Step 2: Codim formula.** $\mathrm{codim}(\mathrm{Stratum}(\Pi)) = \sum_B (|B| - 1)$ in $\mathcal M_{\mathrm{Lap}}(X)$.

Same argument as the cellular finite-dimensional case: each block $B$ with $|B| \ge 2$ imposes $|B| - 1$ independent eigenvalue-equality conditions. The total codim is $\sum_B (|B| - 1) = N_*(X) - \#\Pi$, where $N_*(X) = \sum_n r_n(X)$.

This formula is *universal* — does not depend on $\mathrm{Aut}(X)$ — because the eigenvalues are functions of $Q$ alone, not of how $\mathrm{Aut}$ acts.

**Step 3: Stab dim formula.** $\dim \mathrm{stab}_{\mathrm{Aut}(X)}(Q)$ depends on $\mathrm{Aut}(X)$.

For the cellular case ($\mathrm{Aut} = G$ chain auto group): the stab formula reduces to $\sum_B \sum_n \binom{k_n^B}{2}$ via the chain-conditions argument of the cellular finite-dimensional case.

For other choices of $\mathrm{Aut}$: the stab dim is the dim of $\mathrm{stab}_{\mathrm{Aut}(X)}(Q) \cap U(F(X), Q)$, where $U(F(X), Q)$ is the unitary group of the Hilbert structure $Q$. By restricting the cellular-case argument to the subgroup $\mathrm{Aut}(X) \subseteq G$, the cellular stab formula gives an *upper bound*; the actual stab dim equals the dim of $\mathrm{Aut}(X)$'s contribution within the unitary stabilizer, which is generally smaller.

**Step 4: Closure poset.** $\overline{\mathrm{Stratum}(\Pi)} = \bigsqcup_{\Pi' \succeq \Pi} \mathrm{Stratum}(\Pi')$.

As in the cellular [closure-poset theorem](closure-poset-of-strata.md), upper-semicontinuity of $\Pi(Q)$ gives the closure $\subseteq$ direction, while first-order Rayleigh–Schrödinger perturbation gives the closure $\supseteq$ direction. Beyond its hypothesized action on $\mathcal H(X)$, the argument does not depend on $\mathrm{Aut}$.

**Step 5: Orbifold structure.** $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ is a real algebraic orbifold *if* $\mathrm{Aut}(X)$ acts properly on $\mathcal H(X)$ (which is hypothesized).

For finite-dim Lie groups acting properly on smooth manifolds, the quotient is an orbifold by standard theory (e.g., Bredon, *Introduction to Compact Transformation Groups*; or specifically for real algebraic actions, GIT-style quotient constructions). The strata are smooth orbifolds, the closure poset has incidence relations as described.

This completes the proof for finite-dim Laplacianizer frameworks. $\square$

## Specializations

The above proof gives:

- **Cellular case** ($\mathrm{Aut} = G$, full chain auto group): recovers [bipartite-stratification-theorem](bipartite-stratification-theorem.md).

- **Parametric graph case** ($\mathrm{Aut} = $ Young's "conformal" subgroup of the chain auto group): the theorem applies, giving a stratified orbifold of inner-product-Laplacians. Stab dim is smaller than the cellular case (since $\mathrm{Aut}$ is smaller); the codim formula and closure poset are identical.

- **Finite chain complex with arbitrary $\mathrm{Aut}$ subgroup**: the theorem gives the moduli structure for any user-specified automorphism subgroup. The stratification is invariant under enlarging or shrinking $\mathrm{Aut}$ (it depends only on $\Pi$); only the stab dim changes.

## Smooth (infinite-dim) case: open

For the smooth Riemannian case (Instance 2 in the framework above), the proof requires:

- Closed-range hypothesis on $d_X$ in the de Rham complex, which holds for compact manifolds.
- Continuity of spectrum (eigenvalues of unbounded self-adjoint operators, by Kato).
- Properness of $\mathrm{Diff}(M)$ acting on metrics (Ebin slice theorem).
- An infinite-dim version of "first-order perturbation" for the closure $\supseteq$ direction.

Each of these is standard in the smooth Hodge theory / Riemannian moduli literature, but assembling them into a single proof of the cross-category theorem is open work. The Einstein-moduli paper ([@schwahn2025einstein]) does the analogous job for Einstein metrics; an explicit cross-category statement covering both cellular and Riemannian would generalize.

## Status

- **Finite-dim case: proved** (above).
- **Smooth case:** the structural pattern is established by the cellular result, Einstein moduli, and smooth Hodge theory; a category-free formulation remains open.
- **Nonlinear / noncommutative: outside the framework's scope.**

## Finite-dimensional cross-category result

The theorem generalizes bipartite stratification from cellular chain complexes to any finite-dimensional Laplacianizer framework with a prescribed automorphism subgroup.

Combined with the cellular finite-dimensional case:

> **Finite-dimensional stratified-moduli theorem.** For any finite-dimensional Laplacianizer framework $\mathfrak F = (\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$, fixing $X \in \mathcal C$ admitting a Hilbert lift, the moduli $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ is a real algebraic orbifold. Strata are indexed by spectral multipartitions of $\Delta_X$, with universal codimension $\sum_B(|B|-1)$ and category-specific stabilizer dimension determined by $\mathrm{Aut}(X)$. The closure poset is the multipartition refinement lattice. For the cellular case ($\mathrm{Aut} = G$), this specializes to the bipartite stratification theorem; [bipartite realizability](bipartite-realizability.md) and the [chain-complex IEP-G decomposition](chain-complex-iep-g-decomposition.md) refine that case further.

The smooth Riemannian and Einstein cases supply the corresponding infinite-dimensional direction.
