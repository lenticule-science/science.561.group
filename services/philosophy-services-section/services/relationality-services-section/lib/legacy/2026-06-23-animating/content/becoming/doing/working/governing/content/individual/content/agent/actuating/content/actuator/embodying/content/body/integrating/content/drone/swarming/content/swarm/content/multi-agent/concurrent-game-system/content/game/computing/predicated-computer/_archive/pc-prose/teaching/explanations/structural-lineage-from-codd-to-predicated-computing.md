---
type: narrative
status: current
recaps:
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
discusses:
  - ../teaching/explanations/closure-rule.md
  - ../teaching/explanations/witness.md
  - ../teaching/explanations/two-store-coherence.md
  - ../teaching/explanations/conformance.md
  - ../objects/event-log.md
  - ../objects/closure-rule-system.md
  - ../theorems/federation-convergence.md
  - ../theorems/closure-rule-system-realizes-closure-2-monad.md
see-also:
  - upstream-predication-logic.md
  - upstream-substrate-coordination.md
  - what-predicated-computing-inherits.md
  - composability-with-predication-categories.md
---

# From Codd to predicated computing — and what each step bought

The line from Codd's relational model (1970) through Datalog and the recursive-query renaissance (1977–1995), Belnap-Ginsberg-Fitting bilattice semantics (1977–2006), McCarthy-Hayes-Reiter situation calculus and successor-state axioms (1969–2001), Shapiro et al. CRDTs (2011) and Almeida-Baquero-Shapiro delta-state CRDTs (2018), Lamport-Paxos (1998) and Ongaro-Ousterhout Raft (2014), Jacobs's categorical logic (1999) and Green-Karvounarakis-Tannen provenance semirings (2007), through Fagin-Halpern-Moses-Vardi distributed knowledge (1995), is not a parade of competing schools. Each step on the line was taken in service of a real *engineering problem* that the prior step could not solve; every step that survived did so because the next problem in the line could not be addressed without it; the discipline of *predicated computing* as it now stands is what the accumulated engineering commitments look like when read structurally.

This narrative reads the upstream literature already catalogued under [upstream-predication-logic](upstream-predication-logic.md) and [upstream-substrate-coordination](upstream-substrate-coordination.md) *as a chain of required steps* rather than as topical surveys. The two existing narratives remain the broader inventories; this narrative names the surviving line. The shape mirrors [from-frege-to-fars](../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/narratives/from-frege-to-fars.md), [from-church-to-roc](../theories/functional-runtime-platform/narratives/structural-lineage-from-church-to-roc.md), and [structural-lineage-peirce-to-lotman](../../../../../../../science/theories/linguistics/theories/semiotics/narratives/structural-lineage-peirce-to-lotman.md).

## Codd solves the *data-as-relation* problem

Pre-Codd database systems addressed data through navigational pointers: the application traversed the data structure following hierarchical or network links. The structural problem: the application's correctness was bound to the storage layout; changing the schema broke every query that traversed it; reasoning about data by reasoning about pointers does not scale. Set-theoretic reformulations existed but had no engineering uptake.

Codd's move (1970) was the *relational model*: data is a set of tuples in a typed relation; queries are expressed as relational-algebra operations (selection, projection, join, union, difference) on those tuples; the storage layout is *not part of the model* and may change without affecting query semantics. The structural argument is the *physical-data-independence theorem*: any correct query evaluator may choose any storage layout that supports the algebra; the application sees only the algebraic surface.

Predicated computing inherits Codd's commitment to *data-as-typed-relation* directly: the substrate's [predication-graph store](../objects/predication-graph-store.md) is a set of $(s, p, o)$ predication cells, structurally a relation over (subject, predicate, object) types. Without Codd's separation of model from storage, the substrate's [content-addressed store](../objects/content-addressed-store.md) and the parallel [event log](../objects/event-log.md) could not be alternative realisations of the same model; the substrate's [two-store coherence](../teaching/explanations/two-store-coherence.md) discipline depends on the model-vs-storage separation.

## Datalog solves the *recursive-derivation* problem

Codd's relational algebra is finite-step: every query terminates because the algebra has no fixed-point operator. The structural problem: many useful derivations are *recursive* — transitive closure, ancestor chains, reachability — and require iterating a derivation rule until no new facts appear. Pure relational algebra cannot express these without external loop control.

