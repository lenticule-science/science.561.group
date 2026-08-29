---
type: theorem
class: engineering-claim
status: proved
depends-on: [online-schema-change, schema-evolution, forward-migration-preserves-prior-content, transaction-atomicity]
see-also: []
---

# Online schema change preserves traffic

**Claim.** For [forward-compatible](../../../theorems/forward-migration-preserves-prior-content.md) schema changes (additions only — new columns with defaults, new indexes, new tables), the substrate can perform the change without blocking concurrent reads or writes. The substrate's traffic is preserved throughout.

For non-forward-compatible changes (column removal, type change, breaking constraint addition), online schema change requires multi-phase patterns (add new, migrate, switch, remove old) that preserve traffic but require coordinated client updates.

## Why this holds

**Part 1: Forward-compatible additions don't break existing content.** Per [forward-migration-preserves-prior-content](../../../theorems/forward-migration-preserves-prior-content.md), adding new schema elements doesn't invalidate existing data. Reads on old data continue to work; writes on new data conform to the extended schema.

**Part 2: Index builds can run in background.** Per [secondary-index](teaching/explanations/secondary-index.md), the substrate's index build doesn't require locking the table. Concurrent reads continue using full-scan; concurrent writes update both the table and the (in-progress) index.

**Part 3: Schema metadata is itself substrate content.** Per [self-representation](../../teaching/explanations/self-representation.md), the schema is queryable substrate state. Schema changes are admit operations; per [transaction-atomicity](../../../theorems/transaction-atomicity.md), they can be atomic.

## Engineering consequence

- **No-downtime deployments.** The substrate can evolve its schema without service interruption.
- **Gradual client updates.** Forward-compatible additions can be deployed before client code uses them; clients update at their own pace.
- **Audit-trail of schema evolution.** Per [witness](../../../objects/witness.md), every schema change is recorded.

## What the theorem rules out

- A schema change that requires a global lock (e.g., a non-online ALTER TABLE in some databases) would block traffic during the change. Online schema change patterns specifically avoid this.
- A breaking change deployed without the multi-phase pattern (e.g., dropping a column while clients still query it) would break traffic. Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), conformance tests should catch such patterns before deployment.

## What the theorem requires

- The schema change is forward-compatible, OR follows a multi-phase pattern.
- Per [self-representation](../../teaching/explanations/self-representation.md), schema is substrate content.
- Per [forward-migration-preserves-prior-content](../../../theorems/forward-migration-preserves-prior-content.md), the substrate's migration discipline is sound.
