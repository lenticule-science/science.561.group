---
type: narrative
status: current
recaps:
  - ../_index.md
  - ../references/abiteboul-hull-vianu1995.md
  - ../references/belnap1977.md
  - ../references/ginsberg1988.md
  - ../references/fitting2006.md
  - ../references/mccarthy-hayes1969.md
  - ../references/reiter2001.md
  - ../references/shapiro-et-al2011.md
  - ../references/almeida-baquero-shapiro2018.md
  - ../references/lamport1998.md
  - ../references/ongaro-ousterhout2014.md
  - ../references/jacobs1999.md
  - ../references/green-et-al2007.md
  - ../references/fagin-halpern-moses-vardi1995.md
  - ../references/preguica-et-al2018.md
  - ../references/sangiorgi-walker2001.md
  - ../references/milner1999.md
discusses:
  - ../teaching/explanations/closure-rule.md
  - ../teaching/explanations/witness.md
  - ../teaching/explanations/two-store-coherence.md
  - ../teaching/explanations/conformance.md
  - ../objects/event-log.md
  - ../objects/predication-graph-store.md
  - ../objects/closure-rule-system.md
  - ../objects/federation-bridge.md
  - ../theorems/federation-convergence.md
  - ../theorems/snapshot-replay-fidelity.md
  - ../theorems/closure-rule-system-realizes-closure-2-monad.md
see-also:
  - structural-lineage-from-codd-to-predicated-computing.md
  - composability-with-predication-categories.md
  - upstream-predication-logic.md
  - upstream-substrate-coordination.md
---

# What predicated computing inherits when it goes substrate

The parent traditions catalogued in [upstream-predication-logic](upstream-predication-logic.md) and [upstream-substrate-coordination](upstream-substrate-coordination.md) supply the discipline's raw material; the [structural lineage from Codd to predicated computing](structural-lineage-from-codd-to-predicated-computing.md) reads them as a chain of required steps. This narrative records the *inheritance ledger* in three columns: what the discipline inherits *with proof* from the upstream literature, what it inherits *as substantive commitment* (`status: sketch`), and what *does not inherit* — the parameters by which a working predicated computer adapts to specific realisations.

The ledger is in the spirit of the [predicated-knowledge-systems inheritance ledger](../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md), the [functional-runtime-platform inheritance ledger](../theories/functional-runtime-platform/narratives/what-functional-runtime-platform-inherits.md), and the [agential-orchestration-platform inheritance ledger](../theories/agential-orchestration-platform/narratives/what-aop-inherits.md): the discipline holds that *being explicit about what does and does not inherit* is itself part of the structural commitment.

## What inherits with proof

These inheritances are *proved* by the upstream literature directly:

- **Relational physical-data-independence holds for any algebra-respecting evaluator** (Codd; per the relational-model tradition catalogued in [Abiteboul-Hull-Vianu 1995](../references/abiteboul-hull-vianu1995.md)). Any query whose semantics is defined by relational algebra has the same meaning under any storage layout that supports the algebra; the proof is the algebraic-equivalence theorem. Predicated computing inherits this directly: the substrate's [predication-graph store](../objects/predication-graph-store.md) and [event log](../objects/event-log.md) are alternative realisations of the same model, and the [two-store coherence](../teaching/explanations/two-store-coherence.md) discipline depends on physical-data-independence to hold.
- **Datalog has a least-fixpoint computable by bounded iteration on finite domains** (per [Abiteboul-Hull-Vianu 1995](../references/abiteboul-hull-vianu1995.md), the *immediate-consequence-operator-is-monotone* theorem applied to the Knaster-Tarski fixpoint theorem). The substrate's [settle](../morphisms/settle.md) operation inherits this proof structure: the [closure-rule system](../objects/closure-rule-system.md) defines a monotone immediate-consequence operator on the predication-graph fiber, and bounded iteration converges to the least closed extension.
- **Bilattice-fixed-point semantics extends Datalog soundly to four-valued and richer bilattices** (Fitting; per [fitting2006](../references/fitting2006.md)). The bilattice immediate-consequence operator is monotone in the knowledge ordering; least-knowledge fixpoints exist for any bilattice with the appropriate complete-lattice structure on its knowledge axis; the proof is the bilattice-Knaster-Tarski theorem. The substrate's [paraconsistency-as-substrate-discipline](../theorems/paraconsistency-as-substrate-discipline.md) inherits this proof structure directly.
- **CRDTs converge under arbitrary message-delivery orderings when the value-domain join is commutative-idempotent** (Shapiro et al.; per [shapiro-et-al2011](../references/shapiro-et-al2011.md), the *strong-eventual-consistency theorem*). The substrate's [federation-convergence](../theorems/federation-convergence.md) is structurally this theorem instantiated at the bilattice value-domain: the bilattice's $\otimes_k$ join is commutative-idempotent, so the substrate-as-CRDT-instance is strong-eventually-consistent.
- **Delta-state CRDTs preserve the strong-eventual-consistency theorem with bandwidth proportional to the delta** (Almeida-Baquero-Shapiro; per [almeida-baquero-shapiro2018](../references/almeida-baquero-shapiro2018.md)). The proof is the delta-mutator-correctness theorem: the join of received deltas equals the join of full states. The substrate's [federation-bridge](../objects/federation-bridge.md) ships predication-deltas under this discipline directly.
- **Paxos and Raft satisfy linearizability and tolerate $f$ failures with $2f + 1$ participants** (Lamport / Ongaro-Ousterhout; per [lamport1998](../references/lamport1998.md), [ongaro-ousterhout2014](../references/ongaro-ousterhout2014.md)). The substrate's distributed-coordination platform inherits this proof structure for any operation that requires single-source-of-truth semantics; the inheritance is direct since the protocol is type-generic over the value being agreed on.
- **Hyperdoctrinal substitution is sound and complete for any first-order theory** (Jacobs; per [jacobs1999](../references/jacobs1999.md), the *fibrational-logic completeness theorem*). The substrate's [extend-restrict-adjoint](../teaching/explanations/extend-restrict-adjoint.md) discipline inherits this proof structure for first-order substrate queries. The Beck-Chevalley condition is what makes [join-reordering-via-beck-chevalley](../theorems/join-reordering-via-beck-chevalley.md) sound.
- **Provenance semirings give a sound algebraic framework for tracking why a derived tuple holds** (Green-Karvounarakis-Tannen; per [green-et-al2007](../references/green-et-al2007.md), the *positive-relational-algebra-as-semiring-evaluation* theorem). The substrate's [provenance-semiring-witness](../teaching/explanations/provenance-semiring-witness.md) inherits the algebraic framework directly; different choices of semiring give different audit contents, all sound by construction.
- **Multi-agent S5 modal-knowledge model-checking is decidable on finite Kripke structures** (Fagin-Halpern-Moses-Vardi; per [fagin-halpern-moses-vardi1995](../references/fagin-halpern-moses-vardi1995.md)). The substrate's modal apparatus over scope-bounded sublocales inherits this decidability for finite federations; the proof is the canonical model-checking algorithm.

