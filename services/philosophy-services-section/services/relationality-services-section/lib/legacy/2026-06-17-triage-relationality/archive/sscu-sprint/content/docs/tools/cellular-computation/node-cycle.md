---
title: "Node Cycle"
---

# Node Runtime and Cycles (Node-Cycle)

**Specification – Version 0.x (normative)**  
**Document:** `node-cycle.md`  

- **Role:** defines the lifecycle, health model, and request/response cycles of a **node**: a long‑running process that owns a CDS‑Storage root, embeds a CCE instance, and optionally exposes CCE‑RPC.
- **Depends on:**
  - GFRTU mathematics (`gfrtu.md`) for the meaning of cells and closure. :contentReference[oaicite:0]{index=0}  
  - CDS (`cds.md`) for the JSON structure and hashing discipline of cells. :contentReference[oaicite:1]{index=1}  
  - CDS‑Storage (`cds-storage.md`) for on‑disk layout and store operations. :contentReference[oaicite:2]{index=2}  
  - RTL (`rtl.md`) for canonical judgments and normalization. :contentReference[oaicite:3]{index=3}  
  - CCE (`cce.md`) for closure semantics, repair logs, and error surface. :contentReference[oaicite:4]{index=4}  
  - CCE‑ABI (`cce-abi.md`) for host‑level FFI contracts. :contentReference[oaicite:5]{index=5}  
  - CCE‑RPC (`cce-rpc.md`) for network envelopes and evidence vectors. :contentReference[oaicite:6]{index=6}  
  - RDF Profile (`rdf-profile.md`) for URI patterns and external projection (optional). :contentReference[oaicite:7]{index=7}  
- **Provides to higher layers:** a deterministic runtime target for agents, CLIs, and services that need to:
  - store and retrieve cells,
  - refine cells via CCE, and
  - invoke CCE over RPC with reproducible transcripts.

This document **must not** redefine CDS, RTL, CCE, ABI, or RPC semantics. Where this specification speaks about canonical bytes, closure, or evidence, it is restating obligations from those documents, not introducing new ones.

---

## 1. Purpose and Scope

A **node** is a long‑running process that:

1. owns a single **CDS‑Storage root** directory (`$ROOT`) and uses it as its authoritative cell store; :contentReference[oaicite:8]{index=8}  
2. embeds or connects to exactly one **CCE implementation** (via ABI, in‑process, or subprocess); :contentReference[oaicite:9]{index=9}  
3. optionally exposes **CCE‑RPC** as a network (or IPC) service; :contentReference[oaicite:10]{index=10}  
4. runs a small set of **operational cycles**:
   - Storage Cycle (store/fetch/has),
   - Apply/Refine Cycle (CCE `apply`),
   - Merge Cycle (CCE `merge`),
   - RPC Cycle (CCE‑RPC request/response),
   - Shutdown Cycle (drain/stop),
5. maintains health and determinism guarantees around those cycles.

This specification:

- defines a **state model** for node processes,
- prescribes **initialization** and **shutdown** sequences,
- normatively specifies the **structure of each cycle** (order of steps, required checks, and side effects),
- defines what it means to be a **conforming Node Runtime**.

It does **not** specify:

- deployment tooling (systemd, Kubernetes, etc.),
- transport bindings beyond what CCE‑RPC already defines,
- HTTP or ActivityPub APIs (those belong to node‑addressing and RDF‑layer docs).

---

## 2. Terminology

- **Cell** – a canonical CDS JSON object, whose `id` and filename stem equal the SHA‑256 hash of its canonical bytes. :contentReference[oaicite:11]{index=11}  
- **Cell identifier (cell‑id)** – the 64‑char hex digest used as the cell’s global identifier. :contentReference[oaicite:12]{index=12}  
- **CDS‑Storage root (`$ROOT`)** – the directory containing an instance of CDS‑Storage, with at least `$ROOT/cells/`. :contentReference[oaicite:13]{index=13}  
- **CCE** – implementation of the Cellular Closure Engine, exposing `apply` and `merge` and producing `repair_log` and (optionally) evidence vectors. :contentReference[oaicite:14]{index=14}  
- **CCE‑ABI** – FFI boundary used by hosts to call CCE (`cce_apply`, `cce_merge`). :contentReference[oaicite:15]{index=15}  
- **CCE‑RPC** – transport‑neutral JSON envelope for invoking CCE over network/IPC. :contentReference[oaicite:16]{index=16}  
- **Judgment Store** – optional `$ROOT/judgments` profile as described by CDS‑Storage. :contentReference[oaicite:17]{index=17}  
- **Evidence Store** – optional `$ROOT/evidence` profile for CCE logs and transcripts. :contentReference[oaicite:18]{index=18}  

