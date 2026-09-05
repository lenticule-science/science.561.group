---
id: em-correspondence
name: EmCorrespondence
description: "the depth-restriction tower ρ_n factors into E-step and M-step (EM correspondence), the EM fixed point is R^{(1)}, and essential surjectivity of ρ_n follows from the relational universe axioms."
---

### Theorem — EM Correspondence {#em-correspondence}

The depth-restriction tower $\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ admits a
factorization into two half-steps that correspond precisely to the E-step and M-step of an
expectation-maximization algorithm on the moduli site $(\mathcal{M}_n, K_n)$
(§universe-moduli-space). The fixed point of this EM iteration is the first hyperverse level
$R^{(1)} = \mathbf{Sh}(\mathbf{RU}, J_\mathbf{RU})$ (§hyperverse-tower).

#### The Two Half-Steps {#em-half-steps}

**E-step: the inverse image $\rho_n^*$.** The restriction functor
$\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ is a functor of sites (§universe-moduli-space),
so it induces an adjoint pair of geometric morphisms. The **inverse image functor**
$$
\rho_n^* : \mathbf{Sh}(\mathcal{M}_n, K_n) \longrightarrow \mathbf{Sh}(\mathcal{M}_{n+1}, K_{n+1})
$$
lifts data from depth $n$ to depth $n+1$ by precomposition with $\rho_n$. Given a
probability sheaf $p_n$ on $(\mathcal{M}_n, K_n)$, the E-step computes the **expected
extension**: the pullback $\rho_n^*(p_n)$ is the unique probability sheaf on
$(\mathcal{M}_{n+1}, K_{n+1})$ that assigns to each depth-$(n+1)$ universe $\mathbf{V}$
the weight $p_n(\rho_n(\mathbf{V}))$ — the probability of the depth-$n$ restriction
of $\mathbf{V}$, distributed uniformly across the fiber $\rho_n^{-1}(\rho_n(\mathbf{V}))$.

This is the E-step: it uses the current distribution at depth $n$ to compute expected
sufficient statistics at depth $n+1$, without yet incorporating the new information
available at the deeper level.

**M-step: the universe morphism update.** The M-step applies the universe closure
$U_G$ (§closure-operator) to update the nucleus families. Given the expected distribution
$\rho_n^*(p_n)$, the M-step selects the universe morphism
$$
(\phi_{n+1}, \alpha_{n+1}) : R^{(n)} \longrightarrow R^{(n+1)}
$$
that maximizes the sheaf-theoretic likelihood: the morphism $(\phi, \alpha)$ in
$\mathbf{RU}^{(n)}$ (§hyperverse-tower) whose induced geometric morphism best fits
the nucleus data $\rho_n^*(p_n)$. In the Fischer-Rao geometry (§fischer-rao-metric),
"best fit" means the projection onto the geodesic connecting $\rho_n^*(p_n)$ to its
image under the direct image functor $(\rho_n)_*$, i.e., the natural-gradient update.

The M-step is a universe morphism (§universe-morphism), not merely a set map: it
preserves the history-site structure and the nuclear data, updating the probability sheaf
in a way that respects the categorical structure of $\mathcal{M}_{n+1}$.

#### The EM Iteration {#em-iteration}

The composite of E-step and M-step defines the **EM operator**:
$$
\mathrm{EM}_n : \mathcal{P}\bigl(\mathbf{Sh}(\mathcal{M}_n, K_n)\bigr)
\longrightarrow \mathcal{P}\bigl(\mathbf{Sh}(\mathcal{M}_{n+1}, K_{n+1})\bigr)
\longrightarrow \mathcal{P}\bigl(\mathbf{Sh}(\mathcal{M}_{n+1}, K_{n+1})\bigr).
$$

Iterating across depth levels $n = 0, 1, 2, \ldots$ produces a sequence of probability
sheaves. The **EM fixed point** is the distribution $p_\omega$ on the colimit site
$(\mathcal{M}_\omega, K_\omega)$ (§universe-moduli-space) such that both half-steps
act as the identity: the E-step adds no new expected information, and the M-step finds
no better universe morphism.

#### Theorem — EM Fixed Point Is $R^{(1)}$ {#thm-em-fixed-point}

**Theorem.** The EM fixed point $p_\omega$ is concentrated on the canonical universe
$R = R^{(0)}$, and the ambient sheaf topos of the fixed point is
$R^{(1)} = \mathbf{Sh}(\mathbf{RU}, J_\mathbf{RU})$ — the first level of the hyperverse
tower (§hyperverse-tower).

*Proof sketch.*

1. **E-step stabilization.** At the EM fixed point, $\rho_n^*(p_\omega)|_n = p_\omega|_n$
   for all $n$. This means the probability sheaf is compatible with all restriction
   functors: it is a section of the inverse limit
   $\varprojlim_n \mathcal{P}(\mathbf{Sh}(\mathcal{M}_n, K_n))$. By the universal
   property of $\mathcal{M}_\omega$ (§universe-moduli-space), such a compatible family
   corresponds to a probability sheaf on $(\mathcal{M}_\omega, K_\omega)$.

2. **M-step stabilization.** At the fixed point, no universe morphism improves the
   likelihood. By §universe-morphism, this means the nucleus families are already
   compatible with all available history data: the morphism $(\phi, \alpha)$ is an
   isomorphism. The canonical universe $R$ is the unique such object by §initiality.

3. **The ambient topos.** The sheaf topos over the concentrated distribution on $R$
   within $\mathcal{M}_\omega$ is $\mathbf{Sh}(\mathbf{RU}, J_\mathbf{RU}) = R^{(1)}$
   by the construction of §hyperverse-tower. $\square$

The essential surjectivity of $\rho_n$ — and its equivalence with $H^1(T^{(n)}, J^{(n)};\, E_0) = 0$ — is proved in §essential-surjectivity.

**Status.** Draft. The E-step/M-step factorization is precise. The proof of the EM fixed
point being $R^{(1)}$ relies on the initiality of $R$ (§initiality) and the construction
of the hyperverse tower (§hyperverse-tower). The essential surjectivity theorem is
established modulo the identification of the obstruction class with the section-extension
problem, which follows from standard sheaf cohomology (§cohomology).
