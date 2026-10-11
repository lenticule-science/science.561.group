---
type: morphism
class: lifecycle-operation
realizes: [boot-sequence, deployment-target]
depends-on: [boot-sequence, deployment-record, identity-record, persistent-set, closure-rule-system, witness]
see-also: [restore-from-backup]
---

# Boot substrate

The substrate operation that *takes a substrate-instance from cold to operational*: the full [boot-sequence](teaching/explanations/boot-sequence.md) executed as a single substrate-level operation.

## Signature

`boot-substrate(deployment-record-id) → (boot-outcome, boot-witness-chain)`

Inputs:

- **`deployment-record-id`** — reference to the [deployment-record](../objects/deployment-record.md) being booted.

Outputs:

- **`boot-outcome`** — `ready` (substrate is operational), `degraded` (partial functionality, some phase failed but not blocking), `failed` (boot aborted).
- **`boot-witness-chain`** — references to per-phase boot witnesses; an auditor can replay the boot.

## Operational semantics

Per [boot-sequence](teaching/explanations/boot-sequence.md), boot proceeds through nine phases. Each phase produces a witness. If any phase fails fatally, boot aborts with the phase's failure-witness as the chain's tail.

The boot-witness-chain becomes part of the substrate's event log; the substrate's audit can review boot history.

## Engineering invariants

- **Deterministic.** Per [settlement-determinism](../theorems/settlement-determinism.md) and [boot-determinism](../theorems/boot-determinism.md), the same deployment with the same prior state produces the same post-boot state.
- **Witnessed.** Per [witness](../objects/witness.md), every phase outcome is recorded.
- **Failure-explicit.** Boot failures produce explicit witnesses; degraded boots produce explicit degraded-state witnesses.

## Position in the substrate

Boot-substrate is the substrate's *cold-start primitive*. Composes with [restore-from-backup](restore-from-backup.md) (which initializes persistent-set from a backup before booting) and [deploy-to-target](deploy-to-target.md) (which provisions the deployment that boot brings up).