A **Node Runtime** or simply **node** in this document always refers to a process with a single `$ROOT` and a single closure engine instance (possibly replicated internally), not an arbitrary application that happens to call CCE.

---

## 3. Node State Model

A conforming node MUST implement at least the following abstract states:

- **`cold`**  
  Process not yet started or has not begun initialization.

- **`initializing`**  
  Node is parsing configuration, opening `$ROOT`, wiring CCE and RPC, and running self‑checks.

- **`ready`**  
  Node is fully initialized and capable of executing:
  - Storage Cycle (§5.1),
  - Apply/Refine Cycle (§5.2),
  - Merge Cycle (§5.3), and
  - RPC Cycle (§5.4) if RPC is enabled.

- **`degraded`**  
  Node is running but missing one or more capabilities. Examples:
  - CCE unavailable → node can serve storage but not refinement.
  - CDS‑Storage read‑only → node can fetch cells but not store new ones.

- **`draining`**  
  Node is shutting down:
  - no longer accepts new refinement or merge requests,
  - completes in‑flight cycles with a bounded timeout,
  - may continue serving read‑only storage operations.

- **`stopped`**  
  Process has exited or is no longer reachable.

Implementations MAY refine these into sub‑states (e.g., `healthcheck-failing`, `reindexing`) but MUST NOT weaken the guarantees associated with the abstract states above.

### 3.1 Required State Transitions

A conforming node MUST support at least the following transitions:

- `cold  → initializing` (process start)
- `initializing → ready` (successful initialization)
- `initializing → degraded` (partial initialization; CCE or storage partially unavailable)
- `ready → degraded` (runtime fault: CCE failure, storage corruption, etc.)
- `ready → draining` (orderly shutdown initiated)
- `degraded → draining` (orderly shutdown from degraded state)
- `draining → stopped` (shutdown complete)
- any state → `stopped` (abrupt termination due to fatal error or external kill)

Nodes SHOULD expose their current abstract state via at least one health/readiness endpoint or CLI command so external orchestrators can reason about them.

---

## 4. Initialization Cycle

The **Initialization Cycle** covers the transition from `cold` to `ready` (or `degraded`).

A conforming node MUST, at minimum, perform the steps in this section, in the given order.

### 4.1 Load Configuration

The node MUST load configuration from environment variables, command‑line flags, config files, or equivalent. Configuration MUST specify:

- path to CDS‑Storage root (`$ROOT`),
- CCE implementation and ABI parameters (library path, subprocess command, or in‑process binding),
- whether CCE‑RPC is enabled and, if so, its listen address/transport,
- resource limits (CCE fuel cap, memory ceilings, maximum concurrent closures),
- location/policy for optional Judgment Store and Evidence Store profiles. :contentReference[oaicite:19]{index=19}  

If configuration is missing any of these required parameters, the node MUST fail initialization and remain in `stopped` or enter a crash‑loop as determined by the host.

### 4.2 Open and Validate CDS‑Storage Root

The node MUST:

1. Resolve `$ROOT` to an absolute directory path.
2. Create `$ROOT` if it does not exist (subject to deployment policy).
3. Ensure `$ROOT/cells/` exists and is readable and writable. :contentReference[oaicite:20]{index=20}  
4. Optionally create `$ROOT/judgments/` and `$ROOT/evidence/` if those profiles are enabled. :contentReference[oaicite:21]{index=21}  

The node MUST perform at least a **basic store health check**:

- pick zero or more existing cell files,
- verify that each file:
  - parses as JSON,
  - hashes to its filename stem,
  - has `id` equal to the hash,  
  as required by CDS‑Storage §4.4. :contentReference[oaicite:22]{index=22}  

If any such check fails, the node MUST either:

