Node Addressing (node-addressing.md)

Specification – Version 0.x (normative)

1. Purpose and Scope

This document specifies how to identify nodes and address artifacts (cells, judgments, closure runs, evidence) that a node serves.

It ties together:

Content identifiers from CDS and CDS‑Storage (cell‑ids, judgment hashes). 

cds

Local storage paths inside a CDS‑Storage root. 

cds

Network URIs for HTTP‑style access to those same artifacts, reusing the URI patterns recommended by the RDF profile where possible. 

gfrtu

Execution identifiers from CCE‑RPC envelopes. 

cce-rpc

This specification does not define:

how nodes implement CCE or CDS‑Storage internally;

replication, routing, or discovery between nodes;

authorization or access control.

It is purely about naming and resolution: given a node and an identifier, how to locate the corresponding bytes, locally or over the network.

2. Terminology and Conventions

The key words MUST, MUST NOT, REQUIRED, SHOULD, and MAY follow RFC 2119.

Cell – A canonical CDS JSON object whose id is the SHA‑256 hash of its canonical bytes, as defined in CDS and CDS‑Storage. 

cds

Cell‑id – The 64‑character lowercase hex SHA‑256 digest of a cell’s canonical JSON bytes. Equal to the CDS id field and the filename stem in CDS‑Storage. 

cds

Judgment‑id – The 64‑character lowercase hex SHA‑256 of a canonical RTL judgment, as used in the RDF profile and judgment store profile. 

gfrtu

Exec‑id – The opaque id field in CCE‑RPC requests/responses identifying a closure execution. 

cce-rpc

Storage root ($ROOT) – Filesystem root of a CDS‑Storage instance. 

cds

Node – A running process (or tightly‑coupled group of processes) that:

owns a single storage root $ROOT conforming to CDS‑Storage; 

cds

exposes zero or more network endpoints (typically HTTP) for reading/writing cells and related artifacts.

3. Node Identity
3.1 Node Identifier

Each node MUST have a node identifier (node-id):

a non‑empty ASCII string,

unique within the deployment,

stable for the lifetime of the node’s storage root.

Recommended form:

node-id := <dns-label> [ "." <dns-label> ]*


(e.g., dev1, prod.eu-west, example.org).

Nodes MAY use stronger identifiers (e.g., public‑key fingerprints), but such schemes are out of scope here.

3.2 Node Configuration

A conforming node MUST have a configuration containing at least:

node-id       : string           // as above
storage-root  : absolute-path    // $ROOT for CDS-Storage
base-uri      : absolute-URI     // e.g. https://example.org/


storage-root MUST be the directory that CDS‑Storage treats as $ROOT. 

cds

base-uri is the network base used to form external URIs in this spec. It MUST:

be an absolute URI with http or https scheme;

end with a /.

Example:

node-id      = "cells.dev.local"
storage-root = "/var/lib/cds-store"
base-uri     = "https://cells.dev.local/"

4. Content Identifiers
4.1 Cells

A cell identifier is exactly the cell-id:

cell-id := 64 * ( "0".."9" | "a".."f" )


The SHA‑256 hash of the canonical CDS bytes MUST equal cell-id. 

cds

Inside CDS JSON, id MUST equal cell-id. 

cce-rpc

4.2 Judgments

A judgment identifier is:

judgment-id := 64 * ( "0".."9" | "a".."f" )


the SHA‑256 of the canonical RTL judgment JSON, as already used by the RDF profile. 

gfrtu

4.3 Executions

An execution identifier exec-id is:

exec-id := rpc.id


the id field from the CCE‑RPC request/response. It MUST be treated as an opaque string for addressing purposes. 

cce-rpc

5. Local Storage Addresses

Local storage layout is fully defined by CDS‑Storage. This section simply fixes the mapping between content identifiers and filesystem paths for use in node resolution. 

cds

5.1 Cells

Given cell-id, a node MUST map it to the path:

cell-path($ROOT, cell-id) :=
  $ROOT + "/cells/" + pp + "/" + cell-id + ".json"
where pp = cell-id[0:2]


This MUST match CDS‑Storage §4.3. 

cds

5.2 Judgments (optional)

If the Judgment Store profile is enabled, judgments are stored as:

judgment-path($ROOT, judgment-id) :=
  $ROOT + "/judgments/" + jj + "/" + judgment-id + ".json"
where jj = judgment-id[0:2]
``` :contentReference[oaicite:17]{index=17}  

### 5.3 Evidence (optional)

If the Evidence Store profile is enabled, evidence for execution `exec-id` is stored as:

```text
evidence-path($ROOT, exec-id) :=
  $ROOT + "/evidence/" + exec-id + ".json"
``` :contentReference[oaicite:18]{index=18}  

Implementations MAY choose alternate evidence formats or extensions; the mapping from `exec-id` to filename MUST be deterministic.

---

## 6. Network URIs

This section defines how a node SHOULD expose HTTP URIs for the artifacts it stores.

The patterns align with the RDF profile’s recommended URIs for cells, judgments, and closure executions. :contentReference[oaicite:19]{index=19}  

Let `B` be the node’s `base-uri`.

### 6.1 Cells

The **canonical cell URI** on a node is:

```text
cell-uri(B, cell-id) := B + "cell/" + cell-id


Example:

https://cells.dev.local/cell/f44702d55903...


A node that exposes HTTP MUST:

On GET cell-uri(B, cell-id):

return the canonical CDS JSON bytes from cell-path($ROOT, cell-id);

set Content-Type: application/json;

NOT reformat or re‑serialize the JSON. 

cds

Return 404 if HasCell(cell-id) is false. 

cds

6.2 Judgments (optional)

If the Judgment Store profile is enabled, the canonical judgment URI is:

judgment-uri(B, judgment-id) := B + "rtl/" + judgment-id
``` :contentReference[oaicite:22]{index=22}  

On `GET judgment-uri(B, judgment-id)`:

- Return the canonical RTL JSON from `judgment-path($ROOT, judgment-id)`;
- `Content-Type: application/json`.

### 6.3 CCE Executions (optional)

If the node exposes CCE‑RPC over HTTP, each execution with `exec-id` SHOULD be addressable as:

```text
apply-uri(B, exec-id) := B + "cce/apply/" + exec-id
merge-uri(B, exec-id) := B + "cce/merge/" + exec-id
``` :contentReference[oaicite:23]{index=23}  

Recommended behavior:

- `GET apply-uri(B, exec-id)`:
  - returns a canonical CCE‑RPC response envelope containing `code`, `status`, `refined_cds`, `repair_log`, etc.; :contentReference[oaicite:24]{index=24}  
- Evidence for the same execution MAY also be exposed from:

  ```text
  evidence-uri(B, exec-id) := B + "evidence/" + exec-id


which SHOULD serve the evidence JSON stored at evidence-path($ROOT, exec-id) when the evidence profile is enabled. 

cds

6.4 Relationship to RDF Profile

The RDF profile uses the same URI templates for identifying CDS cells, RTL judgments, and closure executions, but only for RDF graphs and JSON‑LD projections. 

gfrtu

Node‑Addressing treats these URIs as concrete HTTP endpoints serving the canonical JSON that RDF then decorates; RDF MUST NOT change the underlying bytes.

7. Address Forms and Resolution
7.1 Address Kinds

An address that a client or agent may see can be one of:

Content address (cell or judgment id):

cell-id
judgment-id


Node‑scoped URI:

cell-uri(B, cell-id)

judgment-uri(B, judgment-id)

apply-uri(B, exec-id) / merge-uri(B, exec-id)

evidence-uri(B, exec-id)

Alias address (optional, see §8).

