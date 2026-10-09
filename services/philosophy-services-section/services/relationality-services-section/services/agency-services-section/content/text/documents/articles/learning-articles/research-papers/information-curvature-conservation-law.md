---
title: "Information-Curvature Conservation Law"
type: "paper"
date-created: 2025-10-11
description: This paper shows that the Fisher-information geometry underlying divergence minimization across coupled systems obeys a curvature conservation law.
---

## Abstract

This paper shows that the Fisher-information geometry underlying divergence minimization across coupled systems obeys a curvature conservation law. For any collection of informational manifolds related by mutual-information-preserving maps, the sum of their Ricci curvatures equals the Laplacian of the total stability functional. This extends the asymmetric stability framework of *Information-Theoretic Stability as Reward Function* to the general multi-system case, establishing a geometric constraint linking local adaptation dynamics to global invariants.

## 1. Introduction

Information geometry relates the curvature of probability manifolds to statistical inference (Amari 2016). Systems that minimize divergence between successive distributions trace geodesics under the Fisher metric. The stability functional

Rs(t)=−1δt DKL(pt+δ∣∣pt),
R_s(t) = -\frac{1}{\delta t}\, D_{\mathrm{KL}}(p_{t+\delta}||p_t),

defined in *Information-Theoretic Stability as Reward Function* as the rate at which a system couples to its reference, describes local divergence minimization. Here we show that when multiple such systems are coupled through mutual information, the Ricci curvature of their respective Fisher manifolds satisfies a conservation law linking geometry and stability.

## 2. Preliminaries

### 2.1 Informational Manifolds

Let each system $i$ be represented by a Riemannian manifold (Pi,g(i))(\mathcal{P}_i, g^{(i)}), where g(i)g^{(i)} is the Fisher-Rao metric, and each pi(x,t)p_i(x,t) is smooth with finite entropy Hi(t)H_i(t):

gab(i)=Epi ⁣[∂alog⁡pi ∂blog⁡pi]
g^{(i)}_{ab} = \mathbb{E}_{p_i}\!\left[\partial_a \log p_i \, \partial_b \log p_i \right]

### 2.2 Coupling Maps

Two systems i,ji,j are **informationally coupled** if there exists a smooth map

Φij:(Pi,g(i))→(Pj,g(j))
\Phi_{ij}: (\mathcal{P}_i, g^{(i)}) \to (\mathcal{P}_j, g^{(j)})

satisfying

I(i;j)=I(Φij(pi);pj),
I(i;j) = I(\Phi_{ij}(p_i); p_j),

up to small curvature correction $\kappa_{ij}$.

## 3. Curvature-Stability Relation

### 3.1 Local Relation

For each manifold, the Ricci curvature satisfies
$$
\operatorname{Ric}(g^{(i)})_{ab}
= -,\nabla_a\nabla_b \log p_i(x,t)

- \mathcal{O}(\partial^2 D_{\mathrm{KL}}),
$$
so its scalar trace approximates the Laplacian of divergence along the manifold (Amari 2016; Ay et al. 2017).

### 3.2 Conservation Lemma

Let the total stability functional of $N$ coupled systems be

Rstot=∑i=1NRs(i).
R_s^{\mathrm{tot}} = \sum_{i=1}^N R_s^{(i)}.

Assuming bounded entropy and differentiable couplings $\Phi_{ij}$, the following holds:

∑i=1NRic⁡(g(i))=∇2Rstot.
\boxed{
\sum_{i=1}^N \operatorname{Ric}(g^{(i)}) = \nabla^2 R_s^{\mathrm{tot}}.
}

**Proof sketch.** Starting from the Bianchi identity $\nabla^\mu G_{\mu\nu}=0$ on each manifold and substituting the Fisher metric&rsquo;s expression for the information potential ψi=−log⁡pi\psi_i = -\log p_i, we obtain

∇2ψi=Tr⁡Ric⁡(g(i)).
\nabla^2 \psi_i = \operatorname{Tr}\operatorname{Ric}(g^{(i)}).

Since Rs(i)=−∂tDKL(pt+δ∣∣pt)R_s^{(i)} = -\partial_t D_{\mathrm{KL}}(p_{t+\delta}||p_t) depends on $\nabla^2\psi_i$ through ∂tgab(i)\partial_t g^{(i)}_{ab}, summing over coupled manifolds and using $\sum_i\nabla^\mu G_{\mu\nu}^{(i)}=0$ yields the stated conservation law.

## 4. Consequences

- **Geometric invariance.** Divergence minimization across coupled information manifolds preserves the total informational curvature.

- **Bounded stability.** Local increases in Rs(i)R_s^{(i)} require compensating decreases in curvature elsewhere, ensuring finite total informational variance.

- **Model scope.** The result applies to any differentiable system modeled by Fisher geometry—statistical, algorithmic, biological, or physical—without further assumption.

## 5. Conclusion

Under general information-geometric conditions, the total Ricci curvature of coupled Fisher manifolds equals the Laplacian of the joint stability functional. This curvature conservation principle provides a minimal geometric constraint governing divergence-minimizing dynamics across heterogeneous systems, linking local learning behavior to a global invariant of informational geometry.

## References

- Amari, S. (2016). *Information Geometry and Its Applications*. Springer.

- Ay, N., Jost, J., Lê, H. V., & Schwachhöfer, L. (2017). *Information Geometry*. Springer.

## References

[amari2016]
S. Amari.
(2016).
Information Geometry and Its Applications.
*Springer*.

[ay2017]
N. Ay, J. Jost, H. V. Lê, L. Schwachhöfer.
(2017).
Information Geometry.
*Springer*.