- refuse to start (remain in `stopped`), or
- enter `degraded` with a state reason indicating **store corruption** and surface a `CS_ERR_CORRUPT_STORE`‑class error for relevant operations. :contentReference[oaicite:23]{index=23}  

### 4.3 Initialize CCE Implementation

The node MUST initialize a CCE implementation that conforms to `cce.md` and `cce-abi.md`. :contentReference[oaicite:24]{index=24} :contentReference[oaicite:25]{index=25}  

The initialization procedure MUST:

1. Load or connect to the CCE implementation via ABI or subprocess.
2. Verify ABI compatibility (size/alignment of structs, function symbol presence) as per CCE‑ABI §2–3. :contentReference[oaicite:26]{index=26}  
3. Run at least one **self‑test**:
   - a trivial `cce_apply` on the canonical fixture provided in `cce-rpc.md` §8 (Boolean cell + identity judgment) and check for `"CCE_OK"` and matching hashes; :contentReference[oaicite:27]{index=27}  
   - OR an equivalent known‑good fixture.
4. Verify that the CCE implementation reports a spec version compatible with the node’s expected `cce.md` version (if version stamping is available). :contentReference[oaicite:28]{index=28}  

If CCE cannot be initialized or fails self‑tests, the node MAY:

- start in `degraded` and **refuse refinement and merge cycles** while still allowing storage operations; or
- fail initialization entirely.

In `degraded` due to CCE failure, any request that would invoke CCE MUST return an error equivalent to `CCE_ERR_ABI_INCOMPATIBLE` or a deployment‑specific higher‑level error, without attempting a call. :contentReference[oaicite:29]{index=29}  

### 4.4 Initialize RPC Server (Optional)

If RPC is enabled, the node MUST:

1. Bind a listener to the configured address/transport.
2. Register handlers for at least `method = "apply"` and `method = "merge"` envelopes as defined in CCE‑RPC §2. :contentReference[oaicite:30]{index=30}  
3. Ensure that each handler:
   - validates and canonicalizes incoming envelopes,
   - routes requests into the Apply or Merge Cycle (§5.2–§5.3),
   - constructs responses that satisfy CCE‑RPC response shape and error mapping. :contentReference[oaicite:31]{index=31}  

RPC registration MUST NOT alter or extend CCE semantics; the server is a transport wrapper around the same closure operator.

### 4.5 Advertise Ready or Degraded

Once `$ROOT`, CCE, and (optionally) RPC are initialized:

- If all core capabilities are available, the node MUST transition to `ready`.
- If one or more are unavailable but storage is healthy, the node MAY transition to `degraded`.

The node SHOULD expose:

- a **readiness probe** indicating `ready` vs `degraded`,
- a **liveness probe** indicating `initializing` vs `stopped`.

The exact transport (HTTP `/healthz`, CLI `node status`, etc.) is non‑normative.

---

## 5. Operational Cycles

This section defines the **core cycles** that a node MUST implement.

The cycles are defined at an abstract API level; concrete CLIs, FFI functions, or RPC endpoints MAY vary, but MUST preserve the described ordering, checks, and side effects.

### 5.1 Storage Cycle

The **Storage Cycle** covers interactions with CDS‑Storage, corresponding to conceptual operations `PutCell`, `GetCell`, and `HasCell`. :contentReference[oaicite:32]{index=32}  

#### 5.1.1 `store_cell(cds_bytes) → cell-id | error`

A conforming node MUST implement a storage operation whose semantics match `PutCell(cds_bytes)` from CDS‑Storage §5.1:

1. **Parse JSON**  
   - Attempt to parse `cds_bytes` as UTF‑8 JSON.
   - On failure, return `CS_ERR_JSON_PARSE` (or equivalent).

2. **Validate as CDS**  
   - Check that the JSON satisfies CDS structural constraints: required keys, key types, no unknown keys. :contentReference[oaicite:33]{index=33}  
   - On failure, return `CS_ERR_CDS_INVALID` (or equivalent).

3. **Canonicalize**  
   - Canonicalize the CDS object per CDS §5 (lexicographic keys, numeric normalization). :contentReference[oaicite:34]{index=34}  
   - If canonicalization fails, return an appropriate error.

