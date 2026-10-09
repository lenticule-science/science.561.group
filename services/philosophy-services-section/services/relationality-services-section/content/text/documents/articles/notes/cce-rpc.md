---
title: CCE Remote Procedure Call (CCE-RPC)
description: "This document occupies Layer 5 (CCE‑RPC) of the GFRTU stack:"
---
# CCE Remote Procedure Call (CCE-RPC)

**Specification – Version 0.x (normative)**

---

## Layer Declaration — CCE-RPC (Layer 5: Network Boundary)

This document occupies **Layer 5 (CCE‑RPC)** of the GFRTU stack:

- **Role:** defines a transport‑neutral JSON envelope for invoking CCE over networked or interprocess channels.
- **Depends on:** CCE’s operational semantics (Layer 3, `cce.md`) and the ABI‑level expectations about canonical JSON and error codes (Layer 4, `cce-abi.md`). It assumes CDS/RTL encodings (Layer 2) as payloads.
- **Provides to higher layers/external systems:** a replayable request/response transcript that preserves canonical bytes, hashes, and repair/evidence logs produced by CCE.
- **Must not do:** introduce new closure behavior, determinism guarantees, or mathematical constraints beyond forwarding what CCE already defines.

Where this specification restates determinism, evidence ordering, or error mapping, it does so **purely as a projection of Layer 3 obligations onto transport**; CCE remains the single source of truth for closure semantics.

## 1. Purpose

CCE-RPC defines a transport‑neutral envelope for invoking the Cellular Closure
Engine over networked or interprocess channels. It standardizes request/response
fields, canonical JSON expectations, session/lease semantics, and conformance
fixtures so independently implemented clients and servers interoperate.

---

## 2. Envelope

Requests and responses MUST be canonical JSON with lexicographically sorted keys.
Binary transports (gRPC, Cap’n Proto) MUST embed the canonical JSON inside the
payload; no additional framing semantics may alter the bytes. Payload octets are
base64 of UTF‑8 JSON produced by CDS/RTL canonicalization. Streaming transports
(server or bidi) MUST frame *each* message as a complete request/response pair
with the same envelope; streaming MAY batch multiple apply calls but MUST NOT
mutate envelope ordering or introduce out‑of‑band fields.

### 2.1 Request

```jsonc
{
  "id": "client-generated uuid",
  "version": "CCE-0.x",             // optional; if present, MUST match server version
  "method": "apply" | "merge",
  "cds": "base64-utf8-json",          // required for both methods
  "rtl_judgment": "base64-utf8-json", // required for apply
  "fuel": 16,                          // optional override
  "prior_refined_cds": "sha256-hex"   // optional for session refinement
}
```

### 2.2 Response

```jsonc
{
  "id": "same as request.id",
  "version": "CCE-0.x",             // required; MUST surface CCE spec version
  "status": "ok" | "error",
  "code": "CCE_* or CDS_* or RTL_*",
  "refined_cds": "base64-utf8-json",     // present on ok for apply/merge
  "canonical_judgment": "base64-utf8-json", // present on ok for apply
  "refined_cds_hash": "sha256-hex",      // always present when refined_cds present
  "repair_log": "base64-utf8-json",       // canonical log array, present whenever produced
  "evidence": ["sha256-hex", ...]        // optional trace of repair steps
}
```

- `refined_cds_hash` MUST equal the canonical hash of `refined_cds`.
- `repair_log` MAY appear on error responses when CCE generated logs during
  partial progress; servers MUST forward it canonically.
- Unknown top‑level fields in either envelope (other than `version`) MUST
  trigger `CCE_RPC_UNKNOWN_FIELD`.
- Servers MUST reject mismatched base64 decoding or non‑UTF‑8 payloads with
  `CCE_RPC_PAYLOAD_ENCODING`.

---

## 3. Error Mapping

CCE error codes propagate to RPC `code` verbatim. Transports MUST map:

| CCE/ CDS/ RTL code               | Transport status                           |
|----------------------------------|--------------------------------------------|
| any `*_INVALID`, `*_MISMATCH`    | `INVALID_ARGUMENT` (gRPC) / HTTP 400       |
| `CCE_CLOSURE_FUEL_EXCEEDED`      | `RESOURCE_EXHAUSTED` / HTTP 429            |
| `CCE_SIGMA_DELTA_DIVERGED`       | `FAILED_PRECONDITION` / HTTP 412           |
| `CCE_REPAIR_FAILED`              | `FAILED_PRECONDITION` / HTTP 412           |
| `CCE_MERGE_*`                    | `FAILED_PRECONDITION` / HTTP 412           |
| `CCE_RPC_UNKNOWN_FIELD`          | `INVALID_ARGUMENT` / HTTP 400              |
| `CCE_RPC_PAYLOAD_ENCODING`       | `INVALID_ARGUMENT` / HTTP 400              |
| unknown codes                    | `UNKNOWN` / HTTP 500                       |

