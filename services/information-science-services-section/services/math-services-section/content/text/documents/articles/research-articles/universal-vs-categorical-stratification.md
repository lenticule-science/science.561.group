---
type: theorem
status: sketch
depends-on:
- stab-codim-formula
- moduli-of-laplacianizations
see-also:
- moduli-strata-classification
- gauge-fiber-structure
references:
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

# Universal codim, category-specific stabilizer

A comparison of the cellular case ([stab-codim-formula](stab-codim-formula.md)) with the smooth-Riemannian / Einstein case ([@schwahn2025einstein]) clarifies what about the stratified-moduli structure is universal across categories of Laplacianizations and what is category-specific.

## What is universal

> **Universal codim formula (claim).** Let $(\mathcal C, H^\bullet)$ be a Laplacianizable pair, and let $\mathcal M_{\mathrm{Lap}}$ be the moduli of Hilbert lifts (modulo the natural automorphism action). The codimension of a stratum at $Q$ is
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\text{stratum of } [Q]) = \sum_B (|B| - 1)$$
> where $B$ runs over the equivalence classes of "Laplacian eigenvalues that coincide at $Q$" — i.e., the multipartition of the nonzero spectrum of $\Delta(Q)$.

In other words: the moduli stratification by eigenvalue-multiplicity is universal. Codim of a stratum is just the number of independent eigenvalue-equality constraints imposed at points of that stratum.

The orbifold structure of $\mathcal M_{\mathrm{Lap}}$ is also universal: at any stratum, the local moduli is a quotient of an algebraic-stratum of $\mathcal H$ by the relevant automorphism group.

## What is category-specific

The **dimension of the stabilizer** at a stratum point depends on what category one is working in — specifically, on which "automorphisms preserving the Laplacianization" exist in the category.

### Case 1: Cellular case ([stab-codim-formula](stab-codim-formula.md))

$\mathcal C$ = chain complexes; "automorphisms preserving the Laplacianization" = graded chain automorphisms preserving the Hilbert structure ($G \cap U(Q)$). These include *all* $O(k)$-rotations on $\Delta_n$-eigenspaces compatible with chain structure.

$$\dim \mathrm{stab}_G(Q) = \sum_B \sum_n \binom{k_n^B}{2}.$$

Each multiplicity-$k$ eigenvalue of $\Delta_n$ contributes $\binom{k}{2}$ to the stabilizer dim (the $O(k)$ on the eigenspace), with no further restriction from geometric realizability — chain automorphisms are an algebraic concept.

### Case 2: Smooth Riemannian / Einstein ([@schwahn2025einstein])

$\mathcal C$ = smooth manifolds with cohomology theory implicit (de Rham, plus tt-tensor cohomology in the Einstein case); "automorphisms preserving the Laplacianization" = isometries of $(M, g)$. The Einstein moduli stratifies by $\dim \epsilon(g) = \dim \ker(\Delta_L - 2E)|_{tt}$.

$$\dim \mathrm{stab}_{\mathrm{Diff}}(g) = \dim \mathrm{Isom}(M, g).$$

**Critically**, $\dim \mathrm{Isom}(M, g)$ is *not* given by $\binom{\dim \epsilon(g)}{2}$. For example: the round sphere $S^n$ has $\mathrm{Isom} = O(n+1)$ of dim $\binom{n+1}{2}$, but the round metric is rigid ($\epsilon = 0$). Conversely, an Einstein metric with positive-dim IED can have small isometry group.

The reason: only isometries of the manifold lift to "stabilizers" in moduli. Most algebraic $O$-rotations on the IED space $\epsilon(g)$ do *not* come from any geometric symmetry of $(M, g)$.

## The structural difference

In the cellular case, the chain automorphism group $G$ is *purely algebraic*. Any linear map preserving the chain structure is in $G$, including arbitrary $O$-rotations on eigenspaces. The stab formula reflects this algebraic richness.

In the smooth case, the diffeomorphism group $\mathrm{Diff}(M)$ acts on metrics, but only diffeomorphisms preserving the metric ($\mathrm{Isom}(g)$) are stabilizers. Diffeomorphisms are *much* more restrictive than arbitrary linear automorphisms of tensor bundles — they have to be geometric maps, not just algebraic ones.

So:

> **The cellular case has too much stabilizer; the Einstein case has too little**, relative to a naive eigenvalue-multiplicity prediction.

