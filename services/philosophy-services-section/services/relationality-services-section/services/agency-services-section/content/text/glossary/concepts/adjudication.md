---
type: concept
depends-on: [predication-cell]
see-also: [evidence, truth, knowledge, negation, temporal-accumulation, predication-settling, four-bilattice]
title: Adjudication
description: The role of producing an epistemic state at every predication cell from accumulating, possibly conflicting, possibly partial sources of information.
---

# Adjudication

The role of producing an *epistemic state* at every [predication cell](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/predication-cell.md) from accumulating, possibly conflicting, possibly partial sources of information.
Adjudication is the role that all of the program's other roles — [evidence](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/evidence.md), [truth](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/truth.md), [knowledge](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/knowledge.md), [negation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/negation.md), [temporal accumulation](temporal-accumulation.md) — exist to serve.

A framework realizes adjudication when it represents three features of practical knowledge systems on a single structure:

- **Inconsistency.** Distinct sources may assert contradictory facts about the same predication cell.
  The framework must represent contradiction directly, without trivialization — without contradictory predication cells causing the inferential structure to collapse globally.
- **Partial information.** A predication cell may be uninformed — neither asserted nor refuted.
  The framework must distinguish *unknownness* from [negation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/negation.md); absence of information is not denial.
- **Temporal accumulation and distribution.** Information about a predication cell arrives over time and from independent sources, in varying orders and possibly with duplication.
  The framework must produce a state that depends on the set of information received, growing monotonically as more information arrives, and converging to the same final state across *knowledge replicas* without requiring them to coordinate every update.

The three pressures cannot be handled in isolation.
Inconsistency requires a value space that holds contradiction as a state; partial information requires a value space that distinguishes unknownness from denial; temporal accumulation requires those value-space pressures to be compatible with monotone growth.
A framework that handles only one or two trivializes the others — see the [classical, three-valued, and paraconsistent foils for adjudication](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/prose/teaching/explanations/classical-three-valued-paraconsistent-foils.md) for the systematic record of which thinner frameworks fail which pressures.

## The bilattice realization of the value-space pressures

The first two pressures — inconsistency and partial information — are realized by the value space being a bilattice.
On [$\mathbf{FOUR}$](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/objects/four-bilattice.md), $\top$ holds contradiction as a state (told both for and against, without trivialization downstream) and $\bot$ holds unknownness as a state (told nothing, distinguished from $\mathbf{f}$ which is told false).
The richer twist-product bilattices $\mathbf{L}^\bowtie$ extend the same realization with finer-grained [evidence](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/evidence.md) on each side.
The role of adjudication's value-space content is exactly the role of the bilattice: a single ordered structure carrying both axes, with [negation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/negation.md) acting transversely to [knowledge](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/knowledge.md).

## The settling realization of the temporal pressure

The third pressure — temporal accumulation — is realized by a [predication settling](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/objects/predication-settling.md).
The settling indexes a $\leq_k$-monotone family of [predication valuations](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-valuation.md) by a [settling bound](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/objects/settling-bound.md), with each step incorporating new evidence through the [increment sequence](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/objects/increment-sequence.md) joined under $\vee_k$ and closed under the [closure operator](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/morphisms/closure-operator.md).
Across the settling, every cell's trajectory is $\leq_k$-monotone individually, and the global state at each step is a coherent valuation of the entire cell set.
See [temporal accumulation](temporal-accumulation.md) for the role-content of this dynamic.

## The CRDT realization of the distributed pressure

The distributed half of the third pressure — convergence across observers without coordination — is realized by the cellwise $\vee_k$-merge on settlings being a [join-semilattice operation](../../documents/articles/notes/undated/settling-merge-semilattice.md), and by [CRDT convergence](../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence.md): independently-evolving replicas of a settling, when merged, converge to a common limit without consensus.
The same algebraic content (the knowledge-order join) realizes both temporal accumulation across moments and distributed accumulation across observers; this single-operation answer to two pressures is the structural payoff of treating adjudication as one role rather than as a collection of separate problems.

## Distinguished from inference

Adjudication is *not* the role of *deriving new content* from accumulated content — that is the role of the closure operator, which fires the framework's inference rules on each step's joined evidence.
Adjudication is the role of *holding* the content: representing what is currently known, what is currently in conflict, what is currently unknown, and what has been agreed across observers, in a form on which inference can then operate.
Closure and adjudication compose: the closure operator runs *inside* each settling step, the adjudication structure persists *across* steps.
A framework that conflates the two — that treats inference as the only operation on the value space — loses the distinction between *what has been settled* and *what can be derived from what has been settled*, and forfeits the temporal and distributed structure that the role of adjudication is there to express.

## In the program's structure

The two parts of [predication categories](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/adjudicating/_archive/prose/teaching/explanations/adjudication-and-the-settling.md) are organized by the two halves of the role.
The Derivation develops the apparatus that realizes adjudication on a single mathematical object: the predication structure, the hyperdoctrine layer, the settling dynamics, the Priestley duality, the cohomology, and the moduli stack.
The Study and use part turns to leaf clusters that consume the apparatus — modal calculus, distributed-systems applications, paraconsistent variants, bigraded common knowledge.
The role is the through-line: every chapter is some refinement of "what does it take to adjudicate well, and what does it cost?"
