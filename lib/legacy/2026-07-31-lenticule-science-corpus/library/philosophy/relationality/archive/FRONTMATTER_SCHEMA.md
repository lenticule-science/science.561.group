---
title: Frontmatter Schema for Earned Docs
status: draft
---

# Frontmatter Schema

Frontmatter must be parseable into a typed DAG. The same core keys apply to
structures and operators; operators add input/output wiring and a transformation
DAG.

## Common keys (all non-act docs)
- `id` (string, required): unique, dot-free symbol matching the filename.
- `title` (string, required): human-readable title.
- `role` (enum, required): `structure` or `operator`.
- `status` (enum, required): `plan | draft | stable | deprecated`.
- `proof_refs` (array of string, optional): ids of acts/structures/operators
  cited in the body under `## Proof`.

## Structures
- `emerges_from` (string, optional): act id when the act directly induces the carrier.
- `fields` (array, required): each entry:
  - `name` (string): field name.
  - `type` (string): id of another structure (typed edge).
  - `description` (string): what the field means in the topos.

### Structure example
```yaml
id: hypertensor-section
title: Hypertensor Section
role: structure
status: draft
emerges_from: sheaf
fields:
  - name: window
    type: hypertensor-window
    description: locality of the section.
  - name: coverage
    type: coverage-site
    description: admissible sites the section ranges over.
proof_refs:
  - sheaf
```

## Operators
- `inputs` (array, required): each entry:
  - `id` (string): structure id consumed (typed edge).
  - `alias` (string): argument name.
- `outputs` (array, required): each entry:
  - `id` (string): structure id produced (typed edge; include failure carriers if any).
  - `alias` (string): output name.
- `transformation` (array, required): nested-array DAG encoding the morphism in
  terms of earned operators. The first element is an operator id; subsequent
  elements are literals or references/aliases. All operator ids referenced must
  have their own operator docs.

### Operator example
```yaml
id: join-recognition
title: Join Recognition
role: operator
status: draft
inputs:
  - id: recognition
    alias: left
  - id: recognition
    alias: right
outputs:
  - id: recognition
    alias: join
transformation:
  - meet-recognition
  - left
  - right
proof_refs:
  - recognition
  - meet-recognition
```

## Validation rules (DAG)
- Every `type` in `fields` must match a structure id.
- Every `id` in `inputs`/`outputs` must match a structure id.
- Every operator id referenced in a `transformation` must match an operator doc.
- No dangling ids; the combined set of structures/operators must form a typed DAG.