## What inherits as substantive commitment (status: sketch)

These inheritances are *plausible structural commitments* that the substrate framing names but that have not been established in full generality. They are `status: sketch`:

- **Closure-rule-system ↔ closure-2-monad is faithful at the bilattice level** (per [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md)). The substrate's [closure-rule system](../objects/closure-rule-system.md) realises the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) at the bilattice fiber; the math side of the identification is established, the substrate-engineering-side faithfulness across all closure-rule shapes (recursive, modal-conditional, federation-aware) is sketch.
- **Event-log replay is a categorical (functorial) reconstruction of any past fiber** (per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md)). The substrate's event-log is structurally a sequence of substrate-modifying actions; replaying the prefix up to time $t$ should reconstruct the byte-identical fiber at time $t$. The bilattice-fixpoint theorem and the relational-algebra equivalence theorem give the building blocks; the full faithfulness across all substrate operations (including federation and modal restriction) is sketch.
- **Substrate-as-CRDT-instance lifts to higher-order types under appropriate semilattice extension** (per [federation-convergence](../theorems/federation-convergence.md)). Shapiro et al.'s CRDT theorem is for first-order data; lifting to predications-over-predications requires extending the join discipline to the higher-order case. The substrate's [hyperversal-meta-operators](../learning/questions/hyperversal-meta-operators.md) open question records the gap.
- **The substrate's modal-necessity operator captures S5 multi-agent knowledge faithfully** (per [substrate-operations-are-bigraded-modal](../theorems/substrate-operations-are-bigraded-modal.md)). The substrate's modal apparatus is bigraded (the closure-2-monad on the truth axis, the dualised closure-2-comonad on the knowledge axis) plus the authorization-modal on the substrate-accessibility-relation; whether this composes faithfully with Fagin-Halpern-Moses-Vardi's multi-agent S5 is sketch.
- **Witness-chain composition under operator chaining is associative-up-to-isomorphism** (per [provenance-semiring-witness](../teaching/explanations/provenance-semiring-witness.md)). The provenance-semiring tradition gives associativity for fixed semirings; whether the substrate's witness composition (across operator chains spanning multiple semirings, multiple scopes, and federation boundaries) preserves associativity is sketch.
- **Channel-and-mobility discipline lifts to scope-bounded substrate operations** (per [scope-as-predication](../narratives/scope-as-predication.md)). The π-calculus framing (per [milner1999](../references/milner1999.md), [sangiorgi-walker2001](../references/sangiorgi-walker2001.md)) gives the formal vocabulary for channel-mobility; whether the substrate's scope-discipline lifts the calculus's bisimulation-equivalence faithfully (per [conformance](../teaching/explanations/conformance.md)) is sketch.

## What inherits as engineering correspondence

These are inheritances at the operational surface — what a working predicated computer gets when it adopts the structural framing:

