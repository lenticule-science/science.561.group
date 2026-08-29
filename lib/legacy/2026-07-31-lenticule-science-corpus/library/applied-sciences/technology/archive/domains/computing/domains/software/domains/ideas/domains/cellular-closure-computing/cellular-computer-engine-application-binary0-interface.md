CCE Application Binary Interface (CCE-ABI)

**Specification – Version 0.x (normative)**

--------------------------------------------------------------------------------

1. Purpose

CCE-ABI defines the binding‑level contracts for invoking the Cellular Closure Engine from host runtimes. It specifies memory layouts, ownership rules, error surfaces, and conformance vectors so that independent implementations inter‑ operate deterministically.

--------------------------------------------------------------------------------

2. Type Definitions

The ABI is expressed in a C‑like struct notation; Rust or other FFI hosts MUST preserve field order and alignment. All integers are little‑endian two’s complement; `size_t` MUST be 64‑bit. Structs MUST use the platform’s standard C ABI alignment (e.g., 8‑byte alignment for 64‑bit fields on LP64). Rust bindings MUST use `#[repr(C)]`. C bindings MAY apply `#pragma pack(push, 8)` or an equivalent directive when necessary to enforce ABI‑standard alignment. Bindings MUST NOT reduce alignment below the natural alignment of 64‑bit fields.

```
struct CdsCell {
  const uint8_t *bytes;   // canonical JSON buffer (UTF-8)
  uint64_t len;
};

struct RtlJudgment {
  const uint8_t *bytes;   // canonical JSON buffer (UTF-8)
  uint64_t len;
};

struct CceResult {
  CdsCell refined_cds;           // canonical JSON; valid iff cce_apply(...) returns CCE_OK
  RtlJudgment canonical_judgment;// canonical JSON; valid iff cce_apply(...) returns CCE_OK
  CdsCell repair_log;            // canonical JSON array; ALWAYS valid
};
```

Ownership: callers retain ownership of input buffers; CCE MUST NOT free them. When returning success, CCE allocates new buffers for `refined_cds`, `canonical_judgment`, and `repair_log`; the caller MUST free via `cce_free`. On error, `repair_log` is still allocated as canonical JSON (possibly empty) and MUST be freed by the caller. `refined_cds.bytes` and `canonical_judgment.bytes` MUST be set to `NULL` with length 0 on error. Returned buffers MUST be self‑contained (no internal pointers) and zero‑terminated.

--------------------------------------------------------------------------------

3. Functions

```
typedef struct {
  const char *code;  // textual CCE_*/CDS_*/RTL_* code, null-terminated ASCII
  uint64_t len;      // length of code without terminator
} CceErrorTag;

CceErrorTag cce_apply(const CdsCell *cell, const RtlJudgment *judgment, CceResult *out);
CceErrorTag cce_merge(const CdsCell *lhs, const CdsCell *rhs, CdsCell *out);
void        cce_free(uint8_t *buffer, uint64_t len);
```

- All functions MUST be thread‑safe and reentrant.
- `cce_apply` returns a textual `CceErrorTag`. On success, the tag is `"CCE_OK"`; it populates `out->refined_cds`, `out->canonical_judgment`, and `out->repair_log` with freshly allocated canonical JSON buffers. On error, it MUST populate `out->repair_log` with a canonical JSON array (possibly empty) and set `out->refined_cds.bytes = NULL`, `out->refined_cds.len = 0`, and the same for `canonical_judgment`.
- `cce_merge` returns `"CCE_OK"` with a canonical merged cell or an error tag. On error the output buffer MUST be zeroed and no allocation leaked.
- Resource limits (fuel, memory) MUST surface as the textual code `CCE_ERR_RESOURCE_LIMIT` and leave no allocated outputs.

--------------------------------------------------------------------------------

4. Error Surface

The ABI error surface is the textual codes in CCE §7 plus the CDS/RTL codes they reference. Implementations SHOULD expose the following symbolic constants for ergonomics, but the canonical value is the UTF‑8 string, not a numeric enum discriminant:

