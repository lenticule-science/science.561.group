---
id: fischer-rao-metric
name: FischerRaoMetric
description: "Fischer-Rao Metric on the Moduli Site"
---

### Construction — Fischer-Rao Metric on the Moduli Site {#fischer-rao-metric}

> **Status.** The Fischer-Rao connection is a conjectural framework supported by a proof sketch. It
> is not a theorem following purely from all eight axioms. The argument below identifies precise conditions
> under which Čencov's theorem applies; those conditions must be verified case by case.

The depth-restriction maps $\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ are functors between
the moduli categories of §universe-moduli-space. By §universe-morphism, a universe morphism
$(\phi, \alpha) : \mathbf{U} \to \mathbf{V}$ induces a geometric morphism of the associated
toposes. The restriction functors therefore act on sheaf categories:
$$
\rho_n^* : \mathbf{Sh}(\mathcal{M}_n, K_n) \longrightarrow \mathbf{Sh}(\mathcal{M}_{n+1}, K_{n+1}).
$$

A **stochastic nucleus family** at depth $n$ is a probability sheaf: a sheaf of probability
measures $p \in \mathbf{Sh}(\mathcal{M}_n, K_n)$ assigning to each universe
$\mathbf{U} \in \mathcal{M}_n$ a distribution over its fiber algebras, compatible with the
covering topology $K_n$ (§universe-moduli-space). The restriction functors $\rho_n$ lift to
**Markov kernels** between the spaces of probability sheaves:
$$
\bar{K}_n : \mathcal{P}\bigl(\mathbf{Sh}(\mathcal{M}_{n+1}, K_{n+1})\bigr) \longrightarrow
\mathcal{P}\bigl(\mathbf{Sh}(\mathcal{M}_n, K_n)\bigr),
$$
defined fiberwise by pushforward along $\rho_n$: for a distribution $p$ over depth-$(n+1)$
universes and a depth-$n$ universe $\mathbf{U}$,
$$
\bar{K}_n(p)(\mathbf{U}) \;:=\; \sum_{\mathbf{V} :\, \rho_n(\mathbf{V}) \cong \mathbf{U}} p(\mathbf{V}).
$$

**Proposition (proof sketch).** *Under the hypothesis that $\rho_n$ is essentially surjective as a
functor $\mathcal{M}_{n+1} \to \mathcal{M}_n$* — i.e., every depth-$n$ universe is isomorphic to
the restriction of some depth-$(n+1)$ universe — *the unique Riemannian metric on the space of
probability sheaves over $(\mathcal{M}_n, K_n)$ invariant under the family $\{\bar{K}_n\}$ is the
**Fischer-Rao metric**:*
$$
g_{ij}^{\mathrm{FR}}(p) \;=\; \sum_{\mathbf{U} \in |\mathcal{M}_n|} \frac{\partial_i p(\mathbf{U})\, \partial_j p(\mathbf{U})}{p(\mathbf{U})}.
$$

*Proof sketch.* Čencov's theorem (1982) states that the Fischer information metric is the unique
Riemannian metric on probability simplices invariant under all surjective sufficient-statistics maps.
Campbell (1986) extended this to families of Markov morphisms indexed by a filtration. The essential
surjectivity of $\rho_n$ guarantees that $\bar{K}_n$ is surjective as a Markov morphism: every
probability sheaf on $(\mathcal{M}_n, K_n)$ is in the image. Under this hypothesis the Markov
kernels $\bar{K}_n$ satisfy the conditions of Campbell's generalization. $\square$

*Remark — Essential surjectivity vs. surjectivity.* The old formulation required $\rho_n$ to be
surjective on objects, which fails to account for the categorical structure of $\mathcal{M}_n$.
Essential surjectivity is the correct categorical condition: it asks only that every depth-$n$
universe be isomorphic (in the sense of §universe-morphism) to a restriction. This is strictly
weaker than object-level surjectivity and is the natural condition when $\mathcal{M}_n$ carries
morphisms.

*Caveat.* Essential surjectivity of $\rho_n$ is not automatic from the eight axioms alone. It holds
when $J$ is subcanonical at every depth and $H^1(T^{(n)}, J^{(n)};\, E_0) = 0$ — i.e., when
there are no cohomological obstructions to extending nucleus families (§cohomology). The connection
between essential surjectivity and the vanishing of $H^1$ is the content of the Convergence
Unification theorem (§convergence-unification).

*References.* N. N. Čencov, *Statistical Decision Rules and Optimal Inference*, AMS, 1982;
L. L. Campbell, *Proc. Amer. Math. Soc.* 98 (1986) 135–141; S. Amari, *Neural Computation* 10
(1998) 251–276; N. Ay, J. Jost, H. V. Lê, L. Schwachhöfer, *Information Geometry*, Springer, 2017.
