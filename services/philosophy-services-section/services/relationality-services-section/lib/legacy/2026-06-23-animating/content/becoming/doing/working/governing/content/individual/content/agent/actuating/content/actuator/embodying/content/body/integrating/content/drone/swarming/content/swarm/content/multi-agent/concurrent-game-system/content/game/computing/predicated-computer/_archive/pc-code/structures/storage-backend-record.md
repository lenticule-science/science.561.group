---
type: definition
class: substrate-entity
realizes: [storage-backend, persistent-set]
depends-on: [storage-backend, persistent-set, deployment-record, encryption]
see-also: [content-addressed-store]
---

# Storage backend record

A **storage backend record** is the substrate-entity formal definition of a [storage backend](teaching/explanations/storage-backend.md): the predication-graph entity declaring a particular physical-or-cloud store the substrate uses for its [persistent set](teaching/explanations/persistent-set.md).

## Structural fields

- **`id`** — kebab-case identifier (e.g., `local-fs-primary`, `s3-bucket-prod-east`).
- **`description`** — one-line summary.
- **`backend-kind`** — `local-fs`, `nfs`, `s3-compatible`, `gcs`, `azure-blob`, `rocksdb`, `lmdb`, `dynamodb`, `spanner`, etc.
- **`location-spec`** — backend-specific addressing: filesystem path, S3 bucket+prefix, database connection string. For untrusted-network backends, the URL of the endpoint.
- **`auth-credentials`** — references to credentials (typically encrypted via [encryption](teaching/explanations/encryption.md)) for accessing the backend.
- **`encryption-policy`** — per [encryption](teaching/explanations/encryption.md), declares whether content is encrypted-at-rest before reaching this backend, under which recipients.
- **`durability-properties`** — declared durability: `single-disk`, `replicated-N`, `geo-distributed`, `eventually-consistent`.
- **`consistency-properties`** — `strong-consistency`, `read-after-write`, `eventual-consistency`.
- **`write-throughput-budget`** — per [resource-budget](teaching/explanations/resource-budget.md), the throughput limit imposed by this backend.
- **`bound-deployments`** — references to [deployment-records](deployment-record.md) using this backend.
- **`closure-kind`** — `storage-backend`.

## Invariants

- **Substrate-recorded.** Per [self-representation](teaching/explanations/self-representation.md), the storage-backend configuration is queryable.
- **Backend-kind-coherent.** The location-spec, auth-credentials, and durability-properties match the cited backend-kind.
- **Encryption-policy-respected.** Per [encryption](teaching/explanations/encryption.md), content sent to backends marked `encrypt-before-send` is encrypted-at-rest at the substrate layer.

## Position in the substrate

Storage backend records are the substrate's *persistence-configuration registry*. Per [deployment-record](deployment-record.md), each deployment cites which storage-backend its persistent-set lives on; substrate behavior is backend-agnostic per [deployment-determinism](../theorems/deployment-determinism.md).
