---
id: riemannian-moduli
name: RiemannianModuli
description: "Analytic and Algebraic Topology of Locally Euclidean Metrizations of Infinitely Differentiable Riemannian Manifold"
---

### Theorem — Riemannian Moduli {#riemannian-moduli}

The depth tower of moduli spaces is a tower of infinitely differentiable locally Euclidean
Riemannian manifolds. The depth-restriction Markov kernels are Riemannian submersions. The
analytic topology induced by the Fischer-Rao metric and the algebraic topology of the depth
filtration cohere.

#### Theorem — Depth-Restriction as Riemannian Submersion {#thm-depth-riemannian-submersion}

Under the essential surjectivity hypothesis of §fischer-rao-metric, the Markov kernel
$$
K_n : \mathcal{P}^\circ(\mathcal{M}_{n+1}) \longrightarrow \mathcal{P}^\circ(\mathcal{M}_n),
\qquad K_n(q)(m) := \sum_{m':\, \rho_n(m')=m} q(m'),
$$
is a Riemannian submersion in the Fischer-Rao metric.

*Proof.* By §fiber-norm-map, $\phi_n \circ K_n = \widetilde{K}_n \circ \phi_{n+1}$, where
$\widetilde{K}_n$ is the fiber-norm map and $\phi_n$, $\phi_{n+1}$ are the square-root
isometric embeddings (§smooth-moduli). By §thm-fiber-norm-submersion, $\widetilde{K}_n$ is
a Riemannian submersion from $S^{|\mathcal{M}_{n+1}|-1}$ to $S^{|\mathcal{M}_n|-1}$. Since
$\phi_n$ and $\phi_{n+1}$ are isometric embeddings, the composition pulls back the
Riemannian submersion property to $K_n$ in the Fischer-Rao metric. $\square$

#### Corollary — The Riemannian Depth Tower {#cor-riemannian-tower}

The depth tower
$$
\mathcal{P}^\circ(\mathcal{M}_0) \xleftarrow{K_0} \mathcal{P}^\circ(\mathcal{M}_1)
\xleftarrow{K_1} \mathcal{P}^\circ(\mathcal{M}_2) \xleftarrow{K_2} \cdots
$$
is a tower of infinitely differentiable Riemannian manifolds connected by Riemannian
submersions. The depth-restriction maps are simultaneously:

- **Algebraically natural**: they arise from the sheaf structure of the depth filtration
  (§depth-filtration) via the Markov kernel construction (§fischer-rao-metric).
- **Analytically coherent**: they are Riemannian submersions, preserving geodesic structure
  in the sense that horizontal geodesics in $\mathcal{P}^\circ(\mathcal{M}_{n+1})$ project
  to geodesics in $\mathcal{P}^\circ(\mathcal{M}_n)$.

#### Corollary — Geometric Rephrasing of Fischer-Rao Convergence {#cor-geometric-convergence}

The Fischer-Rao convergence conjecture (§fischer-rao-convergence) — that the depth tower converges
iff the sequence of distributions $p_n$ follows a Fischer-Rao geodesic — can be rephrased
purely in terms of the Riemannian structure: convergence of the depth tower corresponds to
the trajectory $(p_n)$ being a **horizontal lift** of a geodesic in
$\mathcal{P}^\circ(\mathcal{M}_0)$ along the tower of Riemannian submersions.
