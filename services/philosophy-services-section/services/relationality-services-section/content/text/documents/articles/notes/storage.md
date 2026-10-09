---
title: Cellular Data Storage (CDS‑Storage)
description: "This document occupies Layer 2s (CDS‑Storage) of the GFRTU stack:"
---
# Cellular Data Storage (CDS‑Storage)

**Specification – Version 0.x (normative)**

## Layer Declaration — CDS‑Storage (Layer 2s: Storage Substrate)

This document occupies Layer 2s (CDS‑Storage) of the GFRTU stack:

- **Role:** defines a canonical, content‑addressed, immutable storage substrate for CDS cells and related artifacts.

- **Depends on:** the cellular carrier (`cellular-json.md`) for cell shape and on `canonicalization.md` for hashing discipline.

- **Provides to higher layers:** a stable mapping from cell hashes to canonical CDS files for CCE (Layer 3), ABI (Layer 4), RPC (Layer 5), RDF/PKM/CMS projections, and other tools.

- **Must not do:** introduce new mathematical laws beyond `../semantics/trace-universe.md`, interpret RTL semantics from `../semantics/language.md`, or redefine closure/repair behavior owned by `../semantics/closure.md`.

CDS‑Storage is purely infrastructural: it is concerned only with bytes, filenames, hashes, and persistence. All mathematical and operational semantics remain the responsibility of GFRTU, CDS, RTL, and CCE.

## 1. Purpose and Scope

Cellular Data Serialization (CDS) defines a canonical JSON representation of a single GFRTU cell, whose identity is the SHA‑256 hash of its canonical byte sequence.

CDS‑Storage defines:

- how canonical CDS cells are persisted as files;

- how those files are named and arranged on disk;

- what invariants must hold between file content, filenames, and id fields;

- a minimal set of conceptual operations (store, retrieve, test presence); and

- a small number of OPTIONAL profiles for storing related artifacts (judgments, evidence, aliases).

This specification does not define:

- database schemas;

- networking protocols;

- replication or distribution mechanisms;

- closure algorithms or any semantics of RTL.

Higher‑level systems (CCE, RPC, PKM/CMS, RDF projections) are expected to consume CDS‑Storage as a stable, content‑addressed cell store.

## 2. Terminology and Conventions

The key words MUST, MUST NOT, REQUIRED, SHOULD, and MAY in this document are to be interpreted as described in RFC 2119.

This document uses the following terms:

- **Cell**
  A CDS JSON object conforming to `cellular-json.md` whose canonical byte sequence hashes to its id field.

- **Canonical CDS bytes**
  A UTF‑8 encoded JSON serialization of a cell, after applying the canonicalization rules in `canonicalization.md`.

- **Cell identifier (cell-id)**
  The lowercase hexadecimal SHA‑256 digest of a cell’s canonical CDS bytes. MUST be exactly 64 hexadecimal characters.

- **Storage root ($ROOT)**
  The filesystem directory that contains the entire CDS‑Storage instance.

- **Implementation**
  Any concrete system (library, CLI, service, daemon) claiming to conform to this specification.

Rationale (non‑normative): using the same hash and canonicalization discipline as CDS eliminates the risk of “two slightly different cell identity regimes”. There is only one: the one defined in `cellular-json.md` and `canonicalization.md`.

## 3. Design Overview (Non‑Normative)

CDS‑Storage is a Git‑like object store for cells:

- Each cell is stored as a single JSON file.

- The file’s stem (name without extension) equals the cell’s id.

- Files are arranged under `$ROOT/cells/<prefix>/<cell-id>.json`, where `<prefix>` is a short hash prefix (two hex characters by default).

- Files are immutable: once written, they are never modified in place.

- Any index (SQLite, LMDB, key‑value store) is optional and must be reconstructible from the files.

This design:

- respects CDS’s requirement that “the filename stem MUST equal the canonical hash in id”;

- makes cells easy to inspect and version with standard tools (git, rsync, tar);

- keeps the semantics of cells in higher layers while providing a simple, deterministic substrate.

The remainder of this document states this behavior normatively.

## 4. Storage Model (Normative)
### 4.1 Canonical Cells

A cell in the sense of CDS‑Storage is a pair
(cell-id, canonical_cds_bytes) such that:

canonical_cds_bytes is valid UTF‑8 JSON;

parsing it yields a JSON object conforming to CDS; and

applying CDS canonicalization and hashing rules yields cell-id.

