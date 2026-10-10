---
title: "Next-stretch plan: v0.4 federation → v0.5 industrial control → v0.6 SDK"
description: "Continuation of next-stretch.md across the next three milestones. Same shape: each stage names the predicated-computing or predication-categories theorem that authorises it, the procedural steps, the conformance proof, and what the stage unlocks for the next. Where the dev-doc prose has historically reached for phantom theorems (per the 2026-05-03 round-1 and round-2 theory-side research notes), this plan cites the real on-disk theorem the prose actually intended."
kind: implementation-guide
status: active
authority: "theories/.../predicated-computing/, theories/.../predication-categories/, milestones/, decisions/, surveys/theory-side-research-notes-2026-05-03*.md"
---

# Next-stretch plan — v0.4 → v0.6

This document is the **continuation** of [next-stretch.md](next-stretch.md) (which threads v0.2a residual → v0.2b → v0.3 on-ramp).
Read [next-stretch.md](next-stretch.md) first; the cross-cutting threads A–E declared there continue to apply, and three further threads F, G, H are added at the end of this document for the longer horizon.

The same discipline applies: each stage names a theorem grounding, procedural steps, conformance proof, and the capability the stage unlocks for the next.
If you cannot reconstruct the chain (theorem → spec → ship target) for a stage, the plan is wrong, not the theory — surface it.

This stretch is also where the dev-doc prose has historically reached for theorems that do not exist on disk.
The two theory-side research notes — [`surveys/theory-side-research-notes-2026-05-03.md`](../surveys/theory-side-research-notes-2026-05-03.md) (round 1) and [`surveys/theory-side-research-notes-2026-05-03-round-2.md`](../surveys/theory-side-research-notes-2026-05-03-round-2.md) (round 2) — discharge most of those phantoms by showing the substantive content is already in published theorems. **This plan cites the real theorems**, not the phantoms, and links each citation to the survey section that justified the substitution.

## How this plan was derived

