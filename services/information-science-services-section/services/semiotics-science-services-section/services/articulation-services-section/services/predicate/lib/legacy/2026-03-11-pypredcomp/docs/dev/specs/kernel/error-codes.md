---
title: "Error codes"
description: "Textual error code naming convention."
kind: spec
status: normative
version: "0.1"
---


Errors are surfaced as **textual codes**, not numeric enums.
Implementations MAY translate to host-native categories for telemetry, but the canonical value at every interface (MCP, HTTP, FFI, log output) is the textual string.

## 1. Naming convention

Codes follow the form `<COMPONENT>_<CATEGORY>`:

| Component prefix | Domain |
|---|---|
| `PCC_*` | Predicated-Computing Cell — record validation, hash mismatch, monotonicity, canonicalization. |
| `PCR_*` | Predicated-Computing Rule — rule record validation, premise pattern errors, fuel exhaustion in firing. |
| `PCE_*` | Predicated-Computing Event log — log append, event validation, replay errors. |
| `PCS_*` | Predicated-Computing Storage — disk I/O, corruption, path safety. |
| `PCM_*` | Predicated-Computing MCP surface — protocol envelope, transport. |
| `PCF_*` | Predicated-Computing Federation — peer protocol, signature, merge errors. |
| `PCH_*` | Predicated-Computing Heartbeat — runtime state, scheduling, health. |
| `PCA_*` | Predicated-Computing Authorization — sender-fiber composition, scope. |

Categories within a prefix are SCREAMING_SNAKE_CASE descriptive: `PCC_ID_MISMATCH`, `PCE_LOG_RACE`, `PCF_SIGNATURE_INVALID`.
The string itself is the contract — extending an existing category with a longer name is a breaking change.

## 2. Severity

Codes carry implicit severity:

- **Hard** — operation rejected, no partial state written.
  Caller MUST address before retry.
- **Repairable** — surfaced alongside a [repair-log](repair-log.md) entry showing the deterministic fix the engine applied.
  Not an error in the strict sense; a notice of automatic correction.
- **Resource** — the operation could not complete within declared bounds (fuel, memory, time).
  Caller MAY retry with higher bounds.

Severity is not in the code string.
It is a property of the code, documented per-code in implementations' code catalogs.
The categorization here:

| Code | Severity |
|---|---|
| `PCC_ID_MISMATCH` | hard |
| `PCC_MONOTONICITY_FAIL` | hard |
| `PCC_UNKNOWN_FIELD` | hard |
| `PCC_CANONICALIZATION_FAIL` | hard |
| `PCR_PREMISE_INVALID` | hard |
| `PCR_FUEL_EXCEEDED` | resource |
| `PCR_RULE_NOT_FOUND` | hard |
| `PCE_LOG_RACE` | resource |
| `PCE_PREV_HASH_FAIL` | hard |
| `PCE_ORDINAL_GAP` | hard |
| `PCE_UNKNOWN_KIND` | hard |
| `PCS_CORRUPT_STORE` | hard |
| `PCS_NOT_FOUND` | hard |
| `PCS_INVALID_ID_FORMAT` | hard |
| `PCM_UNKNOWN_FIELD` | hard |
| `PCM_PAYLOAD_ENCODING` | hard |
| `PCM_VERSION_MISMATCH` | hard |
| `PCF_SIGNATURE_INVALID` | hard |
| `PCF_PEER_UNREACHABLE` | resource |
| `PCF_MERGE_INVARIANT_CONFLICT` | repairable |
| `PCH_NOT_READY` | resource |
| `PCH_DRAINING` | resource |
| `PCA_SCOPE_INSUFFICIENT` | hard |
| `PCC_COMPACT_GAP`<sup>†</sup> | hard |
| `PCC_COMPACT_OVERLAP`<sup>†</sup> | hard |
| `PCC_COMPACT_FUTURE`<sup>†</sup> | hard |
| `PCC_COMPACT_TAIL_MISMATCH`<sup>†</sup> | hard |
| `PCC_COMPACT_SUMMARY_INCOMPLETE`<sup>†</sup> | hard |
| `PCC_COMPACT_SUMMARY_NON_LATEST`<sup>†</sup> | hard |
| `PCC_COMPACT_SUMMARY_ROOT_DIVERGED`<sup>†</sup> | hard |
| `PCC_COMPACT_REPLAY_DIVERGED`<sup>†</sup> | hard |

<sup>†</sup> The `PCC_COMPACT_*` codes are placeholders registered alongside the draft [`compaction.md`](compaction.md). Semantics revise once theory reconciliation lands. Not yet emitted from any code path.

## 3. Surface mapping

Codes propagate identically across surfaces:

| Surface | Mapping |
|---|---|
| MCP response | `code` field carries the textual string verbatim. |
| HTTP | `4xx` for hard, `429` for resource (fuel/rate/draining), `5xx` only for genuinely unhandled engine faults. The `X-PC-Code` response header AND the JSON body's `code` field carry the textual string. |
| FFI | `*const c_char` null-terminated UTF-8. |
| Logs | First non-whitespace token of the log line MUST be the code; downstream parsers grep on that. |

A surface MUST NOT translate a code into a different one.
Wrapping is permitted; renaming is not.

## 4. Constants table

Implementations SHOULD expose the codes as named constants in their host language:

```rust
pub const PCC_ID_MISMATCH: &str = "PCC_ID_MISMATCH";
pub const PCC_MONOTONICITY_FAIL: &str = "PCC_MONOTONICITY_FAIL";
// ...
```

```python
PCC_ID_MISMATCH = "PCC_ID_MISMATCH"
PCC_MONOTONICITY_FAIL = "PCC_MONOTONICITY_FAIL"
# ...
```

The string is the source of truth.
The constant is convenience.

## 5. Adding a new code

Codes are added by appending a row to this spec's table and shipping a corresponding constant.
Removing or renaming a code is a breaking change against any consumer that pattern-matches on it (which they all do); deprecation is by addition of a successor code, not editing.