An implementation MAY support additional schemes (e.g. node:// URIs) as syntactic sugar, but they MUST resolve deterministically to the forms above.

7.2 Resolution Algorithm (Cell)

Given a node configuration (node-id, $ROOT, B) and an input address A that is intended to name a cell, the Cell Resolution procedure MUST behave as follows:

If A is a 64‑char hex string:

Treat A as cell-id.

Compute p = cell-path($ROOT, cell-id).

If file exists and passes hash check (§4.4 in CDS‑Storage), resolution succeeds with:

local.path = p

local.cell-id = cell-id

network.uri = cell-uri(B, cell-id) (informational). 

cds

Else, report NOT_FOUND.

If A is an absolute http or https URI:

Parse A and check if the path matches "/cell/<cell-id>" with cell-id a 64‑char hex string.

If the host and scheme equal those of B, resolution is local:

proceed as in step (1) with that cell-id.

Otherwise, resolution is remote:

the node MAY:

either treat A as opaque and forward it to a remote fetch layer;

or refuse with REMOTE_ADDRESS_UNSUPPORTED.

This spec does not constrain remote fetching.

If A is any other form:

If alias resolution (§8) is enabled, attempt that.

Otherwise, report INVALID_ADDRESS.

Nodes MUST NOT silently rewrite or “fix up” malformed addresses; they MUST either resolve deterministically or fail.

The same pattern applies mutatis mutandis for judgments and evidence, using the corresponding path/URI constructors.

8. Aliases (Optional)

CDS‑Storage defines an Alias Mapping profile where human‑readable names map to cell-ids. 

cds

Node-Addressing extends this as follows.

8.1 Alias Store

If enabled, the node maintains an alias store under:

$ROOT/index/aliases.sqlite


or an equivalent deterministic location. This store maps:

alias (string) → cell-id (string)


Aliases:

MUST NOT affect which cells exist;

MAY be many‑to‑one or one‑to‑many. 

cds

8.2 Alias URIs

If aliases are supported, a node MAY expose:

alias-uri(B, alias) := B + "alias/" + alias


Recommended behavior:

GET alias-uri(B, alias):

resolves alias to cell-id via the alias store;

responds with 302 Found and Location: cell-uri(B, cell-id), or

responds with 404 if the alias is unknown.

Alias URIs are never canonical; the canonical reference is always cell-id and the corresponding cell-uri.

8.3 Resolution from Aliases

In the Cell Resolution procedure (§7.2), if A does not match any canonical form and aliases are enabled, the node MAY:

Treat A as a candidate alias string.

Look up cell-id = aliases[A].

If found, resolve as in §7.2(1).

If not found, report NOT_FOUND.

9. Node‑to‑Node Semantics (Non‑Normative)

This spec intentionally avoids defining routing or replication across nodes. However, some constraints follow from the addressing model:

Two nodes might both store the same cell-id. Their cell-uri(B, cell-id) values will differ in host/path, but the content identifier is the same.

Replication SHOULD preserve canonical bytes: if one node fetches a cell from another and stores it via PutCell, the resulting file MUST have the same cell-id and canonical JSON. 

cds

Higher‑level protocols (e.g., RDF projections, ActivityPub) that use the RDF profile’s URIs MUST treat cds:hash as the primary identity and node‑local URIs as locations. 

gfrtu

Any routing, gossip, or federation design MUST respect these constraints, but is out of scope here.

10. Security and Operational Considerations

Path safety. Because cell-id and judgment-id are hex strings, the path templates in this spec inherit CDS‑Storage’s resistance to path traversal attacks; implementations MUST still validate IDs before building paths. 

cds

Immutability. Once a cell file is written and PutCell returns success, all URIs derived from its cell-id MUST continue to serve identical bytes or fail; nodes MUST NOT mutate canonical JSON in place. 

cds

TLS. If HTTPS is used, nodes SHOULD ensure that base-uri corresponds to a certificate the node controls; but TLS specifics are outside this spec.

Privacy. Because cell-id is content‑derived, it can leak equality of content across nodes; deployments handling sensitive data SHOULD treat both $ROOT and the set of cell-ids as private. 

cds

11. Conformance

A node conforms to node-addressing Version 0.x if and only if:

It maintains a storage root $ROOT that conforms to CDS‑Storage. 

cds

It assigns a stable node-id, storage-root, and base-uri as described in §3.

It maps cell-id, judgment-id, and exec-id to filesystem paths exactly as in §5 (for the profiles it implements).

It derives HTTP URIs for those artifacts according to §6, and serves canonical JSON at those URIs (when HTTP exposure is enabled).

It implements Cell/Judgment/Evidence Resolution as in §7, without hidden rewrites.

Any alias profile it implements follows §8 and does not alter the semantics of content identifiers.

Anything beyond this—indexes, discovery, federation, or caching—is allowed but MUST NOT violate these addressing and resolution guarantees.