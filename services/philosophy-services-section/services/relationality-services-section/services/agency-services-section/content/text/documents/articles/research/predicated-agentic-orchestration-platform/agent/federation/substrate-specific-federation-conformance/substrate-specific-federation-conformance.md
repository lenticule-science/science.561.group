---
type: question
status: open
explores:
  - ../../../theorems/federation-convergence.md
  - ../../../morphisms/merge.md
  - ../objects/agentic-orchestration-platform.md
see-also:
  - theories/flatfile-agentic-resource-system/theorems/flatfile-federation-equivalence.md
  - ../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md
  - ../examples/mash-rust-engine.md
title: What is the schema for proving a substrate-specific federation operator conforms to federation-convergence?
description: "The parent theory's federation-convergence is stated abstractly: any two substrates sharing a closure-rule system, value-domain, predicate category, and entity set, exchanging reified-event streams in any order, converge to…"
---

# What is the schema for proving a substrate-specific federation operator conforms to federation-convergence?

The parent theory's [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) is stated abstractly: any two substrates sharing a closure-rule system, value-domain, predicate category, and entity set, exchanging reified-event streams in any order, converge to $\mathrm{cl}_p(\bigvee_k U)$ cellwise.
The parent's [merge](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md) is the substrate-side instance of the cellwise $\vee_k$.

But AgOP examples each commit to their own *substrate-specific* federation operators — at substrate-specific record shapes, with substrate-specific admission disciplines, over substrate-specific transports.
The flatfile sub-theory ([FARS](theories/flatfile-agentic-resource-system/_index.md)) commits to `merge-peer`, `emit-federation-envelope`, `admit-federation-envelope`, and `replay-from-peer`, with `FederationEnvelopeRecord` and `PeerRecord` substrate records, over canonical-JSON envelopes with ed25519 signatures.
The Rust [`mash-rust-engine`](../../../mash-rust-engine/mash-rust-engine.md) example will commit to its own federation operator at its own record shapes.
A future hosted-database AgOP realization would commit to row-update streams and SQL-side merges.
Each realization needs to demonstrate that its substrate-specific operator *conforms* to the parent theorem.

## Statement

> What *substrate-side obligations* must a substrate-specific federation operator discharge to claim conformance to [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), can the obligations be discharged once at the AgOP layer with substrate-specific realisations citing the AgOP-level proof, and what is the relation to mechanical verification?

## Decomposition

### Sub-question A — What are the obligations a conformant operator discharges?

The candidate obligations, each named by the parent theorem's proof structure:

- **Operator factors as $\mathrm{cl}_p \circ \vee_k$ at the substrate's value-domain instantiation.** The substrate-specific operator's net effect on substrate state must equal: take the cellwise $\vee_k$-join of the local state and the inbound predications, then apply the receiver's closure-rule system.
  The proof is the operator's *factorisation lemma*: the operator's body decomposes into a merge step and a closure-step, in that order, with no other state-changing operations in between.
- **Operator dedupes envelopes by content-hash.** The substrate-specific record (FARS's `FederationEnvelopeRecord`, the rust-engine's envelope type, etc.) must carry a content-hash that uniquely identifies the envelope's payload; the operator must reject envelopes whose hash matches a previously-admitted envelope's.
  The proof is the *idempotence lemma*: applying the operator to an envelope already in the substrate is the substrate-state-identity.
- **Closure-rule system applied at the receiver is the receiver's own.** Per [sovereign-node](../../../flatfile-agentic-resource-system/architecture/sovereign-node/sovereign-node.md), a federation operator must not import the *sender's* closure-rules into the receiver's substrate; the receiver retains derivation autonomy.
  The proof is the *sovereignty lemma*: the operator's closure-step uses the receiver's $\mathcal{S}$, not the sender's, even when the inbound envelope was generated under a different $\mathcal{S}$.
- **Operator preserves witness-chain integrity.** Each predication admitted via the operator carries a witness identifying the originating agent (or peer) and the envelope's signature; the substrate's witness-chain after merge is the merge of the local witness chain and the inbound witness chain, with no re-attribution.
  The proof is the *witness-faithfulness lemma*: the operator commutes with the witness-extraction operator.
