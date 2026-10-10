---
type: narrative
status: current
recaps:
  - ../_index.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md
  - ../teaching/explanations/closure-rule.md
  - ../teaching/explanations/witness.md
  - ../teaching/explanations/extend-restrict-adjoint.md
  - ../objects/closure-rule-system.md
  - ../objects/event-log.md
  - ../theorems/closure-rule-system-realizes-closure-2-monad.md
  - ../theorems/conformance-via-fiber-algebra-functor.md
  - ../theorems/federation-convergence.md
  - ../theorems/substrate-operations-are-bigraded-modal.md
discusses:
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md
see-also:
  - what-predicated-computing-inherits.md
  - structural-lineage-from-codd-to-predicated-computing.md
  - correspondences-with-established-theory.md
---

# Composability with predication categories

The engineering theory of [predicated computing](../_index.md) and the math theory of [predication categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) describe *the same object* from different angles. The engineering side gives the substrate's runtime disciplines, implementation contracts, and operational guarantees in registers a working substrate engineer reads natively. The math side gives the formal apparatus — predication cells, fiber algebras, hyperdoctrines, closure operators, the closure 2-monad, predication settlings — and proves the structural theorems that the engineering register would otherwise have to assert.

This narrative names the *bridges* between the two registers — five load-bearing places where an engineering primitive corresponds to a mathematical object — and argues their faithfulness. The bridges are what make the corpus's two-sidedness load-bearing rather than ornamental: an engineering claim that does not bridge is unmoored; a math construction that does not bridge is decorative. The narrative mirrors the [composability-with-predicated-knowledge-systems](../theories/functional-runtime-platform/narratives/composability-with-predicated-knowledge-systems.md) bridge-narrative for FRP and the [composability-with-predicated-knowledge-systems (AgOP)](../theories/agential-orchestration-platform/narratives/composability-with-predicated-knowledge-systems.md) bridge-narrative for AgOP — same shape, different bridge endpoints.

## Bridge 1 — Predication cell ↔ substrate cell

