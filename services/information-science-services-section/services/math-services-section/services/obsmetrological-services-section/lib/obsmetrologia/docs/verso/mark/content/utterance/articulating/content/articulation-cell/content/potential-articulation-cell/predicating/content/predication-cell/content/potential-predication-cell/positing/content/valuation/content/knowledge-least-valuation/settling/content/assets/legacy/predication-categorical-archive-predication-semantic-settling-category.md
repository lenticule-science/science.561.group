---
type: definition
class: category
symbol: "\\mathbf{MS}"
depends-on: [predication-settling, modeling-morphism, truth-order, predication-fiber-algebra]
see-also: [predication-settling-category, modeling-preorder-independence]
---

# Semantic settling category

The category $\mathbf{MS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are [predication settlings](predication-settling.md) over fixed parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are [modeling morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/modeling-morphism.md). A morphism $v \models v'$ exists iff $v_\tau(p)(s, o) \leq_t v'_\tau(p)(s, o)$ for every $p$, $\tau$, and cell $(s, o)$, determined entirely by the pointwise [truth order](../../../../../../../pre-bilattice/content/truth-order/truth-order.md). Hom-sets are singletons or empty.

## Completeness

$\mathbf{MS}$ has all small limits and colimits, computed pointwise. The pointwise $\vee_t$-join (respectively $\wedge_t$-meet) of a small family of predication settlings is again a predication settling: each $A_p = \mathbf{L}^{\bowtie\, E \times E}$ is a complete lattice in $\leq_t$ when $\mathbf{L}$ is a complete residuated lattice (the $\leq_t$ order on $\mathbf{L}^\bowtie$ is isomorphic to the product order on $\mathbf{L} \times \mathbf{L}^{\mathrm{op}}$, which is complete whenever $\mathbf{L}$ is), and the [knowledge-order monotonicity](teaching/explanations/settling-monotonicity.md) condition is preserved by the pointwise $\leq_t$-join. Concretely: in $\mathbf{L}^\bowtie$, the $\leq_t$-join is $\langle a_1, a_2 \rangle \vee_t \langle b_1, b_2 \rangle = \langle a_1 \vee b_1, a_2 \wedge b_2 \rangle$, and $\leq_k$ is coordinate-wise. If $v_\tau(p) \leq_k v_{\tau+1}(p)$ and $v'_\tau(p) \leq_k v'_{\tau+1}(p)$ hold for all $p$ and $\tau$, then both coordinates of the join are monotone in $\tau$: the first by monotonicity of $\vee$ in $\mathbf{L}$, the second by monotonicity of $\wedge$ in $\mathbf{L}$.

The **initial object** is the all-$\mathbf{f}$ settling $v_\mathbf{f}$: since $\mathbf{f} = \langle 0, 1 \rangle$ is the $\leq_t$-minimum of $\mathbf{L}^\bowtie$ (as $\langle 0, 1 \rangle \leq_t \langle a, b \rangle$ iff $0 \leq a$ (always) and $b \leq 1$ (always)), every settling is reachable from $v_\mathbf{f}$ by a modeling morphism.

The **terminal object** is the all-$\mathbf{t}$ settling $v_\mathbf{t}$: since $\mathbf{t} = \langle 1, 0 \rangle$ is the $\leq_t$-maximum (as $\langle a, b \rangle \leq_t \langle 1, 0 \rangle$ iff $a \leq 1$ (always) and $0 \leq b$ (always)), every settling admits a modeling morphism into $v_\mathbf{t}$.

## Caveat: not the moduli-level morphism

Modeling morphisms are strictly weaker than [settling-morphisms](../morphisms/settling-morphism.md), which demand state equality with an ordinal shift and [settling endofunctor](../morphisms/settling-endofunctor.md) commutation. The semantic preorder $\mathbf{MS}$ is the right setting for truth-order-based completeness results and for characterizing [predication models](predication-model.md); it is not the setting for the regime classification or MLD equivalence, which live in the 2-category of settling-morphisms. See [equivalence hierarchy](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/equivalence-hierarchy.md) for the latter.

## Relation to the epistemic settling category

The [epistemic settling category](predication-settling-category.md) $\mathbf{PS}$ uses $\leq_k$ in place of $\leq_t$. The two categories share the same objects but have independent morphism classes. Neither is a subcategory of the other — the content of the [modeling-preorder independence theorem](../theorems/modeling-preorder-independence.md). The respective initial objects ($v_\mathbf{f}$ for $\mathbf{MS}$, the all-$\bot$ settling for $\mathbf{PS}$) are also distinct: $v_\mathbf{f}$ is the most "falsely committed" settling; $v_\bot$ is the most "uninformed" settling.
