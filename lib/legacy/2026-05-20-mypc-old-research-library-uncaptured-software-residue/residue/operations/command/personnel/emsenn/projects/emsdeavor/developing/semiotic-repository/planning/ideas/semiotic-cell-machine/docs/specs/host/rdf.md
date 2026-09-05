---
title: "RDF Profile for GFRTU Cells and Closure Evidence"
date-created: 2026-03-06T00:00:00
---

**Specification – Version 0.x (normative)**

---

## Layer Declaration — RDF Profile (Layer 6: External Semantic Projection)

This document occupies **Layer 6 (RDF projection)** of the GFRTU stack:

- **Role:** defines how canonical JSON artifacts from CDS/RTL/CCE/ABI/RPC are projected into RDF/JSON‑LD for identification, provenance, and federation.
- **Depends on:** structural encodings (Layer 2), operational semantics and evidence logs (Layer 3), ABI/RPC envelopes (Layers 4–5), and *indirectly* on GFRTU mathematics via those lower layers.
- **Provides to external ecosystems:** URIs, vocabularies, JSON‑LD contexts, and optional SHACL shapes that *describe* but never alter canonical artifacts.
- **Must not do:** introduce new closure rules, canonicalization logic, or mathematical constraints; all such semantics remain in `gfrtu.md`, `cds.md`, `rtl.md`, and `cce*.md`.

Any determinism or provenance requirements mentioned here are **reflections of lower‑layer obligations** and MUST NOT be treated as an alternative or competing source of semantics.

## 0. Status, Purpose, and Non‑Goals

This document defines an RDF and JSON‑LD profile for the artifacts introduced in:

CDS (Cellular Data Serialization)

cds

CCE (Cellular Closure Engine)

cce

CCE‑ABI

cce-abi

CCE‑RPC

cce-rpc

RTL (Recognition Term Language)

rtl

GFRTU (Generative Fibered Relational Trace Universe)

gfrtu

The RDF profile answers the narrow question:

Given canonical JSON artifacts (CDS cells, RTL judgments, CCE apply/merge results, RPC envelopes, repair logs), how are they represented as Linked Data (RDF/JSON‑LD), validated, and connected into provenance graphs?

This profile is:

Normative about:

URI patterns for identifying artifacts.

RDF classes and properties.

JSON‑LD context(s) for embedding canonical JSON.

Minimal validation constraints expressed as RDF shapes (e.g., SHACL).

How closure evidence and repair logs are exposed as RDF provenance.

Non‑normative about:

The mathematics of GFRTUs.

The operational semantics of CCE or RTL.

The binary ABI layout or transport details of RPC.

Semantics are fully determined by the base specifications; this profile MUST NOT redefine them or introduce new behavior.

Canonical JSON and hashes remain the authoritative witness of structure and closure. RDF is a secondary projection, not a new canonical form.

## 1. Conformance and Dependencies

The key words **MUST**, **MUST NOT**, **SHOULD**, and **MAY** follow RFC 2119 usage.

A conforming implementation of this profile:

Consumes and/or emits canonical JSON artifacts obeying:

CDS §3–§6 for cells and structural state.

cds

RTL §2–§4 for judgments.

rtl

CCE §2–§8 for closure behavior and repair logs.

cce

CCE‑RPC §2–§6 for envelopes.

cce-rpc

Maps those artifacts to RDF using:

The namespace and URI rules in §2–§3.

The JSON‑LD context(s) in §4.

The vocabulary in §5.

Optionally validates RDF graphs using the shapes in §6.

Optionally exposes provenance using PROV‑O as described in §7.

This profile depends on the canonicalization and hashing discipline of CDS, RTL, and CCE; any RDF view that would change the canonical JSON bytes or the associated hashes is non‑conformant.

## 2. Namespaces and Prefixes

This profile uses the following RDF namespaces (example host; deployments MAY substitute their own base URIs but MUST preserve local names):

```turtle
@prefix cds:   <https://relationality.dev/ns/cds#> .
@prefix rtl:   <https://relationality.dev/ns/rtl#> .
@prefix cce:   <https://relationality.dev/ns/cce#> .
@prefix rpc:   <https://relationality.dev/ns/cce/rpc#> .
@prefix gfrtu: <https://relationality.dev/ns/gfrtu#> .
@prefix prov:  <http://www.w3.org/ns/prov#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
```

