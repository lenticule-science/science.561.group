---
title: "Source spec corpus — semiotic-cell-machine"
description: "The captain's pre-PredCat detailed spec corpus (~21k lines across 28 files). What each file is, which new spec consolidates it."
kind: reference
---

# Source spec corpus — semiotic-cell-machine

Path: `operations/engineering/triage/operations/command/personnel/emsenn/triage/projects/emsdeavor/developing/semiotic-repository/planning/ideas/semiotic-cell-machine/`.

The captain's detailed pre-PredCat specifications (~21k lines across 28 files).
Written in GFRTU/CCE/CDS/RTL vocabulary.
Each file's `architecture-classification` frontmatter says what's still load-bearing in the current architecture.

The new specs in [specs/](../specs/) consolidate this corpus.
The agent reads source files only when needing detail not captured in the new specs.

## Files and their consolidation

### Math foundation

| File | Lines | New spec |
|---|---|---|
| `docs/specs/semantics/trace-universe.md` | 2403 | `references/theories.md` (the math is now PredCat) |
| `docs/specs/semantics/cellular.md` | 78 | absorbed into `specs/respond.md`, `specs/cell-record.md` |
| `docs/specs/semantics/closure.md` | 118 | absorbed into `specs/respond.md`, `specs/closure-engine-internals.md` |
| `docs/specs/semantics/language.md` | 101 | `specs/message-language.md` |

### Wire formats

| File | Lines | New spec |
|---|---|---|
| `cds.md` | 419 | `specs/cell-record.md` |
| `docs/specs/carriers/cellular-json.md` | 215 | `specs/cell-record.md` |
| `docs/specs/carriers/closure-json.md` | 104 | `specs/repair-log.md`, `specs/evidence-vector.md` |
| `docs/specs/carriers/canonicalization.md` | 59 | `specs/canonicalization.md` |
| `docs/specs/carriers/storage.md` | 461 | `specs/storage-layout.md` |
| `cds-storage.md` | 462 | `specs/storage-layout.md` |

### Data format

| File | Lines | New spec |
|---|---|---|
| `cdf.md` | 1424 | `specs/cell-record.md` (extended), with format details for headers/payloads |

### Closure engine

| File | Lines | New spec |
|---|---|---|
| `cce.md` | 332 | `specs/respond.md`, `specs/closure-engine-internals.md` |
| `cce-abi.md` | 257 | absorbed into `specs/mcp-surface.md` |
| `cce-rpc.md` | 267 | absorbed into `specs/mcp-surface.md` |

### Term language

| File | Lines | New spec |
|---|---|---|
| `rtl.md` | 266 | `specs/message-language.md` |
| `docs/specs/carriers/language-json.md` | 90 | `specs/message-language.md` |

### Node / runtime

| File | Lines | New spec |
|---|---|---|
| `node.md` | 389 | `specs/runtime-cycles.md`, `specs/runtime-state.md` |
| `node-cycle.md` | 520 | `specs/runtime-cycles.md` |
| `node-addressing.md` | 464 | `specs/http-addressing.md` |
| `docs/specs/host/{host,runtime-cycle,addressing,abi,rpc,rdf}.md` | (mirror of root) | duplicate consolidations |

### RDF projection

| File | Lines | New spec |
|---|---|---|
| `rdf-profile.md` | 951 | `specs/interfacers/rdf.md` (TBD) |

### Roadmap

| File | Lines | New spec |
|---|---|---|
| `development-roadmap.md` | 4374 | `milestones/_index.md` (per-release records) |
| `docs/specs/host/host-implementation-roadmap.md` | 4373 | (mirror of dev-roadmap) |

### Index

| File | Lines | Notes |
|---|---|---|
| `index.md` | 6 | empty index |

## How to use this reference

For detail on, say, the closure engine's algorithm structure:

- The new spec is [specs/closure-engine-internals.md](../specs/closure-engine-internals.md).
- The source detail is `cce.md` (332 lines) and `docs/specs/semantics/closure.md` (118 lines).
- The new spec consolidates and translates; the source has more granular invariant definitions if the agent needs them.

For the wire format of a cell record:

- The new spec is [specs/cell-record.md](../specs/cell-record.md).
- The source is `cds.md` (the schema), `docs/specs/carriers/cellular-json.md` (the JSON form), `docs/specs/carriers/canonicalization.md` (hashing rules).

For the runtime state model:

- The new spec is [specs/runtime-state.md](../specs/runtime-state.md).
- The source is `node-cycle.md` (520 lines).

For the implementation roadmap:

- The captain wrote a 4374-line roadmap in `development-roadmap.md`.
  It predates PredCat; the agent reads it for context but the actual sequencing is in [milestones/](../milestones/).

The agent does not need to read these unless the new specs are insufficient for a specific implementation question.
When that happens, this reference points to the file.
