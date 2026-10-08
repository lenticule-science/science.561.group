---
name: witness
description: "The substrate-record carrying the recorded evidence of one operator invocation: the input fiber hashes, the rule-system version under which the operator ran, the consumed fuel, the per-layer settle hashes, and the output fiber hash."
type: definition
class: record
instantiates: [witness]
depends-on: [hash-discipline, determinism, source-of-truth]
see-also: [respond, settle, fiber, event-log]
title: witness
---

# Witness

The substrate-record carrying the recorded evidence of one operator invocation: the input fiber hashes, the rule-system version under which the operator ran, the consumed fuel, the per-layer settle hashes, and the output fiber hash.
A `Witness` realizes the substrate-level [witness](../../../../teaching/explanations/witness.md) pattern: an auditor with the inputs, the operator, and the witness can replay the operation and verify the recorded hash chain matches byte-for-byte.

A `Witness` is *immutable*.
It is produced by an operator at the moment the operator returns; conformant realizations SHALL NOT mutate it after construction.
Witnesses accumulate into the substrate's [event log](../../../../../objects/event-log.md).
The event log is what makes FARS replayable and auditable: any past inference can be reconstructed from the input fibers (themselves reconstructible from the source notes via [`interpret`](../transformers/interpret.md)) and the witness's hash chain.

## Required fields

Every conforming realization SHALL hold, for each `Witness`, the following fields.
The split between *hash-chain* content and *provenance* content is normative: the hash chain is what an auditor verifies; the provenance is for human readers and operational telemetry.
Two invocations with byte-identical hash-chain content produce auditable witnesses; their timestamps and durations MAY differ without affecting verification.

Hash-chain content (load-bearing for replay):

- **`operator`** — the operator's canonical name (`respond`, `settle`, `interpret`, `dispatch`, …).
- **`operator_version`** — the substrate-recorded version of the operator's specification at the time of run.
- **`input_hashes`** — a mapping from input role (`entity`, `message`, `target`, `candidates`, …) to canonical hash of that input.
- **`output_hash`** — the canonical hash of the operator's output.
- **`rule_system_version`** — the closure-rule-system version active during the run.
- **`fuel_consumed`** — iteration layers used (zero for non-iterating operators).
- **`layer_hashes`** — canonical hashes of intermediate states, one per closure-rule layer (or empty for non-iterating operators).
- **`repairs`** — repairs invoked during the run, per the substrate's [repair](../../../../teaching/explanations/repair.md) discipline; each repair entry carries before-hash, after-hash, catalog code, and consumed fuel.

Provenance content (for human and operational use; not load-bearing for replay):

- **`started_at`** — start time.
  ISO 8601 by convention.
- **`duration_ms`** — wall-clock duration.

A realization MAY add additional provenance fields (machine identifier, agent identifier, parent-witness reference, …) so long as they are not part of the hash chain.

## Invariants

- **Hash-cited.** Every entry in the hash chain SHALL record a canonical hash of substrate content, not a paraphrase.
  Per [hash-discipline](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-discipline.md), a hash-cited entry is verifiable independently of the realization: any verifier with access to the cited content and the canonical-form algorithm can re-hash and compare.
- **Replayable.** [Determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md) is the precondition: a `Witness` is meaningful only because the operator it records is deterministic.
  Non-deterministic operators (those whose body involves a frontier model, an external service, or a wall-clock-dependent operation) SHALL contain the non-determinism by recording the entropy source's canonical hash alongside, so the witness becomes deterministic *relative to* the entropy.
- **Repair-aware.** A repair invoked during the operator's run SHALL appear in the witness.
  A repair that is not in the witness did not happen; a witness that mentions a repair the operator did not perform is forged.
- **Append-only in the log.** A `Witness` written to the event log SHALL NOT be edited or deleted.
  Mistakes are corrected by emitting a *retraction witness* whose content cites the retracted witness's hash and a closure-rule-recorded reason.

## Storage

The substrate's event log is a flatfile-substrate-shaped store applied to witnesses themselves: an append-only sequence (typically JSONL or content-addressed cells) where each entry is one canonicalized `Witness`.
The append-only constraint SHALL be enforced at the substrate level — the realization's edit operators write but never modify entries.
A violation is detected on next read by re-hashing.

Per [two-store coherence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/two-store-coherence.md), the substrate's authoritative stores are the entity catalog (notes) and the event log (witnesses); derived views (in-memory indexes, search-optimized projections) are admissible but SHALL NOT be authoritative.

## What a witness is not

- **Not the output itself.** The witness *cites* the output by its canonical hash; it does not contain the output's bytes.
  A consumer who needs the bytes reads them from the substrate; the witness's role is to assert that the bytes hash to a value, not to carry the bytes.
- **Not a log line.** A log line is a human-readable note about an event; a witness is a machine-verifiable record.
  Realizations MAY render witnesses as log lines for operator convenience, but the hash-chain payload is the load-bearing content.
- **Not the source of truth.** The substrate is the source of truth; the witness is the audit chain over the substrate's evolution.
  Reconstructing the substrate from witnesses requires the witnessed inputs as well — witnesses alone do not contain substrate content.

## Position

`Witness` is the output side of every operator that performs substrate work.
[`respond`](../transformers/respond.md), [`settle`](../transformers/settle.md), [`dispatch`](../morphisms/dispatch.md), [`interpret`](../transformers/interpret.md) (when invoked as a step inside a witnessed chain), and the substrate's edit operators all return a `Witness` alongside their primary output.
The record is what makes the substrate's [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) commitment operational: every operator's behavior is itself substrate content, recorded in witnesses, replayable from the substrate.