The first bridge places the engineering [predication cell](../teaching/explanations/closure-rule.md) (the substrate's $(s, p, o)$ atomic record) at the math's [predication cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md). The bridge's faithfulness rests on three structural facts:

1. *Both are the irreducible unit of substrate content.* The math defines a predication cell as a triple $(s, p, o)$ in the predication-fiber over a chosen base; the engineering defines a substrate cell as the addressable unit of predication-graph storage. The structural role is the same: nothing smaller than this is substrate-content.
2. *Both carry a bilattice value.* The math gives each cell a value in the predication-fiber's bilattice domain; the engineering gives each cell a stored bilattice value plus a witness recording its derivation. The structural role is the same: cells are *valued*, not bare.
3. *Both compose along subject and predicate.* The math defines composition by reindexing along base morphisms (substitution); the engineering composes cells by joining on shared subjects or predicates (per the [closure-rule application](../morphisms/closure-rule-application.md) operator). The structural role is the same: composition is along the predication's structural axes.

The bridge is *proved at the value-domain level* by [paraconsistency-as-substrate-discipline](../theorems/paraconsistency-as-substrate-discipline.md) and the math's bilattice apparatus: the substrate's stored bilattice value is the math's predication-cell value, and the operations agree by the bilattice-operation-table.

## Bridge 2 — Closure-rule system ↔ closure 2-monad

The second bridge places the engineering [closure-rule system](../objects/closure-rule-system.md) (the substrate's catalog of derivation schemata) at the math's [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) on the predication hyperdoctrine. The bridge is *proved at the structural level* by [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md): the substrate's closure-rule system carries the unit, multiplication, and lax-idempotence data of a closure 2-monad, and the substrate's [settle](../morphisms/settle.md) operation is the application of the 2-monad's underlying closure operator on a chosen fiber.

The bridge's faithfulness rests on three structural facts:

1. *Both iterate to a regime-determined fixpoint.* The math's closure operator iterates to the bilattice-$\leq_k$-least fixpoint, with regime determined by the operator's structure (per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)). The substrate's settle operation iterates closure-rule applications until quiescence, with regime determined by the closure-rule system's [closure-kind](../teaching/explanations/closure-kind.md). The bridge places strict-regime closure-rule systems at the strict regime, Scott-continuous at the Scott-continuous regime, and so on.
2. *Both compose under monoid structure.* The math's 2-monad has unit and multiplication that satisfy the monad laws; the engineering's closure-rule system composes via [closure-conditions-composability](../theorems/closure-conditions-composability.md). The structural role is the same: composition is the monad's multiplication.
3. *Both are bigraded modal.* The math's predication hyperdoctrine carries two KZ structures ($\sigma$ on the truth axis, $\Delta$ on the knowledge axis); the substrate's operations are bigraded modal per [substrate-operations-are-bigraded-modal](../theorems/substrate-operations-are-bigraded-modal.md). The four [closure-kinds](../teaching/explanations/closure-kind.md) (Process, Derivation, Procedure, Inquiry) are exactly the four positions in the bigraded modal lattice $(\Box / \Diamond) \times (\sigma / \Delta)$.

The bridge is the most fully-formalised in the corpus: the math side has Lean-verified theorems, and the engineering side cites them directly.

## Bridge 3 — Event log ↔ predication-settling history

The third bridge places the engineering [event log](../objects/event-log.md) (the substrate's append-only record of admitted predications) at the math's [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) trajectory. The bridge's faithfulness rests on three structural facts:

1. *Both are the rigorous representation of state-evolution.* The math's predication settling is the indexed family of fiber-algebra states the substrate visits as closure operations apply; the engineering's event log is the temporal sequence of admitted predications and closure-rule firings that produce those states. The structural role is the same: rigorous, replay-supporting record of the substrate's trajectory.
2. *Both project to a current state.* The math projects via the chosen settling-bound's right-adjoint; the engineering projects via the [predication-graph store](../objects/predication-graph-store.md) materialisation of the latest fiber. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the projection is functorial.
3. *Both admit branching.* The math's settling admits multiple trajectories per [branched-state-as-settling-fiber-groupoid](../theorems/branched-state-as-settling-fiber-groupoid.md); the engineering's event log admits branched substrate state per [branched-substrate-state](../teaching/explanations/branched-substrate-state.md). The structural role is the same: branching is groupoid-shaped.

The bridge's open work: the *higher-order* event log content — events about events, events about closure-rule modifications, events about scope reconfigurations. The bridge holds at first order; its extension to higher-order events is open and is what the [self-representation-completeness](../learning/questions/self-representation-completeness.md) question records.

## Bridge 4 — Federation ↔ predication-fiber-algebra coproduct

The fourth bridge places the engineering [federation-bridge](../objects/federation-bridge.md) (the substrate's mechanism for joining replicas) at the math's coproduct of predication fiber algebras under the bilattice's $\otimes_k$ join. The bridge is *proved at the convergence level* by [federation-convergence](../theorems/federation-convergence.md): the substrate's federation operation is the math's fiber-algebra coproduct, and convergence follows from the bilattice's commutative-idempotent join structure (per the inherited CRDT framework).

The bridge's faithfulness rests on three structural facts:

1. *Both join commutatively-idempotently at the value-domain level.* The math's fiber-algebra coproduct uses the bilattice's $\otimes_k$ join; the engineering's federation merges substrate cells by joining their bilattice values under $\otimes_k$. Per [federation-as-substrate-join](federation-as-substrate-join.md), this is the structural identity of the operation.
2. *Both record disagreement structurally.* The math's coproduct records disagreement as $\top_k$-pressure on cells where the joined values exceed each input; the engineering's federation records disagreement as $\top_k$-cells in the merged predication-graph store, observable to audit per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md).
3. *Both are scope-respecting.* The math's coproduct over scope-bounded sublocales restricts the join to the visible scopes; the engineering's federation respects [scope-as-predication](scope-as-predication.md) restrictions. The structural role is the same: federation is scope-relative, not global.

The bridge's open work: federation across substrates with *different* bilattices (Belnap's four-valued vs a unit-interval-based fuzzy bilattice); the bridge holds for same-bilattice federation and is sketch for cross-bilattice federation. The [federation-envelope-as-substrate-record](../learning/questions/federation-envelope-as-substrate-record.md) open question records the wire-format gap.

## Bridge 5 — Conformance ↔ fiber-algebra functor

The fifth bridge places the engineering [conformance](../teaching/explanations/conformance.md) discipline (what it means for an implementation to *be* a predicated computer) at the math's discipline of *being a fiber-algebra-respecting functor*. The bridge is *proved at the structural level* by [conformance-via-fiber-algebra-functor](../theorems/conformance-via-fiber-algebra-functor.md): an implementation conforms iff its observable operations factor through a fiber-algebra-respecting functor into the math's reference predication hyperdoctrine.

The bridge's faithfulness rests on three structural facts:

1. *Both are external-observable.* The math's functor is determined by its action on objects and morphisms, all externally observable; the engineering's conformance is determined by behavioral conformance to the [conformance test suite](../objects/conformance-test-suite.md), externally observable per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md). The structural role is the same: nothing internal to the implementation matters beyond what the observable operations enforce.
2. *Both compose.* Functors compose; conforming implementations under federation conform jointly. The structural role is the same: conformance is preserved by composition.
3. *Both admit refinement.* A functor may refine another functor (factoring through a richer hyperdoctrine); a conforming implementation may refine another (instantiating richer disciplines). The structural role is the same: conformance is a partial order, not an equivalence.

