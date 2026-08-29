---
id: smooth-moduli
name: SmoothModuli
description: "Smooth Structure of the Moduli Space"
defines: SmoothModuli
---

### Construction — Smooth Structure of the Moduli Space {#smooth-moduli}

The open probability simplex over $\mathcal{M}_n$ carries a canonical smooth Riemannian
structure, constructed via an isometric embedding into a sphere.

#### Definition — Open Moduli Space {#def-open-moduli}

The **open moduli space** at depth $n$ is:
$$
\mathcal{P}^\circ(\mathcal{M}_n) \;:=\;
\bigl\{\, p \in \mathcal{P}(\mathcal{M}_n) \;\bigm|\; p(m) > 0 \text{ for all } m \in \mathcal{M}_n \bigr\},
$$
the interior of the $(|\mathcal{M}_n|-1)$-simplex. It is an open smooth submanifold of the
affine hyperplane $\{\sum_m p(m) = 1\} \subset \mathbb{R}^{\mathcal{M}_n}$ of dimension
$|\mathcal{M}_n| - 1$.

#### Construction — The Square-Root Embedding {#def-sqrt-embedding}

Define the **square-root map**:
$$
\phi_n : \mathcal{P}^\circ(\mathcal{M}_n) \longrightarrow S^{|\mathcal{M}_n|-1},
\qquad p \longmapsto \sqrt{p} \;:=\; \bigl(\sqrt{p(m)}\bigr)_{m \in \mathcal{M}_n},
$$
where $S^{|\mathcal{M}_n|-1} \subset \mathbb{R}^{|\mathcal{M}_n|}$ is the unit sphere. Since
$\sum_m (\sqrt{p(m)})^2 = 1$, the image lies in the positive orthant
$S^{|\mathcal{M}_n|-1}_{>0}$ of the sphere.

**Proposition — Isometric Embedding.** The pullback of the round metric $g_{\mathrm{round}}$
on $S^{|\mathcal{M}_n|-1}$ along $\phi_n$ satisfies:
$$
\phi_n^* g_{\mathrm{round}} \;=\; \tfrac{1}{4}\, g^{\mathrm{FR}}.
$$

*Proof.* The differential of $\phi_n$ at $p \in \mathcal{P}^\circ(\mathcal{M}_n)$ in direction
$v = (v_m) \in T_p\mathcal{P}^\circ$ (with $\sum_m v_m = 0$) is
$(d\phi_n)_p(v)_m = v_m / (2\sqrt{p(m)})$.
The pullback metric is:
$$
(\phi_n^* g_{\mathrm{round}})_p(v,v)
= \sum_m \frac{v_m^2}{4p(m)}
= \tfrac{1}{4}\, g^{\mathrm{FR}}_p(v,v). \qquad \checkmark
$$

**Corollary.** $(\mathcal{P}^\circ(\mathcal{M}_n),\, g^{\mathrm{FR}})$ is an **infinitely
differentiable Riemannian manifold** of dimension $|\mathcal{M}_n| - 1$. It is
**locally Euclidean**: the exponential map $\exp_p$ at any $p$ is a local isometry to
$\mathbb{R}^{|\mathcal{M}_n|-1}$.

#### Proposition — Geodesic Distance {#prop-geodesic-distance}

The geodesic distance in $(\mathcal{P}^\circ(\mathcal{M}_n),\, g^{\mathrm{FR}})$ is:
$$
d_{\mathrm{FR}}(p,q) \;=\; 2\arccos\!\Bigl(\sum_{m \in \mathcal{M}_n} \sqrt{p(m)\, q(m)}\Bigr).
$$

*Proof.* Via $\phi_n$, this is $2$ times the great-circle distance between $\sqrt{p}$ and
$\sqrt{q}$ on the unit sphere, which equals $2\arccos\langle \sqrt{p}, \sqrt{q}\rangle$. The
factor $2$ comes from the scaling $\phi_n^* g_{\mathrm{round}} = \tfrac{1}{4} g^{\mathrm{FR}}$
(length is scaled by $\tfrac{1}{2}$, so geodesic distance is scaled by $2$). $\checkmark$
