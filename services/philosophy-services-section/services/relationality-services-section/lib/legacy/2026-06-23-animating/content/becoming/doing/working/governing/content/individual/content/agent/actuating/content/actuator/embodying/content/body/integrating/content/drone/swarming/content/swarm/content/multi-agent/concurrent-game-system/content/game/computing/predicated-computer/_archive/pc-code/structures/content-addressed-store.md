---
type: definition
class: store
realizes: [hash-discipline, canonical-form]
depends-on: [canonical-form, hash-discipline, hash-injectivity-under-canonical-form]
see-also: [predication-graph-store, event-log, snapshot]
---

# Content-addressed store

A **content-addressed store** is a substrate-level store whose entries are addressed by the canonical-form hash of their bytes, immutable once written. Each entry is a (canonical bytes, content-hash) pair such that the hash is the SHA-256 digest of the bytes and the entry's identity is the hash; the store has no ambient names or external indexes that the substrate's correctness depends on. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the hash is an injection from canonical content to byte-identifiers: same content → same hash, different content → different hash (modulo cryptographic-hash collision-resistance).

The store is the engineering realization of the substrate's content-addressing commitment (per [hash-discipline](teaching/explanations/hash-discipline.md)). Where the [predication-graph store](predication-graph-store.md) holds the substrate's live predication content and the [event log](event-log.md) holds the history of operator invocations, the content-addressed store holds the substrate's *content* — canonical-form serializations of cells, sections, snapshots, repair-log entries, operator specifications — in a single uniform addressing scheme.

## Core operations

A content-addressed store supports three operations with substrate-level semantics:

- **`put(canonical_bytes) → content-hash`** — Validate that the bytes are canonical (per [canonical-form](teaching/explanations/canonical-form.md)); compute the SHA-256 hash; verify that any embedded `id` field in the bytes matches the hash; write the bytes at the path derived from the hash. Concurrent puts of the same content succeed identically.
- **`get(content-hash) → canonical_bytes`** — Resolve the path for the hash; read the bytes; verify that the bytes hash to the hash; return the bytes exactly as written. A hash that has no entry returns a not-found error; a hash whose entry's bytes do not hash to it is corruption.
- **`has(content-hash) → bool`** — Check whether an entry exists for the hash and is uncorrupted.

A store may additionally provide enumeration (`list()`) and content-addressing-derived URIs (entries addressable as `https://example.org/cells/<content-hash>` for cross-instance reference).

## Engineering invariants

Five invariants make the store load-bearing:

- **Immutability.** Once an entry is written for a hash, the entry's bytes never change. Updates are creation of new entries with new hashes; the old entry remains accessible for as long as the store retains it.
- **Content equals address.** The hash of the entry's bytes is the entry's address. Two entries with the same hash are the same content; an entry whose stored bytes do not hash to its address is corruption.
- **Indexes are derivable.** Any auxiliary structure — in-memory caches, secondary indexes, database aggregations — is reconstructible from the entries. The store is the source of truth; indexes are conservative.
- **Path layout is deterministic.** Given a content-hash, every conforming implementation derives the same on-disk path. Typically the path is bucketed by hash prefix to avoid directory fan-out.
- **Concurrent writes are safe.** Multiple simultaneous puts of the same content succeed identically; multiple simultaneous puts of different content do not interfere.

## Why the store is substrate

The content-addressed store is *not* an external persistence layer. It is the substrate's commitment that *content has identity, identity is a hash, and the hash is computable from the content*. Two predicated computers running with content-addressed stores can exchange entries by exchanging hashes: whatever `get(h)` returns on either store is the same bytes, by hash-equality. Per [federation-convergence](../theorems/federation-convergence.md), cross-instance federation is meaningful because content-addressing makes "same content" a substrate-decidable question.

A predicated computer that maintains its content in a content-addressed store inherits the store's invariants: immutability, deterministic addressing, derivable indexes, hash-based integrity checks. A predicated computer that uses a name-addressed or location-addressed store has weaker guarantees about cross-instance content identity, and its federation discipline must compensate by separately recording which name maps to which content at which instance.
