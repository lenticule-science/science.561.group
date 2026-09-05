---
title: Domain Definitions (Schemas, Runbooks, Handlers)
layer: spec
keywords:
  - meta
  - schema
  - runbooks
part-of: relational-computer
description: "Makes domain slices first-class where each domain declares its recognition schema, runbooks, and handler bindings."
---
Make “domain slices” (finance, MUD, space program, quantum sim, etc.)
first-class: each domain explicitly declares its recognition schema, runbooks,
and handler bindings, all grounded in the earned acts/theorems/specs.

## 1. Core recognitions

- `DomainDefinitionRecognition`
  - A domain slice of the relational computer:
    - `id`: stable slug (e.g. `finance-budget`, `space-program`).
    - `title` / `description`: human-facing name and summary.
    - `acts`: which base acts this domain is allowed to use (by id/slug).
    - `specs`: which specification/architecture/theorem texts it depends on.
    - `schemas`: list of domain-specific recognition types it introduces.
    - `runbooks`: list of runbook patterns this domain owns.
    - `handlers`: references to runtime handler bindings.

- `DomainSchemaRecognition`
  - A recognition type inside a domain:
    - `name`: type name (e.g. `BudgetRecognition`, `VehicleRecognition`).
    - `fields`: field names, types, constraints, and measurement channels.
    - `base_type`: how it embeds into the global `Recognition` schema
      (e.g. as a particular `type` + `payload` shape).
    - `acts_used`: which acts may operate on this type (create, update,
      measure, evolve, etc.).

- `DomainRunbookPatternRecognition`
  - A runbook template for the domain:
    - `name` + purpose,
    - `inputs` / `outputs` (in terms of domain schemas),
    - `act_sequence` or constraints (“must use these acts, in these roles”),
    - `dependencies`: which specs/theorems justify it.

- `DomainHandlerBindingRecognition`
  - A binding between math/runbooks and Python:
    - `act_id` or runbook pattern name,
    - `handler_id` / code locator (Python module:function, MCP tool, etc.),
    - `constraints`: preconditions and invariants the handler must uphold.

## 2. Topology and measurement

- **Topology**
  - `DomainDefinitionRecognition` nodes link:
    - downward to `DomainSchemaRecognition`s, runbook patterns, and handler
      bindings,
- sideways to spec/architecture texts in `docs/app/`,
    - upward to architecture components (`runtime`, `intake`, `policy`,
      `rewriter`) that implement them.
  - Each schema/runbook/handler references the acts it uses, providing a
    “local slice” of the global instruction set for that domain.

- **Measurement**
  - Per-domain metrics:
    - number of recognitions per schema,
    - runbook execution counts and success/failure rates,
    - coverage: which acts/specs are actually exercised by handlers.
  - Cross-domain metrics:
    - overlaps between domains (shared acts/specs),
    - conflicts or “collisions” where two domains try to own the same handler
      or schema name without an explicit coordination recognition.

## 3. Runbooks and flows

- `run_register_domain_definition`
  - Validate and register a new `DomainDefinitionRecognition`:
    - check that all referenced acts/specs exist in the earned math,
    - ensure schemas embed cleanly into the global `Recognition` schema,
    - ensure runbook patterns only use available acts from the instruction set.

- `run_introspect_runtime_bindings`
  - Scan the runtime (Python rewriters, MCP tools, intake schemas) to:
    - discover existing handler bindings,
    - infer partial domain definitions where they are missing,
    - or check that declared bindings match the actual runtime.

- `run_validate_domain_coverage`
  - For each domain:
    - confirm that every public API/runbook used in the app has a domain
      definition,
    - identify specs/architecture nodes that have no domain owning them,
    - suggest new domain definitions or adjustments.

- `run_enforce_domain_invariants`
  - During runbook execution:
    - ensure each step’s acts are permitted by the domain definition,
    - ensure inputs/outputs conform to the domain’s schemas,
    - log violations for audit and future tightening.

## 4. Cross-domain connections

- Provides the meta-structure for:
- lifting prospective specs under `docs/app/spec/` (status: someday/later) into concrete, wired specs and then to runtime bindings,
- aligning `docs/app/spec/*` and
    `texts/computer-architecture/*` with actual code (`app/*`),
  - keeping `runbooks/*` and `app/rewriter/*` honest with respect to the math.

- Works hand-in-hand with:
  - `static-docs-generator.md` to generate domain-aware documentation,
  - `gui-graph-workbench.md` and `dataview-query-language.md` to explore
    domains and their coverage visually,
  - `traceability-service` architecture to prove that every handler and
    runbook step has an earned mathematical justification.

This specification describes the meta-layer that lets the universal relational
computer understand its own domains as structured, typed slices of the global
instruction set and runtime graph, with explicit ties from acts/theorems/specs
to schemas/runbooks/handlers.
