---
title: "Agential Semioverse Tech Stack design plan"
aliases:
  - "Agential Semioverse Tech Stack design plan"
  - "agential semioverse tech stack design plan"
date-created: 2026-01-04T00:00:00
type: topic
tags: []
---

## Purpose

This plan specifies how to implement the Agential Semioverse as a Markdown/YAML
corpus with a minimal Python engine, in a way that respects the mathematical
constraints: fragment preservation, closure discipline, and parametric skills.
It emphasizes a strict library/engine boundary so that all admissible operators
live in the library, not the engine.

## Scope

- Define the library/engine boundary and minimal shared system.
- Specify the skill runtime model and execution path.
- Specify schema placement and minimal frontmatter.
- Provide a phased build order for the smallest working system.

## Non-goals

- Not a migration script.
- Not a complete UI design.
- Not a substitute for the math specification.
- Not a deployment topology or model architecture plan.

---

# Library/Engine Boundary (Normative)

## Library responsibilities

The library is the single source of truth for all [semiotic](../../../../../linguistics/topics/semiotics/index.md) objects:

- files and documents,
- skills and schemas,
- policies and authorization constraints,
- agent definitions and executable documents.

Nothing in the library is inert by default; everything is potentially
semantic/denotational.

## Engine responsibilities

The engine hosts a minimal kernel only:

- a long-running process,
- transport adapters (HTTP for CMS, MCP for agents),
- a skill loader/executor that applies library-defined operators.

The engine does not own authorization, schema validation, or filesystem
semantics. Those are skills in the library.

Mathematically: the engine provides the carrier for U, while all admissible
E in Int live in the library.

---

# Core Invariants (Must Hold)

- All operational behavior is mediated by skills.
- Skill execution is fragment-preserving and closure-compatible.
- Skill inputs and outputs are strictly typed; execution is defined only when
  decoding succeeds.
- Every skill returns an effect report (created paths, modified paths, and
  content hashes or structural summaries).
- Authorization is enforced as a precondition to execution, not as an engine
  side effect.
- Schemas live with the skills that use them.
- Frontmatter is minimal and semantic (avoid app-specific [ontology](../../../../../../../../../western-services-section/services/metaphysics-services-section/services/ontology-services-section/content/text/glossary/terms/ontology.md) lock-in).

---

# Minimum Viable Shared System

## Datastore

One filesystem-backed datastore rooted at:

- `/library`

The datastore adapter is unprivileged and exposes only:

- read bytes
- write bytes
- list paths
- create directories
- rename paths

No validation or authorization is enforced here.

## Interfaces

Two interfaces expose the same skills:

- a web CMS (human client),
- MCP (agent client).

Both call the same skill registry and return the same output schema.

## Minimal skills (non-negotiable)

These are skills, not engine features:

- `read-file-skill`
- `write-file-skill`
- `list-directory-skill`
- `make-directory`
- `move-path-skill`

Everything else (validation, auth, templating, policy) is layered on top of
these as skills.

---

# Skill Representation and Schemas

## Skill representation

A Skill is a named operator schema plus auxiliary artifacts that help construct
or select an interaction operator. Its representation (SKILL.md, scripts,
templates) is non-normative; multiple representations may denote the same skill.

## Schemas live with skills

Schemas are part of a skill's denotation boundary and live alongside the skill:

```
/library/.../skills/read-file/
  SKILL.md
  input.schema.yaml
  output.schema.yaml
```

The engine only needs to load schemas; it does not define them.

## Minimal frontmatter

For the first iteration, a skill needs only:

- `kind: skill`
- `denotes: interaction-operator`

Everything else can be inferred from colocated files.

---

# Engine Architecture (Python)

## A. Datastore adapter (thin)

Wrap a root directory and provide primitive, unprivileged operations:

- read bytes
- write bytes
- list paths
- create directories
- rename paths

This is the carrier for U.

## B. Skill loader and executor

The engine:

- discovers skills in the library,
- loads each skill into a registry (id, schemas, denotation entrypoint),
- validates inputs via the skill's schema,
- executes the skill's denotation, producing an effect report.

This is where the mathematics lives: skills denote operators; operators act on
U; the engine applies them.

## C. Interface adapters (CMS + MCP)

These are pure adapters:

- CMS: web UI that calls skills via HTTP; no filesystem access.
- MCP: exposes each skill as a tool; passes calls to the same executor.

No CMS-only or agent-only logic is allowed.

---

# Skills as Tools (Interoperability)

A Skill in the library becomes:

- an MCP tool,
- an HTTP action in the CMS,

with identical input/output schemas.

```
Skill definition
  -> typed callable (operator constructor)
  -> exposed as HTTP endpoint and MCP tool
```

This exposure does not change the denotation of the skill.

---

# Build Order (Phase 0)

Before anything else, build this and only this:

1. Python service that loads skills from `/library`.
2. HTTP and MCP adapters that call the same skill executor.
3. Implement only the minimal skills:
   - `read-file-skill`
   - `write-file-skill`
   - `list-directory-skill`

Once this works, add higher-order skills (auth, validation, templating, policy)
that wrap or compose the primitives.
