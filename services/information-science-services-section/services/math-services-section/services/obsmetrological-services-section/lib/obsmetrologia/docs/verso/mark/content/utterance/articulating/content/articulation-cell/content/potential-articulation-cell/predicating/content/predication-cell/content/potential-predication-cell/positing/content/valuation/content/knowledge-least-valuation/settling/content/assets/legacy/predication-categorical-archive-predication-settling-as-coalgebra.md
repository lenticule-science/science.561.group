---
type: narrative
introduces: [settling-coalgebra-structure, settling-endofunctor]
see-also: [predication-fibration, predication-hyperdoctrine, closure-2-monad, predication-settling]
---

# Settling as coalgebra

A [predication settling](../../objects/predication-settling.md) can be presented as a $\leq_k$-monotone family of valuations $(v_\tau)_{\tau < \lambda}$ — a flat object: a sequence in a product algebra, with [settling monotonicity](../../teaching/explanations/settling-monotonicity.md) as a side condition. This presentation is sufficient for the finite Scott-continuous regime: the settling stabilizes, the fixed point is a presheaf in the literal contravariant-covariant-functor sense, and everything is 1-categorical.

Beyond that regime, the flat presentation runs out of room. A non-Scott-continuous settling does not stabilize at any countable ordinal; the structural content lives in coherence 2-cells that a flat sequence cannot record; the [Priestley-dualization](../../theorems/priestley-dualizability.md) of the entire structure needs the dual to live somewhere richer than a 1-category. The fix is to express the settling as a coalgebra in a 2-category — and to factor the resulting object into a stack of three structures, each a property of the previous.

## The structural stratification

**[Predication fibration](../../objects/predication-fibration.md).** Static spatial structure: a cloven Grothendieck fibration $p : \mathcal{E} \to \mathcal{C}$ with fibers the [predication fiber algebras](../../objects/predication-fiber-algebra.md), reindexing for the four predicate generators acting by the [predication fiber functor](../../theorems/predication-fiber-functor.md). No dynamics, no adjoint structure beyond the fibration's reindexing.

**[Predication hyperdoctrine](../../objects/predication-hyperdoctrine.md).** A predication fibration that satisfies hyperdoctrinal properties: the two parallel adjoint triples $\exists_f^{k/t} \dashv f^* \dashv \forall_f^{k/t}$, [Frobenius for $\wedge_k$ and $\wedge_t$](../../theorems/frobenius-for-knowledge-and-truth-meets.md), [Beck–Chevalley](../../theorems/beck-chevalley-commutation-on-predication-bilattices.md), comprehension. Still static, but now carrying the full first-order categorical-logic apparatus. By Kelly–Lack property-likeness, this is a *property* of the underlying fibration, not extra data.

**[Settling-equipped predication hyperdoctrine](../../objects/settling-coalgebra-structure.md).** A predication hyperdoctrine equipped with a coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ for the [settling endofunctor](../../morphisms/settling-endofunctor.md) $F_U(\mathcal{E})_\tau := \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau$. The coalgebra structure replaces "monotone family" with "orbit of an endofunctor" — the flat $(v_\tau)$ is the orbit; the coalgebra is the structure that produces it.

The flat predication settling is the 1-truncation of the settling-equipped form in the strict-idempotent regime: there the settling endofunctor's iterates collapse to a linear sequence and the coalgebra reduces to the family.

## What the coalgebraic framing buys

Four things become possible that the flat sequence cannot deliver.

1. **Transfinite orbits stay first-class.** A coalgebra of an endofunctor in a 2-category can produce orbits of any ordinal length — including ordinals beyond $\omega$ where the [closure 2-monad](../../morphisms/closure-2-monad.md) is genuinely lax-idempotent, with non-identity coherence 2-cells at the limit steps.

2. **The diamond becomes part of the data.** The KZ-lax-idempotent diamond of the [temporal 2-category](../../objects/temporal-2-category.md) records adjoint-triangle 2-cells at each iteration level. A coalgebra in this 2-category carries the diamond's 2-cells; the flat sequence loses them.

3. **Priestley-dualization works uniformly.** Coalgebras dualize to algebras of the dual functor — that is the standard categorical-duality direction. The settling coalgebra $c$ on the primal side dualizes to a settling algebra $c^*$ on the [dual predication hyperdoctrine](../../objects/dual-predication-hyperdoctrine.md), with the orbit structure preserved up to the variance flip.

4. **The four regimes have a common framing.** The strict regime is "the settling endofunctor's orbit stabilizes in finitely many steps"; the [aperiodic regime](../../theorems/four-regime-dichotomy.md) is "the orbit is strictly ascending at every ordinal step." The same coalgebraic vocabulary describes both, with the [closure ordinal](../../objects/closure-ordinal.md) measuring how far the orbit must go.

## The conceptual move

The flat presentation treats the settling as *behavior*: a record of how the system evolves. The settling-equipped form treats it as *structure*: an algebraic object whose orbit is the behavior. The move is the standard coalgebra/algebra split — coalgebras capture behavior, algebras capture structure — applied to the settling. The three structures (predication fibration, predication hyperdoctrine, settling coalgebra) cleanly separate static spatial form, static hyperdoctrinal coherence, and dynamical-coalgebraic content; each is a property of the previous in the Kelly–Lack property-like sense.
