---

name: tower-stable-fiber
description: "Object: Tower-Stable Fiber of U — H_U^(∞)* = ⋂_n H_U^(n)*, the sub-algebra of elements stable at every level of the hyperverse tower; equals H_U^* iff U is hyperverse-fixed."
defines: TowerStableFiber
---

### Definition — Tower-Stable Fiber {#tower-active-fiber}

The **tower-stable fiber** of a relational universe $\mathbf{U}$ embedded in the
hyperverse tower is:
$$
H_\mathbf{U}^{(\infty)*} \;:=\; \bigcap_{n \geq 0} H_\mathbf{U}^{(n)*}.
$$

An element $a$ belongs to $H_\mathbf{U}^{(\infty)*}$ if and only if $a$ is
stable at every tower level $n \geq 0$. Equivalently, no level of the tower can further refine or settle $a$.

The tower-stable fiber is a sub-Heyting-algebra of $H_\mathbf{U}^*$: meets and
implication are inherited from $H_\mathbf{U}^*$; joins are not generally preserved,
so it need not be a sub-topos.

#### Relation to Hyperverse-Fixed Universes {#tower-stable-fiber-fixed}

By Tower Fiber Stability (§tower-fiber-stability):

- **If $\mathbf{U}$ is hyperverse-fixed** (§hyperverse-fixed-universe): the chain
  $H_\mathbf{U}^{(n)*}$ is constant, so $H_\mathbf{U}^{(\infty)*} = H_\mathbf{U}^*$.
  Tower stability and universe stability coincide.

- **If $\mathbf{U}$ is not hyperverse-fixed**: the chain descends strictly at
  every level, so $H_\mathbf{U}^{(\infty)*} \subsetneq H_\mathbf{U}^*$. The
  tower-stable fiber is only identifiable at the colimit $\mathcal{H}$, not from
  within any finite $R^{(n)}$.

#### Three-Level Fiber Hierarchy {#tower-stable-fiber-hierarchy}

The tower-stable fiber completes the four-term filtration:

$$
H_\mathbf{U}^{(\infty)*}
\;\subseteq\;
(H_\mathbf{U}^*)^*
\;\subseteq\;
H_\mathbf{U}^*
\;\subseteq\;
H_\mathbf{U}
$$

where:
- $H_\mathbf{U}$ = full fiber algebra of $\mathbf{U}$
- $H_\mathbf{U}^*$ = fixed fiber: $\mathrm{Fix}(\sigma_\mathbf{U}) \cap \mathrm{Fix}(\Delta_\mathbf{U})$ (§fixed-fiber)
- $(H_\mathbf{U}^*)^*$ = fixed universe: the meta-level fixed fiber (§fixed-universe)
- $H_\mathbf{U}^{(\infty)*}$ = tower-stable fiber: what survives all tower levels

For a hyperverse-fixed universe, all four coincide.
