---
type: morphism
class: store-operator
realizes: [content-addressed-store, hash-discipline]
depends-on: [canonical-form, content-addressed-store]
see-also: [get-cell, has-cell]
---

# PutCell

The operator that writes a substrate cell — a canonical-form-serialized substrate object — into the [content-addressed store](../objects/content-addressed-store.md) under the cell's hash-derived path. PutCell is the substrate's primary write into content-addressed storage; every cell that the substrate persists for replay, federation, or audit is written via PutCell.

## Signature

`put-cell(canonical-bytes) → cell-id | error`

Input:

- **`canonical-bytes`** — a UTF-8 byte sequence asserted to be a canonical-form serialization of a substrate object. The caller is responsible for canonicalizing before passing; PutCell may accept and re-canonicalize, or may reject non-canonical input, depending on the substrate's strict-or-permissive policy.

Output:

- **`cell-id`** — on success, the lowercase 64-character hexadecimal SHA-256 digest of the canonical bytes. The cell-id is the cell's substrate identity from this moment forward.
- **`error`** — on failure, one of: parse error (input is not valid JSON), structural error (input does not satisfy the substrate's cell shape), id-mismatch error (input contains an `id` field disagreeing with the computed hash), corruption error (the store contains a file at the cell-id's path with bytes that don't hash to it), I/O error.

## Operational semantics

PutCell proceeds in seven steps:

1. *Parse.* Validate that the bytes are well-formed UTF-8 JSON. Failure aborts.
2. *Validate structurally.* Check that the parsed object satisfies the substrate's cell shape (required keys present, types correct, no unknown keys at the top level). Failure aborts.
3. *Canonicalize.* Apply the substrate's canonical-form rules (per [canonical-form](teaching/explanations/canonical-form.md)) to produce canonical bytes. If the input was already canonical, this is a no-op.
4. *Hash.* Compute the SHA-256 digest of the canonical bytes. Compare against any embedded `id` field in the input; mismatch aborts.
5. *Path-derive.* Compute the on-disk path for the cell-id (e.g., `$ROOT/cells/<two-hex-prefix>/<cell-id>.json`).
6. *Check-or-write.* If the path already has a file, read the file's bytes; verify they hash to cell-id; on mismatch return a corruption error; on match return cell-id without rewriting. If the path has no file, write the canonical bytes via temp-file-rename for atomicity, fsync the file and parent directory, and return cell-id.
7. *Witness emit.* Append a witness entry to the [event log](../objects/event-log.md) recording the put: the cell-id, the put's origin, the timestamp, and any repair-log entries from the canonicalize step.

## Engineering invariants

- **Idempotent.** Two PutCell invocations of the same canonical bytes produce the same cell-id and end with the same on-disk content. Concurrent invocations are safe; at-least-one succeeds, all-successful end with consistent state.
- **Content-equals-address.** The cell's bytes hash to its cell-id exactly. If they don't, the store is corrupted; PutCell flags the corruption and refuses to write a contradiction.
- **Atomic.** Partial writes that crash mid-operation leave the store in a state where the partial cell does not appear (the temp file is incomplete, the rename did not occur). The store's invariant — every present cell hashes to its address — is preserved across crashes.
- **Witnessed.** Every PutCell produces a witness; the witness goes into the event log. No silent writes.

## Failure modes

- **Corruption detected.** A file at the cell-id's path has bytes that don't hash to the cell-id. The store is in a corrupted state; PutCell does not overwrite the file (the existing content might be authoritative-but-corrupted; the answer is investigation, not silent repair). The substrate's corruption-handling discipline determines next steps.
- **Concurrent collision.** Two simultaneous PutCells of the same cell-id race for the temp-rename. The substrate's filesystem semantics (atomic rename) ensure exactly one succeeds in writing the file; the other's rename either fails (target exists; the operator detects, verifies the file, returns the cell-id) or succeeds (the operator writes its own copy of the same content; the substrate's invariant holds).
- **Out-of-space.** The substrate-level error is recorded in the witness as an I/O error; the cell is not written; the caller may retry on freed space.

## Position in the substrate

PutCell is one of the substrate's three [content-addressed-store](../objects/content-addressed-store.md) operations (with [GetCell](get-cell.md) and [HasCell](has-cell.md)). It is what makes a substrate object persisted — the substrate's commitment that this content, with this hash, can be retrieved, replayed, and federated.
