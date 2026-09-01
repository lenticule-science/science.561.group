---
type: concept
class: schema-discipline
depends-on:
  - schema-evolution
  - transaction
  - witness
  - predication-fibration
  - predicate-specialization
  - settling-monotonicity
see-also:
  - forward-migration-preserves-prior-content
  - online-schema-change-zero-downtime
  - secondary-index
  - secondary-index-as-alexandrov-cover
---

# Online schema change

The *substrate's discipline for changing the data schema while the substrate is serving traffic*: add columns, change types, add indexes, modify constraints — all without taking the substrate offline.

Per [online-schema-change-zero-downtime](../theorems/online-schema-change-zero-downtime.md) (proved), this discipline is not a collection of vendor-specific tricks: it is the substrate's specialization of [forward-migration-preserves-prior-content](../../../theorems/forward-migration-preserves-prior-content.md) to schema-as-substrate-content, with the multi-phase patterns falling out as the structurally licensed sequences of admit operations on the schema's own predications.

Per [schema-evolution](../../teaching/explanations/schema-evolution.md), the parent substrate's general schema-change discipline. Online schema change is the database-specific specialization: how to do these changes without blocking concurrent reads/writes.

## Common patterns and their math roles

Each pattern below maps to a fixed move in the predication fibration on the schema's own [self-representation](../../teaching/explanations/self-representation.md):

- **Add column with default ↔ forward-compatible admission of a new attribute predicate.** Per [forward-migration-preserves-prior-content](../../../theorems/forward-migration-preserves-prior-content.md), adding a new attribute predicate is monotone in $\leq_k$ — old rows' predications are preserved, with the default's predication $\leq_k$-extending each row. New writes' predications include the column. The operation is single-phase and atomic per [transaction-atomicity](../../../theorems/transaction-atomicity.md).
- **Add index online ↔ refine the Alexandrov cover.** Per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md), index addition is monotonic cover refinement; the build is a background materialization of the new $U_{I_{j^*}}$. Concurrent reads use the un-refined cover (full-scan for the residual); concurrent writes update both the table and the in-progress materialization. Coherence is structural per the cover's sheaf condition.
- **Drop column lazy ↔ retraction-discipline-bounded coarsening.** Per [retraction](../../../morphisms/retraction.md), removing must follow the substrate's repair-authorized retraction protocol — the column's predications are deprecated (new reads ignore them), then physically removed only when no outstanding witness depends on them. Some substrates retain deprecated predications indefinitely, treating retraction as a soft re-classification rather than a deletion; this is structurally sound per the same retraction discipline.
- **Rename column / table ↔ two-phase identity replacement via predicate-specialization.** Phase 1 admits a new name as alias (a [predicate-specialization](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) $f : p_{\mathrm{new}} \to p_{\mathrm{old}}$ that is iso); phase 2 retracts the old name. Both phases are monotone on the schema's predications; the iso ensures no value-axis change occurs.
- **Change column type ↔ multi-phase non-iso specialization sequence.** Add new column with new type (forward-compatible admission); backfill from old via a substrate-content morphism (a non-iso specialization with explicit conversion); update clients to read the new column; retract the old. Atomic type-change is structurally impossible without downtime when the conversion is non-iso — the substrate cannot present two value-axes for the same predication simultaneously without breaking the fibration's coherence.
- **Add foreign key constraint ↔ deferred predicate-specialization with prior validation.** Validate existing data in the background (a read-only sweep computing whether the constraint's specialization is consistent with current predications); admit the constraint only after validation passes. Per [transaction-atomicity](../../../theorems/transaction-atomicity.md), the admission is atomic; per the prior validation, the admission cannot fail post-hoc on existing rows.

## Math grounding

Online schema change is the substrate's discipline for executing schema operations as monotone moves on the schema's own self-representation. The factorization:

- **Forward-compatible additions ↔ $\leq_k$-monotone admit operations on the schema fiber.** Per [forward-migration-preserves-prior-content](../../../theorems/forward-migration-preserves-prior-content.md), additions don't invalidate existing data — the new predications strictly extend the old ones. Reads on old data continue to work because the old predications are unchanged; writes on new data conform to the extended schema because the new predications are now part of the schema fiber.
- **Background index builds ↔ asynchronous cover refinement.** Per [secondary-index-as-alexandrov-cover](../theorems/secondary-index-as-alexandrov-cover.md), index materialization is the substrate's morphism that builds the new cover element; concurrent reads use the un-refined cover (which still covers their footprints, just with worse grades); concurrent writes update both the table and the in-progress cover element via the cover's coherence discipline.
- **Schema as substrate content ↔ self-representation.** Per [self-representation](../../teaching/explanations/self-representation.md), the schema is queryable substrate state — predications about which attribute predicates exist, what their types are, what constraints apply. Schema changes are admit (or retract) operations on these meta-predications; per [transaction-atomicity](../../../theorems/transaction-atomicity.md), they can be atomic.
- **Multi-phase patterns ↔ the structurally-licensed sequences of admits and retracts.** Non-forward-compatible changes (column removal, type change, breaking constraint addition) require multi-phase patterns. Each phase is a monotone admit or a retraction-discipline-bounded retract; the sequence preserves traffic because at each intermediate point the schema's self-representation is internally coherent (clients reading the schema see a consistent view, even if they don't yet use the new elements).

