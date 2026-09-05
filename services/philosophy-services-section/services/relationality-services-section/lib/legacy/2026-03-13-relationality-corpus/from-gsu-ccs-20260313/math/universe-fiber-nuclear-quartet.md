---

name: universe-fiber-nuclear-quartet
description: "the nuclear quartet of the universe fiber (H_U^*, σ^(n+1)_U, Δ^(n+1)_U) — the four-corner square (H_U^*, Fix(σ), Fix(Δ), (H_U^*)^*) at the meta-level, parallel to the fiber nuclear quartet."
---

### Construction — Universe Fiber Nuclear Quartet {#universe-fiber-nuclear-quartet}

The fiber nuclear quartet (§fiber-nuclear-quartet) is the nuclear quartet of the pair
$(H_t, \sigma_t, \Delta_t)$. The same construction applies one level up: the **universe fiber
nuclear quartet** is the nuclear quartet of the universe fiber equipped with its meta-nuclei.

#### Definition {#def-universe-fiber-nuclear-quartet}

For $\mathbf{U} \in \mathbf{RU}^{(n)}$, the **universe fiber nuclear quartet** is
$$
\bigl(\,H_\mathbf{U}^*,\;\; \mathrm{Fix}(\sigma^{(n+1)}_\mathbf{U}),\;\; \mathrm{Fix}(\Delta^{(n+1)}_\mathbf{U}),\;\; (H_\mathbf{U}^*)^*\,\bigr).
$$

The four sub-algebras are:

| Sub-algebra | Name | File |
|-------------|------|------|
| $H_\mathbf{U}^*$ | Universe fiber — the free meta-carrier | §universe-fiber |
| $\mathrm{Fix}(\sigma^{(n+1)}_\mathbf{U})$ | Saturation-stable universe — propositions settled w.r.t. the inter-universe context | §saturation-stable-universe |
| $\mathrm{Fix}(\Delta^{(n+1)}_\mathbf{U})$ | Transfer-stable universe — propositions preserved under all tower extensions | §transfer-stable-universe |
| $(H_\mathbf{U}^*)^*$ | Fixed universe — doubly meta-stable, where the meta-joint-projection is identity | §fixed-universe |

Each inclusion is strict when $\mathbf{U}$ is not hyperverse-fixed (§hyperverse-fixed-universe):
$(H_\mathbf{U}^*)^* \subsetneq \mathrm{Fix}(\sigma^{(n+1)}_\mathbf{U}) \subsetneq H_\mathbf{U}^*$
and $(H_\mathbf{U}^*)^* \subsetneq \mathrm{Fix}(\Delta^{(n+1)}_\mathbf{U}) \subsetneq H_\mathbf{U}^*$
in general.

#### The Meta-Nuclear Square {#universe-fiber-nuclear-square}

The four sub-algebras form the commuting square of inclusions and meta-nucleus maps:
$$
\begin{array}{ccc}
H_\mathbf{U}^* & \xrightarrow{\sigma^{(n+1)}_\mathbf{U}} & \mathrm{Fix}(\sigma^{(n+1)}_\mathbf{U}) \\
\Delta^{(n+1)}_\mathbf{U} \downarrow & & \downarrow \Delta^{(n+1)}_\mathbf{U}|_{\mathrm{Fix}(\sigma)} \\
\mathrm{Fix}(\Delta^{(n+1)}_\mathbf{U}) & \xrightarrow{\sigma^{(n+1)}_\mathbf{U}|_{\mathrm{Fix}(\Delta)}} & (H_\mathbf{U}^*)^*
\end{array}
$$
The square commutes because the meta-nuclei commute (§nucleus-commutation at the universe level):
$\sigma^{(n+1)}_\mathbf{U} \circ \Delta^{(n+1)}_\mathbf{U} = \Delta^{(n+1)}_\mathbf{U} \circ \sigma^{(n+1)}_\mathbf{U} = \pi^{(n+1)}_\mathbf{U}$,
the meta-joint-projection (§joint-projection, applied at level $n+1$).

#### Tower Role {#universe-fiber-nuclear-quartet-tower}

Parallel to the fiber case (§fiber-nuclear-quartet, Tower Role): the joint fixed-point
sub-algebra $(H_\mathbf{U}^*)^*$ at level $n$ is the free meta-carrier for the universe
fiber nuclear quartet at level $n+1$. The tower advances by promoting the fixed universe
of each level to the free carrier of the next:
$$
H_\mathbf{U}^{*(0)} \;\hookrightarrow\; (H_\mathbf{U}^{*(0)})^* \;=\; H_\mathbf{U}^{*(1)} \;\hookrightarrow\; (H_\mathbf{U}^{*(1)})^* \;=\; H_\mathbf{U}^{*(2)} \;\hookrightarrow\; \cdots
$$
This is the universe-level instance of the seeding pattern (§tower-fiber-seeding).

At the colimit $\mathcal{H}$, the quartet degenerates: the meta-nuclei become trivial
(§modal-collapse), so all four sub-algebras coincide with the hyperversal fiber algebra
$H_t^\mathcal{H}$ (§hyperversal-fiber-doctrine). The nuclear quartet has no work left to do.
