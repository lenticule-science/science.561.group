---
type: concept
class: lifecycle-discipline
depends-on: [bootstrap, deployment-record, container-image, witness, settlement-determinism]
see-also: [restore-from-backup]
---

# Boot sequence

The *substrate's startup sequence from cold to operational*: the ordered phases through which a substrate-instance moves from "container-image instantiated" to "ready to admit operations."

Phases:

1. **Container start** — per [deploy-to-target](../morphisms/deploy-to-target.md), the deployment-target instantiates the [container-image](container-image.md). The substrate's runtime executable starts.
2. **Runtime self-check** — the runtime verifies its own integrity (image hash matches expected, all linked libraries are present, the host's cited capabilities are available).
3. **Persistent-set attach** — per [persistent-set](persistent-set.md), the runtime connects to the cited [storage-backend](storage-backend.md). For empty deployments, this initializes a fresh persistent set; for restored deployments, this opens the existing one.
4. **Identity-record activation** — per [identity-record](../objects/identity-record.md), the substrate's instance-identity is loaded from the deployment-target's identity-key custody (cloud KMS, hardware token, file-based keychain). The runtime verifies the identity-key's private component is accessible.
5. **Bootstrap content load** — per [bootstrap](bootstrap.md), the substrate's bootstrap content (initial closure-rule system, initial scope records, initial agent records) is loaded from container-image or restored from backup.
6. **Closure-rule system activation** — per [closure-rule-system](../objects/closure-rule-system.md), the cited rule-system version becomes active. The runtime's closure 2-monad is configured.
7. **Federation graph join** — per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), the substrate registers with its declared federation peers. Initial handshakes per [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md) verify peer identities.
8. **Heartbeat scheduler activation** — per [heartbeat-scheduler](theories/agential-orchestration-platform/objects/heartbeat-scheduler.md), the per-entity tick scheduler starts.
9. **Ready** — the substrate is ready to admit operations. A boot-witness is appended to the event log marking the boot complete.

Per [witness](../objects/witness.md), each phase produces a boot-witness recording its outcome. An auditor can review boot history per substrate-instance.

Per [settlement-determinism](../theorems/settlement-determinism.md), the boot sequence is deterministic given `(container-image, persistent-set state, deployment-target)`. Two boots of the same deployment with the same prior state produce the same post-boot state.

Boot failures:

- **Missing identity-key.** Phase 4 fails; the substrate cannot operate without its identity. Recovery: provision the identity-key at the deployment-target.
- **Persistent-set corruption.** Phase 3 fails. Recovery: per [restore-from-backup](../morphisms/restore-from-backup.md), restore from a recent backup.
- **Federation peer unreachable.** Phase 7 may proceed in degraded mode (substrate operates but cannot federate); per the substrate's policy, this may or may not block boot.

Per [boot-determinism](../theorems/boot-determinism.md), the boot sequence is byte-identically reproducible across host changes for the same deployment-record.
