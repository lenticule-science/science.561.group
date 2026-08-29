---
type: theorem
status: proved
depends-on: [theory-relative-ideal, resource-deficit, idealization-morphism, predication-settling-preorder-morphism, knowledge-order, predication-settling-category]
see-also: [improvement-automorphism-distinction, resource-quality-decomposition]
---

# Idealization morphism existence criterion

Let $v^R$ be a settling over $(\mathbf{L}, \mathcal{C}^R, E)$ and $v^R_{T,\infty}$ its [theory-relative ideal](teaching/explanations/theory-relative-ideal.md). A [preorder morphism](../morphisms/predication-settling-preorder-morphism.md) $\eta^T_R : v^R \to v^R_{T,\infty}$ in $\mathbf{PS}(\mathbf{L}, \mathcal{C}^R, E)$ exists if and only if

$$\mathrm{Ex}(v^R, T) = \mathrm{Co}(v^R, T) = \emptyset,$$

i.e., if and only if $v^R$ has no excessive cells and no contradicted cells relative to $T$.

## Proof

**($\Rightarrow$):** Suppose the morphism exists. By definition of $\mathbf{PS}$, existence requires $v^R(c) \leq_k v^R_{T,\infty}(c)$ for all $c$. If any cell $c$ were excessive, $v^R(c) >_k v^R_{T,\infty}(c)$, which is a strict $\leq_k$-ordering in the opposite direction — inconsistent with $v^R(c) \leq_k v^R_{T,\infty}(c)$. If any cell $c$ were contradicted, $v^R(c) \perp_k v^R_{T,\infty}(c)$ — neither $\leq_k$ nor $\geq_k$ — inconsistent with $v^R(c) \leq_k v^R_{T,\infty}(c)$. Hence no excessive or contradicted cells exist.

**($\Leftarrow$):** If $\mathrm{Ex} = \mathrm{Co} = \emptyset$, then every cell satisfies $v^R(c) \leq_k v^R_{T,\infty}(c)$ (either aligned or deficient). Pointwise $\leq_k$ is exactly the condition for a preorder morphism in $\mathbf{PS}$. $\square$

## Remark

The condition $\mathrm{Ex} = \mathrm{Co} = \emptyset$ is equivalent to: $v^R$ is theory-grounded (no excessive cells) AND theory-consistent (no contradicted cells). Theory-grounded means the resource makes no claims beyond the theory's settled ideal; theory-consistent means it makes no claims the theory actively contradicts. Together they say the resource is "below" the ideal in $\leq_k$, and the unique morphism to the ideal is exactly the [idealization morphism](../morphisms/idealization-morphism.md).

A resource that is theory-grounded and theory-consistent but not theory-complete ($\mathrm{De} \neq \emptyset$) can be improved — the idealization morphism exists and names the path. A resource that is theory-complete and theory-consistent ($\mathrm{De} = \mathrm{Co} = \emptyset$) but has excess ($\mathrm{Ex} \neq \emptyset$) sits ABOVE the theory ideal in some cells; the theory-relative ideal is not its improvement target but its minimum grounded core.
