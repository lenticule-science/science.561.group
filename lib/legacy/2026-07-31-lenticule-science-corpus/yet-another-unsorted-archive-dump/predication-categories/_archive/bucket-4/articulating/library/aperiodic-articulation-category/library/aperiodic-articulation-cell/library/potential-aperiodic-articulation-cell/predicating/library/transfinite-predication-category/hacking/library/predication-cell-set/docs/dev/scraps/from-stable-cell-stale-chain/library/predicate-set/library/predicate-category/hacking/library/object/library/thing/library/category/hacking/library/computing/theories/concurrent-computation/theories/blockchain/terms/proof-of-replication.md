---
name: Proof of Replication
description: A cryptographic proof that a storage provider holds a unique, encoded copy of data.
date-created: 2026-04-05
sources:
  - url: https://spec.filecoin.io/algorithms/pos/
---

Proof of Replication (PoRep) is a cryptographic mechanism where a storage provider proves they are holding a unique, physically distinct copy of data.

**How it works**:

1. The provider receives data from a client.
2. The provider encodes the data through a sequence of graph and hashing operations, creating a "replica" — a sealed, encoded version of the original.
3. The encoding process is intentionally slow and computationally expensive, making it hard to fake by recomputing on-demand.
4. The provider publishes a proof that they possess this replica.

**Key property**: PoRep prevents "Sybil attacks" where a single provider could claim to store multiple copies when they actually store only one. By forcing the encoding step, unique replicas are created and proved.

PoRep is performed once, at the time the data is sealed. After that, the provider must continuously prove they still have the replica using Proof of Spacetime (PoSt).

Used in Filecoin to incentivize long-term storage by requiring providers to maintain unique replicas.

See: [Content-Addressed Storage: IPFS, Arweave, and the Permaweb](../texts/content-addressed-storage.md)
