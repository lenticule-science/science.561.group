---
type: definition
class: substrate-entity
realizes: [deployment-target, container-image]
depends-on: [deployment-target, container-image, identity-record, hash-discipline]
see-also: [backup-record, federation-graph]
---

# Deployment record

A **deployment record** is the substrate-entity formal definition of one *deployed instance* of the substrate: a running instantiation of a [container-image](teaching/explanations/container-image.md) on a particular [deployment-target](teaching/explanations/deployment-target.md), with its own substrate-instance-identity, persistence binding, and federation-graph membership.

## Structural fields

- **`id`** — kebab-case identifier; canonical-form hash of `(image, target, instance-identity)`.
- **`description`** — one-line summary (typically the deployment's purpose: `production-east-us`, `staging`, `dev-emsenn`).
- **`container-image`** — reference to the [container-image](teaching/explanations/container-image.md) being run. Includes the image's canonical-form hash for verification.
- **`deployment-target`** — reference to the [deployment-target](teaching/explanations/deployment-target.md) the image is running on.
- **`instance-identity`** — reference to an [identity-record](identity-record.md) bound to this specific deployment instance. The substrate's signed witnesses produced at this instance use this identity. Per [identity-record](identity-record.md), the private component lives at the deployment-target's identity-key custody mechanism.
- **`persistence-binding`** — references to the persistence layer the instance uses: which volume, which database, which object store. Per [deployment-target](teaching/explanations/deployment-target.md), the persistence-binding must match the target's persistence model.
- **`federation-membership`** — references to the [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) entries (outposts, inboxes) this instance participates in.
- **`backup-recipients`** — references to the [identity-records](identity-record.md) under which this instance's backups are encrypted. Per [backup-discipline](teaching/explanations/backup-discipline.md), distinct from the instance's own identity.
- **`deployed-at`** — substrate ordinal at which the deployment was instantiated.
- **`retired-at`** — substrate ordinal at which the deployment was retired (decommissioned, replaced). Absent for active deployments.
- **`predecessor`** — optional reference to the prior deployment of the same role (for blue/green deployments, rolling upgrades, replacement deployments).
- **`resource-limits`** — declared resource bounds for this deployment: CPU, memory, disk, network. Per [deployment-target](teaching/explanations/deployment-target.md), must be within the target's offerings.
- **`closure-kind`** — `deployment`.

## Invariants

- **Image-target compatible.** The `container-image`'s format must match the `deployment-target`'s accepted formats. Per [deployment-target](teaching/explanations/deployment-target.md), an OCI-only image cannot be deployed to a Nix-only target without a translation layer.
- **Instance-identity unique per deployment.** Each deployment has its own identity-record. Two deployments sharing an identity is a misconfiguration — federation cannot distinguish their signed witnesses.
- **Persistence-binding compatible.** The persistence-binding must match the target's persistence model. A deployment to an ephemeral target without persistent-volume binding is admissible only for transient workloads.
- **Backup-recipients off-instance.** The `backup-recipients` identity-records' private keys must be held off-instance, per [backup-discipline](teaching/explanations/backup-discipline.md). A deployment with backup-recipient private keys on the same instance has no real backup protection.
- **Image hash matches deployed bytes.** The deployed bytes' canonical-form hash must equal the cited container-image's hash. A deployment whose runtime bytes don't match the image hash has been tampered or is misreported.

## Operations

- *Deploy.* Per [deploy-to-target](../morphisms/deploy-to-target.md), instantiate the cited container-image on the cited deployment-target, bind to the cited persistence layer, register the instance-identity, join the federation-graph. Deploy is a substrate operation producing a witness recording the deployment record's id.
- *Update.* Replace the deployment's container-image with a new version (typically a rolling upgrade). The update is a new deployment record with a `predecessor` link to the prior deployment.
- *Retire.* Mark the deployment retired, gracefully draining federation membership and persistence handoff. Retirement is a substrate operation; the deployment record persists in the audit chain.
- *Backup.* Per [take-backup](../morphisms/take-backup.md), the deployment's substrate state is captured under the cited backup-recipients.
- *Audit.* Querying the deployment's backup history, federation activity, resource consumption, and uptime is a substrate traversal.

## Position in the substrate

Deployment records are the substrate's *running-instance registry*. Without them, "which substrate-instance am I federating with?" has no substrate-resident answer; with them, every active substrate-instance has a queryable record carrying its identity, image, target, and federation membership. Per [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md)'s identity registry, the federation graph references deployment-records by id when validating peer signatures.

The pattern composes with [container-image](teaching/explanations/container-image.md) (which the deployment runs), with [deployment-target](teaching/explanations/deployment-target.md) (which the deployment runs on), with [identity-record](identity-record.md) (the instance-identity), with [backup-record](backup-record.md) (which records the deployment's backups), and with [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) (the deployment's federation membership).
