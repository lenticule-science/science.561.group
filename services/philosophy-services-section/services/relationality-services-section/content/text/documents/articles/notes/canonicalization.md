---
title: Semantic Canonicalization
description: Role.
---
# Semantic Canonicalization

**Role.** Defines the shared canonicalization and hashing rules for every JSON carrier used by the Cellular Closure Host stack. This document centralizes all byte-level requirements referenced by the cellular, language, closure, storage, ABI, and RPC specifications.

**Depends on.** The abstract semantics in `../semantics/*` for the meaning of cells, judgments, and closure events.

**Provides to.** All carrier and host documents; no other source may redefine canonicalization.

---

## 1. Canonical JSON Form

- **Object keys** MUST be sorted lexicographically. No additional whitespace or formatting is allowed.
- **Arrays** preserve semantic order from the producing specification (e.g., section order in a cell, constructor order, repair-log chronology). Arrays MUST NOT be re-sorted during canonicalization.
- **Strings** MUST be UTF-8. Escape sequences MUST follow JSON standard minimal form.
- **Numbers** MUST be rendered without leading zeros, without a leading `+`, and with minimal exponent form when scientific notation is used.
- **Booleans** MAY appear only when the carrier definition permits them (e.g., Boolean fibers); otherwise numeric or string encodings MUST be used as declared in the carrier spec.

## 2. Hashing Discipline

- Canonical JSON bytes are hashed with SHA-256; the lowercase hexadecimal digest is the canonical identifier for:
  - CDS cells (`id` fields and filenames in storage),
  - RTL judgments when hashed for evidence or replay,
  - refined cells and canonical judgments returned by closure,
  - individual repair-log entries when recorded in evidence sequences,
  - request/response payloads in RPC transcripts.
- Whenever a carrier includes both an embedded identifier and an external filename or envelope hash, all copies MUST match this digest exactly. Any mismatch is a hard error in the consuming layer.

## 3. Ordering Constraints Inherited from Semantics

Canonicalization MUST respect the semantic orders declared by upstream specs:

- **Contexts and declarations** follow their introduction order; α-equivalent reorderings are not allowed.
- **Sections and tables** (Heyting, σ, Δ) follow the declaration order of section elements; table rows and columns MUST mirror that order exactly.
- **Constructors and invariants** are evaluated in the order listed by the producer; repair recipes MUST NOT reorder them.
- **Repair logs** are chronological: each entry appears at the moment the associated state change becomes canonical. Re-sorting by code or hash is forbidden.
- **Evidence arrays** list hashes in causal order: input payloads, repair-log entry hashes, then outputs as applicable.

## 4. Carrier-Specific Canonicalization Hooks

- **Cells (CDS carriers):** Apply RTL normalization strategy declared in the cell before hashing the cell as a whole. Object keys are sorted; arrays retain declared order. Table normalization must follow the section element order.
- **RTL judgments:** Normalize terms using call-by-value, left-to-right order before hashing or embedding. Context order is preserved.
- **Closure outputs:** Refined cells, canonical judgments, and repair logs returned by closure MUST be canonicalized immediately before hashing or returning to callers.
- **RPC envelopes:** Request and response envelopes are canonical JSON with lexicographically sorted keys. Embedded payloads are base64-encoded canonical JSON bytes; the `refined_cds_hash` field MUST equal the hash of the decoded canonical bytes.

## 5. Replay and Storage

- Storage filenames MUST equal the canonical hash of the file content; see `storage.md` for path layout.
- Any attempt to replay closure or transport interactions MUST re-canonicalize payloads using this document before hashing; witnesses derived from non-canonical bytes are invalid.

---

No other document may introduce alternative canonicalization or hashing rules. When a carrier or host document describes ordering, hashing, or byte identity, it is invoking the rules defined here.
