---
type: question
status: open
asked-at: 2026-05-03
explores: [repair-log-hash-chain-as-per-artifact-merkle-projection, settlement-determinism, witness-lifecycle-trajectory-is-regime-conditional-federation-content]
see-also: [cross-peer-trajectory-ordering-is-content-addressed, repair-log-byte-canonicality-via-lex-firing]
---

# What disambiguates an empty repair log's disposition?

The dev spec [`repair-log`](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/repair-log.md) §4 commits that the substrate emits an *empty* repair log `[]` in two structurally distinct cases:

- **Case (a) — already-settled-noop.** The `respond`'s payload is already at a closure-fixed-point against the substrate's current state; no σ-firing is enabled and no Δ-stabilization changes any cell. The settlement is the identity on the input fiber, and the repair log records nothing.
- **Case (b) — Phase-1-aborted.** The `respond`'s structural validation fails before any closure work: malformed payload, capability denial, schema violation, etc. No σ-pass or Δ-pass runs at all, and the repair log records nothing.

The two cases produce wire-form-identical repair logs (`[]`). They differ structurally — case (a) is a successful identity invocation; case (b) is an aborted invocation — but the discriminator lives outside the log: in the response envelope's `code`, `error`, and `evidence` fields per the dev's [respond](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/respond.md) spec.

The question is whether this is sufficient for the substrate's downstream disciplines, or whether the disposition needs to be encoded *inside* the log (as a sentinel entry) or alongside it (as an explicit `disposition` field on the response).

## Why the question matters

Three substrate disciplines consume the repair log and may need to distinguish cases (a) and (b):

1. **Cross-peer trajectory shipping.** Per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](../theorems/witness-lifecycle-trajectory-is-regime-conditional-federation-content.md), the substrate ships trajectories across federation boundaries in the transfinite-bounded and aperiodic regimes. If a receiver receives `[]`, it cannot infer disposition without the response envelope. If the federation transport ships *only* the log (e.g., a per-artifact projection that excludes the envelope), the receiver mis-classifies an aborted invocation as a successful no-op.

2. **Compaction discipline.** Per [compaction-via-cosettling-equivalence-class](../theorems/compaction-via-cosettling-equivalence-class.md), the substrate may compact event sequences that are equivalent under cosettling. A no-op `respond` (case (a)) is a candidate for compaction — its effect on substrate state is the identity, so it can be elided. An aborted `respond` (case (b)) is *not* a candidate for compaction — it represents a failed admission attempt whose record may be substrate-content for audit and capability-revocation purposes. A compaction algorithm that consults only the log cannot distinguish them.

3. **Audit-replay verification.** A verifier replaying an event log against a fresh substrate to check determinism observes that the original invocation produced `[]`. The verifier re-runs the invocation and observes the same `[]` — but if the original was aborted (case (b)) and the replay's substrate state happens to admit the payload, the replay produces a different disposition. The verifier needs the disposition recorded somewhere to detect the divergence.

In all three cases, the discriminator can be carried in the response envelope — but the substrate's commitment to the response envelope's content as substrate-content (vs. derived-from-substrate-content) is not currently spelled out. If the envelope is itself substrate-content (event-log entry, persisted, federable), the disposition is recoverable. If the envelope is derived-only (returned to the caller, not persisted), the disposition is lost on persistence and the three disciplines above cannot consult it.

## Partial considerations

**Argument for status quo (envelope-carries-disposition).** The repair log is *exactly* what its name says: a chronological record of settlement steps. Cases (a) and (b) both have zero steps, so both produce empty logs; this is structural, not a bug. Forcing the log to encode disposition is a category error — disposition belongs on the invocation outcome, not on the settlement trace.

**Argument for sentinel-entry.** A single-entry log `[{"code": "PCM_RESPOND_PHASE", "phase": "1-aborted", ...}]` for case (b) and `[]` for case (a) preserves the log's structural meaning while disambiguating disposition. The cost is one entry per aborted invocation. Per the dev spec's §5, `PCM_RESPOND_PHASE` is already an admissible entry code; using it as a no-op marker for aborted invocations is a small extension. The risk is that auditors who treat `[]` as the "no settlement happened" marker would then have to special-case `PCM_RESPOND_PHASE`-only logs as also "no settlement happened" — a small additional rule.

**Argument for `disposition` field on the response envelope, persisted as substrate content.** The envelope is the natural carrier for disposition — it is per-invocation and post-settlement. Adding a `disposition: "settled-noop" | "aborted-pre-closure" | "aborted-mid-closure"` field, persisted in the event log alongside the repair log, gives the federation, compaction, and audit disciplines a structural discriminator without modifying the log's wire form. This requires the response envelope to be substrate-content (event-log entry, federable), which is a stronger commitment than the current spec spells out.

**Cohomological consideration.** A no-op invocation (case (a)) contributes no atoms to the stratified fiber and no cohomology to the inconsistency-sheaf. An aborted invocation (case (b)) likewise contributes no atoms — but it *does* contribute audit content: the attempted admission is part of the substrate's record of capability-grant attempts, schema-validation failures, etc. The cohomological vacuity of both cases is structurally the same; their *audit-content* differs. The discriminator is therefore an audit-content field, not a cohomological field.

## What an answer would look like

A captain's answer would specify:

1. **Where disposition lives.** On the response envelope (and is the envelope substrate-content?), as a sentinel entry in the repair log, or as a separate `disposition` field.
2. **How the federation transport carries it.** Specifically: when shipping per-artifact trajectory across a federation boundary, does the transport include disposition? If the transport ships only the per-artifact projection of the log (per [repair-log-hash-chain-as-per-artifact-merkle-projection](../theorems/repair-log-hash-chain-as-per-artifact-merkle-projection.md)), disposition is not in the projection.
3. **How compaction consults disposition.** If disposition is on the envelope and the envelope is substrate-content, the compaction algorithm consults the envelope. If the envelope is not substrate-content, compaction is undecidable on the empty-log case.
4. **What the audit-replay verifier compares.** If disposition is recorded, the verifier compares both repair log *and* disposition; divergence in either is a determinism violation.

Until answered, the substrate's downstream disciplines treat the empty log conservatively: federation peers ship the envelope alongside the log (whether the envelope is "substrate-content" or not, it accompanies the per-invocation transport); compaction skips empty-log invocations rather than risk eliding aborts; audit-replay verifiers compare both log and envelope `code` field. These conservative defaults are correct but suboptimal — the substrate pays per-invocation envelope-shipping cost and skips per-invocation compaction opportunities that would otherwise be valid.

## Adjacent open questions

- **Is the response envelope substrate-content?** The dev's [self-representation](teaching/explanations/self-representation.md) discipline implies "everything the substrate does should be substrate-content," but the response envelope's status is not currently spelled out. This question is logically prior to the disposition question: if the envelope is substrate-content, disposition lives there; if not, the disposition discriminator must live in the log.
- **Is empty-trajectory shipping a federation concern?** If federation transport ships only per-artifact projections (per the trajectory-canonicality theorem), and an invocation touches no artifacts, what is shipped? The current substrate ships the envelope; a transport that strips envelopes from no-op invocations would silently lose the substrate-content of the invocation attempt.
- **Are aborted invocations replayable?** A verifier replaying an aborted invocation needs to reproduce the same abort — same `code`, same Phase boundary. The replay discipline for aborts is currently spelled out only by implication; explicit spec coverage would resolve this question and the present one in tandem.
