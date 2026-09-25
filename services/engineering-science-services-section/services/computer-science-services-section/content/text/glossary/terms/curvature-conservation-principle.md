---
id: ce55d5cb-98b0-42db-909d-f136d5864bda
node-relations: "((field . mathematical physics) (instantiates . principle) (field . information theory) (field . general relativity) (field . quantum cosmology) (domain . Fisher-Rao manifold) (deriving . Theorem of Information-Theoretic Stability as Reward Function))"
title: Curvature Conservation Principle
date-created: 2025-10-11
---

# Abstract

We show that the Fisher–information geometry underlying divergence minimization obeys a curvature conservation law across coupled systems. For any collection of informational manifolds related by mutual-information–preserving maps, the sum of their Ricci curvatures equals the Laplacian of the total stability functional previously defined in Senn (2025a). This result, derived under standard smoothness and bounded-entropy assumptions, establishes a general constraint linking local learning dynamics to global geometric invariants without requiring physical or semantic interpretation.

# 1. Introduction {#introduction}

Information geometry relates the curvature of probability manifolds to statistical inference (Amari 2016). Systems that minimize divergence between successive distributions trace geodesics under the Fisher metric. Senn (2025a) defined a **stability functional** $$
R_s(t) = -\frac{1}{\delta t}\, D_{\mathrm{KL}}(p_{t+\delta}||p_t),
$$ whose maximization describes local divergence minimization. Here we show that when multiple such systems are coupled through mutual information, the Ricci curvature of their respective Fisher manifolds satisfies a conservation law linking geometry and stability.

# 2. Preliminaries {#preliminaries}

## 2.1 Informational Manifolds {#informational-manifolds}

Let each system $i$ be represented by a Riemannian manifold $(\mathcal{P}_i, g^{(i)})$, where $g^{(i)}$ is the Fisher–Rao metric $$
g^{(i)}_{ab} = \mathbb{E}_{p_i}\!\left[\partial_a \log p_i \, \partial_b \log p_i \right].
$$ Assume each $p_i(x,t)$ is smooth with finite entropy $H_i(t)$.

## 2.2 Coupling Maps {#coupling-maps}

Two systems $i,j$ are **informationally coupled** if there exists a smooth map $$
\Phi_{ij}: (\mathcal{P}_i, g^{(i)}) \to (\mathcal{P}_j, g^{(j)})
$$ satisfying $$
I(i;j) = I(\Phi_{ij}(p_i); p_j),
$$ up to small curvature correction $\kappa_{ij}$.

# 3. Curvature–Stability Relation {#curvaturestability-relation}

## 3.1 Local Relation {#local-relation}

For each manifold, the Ricci curvature satisfies $$
\operatorname{Ric}(g^{(i)})_{ab}
  = -\,\nabla_a\nabla_b \log p_i(x,t)
  + \mathcal{O}(\partial^2 D_{\mathrm{KL}}),
$$ so its scalar trace approximates the Laplacian of divergence along the manifold (Amari 2016; Ay et al. 2017).

## 3.2 Conservation Lemma {#conservation-lemma}

Let the total stability functional of $N$ coupled systems be $$
R_s^{\mathrm{tot}} = \sum_{i=1}^N R_s^{(i)}.
$$ Assuming bounded entropy and differentiable couplings $\Phi_{ij}$, the following holds: $$
\boxed{
\sum_{i=1}^N \operatorname{Ric}(g^{(i)}) = \nabla^2 R_s^{\mathrm{tot}}.
}
$$ **Proof sketch.** Starting from the Bianchi identity $\nabla^\mu G_{\mu\nu}=0$ on each manifold and substituting the Fisher metric’s expression for the information potential $\psi_i = -\log p_i$, we obtain $$
\nabla^2 \psi_i = \operatorname{Tr}\operatorname{Ric}(g^{(i)}).
$$ Since $R_s^{(i)} = -\partial_t D_{\mathrm{KL}}(p_{t+\delta}||p_t)$ depends on $\nabla^2\psi_i$ through $\partial_t g^{(i)}_{ab}$, summing over coupled manifolds and using $\sum_i\nabla^\mu G_{\mu\nu}^{(i)}=0$ yields the stated conservation law.

# 4. Consequences {#consequences}

1.  ****Geometric invariance.**** Divergence minimization across coupled information manifolds preserves the total informational curvature.
2.  ****Bounded stability.**** Local increases in $R_s^{(i)}$ require compensating decreases in curvature elsewhere, ensuring finite total informational variance.
3.  ****Model scope.**** The result applies to any differentiable system modeled by Fisher geometry—statistical, algorithmic, biological, or physical—without further assumption.

# 5. Conclusion {#conclusion}

Under general information-geometric conditions, the total Ricci curvature of coupled Fisher manifolds equals the Laplacian of the joint stability functional. This curvature conservation principle provides a minimal geometric constraint governing divergence-minimizing dynamics across heterogeneous systems, linking local learning behavior to a global invariant of informational geometry.

# References

- Amari, S. (2016). **Information Geometry and Its Applications.** Springer.
- Ay, N., Jost, J., Lê, H. V., & Schwachhöfer, L. (2017). **Information Geometry.** Springer.
- Senn, E. (2025a). **Information-Theoretic Stability as a Reward Function.** arXiv:math.IT.
