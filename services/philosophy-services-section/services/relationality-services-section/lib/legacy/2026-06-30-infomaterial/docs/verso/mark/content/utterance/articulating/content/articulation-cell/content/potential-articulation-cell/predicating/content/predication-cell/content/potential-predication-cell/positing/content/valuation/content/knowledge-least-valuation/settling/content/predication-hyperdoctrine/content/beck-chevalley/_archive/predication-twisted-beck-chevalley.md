---
type: theorem
status: proved
depends-on: [gauge-connection, gauge-twisted-reindexing, gauge-twisted-reindexing-graded-homomorphism, beck-chevalley-commutation-on-predication-bilattices, predication-hyperdoctrine, predication-fibration, predicate-generator-pullback-closure, four-bilattice, negation, conflation]
see-also: [beck-chevalley-commutation-on-predication-bilattices, gauge-connection, gauge-twisted-reindexing, equivariant-cohomology-decomposition, curvature-from-pseudo-functorial-connections]
---

# $\leq_k$-axis twisted Beck–Chevalley

The Beck–Chevalley axiom of the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) extends to [gauge-twisted reindexings](../morphisms/gauge-twisted-reindexing.md) along gauge connections valued in the $\leq_k$-preserving subgroup $K_4^{\,k} = \{e, {\sim}\}$. The naive $\leq_t$-axis dualization with $K_4^{\,t} = \{e, -\}$ fails: [predicate-specialization](../morphisms/predicate-specialization.md) reindexing extends by $\bot$ uniformly, and $-(\bot) = \top \neq \bot$, so $-$ does not commute with cellwise reindexing on outside-support cells. Both this $\leq_t$ obstruction and the full $K_4$ obstruction (order reversal) are tracked in [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md).

## Statement

**Theorem ($\leq_k$-axis twisted Beck–Chevalley).** *Let $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ be a predication hyperdoctrine and $A : \mathcal{C} \to BK_4^{\,k}$ a gauge connection valued in $K_4^{\,k} = \{e, {\sim}\}$. For every pullback square in $\mathcal{C}$*

$$\begin{array}{ccc} P & \xrightarrow{p_A} & A \\ p_B \downarrow & & \downarrow f \\ B & \xrightarrow{g} & C \end{array}$$

*and every $\phi \in \mathcal{E}_B$, the canonical $\leq_k$-Beck–Chevalley map*

$$\exists_{p_A,A}^{k}\big( (p_B)^*_A \phi \big) \;\longrightarrow\; f^*_A \big( \exists_{g,A}^{k} \phi \big)$$

*is an isomorphism in $\mathcal{E}_A$, where $\exists_{f,A}^{k}$ denotes the left adjoint of the twisted reindexing $f^*_A$ in the $\leq_k$-enrichment. The dual statement for $\forall_A^k$ also holds. Explicitly,*

$$\exists_{f,A}^{k} \;=\; \exists_{f}^{k} \cdot A(f), \qquad \forall_{f,A}^{k} \;=\; \forall_{f}^{k} \cdot A(f),$$

*where $A(f) \cdot$ acts as the involution $A(f) \in \{e, {\sim}\}$ on the source fiber.*

## Proof

The argument has three steps: identify the twisted $\leq_k$-adjoints, reduce twisted-BC to untwisted-BC plus a $K_4^{\,k}$-cancellation, and verify the cancellation using functoriality of $A$ and $\sim(\bot) = \bot$.

**Part I: twisted $\leq_k$-adjoints.** For $f : q \to p$ with $A(f) = g \in K_4^{\,k} = \{e, {\sim}\}$, the twisted reindexing is $f^*_A = g \cdot f^*$. Both elements of $K_4^{\,k}$ preserve $\leq_k$ (id trivially; ${\sim}$ by definition of [negation](../morphisms/negation.md)). Hence $g$ acts as a $\leq_k$-monotone involution on each fiber, so $g \dashv g$ in the $\leq_k$-enrichment (an order-preserving involution is its own left and right adjoint), and adjoints compose:

$$\exists_{f,A}^{k} \;:=\; \exists_f^k \cdot g \;\dashv\; g \cdot f^* \;=\; f^*_A \;\dashv\; \forall_f^k \cdot g \;=:\; \forall_{f,A}^{k}.$$

