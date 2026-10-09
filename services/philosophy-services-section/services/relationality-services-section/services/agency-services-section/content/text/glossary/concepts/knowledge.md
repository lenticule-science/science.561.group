---
type: concept
depends-on: [pre-bilattice]
see-also: [truth, evidence, knowledge-order, settling-monotonicity, adjudication, four-bilattice]
title: Knowledge
description: The role borne by an answer to the question how much has been settled?
---

# Knowledge

The role borne by an answer to the question *how much has been settled?* — independently of which way the evidence points.
Knowledge is the axis along which a value can be *more determinate* or *less determinate* about an assertion, gathering both for-evidence and against-evidence as a single quantity.

A framework realizes knowledge when it equips its value space with an order, the [knowledge order](knowledge-order.md) $\leq_k$, that ranks values by how much information has been received about the assertion.
Three pressures distinguish the role:

- **Accumulation.** Receiving additional [evidence](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/evidence.md) must move the value upward in $\leq_k$, never downward — strictly upward when the new evidence is genuinely new, and unchanged when the closure has already absorbed it.
  The knowledge role is the formal site of monotonicity: information accrues, it is not retracted.
- **Indifference to direction.** A value with only for-evidence and a value with only against-evidence carry the *same amount* of information about the assertion; neither is more determinate than the other.
  The knowledge role expresses this by leaving such values *incomparable* in $\leq_k$ — neither dominates — while ranking each strictly above the empty value $\bot$ and strictly below the both-sided value $\top$.
  Knowledge is *transverse* to [truth](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/truth.md): the truth role separates them, the knowledge role measures their common informativeness.
- **Compatibility with conflict.** When a source asserting *for* and a source asserting *against* are both received, the resulting value must be *more determinate* than either — even though it is no more truth-leaning than either.
  Knowledge has a top, "told both," that is the join of the for-only and against-only values.

A framework that realizes knowledge without truth collapses to a plain monotone accumulation system with no notion of what is being asserted; one that realizes truth without knowledge collapses to a stateless valuation with no notion of when an assertion has actually been settled.
Both are required for [adjudication](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/adjudication.md), which is the role that demands the two of them simultaneously.

## The bilattice realization

In a [pre-bilattice](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/pre-bilattice.md), knowledge is realized as the second of two lattice orders, with meet $\wedge_k$ and join $\vee_k$.
When the lattice is bounded, the role has two named extremes: $\bot$ (told nothing — minimally informative) and $\top$ (told both — maximally informative *and* maximally conflicted).
On [$\mathbf{FOUR}$](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/objects/four-bilattice.md), the knowledge order runs $\bot \leq_k \{\mathbf{t}, \mathbf{f}\} \leq_k \top$, with $\mathbf{t}$ and $\mathbf{f}$ incomparable under $\leq_k$ but each strictly between $\bot$ and $\top$ — capturing that "told true" and "told false" are *equally informative*, even though they are opposed under [truth](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/truth.md).

## The twist-product realization

In a [twist product](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}_1 \bowtie \mathbf{L}_2$, the knowledge role is realized through

$$\langle a_1, a_2 \rangle \leq_k \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \text{ and } a_2 \leq_2 b_2,$$

i.e., both positive and negative [evidence](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/evidence.md) go up.
The contrast with [truth](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/truth.md), where the negative coordinate goes the other way, is the explicit shape of the two roles' transversality.
[Negation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/negation.md) is monotone in the knowledge order: swapping the two sides of evidence preserves how much there is.

## Under settling

A [predication settling](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/objects/predication-settling.md) is *the dynamics of the knowledge role*: a $\leq_k$-monotone family of valuations indexed by a [settling bound](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/objects/settling-bound.md), evolving by accumulation of evidence and firing of inference.
The [settling monotonicity](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/settling-monotonicity.md) condition is the role's accumulation pressure made into a constraint on trajectories; the [closure-drivenness](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/closure-drivenness.md) condition is the requirement that the trajectory's $\leq_k$-jumps come from $\leq_k$-joining new evidence with the closure of the prior state.
The settling is the temporal extension of the static knowledge role — see [temporal accumulation](temporal-accumulation.md) for the role borne by that extension.

## Under merge

The knowledge role's join $\vee_k$ is the algebraic content of *replica merge* in a distributed setting: two replicas' accumulated states merge by pointwise $\vee_k$, recovering a single state with the union of their information.
[CRDT convergence](../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence.md) is the role's *distribution* pressure made operational: knowledge accumulates not only along time but across the cover of a [distributed settling system](../../documents/articles/notes/undated/distributed-settling-system.md), with the same $\leq_k$-monotone semantics governing both.

## Under designation

Just as [truth](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/learning/_archive/from-agent-acting-learning/_archive/truth.md) admits a Belnap designation singling out the truth-asserted values, knowledge admits its own coarsening: the *settled* values are those above a chosen threshold in $\leq_k$, typically anything strictly above $\bot$.
The two coarsenings are independent: a value can be settled-for without being settled (rejected as false), and a value can be settled (told both) without being designated as true.
The pair of coarsenings is what makes [paraconsistent equality](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/paraconsistent-equality/paraconsistent-equality.md) and the four-regime [classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) of settlings possible — each regime is determined by which knowledge-thresholds the settling can reach and how fast.
