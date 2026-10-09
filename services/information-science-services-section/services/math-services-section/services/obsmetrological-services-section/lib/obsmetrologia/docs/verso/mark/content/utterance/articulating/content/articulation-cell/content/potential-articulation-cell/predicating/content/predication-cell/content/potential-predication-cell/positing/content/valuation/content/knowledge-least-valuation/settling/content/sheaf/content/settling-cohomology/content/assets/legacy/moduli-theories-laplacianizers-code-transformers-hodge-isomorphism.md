---
type: morphism
class: natural-isomorphism
symbol: "\\eta : H^\\bullet \\xrightarrow{\\sim} \\ker \\Delta"
depends-on: [hodge-laplacian, laplacianizer]
see-also: [closed-range-obstruction, weighted-boundary-operator]
---

# Hodge isomorphism

The natural isomorphism between cohomology and the kernel of the Hodge Laplacian. The defining structural feature of a [Laplacianizer](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/laplacianizer.md): it's what makes the Hilbert lift "see" the cohomology.

## Statement

For a graded Hilbert chain complex $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ where each $d_n$ has closed range,
$$\eta_n: H_n(C_\bullet, d) \xrightarrow{\sim} \ker \Delta_n,$$
where $\Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*$ is the Hodge Laplacian and $d^*$ is the Hilbert adjoint.

The isomorphism takes a homology class $[c] \in H_n$ to its unique harmonic representative $h \in c$ — the element of the equivalence class that is annihilated by $\Delta_n$.

## Hodge decomposition

Equivalently, the Hodge isomorphism comes from the orthogonal decomposition
$$C_n = \mathrm{im}\, d_{n+1} \oplus \ker \Delta_n \oplus \mathrm{im}\, d_n^*$$
where:
- $\mathrm{im}\, d_{n+1}$ is the boundaries (cohomologous to zero).
- $\ker \Delta_n$ is the harmonic representatives.
- $\mathrm{im}\, d_n^*$ is the cocycles.

The cycles are $\ker d_n = \mathrm{im}\, d_{n+1} \oplus \ker \Delta_n$, so cycles modulo boundaries (= homology) is canonically isomorphic to harmonics.

## Closed range required

The Hodge isomorphism uses the orthogonal projection onto $\mathrm{im}\, d_{n+1}$, which is well-defined iff $\mathrm{im}\, d_{n+1}$ is closed in $C_{n+1}$. For finite-dim $C_n$, this is automatic. For infinite-dim $C_n$ (smooth Riemannian, infinite spectral triples), [closed range](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/closed-range-obstruction.md) is a non-trivial condition.

## What $\eta$ encodes

A Laplacianizer is a triple $(F, d, \eta)$ where $F: \mathcal C \to \mathbf{Hilb}^\mathbb Z$ is the Hilbert lift functor, $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is the natural iso. The $\eta$ is what makes the Hilbert chain complex "compute" the prescribed cohomology theory $H^\bullet$ — without $\eta$, the Hilbert lift's homology might be unrelated.

For different Hilbert structures (different points of $\mathcal H$), the $\eta$ varies: the harmonic representative of a fixed cohomology class depends on the inner product. So $\eta_n^{(Q)}: H_n \xrightarrow{\sim} \ker \Delta_n^{(Q)} \subseteq C_n$ defines a bundle of sub-vector-spaces over $\mathcal H$ whose fibers are the harmonic subspaces.

## Naturality

For a chain map $f: (C_\bullet, d) \to (C'_\bullet, d')$ that respects Hilbert structure (intertwines adjoints), $\eta$ is natural in the chain map. This is part of the definition of "morphism of Laplacianizers."

## In the cellular case

For a cellular chain complex with stalkwise diagonal $Q_n$, the Hodge decomposition has a combinatorial interpretation: $\mathrm{im}\, d_{n+1}$ corresponds to weighted boundaries of $(n+1)$-cells; $\ker \Delta_n$ to weighted harmonic $n$-chains; $\mathrm{im}\, d_n^*$ to weighted coboundaries.

The harmonic representative of a homology class is the "minimum weighted norm" cycle in the class — the energy-minimizing representative. For graphs ($n = 0$), this recovers the constants (which is $H_0$ for connected graphs).

## In the spectral-triple case

For a spectral triple $(\mathcal A, \mathcal H_{\mathrm{spt}}, D)$ with the [Hochschild-Hilbert lift](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/resolvent-intertwiner.md), the Hodge isomorphism becomes
$$\eta_n: \mathrm{HH}_n(\mathcal A) \xrightarrow{\sim} \ker(\Delta_n^{(D)})$$
on Hochschild chains, with $\Delta^{(D)}$ the Hochschild Hodge Laplacian induced by the resolvent inner product. Provided closed range of $b$ on Hochschild chains (automatic for finite spectral triples, and for regular spectral triples in Connes' sense), the iso holds.

For commutative $\mathcal A = C^\infty(M)$, HKR identifies $\mathrm{HH}_\bullet \cong \Omega^\bullet$, and the Hodge isomorphism reduces to the classical de Rham–Hodge isomorphism on the smooth manifold.