- **Operator commutes with closure-rule firings on the local side.** A closure-rule firing on the local substrate before merge produces the same final substrate state as a firing after merge (modulo the merge's effect on the firing's premises).
  The proof is the *commutation lemma*: per the parent theorem, the closure operator and the merge are jointly Scott-continuous.

The sub-question: are these the *complete* obligations, or are there additional ones the parent theorem implicitly assumes?
Specifically: does the parent theorem assume any operator monotonicity beyond what the bilattice's $\vee_k$ provides?
Does it assume any cardinality bound on the inbound stream?

### Sub-question B — Can the obligations be discharged once at the AgOP layer?

Per [doctrine-fidelity-via-faithful-interfacer-functor](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/doctrine-fidelity-via-faithful-interfacer-functor.md), interfacers preserve substrate properties through faithful functors.
A similar pattern may apply to federation operators: every conformant federation operator is a *faithful interfacer* over the abstract `merge`, and the conformance schema is the requirement of faithful-interfacer-ship.
The candidate dispositions:

- **Yes, via a single AgOP-level conformance theorem.** The AgOP layer states: "an operator $F$ conforms to federation-convergence iff $F$ is a faithful interfacer over `merge` in the sense of doctrine-fidelity, with the additional sovereignty obligation".
  The substrate-specific realisations cite this theorem and exhibit the faithful-interfacer instance for their record-shape types.
  The proof-burden per realisation is reduced to *exhibit the interfacer functor*, not *re-prove convergence*.
- **No, because substrate-specific value-domain instantiations differ in essential ways.** Different AgOP realisations may instantiate the substrate's value-domain differently (FARS uses the four-bilattice directly; the rust-engine may use a richer pre-bilattice with additional dimensions; a hosted-database realisation may use a SQL-typed lattice).
  The functor-based factoring requires the value-domains to be *equivalent* under the interfacer; if they aren't, each realisation needs its own bespoke convergence proof.
- **Partially: the abstract obligations factor; the value-domain commitment doesn't.** The five obligations of sub-question A factor cleanly into a faithful-interfacer commitment; the value-domain instantiation is a separate parameter each realisation must specify, and the parent theorem applies under the realisation's value-domain assumed to be a valid bilattice instance.

The sub-question: which disposition holds?
The first is the strongest discipline (single proof, many instantiations); the third is the most realistic (some factoring, some bespoke).

### Sub-question C — What is the relation to mechanical verification?

The parent's `federation-convergence` cites Lean evidence (`applyWrites_perm_invariant` per the parent theorem's body).
A substrate-specific equivalence claim could discharge its obligations by exhibiting a Lean instance of the AgOP-level conformance functor at the substrate's specific record-shape types.
The candidate disciplines:

- **Per-realisation Lean instance.** Each substrate-specific realisation provides its own Lean development that instantiates the parent's `applyWrites_perm_invariant` (and any AgOP-layer extension) at the realisation's record-shape types.
  The discipline is the strongest evidence per realisation but is bespoke per realisation.
- **AgOP-layer Lean instance plus realisation-specific witnesses.** The AgOP layer provides one Lean development of the faithful-interfacer-based conformance; each realisation provides a Lean module that instantiates the AgOP layer's types at its specific record shapes.
  The discipline factors the proof-burden as sub-question B's first disposition does; the Lean machinery supports this kind of generic-instantiation pattern via type-classes.
- **Property-based testing per realisation, formal verification at the AgOP layer.** The AgOP layer is formally verified; each realisation discharges its conformance via property-based-testing instances of the conformance properties on the realisation's record shapes.
  The discipline is operationally cheap per realisation but provides weaker evidence than full Lean instantiation.

The sub-question: which discipline is canonical?
FARS's [flatfile-federation-equivalence](../../../flatfile-agentic-resource-system/flatfile-federation-equivalence/flatfile-federation-equivalence.md) is currently `status: sketch`; what would the formal-verification follow-up look like?

### Sub-question D — How does conformance interact with the substrate-specific transport's failure modes?

The parent theorem assumes the transport delivers reified events; it is silent on transport failures (envelopes lost, duplicated, delayed beyond a horizon, partially-corrupted).
Real federation operators handle these.
The candidate dispositions:

- **Failures are out-of-scope: the conformance schema applies to delivered envelopes only.** The realisation handles failures via retry, retransmission, gossip protocols; the conformance theorem speaks only to the substrate-state-effect of *successfully-delivered* envelopes.
  The discipline cleanly separates substrate-correctness from transport-engineering.
- **Failures are in-scope: the conformance schema requires bounded-failure-tolerance.** The realisation must demonstrate that its substrate-state converges to the parent theorem's $\mathrm{cl}_p(\bigvee_k U)$ *given any* finite-failure transport (where 'failure' means lost-and-retried, duplicated, delayed, or partially-corrupted-then-retransmitted).
  The discipline is more demanding but matches engineering reality.
- **Failures are partially in-scope: lost-and-retried envelopes are in-scope (idempotence handles them); other failure modes are out-of-scope.** The realisation must demonstrate idempotence (sub-question A's idempotence lemma covers this) but is not required to prove convergence under arbitrary failure modes.

The sub-question: which disposition is canonical?
The third is the operational compromise; the second is the principled commitment.

## What is established

- The parent theorem [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) is `status: proved` with Lean evidence; the abstract claim is settled.
- The parent theorem's proof structure (per its body) factors through the bilattice's $\vee_k$-as-merge result and the closure-operator's monotonicity; both are well-established in the [predication-categories](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) math parent.
- FARS's [flatfile-federation-equivalence](../../../flatfile-agentic-resource-system/flatfile-federation-equivalence/flatfile-federation-equivalence.md) sketches the first instance of a substrate-specific equivalence claim; the sketch identifies the obligations roughly aligned with sub-question A's list.
- The [doctrine-fidelity-via-faithful-interfacer-functor](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/doctrine-fidelity-via-faithful-interfacer-functor.md) theorem provides the categorical machinery for sub-question B's first disposition, if the dispositions factors.
- The corpus's discipline for `status: sketch` theorems being upgrade-targets for full proofs is established; FARS's sketch is exactly such a target.

## What remains open

- Whether sub-question A's five obligations are complete, or whether additional obligations (operator monotonicity beyond $\vee_k$, cardinality bounds, transport assumptions) need to be added.
- Which of sub-question B's three dispositions (full factoring / no factoring / partial) holds for the AgOP family of realisations.
- Which of sub-question C's three mechanical-verification disciplines (per-realisation / factored / property-based) is canonical, and whether the AgOP layer commits to a specific Lean development pattern.
- Which of sub-question D's three transport-failure dispositions is canonical, and how the chosen disposition interacts with the substrate's witness-chain when failures occur.
- Whether *conformance is itself an AgOP-substrate predication* — i.e., whether each realisation's conformance claim is a substrate-resident `conformance-record` entity that the federation graph can read, allowing federation-time conformance-checking across deployments.
- The interaction with [agent-community-consensus](../../agent-community/agent-community-consensus/agent-community-consensus.md) when federation imports envelopes from a *non-conformant* peer — does the substrate's $\top$-pressure detect this, or must conformance be checked at envelope-admission time?

## Why it matters

Resolving this question would settle four downstream commitments:

1. **The proof-burden across the AgOP family.** If sub-question B's first disposition holds, every future AgOP realisation discharges conformance by exhibiting a faithful-interfacer instance — a tractable engineering deliverable.
  If the third disposition holds, each realisation carries its own bespoke convergence proof — a much heavier burden.
2. **The strength of [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) at the working scale.** As written, the parent theorem is abstract; without per-realisation conformance schemas, the theorem's claims do not transfer to working federation operators with confidence.
3. **The portability of agential content across realisations.** Two realisations whose conformance is established via the same AgOP-layer schema can share agential content (skills, runbooks, governance decisions, agent communities) with the substrate-state guarantees of the parent theorem.
  Without a settled schema, sharing is per-pair-negotiated.
4. **The mechanical-verification discipline for AgOP.** The corpus's `status: proved` discipline is upheld by Lean evidence at the parent layer; resolving sub-question C would establish whether AgOP carries the discipline forward at the realisation layer or weakens it.

A tractable next step is to take FARS's existing sketch theorem and discharge each of sub-question A's five obligations as a separate sub-lemma; the discharged sketch would either lift to `status: proved` directly or expose precisely which obligations the sketch cannot discharge — both outcomes resolve the question to a degree.
The sketch theorem becomes the worked example against which the schema is tested.
