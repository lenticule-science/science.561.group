---
type: morphism
class: morphism
symbol: "\\iota_{S,T}"
depends-on: [subtheory-settled-state, predication-settling-base-morphism, predication-theory, closure-restriction, predicate-category]
see-also: [subtheory, researching, idealization-morphism]
---

# Subtheory inclusion

Let $S = (\mathbf{L}, \mathcal{C}^S, E, \mathrm{Cl}^S)$ be a [subtheory](../objects/subtheory.md) of $T = (\mathbf{L}, \mathcal{C}^T, E, \mathrm{Cl}^T)$ via type embedding $\pi : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$, with $\mathrm{Cl}^S = \pi^*(\mathrm{Cl}^T)$. The **subtheory inclusion** $\iota_{S,T} : S \hookrightarrow T$ is the [predication-settling base-morphism](predication-settling-base-morphism.md) with base components

$$(\ell,\, e,\, \pi,\, \phi_\lambda) \;=\; (\mathrm{id}_\mathbf{L},\; \mathrm{id}_E,\; \pi,\; \mathrm{id}_\lambda),$$

and, for each $p \in \mathcal{C}^S$ and each step $\tau \leq \tau^*$, the fiber-algebra map

$$\phi_{p,\tau} \;:=\; \mathrm{id}_{A_p} : A^S_p \;\xrightarrow{\;=\;}\; A^T_{\pi(p)}.$$

This is the identity, since $A^S_p = \mathbf{L}^{\bowtie\, E \times E} = A^T_{\pi(p)}$.

The [subtheory settled-state theorem](../theorems/subtheory-settled-state.md) guarantees that the predication-settling base-morphism condition holds, and as an equality rather than merely as $\leq_k$:

$$\phi_{p,\tau}(v^S_\tau(p)) \;=\; v^S_\tau(p) \;=\; v^T_\tau(\pi(p)) \;=\; v^T_{\phi_\lambda(\tau)}(\pi(p)).$$

The middle equality is exactly the content of the subtheory settled-state theorem (proved by transfinite induction on $\tau$). The subtheory inclusion is therefore a predication-settling base-morphism that witnesses the equality of the two theories at every fiber and step, not only at the settled state.

## Faithfulness and fiber-isomorphism

The subtheory inclusion is faithful at the predicate-category level — $\pi$ is faithful by hypothesis — and is an isomorphism at every individual fiber: $\phi_{p,\tau} = \mathrm{id}$ is invertible. It embeds $S$ into $T$ without distortion.

## Contrast with existing morphism classes

| Morphism | Source → Target | Fiber condition | Closure condition |
|---|---|---|---|
| [Preorder morphism](predication-settling-preorder-morphism.md) | same base | $v_\tau(p) \leq_k v'_\tau(p)$ | none |
| [Settling morphism](settling-morphism.md) | same base | $v_\tau(p) = v'_{\tau+\delta}(p)$ | endofunctor commutation |
| [Base morphism](predication-settling-base-morphism.md) | cross-base | $\phi_{p,\tau}(v_\tau(p)) \leq_k v'_{\phi_\lambda(\tau)}(\pi(p))$ | none |
| [Researching morphism](researching.md) | cross-base ($\mathcal{C}^T \hookrightarrow \mathcal{C}^{T'}$) | $v^{T'}_\infty \geq_k v^T_\infty$ at settled state | none |
| **Subtheory inclusion** | cross-base ($\mathcal{C}^S \hookrightarrow \mathcal{C}^T$) | $v^S_\tau(p) = v^T_\tau(\pi(p))$ (equality) | $\mathrm{Cl}^S = \pi^*(\mathrm{Cl}^T)$ |

The subtheory inclusion is the only morphism class in the corpus that jointly requires (i) a type embedding on the predicate scope and (ii) the [closure restriction](teaching/explanations/closure-restriction.md) condition. It is the class of morphisms that witnesses the "sub-" relation in the category of predication theories.

## Induced structure on the category of predication theories

Subtheory inclusions compose: if $S \hookrightarrow T$ via $\pi_1 : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ and $T \hookrightarrow U$ via $\pi_2 : \mathcal{C}^T \hookrightarrow \mathcal{C}^U$, then the composite $\pi_2 \circ \pi_1 : \mathcal{C}^S \hookrightarrow \mathcal{C}^U$ is a type embedding and $(\pi_2 \circ \pi_1)^*(\mathrm{Cl}^U) = \pi_1^*(\pi_2^*(\mathrm{Cl}^U)) = \pi_1^*(\mathrm{Cl}^T) = \mathrm{Cl}^S$, so $S$ is a subtheory of $U$ and the composite $\iota_{T,U} \circ \iota_{S,T}$ is the subtheory inclusion $\iota_{S,U}$.
