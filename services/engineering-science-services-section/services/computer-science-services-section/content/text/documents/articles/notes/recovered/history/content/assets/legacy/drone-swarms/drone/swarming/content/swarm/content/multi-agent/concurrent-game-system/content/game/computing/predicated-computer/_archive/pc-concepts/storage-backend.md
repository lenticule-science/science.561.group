---
type: concept
class: persistence-discipline
depends-on: [persistent-set, content-addressed-store, deployment-target, hash-discipline]
see-also: [storage-record]
---

# Storage backend

The *physical-or-cloud store* that the substrate's [persistent set](persistent-set.md) lives in: filesystem, object store, distributed filesystem, embedded database. The storage backend is where the substrate's bytes actually rest when not in the [working set](working-set.md).

Common storage backends:

- **Local filesystem** — POSIX-compliant local filesystem (ext4, xfs, btrfs, zfs, NTFS). Simplest deployment; suitable for single-host substrates.
- **S3-compatible object store** — AWS S3, GCS, MinIO, Backblaze B2. Suitable for cloud-deployed substrates with off-host durability.
- **Network-attached filesystem** — NFS, SMB. Suitable for multi-host substrates sharing a filesystem.
- **Distributed filesystem** — Ceph, GlusterFS, HDFS. Suitable for high-throughput / high-availability substrate clusters.
- **Embedded key-value store** — RocksDB, LMDB, BadgerDB. Suitable for substrates that want a content-addressed store integrated with the runtime.
- **Cloud-managed database** — DynamoDB, Spanner, CosmosDB. Suitable for cloud-native substrates that want managed durability.

Per [deployment-target](deployment-target.md), the storage-backend is part of a deployment-record's persistence-binding. Per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md), substrate behavior is backend-agnostic; the same substrate runs identically on any backend that satisfies the persistent-set's invariants (immutable, content-addressed, durable).

The storage backend's responsibilities:

- **Atomic writes.** A persistent-set entry is either fully written or not at all; partial writes are inadmissible.
- **Durable on commit.** Once the backend acknowledges a write, the bytes survive process / host crash. Per the backend's discipline (fsync, replication, write-ahead-log).
- **Content-addressable lookup.** Given a hash, return the bytes (or report absent).
- **Concurrent-safe.** Multiple substrate readers / writers can operate without corruption.

Per [encryption](encryption.md), the substrate's choice of storage backend doesn't change encryption semantics: encrypted-at-rest content is encrypted at the substrate layer before reaching the backend, so a compromised backend doesn't expose plaintext. Per [encrypted-region-replay-equivalence](../theorems/encrypted-region-replay-equivalence.md), substrate behavior is independent of whether the backend is on a trusted or untrusted host.
