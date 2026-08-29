---
title: "Upgrade flow"
description: "How the OS upgrades itself. Drain → replace image → resume; with rollback."
kind: spec
status: normative
version: "0.2"
---

# Upgrade flow

How the OS upgrades to a new image.
Designed for zero-downtime where possible; clean rollback when not.

## Grounded in

- [`predicated-computing/theorems/forward-migration-preserves-prior-content`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/forward-migration-preserves-prior-content.md) — additive rule-system migration (§3 — old and new schemas both honored during transition; old rules retire only after new schema fully adopted) preserves prior content; the rollback claim (§2, §4 step 3 — "rollback returns to pre-upgrade state byte-identical") is the forward-migration theorem's contrapositive: the migration was content-preserving, so the pre-upgrade state remains reproducible.
- [`predicated-computing/theorems/boot-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) — the post-upgrade resume (§1 step 5) is a deterministic boot of the new image against the snapshot from §1 step 3.
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Phases

1. **Pre-flight.** New image is fetched, verified (signature + hash), and staged.
2. **Drain.** Runtime transitions to runlevel 4 (draining).
  New sessions are rejected; in-flight respond invocations complete.
3. **Snapshot.** A `snapshot` event is appended; the substrate's current state is recorded.
4. **Replace.** The old image is set aside; the new image is activated (atomic at the system level).
5. **Resume.** The new image boots; runs self-test; transitions to default runlevel.
6. **Verify.** Post-upgrade conformance vectors run; the new version's announced featureset is exercised.

## 2. Rollback

If verification fails:

1. The old image is reactivated (atomic).
2. The substrate state replayed up to the snapshot.
3. The system returns to the pre-upgrade state.
4. The failed-upgrade attempt is logged.

## 3. Online schema change

For schema migrations during upgrade, per `database-platform/concepts/online-schema-change`:

- Old schema and new schema both honored during the transition.
- Closure rules adapt to either.
- Once the new schema is fully adopted, old rules retire.

## 4. Conformance

Upgrade passes:

1. Drain completes; in-flight calls finish; new sessions queued or rejected.
2. Replace is atomic.
3. Rollback returns to pre-upgrade state byte-identical.
4. Verification gates the upgrade's "completed" status.
