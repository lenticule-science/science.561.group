# Specification Suite Index

This index describes the structure of the specification suite and points to the authoritative documents for semantics, representations, and host behavior. Each cluster is intentionally separated to avoid mixing abstract meaning, JSON carriers, and host orchestration.

## Semantics (Abstract Meaning)

# [trace-universe.md](semantics/trace-universe.md) — generative trace site, sheafification, and stabilization invariants for the trace universe.
# [cellular.md](./cellular.md) — abstract definition of cells, morphisms, fibers, and semantic invariants.
# [language.md](./language.md) — RTL calculus typing, normalization, and operators as pure semantics.
# [closure.md](./closure.md) — CCE closure behavior and rules without representation details.

## Carriers (Canonical Representation)

# [canonicalization.md](./canonicalization.md) — global JSON canonicalization, numeric syntax, key ordering, and hashing rules.
# [cellular-json.md](./cellular-json.md) — concrete JSON structure for cells.
# [language-json.md](./language-json.md) — JSON encoding for RTL judgments.
# [closure-json.md](./closure-json.md) — canonical payloads for closure outputs, repair logs, and evidence sequences.
# [storage.md](./storage.md) — content-addressed storage layout and filename/hash relationships.

## Host (Execution and Interfaces)

# [host.md](host/host.md) — obligations of the Cellular Closure Host and its core behaviors.
# [runtime-cycle.md](host/runtime-cycle.md) — ingestion, normalization, closure, storage, and exposure pipeline.
# [addressing.md](host/addressing.md) — deterministic URIs, IRIs, and resolution for cells and judgments.
# [abi.md](host/abi.md) — binary ABI surface used to invoke host capabilities.
# [rpc.md](host/rpc.md) — canonical request/response envelopes for host invocation over transports.
# [rdf.md](host/rdf.md) — read-only RDF projection of canonical host artifacts.
# [host-implementation-roadmap.md](host/host-implementation-roadmap.md) — non-normative implementation guidance for building a host.

## Usage Notes

When authoring or updating specs, ensure content stays within its designated cluster:

# Semantics: math and meaning only — no JSON or byte-level rules.
# Carriers: serialization, canonicalization, hashing, and storage — no semantic definitions.
# Host: orchestration of semantics and carriers into deterministic execution and interfaces — no new semantics.