(Using $g^{-1} = g$ for involutions.)

**Part II: reduce twisted-BC to untwisted-BC.** Substitute the formulae from Part I into the canonical map. Writing $g_f := A(f), g_g := A(g), g_{p_A} := A(p_A), g_{p_B} := A(p_B)$:

$$\exists_{p_A,A}^{k} \big((p_B)^*_A \phi\big) \;=\; \exists_{p_A}^{k} \cdot g_{p_A} \cdot g_{p_B} \cdot p_B^*(\phi).$$

By functoriality of $A$ on the pullback square — both composites $f \circ p_B$ and $g \circ p_A$ equal the diagonal $P \to C$, so $g_f g_{p_B} = g_g g_{p_A}$ in $K_4^{\,k}$, an abelian group — we obtain $g_{p_A} g_{p_B} = g_g^{-1} g_f = g_g g_f$ (using involutions). Substituting:

$$\exists_{p_A,A}^{k} \big((p_B)^*_A \phi\big) \;=\; \exists_{p_A}^{k} \cdot g_g \cdot g_f \cdot p_B^*(\phi).$$

On the other side,

$$f^*_A\big( \exists_{g,A}^{k} \phi \big) \;=\; g_f \cdot f^* \cdot \exists_g^k \cdot g_g (\phi).$$

The untwisted Beck–Chevalley iso ([beck-chevalley-commutation-on-predication-bilattices](beck-chevalley-commutation-on-predication-bilattices.md)) gives $\exists_{p_A}^k \cdot p_B^* \xrightarrow{\cong} f^* \cdot \exists_g^k$. Inserting this and using the commutation in Part III, both sides equal $g_f \cdot \exists_{p_A}^k \cdot p_B^* \cdot g_g(\phi)$, establishing the iso.

**Part III: $K_4^{\,k}$ commutes with cellwise reindexing.** We need $g \cdot f^* = f^* \cdot g$ on fibers when $g \in K_4^{\,k}$ and $f$ is a generator of $\mathcal{C}$. The reindexing $f^*$ acts cellwise via an equivariant partial function $\phi_f : E \times E \rightharpoonup E \times E$ (axiom (A2) of the [predication fibration](../objects/predication-fibration.md)); $g$ acts cellwise by the bilattice involution $g : \mathbf{FOUR} \to \mathbf{FOUR}$. The two operations are on orthogonal data:

$$(g \cdot f^*)(v)(s, o) \;=\; g\big( v(\phi_f(s, o)) \big) \;=\; (f^* \cdot g)(v)(s, o).$$

The only non-trivial check is what happens on cells outside the support of $\phi_f$, where [predicate-specialization](../morphisms/predicate-specialization.md) extends by $\bot$:

$$f^*(v)(s, o) = \bot \quad \text{for } (s, o) \notin \mathrm{dom}(q),$$

so $g(f^*(v)(s, o)) = g(\bot)$. Both elements of $K_4^{\,k}$ fix $\bot$: id trivially; ${\sim}$ by [internal-z2-gauge](teaching/explanations/internal-z2-gauge.md) ($\sim$ fixes $\bot, \top$ and swaps $\mathbf{t} \leftrightarrow \mathbf{f}$). Hence $g(\bot) = \bot$ for all $g \in K_4^{\,k}$, and the extension-by-$\bot$ commutes with the gauge action.

The same calculation works for [predicate-converse](../morphisms/predicate-converse.md) (where $\phi_f$ swaps coordinates with no outside-support extension), and for [predicate-subject-projection](../morphisms/predicate-subject-projection.md), [predicate-object-projection](../morphisms/predicate-object-projection.md) (where $\phi_f$ folds along an axis and $\exists_f^k$ is given by row/column $\vee_k$, which $\sim$ preserves since $\sim$ is $\leq_k$-monotone). Hence the $K_4^{\,k}$-action and cellwise reindexings commute on every generator, and by composition on every morphism of $\mathcal{C}$. $\square$

## Why $\leq_k$-only

The proof depends on two facts about $K_4^{\,k} = \{e, {\sim}\}$:

