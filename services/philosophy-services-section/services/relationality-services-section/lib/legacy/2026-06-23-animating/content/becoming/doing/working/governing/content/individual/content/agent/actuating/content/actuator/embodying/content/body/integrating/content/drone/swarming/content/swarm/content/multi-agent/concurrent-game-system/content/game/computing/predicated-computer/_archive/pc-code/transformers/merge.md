---
type: morphism
class: composed-operator
realizes: [operator]
depends-on: [predication-graph-store, insertion, predication-fiber-algebra, knowledge-order, closure-2-monad, crdt-convergence]
see-also: [settle, federation-convergence]
---

# Merge

The composed operator that combines two settled [predication-graph stores](../objects/predication-graph-store.md) into a single store, taking the cellwise [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) join $\vee_k$ of their values in the substrate's [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), then re-running [settle](settle.md) on the result.

Three properties make merge well-defined as the substrate-side instance of the math closure-merge commutation lemma (per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md)):

- **Commutative.** $\mathrm{merge}(G_1, G_2) = \mathrm{merge}(G_2, G_1)$ — $\vee_k$ is commutative on the bilattice fiber, and the settle that follows is deterministic per [settlement-determinism](../theorems/settlement-determinism.md).
- **Associative.** $\mathrm{merge}(\mathrm{merge}(G_1, G_2), G_3) = \mathrm{merge}(G_1, \mathrm{merge}(G_2, G_3))$ — $\vee_k$ is associative, and the substrate's [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) is lax-idempotent so re-settle of an already-settled join is a no-op.
- **Idempotent on equal inputs.** $\mathrm{merge}(G, G) = G$ when $G$ is settled — $\vee_k$ of a value with itself is itself, and re-settle on a settled store is a no-op.

Together these three properties are the standard CRDT (commutative-replicated-data-type) discipline. The substrate-level instance is exact: per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), the closure-merge commutation lemma $\mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y) = \mathrm{cl}_p(X \vee_k Y)$ is what guarantees merge is well-defined as a CRDT join. The substrate's value-domain algebra is what makes the CRDT laws hold structurally rather than by axiomatic fiat.

Merge is what enables federation per [federation-convergence](../theorems/federation-convergence.md). Two predicated computers running the same closure-rule system can exchange settled stores, merge them, and re-settle; the merged result is byte-identical across both, with no centralized coordinator required. The merge operation is content-addressed: per [hash-discipline](teaching/explanations/hash-discipline.md), the merged store's canonical-form hash is determined by the union of input writes, not by merge order or scheduling.

Pre-merge validation must verify that the two operands share their closure-rule-system version and value-domain. A merge across mismatched versions produces an error; the engineering decision is whether to raise the error at the merge call or to attempt a translation through a declared [federation-bridge](../objects/federation-bridge.md) (admissible only when the bridge is itself a substrate entity, recorded per [self-representation](teaching/explanations/self-representation.md)).
