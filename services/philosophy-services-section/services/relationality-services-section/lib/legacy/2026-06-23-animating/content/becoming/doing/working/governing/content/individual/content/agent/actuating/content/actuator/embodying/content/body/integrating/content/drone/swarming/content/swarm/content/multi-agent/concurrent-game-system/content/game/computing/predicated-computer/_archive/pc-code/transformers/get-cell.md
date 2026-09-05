---
type: morphism
class: store-operator
realizes: [content-addressed-store, hash-discipline]
depends-on: [content-addressed-store]
see-also: [put-cell, has-cell]
---

# GetCell

The operator that reads a substrate cell from the [content-addressed store](../objects/content-addressed-store.md) by its cell-id. GetCell is the substrate's primary read from content-addressed storage; every operation that needs the byte content of a cell — replay, federation export, audit reconstruction — reads via GetCell.

## Signature

`get-cell(cell-id) → canonical-bytes | error`

Input:

- **`cell-id`** — a 64-character lowercase hexadecimal SHA-256 digest. The cell's substrate identity.

Output:

- **`canonical-bytes`** — on success, the canonical bytes the cell was written with. The substrate guarantees these bytes hash to the cell-id.
- **`error`** — on failure, one of: invalid-id-format error (the cell-id is not a 64-char lowercase hex string), not-found error (no cell exists for this cell-id in the store), corruption error (a file exists at the cell-id's path but its bytes don't hash to cell-id), I/O error.

## Operational semantics

GetCell proceeds in five steps:

1. *Validate format.* Check that cell-id is a 64-character lowercase hexadecimal string. Failure returns invalid-id-format error.
2. *Path-derive.* Compute the on-disk path for cell-id (the same deterministic mapping PutCell uses).
3. *Read.* Read the file's bytes from the path. If the file does not exist, return not-found.
4. *Verify hash.* Compute the SHA-256 of the read bytes. Compare against cell-id. If they don't match, return corruption error.
5. *Return bytes.* Return the bytes exactly as read — no reformatting, no whitespace normalization, no JSON re-serialization. The bytes returned must hash to cell-id.

## Engineering invariants

- **Byte-exact.** The bytes returned are the bytes stored, byte-for-byte. The substrate does not silently reformat content at the read boundary.
- **Hash-verified on read.** Every read verifies the bytes hash to the cell-id; corruption is detected at read, not silently propagated.
- **No write side effects.** GetCell is read-only; it does not modify the store, the event log, or any substrate state.

## Performance notes

A typical implementation may cache GetCell results in memory or in a derived index. Caches are admissible *only when* (a) cache invalidation respects the immutability of cells (a cell's bytes never change for a given cell-id, so cached bytes never become stale), and (b) any cached read still verifies the hash (cache poisoning is detected when the cached bytes don't hash to the requested cell-id).

## Failure modes

- **Not found.** No cell exists for this cell-id. GetCell returns not-found; the caller may attempt to fetch the cell from a federated peer (per [replication](teaching/explanations/replication.md)) or accept the absence.
- **Corruption.** A file exists but its bytes don't hash to cell-id. The store is corrupted at this cell; GetCell returns the corruption error; the caller does not silently use the corrupted bytes. The substrate's corruption-handling discipline determines next steps.
- **I/O error.** Filesystem read failure (disk error, permission denied, etc.). GetCell returns I/O error.

## Position in the substrate

GetCell is the substrate's *content-content-addressed-read primitive*. It is what makes the store [content-addressed](teaching/explanations/hash-discipline.md): a cell-id, anywhere in the substrate (in a witness, in a cross-reference, in a federation message), refers to the *same content* iff GetCell returns the same bytes for the cell-id at any host. Cross-instance content identity is GetCell's invariant.
