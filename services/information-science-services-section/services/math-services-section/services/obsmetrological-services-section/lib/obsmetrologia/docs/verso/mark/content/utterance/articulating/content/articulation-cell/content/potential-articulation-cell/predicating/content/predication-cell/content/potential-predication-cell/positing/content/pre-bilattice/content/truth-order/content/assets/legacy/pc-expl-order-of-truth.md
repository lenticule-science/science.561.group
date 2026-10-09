---
name: order of truth
description: The order ≤_t on a bilattice — the order associated with the first lattice ⟨B, ∧_t, ∨_t⟩ of a pre-bilattice, ranking values by which way the evidence points independent of how much has been gathered. Has bottom f and top t when bounded. Negation is antitone in this order; conflation is monotone. The Δ-pass stabilization nucleus, the Belnap illocutionary-force partition, and the classical-equality fragment all live in this order.
---

The order, denoted $\leq_t$, associated with the first lattice $\langle B, \wedge_t, \vee_t\rangle$ of a [pre-bilattice](../../../../../pre-bilattice.md). It ranks values by *which way* the evidence points at a given coordinate, independent of *how much* has been gathered. The transverse role is the [order-of-knowledge](order-of-knowledge.md), which ranks values by accumulated information.

## The role

The order-of-truth is the order along which a value can be *more for* or *more against* an assertion. Three pressures distinguish the role:

**Direction.** There must be a way to say *this value is more in favor of the assertion than that one*. The order is the formal record of that direction. Extremes are the maximally-against value ($\mathbf{f}$, "told false") and the maximally-for value ($\mathbf{t}$, "told true").

**Independence from informativeness.** Two values carrying the same amount of evidence — one all-for, one all-against — must be incomparable under [order-of-knowledge](order-of-knowledge.md) and ordered under truth. Truth is transverse to knowledge; conflating the two cannot represent disagreement. The values $\bot$ ("told nothing") and $\top$ ("told both") sit at opposite extremes in $\leq_k$ but are *truth-neutral middles* in $\leq_t$ — neither more for nor more against than the other.

**Negatability.** Every value $a$ admits a counterpart $\sim a$ whose truth-position is opposite. This is the role of [negation](../../../../code/transformers/negating.md), and it characterizes the truth axis as the one along which negation acts antitonely: $a \leq_t b \Rightarrow \sim b \leq_t \sim a$.

## Realization on the bilattice family

On a [pre-bilattice](../../../../../pre-bilattice.md) $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k\rangle$, $\leq_t$ is the partial order associated with the first lattice. Bounded gives $\mathbf{f}$ (bottom) and $\mathbf{t}$ (top). Meet $\wedge_t$ and join $\vee_t$ are the lattice operations of the first lattice.

On a [bilattice](../../../../code/structures/bilattice.md), the [negation](../../../../code/transformers/negating.md) $\sim$ is the involution that reverses the order: $a \leq_t b \Rightarrow \sim b \leq_t \sim a$. The [conflation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/conflating.md) $-$ is monotone in $\leq_t$ — it preserves truth-direction while reversing knowledge-rank, exchanging the two truth-neutral middles $\bot$ and $\top$.

On the [four-bilattice](../../../../code/structures/four-bilattice.md) $\mathbf{FOUR}$, the order runs $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$ and $\mathbf{f} \leq_t \top \leq_t \mathbf{t}$. The two middles $\bot$ and $\top$ are incomparable in $\leq_t$ — equally truth-neutral, both strictly between $\mathbf{f}$ and $\mathbf{t}$.