A CDS‑Storage implementation MUST ensure that any bytes it stores as a cell:

- are canonical according to CDS; and

- hash to a cell-id equal to the id field in the JSON.

An implementation MAY accept non‑canonical but structurally valid CDS JSON as input, provided it canonicalizes before storing. It MAY instead reject non‑canonical inputs and require pre‑canonicalized bytes. In all cases, on‑disk cell content MUST be canonical.

### 4.2 Storage Root

Every CDS‑Storage instance MUST have a single storage root directory, denoted $ROOT.

All files and directories specified in this document MUST reside within $ROOT or its subdirectories.

Implementations MAY store auxiliary files in $ROOT besides those defined here, provided they do not conflict with paths reserved by this specification.

### 4.3 Filesystem Layout for Cells

A conforming implementation MUST store all cells under:

```text
$ROOT/cells/
  <pp>/
    <cell-id>.json
```

where:

`<pp>` is a directory name derived from a prefix of cell-id; and

`<cell-id>.json` is a file whose stem is exactly cell-id.

Implementations MUST, at minimum, support a two‑character prefix: pp = cell-id[0:2]. They MAY use longer prefixes (e.g., 3 or 4 hex characters) for distribution across directories, but any such choice MUST be deterministic given cell-id.

The mapping from cell-id to path MUST be injective and MUST NOT depend on mutable state. Given a cell-id, any conforming implementation MUST be able to derive the same path.

The file extension MUST be .json. The extension is not part of the identity; it is a convenience for tooling.

Rationale (non‑normative): the prefix directory pattern matches Git, OCI, and many content‑addressed stores, avoiding huge directory fan‑out while keeping paths short and predictable.

### 4.4 File Content and Identity

For any file $ROOT/cells/pp/<cell-id>.json:

The file’s content MUST be canonical CDS bytes.

The SHA‑256 hash of the file’s bytes MUST equal cell-id.

Parsing the file as JSON MUST yield an object whose "id" field is a string equal to cell-id.

The filename stem (<cell-id>) MUST equal the canonical hash in id, as already required by CDS.

Implementations MUST NOT modify the file’s content after successful creation (immutability). Any update MUST be modeled as the creation of a new cell with a different cell-id.

Implementations MAY add or update separate metadata files or indexes that reference cell-id, but those MUST NOT change the semantics of the cell or the bytes stored under its file.

### 4.5 Presence and Completeness

A cell-id is considered present in the store if and only if a file exists at its computed path and satisfies the requirements of §4.4.

Implementations MUST treat the set of present cells as the complete inventory of stored cells. Any in‑memory or database indexes MUST be conservative with respect to the files: they MAY omit cells (e.g., during rebuilding) but MUST NOT invent cells that do not exist as valid files on disk.

## 5. Core Operations (Normative Semantics)

This section defines the conceptual operations that a CDS‑Storage implementation MUST support. Concrete APIs (functions, CLI commands, RPC methods) MAY vary, but they MUST preserve the described behavior.

### 5.1 `PutCell(cds_bytes) → cell-id | error`
5.1.1 Input

cds_bytes: a byte sequence supplied by a caller, intended to represent a CDS cell.

5.1.2 Required behavior

An implementation MUST:

Parse cds_bytes as UTF‑8 JSON.

On failure, it MUST reject the operation with an error equivalent to CS_ERR_JSON_PARSE.

Verify that the parsed JSON object satisfies the structural requirements of CDS (required top‑level keys, correct types, no unknown keys), as specified in `cellular-json.md`.

On violation, it MUST reject the operation with an error indicating CDS structural invalidity. Implementations MAY surface the underlying CDS error code.

Obtain canonical CDS bytes for the parsed object using CDS canonicalization rules (sorting keys, numeric normalization, etc.).

If cds_bytes is already canonical, this step may be a no‑op.

If canonicalization fails for any reason, the implementation MUST reject the operation.

Compute h = SHA‑256(canonical_cds_bytes).

Compare h (encoded as lowercase hex) to the id field from the parsed JSON.

If they differ, the implementation MUST reject the operation with an error equivalent to CS_ERR_ID_MISMATCH.

Compute the storage path p for h as defined in §4.3.

If a file already exists at p:

Read its bytes.

Verify that those bytes hash to h.

If they do not, the implementation MUST treat the store as corrupted and return CS_ERR_CORRUPT_STORE or an equivalent fatal error.

Return cell-id = h without modifying the file.

If no file exists at p:

Create the parent directory if it does not already exist. Directory creation MUST be idempotent and safe for concurrent callers.

Write canonical_cds_bytes to a temporary file in the same directory (e.g., using a unique suffix or temporary name).

Verify that the written bytes hash to h.

Atomically rename the temporary file to <cell-id>.json at path p.

Ensure the write is durable with respect to the host filesystem (e.g., via fsync or equivalent).

Return cell-id = h on success.

5.1.3 Immutability

Once PutCell returns success for a given cell-id, the implementation MUST guarantee that future calls to GetCell(cell-id) will either:

return the canonical bytes originally stored; or

fail with a store‑level error indicating corruption or lower‑level I/O failure.

### 5.2 `GetCell(cell-id) → canonical_cds_bytes | error`
5.2.1 Input

cell-id: a string supplied by a caller.

5.2.2 Required behavior

An implementation MUST:

Validate that cell-id is a 64‑character lowercase hexadecimal string.

On failure, it MUST reject the operation with CS_ERR_INVALID_ID_FORMAT.

Derive the path p for cell-id as specified in §4.3.

If no file exists at p, return CS_ERR_NOT_FOUND.

Read the file’s bytes.

Verify that the bytes hash to cell-id. If they do not, the store MUST be treated as corrupted and CS_ERR_CORRUPT_STORE (or equivalent) MUST be returned.

Return the bytes exactly as read. Implementations MUST NOT reformat the JSON or change whitespace, ordering, or encoding at this boundary.

### 5.3 `HasCell(cell-id) → bool`

An implementation MUST:

Validate the format of cell-id as in §5.2.2(1). If invalid, it MAY return false or an error; for predictability, returning an error is RECOMMENDED.

Derive the path p as in §5.2.2(2).

Check whether a file exists at p and satisfies the hash check in §4.4.

If so, return true.

If no file exists, return false.

If the file exists but fails the hash check, the store MUST be treated as corrupted and an error returned.

### 5.4 `ListCells() → iterator<cell-id>` (RECOMMENDED)

An implementation SHOULD provide an operation to enumerate all present cells by traversing $ROOT/cells.

Normative requirements:

The iterator MUST eventually yield each cell-id for which a valid file exists in the layout defined in §4.3 and §4.4.

The iterator MUST NOT invent cell-ids that lack corresponding valid files.

No ordering guarantees are required; implementations MAY provide arbitrary, lexicographic, or mtime‑based orderings.

Rationale (non‑normative): enumeration is not required for the correctness of higher layers, but is useful for tooling, maintenance, garbage collection, and replication.

## 6. Optional Profiles

The following profiles define additional filesystem conventions. They are OPTIONAL and MUST NOT change the behavior of operations in §5 or the invariants in §4.

### 6.1 Judgment Store Profile

Some systems may wish to persist RTL judgments as first‑class, content‑addressed files.

When this profile is enabled:

RTL judgments SHOULD be canonicalized according to rtl.md (if defined) and hashed with SHA‑256 to obtain a judgment identifier (judgment-id).

Implementations MAY store judgments as:

```text
$ROOT/judgments/
  <jj>/
    <judgment-id>.json
```

where `<jj>` is a short prefix (e.g., first two hex characters).

Judgment files MUST be treated as immutable. Their internal structure is opaque to this specification; only their byte stability and hash relationship are relevant.

No specific operations are mandated; implementations MAY provide PutJudgment, GetJudgment, etc., following analogous semantics to §5.1 and §5.2.

### 6.2 Evidence Store Profile

CCE executions, RPC calls, and other processes may produce evidence artifacts such as repair logs and transcripts.

When this profile is enabled:

Implementations MAY store evidence files under:

```text
$ROOT/evidence/
  <exec-id>.json
```

where exec-id is an application‑level identifier (for example, the id field in a CCE‑RPC request or response).

The content and format of evidence files are not constrained by this specification. They SHOULD be canonical JSON where practical, but CDS‑Storage does not interpret them.

Evidence files MAY be mutable if the application requires it, but immutability is RECOMMENDED for provenance reasons.

### 6.3 Alias Mapping Profile

Human‑readable names (aliases) can be mapped to cell-ids for convenience.

When this profile is enabled:

Implementations MAY store alias mappings in an auxiliary index, such as:

```text
$ROOT/index/aliases.sqlite
```

The alias mapping:

- MUST NOT affect which cells exist or how they are stored.

- MAY be rebuilt or discarded without affecting store conformance.