The bridge is what makes the [pypredcomp](../../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/) implementation load-bearing: pypredcomp's conformance to the discipline is *checkable* against the fiber-algebra functor, not just against an informal specification.

## What the bridges buy

The five bridges, taken together, give the discipline:

- **A substrate-level reading of every math primitive.** Predication cells, fiber algebras, hyperdoctrines, closure operators, the closure 2-monad, predication settlings, fiber-algebra coproducts, fiber-algebra functors become substrate-level operations rather than mathematical decorations.
- **A formal-apparatus underpinning for every engineering claim.** Engineering claims about replay-determinism, federation-convergence, audit-tracability, modal-restriction, conformance refinement are *theorems in the math reformulation*, not assertions to be debated.
- **A cross-register validation discipline.** An engineering claim that does not bridge to the math has no structural ground; a math construction that does not bridge to the engineering has no engineering uptake. The bridges are what make the corpus self-checking.
- **An operational binding to working systems.** The pypredcomp substrate implementation realises every bridge concretely: pypredcomp's predication cells *are* the math's predication cells, pypredcomp's closure-rule system *realises* the closure 2-monad, pypredcomp's event log *is* the predication-settling trajectory, pypredcomp's federation *enacts* the fiber-algebra coproduct, pypredcomp's conformance test suite *encodes* the fiber-algebra functor.

## What the bridges leave open

- The full faithfulness of the closure-rule-system ↔ closure 2-monad bridge (Bridge 2) at the higher-order case — closure-rules-on-closure-rules; the bridge holds at first order, sketch at higher order.
- The higher-order event log content (Bridge 3) — events about events, events about closure-rule modifications. The [self-representation-completeness](../learning/questions/self-representation-completeness.md) question records the gap.
- The cross-bilattice federation discipline (Bridge 4) — federation across substrates with different bilattices. The bridge holds for same-bilattice federation; cross-bilattice is sketch.
- The conformance-test-suite completeness (Bridge 5) — the suite gives a sound conformance check; whether it is *complete* (every non-conforming implementation fails some test) is sketch.
- The relationship between Bridge 2's bigraded-modal structure and Bridge 4's federation-coproduct — whether modal restrictions distribute over federation joins is a question the audit machinery will need to settle for cross-scope modal queries.

The bridges are the corpus's principal load-bearing self-application: the engineering theory and the math theory describe the same object, and the bridges are the proof that "same object" is a structural claim rather than a metaphor.