In addition to the three forces named in [next-stretch.md §"How this plan was derived"](next-stretch.md#how-this-plan-was-derived), one further force shaped this stretch:

4. A **survey-discharged corollary** that replaces a previously-cited phantom theorem.
  Where a stage below cites e.g. `cell-set-fold-as-graded-dispatch-specialization`, the survey section authorising the citation is named inline; if the corollary itself has not yet been authored as a published math entity, the stage cites the underlying real theorem (`graded-dispatch-via-q-enriched-fusion`) and notes the corollary as the convenient handle.

The convention: **never cite a name that is not on disk.** When prose calls out a corollary that has not been authored yet, cite the underlying published theorem and the survey section that derives the corollary, not the corollary's slug.

---

## Stage 0 — Where this stretch begins

This stretch begins after [next-stretch.md Stage 3](next-stretch.md#stage-3--v03-on-ramp) closes:

- v0.3 is shipped; bundled userland boots in the base image.
- The captain accomplishes one daily task end-to-end through the OS that v0.2 could not support.
- The trusting-trust witness chain (3A) is wired; the substrate self-hosts (3C).
- Each app is a (driver-cell + verb-extensions + dashboard view) tuple per [next-stretch.md §3B](next-stretch.md#3b-first-bundled-apps-as-driver--verb--dashboard-tuples).

The procedural question this plan answers from here is: **what is the smallest forward sequence of landings that makes v0.6 (third-party SDK) reachable, given that v0.4 (federation) and v0.5 (industrial control) sit between?**

---

## Stage 4 — v0.4 federation

Reach state per [milestones/v0.4-federation.md](../milestones/v0.4-federation.md): two OS instances exchange events under a real wire protocol; $\odot$-merge produces consistent fibers where peers agree and $\top$ where they disagree; ActivityPub edge into the fediverse; Matrix S2S; selective sync; trust graphs as cells.

The algebraic federation contract is already proved in [next-stretch.md §2E](next-stretch.md#2e-network-protocol-stubs-algebraic-specs-eager). v0.4 lifts the in-memory peer-share fixture replay to a wire protocol without renegotiating the algebra.

### 4A. Lift the algebraic federation contract to the wire

**Theorem grounding.** [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) plus [`transport-tolerance-of-federation`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transport-tolerance-of-federation.md).
Federation correctness is a property of the merge algebra, not the transport; the wire format must therefore be a *faithful interfacer* (per [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md)) for the algebra to lift.

**Procedural steps.**

1. Replace the deferred stub at `specs/network/federation-protocol.md` with the wire normative spec.
  Cite [decisions/federation-by-construction.md](../decisions/federation-by-construction.md) and the gate-5 algebraic conformance from v0.2b.
2. Implement the protocol in [`src/network/federation/`](../../../src/network/) as a driver-cell per [next-stretch.md §2A](next-stretch.md#2a-driver-model-under-faithful-interfacer-functor): `kind: driver, kind-of-driver: federation-peer`.
  The `respond` reduction is `apply` for inbound events and `extract` for outbound; the counit law is the round-trip property `extract ∘ apply = id` per the doctrine-fidelity discipline.
3. Wire the in-memory peer-share fixture from v0.2b's pt-01 to run *additionally* over the new transport.
  The same fixture, the same fiber-state-equality assertion — only the transport changes.
4. Add `tests/conformance/test_federation_two_node_wire.py` exercising gate 2 of v0.4.

**Conformance proof.** Gate 2 of v0.4 closes when two real nodes (subprocess, container, or two CI runners) reproduce the in-memory fixture's fiber-state-equality.

**Enables next.** ActivityPub (4B), Matrix S2S (4C), and the trust-graph machinery (4E) all assume the algebraic merge is *already* lifted to a wire.
Without 4A, each of those would re-derive its own merge semantics, and the algebra would diverge silently.

### 4B. ActivityPub edge as a doctrine-conformant interfacer

**Theorem grounding.** [`doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) plus [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md).
ActivityPub is one upstream surface; the substrate's commitment is a faithful functor between the ActivityPub object category and the substrate category.
Round-trip fidelity is the counit law.

**Procedural steps.**

1. Author [specs/network/activitypub.md](../specs/network/activitypub.md) citing the W3C ActivityPub spec.
  The substrate ↔ ActivityPub object map (Note ↔ post-cell; Actor ↔ persona-cell; Follow ↔ trust-graph-edge-cell) is the substrate-side declaration of the interfacer functor.
2. Implement [`src/drivers/activitypub/`](../../../src/drivers/) as a driver-cell per 2A's discipline.
  Per the survey-discharged result (round-2 §2.3), the SDK / network non-amplification claim is the composition of [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) with `interfacer-counit-law-uniformity`; the ActivityPub driver inherits non-amplification by construction.
3. HTTP signatures — the public-key verification surface — is one substrate predication: `(activitypub-actor:<iri>, key-verified, true)`.
  Cite [`signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md).

**Conformance proof.** Gate 3 of v0.4: publish a Note from the OS; observe it from a stock Mastodon instance.

**Enables next.** v0.4's selective-sync (4D) operates over a federation that already includes a public-fediverse boundary; without 4B, selective sync would be an internal-confederacy-only construct and the conformance gate would not reach.

### 4C. Matrix S2S as a second federation surface

**Theorem grounding.** Same as 4B.
Matrix S2S is a second instance of the same faithful-interfacer pattern with a different upstream protocol.

**Procedural steps.**

1. Author [specs/network/matrix-s2s.md](../specs/network/matrix-s2s.md) citing the Matrix S2S spec.
2. Implement the homeserver as a driver-cell.
  Reuse the v0.3 Matrix client driver's substrate ↔ Matrix object map for the cell-side; add the S2S surface (event signing, room federation, presence) on the wire side.
3. Pair with a Matrix testing suite (sytest or matrix-rust-sdk's tests) per gate 4 of v0.4.

**Conformance proof.** Gate 4 of v0.4.

**Enables next.** Two upstream-protocol surfaces (ActivityPub + Matrix) existing at the same time stress-tests `interfacer-counit-law-uniformity`'s "one authorization, multiple surfaces" claim.
Bugs in one surface that don't appear in the other are a signal the spec is leaning on protocol-specific behaviour rather than the algebra.

### 4D. Selective sync as substrate-content closure rules

**Theorem grounding.** [`scope-cover-via-grothendieck-site`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scope-cover-via-grothendieck-site.md).
A peer's subscription is a sieve in the Grothendieck site of the substrate's predicate scope; the selective-sync filter is restriction along that sieve.

**Procedural steps.**

1. Author [specs/network/selective-sync.md](../specs/network/selective-sync.md) per the new decision *selective-sync-is-closure-rules*.
  A subscription is a closure-rule cell whose premise is a peer-id + scope predicate and whose conclusion is the emit-to-peer admissibility tag.
  No new substrate primitive; this is a pattern over the existing rule system per [recipe 3](workflows.md#3-adding-a-closure-rule).
2. Implement filter-at-send in the federation driver (4A): before emitting a delta to a peer, evaluate the subscription closure rule on the delta's scope cell; emit only on $t$.
3. Bandwidth-aware throttling is a quantale-graded admissibility decision per [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) (round-2 §1.4 corollary), the survey-discharged specialisation of [`graded-dispatch-via-q-enriched-fusion`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) at the bandwidth-cost quantale.

**Conformance proof.** Gate 5 of v0.4: peer A receives only events scoped to the predicates A subscribes to.

**Enables next.** v0.5's outpost-to-ship federation (5D) reuses selective sync as the bandwidth-discipline mechanism for low-link edge nodes.
Without 4D, every outpost would receive every event and the outpost image's resource budget would not close.

### 4E. Trust graphs as substrate cells

**Theorem grounding.** [`federation-trust-bilattice-graded`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-trust-bilattice-graded.md) plus [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md).
Trust is a bilattice-graded predication; capability flow across federation is the modal-restriction adjoint composed with the federation interfacer.

**Procedural steps.**

1. Author [specs/security/federation-trust.md](../specs/security/federation-trust.md).
  A trust edge is a substrate cell `(persona:<a>, trusts-at-grade, persona:<b>) = (t, q)` where the bilattice tag is the trust polarity and the quantale grade is the trust strength.
2. Transitive-trust closure is a closure rule, per [recipe 3](workflows.md#3-adding-a-closure-rule), composing trust grades multiplicatively per [`quantale-graded-composition-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/quantale-graded-composition-uniformity.md).
  The survey-discharged result (round-2 §2.3) shows the SDK / federation non-amplification claim composes via the same theorem; trust transitivity inherits the non-amplification property.
3. Sandbox-and-fuel for federation is the path-cost composition per [`federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md), with [`federation-fuel-as-tensor-distributivity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-fuel-as-tensor-distributivity.md) (round-1 §2 corollary) closing the per-hop admissibility decomposition.

**Conformance proof.** A property fixture: synthesise a 3-peer trust graph with one cycle; assert the transitive closure produces the correct grade at each pair and that no path's effective capability exceeds the originating principal's.
`tests/conformance/test_trust_transitivity.py`.

**Enables next.** v0.6 SDK (6B) can declare per-app capability scopes whose effective grant is the modal-restriction of the installing principal's grant by the SDK manifest's declaration.
Without 4E's machinery, the SDK would have its own trust algebra and the cross-peer + cross-SDK composition would have two distinct authorization disciplines.

### 4F. Cross-peer ordering: only where load-bearing

**Theorem grounding.** [`cross-peer-trajectory-ordering-is-content-addressed`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cross-peer-trajectory-ordering-is-content-addressed.md) (round-1 §1.4 corollary; the cross-peer clock-meet question is not well-formed as originally framed).
The disposition: in strict and Scott-continuous regimes federation needs **no** cross-peer ordering primitive (per [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md)); in transfinite-bounded and aperiodic regimes, the ordering is **on trajectory increments only**, settled by `(peer-id, substrate-ordinal)` lexicographic with canonical-form-hash tie-break per [`hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md).

**Procedural steps.**

1. **Captain decision required first.** Per round-1 §1.3, the captain question is *not* "N vs O vs P" but "does v0.4 federation support the transfinite-bounded / aperiodic regimes at all, or is v0.4 restricted to the Scott-continuous prefix?"
  Open this in [questions/](../questions/) if not already open under [`v0.4-cross-peer-clock-meet.md`](../questions/v0.4-cross-peer-clock-meet.md); promote to a decision before doing 4F's code work.
2. If the decision restricts v0.4 to Scott-continuous: 4F is a no-op for v0.4.
  The federation driver from 4A operates on endpoint state; no per-event cross-peer ordering is consumed.
3. If the decision admits transfinite-bounded / aperiodic: implement trajectory-increment tagging per the round-1 §1.3 disposition.
  Each emitted increment carries `(peer-id, substrate-ordinal)`; the ingest side orders increments by lex on the pair, breaking ties on canonical-form hash.
  No global wallclock; no global ordinal; no merger-of-ordinals.
4. Either way, *do not* author option N's "regime-meet on heartbeat-ordinal-domain" — per round-1 §1.2 it conflates two distinct meets and would require new structural commitment in the math.

**Conformance proof.** If 4F is in scope: a federation fixture with two peers each emitting 100 trajectory-increment events; assert the merged $H^1$ surface matches across two independent merger orders.
If 4F is deferred: a fixture asserting the federation rejects (with a structured error) any peer attempting to negotiate a transfinite-bounded regime.

**Enables next.** v0.5's outpost model (5D) edges into the regime question because outposts have intermittent connectivity and may emit non-Scott-continuous trajectories.
The captain decision in 4F constrains 5D's outpost reachability story; without 4F, 5D would either silently admit non-conformant federations or refuse outpost reachability without explanation.

### 4G. Storage-projection determinism

**Theorem grounding.** [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) + [`recovery-via-event-log-replay-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/recovery-via-event-log-replay-determinism.md) + [`non-destructive-compaction-realizes-cosettling-equivalence-class`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/non-destructive-compaction-realizes-cosettling-equivalence-class.md).
The file-tree view is a deterministic compressed projection of the JSONL event log; asserted/settled cones are named projections; the projection functors commute with replay so any node holding a slice of the event log reconstructs an identical file-tree.

**Imaginative grounding.**

- **`jsonl-as-holograph-files-as-barcodes`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain framing: the JSONL event log is the holograph; the file-tree is its visible projection (the "barcode").
  Reduction: cache-coherence-via-functorial-projection.
- **`lossless-record-compression`** ([trove §Misc](../references/ideas-trove.md#misc)) + **`dual-cone-knowledge-architecture`** ([trove §Misc](../references/ideas-trove.md#misc)).
  Asserted-cone and settled-cone are two of the named projections; compaction is non-destructive because cosettling-equivalence preserves the equivalence class.
  Reduction: the three theorems above as one stack.

**Procedural steps.**

1. Author `specs/filesystem/storage-projection.md` naming the projection functors (asserted-cone, settled-cone, file-tree, sharded-by-fiber) and asserting their commutativity with replay per cache-coherence-via-functorial-projection.
2. Implement the projection registry in `src/filesystem/projections.py`; each registered projection is a closure rule whose firing order is determined by the event-log ordinal, not by call-time scheduling, so projection state is content-addressed.
3. Add the federation handoff path: when peer A sends peer B a slice of the event log, peer B replays the slice into B's local projection and asserts the resulting file-tree's canonical-form hash matches the hash A advertised at handshake.

**Conformance proof.** Replay-determinism fixture: take a 10k-event log, replay it twice on the same peer, assert both file-tree projections produce identical canonical-form hashes; replay it on a second peer with a fresh substrate, assert the file-tree hash matches the first peer's.

**Enables next.** 4G is the storage-side counterpart to 4A's wire-format work — without projection determinism, federated event-log slices are recoverable only at the cell granularity, not at the file-tree granularity, which would force every consuming app (file-browser, doc viewer, dashboards) to reconstruct its own projection.
With 4G, every node sees the same file-tree by construction.

### 4H. Cross-cell apply discipline

**Theorem grounding.** [`cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) + [`settlement-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/settlement-determinism.md) + [`rule-index-soundness`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/rule-index-soundness.md).
When a message updates cell C, every projection that depends on C is invalidated and recomputed deterministically — the operational form of "applying a message settles the universe".
The dependency graph is content-addressed (sourced from the closure-rule index) so the recomputation order is determined by the rules themselves, not by ad-hoc app-side scheduling.

**Imaginative grounding.**

- **`message-apply-settles-universe`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's claim: there is no notion of "apply this message to one cell and not its dependents" — the substrate either settles the entire transitive closure or refuses the apply.
  4H is the operational landing of that claim; without it, app code can silently observe partially-settled projections.
  Reduction: cache-coherence + settlement-determinism + rule-index-soundness as one stack.

**Procedural steps.**

1. Extend `specs/filesystem/storage-projection.md` (from 4G) with the cross-cell-apply section: when `respond` updates cell C, list the projections downstream of C as discoverable by the closure-rule index; trigger their recomputation as one settled trajectory rather than separate per-projection respond calls.
2. The recomputation is itself a closure-rule firing — it consumes the same fuel quantale as L4, so cross-cell apply is fuel-bounded by construction.
3. Federation: when peer A pushes a slice to peer B, peer B's apply path runs the cross-cell discipline locally; the federation handshake (4A) advertises the closure-rule index version so the dependency graph is identical on both sides.

**Conformance proof.** Cross-cell-apply fixture: assert a `respond` against a cell with three downstream projections produces a single settled trajectory whose witness chain references all four cells in the right ordinal order; assert mid-trajectory exhaustion (per L4) leaves the substrate in a settled prior state, never in a partial-projection state.

**Enables next.** 4H is what makes 4G's projection determinism load-bearing — projection determinism without cross-cell discipline lets app code race against the substrate.
Together they make the storage stratum federation-ready in the strongest sense: a peer can take a snapshot at any settled moment and the snapshot will replay identically anywhere.

### What v0.4 unlocks for v0.5

After v0.4: two nodes federate over a real wire (4A); two upstream protocols are bound (4B, 4C); selective sync filters at the predicate-scope level (4D); trust is a substrate-content quantale-graded edge with non-amplifying composition (4E); the cross-peer ordering question has a captain decision and the algebra cleanly admits or rejects transfinite-bounded regimes (4F). v0.5 industrial-control work can now treat outposts as *peer-style federations with bandwidth-discipline*, not as a new architectural primitive.

---

## Stage 5 — v0.5 industrial control

Reach state per [milestones/v0.5-industrial-control.md](../milestones/v0.5-industrial-control.md): MQTT and Modbus drivers; sensor framework; outpost OS image; the captain's first physical binding (e.g. soil-moisture → calendar notification → optional pump controller).

The thread that runs through v0.5 is that **sensor uncertainty is a bilattice, not a workaround**.
Stale readings are $\bot$ after horizon; disagreement is $\top$; affirmative readings are $t$ — gate 4 of v0.5 is exactly this.

### 5A. MQTT and Modbus drivers as faithful interfacers

**Theorem grounding.** Same as 4B/4C: [`doctrine-fidelity-via-faithful-interfacer-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md).
MQTT and Modbus are upstream surfaces; their drivers are interfacer functors.

**Procedural steps.**

1. Author [specs/network/mqtt.md](../specs/network/mqtt.md) (citing MQTT 5.0) and [specs/network/modbus.md](../specs/network/modbus.md) (citing Modbus TCP).
2. Implement [`src/drivers/mqtt/`](../../../src/drivers/) and [`src/drivers/modbus/`](../../../src/drivers/) per the v0.2b driver model.
  Topic ↔ cell map for MQTT; register ↔ cell map for Modbus.
3. Writes-as-closure-conclusions: a Modbus write is *not* a side-effect; it is the conclusion of a closure rule whose premise is a substrate-content predication.
  Cite [decisions/heartbeat-is-the-scheduler.md](../decisions/heartbeat-is-the-scheduler.md) and the world-tick pattern per round-2 [`theory-side-research-notes-2026-05-03-round-2.md`](../surveys/theory-side-research-notes-2026-05-03-round-2.md) §5 (world-tick is the closure-2-monad applied to the heartbeat-triggered firable subset; no new primitive).

**Conformance proof.** Gates 2 and 3 of v0.5: simulated MQTT broker round-trips; simulated Modbus controller round-trips read/write.

**Enables next.** 5B (sensor framework) treats every MQTT topic and Modbus register as a sensor record uniformly; without 5A's driver-cell normalisation, sensor framework would be MQTT-shaped or Modbus-shaped and the per-protocol special-casing would leak into the bilattice.

### 5B. Sensor framework: bilattice-native uncertainty

**Theorem grounding.** [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) plus [`telemetry-as-continuous-valued-settling-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/telemetry-as-continuous-valued-settling-projection.md).
Sensor readings are bilattice-valued from the substrate's first read; staleness is $\bot$-decay under a closure rule indexed by the monotonic clock; disagreement between two sensors over the same physical quantity is retained as $\top$ rather than coerced to consensus.

**Procedural steps.**

1. Author [specs/bundled-apps/sensor-dashboard.md](../specs/bundled-apps/sensor-dashboard.md) and an underlying spec [specs/_patterns/sensor-as-bilattice-cell.md](../specs/_patterns/) naming: a sensor record is a substrate cell of `kind: sensor`; readings are predications `(sensor:<id>, latest-reading-at-ord, reading:<id>) = v` where $v$ ranges over the bilattice.
2. Staleness rule: a closure rule whose premise is `latest-reading-at-ord < (current-ord - sensor.horizon)` and whose conclusion is `(sensor:<id>, currently-reading, *) = ⊥`.
  Per recipe 3.
3. Two-sensor disagreement: a closure rule whose premise is two `currently-reading` predications on the same physical quantity with incompatible bilattice tags; conclusion is $\top$ on the joint cell.
  Per [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md), $\top$ is *retained content*, not a fault.
4. Actuator records and actuation closure rules: an actuator's "fire" is the conclusion of a closure rule whose premise involves the substrate's current sensor state.
  The decision `ics-actuation-is-respond` (named in [milestones/v0.5-industrial-control.md](../milestones/v0.5-industrial-control.md) as new for v0.5) MUST be authored under [decisions/](../decisions/) at the start of stage 5B and cited from the spec.

**Conformance proof.** Gate 4 of v0.5: three test cases — stale → $\bot$, disagreement → $\top$, affirmative → $t$.
Add `tests/conformance/test_sensor_bilattice.py`.

**Enables next.** 5C (first physical binding) is meaningful only because 5B has already given the substrate a *structural* answer to "what does this sensor reading mean?"
Without 5B, a real binding in 5C would force per-binding ad-hoc handling of staleness and disagreement.

### 5C. First physical binding: end-to-end through the substrate

**Theorem grounding.** [`event-causality-via-lorentzian-settling`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/event-causality-via-lorentzian-settling.md) plus the world-tick reduction per round-2 §5.
The sensor → notification → actuation chain is a single causal closure walk; the heartbeat ticks the world; settling produces the actuation.

**Procedural steps.**

1. Wire a real (or hardware-faithfully-simulated) soil-moisture sensor through the MQTT driver.
  The sensor record from 5B carries the substrate-side identity.
2. A closure rule: `(sensor:<soil>, currently-reading, *) = (t, dry)` ⊢ `(calendar:<captain>, append-event, "water plants") = t`.
  The rule is a substrate-content cell per recipe 3.
3. Optional pump controller via Modbus: a second closure rule whose conclusion is the Modbus-register write.
4. The captain's ledger (from v0.3's hledger driver) captures the actuation event as an entry; cite the v0.3 ledger app's existing patterns.

**Conformance proof.** Gate 5 of v0.5 implicitly; the binding is the deliverable.
A nightly fixture replaying a recorded sensor trace asserts the rule fires deterministically.

**Enables next.** 5D's outpost work has an existing physical binding to deploy *to* the outpost — the binding is the v0.5 deliverable, the outpost is the deployment surface for it.

### 5D. Outpost model: federation with bandwidth discipline

**Theorem grounding.** [`scott-continuity-as-checkpointability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) plus [`scott-continuous-regime-engineering-envelope`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md).
An outpost's intermittent-connectivity reachability is the checkpointability of its closure under Scott-continuous regime; outposts that need to operate in the transfinite-bounded regime require the captain decision from 4F.

**Procedural steps.**

1. Author [specs/init-boot/outpost-image.md](../specs/init-boot/outpost-image.md) — a lightweight OS image bootable on a Raspberry Pi or equivalent.
  The outpost's substrate is a fully conformant pypredcomp instance with the heavy bundled apps from v0.3 disabled by package-record.
2. Outpost-to-ship federation reuses the v0.4 federation driver (4A) with the v0.4 selective-sync filter (4D) configured to receive only the predicate scopes the outpost needs to act on.
3. Reproducibility: the outpost image MUST round-trip the v0.2b reproducibility CI per [`deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md).
  An outpost is *the substrate it claims to be* per the v0.3 trusting-trust witness chain.

**Conformance proof.** Gate 5 of v0.5: outpost-to-ship federation works with selective sync; an outpost-emitted sensor reading appears on the ship's dashboard within one heartbeat tick.

**Enables next.** v0.6 third-party developers can target the outpost as a deployment surface (an SDK app for a sensor-package can run on an outpost), which means the SDK boundary surface (6B) MUST be specified to be conformance-equivalent across the ship and outpost images.

### 5E. Bundled MUD-style app as substrate-expressiveness fixture

**Theorem grounding.** [`substrate-runtime-as-closure-driven-settling`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/substrate-runtime-as-closure-driven-settling.md).
The MUD-style app is one closure-rule system over a world-state of cells; player commands are messages from sender-identity cells; world-tick is the closure pass at agential scope.
Cites the existing 8C trove reduction `daemon-world-tick`.

**Imaginative grounding.**

- **`zork-and-rogue-on-fars`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The captain's texture: a Zork-equivalent runs as one substrate process, world-state is cells, parser is a `respond` reduction, save/load is a sublocale operation.
  The point is *not* to ship a polished game — the point is to demonstrate the substrate is expressive enough that a non-trivial interactive world fits inside the dispatch shell with no new primitives.
  Reduction: substrate-runtime-as-closure-driven-settling.
- **`mud-chat-as-messaging`** ([trove §Misc](../references/ideas-trove.md#misc)).
  The MUD's command channel is an instance of the existing chat-as-messaging driver shape (already cited at 2E).
  Reduction: same theorem as 2E for the chat surface; substrate-runtime-as-closure-driven-settling for the world-tick.

**Procedural steps.**

1. Author `specs/bundled-apps/mud-app.md` (extends [bundled-apps/_index.md](../specs/bundled-apps/_index.md)).
  World-state cells; room-cell, item-cell, npc-cell, player-cell shapes; parser as a `respond` reduction over the player's command sender-cell.
2. Implement under `src/bundled_apps/mud/`.
  Reuse the chat-driver from 2E for the command channel; reuse the existing closure-rule firing daemon for world-tick (no new daemon).
3. Save/load wires through the same sublocale-process discipline 8A formalises; this is the fixture-quality precursor to that work, demonstrating sessions-as-processes is *already* expressible at v0.5 even before 8A authors the spec.

**Conformance proof.** A 50-room Zork-equivalent fixture: 100 player commands, deterministic world-state, save → quit → resume produces the identical post-resume cell-tree as continuing without saving.
Cross-peer fixture: two players federate over 4A's wire format, world-tick produces the same cell-tree on both peers.

**Enables next.** 5E is fixture-quality, not a shipping productivity app — it lives alongside the industrial-control work to demonstrate substrate expressiveness at the application scale.
The closure-driven world-tick texture directly informs 8A's session-as-sublocale spec and 8C's auto-dispatch broadening.

### What v0.5 unlocks for v0.6

After v0.5: industrial-control drivers are first-class (5A); sensor uncertainty is bilattice-native (5B); a real physical binding runs end-to-end through the substrate (5C); outposts are federation peers with bandwidth discipline (5D). v0.6's SDK now has *two* concrete deployment targets (ship + outpost), which forces the SDK to be specified by capability and substrate algebra — not by Python-runtime accidents — from day one.

---

## Stage 6 — v0.6 application development surface

Reach state per [milestones/v0.6-application-development.md](../milestones/v0.6-application-development.md): third parties write, package, sign, distribute, and install applications for the OS.
The SDK exposes capabilities; package authoring tools exist; doc format is shipped; a non-561 developer can follow the documented workflow.

The thread that runs through v0.6 is that **the SDK boundary is one more interfacer**, not a new substrate primitive.
Per round-2 [`theory-side-research-notes-2026-05-03-round-2.md`](../surveys/theory-side-research-notes-2026-05-03-round-2.md) §2, SDK non-amplification follows from the composition of [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) with [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md); the SDK does not need a new theorem, only the same composition pattern at a new surface.

### 6A. SDK as the substrate's typed external API

**Theorem grounding.** [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) plus [`conformance-via-fiber-algebra-functor`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md).
The SDK is one of the "multiple surfaces" the uniformity claim already covers; an SDK app's `import` is the boundary's `apply`, its `export` is the boundary's `extract`, and the counit law guarantees round-trip fidelity.

**Procedural steps.**

1. Author [specs/packaging/sdk.md](../specs/packaging/sdk.md).
  The SDK is a typed substrate API: each callable is `respond` against a substrate entity; types are predication-fiber types per [`predicated-computing/concepts/predication-fiber.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/predication-fiber.md).
2. Language bindings: Rust primary (per the v0.x → v1.0 sequencing in [implementation/_index.md](../implementation/_index.md)); TypeScript and Python as ergonomic wrappers. **Each binding is a faithful interfacer in its own right** — the binding's serialisation MUST round-trip the substrate's canonical JSON byte-identically per row 3 of [theory-for-developers.md](../references/theory-for-developers.md).
3. SDK docs are themselves substrate cells per the v0.6 doc-format spec (6D); the SDK's "documentation surface" is the same `materialize` verb the v0.3 file-browser uses.

**Conformance proof.** Gate 2 of v0.6: the example app is built using only the SDK and runs on a clean OS image; gate 3 of v0.6: signing/verification round-trips byte-identically.

**Enables next.** 6B (capabilities-as-API) is the *security* discipline on top of the typed surface 6A defines; without 6A's interfacer commitment, capability declarations would have no surface to attach to.

### 6B. Capabilities-as-API: non-amplification at the SDK boundary

**Theorem grounding.** [`agent-self-queueing-bounded-by-modal-restriction`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) composed with [`interfacer-counit-law-uniformity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md), per the round-2 §2 finding. **No new theorem needs to be authored to ground SDK non-amplification** — the result is the existing spawn-bound discipline applied at the SDK-import surface.
The published-on-disk corollary [`sdk-import-non-amplifying-via-modal-restriction-composition`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/sdk-import-non-amplifying-via-modal-restriction-composition.md) names the composition explicitly.

**Procedural steps.**

1. Author [specs/security/capability-api.md](../specs/security/capability-api.md).
  A capability is a substrate cell `kind: capability`; an SDK app's manifest declares an *accessibility relation* $R_{\mathrm{SDK}}$ that modal-restricts the importing principal's capabilities (per [`modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md)).
2. The SDK's capability composition is computable per [`governance-decision-modal-decidability`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) (PSPACE); implement the check at install time and at runtime.
3. SDK-app composition (one SDK app importing another) inherits non-amplification by induction on the modal-restriction chain.
  Cite the round-2 §2.3 composition.

**Conformance proof.** Gate 4 of v0.6: capability discipline rejects unauthorized capability access at install time and runtime.

**Enables next.** 6C's package authoring workflow signs the manifest's capability declarations; without 6B's normative spec, the signature would be over an undefined surface.

### 6C. Package authoring, signing, distribution

**Theorem grounding.** [`signature-binds-witness-to-identity`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md) plus the v0.3 trusting-trust witness chain.
A package is a substrate cell `kind: package`; its signature binds the package's hash to the publisher's identity; its installation is the verification + admission of the package's capability declarations.

**Procedural steps.**

1. Author [specs/packaging/package-authoring.md](../specs/packaging/package-authoring.md).
  Manifest format = a YAML-frontmatter substrate cell + payload directory; signing = Ed25519 over the canonical-form hash; distribution = a federation-compatible registry surface (a registry is a peer in the v0.4 federation sense whose scope is `kind: package`).
2. Transitive dependency resolution is a closure walk over `(package:<a>, depends-on, package:<b>) = t` predications; cycles are $\top$ on the cycle-cell per [`paraconsistency-as-substrate-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md); the resolver's output is the topo-sort of the dependency closure.
3. **Skill author tooling** ([`pt-15`](../tasks/engineering/pt-15-encyclopedia-uri-skill-token-types.md) folds in here per the v0.6 milestone): `lint-skills` validator + pre-commit hook; gate 6 of v0.6 is closed by lint passing on a clean tree and producing documented codes on canonical error trees.

**Conformance proof.** Gates 3 and 6 of v0.6.

**Enables next.** 6D (doc format) and 6E (third-party workflow) both depend on packaged content existing as substrate cells; 6C's discipline is what makes that existence well-typed.

### 6D. Doc format as substrate cells

**Theorem grounding.** Row 13 (self-representation) plus [`predication-fiber-functor`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md).
Docs are not attached metadata; they are substrate cells `kind: doc, doc-of: <subject>` whose content is materialised through the same `materialize` verb used elsewhere.

**Procedural steps.**

1. Author [specs/filesystem/doc-format.md](../specs/filesystem/doc-format.md).
  A doc cell carries: the subject reference, the doc body (markdown or message-language), the doc's per-locale variants as additional predications.
2. Implement the `help <topic>` command in the dispatch shell ([`src/shell/repl.py`](../../../src/shell/repl.py)) as a `respond` against the doc-of-`<topic>` cell; render via `materialize`.
  The web GUI overlay reads the same cell.
3. The umwelt-as-fiber-projection result (round-2 §4) gives the framing for "what docs is this entity entitled to see": the entity's umwelt of `kind: doc` cells is exactly what `help` should surface, with capability-restriction applied per 6B.

**Conformance proof.** A fixture: `help <known-topic>` returns the canonical doc cell's content byte-identically across the TUI, the web GUI, and the SDK doc-introspection API.

**Enables next.** 6E's third-party workflow uses `help` as the developer's first navigation surface; without 6D, third-party docs would have no first-class home and the workflow would degrade to README hunting.

### 6E. The third-party workflow as conformance gate

**Theorem grounding.** Composition of all of 6A-6D plus [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md).
A non-561 developer following the documented workflow either produces a working package or surfaces a defect in 6A-6D.

**Procedural steps.**

1. Author [specs/packaging/third-party-workflow.md](../specs/packaging/third-party-workflow.md).
  Documented developer onboarding: install SDK; read docs; build example app; sign; install on clean image.
2. Build a non-trivial example app (e.g. a simple sensor visualiser using the v0.5 sensor framework) using *only* the SDK from 6A and the capability discipline from 6B.
3. App removal flow: an `uninstall <package>` `respond` retracts the package's capability declarations, retracts the package's substrate cells (per the retract-as-append discipline of [recipe 9](workflows.md#9-working-with-the-event-log)), removes the package's binary content from the package-store.

**Conformance proof.** Gates 2 and 5 of v0.6: the example app is built and runs; a developer who hasn't worked with the OS before can follow the workflow and produce a working app.

**Enables next.** v0.7's productivity stack and v0.8's agential layer can be authored *as* third-party SDK apps (or as 561-internal apps using the same SDK); without 6E, the productivity-stack work would have to special-case the dev surface.

### What v0.6 unlocks for v0.7 and beyond

After v0.6: third-party developers can build for the OS; capabilities are typed and non-amplifying at install time; packages are signed-and-distributable; docs are first-class substrate cells. v0.7 (productivity stack) can be written as SDK apps; v0.8 (agential layer) inherits the capability discipline; v0.9 (publishing and learning) reuses the package format for model supersession (per round-2 §3, model-supersession IS forward-migration; no new substrate primitive is needed for the v0.9 surface).

---

## Cross-cutting threads (continued)

Threads A–E from [next-stretch.md §"Cross-cutting threads"](next-stretch.md#cross-cutting-threads) continue to apply at every stage above.
Three further threads emerge at the v0.4-v0.6 horizon:

### Thread F: regime stratification preserved across federation

Round-1 [`theory-side-research-notes-2026-05-03.md`](../surveys/theory-side-research-notes-2026-05-03.md) §1.
Every federation surface (4A, 4B, 4C, 4D, 4E, 5D) MUST declare which regimes it admits.
The handshake's regime-meet (per [`network-algebraic-contract`](../specs/network/network-algebraic-contract.md) §1.3) is the substrate-level enforcement; no surface may silently downgrade a peer to a regime that was not negotiated.
The check is procedural: every federation driver's `apply` MUST consume the negotiated regime and refuse events whose trajectory would require a higher regime than negotiated.

### Thread G: every claimed new primitive must be reduced to an existing theorem

Round-2 [`theory-side-research-notes-2026-05-03-round-2.md`](../surveys/theory-side-research-notes-2026-05-03-round-2.md) §1, §2, §3, §4, §5 and round-1 §1, §2, §3 collectively show that **most "new primitive" proposals at this horizon reduce to specialisations of existing theorems**.
Before authoring a new primitive cell-kind or a new kernel verb, the stage MUST attempt the reduction:

- Is the proposed operator a specialisation of `graded-dispatch-via-q-enriched-fusion` with a particular quantale?
  (Voting, rollup, tier-routing, bandwidth-throttling all reduce here per round-2 §1.)
- Is the proposed boundary an instance of `interfacer-counit-law-uniformity` with a particular accessibility relation?
  (SDK, network, federation, ActivityPub, Matrix, MQTT, Modbus all reduce here.)
- Is the proposed lifecycle the regime-determined trajectory of a 2-state arrow per `closure-rule-system-realizes-closure-2-monad`?
  (4-state witness lifecycle reduces here per round-1 §3; world-tick reduces here per round-2 §5.)
- Is the proposed migration an instance of `forward-migration-preserves-prior-content`?
  (Model supersession, schema migration, vocabulary tower-fold all reduce here per round-2 §3.)

If the reduction succeeds, cite the existing theorem and document the specialisation as a corollary.
If the reduction fails *and* you can prove the failure, then a new theorem may be warranted — surface to the captain rather than authoring silently.

### Thread H: never cite a theorem name that is not on disk

Round-2 §6 (the phantom-citation register).
Every spec / decision / task / milestone authored in this stretch MUST verify that every theorem-slug it cites resolves to an on-disk file under [`theories/.../predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/) or [`theories/.../predication-categories/theorems/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/).
The verification is a one-liner:

```sh
rg -o '\[`([a-z0-9-]+)`\]' specs/ decisions/ tasks/ milestones/ | \
  awk -F\` '{print $2}' | sort -u | \
  while read slug; do
    found=$(find ../../../../../../library/theories -name "$slug.md" -type f | head -n1)
    [ -z "$found" ] && echo "PHANTOM: $slug"
  done
```

(Adjust the relative path to match your workspace.)
Any output is a phantom citation that MUST be either rewritten to point at the existing-on-disk theorem (per the round-2 §6 register) or escalated to a math-side authoring task.

---

## Glossary of theorem slugs cited above

For paths and detail, follow the links in each stage.
Index here for cross-referencing; only on-disk theorems are listed (per Thread H).

| Slug | Path |
|---|---|
| `federation-convergence` | [`predicated-computing/theorems/federation-convergence.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) |
| `transport-tolerance-of-federation` | [`predicated-computing/theorems/transport-tolerance-of-federation.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transport-tolerance-of-federation.md) |
| `interfacer-counit-law-uniformity` | [`predicated-computing/theorems/interfacer-counit-law-uniformity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/interfacer-counit-law-uniformity.md) |
| `doctrine-fidelity-via-faithful-interfacer-functor` | [`predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/doctrine-fidelity-via-faithful-interfacer-functor.md) |
| `agent-self-queueing-bounded-by-modal-restriction` | [`predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction.md) |
| `sdk-import-non-amplifying-via-modal-restriction-composition` | [`predicated-computing/theorems/sdk-import-non-amplifying-via-modal-restriction-composition.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/sdk-import-non-amplifying-via-modal-restriction-composition.md) |
| `modal-restriction-as-substrate-authorization-primitive` | [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) |
| `governance-decision-modal-decidability` | [`predicated-computing/theorems/governance-decision-modal-decidability.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) |
| `federation-trust-bilattice-graded` | [`predicated-computing/theorems/federation-trust-bilattice-graded.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-trust-bilattice-graded.md) |
| `federation-path-metrics-multiplicative` | [`predicated-computing/theorems/federation-path-metrics-multiplicative.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) |
| `quantale-graded-composition-uniformity` | [`predicated-computing/theorems/quantale-graded-composition-uniformity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/quantale-graded-composition-uniformity.md) |
| `graded-dispatch-via-q-enriched-fusion` | [`predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/graded-dispatch-via-q-enriched-fusion.md) |
| `paraconsistency-as-substrate-discipline` | [`predicated-computing/theorems/paraconsistency-as-substrate-discipline.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/paraconsistency-as-substrate-discipline.md) |
| `scope-cover-via-grothendieck-site` | [`predicated-computing/theorems/scope-cover-via-grothendieck-site.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scope-cover-via-grothendieck-site.md) |
| `hash-injectivity-under-canonical-form` | [`predicated-computing/theorems/hash-injectivity-under-canonical-form.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) |
| `signature-binds-witness-to-identity` | [`predicated-computing/theorems/signature-binds-witness-to-identity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/signature-binds-witness-to-identity.md) |
| `telemetry-as-continuous-valued-settling-projection` | [`predicated-computing/theorems/telemetry-as-continuous-valued-settling-projection.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/telemetry-as-continuous-valued-settling-projection.md) |
| `event-causality-via-lorentzian-settling` | [`predicated-computing/theorems/event-causality-via-lorentzian-settling.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/event-causality-via-lorentzian-settling.md) |
| `scott-continuity-as-checkpointability` | [`predicated-computing/theorems/scott-continuity-as-checkpointability.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuity-as-checkpointability.md) |
| `scott-continuous-regime-engineering-envelope` | [`predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md) |
| `deployment-determinism` | [`predicated-computing/theorems/deployment-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) |
| `bootstrap-determinism` | [`predicated-computing/theorems/bootstrap-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) |
| `conformance-via-fiber-algebra-functor` | [`predicated-computing/theorems/conformance-via-fiber-algebra-functor.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/conformance-via-fiber-algebra-functor.md) |
| `predication-fiber-functor` | [`predication-categories/theorems/predication-fiber-functor.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) |
| `federation-fuel-as-tensor-distributivity` | [`predicated-computing/theorems/federation-fuel-as-tensor-distributivity.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-fuel-as-tensor-distributivity.md) |
| `cell-set-fold-as-graded-dispatch-specialization` | [`predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) |
| `cross-peer-trajectory-ordering-is-content-addressed` | [`predicated-computing/theorems/cross-peer-trajectory-ordering-is-content-addressed.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cross-peer-trajectory-ordering-is-content-addressed.md) |
| `cache-coherence-via-functorial-projection` | [`predicated-computing/theorems/cache-coherence-via-functorial-projection.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) |
| `recovery-via-event-log-replay-determinism` | [`predicated-computing/theorems/recovery-via-event-log-replay-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/recovery-via-event-log-replay-determinism.md) |
| `non-destructive-compaction-realizes-cosettling-equivalence-class` | [`predicated-computing/theorems/non-destructive-compaction-realizes-cosettling-equivalence-class.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/non-destructive-compaction-realizes-cosettling-equivalence-class.md) |
| `settlement-determinism` | [`predicated-computing/theorems/settlement-determinism.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/settlement-determinism.md) |
| `rule-index-soundness` | [`predicated-computing/theorems/rule-index-soundness.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/rule-index-soundness.md) |
| `substrate-runtime-as-closure-driven-settling` | [`predicated-computing/theorems/substrate-runtime-as-closure-driven-settling.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/substrate-runtime-as-closure-driven-settling.md) |

## See also

- [next-stretch.md](next-stretch.md) — predecessor (v0.2a residual → v0.2b → v0.3 on-ramp).
  Read this first.
- [theory-for-developers.md](../references/theory-for-developers.md) — per-construct theory→code bridge.
- [workflows.md](workflows.md) — per-task procedural recipes.
- [milestones/v0.4-federation.md](../milestones/v0.4-federation.md), [milestones/v0.5-industrial-control.md](../milestones/v0.5-industrial-control.md), [milestones/v0.6-application-development.md](../milestones/v0.6-application-development.md) — per-milestone ship targets this plan derives.
- [surveys/theory-side-research-notes-2026-05-03.md](../surveys/theory-side-research-notes-2026-05-03.md) — round-1 theory-side research; cited at 4F, 4E.
- [surveys/theory-side-research-notes-2026-05-03-round-2.md](../surveys/theory-side-research-notes-2026-05-03-round-2.md) — round-2 theory-side research; cited at 4D, 5A, 6A, 6B, 6D, and threads G + H.
- [pypredcomp/AGENTS.md](../../../AGENTS.md) — anti-patterns and session shape.
