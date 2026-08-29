---
type: narrative
introduces: [adjudication]
see-also: [predication-settling, four-bilattice, closure-operator, crdt-convergence]
---

# Adjudication and the predication settling

A knowledge base is rarely the closed product of one author. Real bodies of knowledge — RDF triple stores, description-logic ABoxes, multi-agent fact pools, distributed knowledge graphs — accumulate from many sources, change over time, and host disagreements. Yet the canonical mathematical treatments of such systems work in classical two-valued logic, where every claim is either asserted or not, and any internal contradiction trivializes inference globally.

The role of [adjudication](../../teaching/explanations/adjudication.md) is the problem: produce, from accumulating, possibly conflicting, possibly partial sources, a settled epistemic state at every assertion-position — well-defined enough to support further inference, stable enough to be agreed on across distributed observers. Three structural pressures govern the role: contradiction (sources disagree), unknownness (information is absent rather than refuted), and distributed accumulation (information arrives asynchronously across sources, in different orders, possibly with duplication).

[@belnap1977] identified the value-space answer to the first two pressures: a four-valued lattice $\mathbf{FOUR}$ whose values are *told true* ($\mathbf{t}$), *told false* ($\mathbf{f}$), *told both* ($\top$), and *told nothing* ($\bot$). [@fitting1991] gave the dynamical answer: the settling of inferences from a knowledge base under closure rules. [@shapiro-et-al2011] gave the distribution answer: the convergence-without-consensus of replicas under monotone updates via the join-semilattice CRDT framework.

A [predication settling](../../objects/predication-settling.md) is the single mathematical object that combines all three. Concretely: a $\leq_k$-monotone family of valuations indexed by a settling bound, each valuation assigning to every predication cell a value in the [four-element bilattice](../../objects/four-bilattice.md) (or its bilattice generalization $\mathbf{L}^\bowtie$). The bilattice is the value space — its $\leq_t$ order tracks truth, its $\leq_k$ order tracks knowledge accumulation. The settling evolves under a [closure operator](../../morphisms/closure-operator.md) that fires inference rules; the settling is monotone in $\leq_k$, so information accumulates and is never retracted. The pointwise $\vee_k$-join of two predication settlings is a semilattice operation — the merge of distributed replicas — and the [CRDT convergence theorem](../../theorems/crdt-convergence.md) shows replicas converge to a common limit state without requiring consensus.

Predication categories splits into two parts. The [Derivation](part-1-derivation.md) develops this assembly across six chapters: predication structure, the hyperdoctrine layer, settling dynamics, Priestley duality, settling cohomology, and the moduli stack. [Study and use](part-2-study-and-use.md) then turns to leaf clusters that consume this apparatus — the modal calculus on bilattice fibers, distributed-systems applications (CRDT and CALM), paraconsistent variants, and bigraded cohomology refinements.
