---
type: theorem
status: proved
closes: settling-moduli-prestack
depends-on: [settling-moduli-prestack, parameter-base-topology, priestley-cover-topology-subcanonical, settling-moduli-prestack-property, predication-fiber-algebra, twist-product, settling-automorphism-1-truncation]
---

# Settling moduli stack theorem

The [settling moduli prestack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-prestack.md) $\mathscr{M}^{\mathrm{pre}}$ is a 1-stack on $(\mathbf{B}, J_\mathbf{B})$. Stackification is trivial: $\mathscr{M} := \mathscr{M}^{\mathrm{pre}}$ already satisfies effective descent.

Equivalently: $\mathscr{M}$ is a category fibered in 1-groupoids on the [parameter base category](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/parameter-base-category.md), satisfying the effective descent condition for the [parameter base topology](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/terms/parameter-base-topology.md).

## The structural idea

One fact does all the work:

> The [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathbf{L}^{\bowtie E \times E}$ is a sheaf of equational algebras on $(\mathbf{B}, J_\mathbf{B})$, and all predication settling structure is equationally specified in it.

Equational statements in a sheaf of algebras descend by the sheaf condition. Hence every predication settling component — fiber algebra, fibration reindexing, hyperdoctrinal structure, closure operator, increment sequence, settling coalgebra — descends along covers in $J_\mathbf{B}$.

## Proof

By Vistoli Definition 4.6, $\mathscr{M}^{\mathrm{pre}}$ is a stack iff (i) it is a prestack and (ii) it satisfies effective descent. (i) is the [settling moduli prestack property](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-prestack-property.md). For (ii) we trace through each of the seven structural components of a predication settling.

**(D1) Residuated-lattice descent.** $\mathbf{L}$ descends by Beck monadicity for equational algebras: residuated lattices form a finitary equational variety, and the [Priestley-dual cover topology](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/priestley-dual-cover-topology/priestley-dual-cover-topology.md) is subcanonical ([Priestley-cover topology subcanonical](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/references/priestley-cover-topology-subcanonical.md)).

**(D2) Fiber-algebra descent.** The pointwise [twist-product](../../../../../../../residuated-lattice/content/twist-product/twist-product.md) functor $\mathbf{L} \mapsto \mathbf{L}^{\bowtie E \times E}$ is finitary and preserves limits, hence preserves equalizers. So the fiber algebra descends from $\mathbf{L}$ via the equalizer condition that defines covers in $J_{\mathrm{ResLat}}$.

**(D3) Fibration descent.** A cloven [predication fibration](../objects/predication-fibration.md) is determined by (i) fiber algebras and (ii) the four-generator reindexing. (i) descends by D2. (ii) is equationally specified by the cellwise four-generator action ([predication fiber functor](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-functor.md)) — a specific cellwise reindexing function on $E \times E$. By sheaf-descent of the fiber algebra, the reindexing functors glue.

**(D4) Hyperdoctrinal-structure descent.** Each of (B1k), (B1t), (B2k), (B2t), (B3), (B4) of the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) definition is an equational or universal-property statement on the fiber algebra. For example (B1k) — adjoint quantifiers $\exists_f^k \dashv f^* \dashv \forall_f^k$ — is the cellwise biconditional $\exists_f^k(\phi)(s, o) \leq_k \alpha(s, o) \iff \phi(g(s, o)) \leq_k \alpha(s, o)$ in $\mathbf{L}^\bowtie$. Equational statements in a sheaf of algebras descend.

**(D5) Closure-operator descent.** Each [closure operator](../morphisms/closure-operator.md) condition (monotone, inflationary, idempotent, $\mathcal{C}$-natural) is cellwise in the fiber algebra. The [closure 2-monad](../morphisms/closure-2-monad.md)'s lax-idempotent refinement reduces to strict idempotence in the thin-fiber setting (by [settling-automorphism 1-truncation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md): fibers are thin posets). All conditions descend.

**(D6) Increment-sequence descent.** Each [increment](../objects/increment-sequence.md) $u_\tau(q) \in A_q$ is a point in the fiber-algebra sheaf; compatible points on a cover glue uniquely. The $\lambda$-indexing is preserved by the trivial topology on $\mathbf{Ord}$.

**(D7) Settling-coalgebra descent.** The settling orbit $v_\tau(q)(s, o) \in A_q$ descends cellwise as in D6. [Settling monotonicity](../concepts/settling-monotonicity.md) $v_\sigma \leq_k v_\tau$ is a cellwise $\leq_k$-inequality in $\mathbf{L}^\bowtie$ that descends. The [settling endofunctor](../morphisms/settling-endofunctor.md) $F_U$ descends because closure (D5), increment (D6), and pointwise join (D2) all descend.

Combining D1–D7: the seven components assemble into a unique predication settling $v \in \mathrm{KP}(B)$, hence (after the visible quotient) a unique $[v] \in \mathrm{KP}^{\mathrm{vis}}(B) = \mathscr{M}^{\mathrm{pre}}(B)$. The base-change to each $B_i$ recovers the local data by construction. Uniqueness at each cellwise level gives uniqueness of the global object up to unique iso. $\square$

## What property-likeness does — and does not — supply

The Kelly–Lack property-likeness theorems for [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) structure, [closure-algebra structure](closure-2-monad-lax-idempotence.md), and [$\mathbb{N}$-pseudo-coalgebra structure](emmenegger-fibration-comonad.md) do **not** drive the descent. They are *fiber-level uniqueness* statements — given the underlying [predication fibration](../objects/predication-fibration.md), the additional hyperdoctrinal and settling-coalgebra structures are unique if they exist — not propagation statements.

What property-likeness gives is *post-hoc rigidity*: given that the descent succeeds in producing a glued fibration, the Kelly–Lack theorems guarantee the hyperdoctrinal/closure structures on it are unique. The descent itself runs on sheaf-theoretic equational descent of the fiber algebra; property-likeness merely ensures the result is well-defined.

## 1-stack, not 2-stack

By [settling-automorphism 1-truncation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md), all 2-cells in the fiber groupoids are identities, so the moduli is a 1-stack. The lax-idempotent KZ apparatus of the [closure 2-monad](../morphisms/closure-2-monad.md) and [temporal 2-category](../../temporal-2-category/temporal-2-category.md) does not introduce moduli-level 2-cells.

## Consequences

- The [visible settling fiber groupoid](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/visible-settling-fiber-groupoid.md) at each base assembles into the visible moduli stack $\mathscr{M}^{\mathrm{vis}}$ — also a 1-stack on $(\mathbf{B}, J_\mathbf{B})$.
- The [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) is a morphism of 1-stacks ([classifying morphism is a stack morphism](classifying-morphism-is-stack-morphism.md)).
- The moduli is a *genuine* stack — not a discrete groupoid — because the [Priestley-dual cover topology](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/priestley-dual-cover-topology/priestley-dual-cover-topology.md) has substantive non-trivial covers.
