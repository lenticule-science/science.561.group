---
type: concept
depends-on: [pre-bilattice]
see-also: [knowledge, evidence, negation, truth-order, four-bilattice]
---

# Truth

The role borne by an answer to the question *which way does the evidence point?* — independently of how much evidence has been gathered.
Truth is the axis along which a value can be *more for* or *more against* an assertion.

A framework realizes truth when it equips its value space with an order, the [truth order](../truth-order/truth-order.md) $\leq_t$, that ranks values by how supportive of the assertion they are.
The role imposes three pressures on any realization:

- **Direction.** There must be a way to say *this value is more in favor of the assertion than that one*.
  The truth order is the formal record of that direction.
- **Independence from informativeness.** Two values carrying the same amount of [evidence](evidence.md) — one all-for, one all-against — must be incomparable under [knowledge](knowledge.md) and ordered under truth.
  The truth role is *transverse* to the knowledge role; a framework that conflates the two cannot represent disagreement.
- **Negatability.** A value's truth-position must admit reversal: every value $a$ has a counterpart $\sim a$ whose truth-position is opposite.
  This is the role of [negation](negation.md), and it characterizes the truth axis as the one along which negation acts antitonely.

A framework that realizes truth without realizing knowledge collapses to classical two-valued logic; one that realizes knowledge without realizing truth collapses to a plain accumulation lattice with no notion of disagreement.
The two roles are independent and both required for [adjudication](adjudication.md).

## The bilattice realization

In a [pre-bilattice](../../pre-bilattice.md), truth is realized as the first of two lattice orders, with meet $\wedge_t$ and join $\vee_t$.
When the lattice is bounded, the truth role has two named extremes: $\mathbf{f}$ (maximally against) and $\mathbf{t}$ (maximally for).
On [$\mathbf{FOUR}$](../objects/four-bilattice.md), the truth order runs $\mathbf{f} \leq_t \{\bot, \top\} \leq_t \mathbf{t}$, with $\bot$ and $\top$ incomparable to one another but both strictly between $\mathbf{f}$ and $\mathbf{t}$ in $\leq_t$ — capturing that "told nothing" and "told both" are *truth-neutral*, neither for nor against.

## The twist-product realization

In a [twist product](../../../residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the truth role is realized through the order

$$\langle a_1, a_2 \rangle \leq_t \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \text{ and } b_2 \leq_2 a_2,$$

i.e., positive [evidence](evidence.md) goes up and negative evidence goes down.
This is the explicit shape of the role's transversality to knowledge: truth raises the for-side and lowers the against-side, while knowledge raises both.
[Negation](negation.md) is the literal coordinate swap, hence antitone in the truth order.

## Under designation

Many uses of truth do not need the full $\leq_t$ ordering — only a marked subset of *designated* values that count as "truth-asserted" for the purpose at hand.
The standard choice is the Belnap designation $\{\mathbf{t}, \top\}$ — the values with positive evidence, regardless of whether negative evidence is also present — used throughout the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) construction and the [paraconsistent-equality](../../../valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/paraconsistent-equality/paraconsistent-equality.md) machinery.
The truth role's full $\leq_t$ structure is what *justifies* this choice as the natural up-set in $\leq_t$; the designation is a coarsening of the role for downstream purposes, not a replacement of it.

## Under closure and settling

In a [predication settling](../objects/predication-settling.md), the truth role is *not* the axis along which the settling moves: settlings move monotonically in $\leq_k$, not $\leq_t$.
Truth-position can rise and fall as evidence accumulates: a cell that was $\mathbf{t}$ at one stage can become $\top$ at a later one when negative evidence arrives, and the truth-position drops accordingly even though the [knowledge](knowledge.md)-position has strictly risen.
The truth role records *what the current evidence says*; the knowledge role records *how much evidence has been gathered*; the settling combines both in a single $\leq_k$-monotone trajectory.
