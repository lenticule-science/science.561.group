---

name: noether-fiber
description: "every automorphism of (H_t, σ_t, Δ_t) in HA_nucl preserves H_t* and stabilizes each eigenspace of the defect operator — a purely relational conservation law."
---

### Theorem — Categorical Noether Theorem for Fiber Algebras {#noether-fiber}

Let $\phi : (H_t, \sigma_t, \Delta_t) \xrightarrow{\;\sim\;} (H_t, \sigma_t, \Delta_t)$ be an
automorphism in $\mathbf{HA_{nucl}}$ — a Heyting algebra isomorphism commuting with both
nuclei. Then:

1. $\phi$ preserves $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

2. $\phi$ induces an invertible $K$-linear map $\phi_* : V_t \to V_t$ (where
   $V_t = K^{H_t^*}$, §spectral-decomposition) that commutes with the defect operator $\delta_t$.

3. Each eigenspace $E_{t,\lambda}$ of $\delta_t$ is $\phi_*$-stable.

*Proof.* (1): If $a \in \mathrm{Fix}(\sigma_t)$, then $\sigma_t(\phi(a)) = \phi(\sigma_t(a)) = \phi(a)$,
so $\phi(a) \in \mathrm{Fix}(\sigma_t)$. Similarly for $\Delta_t$. Their intersection $H_t^*$ is
preserved. (2): $\phi|_{H_t^*}$ is a bijection; it induces a permutation matrix $\phi_*$ on the
basis of $V_t = K^{H_t^*}$. Since $\delta_t$ is defined functorially from $\sigma_t$ and $\Delta_t$
(§spectral-decomposition), the intertwining $\phi \circ \sigma_t = \sigma_t \circ \phi$ and
$\phi \circ \Delta_t = \Delta_t \circ \phi$ give $\phi_* \circ \delta_t = \delta_t \circ \phi_*$.
(3): Two commuting diagonalizable endomorphisms share eigenspaces. $\square$

#### Corollary — Relational Conservation Law {#relational-conservation}

The stable mode eigenspace $E_{t,0} = \ker \delta_t$ is $\mathrm{Aut}(H_t, \sigma_t, \Delta_t)$-stable:
it is preserved by every relational symmetry at history $t$. These are the **conserved quantities**
of the fiber symmetry group — a purely relational conservation law requiring no metric,
no Lagrangian, and no energy.

At the fiber level, "comonad morphism" (§beck-chevalley-tower) specializes to automorphism in
$\mathbf{HA_{nucl}}$, and "stabilization" specializes to the zero-eigenspace $E_{t,0}$.
