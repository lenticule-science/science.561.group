# Closure JSON Carriers

**Role.** Defines the canonical JSON structures used to transport closure inputs and outputs, repair logs, and evidence across ABI/RPC boundaries. Semantics of closure live in `../semantics/closure.md`.

**Depends on.** `canonicalization.md` for byte rules, `cellular-json.md` and `language-json.md` for embedded carriers.

**Provides to.** Host ABI, RPC, storage, and auditing tools.

---

## 1. Repair Log Entry

Repair logs are JSON arrays of entries with lexicographically sorted keys:

```jsonc
{"code": "CDS_* or CCE_*",
 "before_hash": "sha256-hex",
 "after_hash": "sha256-hex",
 "fuel_used": 0}
```

- Entries MUST appear in chronological order.
- `before_hash` and `after_hash` are canonical hashes of the payload immediately before and after the repair (see `canonicalization.md`).
- `fuel_used` records the remaining closure fuel when the repair occurred.

Empty logs are encoded as `[]` and MUST still be present on error paths.

## 2. Evidence Vector

Evidence is an optional JSON array of SHA-256 hex digests ordered as:

1. Input CDS hash,
2. Input RTL judgment hash (apply only),
3. Hash of each repair-log entry (in order, using canonical JSON encoding of that entry),
4. Output CDS hash (when `status = "ok"`),
5. Output canonical judgment hash (successful apply only).

Omission, insertion, or reordering invalidates the vector (`CCE_RPC_EVIDENCE_INVALID`).

## 3. Closure Result Payloads

Closure functions surface canonical JSON payloads:

- `refined_cds`: canonical CDS JSON (see `cellular-json.md`).
- `canonical_judgment`: canonical RTL JSON (see `language-json.md`).
- `repair_log`: as above.

When hashed, `refined_cds_hash` MUST equal the SHA-256 digest of the decoded canonical bytes.

## 4. RPC Envelopes

CCE-RPC is a transport-neutral JSON envelope. Request and response objects MUST be canonical JSON (sorted keys) whose binary transport bodies are base64-encoded UTF-8 of these canonical strings.

### 4.1 Request

```jsonc
{
  "id": "client-generated uuid",
  "version": "CCE-0.x",             // optional; if present MUST match server version
  "method": "apply" | "merge",
  "cds": "base64-utf8-json",          // required
  "rtl_judgment": "base64-utf8-json", // required for apply
  "fuel": 16,                         // optional override
  "prior_refined_cds": "sha256-hex"   // optional session hash
}
```

### 4.2 Response

```jsonc
{
  "id": "same as request.id",
  "version": "CCE-0.x",
  "status": "ok" | "error",
  "code": "CCE_* or CDS_* or RTL_*",
  "refined_cds": "base64-utf8-json",          // present on ok
  "canonical_judgment": "base64-utf8-json",   // present on ok for apply
  "refined_cds_hash": "sha256-hex",           // present when refined_cds present
  "repair_log": "base64-utf8-json",           // present whenever produced
  "evidence": ["sha256-hex", ...]             // optional evidence vector
}
```

- Unknown top-level fields MUST trigger `CCE_RPC_UNKNOWN_FIELD`.
- Malformed base64 or non-UTF-8 payloads are `CCE_RPC_PAYLOAD_ENCODING`.
- `refined_cds_hash` MUST equal the hash of `refined_cds`.

## 5. Canonicalization Hooks

- Requests and responses use lexicographically sorted keys; embedded payloads MUST already be canonical per their carriers before base64 encoding.
- Repair-log entries and evidence arrays rely on the shared hashing rules in `canonicalization.md`.
- RPC transcripts MUST record canonical request/response pairs and associated hashes for replay.

## 6. ABI Interaction

ABI bindings exchange canonical JSON buffers for `refined_cds`, `canonical_judgment`, and `repair_log`. Buffers MUST be zero-terminated UTF-8, with lengths matching the canonical byte count. Error codes are textual C strings; see host `abi.md` for struct layout.

This file defines only the JSON carriers; transport scheduling, resource limits, and runtime orchestration are described in host documents.