The cellular case's $\sum_B \sum_n \binom{k_n^B}{2}$ is a *maximal* count of stabilizer dim achievable by any algebraic automorphism. The Einstein case's $\dim \mathrm{Isom}(g)$ is a *minimal* count, restricted to genuinely geometric symmetries.

## Implications

1. **The orbifold-moduli stratification is universal**, instantiated in cellular finite-dim, parametric graph [@aksoy2025reimagining], Einstein moduli, and finite spectral triple cases.

2. **The codim formula is universal.** $\sum_B (|B|-1)$ counts independent eigenvalue equalities, category-independent.

3. **The stab formula is not universal.** It depends on the automorphism category — full algebraic $G$, geometric $\mathrm{Diff}/\mathrm{Isom}$, or chain-end-respecting unitary, etc.

4. **Codim and stab answer different questions.** Stratum dim is universal; local orbifold structure depends on the category-specific stabilizer.

## What the right framework should look like

A unified Hilbert-lift-with-automorphism-group framework would specify:

- The category $\mathcal C$ of inputs.
- The cohomology theory $H^\bullet: \mathcal C \to \mathbf{grVect}$.
- The Hilbert lift functor $F: \mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$.
- The **automorphism category** $\mathrm{Aut}(\mathcal C)$: which morphisms count as automorphisms that should act on moduli.

For the cellular case: $\mathrm{Aut} = G_{\mathrm{ext}}$ (graded linear automorphisms), and stab is $G \cap U(Q)$.

For the Einstein case: $\mathrm{Aut} = \mathrm{Diff}(M)$, and stab is $\mathrm{Isom}(M, g)$.

The claim then is: for any choice of $\mathrm{Aut}$, the moduli of Hilbert lifts modulo $\mathrm{Aut}$ has orbifold structure with strata indexed by eigenvalue-multiplicity data. The stab formula at each stratum depends on $\mathrm{Aut}$. The codim formula does not.

## The Einstein analog of the "cross-$d_n$" effect

In the cellular case, the stab/codim discrepancy at a stratum has two sources:
- Within-$d_n$ multiplicities contribute *positively* to (stab − codim): excess stab from $O(k)$ algebraic rotation on eigenspaces.
- Cross-$d_n$ identifications contribute *negatively*: codim grows but stab doesn't, because chain conditions kill the would-be cross-rotation.

In the Einstein case, there is only **one** Laplacian (Lichnerowicz), and one boundary operator implicit (the de Rham $d$ acting on tensors). So there's no "cross-$d_n$ identification" structure — every eigenvalue-collision is a "within-$\Delta_L$" event.

This is consistent with the smooth case being "cleaner" structurally: there's just one Laplacian whose spectrum stratifies the moduli, and the stab is $\mathrm{Isom}$, which is whatever it is geometrically (no cross-coupling correction).

The cellular case's bipartite structure is specifically a feature of having multiple boundary operators $d_1, d_2, \ldots$ in a graded chain complex. For higher-form-Einstein-like equations with Laplacians acting on multiple form-degrees simultaneously, the bipartite/N-partite structure should reappear and the cellular-side analysis would generalize.

## Open

1. **Find or construct an Einstein-style moduli with N-partite structure.** Higher-form Yang-Mills-Einstein systems with multiple Laplacian operators? Self-dual / anti-self-dual decomposition on 4-manifolds? The cellular analysis predicts these should produce within-form-degree-multiplicity vs cross-form-degree-identification distinctions.

2. **A unified statement.** Write the universal codim formula as a theorem in a category-free framework (i.e., not specific to either chain complexes or Riemannian metrics). The hypotheses should be: a Hilbert-lift functor with an automorphism category. The conclusion: codim of moduli strata = $\sum_B (|B|-1)$.

3. ~~**Stratification poset.**~~ **Done for the cellular case** in [closure-poset-of-strata](closure-poset-of-strata.md): closure poset = bipartite multipartition refinement lattice, with explicit covering relations. The Einstein-side analog (closure poset of $\dim \epsilon(g)$-stratification) should be similarly classical; not written up in these resources.

4. **Dual-stratification analog.** The cellular case has *two* stratifications: Stratification I (this theorem's subject — eigenvalue multipartition) and Stratification II at the SPD-cone boundary ([hilbert-degeneracy-stratification](hilbert-degeneracy-stratification.md)). Does the Einstein case have an analog? The boundary of the moduli of Einstein metrics — where metrics become degenerate (e.g., collapse to lower-dim) — would be the natural candidate. Open whether this has been studied in the differential-geometry literature.
