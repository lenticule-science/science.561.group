---
type: morphism
class: store-operator
realizes: [content-addressed-store]
depends-on: [content-addressed-store]
see-also: [put-cell, get-cell]
---

# HasCell

The operator that checks whether the [content-addressed store](../objects/content-addressed-store.md) contains a cell with a given cell-id, without retrieving the cell's bytes. HasCell is the substrate's primary presence-test on content-addressed storage; operators use it when they need to know whether content exists without paying the cost of reading it.

## Signature

`has-cell(cell-id) → bool | error`

Input:

- **`cell-id`** — a 64-character lowercase hexadecimal SHA-256 digest.

Output:

- **`true`** — a cell exists for cell-id and (when the substrate's check policy is strict) its bytes hash to cell-id.
- **`false`** — no cell exists for cell-id.
- **`error`** — invalid-id-format error or corruption error.

## Operational semantics

HasCell proceeds in three steps:

1. *Validate format.* Check the cell-id format. Failure returns invalid-id-format.
2. *Path-derive.* Compute the on-disk path.
3. *Check.* Verify the file exists at the path; per the substrate's check policy, optionally verify that the file's bytes hash to cell-id (strict policy) or accept presence as confirmation (permissive policy). On strict-policy hash mismatch, return corruption error.

## Strict vs. permissive checking

A substrate implementation may declare its HasCell policy as one of:

- **Strict:** Every HasCell read fully verifies the hash. Slower but guarantees no false-positive presence claims. The cell is *truly* present iff HasCell returns true.
- **Permissive:** HasCell returns true when the file exists, without re-hashing. Faster but the answer may be stale if the file is corrupted. The cell *appears* present iff HasCell returns true; full verification requires GetCell.

The choice is per-implementation and is part of the substrate's specification. Implementations that mix policies (sometimes verify, sometimes don't) violate the discipline and produce confusing audit trails.

## Engineering invariants

- **Read-only.** HasCell does not modify any substrate state.
- **Cheaper than GetCell.** HasCell does not return bytes; its operational cost is at most a directory lookup and (under strict policy) a file read.
- **Consistent with GetCell.** A HasCell returning true must be immediately followed by GetCell succeeding for the same cell-id (modulo a concurrent retirement, which the substrate's discipline accounts for).

## Position in the substrate

HasCell is the cheap-presence-check primitive. Replication uses it to determine which cells a peer has and which to fetch; audit uses it to verify that a witness's cited cells exist; substrate validation uses it to check vocabulary completeness without reading every cell.
