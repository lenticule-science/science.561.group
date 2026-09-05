---
description: "Updates an existing spec file by merging new claim sets into its MUST, CANNOT, and Pending sections without duplicating entries. Use when new math results need to be reflected in an already-written spec."
skill-closure-kind: procedure
---

# update-spec-file

Given: `spec_path` — path to an existing spec file; `claim_sets` — output of
`build-spec-claims.md`.

1. Read `spec_path` in full. Parse the four sections: MUST, CANNOT, CAN, Pending.

2. For each item in `claim_sets.must_list`:
   - If an item with the same §source_id is already in MUST: skip.
   - If an item with the same §source_id is in Pending: remove it from Pending,
     add it to MUST.
   - Otherwise: add to MUST.

3. For each item in `claim_sets.cannot_list`:
   - If an item with the same §source_id is already in CANNOT: skip.
   - Otherwise: add to CANNOT.

4. For each item in `claim_sets.pending_list`:
   - If an item with the same blocking_item is already in Pending: skip.
   - If an item with the same blocking_item is already in MUST or CANNOT: skip
     (it has been resolved).
   - Otherwise: add to Pending.

5. If Pending is now empty, write `(none)` as the section body.

6. Save `spec_path`.