The Datalog tradition (per [Abiteboul-Hull-Vianu 1995](../references/abiteboul-hull-vianu1995.md)) added the *Horn-clause derivation rule* with a least-fixpoint semantics: a rule schema $p(\bar{x}) \leftarrow q_1(\bar{x}_1), \ldots, q_n(\bar{x}_n)$ derives $p$-tuples from $q_i$-tuples; the program's meaning is the least set of facts closed under all the rules. The structural argument is the *Knaster-Tarski fixpoint theorem* applied to the immediate-consequence operator: monotone operators on finite lattices have least fixpoints, computable by bounded iteration.

Predicated computing inherits Datalog's commitment to *closure-rule-as-derivation-schema* directly: the substrate's [closure-rule](../teaching/explanations/closure-rule.md) is structurally a Horn clause with a substrate-recorded conclusion; the substrate's [closure-rule system](../objects/closure-rule-system.md) is structurally a Datalog program; the substrate's [settle](../morphisms/settle.md) operation is structurally the least-fixpoint computation. Without the Datalog tradition, the substrate's recursive-derivation discipline would have no formal ground.

## Belnap-Ginsberg-Fitting solve the *paraconsistent-derivation* problem

Datalog's least-fixpoint semantics is two-valued: every derivable fact is true; every non-derivable fact is false (under closed-world assumption) or unknown (under open-world). The structural problem: many real-world systems must reason in the presence of *contradictory* evidence — federated knowledge bases that disagree, sensors that report incompatible measurements, contested community judgements — and two-valued semantics either silently absorb the contradiction (under CWA) or refuse to derive anything (under classical entailment).

Belnap's move (1977; per [belnap1977](../references/belnap1977.md)) was the *four-valued bilattice* $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$: $\bot$ is "no evidence either way," $\top$ is "evidence both ways," $\mathbf{t}$ and $\mathbf{f}$ are settled; meet on the truth-axis is conjunction; meet on the knowledge-axis is consensus. Ginsberg (1988; per [ginsberg1988](../references/ginsberg1988.md)) generalised to *arbitrary bilattices* as a uniform framework for paraconsistent AI inference. Fitting (2006; per [fitting2006](../references/fitting2006.md)) developed *bilattice-fixed-point semantics for logic programs*: the immediate-consequence operator is monotone in the knowledge ordering, so least-knowledge fixpoints exist, but disagreements register as $\top$-cells rather than as silent absorption.