Implementations SHOULD use these prefixes in human‑authored Turtle or SHACL, but the IRIs themselves are authoritative.

## 3. Resource Identification

### 3.1 Base resource categories

This profile assigns URIs to the following categories:

Cells and structural state

CDS cells (structural or closure‑complete).

Cell sites, objects, morphisms, sieves.

Logical artifacts

RTL judgments (canonicalized).

rtl

Closure executions and evidence

CCE apply and merge results (RPC or ABI surface).

Repair log entries.

Transport envelopes

RPC requests and responses.

cce-rpc

### 3.2 URI templates (informative, but recommended)

Given a deployment base URI \(B\) (e.g., https://relationality.dev/), the following URI templates SHOULD be used:

CDS cells

Bcell/{cds-id}


where {cds-id} is the canonical SHA‑256 hex digest in cds.id and the filename stem.

cds

RTL judgments

Brtl/{judgment-hash}


where {judgment-hash} is the canonical SHA‑256 of the normalized RTL judgment.

rtl

CCE apply executions

Bcce/apply/{rpc-id}


where {rpc-id} is the id field in the RPC request/response pair.

cce-rpc

CCE merge executions

Bcce/merge/{rpc-id}


Repair log entries

Bcce/apply/{rpc-id}/repair/{index}
Bcce/merge/{rpc-id}/repair/{index}


where {index} is the 0‑based index into the canonical JSON repair_log array for that execution.

cce

RPC requests and responses

Brpc/request/{rpc-id}
Brpc/response/{rpc-id}


Deployments MAY choose different paths, but they MUST:

use URIs that are stable over time, and

maintain a deterministic mapping from the canonical JSON’s identifying hash(es) to the resource URI.

### 3.3 Identity relationship between hashes and URIs

For any CDS cell resource C:

The subject URI of C MUST embed the same hash as cds:id.

cds

The RDF graph MUST include:

C a cds:Cell ;
  cds:hash  "f44702..."^^xsd:hexBinary .


For RTL judgments and CCE executions, an analogous property (rtl:hash, cce:executionHash) MUST be present and match the underlying canonical JSON.

These hash properties are the RDF‑visible witness of the canonical JSON identity.

## 4. JSON‑LD Contexts

### 4.1 General requirements

A JSON‑LD context for this profile:

MUST NOT change the underlying JSON key set or value order required by CDS, RTL, or CCE.

MUST NOT introduce new keys into canonical JSON objects.

MAY be applied by:

wrapping the canonical JSON as a value of rdf:value or

serving the canonical JSON with HTTP Link: rel="http://www.w3.org/ns/json-ld#context" headers.

Implementations SHOULD keep a strict separation between:

canonical JSON (for hashing and CCE admission), and

JSON‑LD views (for RDF tooling and federation).

### 4.2 Minimal combined context

The following context is a minimal normative mapping for the main artifacts. It is RECOMMENDED as https://relationality.dev/ns/gfrtu.context.jsonld (or equivalent host).

```jsonc
{
  "@context": {
    "@version": 1.1,

    "cds":   "https://relationality.dev/ns/cds#",
    "rtl":   "https://relationality.dev/ns/rtl#",
    "cce":   "https://relationality.dev/ns/cce#",
    "rpc":   "https://relationality.dev/ns/cce/rpc#",
    "prov":  "http://www.w3.org/ns/prov#",

    /* Generic identity */
    "id": {
      "@id": "cds:hash",
      "@type": "xsd:hexBinary"
    },

    /* CDS top-level */
    "kind":           "cds:kind",
    "site":           "cds:hasSite",
    "fibers":         "cds:hasFibers",
    "fixed_layer":    "cds:hasFixedLayer",
    "rtl_signature":  "rtl:signature",
    "structural_vocabulary": "cds:hasStructuralVocabulary",
    "constructors":   "cds:hasConstructor",
    "laws":           "cds:hasLaw",
    "defining_expression": "cds:hasDefiningExpression",
    "examples":       "cds:hasExample",

    /* CDS site */
    "objects":        "cds:hasObject",
    "morphisms":      "cds:hasMorphism",
    "topology":       "cds:hasSieve",
    "heyting_table":  "cds:heytingTable",
    "carrier":        "cds:carrier",

    /* RTL */
    "context":        "rtl:context",
    "term":           "rtl:term",
    "type":           "rtl:type",
    "op":             "rtl:operator",
    "args":           "rtl:arg",
    "variance":       "rtl:variance",
    "admissible":     "rtl:admissible",

    /* CCE / repair logs */
    "repair_log":     "cce:repairLog",
    "code":           "cce:errorCode",
    "before_hash": {
      "@id": "cce:beforeHash",
      "@type": "xsd:hexBinary"
    },
    "after_hash": {
      "@id": "cce:afterHash",
      "@type": "xsd:hexBinary"
    },
    "fuel_used": {
      "@id": "cce:fuelUsed",
      "@type": "xsd:integer"
    },

    /* RPC envelope */
    "method":         "rpc:method",
    "version":        "rpc:version",
    "status":         "rpc:status",
    "refined_cds":    "rpc:refinedCdsPayload",
    "canonical_judgment": "rpc:canonicalJudgmentPayload",
    "refined_cds_hash": {
      "@id": "cce:refinedCdsHash",
      "@type": "xsd:hexBinary"
    },
    "rtl_judgment":   "rpc:rtlJudgmentPayload",
    "fuel":           "cce:fuelBudget",
    "prior_refined_cds": {
      "@id": "cce:priorHash",
      "@type": "xsd:hexBinary"
    },
    "evidence":       "cce:evidenceHash"
  }
}
```

### 4.3 Context usage patterns

Implementations SHOULD use one of:

Header‑driven context
Serve canonical JSON as‑is and attach this context via HTTP Link headers.

Envelope context
Wrap canonical JSON under an RDF resource that has both:

rdf:value containing the canonical JSON as a string, and

JSON‑LD keys mapped by this context.

The second pattern is suitable when you need RDF triples and raw canonical JSON in the same representation.

## 5. RDF Vocabulary

This section defines the core classes and properties used in this profile. All definitions are interpretive projections of the base specs, not new semantics.

### 5.1 Core classes

#### 5.1.1 CDS classes

cds:Cell

A CDS serialization representing the structural state of a single local universe (cell) in a GFRTU. Corresponds to the JSON top‑level object with "kind": "cds".

cds

cds:Site

The site component of a cell (cds:hasSite), encoding objects, morphisms, topology, and Heyting table.

cds

cds:Object

A site object as it appears in site.objects[*].id.

cds:Morphism

A site morphism as it appears in site.morphisms[*].

cds:Sieve

A topology sieve, representing a covering family of morphisms.

cds:RecognitionFiber

The recognition fiber component under fibers.recognition.

cds:FixedLayer

The stabilized fixed layer under fixed_layer, interpreted as a subsheaf of the recognition sheaf.

cds:Invariant

An entry in laws.invariants[*], with severity and code.

cds

cds:Law

The laws object as a whole.

cds:RepairLogEntry

A structural repair entry inside laws.repair_log. CCE also produces operational repair logs; both project to this class.

#### 5.1.2 RTL classes

rtl:Judgment

A canonical RTL typing judgment (context, term, type).

rtl

rtl:Context

The ordered list of bindings in a judgment context.

rtl:Term

The syntactic term component of a judgment.

rtl:Type

The type component of a judgment.

rtl:Operator

An operator declared in rtl_signature.constructors[*].

#### 5.1.3 CCE and RPC classes

cce:ClosureExecution

A single execution of the CCE closure operator (either apply or merge), paired with its input CDS/RTL and resulting refined CDS. This abstracts over ABI and RPC layers.

cce:ApplyExecution

A cce:ClosureExecution corresponding to an apply call.

cce:MergeExecution

A cce:ClosureExecution corresponding to a merge call.

cce:RepairLogEntry

A single step in the closure repair log, matching the JSON shape specified by CCE §8.

cce

cce:ErrorCode

An error code from the CCE error surface (CCE_*, CDS_*, RTL_*).

rpc:Request

A CCE‑RPC request envelope.

cce-rpc

rpc:Response

A CCE‑RPC response envelope.

### 5.2 Key properties
#### 5.2.1 Identity and typing

cds:hash
Datatype: xsd:hexBinary
The canonical SHA‑256 hash of a CDS cell’s canonical JSON, equal to cds.id and the filename stem.

cds

rtl:hash
Datatype: xsd:hexBinary
The canonical SHA‑256 hash of a normalized RTL judgment.

rtl

cce:executionHash
Datatype: xsd:hexBinary
A hash for a particular CCE execution (e.g., over the canonical RPC request/response pair).

cds:kind
Range values include "cds". Mirrors the JSON "kind" field.

#### 5.2.2 Structural containment

cds:hasSite
Domain: cds:Cell
Range: cds:Site

cds:hasFibers
Domain: cds:Cell
Range: cds:RecognitionFiber

cds:hasFixedLayer
Domain: cds:Cell
Range: cds:FixedLayer

cds:hasStructuralVocabulary
Domain: cds:Cell

cds:hasConstructor
Domain: cds:Cell

cds:hasLaw
Domain: cds:Cell

cds:hasDefiningExpression
Domain: cds:Cell

cds:hasExample
Domain: cds:Cell

#### 5.2.3 Site internals

cds:hasObject
Domain: cds:Site
Range: cds:Object

cds:hasMorphism
Domain: cds:Site
Range: cds:Morphism

cds:hasSieve
Domain: cds:Site
Range: cds:Sieve

cds:heytingTable
Domain: cds:Site

The heyting table entries themselves remain as canonical JSON and are not decomposed into triples unless a deployment chooses to.

#### 5.2.4 Invariants and repairs

cds:hasInvariant
Domain: cds:Cell
Range: cds:Invariant

cds:severity
Range: literals "hard", "repairable", etc.

cds:invariantCode
Range: literal error code string.

cds:hasRepairLogEntry
Domain: cds:Cell or cce:ClosureExecution
Range: cds:RepairLogEntry / cce:RepairLogEntry

cce:errorCode
Range: the textual error code string (CCE_*, CDS_*, RTL_*).

cce:beforeHash, cce:afterHash
Datatype: xsd:hexBinary
The hashes before and after the repair step.

cce:fuelUsed
Datatype: xsd:integer
Remaining fuel at the point of repair.

cce

#### 5.2.5 RTL judgments

rtl:context
Domain: rtl:Judgment
Range: list/collection of rtl:Context entries, preserving declaration order.

rtl

rtl:term
Domain: rtl:Judgment
Range: rtl:Term

rtl:type
Domain: rtl:Judgment
Range: rtl:Type

rtl:operator, rtl:arg, rtl:variance, rtl:admissible
Project operator declarations and applications from JSON.

#### 5.2.6 CCE executions and RPC envelopes

cce:hasInputCell
Domain: cce:ClosureExecution
Range: cds:Cell (structural input).

cce:hasInputJudgment
Domain: cce:ApplyExecution
Range: rtl:Judgment

cce:hasOutputCell
Domain: cce:ClosureExecution
Range: cds:Cell (refined CDS).

cce:repairLog
Domain: cce:ClosureExecution
Range: list of cce:RepairLogEntry.

cce:fuelBudget
Domain: cce:ClosureExecution
Datatype: xsd:integer (fuel bound actually used).

cce:priorHash
Domain: cce:ClosureExecution
Datatype: xsd:hexBinary; corresponds to prior_refined_cds in RPC.

cce-rpc

rpc:method, rpc:status, rpc:version
Properties echoing RPC envelope fields.

rpc:refinedCdsPayload, rpc:canonicalJudgmentPayload, rpc:rtlJudgmentPayload
These properties hold canonical JSON payloads (or base64 encodings) as RDF literal values; they are not re‑serialized JSON from RDF.

## 6. Shapes and Validation (SHACL)

This section sketches minimal SHACL shapes that reflect MUST‑level constraints from the base specs at the RDF level. Implementations MAY extend these shapes.

### 6.1 cds:Cell shape

Intent: Every cell must have a site, fibers, fixed layer, RTL signature, structural vocabulary, constructors, and laws.

cds

```turtle
cds:CellShape
  a sh:NodeShape ;
  sh:targetClass cds:Cell ;

  sh:property [
    sh:path cds:hash ;
    sh:datatype xsd:hexBinary ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cds:hasSite ;
    sh:class cds:Site ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cds:hasFibers ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cds:hasFixedLayer ;
    sh:class cds:FixedLayer ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cds:hasLaw ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cds:hasConstructor ;
    sh:minCount 0 ;
  ] .
```

### 6.2 cds:RepairLogEntry shape

Intent: Every repair log entry must carry code, before/after hashes, and fuel.

```turtle
cce:RepairLogEntryShape
  a sh:NodeShape ;
  sh:targetClass cce:RepairLogEntry ;

  sh:property [
    sh:path cce:errorCode ;
    sh:datatype xsd:string ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cce:beforeHash ;
    sh:datatype xsd:hexBinary ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cce:afterHash ;
    sh:datatype xsd:hexBinary ;
    sh:minCount 1 ; sh:maxCount 1 ;
    sh:differentValues ( cce:beforeHash ) ;
  ] ;

  sh:property [
    sh:path cce:fuelUsed ;
    sh:datatype xsd:integer ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] .
```

### 6.3 rtl:Judgment shape

Intent: Canonical judgments must have context, term, type, and no unknown fields.

rtl

At the RDF level we enforce presence; JSON‑level unknown‑field rejection remains in the RTL spec.

```turtle
rtl:JudgmentShape
  a sh:NodeShape ;
  sh:targetClass rtl:Judgment ;

  sh:property [
    sh:path rtl:context ;
    sh:minCount 1 ;
  ] ;

  sh:property [
    sh:path rtl:term ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path rtl:type ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] .
```

### 6.4 cce:ClosureExecution shape

Intent: Each closure execution must link input(s), output (on success), error code (if any), and repair log.

```turtle
cce:ClosureExecutionShape
  a sh:NodeShape ;
  sh:targetClass cce:ClosureExecution ;

  sh:property [
    sh:path cce:hasInputCell ;
    sh:class cds:Cell ;
    sh:minCount 1 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cce:hasOutputCell ;
    sh:class cds:Cell ;
    sh:minCount 0 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cce:errorCode ;
    sh:minCount 0 ; sh:maxCount 1 ;
  ] ;

  sh:property [
    sh:path cce:repairLog ;
    sh:minCount 1 ;
  ] .
```

Deployments SHOULD apply these shapes in CI or ingestion pipelines to ensure RDF graphs remain consistent with the underlying canonical JSON artifacts.

## 7. Provenance and Evidence Graphs

CCE and CCE‑RPC already define transcripts and repair logs as evidence for closure. This section specifies how to project them into the PROV‑O vocabulary.

### 7.1 Basic mapping

For each closure execution:

Let \(E\) be the cce:ClosureExecution resource.

Let \(C_{\text{in}}\) be the input cds:Cell.

Let \(C_{\text{out}}\) be the refined output cds:Cell (when present).

We define:

```turtle
E a cce:ClosureExecution, prov:Activity ;
  prov:used C_in ;
  prov:generated C_out .
```

For each repair log entry \(R_i\) related to \(E\):

```turtle
R_i a cce:RepairLogEntry, prov:Entity ;
  cce:errorCode  "CCE_INV_SIGMA_DELTA_CLOSED" ;
  cce:beforeHash "abcd..."^^xsd:hexBinary ;
  cce:afterHash  "ef01..."^^xsd:hexBinary ;
  cce:fuelUsed   12 ;
  prov:wasGeneratedBy E ;
  prov:specializationOf C_out .
```

If the execution ended in error:

E still exists as a prov:Activity.

\(C_{\text{out}}\) may be absent; repair log entries are still prov:Entity instances linking back to \(E\).

### 7.2 RPC transcript mapping

CCE‑RPC requires logging canonical request/response pairs and their hashes.

cce-rpc

For each RPC request Req and response Res:

```turtle
Req a rpc:Request, prov:Entity ;
Res a rpc:Response, prov:Entity ;

E  prov:used Req ;
E  prov:generated Res .

Req rpc:method "apply" ;
Res cce:refinedCdsHash "f447..."^^xsd:hexBinary .
```

An implementation MAY also:

- attach transport‑level status (HTTP 400, gRPC codes) via PROV attributes,
- treat the ABI‑level CceResult as an intermediate prov:Entity.

### 7.3 Replay and audit

A provenance‑aware auditor MUST be able to:

- Start from a cce:ClosureExecution resource \(E\).
- Follow prov:used to obtain the input cell and judgment.
- Follow prov:generated and cce:hasOutputCell to obtain the result cell.
- Enumerate cce:repairLog entries and reconstruct the same sequence of hashes and fuel counters.

If any reconstructed canonical JSON differs from the hash values recorded in RDF, the evidence is invalid.

## 8. Application Profiles (Informative)

This section is non‑normative and sketches how this profile plugs into external ecosystems.

### 8.1 ActivityPub and ActivityStreams

For federated systems (e.g., Mastodon‑like servers):

- Treat cds:Cell, rtl:Judgment, and cce:ClosureExecution as as:Object instances.
- Include `@context` referencing this profile alongside the ActivityStreams context.
- Use the URI templates in §3.2 for `id` fields.

Example (simplified):

```jsonc
{
  "@context": [
    "https://www.w3.org/ns/activitystreams",
    "https://relationality.dev/ns/gfrtu.context.jsonld"
  ],
  "id": "https://relationality.dev/cell/f44702...",
  "type": ["Object", "cds:Cell"],
  "site": { "... canonical CDS site JSON ..." },
  "fixed_layer": { "... " }
}
```

### 8.2 IndieWeb / Microformats

Deployments MAY embed canonical JSON (with the RDF context) in HTML pages, using:

- `<script type="application/ld+json">` blocks for the CDS/CCE artifacts.
- Microformats or h‑entry markup for human‑centric metadata.

### 8.3 OpenAPI and JSON‑first APIs

REST or OpenAPI APIs SHOULD:

- describe CDS, RTL, and CCE‑RPC request/response bodies as canonical JSON schemas; and
- refer to the JSON‑LD context URI in descriptions, enabling clients to turn responses into RDF when needed.

An endpoint returning a CCE‑RPC response could advertise:

- Response content type: `application/json`
- Optional `Link` header: `rel="http://www.w3.org/ns/json-ld#context"` pointing to the profile context.

## 9. Determinism and Canonicalization Obligations

To remain faithful to the base specifications, any RDF‑aware implementation MUST obey the following constraints:

**Canonical JSON is primary.**
The canonical JSON defined by CDS, RTL, CCE, and CCE‑RPC remains the single source of truth for structure and hashing. RDF graphs are projections; they are not re‑canonicalizations.

**No JSON rewriting.**
When producing RDF, implementations MUST NOT:

- pretty‑print canonical JSON,
- re‑order keys,
- drop fields, or
- otherwise mutate the bytes whose hash is recorded in cds:hash, rtl:hash, or cce:refinedCdsHash.

**Hash consistency.**
If an RDF graph exposes a cds:hash or cce:refinedCdsHash, the implementation MUST be able to reconstruct the underlying canonical JSON whose SHA‑256 is that hash.

**Order preservation where required.**
Arrays that are semantically ordered in the base specs (e.g., context bindings, constructor lists, repair logs) MUST maintain that order in any RDF list/collection representation.

**No new semantics.**
RDF inference (e.g., RDFS/OWL reasoning) MUST NOT introduce new closure behavior. Any inferred triples are purely descriptive and MUST NOT feed back into CCE admission or closure algorithms.

**Interoperability with transcripts.**
Transcript and provenance obligations from CCE‑ABI and CCE‑RPC remain in force; RDF projections are an additional, not alternative, way to expose them.

## 10. Implementation Checklist

A binding claiming conformance to this RDF profile MUST provide:

**Namespace support**
IRIs for the cds:, rtl:, cce:, and rpc: vocabularies.

**JSON‑LD support**
Ability to:

- attach the provided context(s) to canonical JSON, and
- obtain RDF triples consistent with this spec.

**Hash consistency checks**
A test verifying that cds:hash, rtl:hash, cce:refinedCdsHash, and related properties match the canonical JSON.

**Shape validation (optional but recommended)**
SHACL or equivalent validation for:

- cds:CellShape,
- cce:RepairLogEntryShape,
- rtl:JudgmentShape,
- cce:ClosureExecutionShape.

**Provenance exposure (optional but recommended)**
Projection of closure executions and repair logs into PROV‑O according to §7, with a demonstration that transcripts can be replayed.