- MAY be many‑to‑one or one‑to‑many.

Aliases SHOULD NOT be treated as stable identifiers at the same level as cell-id. Higher‑level protocols that need stability MUST use cell-id or URIs derived from it.

## 7. Error Model

Implementations SHOULD provide error codes or classes analogous to the following:

- `CS_ERR_JSON_PARSE`: The input bytes could not be parsed as JSON.

- `CS_ERR_CDS_INVALID`: The JSON does not satisfy CDS structural requirements.

- `CS_ERR_ID_MISMATCH`: The computed hash does not match the id field in the JSON.

- `CS_ERR_INVALID_ID_FORMAT`: A supplied cell-id is not a 64‑character lowercase hex string.

- `CS_ERR_NOT_FOUND`: No cell exists for the requested cell-id.

- `CS_ERR_IO`: A filesystem or OS‑level error occurred while reading or writing.

- `CS_ERR_CORRUPT_STORE`: A file exists for a cell-id but its bytes do not hash to that cell-id.

- `CS_ERR_INTERNAL`: Any other implementation error not covered above.

Rationale (non‑normative): distinguishing CORRUPT_STORE from NOT_FOUND allows higher‑level systems (e.g., CCE servers) to distinguish “perfectly valid absence” from “something is wrong with this host”.

## 8. Security and Operational Considerations
### 8.1 Hash Algorithm

Implementations MUST use the same hash function as CDS canonicalization (SHA‑256 by default). They MUST NOT substitute a different hash algorithm for cell-id without a versioned extension to the CDS spec.

If future CDS versions introduce alternative hash algorithms, CDS‑Storage MAY be extended with versioned layouts (e.g., subdirectories per hash algorithm). This is out of scope for Version 0.x.

### 8.2 Path Safety

Implementations MUST treat cell-ids as opaque hex strings and MUST NOT allow directory separators, .., or other path components in cell-id. Since this spec already constrains cell-id to hex, path traversal attacks are prevented if the format checks are correctly enforced.

### 8.3 Atomicity and Durability

Write operations (see §5.1) SHOULD:

- write to a temporary file in the target directory;

- fsync the file and directory as appropriate;

- atomically rename the temporary file to the final name.

These practices reduce the risk of partially written cells being observed as valid.

### 8.4 Concurrency

Implementations MUST tolerate concurrent PutCell calls for the same cell-id. At least one call MUST succeed, and all successful calls MUST result in the same bytes on disk.

Implementations MUST ensure that concurrent writes for different cell-ids do not corrupt each other.

### 8.5 Privacy

Because cell-id is derived from content, it can leak information about identical content appearing in different places. Implementations that handle sensitive data SHOULD treat $ROOT as a private namespace, and SHOULD NOT rely on cell-id alone as an access control mechanism.

## 9. Interaction with Other Layers (Non‑Normative)

Although CDS‑Storage depends only on CDS, other layers depend on it.

CCE (Layer 3)
CCE implementations typically:

- read structural cells from CDS‑Storage (via `GetCell`);

- produce refined CDS cells and write them (via `PutCell`);

- optionally write repair logs to the evidence store.

CCE‑ABI / CCE‑RPC (Layers 4–5)
Hosts and services use CDS‑Storage to persist inputs and outputs of closure runs, ensuring that:

- canonical bytes passed through ABI/RPC match what is stored;

- traceability and repeatability are preserved.

RDF / PKM / CMS / ActivityPub / etc.
These systems commonly derive URIs such as:

```text
https://example.org/cells/<cell-id>
```

and treat `$ROOT/cells` as the canonical source of truth for cell content.

CDS‑Storage itself does not interpret these interactions; it only guarantees that cell-id → bytes is stable and deterministic.

## 10. Conformance

An implementation conforms to CDS‑Storage Version 0.x if and only if:

- It stores cells as files under `$ROOT/cells` with names and contents satisfying §4.

- It enforces content‑addressed, immutable behavior as described in §4.4 and §5.1–§5.3.

- It implements the conceptual operations `PutCell`, `GetCell`, and `HasCell` with the observable semantics specified in §5.

- Any optional profiles it implements (judgments, evidence, aliases) do not alter or weaken the guarantees in §4 and §5.

- It does not introduce hidden behaviors that contradict the CDS canonicalization and hashing rules defined in `canonicalization.md` and `cellular-json.md`.

Implementations MAY provide additional functionality (indexes, replication, garbage collection, metrics, etc.) as long as these conformance conditions are preserved.