- **Replay-determinism is a substrate property, not an implementation feature.** Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md) and the inherited successor-state axiom discipline, replaying the event log produces the byte-identical fiber.
- **Disagreement is observable and structural, not silently absorbed.** Per [paraconsistency-as-substrate-discipline](../theorems/paraconsistency-as-substrate-discipline.md), federated substrates that disagree register the disagreement as $\top$-cells, observable to the substrate's audit and reconciliation operations.
- **Audit traces back to source-and-derivation, not just to the latest write.** Per [provenance-semiring-witness](../teaching/explanations/provenance-semiring-witness.md) and the inherited Green-Karvounarakis-Tannen framework, every derived cell carries a witness recording its derivation, sources, and substrate operations.
- **Federation does not require coordinated writes.** Per [federation-convergence](../theorems/federation-convergence.md) and the inherited CRDT framework, federation is convergent under arbitrary delivery orderings; coordinated writes are reserved for the small fraction of operations that truly require single-source-of-truth.
- **Cost discipline is read off the closure-operator regime, not measured at runtime.** Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), composition costs read off the operators' regime classification; engineers can predict cost from substrate structure.

## What is *not* inherited

Some commitments of upstream substrate theory are *not* preserved by predicated computing's structural framing. Naming them is part of the discipline:

- **The choice of bilattice.** Belnap's four-valued bilattice is one realisation; richer bilattices (the [adjoint-structure-spo-bilattice](../references/adjoint-structure-spo-bilattice.md) reference's residuated bilattices, the unit-interval-based fuzzy bilattices, the probabilistic bilattices) are admissible. A substrate committing to one bilattice (the [filesystem-backed-substrate example](../examples/filesystem-backed-substrate.md) commits to Belnap's by default) is one instance; richer choices remain admissible.
- **The choice of provenance semiring.** Boolean-bag-set-why-where-how semirings each give different audit content; the substrate commits to *some* provenance discipline existing without committing to which. The [provenance-semiring-witness](../teaching/explanations/provenance-semiring-witness.md) concept admits the parameterisation.
- **The choice of closure-rule language.** Datalog-with-negation, ASP, recursive-Horn, modal-Datalog, and bilattice-Datalog are all admissible; the substrate's [closure-rule wire format](../teaching/explanations/closure-rule-wire-format.md) commits to a serialisation discipline without committing to a specific surface syntax.
- **The choice of consensus protocol.** Paxos, Raft, multi-Paxos, EPaxos, and modern BFT protocols are admissible; the substrate's distributed-coordination platform commits to *some* quorum-protocol existing without specifying which a deployment chooses.
- **The choice of scope discipline.** The substrate's scope-as-predication discipline is one realisation; richer scope frameworks (per [stewardable-concept-universes](../learning/questions/stewardable-concept-universes.md)) remain open. A substrate committing to one scope discipline is one instance; alternatives are admissible.
- **The choice of CRDT shipping discipline.** State-shipping, operation-shipping, and delta-state shipping are each admissible; the substrate commits to *some* discipline existing without specifying which.
- **The choice of admission discipline at the boundary.** The substrate's [boundary](../teaching/explanations/boundary.md) is one structural decomposition; specific admission policies (schema-conformance, doctrine-fidelity, witness-required) are per-deployment.
- **The choice of self-representation depth.** The substrate's [self-representation](../teaching/explanations/self-representation.md) commitment is open over depth: a substrate may commit to first-order self-representation (closure-rules are substrate cells), to higher-order (closure-rules-on-closure-rules are substrate cells), or to fully-reflective. The [self-representation-completeness](../learning/questions/self-representation-completeness.md) open question records the gap.

These un-inheritances are *features*, not bugs: they are the parameters by which the structural framing adapts to different deployments. A structural framing that imposed any of them would be less general than the discipline it claims to formalise.

## What the parent gains by adopting the substrate

The parent traditions are enriched, not replaced, by the predicated-computing framing committed to here. What they gain:

- **A substrate-level reading of every primitive.** Relations, derivations, fixpoints, replication, consensus, substitution, witnesses, and modal knowledge become substrate-level operations rather than per-system implementations.
- **A composability discipline across the parent traditions.** The relational-algebra tradition, the bilattice-AI tradition, the situation-calculus tradition, the CRDT-replication tradition, the consensus-protocol tradition, the categorical-logic tradition, the provenance-tracking tradition, and the multi-agent-knowledge tradition all live on the same substrate and federate via the same operations.
- **A regime classification of substrate operations.** The four-regime substrate classification (per [regime-discipline](regime-discipline.md)) provides a structural-mathematical taxonomy of operator families that no upstream tradition supplies on its own.
- **An operational binding to working systems.** The corpus's own [pypredcomp](../../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/) substrate implementation realises the discipline directly; per the [filesystem-backed-substrate](../examples/filesystem-backed-substrate.md) and [distributed-predicated-runtime](../examples/distributed-predicated-runtime.md) examples, the discipline holds at instances.
- **A mathematical reformulation in [predication-categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) that proves theorems the engineering register would otherwise have to assert.** Per [composability-with-predication-categories](composability-with-predication-categories.md), the engineering and math content describe the same object from different angles.