4. **Compute and verify hash**  
   - Compute `h = SHA‑256(canonical_cds_bytes)`; encode as lowercase hex.
   - Verify that the top‑level `id` field equals `h`; otherwise return `CS_ERR_ID_MISMATCH`. :contentReference[oaicite:35]{index=35}  

5. **Write or reuse file**  
   - Compute path `$ROOT/cells/pp/h.json` (or implementation’s deterministic prefix strategy). :contentReference[oaicite:36]{index=36}  
   - If file exists:
     - read bytes, verify they hash to `h`; if not, return `CS_ERR_CORRUPT_STORE`;
     - return `cell-id = h` without rewriting.
   - If file does not exist:
     - write canonical bytes to a temp file,
     - verify hash again,
     - atomically rename to final path,
     - fsync as appropriate. :contentReference[oaicite:37]{index=37}  

6. **Return**  
   - On success, return `cell-id = h`.

Any Node API that claims to “store a cell” MUST use this exact semantics, even if the underlying implementation is not literally called `PutCell`.

#### 5.1.2 `fetch_cell(cell-id) → cds_bytes | error`

Equivalent to `GetCell(cell-id)` from CDS‑Storage §5.2: :contentReference[oaicite:38]{index=38}  

1. Validate `cell-id` is 64‑hex; otherwise return `CS_ERR_INVALID_ID_FORMAT`.
2. Compute path `$ROOT/cells/pp/cell-id.json`.
3. If file missing, return `CS_ERR_NOT_FOUND`.
4. Read bytes, verify hash equals `cell-id`; if not, return `CS_ERR_CORRUPT_STORE`.
5. Return bytes exactly as stored; MUST NOT reformat JSON or change whitespace.

#### 5.1.3 `has_cell(cell-id) → bool | error`

Equivalent to `HasCell(cell-id)` from CDS‑Storage §5.3: :contentReference[oaicite:39]{index=39}  

- Validate format of `cell-id` as above; returning an error is RECOMMENDED on invalid format.
- Check existence and hash; if valid, return `true`, if missing, `false`.
- If present but invalid hash, treat as corruption error as in `fetch_cell`.

### 5.2 Apply/Refine Cycle (CCE `apply`)

The **Apply/Refine Cycle** uses CCE to refine a structural cell and RTL judgment into a closure‑complete cell, as described in `cce.md` §4–§5. :contentReference[oaicite:40]{index=40}  

The node MUST expose an operation equivalent to:

```text
refine_cell(input_cds_bytes, rtl_bytes, options) →
  { refined_cds_bytes, repair_log_bytes, canonical_judgment_bytes? } | error
where:
input_cds_bytes is canonical or non‑canonical CDS JSON,
rtl_bytes is an RTL judgment JSON,
options may include fuel and tracing flags.
The cycle MUST proceed in this order:
Store or canonicalize CDS input
If input_cds_bytes is not already canonical:
either canonicalize in‑process using CDS rules; or
call store_cell and then fetch_cell to obtain canonical bytes.
Validate structure and hash integrity as in §5.1.1.
Validate RTL judgment
Parse rtl_bytes as JSON and validate against RTL encoding rules; unknown keys or operators MUST be rejected (RTL_UNKNOWN_FIELD, RTL_UNKNOWN_OPERATOR). 
rtl

Normalize the judgment using RTL’s call‑by‑value, left‑to‑right strategy and fuel accounting; on divergence, surface RTL_CANONICALIZATION_DIVERGED. 
rtl

Construct ABI inputs
Build CdsCell and RtlJudgment structs referencing canonical CDS and RTL bytes exactly, as per CCE‑ABI §2. 
cce-abi

Call CCE apply
Invoke cce_apply(&cell, &judgment, &out).
On return, inspect CceErrorTag:
"CCE_OK" → success path,
any other code → error path, but repair_log MUST still be valid JSON. 
cce-abi

Handle success
Treat out.refined_cds.bytes as canonical CDS bytes:
store them via store_cell and obtain refined_cell-id,
verify that refined_cds.id and hash agree.
Treat out.canonical_judgment.bytes as the canonical RTL judgment:
MAY store in Judgment Store under its hash.
Treat out.repair_log.bytes as canonical JSON array of repair entries, as required by CCE §8. 
cce

MAY store under $ROOT/evidence/<exec-id>.json if Evidence Store is enabled.
Return refined_cds_bytes and repair_log_bytes (and canonical judgment if part of the API surface).
Handle failure
On error, out.refined_cds.bytes and out.canonical_judgment.bytes MUST be null/empty; out.repair_log MUST still be valid JSON (possibly []). 
cce-abi

Node MUST NOT persist any partially refined CDS as authoritative.
Node MAY persist the repair log as evidence.
Node MUST surface the exact textual error code (CCE/RTL/CDS) to callers.
Determinism
Repeated calls with identical canonical inputs and options MUST produce byte‑identical outputs, including repair_log ordering, as required by CCE and ABI determinism guarantees. 
cce

 
cce-abi

5.3 Merge Cycle (CCE merge)
The Merge Cycle uses CCE to merge two closure‑complete cells, as per cce.md §6. 
cce

 The node MUST expose an operation equivalent to:
text
Copy code
merge_cells(lhs_cds_bytes, rhs_cds_bytes) →
  { merged_cds_bytes, repair_log_bytes } | error
Steps:
Canonicalize inputs
Ensure both inputs are canonical CDS and closure‑complete (or accept them and allow CCE to reject); structure and hash checks as in §5.1.1.
Construct ABI inputs
Build CdsCell structs lhs, rhs.
Call CCE merge
Invoke cce_merge(&lhs, &rhs, &out_cell); inspect error tag.
Handle success
Store out_cell.bytes via store_cell and obtain merged_cell-id.
If CCE’s implementation also emits a repair log for merge (e.g., via a variant ABI or RPC), treat it as evidence.
Handle failure
Do not write any new cell.
Surface merge error codes (CCE_MERGE_SITE_MISMATCH, CCE_MERGE_CONSTRUCTOR_GAP, etc.) verbatim. 
cce

Determinism
For fixed inputs and fuel, merges MUST be deterministic.
5.4 RPC Cycle (CCE‑RPC Request/Response)
The RPC Cycle implements the CCE‑RPC envelope, described in cce-rpc.md §2–§3. 
cce-rpc

 The node MUST implement handlers for at least:
method = "apply"
method = "merge"
using the following sequence.
5.4.1 Request Handling
Given a request JSON:
jsonc
Copy code
{
  "id": "...",
  "version": "CCE-0.x",
  "method": "apply" | "merge",
  "cds": "base64-utf8-json",
  "rtl_judgment": "base64-utf8-json",   // apply only
  "fuel": 16,                           // optional
  "prior_refined_cds": "sha256-hex"     // optional
}
the node MUST:
Validate envelope
Reject unknown top‑level fields with CCE_RPC_UNKNOWN_FIELD. 
cce-rpc

Verify version matches the node’s CCE version if present; otherwise treat a mismatch as error.
Decode payloads
Base64‑decode cds (and rtl_judgment for apply).
Ensure that decoded bytes are valid UTF‑8 JSON; otherwise return CCE_RPC_PAYLOAD_ENCODING. 
cce-rpc

Session / lease checks (optional)
If prior_refined_cds is present, verify that it equals the hash of the decoded cds payload after canonicalization. Mismatch MUST return CCE_RPC_PRIOR_HASH_MISMATCH. 
cce-rpc

Determine fuel
Use fuel if provided; otherwise use node default fuel.
Pass fuel bound through to the Apply or Merge Cycle, making it visible for diagnostics and evidence.
5.4.2 Call Apply or Merge Cycle
For method = "apply":
Call Apply/Refine Cycle (§5.2) using decoded CDS and RTL bytes and chosen fuel.
For method = "merge":
Interpret cds as a composite payload if the RPC layer is defined that way, or expose a higher‑level API that encodes both cells; map that to Merge Cycle (§5.3).
The RPC layer MUST NOT alter closure semantics; it simply carries canonical bytes between client and node.
5.4.3 Construct Response
The response MUST follow the CCE‑RPC response envelope:
jsonc
Copy code
{
  "id": "same as request.id",
  "version": "CCE-0.x",
  "status": "ok" | "error",
  "code": "CCE_* or CDS_* or RTL_*",
  "refined_cds": "base64-utf8-json",
  "canonical_judgment": "base64-utf8-json",
  "refined_cds_hash": "sha256-hex",
  "repair_log": "base64-utf8-json",
  "evidence": ["sha256-hex", ...]
}
Obligations:
Echo id and version exactly.
On success (status = "ok"):
base64‑encode canonical refined_cds and (for apply) canonical judgment,
compute refined_cds_hash as SHA‑256 of decoded refined_cds and ensure that hash matches the id inside the CDS. 
cds

base64‑encode canonical repair_log. 
cce

On error:
set status = "error",
set code to the textual CCE/CDS/RTL error,
MAY still include repair_log if available.
Evidence vector:
if evidence is produced, populate evidence with SHA‑256 hashes in the order specified by cce.md and cce-abi.md (input CDS, input RTL, repair entries, output CDS, output judgment). 
cce

 
cce-abi

5.4.4 Error Mapping to Transport
When using HTTP/gRPC, the node MUST map CCE/RTL/CDS error codes to transport status as described in CCE‑RPC §3 (e.g., invalid inputs → HTTP 400, resource exhaustion → 429). 
cce-rpc

 Transport status MUST NOT mask application codes.
6. Evidence, RDF, and External Projection (Optional)
Nodes MAY provide RDF or JSON‑LD projections of cells, judgments, and CCE executions using the RDF Profile. 
rdf-profile

 This section is non‑normative but recommended where federation or provenance is important.
6.1 Evidence Store Integration
If the Evidence Store profile is enabled:
For each Apply/Refine or Merge Cycle, the node SHOULD write an evidence file under $ROOT/evidence/<exec-id>.json containing:
the CCE‑RPC request/response pair (if RPC),
the canonical repair_log,
any transcript data required by CCE‑ABI/RPC. 
cds-storage

 
cce-abi

 
cce-rpc

The format is application‑defined but SHOULD be canonical JSON.
6.2 RDF Projection
Nodes that expose RDF SHOULD:
mint URIs for cells, judgments, and CCE executions following the recommended patterns in the RDF Profile (Bcell/{cds-id}, Brtl/{judgment-hash}, Bcce/apply/{rpc-id}, etc.), 
rdf-profile

publish JSON‑LD contexts so canonical JSON can be treated as RDF without altering the underlying bytes,
project closure executions to prov:Activity and repair log entries to prov:Entity as described in §7 of the RDF Profile. 
rdf-profile

RDF views MUST NOT modify canonical JSON or feed back into CCE.
7. Shutdown Cycle
The Shutdown Cycle describes the transition from ready or degraded to stopped. A conforming node SHOULD implement a graceful shutdown with the following steps:
Enter draining
Stop accepting new Apply/Refine and Merge requests (both RPC and local APIs).
MAY continue to serve Storage Cycle read operations until a timeout.
Complete in‑flight cycles
Allow in‑flight Apply/Refine and Merge cycles to complete, up to a configurable deadline.
For RPC, return an explicit error if a request is rejected due to draining.
Flush and close resources
Ensure any buffered writes to $ROOT/cells/ and $ROOT/evidence/ are durable (fsync or equivalent). 
cds-storage

Cleanly shut down CCE instances and RPC listeners.
Enter stopped
Exit the process or remain idle according to deployment regime.
If the process is killed abruptly, the node can only rely on the atomic write guarantees of CDS‑Storage; partial writes MUST be treated as corruption on next initialization.
8. Conformance
A runtime environment conforms to node-cycle.md if and only if:
It maintains a single $ROOT and uses it as a CDS‑Storage instance as defined by cds-storage.md (canonical cells, content‑addressed layout, immutability). 
cds-storage

It embeds or connects to a CCE implementation that conforms to cce.md and cce-abi.md. 
cce

 
cce-abi

It implements the state model and transitions in §3.
It implements each of the cycles in §5 with the prescribed ordering, checks, and side effects, including:
using CDS‑Storage semantics for all cell persistence,
using CCE apply and merge for all closure operations,
preserving canonical bytes and textual error codes end‑to‑end.
If RPC is exposed, the node implements CCE‑RPC envelopes and error mapping as specified in cce-rpc.md. 
cce-rpc

It does not introduce hidden behaviors that contradict CDS canonicalization, RTL normalization, or CCE closure semantics.
Implementations MAY provide additional APIs (HTTP REST, gRPC, ActivityPub, agents) as long as those APIs are layered on the cycles described here and do not weaken any normative requirement.