On the [twist-product](../../../../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the order is anti-aligned between coordinates:

$$\langle a_+, a_-\rangle \leq_t \langle b_+, b_-\rangle \iff a_+ \leq_1 b_+ \text{ and } b_- \leq_2 a_-.$$

Positive evidence rises with $\leq_t$; negative evidence falls. This contrasts with $\leq_k$, where both coordinates rise together. Negation on the twist product is the literal coordinate-swap $\sim\langle a_+, a_-\rangle = \langle a_-, a_+\rangle$, which makes its $\leq_t$-antitonicity immediate.

## Truth-position under settling

A [predication-settling](../../../../code/structures/predication-settling.md) is $\leq_k$-monotone, not $\leq_t$-monotone. Truth-position can rise *and* fall as evidence accumulates. A value that is $\mathbf{t}$ at one settling stage (positive evidence has arrived, no negative) can become $\top$ at a later stage (negative evidence has also arrived). The transition $\mathbf{t} \to \top$ is *up* in $\leq_k$ (more determinate) but *down* in $\leq_t$ (the value is no longer in the truth-asserted position $\mathbf{t}$).

This asymmetry is structural. The accumulation discipline ($\leq_k$-monotonicity) does not extend to $\leq_t$; the order-of-truth records *what the current evidence says*, and that reading can shift as more evidence comes in.

## Δ-pass stabilization

The bilattice-stabilization nucleus $T_a^* = a \Rightarrow (a \odot \cdot)$ iterated to its fixed point operates in $\leq_t$, not $\leq_k$. Where σ-pass (the [closure-operator](../../../../code/transformers/closure-operator.md), [closure-2-monad](../../../../code/transformers/closure-2-monad.md)) accumulates evidence across cells in the knowledge axis, the Δ-pass stabilizes within a single fiber-coordinate's value space against a background, computing the truth-order fixed point of the per-coordinate iterated residual. Joint fixed-point of σ-pass and Δ-pass is the stratum-2 settled state.

## The Belnap designation

Many uses of the order-of-truth consult only a marked subset of *designated* values — the values that count as "truth-asserted" for the purpose at hand. The Belnap designation $\{\mathbf{t}, \top\}$ is the natural $\leq_t$-up-set generated by $\mathbf{t}$ in a setting where $\top$ must be designable (because $\top$ carries positive evidence as part of its contradictory content). Designating $\{\mathbf{t}, \top\}$ — rather than $\{\mathbf{t}\}$ alone — is what makes paraconsistent reasoning operative: a contradicted cell remains in the designated set rather than collapsing under ex-falso.

The Belnap partition further classifies the *illocutionary force class* of a positing datum by its $\leq_t$-class (per [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../../learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md)). Asserting ($q = \mathbf{t}$) and denying ($q = \mathbf{f}$) are the two truth-extreme positings; abstaining ($q = \bot$) and contesting ($q = \top$) are the two truth-neutral positings.

## The classical-equality fragment

The order admits a *classical fragment*: the $\leq_t$-classical sub-poset of a [predication-fiber-algebra](../../../../code/structures/predication-fiber-algebra.md) is the sub-poset of values of the form $\langle 1, 0\rangle = \mathbf{t}$ and $\langle 0, 1\rangle = \mathbf{f}$ — values whose negative coordinate is the for-coordinate's classical complement. A cell whose value lies in this sub-poset has a fully-decided truth-direction and trivial knowledge value beyond what the truth-direction implies. Per the [claim algebraic-theory-from-predication](../../../learning/claims/algebraic-theory-from-predication.md), the $\leq_t$-classical functional cells biject with set-theoretic functions, and their closure under composition gives the clone-closed fragment in which classical universal algebra lives.

Classical equality $=_E := \exists_g^t(\mathbf{1}_q^t)$ — the $\leq_t$-Lawvere image of the constant-$\mathbf{t}$ valuation — gives standard two-valued $\mathbf{t}/\mathbf{f}$ equality on/off the diagonal. Any classical first-order theory recovers as a sub-doctrine of the [predication-hyperdoctrine](../../../../code/structures/predication-hyperdoctrine.md) via projection to its $\leq_t$-classical fragment.

## Realization at the fiber-algebra level

A [predication-valuation](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) assigns to each predicate $p$ an element of the [predication-fiber-algebra](../../../../code/structures/predication-fiber-algebra.md) $A_p$. The fiber algebra is the pointwise twist product over $E \times E$, so it inherits its $\leq_t$ pointwise: $v_1(p) \leq_t v_2(p)$ at $A_p$ iff $v_1(p)(s, o) \leq_t v_2(p)(s, o)$ at $\mathbf{L}^\bowtie$ for every entity pair $(s, o)$. The fiber-algebra meet $\wedge_t$ and join $\vee_t$ lift pointwise. The meet is the cell-wise most-supported-position both valuations agree on; the join is the cell-wise truth-direction commitment that subsumes both.

## Transversality to order-of-knowledge

The two orders are connected through the bilattice's involutions. The negation $\sim$ preserves $\leq_k$ and reverses $\leq_t$ — swapping for-evidence and against-evidence keeps knowledge constant but flips truth-direction. The conflation $-$ preserves $\leq_t$ and reverses $\leq_k$ — interchanging "told nothing" and "told both" keeps truth-direction constant but flips knowledge-rank. The two involutions together generate the [Klein-four symmetry](../../../../bilattice/content/klein-four-symmetry/klein-four-symmetry.md); adding the order-swap $\sigma$ (which exchanges the two orders' role-positions) generates the full $D_4$ symmetry.

The orders are not exchangeable. They answer different questions and satisfy different pressures. $\leq_k$-monotonicity is the accumulation discipline; $\leq_t$ has no monotonicity discipline. The Δ-pass works in $\leq_t$; the σ-pass works in $\leq_k$. Designation operates in $\leq_t$; CRDT merge operates in $\leq_k$.

## What this concept does not name

- The knowledge-order direction. The transverse role lives at [order-of-knowledge](order-of-knowledge.md).
- The σ-pass closure dynamics. The closure-operator and closure-2-monad operate in $\leq_k$, not $\leq_t$.
- The full dihedral $D_4$ symmetry. The order-swap $\sigma$ is a meta-theoretic equivalence between bilattice orders; the within-theory symmetry generated by the involutions named here is $K_4 = \langle \sim, -\rangle$.
