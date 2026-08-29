---
type: term
term-kind: morphism
class: bilinear-form-construction
symbol: \langle \cdot, \cdot \rangle_D
depends-on: [spectral-triple]
see-also: [hodge-isomorphism, finite-spectral-triple-laplacianizability, infinite-spectral-triple-laplacianizability]
---

# Resolvent intertwiner (Hochschild–Hilbert lift)

The construction extracting a Hilbert structure on the Hochschild complex of $\mathcal A$ from the spectral data of $D$. The technical bridge that makes spectral triples fit the Laplacianizer framework.

## Setup

For a [spectral triple](./spectral-triple.md) $(\mathcal A, \mathcal H, D)$ with $D$ self-adjoint and compact resolvent (so $R_D := (1 + D^2)^{-1}$ is compact), define for $a, b \in \mathcal A$:

**Finite-dim case** ($\mathcal A, \mathcal H$ finite-dim):
$$\langle a, b \rangle_D := \mathrm{Tr}_\mathcal H \big(\pi(a)^* R_D \pi(b)\big).$$

**Infinite-dim, $p$-summable case** (with $p$ the summability degree):
$$\langle a, b \rangle_D := \mathrm{Tr}_\mathcal H \big(R_D^{N/2} \pi(a)^* \pi(b) R_D^{N/2}\big), \quad N > p.$$

For higher Hochschild chains $a_0 \otimes \cdots \otimes a_n \in C_n(\mathcal A) = \mathcal A^{\otimes(n+1)}$:
$$\langle a_0 \otimes \cdots \otimes a_n,\ b_0 \otimes \cdots \otimes b_n \rangle_D := \langle a_0, b_0 \rangle_D \cdot \prod_{i=1}^n \langle [D, \pi(a_i)], [D, \pi(b_i)] \rangle_D'$$

where $\langle x, y \rangle_D' := \mathrm{Tr}(R_D^{N/2} x^* y R_D^{N/2})$ extends the inner product to bounded operators (commutators).

## Properties

- **Positivity**: $\langle a, a \rangle_D = \|R_D^{N/2} \pi(a)\|_{HS}^2 \ge 0$ as a Hilbert–Schmidt norm squared. Strictly positive for $a \ne 0$ when $\theta_D: a \mapsto R_D^{N/2} \pi(a)$ is injective.
- **Symmetry (Hermitian)**: $\overline{\langle a, b \rangle_D} = \langle b, a \rangle_D$ from the trace identity $\mathrm{Tr}(X^*) = \overline{\mathrm{Tr}(X)}$.
- **Finiteness**: traces are finite by $p$-summability + suitable choice of $N$.
- **Continuity in $D$**: real-analytic on the open set where $\theta_D$ is injective (Kato perturbation theory applies).

## Why $R_D$ rather than $e^{-tD^2}$

The Connes–Moscovici JLO cocycle uses the heat kernel $e^{-tD^2}$ integrated over the simplex $\Delta_n$. The resolvent-based formula here uses $R_D = (1+D^2)^{-1}$ instead — simpler, gives a positive form directly without the simplex integration, and is more amenable to perturbation theory.

The two formulations are *not literally equal* but extract spectral information from the same $D$ and pair to the same K-theory index via Connes–Karoubi duality.

## Hodge Laplacian induced

The Hochschild differential $b: C_n(\mathcal A) \to C_{n-1}(\mathcal A)$ acts on chains:
$$b(a_0 \otimes \cdots \otimes a_n) = \sum_{i=0}^{n-1}(-1)^i a_0 \otimes \cdots \otimes a_i a_{i+1} \otimes \cdots \otimes a_n + (-1)^n a_n a_0 \otimes a_1 \otimes \cdots \otimes a_{n-1}.$$

With the resolvent inner product, $b^*$ is well-defined; the Hodge Laplacian
$$\Delta_n^{(D)} := b b^* + b^* b$$
is self-adjoint with discrete spectrum (under regularity / compact-resolvent assumptions). Its kernel realizes the [Hodge isomorphism](./hodge-isomorphism.md) with Hochschild homology $\mathrm{HH}_n(\mathcal A)$.

## Reduction to smooth Riemannian

For the canonical spectral triple $(C^\infty(M), L^2(M, S), \not\!\!\!D)$ on a compact spin manifold $M$:
- Hochschild–Kostant–Rosenberg: $\mathrm{HH}_\bullet(C^\infty(M)) \cong \Omega^\bullet(M)$.
- Connes 1985: $\mathrm{HP}_\bullet(C^\infty(M)) \cong H^\bullet_{\mathrm{dR}}(M)$ (periodic cyclic = de Rham, mod 2-periodic).
- The resolvent inner product, restricted to HKR representatives, induces the standard $L^2$-inner product on $\Omega^\bullet(M)$ (up to a Wodzicki-residue normalization).
- The cyclic-complex variant gives the de Rham Laplacian on $\Omega^\bullet$.

So the resolvent intertwiner *generalizes* the smooth Riemannian Laplacianizer, and reduces to it on commutative spectral triples.

## Variant: cyclic complex

For commutative $\mathcal A$, the Hochschild differential collapses on HKR representatives. The genuinely-non-trivial differential is Connes' $B$ on the cyclic complex $\mathrm{HC}_\bullet$. The cyclic Hochschild–Hilbert lift uses the same resolvent inner product, but on cyclic chains, with differential $b - B$. Under HKR, $\Delta^{\lambda} = (b-B)(b-B)^* + (b-B)^*(b-B)$ corresponds to the de Rham Laplacian $dd^* + d^*d$.

## Generality / regularity

For *regular* spectral triples (Connes' sense: $\mathcal A$ closed under $\delta = [|D|, \cdot]$), the resolvent intertwiner gives a well-defined Hilbert chain complex with closed range and Hodge isomorphism. This covers:
- Compact spin manifolds (canonical spectral triple).
- Almost-commutative spectral triples ($C^\infty(M) \otimes \mathcal A_F$).
- Discrete groups with property RD.
- Many quantum-group / quantum-torus / deformation-quantization cases.

A self-contained closed-range proof for regular spectral triples (without invoking Connes' nc-pseudo-DO calculus) is [open](../../documents/articles/research-articles/questions/closed-range-for-regular-spectral-triples.md).
