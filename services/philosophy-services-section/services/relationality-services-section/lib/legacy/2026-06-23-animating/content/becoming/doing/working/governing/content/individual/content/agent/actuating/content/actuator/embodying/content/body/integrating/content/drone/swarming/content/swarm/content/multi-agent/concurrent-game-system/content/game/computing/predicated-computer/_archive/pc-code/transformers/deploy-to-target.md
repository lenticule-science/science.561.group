---
type: morphism
class: deployment-operation
realizes: [deployment-target, container-image]
depends-on: [deployment-record, container-image, deployment-target, identity-record]
see-also: [restore-from-backup, take-backup]
---

# Deploy to target

The substrate operation that instantiates a [container image](teaching/explanations/container-image.md) on a [deployment target](teaching/explanations/deployment-target.md), producing a new running [deployment record](../objects/deployment-record.md). Deploy-to-target is the substrate's primary deployment-construction operator.

## Signature

`deploy-to-target(container-image, target, instance-identity, persistence-binding) → deployment-record`

Inputs:

- **`container-image`** — reference to the container-image to instantiate.
- **`target`** — reference to the deployment-target to deploy on.
- **`instance-identity`** — identity-record (newly generated or existing) for this deployment instance.
- **`persistence-binding`** — references to the persistence layer the deployment will use on the target.

Outputs:

- **`deployment-record`** — the new deployment-record describing the running instance, with `deployed-at` set to the substrate ordinal of completion.

## Operational semantics

Deploy-to-target proceeds in six steps:

1. Verify the container-image's format is compatible with the deployment-target's accepted formats. Per [deployment-target](teaching/explanations/deployment-target.md), refuses if mismatched.
2. Verify the persistence-binding is admissible on the target. Refuses if the binding asks for persistence the target doesn't offer.
3. Deliver the container-image to the deployment-target via the target's deployment mechanism (Replit's deploy API, kubectl apply, ssh + container runtime, etc.). Verify the delivered bytes' canonical-form hash matches the cited image hash.
4. Instantiate the image on the target with the persistence-binding attached. The substrate's runtime starts up, reads its bootstrap content from the persistence-binding, registers the instance-identity, and begins serving.
5. Register the instance-identity with the deployment-target's identity-key custody (cloud KMS, hardware token, env vars per the target's mechanism).
6. Assemble the deployment-record citing all the above. Append to the substrate's audit chain. Optionally federate the new instance into the federation-graph.

Per [settlement-determinism](../theorems/settlement-determinism.md), the deployment is deterministic given `(container-image hash, target, persistence-binding state)`: two deploy-to-target invocations with byte-identical inputs produce byte-identical substrate behavior on compatible targets. Per [conformance](teaching/explanations/conformance.md), the deployment can be conformance-tested by exercising substrate operators against the new deployment and comparing canonical-form-hashed outputs to expected values.

## Engineering invariants

- **Image-target compatibility.** Per [deployment-record](../objects/deployment-record.md) invariants, image format must match target acceptance.
- **Persistence-binding compatibility.** The cited persistence-binding must be admissible on the target.
- **Image-hash verification.** The deployed bytes are hash-verified against the cited image. Mismatches indicate transport corruption or tampering; deployment aborts.
- **Instance-identity uniqueness.** The cited instance-identity must not be in use by another active deployment. Per [identity-record](../objects/identity-record.md), each identity binds to one entity; concurrent use of one identity by two deployments is forbidden.
- **Witness-emitted.** Deploy produces a witness recording the deployment-record id, the image hash, the target id, the persistence-binding id, and the instance-identity id.

## Failure modes

- **Target deployment-mechanism failure.** The target's deployment API is unreachable or rejecting. Substrate retries per policy; persistent failure produces no deployment-record.
- **Image format incompatible.** Refuse before transport.
- **Persistence-binding unavailable.** The target cannot satisfy the binding (volume not allocated, database not provisioned). Refuse with a clear error.
- **Instance-identity in use.** A duplicate-identity attempt is refused; substrate emits a duplicate-identity event.
- **Bootstrap failure.** The substrate's runtime starts but fails to bootstrap (missing closure-rule system content, persistence binding empty when not expected). Surface the bootstrap failure; the deployment may need restore-from-backup.

## Position in the substrate

Deploy-to-target is the operator that *creates* substrate-instance running on hosts. Per [deployment-target](teaching/explanations/deployment-target.md), every running substrate-instance has a deployment-record produced by deploy-to-target (or an equivalent bootstrap operator). Per [federation-convergence](../theorems/federation-convergence.md), federated substrates are independent deployments whose federation-graph entries reference each other's deployment-records by identity.

The pattern composes with [container-image](teaching/explanations/container-image.md), [deployment-target](teaching/explanations/deployment-target.md), [identity-record](../objects/identity-record.md), [deployment-record](../objects/deployment-record.md), [restore-from-backup](restore-from-backup.md) (typically chained for recovery deployments), and the [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) (which the new deployment may register with).