1. **Order preservation.** Both elements are $\leq_k$-monotone, so they admit themselves as $\leq_k$-self-adjoints (Part I).
2. **Bottom preservation.** Both elements fix $\bot$, so they commute with the cellwise extension-by-$\bot$ used by $\exists_f^k$ on [specialization](../morphisms/predicate-specialization.md) (Part III).

The naive $\leq_t$-dualization fails on point 2. The $\leq_t$-preserving subgroup is $K_4^{\,t} = \{e, -\}$, which fixes $\mathbf{f}$ (the $\leq_t$-bottom of $\mathbf{FOUR}$). One might hope this lets the symmetric argument go through. It does not: the predication-fibration cleavage, per [predicate-specialization](../morphisms/predicate-specialization.md), defines

$$f^*(v)(s, o) \;=\; v(s, o) \text{ if } (s,o) \in \mathrm{dom}(q),\quad \bot \text{ otherwise.}$$

The extension is by $\bot$ uniformly — it does not switch to $\mathbf{f}$ when one passes to $\leq_t$-quantifiers. Under a $-$-twist, the outside-support value becomes $-(\bot) = \top \neq \bot$, so $- \cdot f^* \neq f^* \cdot -$ on cells outside $\mathrm{dom}(q)$. The Part III commutation fails for $g = -$, and the BC reduction in Part II then fails too. A symmetric $\leq_t$-axis theorem would require either a different cleavage convention (extending by $\mathbf{f}$ on the $\leq_t$ side) or a precise account of how the $-$-twist transports outside-support values; neither is in the current corpus.

For the full $K_4$, the order-reversing elements $\{-, {\sim}\circ-\}$ break the argument at *both* points:

1. **Adjoints don't exist in the same enrichment.** $-$ is antitone in $\leq_k$, so $- : (\mathcal{E}_q, \leq_k) \to (\mathcal{E}_q, \leq_k)$ is not a functor in the $\leq_k$-enriched sense; it is an isomorphism $(\mathcal{E}_q, \leq_k) \to (\mathcal{E}_q, \leq_k^{\mathrm{op}})$. The natural "adjoint" of $- \cdot f^*$ lives in the opposite order, corresponding to a quantifier swap $\exists \leftrightarrow \forall$.

2. **Extension values move.** $-(\bot) = \top$ converts the extension-by-$\bot$ used by $\exists_f^k$ into extension-by-$\top$, which corresponds to $\forall_f^k$ rather than $\exists_f^k$. The Part III commutation fails for $g$ involving $-$ at exactly this step.

A coherent "full-$K_4$ twisted Beck–Chevalley" — and a coherent "$\leq_t$-axis twisted Beck–Chevalley" with $K_4^{\,t}$ — would both require additional structural choices: gauging the cleavage extension convention and the quantifier polarities along with the gauge element. This is left open; see [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md).

## Discussion

The $\leq_k$-axis theorem says: along the $\leq_k$-axis, gauge-twisting by $K_4^{\,k} = \{e, {\sim}\}$ preserves all $\leq_k$-hyperdoctrinal structure (B1k, B2k, B3-for-$\leq_k$). The twisted reindexings define a new cleavage of the same total category $\mathcal{E}$, and the resulting cloven fibration is itself a "$\leq_k$-half" predication hyperdoctrine.

The corpus's existing [internal-z2-gauge](teaching/explanations/internal-z2-gauge.md) — the $\mathbb{Z}/2$ symmetry generated by negation — is exactly the $K_4^{\,k}$ case as a global symmetry of a single fiber. The present theorem upgrades that global symmetry to a *gauged* one: the choice of $\sim$-frame can vary over $\mathcal{C}$ subject only to functoriality.

The proper full-$K_4$ twist that gauges both axes simultaneously (with order-gauging and quantifier-polarity-swap) is the substantive next theorem: it would relate the twisted [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md) along all four characters of $K_4$, with each isotypic sector tensored by the rank-1 local system whose monodromy is the corresponding character of the holonomy. The present $\leq_k$-axis theorem provides the kinematics for the order-preserving half along one axis; the rest awaits the cleavage-and-quantifier-gauging extension.
