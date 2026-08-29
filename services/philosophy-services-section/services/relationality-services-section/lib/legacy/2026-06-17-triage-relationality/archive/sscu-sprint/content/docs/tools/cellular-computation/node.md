---
title: "Node"
---

1. Purpose and Scope

A node is the concrete runtime unit that:

owns a CDS‑Storage root for canonical GFRTU cells; 

cds-storage

runs the Cellular Closure Engine (CCE) over those cells via a local ABI;

exposes closure and storage over a network boundary using CCE‑RPC envelopes; 

cce-rpc

optionally projects canonical artifacts into RDF/JSON‑LD. 

rdf-profile

Nodes are purely operational: they do not add mathematics beyond GFRTU, nor new structural formats beyond CDS/RTL/CCE.

This spec defines:

the boundary of a node (what it owns, what it serves);

required configuration and identity;

minimal services (storage, closure, RPC, addressing, projection);

conformance conditions for interoperable nodes.

It does not define:

cluster‑level topology, routing, or discovery;

higher‑level agents or orchestration;

user‑facing applications built on top of nodes.

2. Terminology and Dependencies

The key words MUST, MUST NOT, SHOULD, and MAY follow RFC 2119.

This spec depends on:

GFRTU mathematics for the notion of cells and closure. 

gfrtu

CDS for the canonical JSON shape of a cell and its hash discipline. 

cds

CDS‑Storage for the file‑level storage model and operations. 

cds-storage

RTL for judgment encoding and normalization. 

rtl

CCE for closure semantics (apply, merge). 

cce

CCE‑ABI for process‑internal bindings to CCE. 

cce-abi

CCE‑RPC for network envelopes around CCE calls. 

cce-rpc

RDF profile (optional) for projecting canonical JSON into RDF/JSON‑LD. 

rdf-profile

When this spec says “cell”, it means a canonical CDS JSON object whose id is the SHA‑256 hash of its canonical bytes.

3. Node Concept and Boundary
3.1 Definition of a Node

A node is a running process (or tightly‑coupled process group) with:

a single storage‑root $ROOT satisfying CDS‑Storage; 

cds-storage

a local CCE engine reachable through CCE‑ABI;

zero or more network endpoints (typically HTTP) that:

expose storage operations over content‑addressed cells;

expose closure operations using CCE‑RPC envelopes; 

cce-rpc

optionally expose RDF/JSON‑LD projections of canonical artifacts. 

rdf-profile

Everything “inside” the node (caches, indexes, threads, DBs) is an implementation detail as long as the external behavior described here is preserved.

3.2 Node Responsibilities

A conforming node MUST:

Persist cells canonically in a CDS‑Storage layout, without mutating bytes once written. 

cds-storage

Serve closure deterministically using CCE semantics via ABI and RPC.

Preserve hashes and IDs: any cell, judgment, or envelope it exposes MUST retain the canonical hash relationships defined by CDS, RTL, and CCE.

Respect node‑addressing rules for local paths and public URIs (see node-addressing.md).

Maintain immutability of canonical artifacts and treat indices and aliases as non‑authoritative views over the cell store.

4. Node Configuration
4.1 Required Configuration Fields

At startup, a node MUST be configured with at least:

node-id       : string           // stable identifier within a deployment
storage-root  : absolute-path    // $ROOT for CDS-Storage
base-uri      : absolute-URI     // e.g. https://cells.dev.local/


Constraints:

node-id MUST be unique within the deployment and stable across restarts sharing the same $ROOT.

storage-root MUST be the directory treated as $ROOT by CDS‑Storage. 

cds-storage

base-uri MUST:

be absolute with http or https scheme;

end with /;

be used as the base for all HTTP URIs defined in node-addressing.md and the RDF profile. 

rdf-profile

4.2 Optional Configuration

A node MAY also be configured with:

CCE options (fuel defaults, resource limits) consistent with CCE’s fuel semantics;

RDF projection settings (whether to serve RDF/JSON‑LD views, which vocabularies to include); 

rdf-profile

Indexes (SQLite, KV stores) over $ROOT for faster lookups, provided they are reconstructible from canonical files. 

cds-storage

Configuration MUST NOT change the core semantics of closure or canonicalization; it can only constrain resources or enable/disable optional services.

5. Storage Service

The storage service is the node’s concrete implementation of CDS‑Storage, accessible both to internal components and (optionally) over HTTP.

5.1 Relationship to CDS‑Storage

For every cell the node stores:

the on‑disk layout MUST follow $ROOT/cells/<pp>/<cell-id>.json (with <pp> a deterministic prefix of cell-id); 

cds-storage

the file content MUST be canonical CDS JSON whose hash equals both:

the filename stem cell-id, and

the id field in the JSON.

Judgment, evidence, and alias profiles MAY be enabled and stored under $ROOT/judgments, $ROOT/evidence, and $ROOT/index, respectively, exactly as in CDS‑Storage. 

cds-storage

5.2 Internal API

The node MUST provide an internal API equivalent to:

PutCell(cds_bytes) → cell-id | error

GetCell(cell-id) → cds_bytes | error

HasCell(cell-id) → bool | error

with semantics identical to CDS‑Storage §5 (parse, canonicalize, hash, check, write, immutability). 

cds-storage

5.3 HTTP Exposure (optional but recommended)

If a node exposes storage over HTTP, it SHOULD:

use the URI pattern /cell/<cell-id> under base-uri (see node-addressing.md);

on GET, return the canonical CDS bytes for that cell-id with Content-Type: application/json;