## Engineering invariants

- **No-downtime for forward-compatible changes.** Per [online-schema-change-zero-downtime](../theorems/online-schema-change-zero-downtime.md), the substrate can evolve its schema without service interruption when the change is monotone in $\leq_k$. Structural, not policy.
- **Multi-phase for non-forward-compatible changes.** Type changes, column removal, and breaking constraints require add-new / migrate / switch / retract-old. Each phase is monotone; the *sequence* is what produces the apparent atomic change. Coordinated client updates are required because the client-visible schema goes through intermediate states that clients must understand.
- **Audit-trail of schema evolution.** Per [witness](../../../objects/witness.md), every schema change is recorded as a substrate-content witness. Auditors can replay the schema's evolution from the witness chain and verify each step was a monotone admit or a retraction-protocol-conformant retract.
- **Conformance-testable.** Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), online schema change conformance is testable: present a sequence of concurrent reads/writes during a schema change, verify all reads return consistent results and all writes succeed.

## What the discipline refuses

- **Schema changes requiring a global lock.** A non-online ALTER TABLE that holds an exclusive lock for the duration of the change blocks traffic. Per [online-schema-change-zero-downtime](../theorems/online-schema-change-zero-downtime.md), online patterns specifically avoid this — they decompose the change into monotone admit operations whose individual atomicity is sufficient.
- **Breaking changes deployed without the multi-phase pattern.** Dropping a column while clients still query it would break traffic. Per the conformance theorem, conformance tests should catch such patterns before deployment; the substrate's schema-change interface refuses one-shot breaking changes when client-conformance witnesses indicate active use.
- **Atomic non-iso type changes.** Per the math grounding, the substrate cannot present two value-axes for the same predication simultaneously without breaking the fibration's coherence frame. A non-iso type change is therefore not admitted as a one-shot atomic operation; it is admitted only as a multi-phase sequence (add new column with new type → backfill via a substrate-content conversion morphism → switch readers → retract old). Whether a vendor's "atomic type change" surface preserves traffic is a property of how the vendor compresses the multi-phase sequence; per [online-schema-change-zero-downtime](../theorems/online-schema-change-zero-downtime.md), traffic is preserved iff each compressed step is itself a monotone admit or retraction-protocol-conformant retract.

## Tools / patterns (re-cast as math instances)

- **GitHub gh-ost** — implements the multi-phase rename pattern for MySQL via shadow-table maintenance plus atomic switch; the shadow table is a phase-2 alias predicate, the switch is the iso specialization made effective.
- **pt-online-schema-change** — Percona's similar tool; same math role, different mechanism (triggers vs. binlog).
- **PostgreSQL CONCURRENTLY** — `CREATE INDEX CONCURRENTLY` is the canonical asynchronous cover refinement; `ALTER TABLE` with non-blocking lock modes is the canonical monotone admit.
- **Application-level handling** — code that handles both old and new schemas during transition is, structurally, code that is conformant to the schema fiber at multiple intermediate states; the math licenses this as the right discipline for non-forward-compatible changes.

## Position

Online schema change is the database-platform's instantiation of the predication-fibration's monotone-admission discipline applied to the substrate's self-representation. It is not a vendor-specific operational pattern: it *is* the math of monotone admission applied to schema predications, and the multi-phase patterns are the structurally licensed sequences when the change cannot be monotonized in one phase. A platform that ships schema-change tooling as a separate concern from the substrate's general admission discipline is duplicating machinery the math identifies as one construction.