Servers MUST NOT mask application codes with transport OK statuses.

---

## 4. Session / Lease Semantics

Clients MAY perform multi‑call refinement:

1. Client supplies `prior_refined_cds` equal to the hash from the previous
   response.
2. Server MUST check that `prior_refined_cds == hash(cds_payload)` after
   canonicalization; mismatch yields `CCE_RPC_PRIOR_HASH_MISMATCH`.
3. When fuel is omitted, the server MAY reuse the previous fuel bound from the
   session; otherwise it MUST honor the provided `fuel` exactly.
4. Servers MUST ensure determinism: repeated calls with identical inputs and
   prior hashes MUST return byte‑identical outputs, including `repair_log` order.

Sessions are purely logical; no mutable server state beyond hash comparison is
permitted. Servers MUST NOT cache partial closures between requests.

---

## 5. Conformance Fixtures

Implementations MUST publish fixtures:

- **Unary apply**: CDS/RTL pair from CDS §8.1 returning success with known hash.
- **Unary error**: malformed RTL (unknown operator) returning `RTL_UNKNOWN_OPERATOR`.
- **Lease refinement**: two sequential apply calls where the second includes
  `prior_refined_cds` from the first; outputs must match exactly, including
  `repair_log`.
- **Merge**: merge fixtures covering success, site mismatch, and empty fixed layer
  intersection.

Each fixture MUST include the canonical request JSON, expected response JSON,
refined CDS bytes, and canonical repair log to allow cross‑implementation
replay.

---

## 6. Deterministic Transcript and Auditing

Servers and clients MUST produce auditable transcripts:

- **Canonical request/response pair.** Log the canonical JSON (post base64
  decoding) and its SHA‑256 hash for both request and response. Hashes MUST match
  the `refined_cds_hash` field when present.
- **Repair log linkage.** Include the sequence of `repair_log` hashes in the
  transcript to prove that the server honored the closure and sheafification
  steps in order.
- **Transport neutrality.** The transcript MUST be identical whether delivered
  over HTTP, gRPC, Cap’n Proto, or a message bus; transport‑specific metadata
  MUST NOT alter field ordering or encoding.
- **Spec and fuel disclosure.** Each transcript line MUST include the CCE spec
  version string plus the fuel budget accepted by the server for the request.
  If the fuel budget differs from the client’s declared `fuel_hint`, the
  transcript MUST record both values to preserve the mathematical replay of the
  closure iteration.

Transcripts are required artifacts for conformance certification; missing or
non‑deterministic transcripts render the RPC implementation non‑normative.

---

## 7. Interpretive Transport Notes

RPC transports sit above the ABI but MUST remain faithful to the same closure
principles:

- **Envelope as boundary object.** The base64 payloads are not arbitrary blobs;
  they are the canonical witnesses of the closure computation. Servers MUST NOT
  rewrite or pretty‑print the JSON before hashing or forwarding to the ABI.
- **Session hashes as morphisms.** `prior_refined_cds` behaves like a morphism
  in the AOG between sequential closure states. Rejecting mismatched hashes
  maintains the categorical composition implied by GFRTU generative closure.
- **Error propagation as logical evidence.** Transport status codes MUST be a
  transparent reflection of the mathematical failure mode (sheaf gap, σ/Δ
  divergence, merge inconsistency) so that remote clients can treat RPC replies
  as proofs of success or failure, not opaque HTTP outcomes.

These interpretive constraints prevent RPC layers from introducing informal
semantics that could obscure determinism or the provenance of closure evidence.

---

## 8. Cross-document Deterministic Fixture

Implementers MUST support the following canonical fixture end‑to‑end (CDS → RTL
→ CCE → ABI → RPC) to demonstrate reproducibility:

1. **CDS payload.** Canonical JSON (single line) and hash:

   ```json
   {"constructors":[],"defining_expression":{"closure_depth":0,"derivation_order":"height-then-leftmost","judgments":[]},"examples":{},"fibers":{"recognition":{"carrier":"Boolean","delta":{"table":[["0","0"],["0","1"]]},"heyting":{"imp":[["1","1"],["0","1"]],"join":[["0","1"],["1","1"]],"meet":[["0","0"],["0","1"]]},"sigma":{"table":[["0","1"],["1","1"]]}},"sections":[{"elements":["0","1"],"object":"U"}]},"fixed_layer":{"recognition":{"carrier":"Boolean","delta":{"table":[["0","0"],["0","1"]]},"heyting":{"imp":[["1","1"],["0","1"]],"join":[["0","1"],["1","1"]],"meet":[["0","0"],["0","1"]]},"sigma":{"table":[["0","1"],["1","1"]]}},"sections":[{"elements":["0","1"],"object":"U"}]},"id":"f44702d559037b6b99c7425fee32cf5be10137bc124b4a9be86c5d14d4d6404c","kind":"cds","laws":{"canonicalization":{"hash":"sha256","strategy":"cbv-left-to-right"},"invariants":[{"code":"CDS_INV_SHEAF","name":"sheaf_condition","severity":"hard"}],"repair_log":[]},"rtl_signature":{"base_types":["Ob U"],"constructors":[]},"site":{"heyting_table":{"imp":["U","U"]("U","U"),"join":["U","U"]("U","U"),"meet":["U","U"]("U","U")},"morphisms":[],"objects":[{"cover":[],"id":"U"}],"topology":["U"]("U")},"structural_vocabulary":{"morphisms":[],"objects":["U"],"relations":[]}}
   ```

   Hash = `f44702d559037b6b99c7425fee32cf5be10137bc124b4a9be86c5d14d4d6404c`,
   base64 =
   `eyJjb25zdHJ1Y3RvcnMiOltdLCJkZWZpbmluZ19leHByZXNzaW9uIjp7ImNsb3N1cmVfZGVwdGgiOjAsImRlcml2YXRpb25fb3JkZXIiOiJoZWlnaHQtdGhlbi1sZWZ0bW9zdCIsImp1ZGdtZW50cyI6W119LCJleGFtcGxlcyI6e30sImZpYmVycyI6eyJyZWNvZ25pdGlvbiI6eyJjYXJyaWVyIjoiQm9vbGVhbiIsImRlbHRhIjp7InRhYmxlIjpbWyIwIiwiMCJdLFsiMCIsIjEiXV19LCJoZXl0aW5nIjp7ImltcCI6W1siMSIsIjEiXSxbIjAiLCIxIl1dLCJqb2luIjpbWyIwIiwiMSJdLFsiMSIsIjEiXV0sIm1lZXQiOltbIjAiLCIwIl0sWyIwIiwiMSJdXX0sInNpZ21hIjp7InRhYmxlIjpbWyIwIiwiMSJdLFsiMSIsIjEiXV19fSwic2VjdGlvbnMiOlt7ImVsZW1lbnRzIjpbIjAiLCIxIl0sIm9iamVjdCI6IlUifV19LCJmaXhlZF9sYXllciI6eyJyZWNvZ25pdGlvbiI6eyJjYXJyaWVyIjoiQm9vbGVhbiIsImRlbHRhIjp7InRhYmxlIjpbWyIwIiwiMCJdLFsiMCIsIjEiXV19LCJoZXl0aW5nIjp7ImltcCI6W1siMSIsIjEiXSxbIjAiLCIxIl1dLCJqb2luIjpbWyIwIiwiMSJdLFsiMSIsIjEiXV0sIm1lZXQiOltbIjAiLCIwIl0sWyIwIiwiMSJdXX0sInNpZ21hIjp7InRhYmxlIjpbWyIwIiwiMSJdLFsiMSIsIjEiXV19fSwic2VjdGlvbnMiOlt7ImVsZW1lbnRzIjpbIjAiLCIxIl0sIm9iamVjdCI6IlUifV19LCJpZCI6ImY0NDcwMmQ1NTkwMzdiNmI5OWM3NDI1ZmVlMzJjZjViZTEwMTM3YmMxMjRiNGE5YmU4NmM1ZDE0ZDRkNjQwNGMiLCJraW5kIjoiY2RzIiwibGF3cyI6eyJjYW5vbmljYWxpemF0aW9uIjp7Imhhc2giOiJzaGEyNTYiLCJzdHJhdGVneSI6ImNivi1sZWZ0LXRvLXJpZ2h0In0sImludmFyaWFudHMiOlt7ImNvZGUiOiJDRFNfSU5WX1NIRUFGIiwibmFtZSI6InNoZWFmX2NvbmRpdGlvbiIsInNldmVyaXR5IjoiaGFyZCJ9XSwicmVwYWlyX2xvZyI6W119LCJydGxfc2lnbmF0dXJlIjp7ImJhc2VfdHlwZXMiOlsiT2IgVSJdLCJjb25zdHJ1Y3RvcnMiOltdfSwic2l0ZSI6eyJoZXl0aW5nX3RhYmxlIjp7ImltcCI6W1siVSIsIlUiXV0sImpvaW4iOltbIlUiLCJVIl1dLCJtZWV0IjpbWyJVIiwiVSJdXX0sIm1vcnBoaXNtcyI6W10sIm9iamVjdHMiOlt7ImNvdmVyIjpbXSwiaWQiOiJVIn1dLCJ0b3BvbG9neSI6W1siVSJdXX0sInN0cnVjdHVyYWxfdm9jYWJ1bGFyeSI6eyJtb3JwaGlzbXMiOltdLCJvYmplY3RzIjpbIlUiXSwicmVsYXRpb25zIjpbXX19

2. **RTL judgment.** Canonical JSON, hash, and base64:

   ```json
   {"context":[{"name":"x","type":{"ref":"Ob U"}}],"term":{"var":"x"},"type":{"ref":"Ob U"}}
   ```

   Hash = `10a1d0cb3641c4b6ba9b76c8841e2d4b60ecbdf0462797bcc84d228e63670bbf`,
   base64 = `eyJjb250ZXh0IjpbeyJuYW1lIjoieCIsInR5cGUiOnsicmVmIjoiT2IgVSJ9fV0sInRlcm0iOnsidmFyIjoieCJ9LCJ0eXBlIjp7InJlZiI6Ik9iIFUifX0=`.

3. **RPC apply round‑trip.** Request:

   ```json
   {"cds":"<CDS base64 above>","fuel":16,"id":"fixture-1","method":"apply","rtl_judgment":"<RTL base64 above>","version":"CCE-0.x"}
   ```

   Response:

   ```json
   {"canonical_judgment":"<RTL base64 above>","code":"CCE_OK","id":"fixture-1","refined_cds":"<CDS base64 above>","refined_cds_hash":"f44702d559037b6b99c7425fee32cf5be10137bc124b4a9be86c5d14d4d6404c","repair_log":"W10=","status":"ok","version":"CCE-0.x"}
   ```

4. **ABI check.** Feeding the same CDS/RTL bytes through `cce_apply` MUST return
   zero with output buffers matching the base64 payloads above. The repair log is
   the empty array `[]` (`W10=` base64).

5. **Hashing snippets.** Independent toolchains MUST reproduce the hashes using
   canonical JSON sorting. Example (Python):

   ```python
   import hashlib, json
   s = {"context":[{"name":"x","type":{"ref":"Ob U"}}],"term":{"var":"x"},"type":{"ref":"Ob U"}}
   canonical = json.dumps(s, sort_keys=True, separators=(',', ':'))
   assert hashlib.sha256(canonical.encode()).hexdigest() == "10a1d0cb3641c4b6ba9b76c8841e2d4b60ecbdf0462797bcc84d228e63670bbf"
   ```

   Example (Go):

   ```go
   b, _ := json.Marshal(s)              // where s is a map with sorted keys
   sum := sha256.Sum256(b)
   fmt.Printf("%x", sum)
   ```

The fixture demonstrates that CDS canonicalization, RTL normalization, CCE
closure, ABI bindings, and RPC envelopes all preserve byte‑identical artifacts.

---

## 7. Operational Checklist

Clients and servers MUST expose the following observable behaviors to guarantee
deterministic interoperability:

1. **Strict payload echo**: responses MUST repeat the request `id` and any
   supplied `prior_refined_cds` hash verbatim. Any alteration, even cosmetic,
   indicates an envelope violation and MUST result in `CCE_RPC_ECHO_FAIL`.
2. **Canonical timing**: streaming transports MUST preserve request order; the
   server MAY process in parallel but MUST serialize responses in the exact
   order requests were received so causal hashes remain inspectable.
3. **Lease accounting**: when a session lease expires, the server MUST emit a
   terminal error with the lease identifier and MUST NOT reuse the lease token.
   Clients MUST treat reuse as non‑deterministic behavior and abort.
4. **Version proof**: every response MUST set the `version` field to the CCE spec
   version string from `cce.md`; mismatches against the client’s expected
   version MUST be a hard error so replay tools can refuse mixed evidence.

This checklist ties wire behavior to the GFRTU closure steps, ensuring that
transport adapters cannot smuggle in host scheduling assumptions or hidden
state.