Predicated computing inherits the bilattice-fixpoint discipline as the *value-domain* of every substrate cell: per [paraconsistency-as-substrate-discipline](../theorems/paraconsistency-as-substrate-discipline.md), substrate cells take values in a bilattice (Belnap's by default; richer bilattices admissible per the [adjoint-structure-spo-bilattice](../references/adjoint-structure-spo-bilattice.md) reference); per [bilattice-operation-table](../teaching/explanations/bilattice-operation-table.md), the operations admit a tabular substrate-level realisation. Without Belnap-Ginsberg-Fitting, the substrate would have no principled way to record disagreement; federation across substrates that disagree (per the next step) would either silently lose evidence or refuse to compose.

## McCarthy-Hayes and Reiter solve the *state-as-history* problem

Bilattice fixpoints over a Datalog program produce a *static* derived state. The structural problem: real systems *change*, and the derivation must be parameterised by *what has happened so far* — the action history — without committing to a specific state representation that the next action would invalidate.

McCarthy-Hayes (1969; per [mccarthy-hayes1969](../references/mccarthy-hayes1969.md)) introduced the *situation calculus*: actions transform situations; predicates are evaluated relative to a situation; the frame, qualification, and ramification problems name what such a calculus must address. Reiter (2001; per [reiter2001](../references/reiter2001.md)) developed the mature successor-state axiom discipline: each fluent has a single axiom expressing how it changes under any action; the axiom is a closure-rule with the situation as one of its arguments.

Predicated computing inherits Reiter's successor-state discipline as the substrate's *event log*: per [event-log](../objects/event-log.md), the substrate's state at history $t$ is the deterministic projection of the rigorous event sequence ending at $t$; per [closure-rule](../teaching/explanations/closure-rule.md), every substrate closure-rule is structurally a successor-state axiom; per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), replay from the event log produces the byte-identical state. The history-as-record commitment is the substrate's *answer to the frame problem*: nothing changes that the event log does not record.

## Shapiro et al. and Almeida-Baquero-Shapiro solve the *concurrent-edit-without-coordination* problem

A bilattice-Datalog substrate with an event log handles single-replica state evolution. The structural problem: real systems *replicate* across machines for availability and locality, replicas accept writes concurrently, and the system must converge without requiring inter-replica coordination on every write.

Shapiro et al. (2011; per [shapiro-et-al2011](../references/shapiro-et-al2011.md)) introduced the *conflict-free replicated data type* (CRDT) framework: a value-domain with a commutative-idempotent join operation; a replication discipline that ships state-or-operations; a *strong-eventual-consistency* theorem stating that all replicas reaching the same set of operations converge to the same state, regardless of delivery order. Almeida-Baquero-Shapiro (2018; per [almeida-baquero-shapiro2018](../references/almeida-baquero-shapiro2018.md)) developed *delta-state CRDTs* — shipping just the delta since the last sync — which made CRDTs production-practical on bandwidth-constrained networks.

Predicated computing inherits the CRDT discipline as its *federation* primitive: per [federation-convergence](../theorems/federation-convergence.md), the substrate's value-domain (a bilattice) joins commutatively-idempotently, so the substrate-as-CRDT-instance theorem holds at the value-domain level; per [federation-bridge](../objects/federation-bridge.md), the bridge ships substrate-deltas using the Almeida-Baquero-Shapiro shape. Without the CRDT framework, federation would require either a global clock (per the consensus protocols below) or coordinated writes, neither of which is admissible at substrate scale.

## Lamport, Ongaro, and Ousterhout solve the *single-source-of-truth-when-needed* problem

CRDTs converge without coordination but cannot enforce *exclusive* commitments — two replicas concurrently allocating the same identifier, two replicas concurrently committing incompatible governance decisions. The structural problem: some substrate operations require *single-source-of-truth* semantics, and the substrate must offer a discipline for those without forcing every operation through it.

Lamport's *Paxos* (1998; per [lamport1998](../references/lamport1998.md)) established the canonical fault-tolerant consensus protocol: a quorum-based two-phase commit that tolerates $f$ failures with $2f + 1$ participants. Ongaro-Ousterhout's *Raft* (2014; per [ongaro-ousterhout2014](../references/ongaro-ousterhout2014.md)) made the consensus protocol *understandable*: the protocol's decomposition into leader election, log replication, and safety is teachable and implementable without the Paxos paper's notorious indirectness.

Predicated computing inherits the consensus discipline at the [distributed-coordination-platform](../theories/distributed-coordination-platform/) sub-theory: when the substrate needs single-source-of-truth (allocating substrate identifiers, electing the canonical metadata replica, deciding shard membership), it invokes a Raft-shaped quorum protocol; otherwise it uses the CRDT-shaped federation. The substrate's two-tier discipline (CRDT for free-flowing state, consensus for exclusive commitments) inherits both upstream lines.

## Jacobs solves the *substitution-and-quantification* problem

Substrate operations on a bilattice-Datalog substrate with federation and consensus carry typed predications. The structural problem: predications are *parameterised* (a closure-rule's premise carries variables; substitution gives the rule's instantiation; quantification is the closure of substitution); pre-Jacobs treatments of these in computer science were fragmentary, with each system reinventing variable-capture, scope, and quantifier semantics.

Jacobs (1999; per [jacobs1999](../references/jacobs1999.md)) gave the canonical textbook of *fibred categorical logic*: a hyperdoctrine consists of a base category of types, a fibred category of predicates over each type, reindexing-functors-as-substitution along base morphisms, and adjoints to substitution as the quantifiers (existential as left adjoint, universal as right adjoint). The substitution-quantifier coherence is the *Beck-Chevalley condition*. The framework formalises every substitution-and-quantification system as a hyperdoctrine; specific systems (first-order classical, intuitionistic, linear, modal) are specific hyperdoctrines.

Predicated computing inherits Jacobs's hyperdoctrinal apparatus directly: the substrate is a [predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md); per [extend-restrict-adjoint](../teaching/explanations/extend-restrict-adjoint.md), substitution and its adjoints structure substrate operations; per [join-reordering-via-beck-chevalley](../theorems/join-reordering-via-beck-chevalley.md), the substitution-quantifier coherence is what makes substrate query optimisation sound. Without Jacobs, the substrate's substitution discipline would have no formal account that scaled to all the substrate's higher-order constructions.

## Green-Karvounarakis-Tannen solve the *why-this-tuple-holds* problem

Substrate cells under hyperdoctrinal substitution and bilattice fixpoint produce derived predications. The structural problem: a derived predication can be *true for many reasons*; an audit must trace back to *which* derivation, *which* sources contributed, *what* upstream evidence supports the conclusion. Pre-Green derivation systems either tracked one derivation (losing alternatives) or all derivations (losing tractability).

Green-Karvounarakis-Tannen (2007; per [green-et-al2007](../references/green-et-al2007.md)) introduced the *provenance-semiring* framework: derivations are values in a commutative semiring whose elements record alternative derivations as sums, sequential composition as products. Different semirings give different audit content (boolean / Bag / set / why / where / how provenance); the semiring algebra is the right abstraction.

Predicated computing inherits the provenance-semiring discipline as the *witness* discipline: per [provenance-semiring-witness](../teaching/explanations/provenance-semiring-witness.md), a substrate witness is a value in a chosen provenance semiring; per [witness](../teaching/explanations/witness.md), every substrate-derived cell carries a witness recording its derivation. Without Green-Karvounarakis-Tannen, the substrate's audit discipline would have to choose between recording one derivation (losing the why-also-true-by-X content) and recording all derivations (losing query tractability).

## Fagin-Halpern-Moses-Vardi solve the *what-each-replica-knows* problem

Federation across replicas with witness-tracked provenance produces a multi-replica substrate. The structural problem: an external observer must reason about *what each replica knows* (and what they jointly know, and what is common knowledge among them); without a discipline for this, federation appears as a black box from outside.

Fagin-Halpern-Moses-Vardi (1995; per [fagin-halpern-moses-vardi1995](../references/fagin-halpern-moses-vardi1995.md)) gave the canonical textbook of *reasoning about knowledge in multi-agent systems*: each agent has a knowledge-relation; $K_i \phi$ means "agent $i$ knows $\phi$"; common knowledge is the reflexive-transitive closure of mutual knowledge; the modal logic S5 of multi-agent knowledge has decidable model-checking on finite structures.

Predicated computing inherits the modal-knowledge discipline at the substrate's *scope* level: per [scope-as-predication](../narratives/scope-as-predication.md), an agent's knowledge is its substrate's predications visible at its scope; per [belief-base-as-fiber-restriction](../theories/agential-orchestration-platform/concepts/belief-base-as-fiber-restriction.md), an agent's belief base is the fiber-restriction over its scope; common knowledge under federation is the predication-set that converges identically across all federated scopes. The S5 modal apparatus is the upstream language; the substrate's modal-restriction operator (per the resolved [modal-operators-on-substrate](../learning/questions/modal-operators-on-substrate.md) question) is its substrate-side counterpart.

## What the line accumulates

Reading from Codd to predicated computing, the discipline accumulates nine structural commitments:

| Step | Problem | Commitment | What the successor would lack |
|---|---|---|---|
| Codd | data-vs-storage entanglement | data-as-typed-relation | no separation of model from storage layout |
| Datalog | recursive derivation absent in pure algebra | closure-rule with least-fixpoint | no formal ground for recursive substrate operations |
| Belnap-Ginsberg-Fitting | two-valued semantics absorbs contradiction silently | bilattice value-domain with paraconsistent fixpoint | no principled record of disagreement |
| McCarthy-Hayes-Reiter | state representation invalidated by next action | event-log + successor-state axioms | no answer to the frame problem |
| Shapiro et al. + ABS | concurrent edits require coordination | CRDT framework with delta-shipping | no replication without inter-replica coordination |
| Lamport-Raft | exclusive commitments need single source of truth | quorum consensus protocol | no discipline for substrate identifiers, governance commitments |
| Jacobs | substitution-quantification ad-hoc per system | hyperdoctrinal substitution + Beck-Chevalley | no formal account of substrate substitution |
| Green-Karvounarakis-Tannen | derivation tracking either lossy or intractable | provenance-semiring witness | no scalable audit of derivation alternatives |
| Fagin-Halpern-Moses-Vardi | federation appears black-box from outside | modal-knowledge discipline at scope level | no external reasoning about what replicas know |

Each step is required for what comes after. The accumulated commitment is what the discipline *is*; each commitment becomes a substrate-level operation that the parent [predication-categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) math reformulation gives the formal apparatus for, per [composability-with-predication-categories](composability-with-predication-categories.md).

Predicated computing as it stands is not a parade of competing database architectures; it is the line of accumulated commitments that, taken together, constitutes a substrate-level computer whose primitive is the predication rather than the addressed memory cell.
