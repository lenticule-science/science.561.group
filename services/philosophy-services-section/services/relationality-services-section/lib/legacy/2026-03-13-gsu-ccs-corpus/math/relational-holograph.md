---
id: relational-holograph
name: RelationalHolograph
description: "Relational Holograph"
---

### Definition — Relational Holograph {#relational-holograph}

#### Definition — Relational Holograph {#def-holograph}

A **relational holograph** is a triple $(X, \partial X, \pi)$ consisting of:

1. A relational universe $X = \mathbf{Sh}(T,J)$ (the **bulk**),
2. An internal locale $\partial X$ internal to $X$ (the **boundary**),
3. A surjective frame map $\pi^\sharp : \mathcal{O}(\partial X) \hookrightarrow \mathcal{O}(X)$ (the **holographic projection**),

equipped with a non-degenerate pairing
$$
\langle -, - \rangle : \mathcal{O}(\partial X) \times \mathcal{O}(\partial X)^\vee \longrightarrow \Omega
$$
(the **recovery pairing**) that is separating: distinct opens of $\partial X$ are
distinguished by observations in $\mathcal{O}(\partial X)^\vee$, and distinct observations are
distinguished by opens.

The holograph is **complete** if $\pi^\sharp$ is an isomorphism of frames — every bulk
open is the image of a unique boundary open.

#### The Canonical Instance {#def-canonical-holograph}

The Relational Universe $R = \mathbf{Sh}(T,J)$ carries a canonical holographic
structure $(R, \mathsf{Phase}, \mathsf{Stab})$:

- **Bulk** $X = R$: the full Grothendieck topos of sheaves on the history site.
- **Boundary** $\partial X = \mathsf{Phase}$: the invariant locale (§invariant-locale)
  with $\mathcal{O}(\mathsf{Phase}) = H^\ast$, the fixed subsheaf.
- **Holographic projection** $\pi = \mathsf{Stab} : H \to H^\ast$: the stabilization
  map (§invariant-locale, §joint-projection), defined fiberwise by
  $\mathsf{Stab}(a) = \sigma(\Delta(a))$.

The projection is surjective (every fixed element is the stabilization of itself) and
order-preserving ($a \leq b$ implies $\mathsf{Stab}(a) \leq \mathsf{Stab}(b)$, since
$\sigma$ and $\Delta$ are nuclei, hence monotone).

#### Theorem — Recovery via Observation Duality {#thm-holograph-recovery}

In the canonical holograph $(R, \mathsf{Phase}, \mathsf{Stab})$, the Observation
Duality pairing
$$
\langle -, - \rangle : H^\ast \times (H^\vee)^\ast \longrightarrow \Omega
$$
(§observation-duality) is the recovery pairing. It satisfies:

1. **Separation.** Distinct elements of $H^\ast$ are separated by $(H^\vee)^\ast$.
2. **Co-separation.** Distinct elements of $(H^\vee)^\ast$ are separated by $H^\ast$.
3. **Naturality.** The pairing is compatible with restriction along all morphisms of $T$.

Thus the canonical holograph is complete in the sense that $H^\ast$ is fully
recoverable from the observation data in $(H^\vee)^\ast$.

**Proof.** Immediate from Theorem — Observation Duality (§observation-duality). ∎

#### Remark — Chu Construction {#remark-chu}

The recovery pairing $\langle -, - \rangle : H^\ast \times (H^\vee)^\ast \to \Omega$ is
an instance of the **Chu construction** $\mathrm{Chu}(R, \Omega)$: the category of
$\Omega$-valued bimorphisms, with objects $(A, B, e)$ where $e : A \times B \to \Omega$
is a bimorphism. The canonical holograph is the object
$$
\bigl(H^\ast,\; (H^\vee)^\ast,\; \langle -, - \rangle\bigr) \;\in\; \mathrm{Chu}(R, \Omega).
$$
The self-duality of the Chu construction — $(A, B, e)$ is dual to $(B, A, e^{\mathrm{op}})$
— is the algebraic shadow of holographic duality: bulk and boundary are each other's
observation spaces under the same pairing.

#### Tower Holography {#tower-holography}

The depth-filtration tower $R_0 \hookrightarrow R_1 \hookrightarrow \cdots \hookrightarrow R$
(§depth-filtration) yields a **stratified holographic structure**: each inclusion
$\iota_n : R_n \hookrightarrow R_{n+1}$ is a holographic map with

- **Bulk at depth $n{+}1$**: $R_{n+1}$,
- **Boundary at depth $n{+}1$**: the image of $R_n$ under the universe closure
  $U_G(R_n) = R_{n+1}$ restricted to fixed fibers,
- **Projection**: the restriction of $\mathsf{Stab}_{n+1}$ to $H^{R_n}$.

At each depth, the boundary of $R_{n+1}$ is $R_n$: each universe is the boundary of
the next. The full boundary is the colimit limit $\mathsf{Phase} = \mathcal{O}^{-1}(H^\ast)$.

In this picture, "holography" is not a duality between $d$ and $d{-}1$ dimensions (as in
AdS/CFT), but a duality between two modal perspectives on the same object: what is
constructible from below (via $U_G$) and what is observable from above (via $\Omega$-predicates).
The depth tower refines this duality at each stage.

#### Remark — Holography and the Fixed Point {#remark-holograph-fixed-point}

At the fixed point $R = U_G(R)$: the bulk and boundary coincide. The holographic
projection $\mathsf{Stab} : H \to H^\ast$ is the identity on $H^\ast$ (since $H = H^\ast$
at the fixed point). In this limit, $\mathsf{Phase}$ is no longer a proper sub-locale of
$R$ but all of $R$. The holograph is complete in the strongest sense: every proposition
in the universe is already invariant, and construction and observation agree everywhere.

This is consistent with the Convergence Conjecture of §cohomological-tunneling: the
tower converges to the fixed point if and only if all cohomological obstructions are
exhausted — equivalently, if and only if the holographic projection becomes an
isomorphism everywhere.
