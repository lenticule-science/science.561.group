---
type: question
status: resolved
resolved-by: [three-acts-as-temporal-2-category-decomposition]
explores: [closure-rule, settle, merge, tick]
---

# Do the substrate's three acts (sequential, concurrent, generative) need a unified "advance modes" concept?

> **Resolution.** This question is resolved by [three-acts-as-temporal-2-category-decomposition](../theorems/three-acts-as-temporal-2-category-decomposition.md). The three acts are the three structural advances of the [temporal 2-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md) lifted along the [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) with the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) acting fiberwise: sequential = $\mathbb{M}$-step (Gray–Street fibration 2-monad), concurrent = $\vee_k$-join (the [settling-merge-semilattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-merge-semilattice.md) operation on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)), generative = $\mathrm{Cl}^{\mathcal{S}}$-iterate (the closure 2-monad). The triad is the substrate's conformant-operator schema: the three primitives sit on three independent axes of the lifted structure, and every conformant composite is presented as a finite word in them per the per-axis composition laws (operators outside the schema are non-conformant, not non-existent). The adjoint relationships the older specs anticipated are the substrate-content shadow of the Beck–Chevalley square for $\mathbb{M} \dashv \mathbb{N}$ paired with closure-2-monad lax-idempotence; per-mode termination is regime-conditioned per [regime-classification-for-substrate](../theorems/regime-classification-for-substrate.md). The unified "advance modes" concept is therefore not a separate substrate concept but the math-program structure those concepts already cite — the three acts *are* the three universal advances of the lifted temporal 2-category, and the engineering content of the unification is the resolving theorem's normal-form, audit-detection, and federation-decomposition consequences.

> Companion: [access-patterns-as-temporal-2-category-limit-colimit-triad](../theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md) resolves the dual question for the substrate's *observation* triad (Directed Shape / Dynamics / Cosections), classifying it as the colimit / atom / limit triad over the same lifted structure.

The older specs frame the substrate as supporting three structurally distinct kinds of advance:

- **Sequential act $G_s$.** One agent (or one entity) advances by one step: the entity's state at history $t$ becomes its state at $s \star t$. Operationally: [tick advance](theories/agential-orchestration-platform/morphisms/tick-advance.md) on a single entity.
- **Concurrent act $\circledast$.** Two agents (or two entities, or two parallel processes) advance independently; their histories are concatenated under the substrate's commutation relation. Operationally: parallel substrate operations whose effects join via [merge](../morphisms/merge.md) (or, across replicas, via [sync](../morphisms/sync.md)).
- **Generative act $U_G$.** The whole substrate advances: the closure operator's iterate produces the next iteration's content. Operationally: [settle](../morphisms/settle.md) on a region, or the substrate's depth-tower step.

The three are claimed to be a structural decomposition of "how substrate state advances" — at any moment, one of these three is happening. The math-program names them as a triad with adjoint relationships.

The corpus currently covers each act through individual morphisms:

- Sequential = tick-advance
- Concurrent = merge / sync (parallel + reconciliation)
- Generative = settle

But the corpus does *not* unify them as a triad: there is no concept declaring "these are the three structurally-distinct advance modes" or characterizing how they relate (when does sequential become generative? when does concurrent become sequential plus merge?).

The question is whether engineering content is being lost by treating them as separate morphisms rather than as facets of a unified structure. Particular candidates for capture:

- **Mode classification on operations.** Each substrate operation could declare which act it implements: a closure-rule application is sequential, a CRDT merge is concurrent, a depth-tower step is generative. The substrate's audit could classify operations by mode and check coherence (a sequential-advance that produces what only generative could produce is suspect).
- **Adjoint relationships.** The math program suggests adjoint structure between the acts. Engineering content: a sequential advance's effect across replicas is concurrent advance plus merge; a concurrent advance held to a single replica reduces to sequential.
- **Termination guarantees per mode.** Sequential ticks terminate per [fuel-bound](teaching/explanations/fuel-bound.md); concurrent advance terminates when all replicas converge per [sync](../morphisms/sync.md); generative advance terminates per the closure operator's regime classification. The unified treatment could state the per-mode termination discipline.

The set-aside framing: spatiotemporal-knowledge has not yet articulated whether the three acts are a load-bearing engineering decomposition or a math-program convenience. Until the math is clearer, the corpus carries the operations individually and leaves the unified triad open.

Source: `agential-relations-system-operation.md` and the math-program documents it cites.
