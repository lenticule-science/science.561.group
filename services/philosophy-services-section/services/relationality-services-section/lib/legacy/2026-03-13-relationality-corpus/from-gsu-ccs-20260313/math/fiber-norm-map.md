---

name: fiber-norm-map
description: "The Fiber-Norm Map"
---

### Construction — The Fiber-Norm Map {#fiber-norm-map}

The depth-restriction map $\rho_n : \mathcal{M}_{n+1} \to \mathcal{M}_n$ (§depth-filtration)
partitions the index set $\mathcal{M}_{n+1}$ into fibers. The **fiber-norm map** collapses each
fiber to its Euclidean norm, producing a smooth map between unit spheres that is a Riemannian
submersion.

#### Construction {#construction-fiber-norm}

For each $m \in \mathcal{M}_n$, the **fiber** is $F_m := \rho_n^{-1}(m) \subseteq \mathcal{M}_{n+1}$.
The fiber-norm map is:
$$
\widetilde{K}_n : S^{|\mathcal{M}_{n+1}|-1} \longrightarrow S^{|\mathcal{M}_n|-1},
\qquad
x \;\longmapsto\; \Bigl(\bigl\|(x_{m'})_{m' \in F_m}\bigr\|_2\Bigr)_{m \in \mathcal{M}_n}.
$$

**Well-definedness.** $\sum_m \|(x_{m'})_{m' \in F_m}\|^2 = \sum_{m'} x_{m'}^2 = 1$,
so the image lies in $S^{|\mathcal{M}_n|-1}$. Smoothness: the fiber-norm is smooth on
the open set where each fiber block is nonzero (which is the preimage of the positive orthant,
hence dense).

**Relation to Markov kernels.** The following diagram commutes:
$$
\phi_n \circ K_n \;=\; \widetilde{K}_n \circ \phi_{n+1}.
$$
*Verification:* $(\phi_n \circ K_n)(q)_m = \sqrt{K_n(q)(m)} = \sqrt{\sum_{m' \in F_m} q(m')}$
and $(\widetilde{K}_n \circ \phi_{n+1})(q)_m = \|(\sqrt{q(m')})_{m' \in F_m}\|_2 =
\sqrt{\sum_{m' \in F_m} q(m')}$. They agree. $\checkmark$

#### Theorem — The Fiber-Norm Map is a Riemannian Submersion {#thm-fiber-norm-submersion}

Under the surjectivity hypothesis of §fischer-rao-metric, $\widetilde{K}_n$ is a surjective smooth
Riemannian submersion from $S^{|\mathcal{M}_{n+1}|-1}$ (round metric) to
$S^{|\mathcal{M}_n|-1}$ (round metric).

*Proof.* Fix $x \in S^{|\mathcal{M}_{n+1}|-1}$ in the domain of smoothness. Write
$x_{|F_m} := (x_{m'})_{m' \in F_m}$ and $r_m := \|x_{|F_m}\|_2 > 0$ (positive orthant).

The differential $(d\widetilde{K}_n)_x : T_x S^{|\mathcal{M}_{n+1}|-1} \to T_{\widetilde{K}_n(x)} S^{|\mathcal{M}_n|-1}$
acts on $v = (v_{m'}) \in T_x S^{|\mathcal{M}_{n+1}|-1}$ (with $\sum_{m'} x_{m'} v_{m'} = 0$) by:
$$
(d\widetilde{K}_n)_x(v)_m \;=\; \frac{\langle x_{|F_m},\, v_{|F_m} \rangle}{r_m}.
$$

**Vertical subspace** $\mathcal{V}_x = \ker (d\widetilde{K}_n)_x$: vectors $v$ with
$\langle x_{|F_m}, v_{|F_m} \rangle = 0$ for all $m$, i.e., $v_{|F_m} \perp x_{|F_m}$
within each fiber.

**Horizontal subspace** $\mathcal{H}_x = \mathcal{V}_x^\perp$ (orthogonal in the round metric):
vectors $v_{m'} = \lambda_m x_{m'}$ for all $m' \in F_m$ (proportional to $x$ within each
fiber, with scalar $\lambda_m$ depending only on $m$).

For a horizontal vector $v$ with $v_{|F_m} = \lambda_m x_{|F_m}$:
$$
(d\widetilde{K}_n)_x(v)_m = \frac{\langle x_{|F_m},\, \lambda_m x_{|F_m}\rangle}{r_m}
= \lambda_m r_m.
$$
The round metric on horizontal vectors at $x$:
$g_{\mathrm{round}}(v,v) = \sum_m \lambda_m^2 \|x_{|F_m}\|^2 = \sum_m \lambda_m^2 r_m^2$.
The round metric on the image:
$g_{\mathrm{round}}(d\widetilde{K}_n(v), d\widetilde{K}_n(v)) = \sum_m (\lambda_m r_m)^2$.
These are equal: $(d\widetilde{K}_n)_x$ is an isometry on $\mathcal{H}_x$. $\square$

**Surjectivity** follows from the surjectivity hypothesis on $K_n$ (§fischer-rao-metric) via the
commuting diagram above.