```
static const char *CCE_OK = "CCE_OK";
static const char *CCE_ERR_CDS_INVALID = "CCE_ERR_CDS_INVALID";
static const char *CCE_ERR_RTL_INVALID = "CCE_ERR_RTL_INVALID";
static const char *CCE_ERR_CLOSURE_FUEL_EXCEEDED = "CCE_ERR_CLOSURE_FUEL_EXCEEDED";
static const char *CCE_ERR_SIGMA_DELTA_DIVERGED = "CCE_ERR_SIGMA_DELTA_DIVERGED";
static const char *CCE_ERR_MERGE_SITE_MISMATCH = "CCE_ERR_MERGE_SITE_MISMATCH";
static const char *CCE_ERR_MERGE_CONSTRUCTOR_GAP = "CCE_ERR_MERGE_CONSTRUCTOR_GAP";
static const char *CCE_ERR_MERGE_FIXED_LAYER_EMPTY = "CCE_ERR_MERGE_FIXED_LAYER_EMPTY";
static const char *CCE_ERR_REPAIR_FAILED = "CCE_ERR_REPAIR_FAILED";
static const char *CCE_ERR_MERGE_INVARIANT_CONFLICT = "CCE_ERR_MERGE_INVARIANT_CONFLICT";
static const char *CCE_ERR_ABI_INCOMPATIBLE = "CCE_ERR_ABI_INCOMPATIBLE";
static const char *CCE_ERR_RESOURCE_LIMIT = "CCE_ERR_RESOURCE_LIMIT";
static const char *CCE_RPC_EVIDENCE_INVALID = "CCE_RPC_EVIDENCE_INVALID";
```

Bindings MAY translate these strings to host‑specific categories for telemetry or transport integration, but MUST preserve and expose the textual code itself verbatim. Numeric encodings (offsets, discriminants, transport status) are non‑normative convenience layers and MUST NOT be treated as the source of truth.

--------------------------------------------------------------------------------

5. Determinism, Hashing, and Safety

- Inputs MUST be canonical JSON; the ABI does not canonicalize on behalf of callers. Non‑canonical inputs may lead to `CCE_ERR_CDS_INVALID` or `CCE_ERR_RTL_INVALID`.
- Implementations MUST guarantee byte‑identical outputs for identical inputs, even under concurrency. Internal caches MUST be thread‑safe but invisible to the ABI surface.
- No heap pointers may be embedded inside returned JSON buffers; they MUST be self‑contained UTF‑8 payloads. Returned `len` MUST match the buffer length exactly; callers MUST NOT read past `len`.
- `cce_free` MUST overwrite the freed buffer with zeros before release to prevent leakage of canonical payloads.

--------------------------------------------------------------------------------

6. Conformance Vectors

Every ABI implementation MUST ship test vectors:

1. **Canonicalization round‑trip**: provide a CDS/RTL pair whose canonical hashes are known; verify `cce_apply` returns the same bytes on repeated runs.
2. **Error propagation**: supply malformed CDS (bad `id`) and malformed RTL (unknown operator) to confirm the correct textual tags are returned.
3. **Resource limit**: execute a closure requiring more than provided fuel and confirm `CCE_ERR_CLOSURE_FUEL_EXCEEDED` with zeroed outputs.
4. **Merge compatibility**: merge two compatible cells and two incompatible ones to exercise merge error codes.
5. **Repair log exposure**: feed a CDS requiring a repairable invariant; confirm the `repair_log` buffer is populated with deterministic hashes matching CDS §5 expectations.

Vectors SHOULD be offered in C, Rust, and Go bindings using identical payloads to prove cross‑language determinism.

--------------------------------------------------------------------------------

7. Transcript and Provenance Requirements

ABI implementations MUST expose deterministic transcripts to prove conformance:

- **Input hashes.** For every invocation, compute the SHA‑256 hash of the raw input buffers and expose it in a host‑native tracing hook. The traced hash MUST equal the `id` inside the canonical JSON.
- **Output hashes.** Expose the SHA‑256 hash of every returned buffer alongside the error code; mismatches between hash and embedded `id` MUST raise `CCE_ERR_CDS_INVALID` before returning to callers.
- **Ordering guarantees.** Trace entries MUST appear in the order buffers are materialized (CDS, RTL, repair log). Hosts MUST NOT reorder entries to match logging preferences because that would obscure the causal order of closure steps.
- **Spec version stamp.** Every transcript entry MUST include the CCE spec version string from `cce.md` header so that replay tools can reject evidence produced against incompatible mathematical obligations. Host libraries MUST treat a missing or mismatched version as `CCE_ERR_CDS_INVALID`.

CCE-RPC MAY also surface an `evidence` array as the Closure Event Record (CER) for an invocation. When present, it MUST be a JSON array of SHA-256 hex digests ordered as follows:

1. Input CDS hash — SHA-256 of the canonical CDS JSON supplied in the request (after base64 decoding).
2. Input RTL judgment hash — SHA-256 of the canonical RTL JSON (apply requests only).
3. Repair-log entry hashes — for each entry in the canonical `repair_log` returned by CCE, in order, include the SHA-256 digest of the canonical JSON encoding of that entry.
4. Output CDS hash — SHA-256 of the canonical `refined_cds` JSON (present only when `status = "ok"`).
5. Output canonical judgment hash — SHA-256 of the canonical `canonical_judgment` JSON (present only for successful apply).

The sequence MUST reflect the exact causal order of closure steps. Any omission, reordering, or insertion MUST result in `CCE_RPC_EVIDENCE_INVALID`. Clients and servers MUST treat the array as the cryptographic witness of the canonical inputs consumed, the invariant-repair steps performed, and the canonical outputs produced. Replaying these digests, together with the canonical request/response payloads and the repair logs, MUST suffice for an independent verifier to attest conformance with `cce.md`, this ABI, and the GFRTU fixed-point laws.

The transcript format is host‑defined but MUST be reproducible byte‑for‑byte for identical inputs so that independent verifiers can replay the ABI call sequence.

--------------------------------------------------------------------------------

8. Interpretive Binding Notes

The ABI is a thin membrane over the mathematics in `cce.md` and `cds.md`. To keep bindings faithful, implementations MUST:

- Treat `CdsCell.bytes` and `RtlJudgment.bytes` as **canonical witnesses** of the closure computation, not mutable host objects. Copying and re‑encoding MUST preserve byte order; lossy transcoding (e.g., JSON reformatting) is a violation of conformance.
- Propagate repair logs as first‑class evidence of closure progress. Hosts MUST expose them verbatim to callers (not merely for debugging) so downstream systems can reconstruct the exact sheafification and σ/Δ stabilization steps mandated by the GFRTU.
- Make concurrency invisible: parallel invocations MAY share caches, but they MUST NOT interleave writes into caller buffers or reorder log entries.

These obligations ensure that FFI layers do not smuggle in host‑specific assumptions that would compromise determinism or mathematical fidelity.

--------------------------------------------------------------------------------

9. Host Conformance Checklist

Every binding MUST provide the following observable behaviors so implementers and auditors can verify fidelity without inspecting source code:

1. **Byte preservation**: expose a function that round‑trips a `CdsCell` or `RtlJudgment` through the ABI and returns the byte‑for‑byte identical buffer; any deviation indicates illegal host re‑encoding.
2. **Alignment probe**: include a self‑test that reports `sizeof` and `alignof` each struct; mismatch with the declared layout MUST abort initialization with `CCE_ERR_ABI_INCOMPATIBLE`.
3. **Deterministic error surface**: map transport or allocator failures to the deterministic ABI errors in §5 and never to host‑defined codes. Wrapper libraries MUST document this mapping in their public surface.
4. **Version stamping**: stamp the spec version string from this document into every exported symbol table (where the platform allows) so incompatible libraries are rejected at dynamic‑link time.

Publishing a binding without these probes is non‑conformant because consumers could not independently attest that the binding respects the GFRTU canonical evidence flow.