on PUT (if enabled), implement PutCell, returning 201 or 200 with the resulting cell-id, and reject non‑canonical or mismatched payloads with appropriate error codes (e.g. CS_ERR_ID_MISMATCH).

Nodes MUST NOT silently reformat JSON at this boundary.

6. Closure Service (CCE Integration)

The closure service is the node’s connection to CCE. It MUST realize apply and merge semantics as defined in cce.md. 

cce

6.1 ABI Integration

Internally, the node MUST:

treat CDS and RTL payloads as canonical JSON buffers;

call into CCE via the ABI types and functions (or an equivalent FFI binding) defined in cce-abi.md; 

cce-abi

honor CCE’s determinism: identical inputs MUST produce byte‑identical outputs (refined_cds, canonical_judgment, repair_log).

On success:

refined_cds MUST itself be a canonical CDS cell, ready for PutCell.

canonical_judgment MUST be a canonical RTL judgment according to RTL normalization rules.

On error:

repair_log MUST still be provided as canonical JSON, even if empty.

6.2 Resource Limits

Nodes MAY enforce fuel and resource limits, but:

limits MUST surface as the textual codes defined by CCE/ABI (e.g. CCE_CLOSURE_FUEL_EXCEEDED, CCE_ERR_RESOURCE_LIMIT);

nodes MUST NOT invent new error surfaces that obscure the underlying CCE error codes.

7. RPC Service (Network Closure API)

The RPC service maps network requests to CCE calls using the transport‑neutral envelopes from CCE‑RPC. 

cce-rpc

7.1 Envelope Handling

A conforming node that exposes RPC MUST:

accept requests whose body is canonical JSON matching the CCE‑RPC request schema; 

cce-rpc

decode base64 fields into canonical CDS/RTL JSON bytes before calling ABI;

invoke apply or merge according to method;

re‑encode outputs into the response envelope, preserving:

id,

version,

code,

refined_cds_hash,

repair_log,

and optional evidence.

Unknown top‑level fields MUST be rejected with CCE_RPC_UNKNOWN_FIELD. Malformed base64 or non‑UTF‑8 payloads MUST be rejected with CCE_RPC_PAYLOAD_ENCODING. 

cce-rpc

7.2 Transport Mapping

For HTTP, nodes SHOULD:

map validation errors to 400,

resource exhaustion to 429,

merge/closure precondition failures to 412,

and internal failures to 500,

while always surfacing the underlying code from CCE in the JSON body. 

cce-rpc

Transports MUST NOT claim success (200 OK, OK status) for application‑level error codes.

8. Addressing Service

Node‑local resolution of cells, judgments, executions, and aliases is defined in node-addressing.md. This spec only states the obligations at the node boundary:

Given a cell-id, the node MUST be able to:

derive the canonical on‑disk path under $ROOT exactly as CDS‑Storage does; 

cds-storage

derive the canonical HTTP URI under base-uri (e.g. /cell/<cell-id>), if HTTP is enabled.

Given a canonical URI under its base-uri, the node MUST be able to:

resolve it to a local artifact (cell, judgment, evidence) or fail deterministically, without rewriting or guessing.

Nodes MAY support aliases and remote URIs, but such features MUST NOT change the semantics of canonical content addresses or local resolution.

9. RDF / JSON‑LD Projection (Optional)

If enabled, a node MAY expose RDF/JSON‑LD views of canonical CDS/RTL/CCE artifacts, following the RDF profile. 

rdf-profile

Obligations:

canonical JSON MUST remain the primary source of truth; RDF views are projections;

URIs for cells, judgments, and executions SHOULD follow the recommended templates (/cell/<hash>, /rtl/<hash>, /cce/apply/<id>, etc.); 

rdf-profile

when serving JSON‑LD, the node MUST NOT:

alter the key set or ordering required by CDS/RTL/CCE;

pretty‑print or re‑serialize canonical JSON in ways that change hashes;

any RDF graph that mentions cds:hash, rtl:hash, or cce:refinedCdsHash MUST correspond to reconstructible canonical JSON bytes for those hashes. 

rdf-profile

10. Security, Concurrency, and Operational Notes

Immutability: Once PutCell succeeds for cell-id, the node MUST either:

always serve identical bytes for that cell-id, or

treat mismatches as CS_ERR_CORRUPT_STORE. 

cds-storage

Path safety: Nodes MUST validate IDs as 64‑char lowercase hex before constructing paths, relying on CDS‑Storage’s path safety guarantees. 

cds-storage

Concurrency: Nodes MUST tolerate concurrent closure requests and concurrent PutCell operations for the same or different cell-ids without corrupting the store or violating CCE determinism.

Privacy: Because hashes are derived from content, deployments handling sensitive data SHOULD treat $ROOT and cell IDs as private, and MUST NOT treat cell IDs as access control.

11. Conformance

A running system conforms to node.md Version 0.x iff:

It maintains a $ROOT and implements PutCell, GetCell, and HasCell with behavior identical to CDS‑Storage. 

cds-storage

It invokes a CCE engine via ABI in a way that preserves canonical bytes, hashes, and error codes.

Any RPC endpoints it exposes implement CCE‑RPC envelopes and error mapping exactly. 

cce-rpc

Any addressing behavior is consistent with node-addressing.md and does not alter content identities.

Any RDF/JSON‑LD views it serves follow the RDF profile without re‑canonicalizing or weakening canonical JSON guarantees. 

rdf-profile

Everything else—indexes, caching, agents, cluster orchestration—is allowed but non‑normative.