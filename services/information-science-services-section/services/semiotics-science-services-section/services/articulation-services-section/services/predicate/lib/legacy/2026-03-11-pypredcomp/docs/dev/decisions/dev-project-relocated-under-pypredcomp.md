---
title: "Dev project relocated under pypredcomp"
description: "The dev project (charter, decisions, specs, plans, questions, references, texts, tasks, implementation guides) lives at pypredcomp/docs/dev/. Source-of-truth ordering: predicated-computing library theory → predication-categories library theory → these dev docs → pypredcomp/src/. The dev project's normative content is unchanged; only its position changed."
kind: decision
status: ratified
date: 2026-05-02
---

# Dev project relocated under `pypredcomp`

## What

The dev project for `pypredcomp` (charter, decisions, specs, plans, questions, references, texts, tasks, per-language implementation guides) lives at `operations/engineering/tools/predication-computer/pypredcomp/docs/dev/`.
It was previously located at `operations/command/projects/replit-sprint/`.

The relocation preserves the directory's contents, structure, and git history (a single-shot rename so git tracks it as a rename, not as delete+add).

External references to the previous path have been rewritten to the new one.
Internal relative links inside the dev project that escape it (targets under `library/` or `operations/`) have been re-rooted by adding three more `../` levels to compensate for the deeper position.

## Why

- **Adjacency.** The implementation under `pypredcomp/src/` cites spec paths in module docstrings (e.g. `specs/kernel/canonicalization.md`).
  Those paths now resolve under `docs/dev/` of the same package, so a reader of `src/substrate/canonicalization.py` reaches the spec via a sibling directory rather than via a cross-tree path.
- **Ownership.** The `replit-sprint` location implied a Replit-specific or sprint-specific scope; the dev project is neither.
  It is the design records of the `pypredcomp` package (and, by inheritance, of the Rust sibling at `operations/engineering/services/mash/`).
- **Operational accuracy.** `operations/command/projects/` is for *command-level* projects (cross-cutting, polity-wide).
  The pypredcomp dev project is an engineering project belonging to a specific package.
  `operations/engineering/tools/<tool>/<package>/docs/dev/` is the canonical home for an engineering package's development docs.
- **Discoverability.** A new agent reading `pypredcomp/README.md` finds the dev docs adjacent.
  A new agent reading `pypredcomp/src/substrate/closure_engine.py` finds the spec docstring resolving inside the same package.

## Source-of-truth ordering

The dev project is **derivative** of the library theories and **directive** of the implementation.
The ordering is:

1. **Mathematical theory** — `library/.../predication-categories/`.
  Provides the algebra and the categorical commitments.
2. **Engineering theory** — `library/.../predicated-computing/` (and its sub-theories: `agential-orchestration-platform`, `flatfile-agentic-resource-system`, `functional-runtime-platform`, `interactive-application-platform`, `web-server-platform`, `database-platform`, `distributed-coordination-platform`).
  Provides the engineering theorems the substrate is required to honour.
3. **Dev docs** — `pypredcomp/docs/dev/`.
  The OS-level concrete spec, the captain's decisions, the per-release plans.
  Cites (1) and (2); does not restate them.
4. **Implementation** — `pypredcomp/src/` (Python) and `operations/engineering/services/mash/` (Rust).
  Implements the spec; passes the same conformance vectors.

A spec disagreeing with a library theory **is wrong**.
An implementation disagreeing with the spec **is wrong**.
A library theory disagreeing with the captain's commitment **moves the captain to amend the commitment, or to file a question**.

## What this rules out

- **Forking the dev docs.** There is exactly one dev project per implementation lineage.
  The Rust sibling does not have its own `docs/dev/`; it inherits this one.
- **Restating library theory inside the dev docs.** The dev docs cite library theory; they don't carry copies of it.
- **Implementation-level decisions in `decisions/`.** Module-name, library-choice, and task-sequencing decisions live in `implementation/python.md`, `implementation/rust.md`, and per-release [milestones/](../milestones/).
  The `decisions/` directory is for OS-level commitments inherited by every conformant implementation.

## What this does not constrain

- **Where conformance fixtures live.** Per `pypredcomp-package-location`, fixtures live under `pypredcomp/tests/fixtures/<area>/`.
  That discipline is unchanged.
- **Where source modules live.** Per `pypredcomp-package-location`, modules live under `pypredcomp/src/{substrate,storage,network,drivers,shell,init_boot,process}/`.
  That discipline is unchanged.
- **Where the Rust sibling lives.** Per `engine-language-rust`, the Rust sibling lives at `operations/engineering/services/mash/`.
  That position is unchanged.

## Citations from code

`pypredcomp/src/<sub>/<module>.py` MAY cite a spec path as `specs/<area>/<doc>.md`.
Such citations are interpreted relative to `pypredcomp/docs/dev/`.
Authors SHOULD use either:

- A bare spec-relative path inside a module docstring (e.g. `# spec: specs/kernel/respond.md`), interpreted under `docs/dev/`, **or**
- A repo-rooted path (e.g. `operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/respond.md`).

The bare spec-relative form is preferred for brevity and survives further package-internal moves (e.g. a future sub-tooling reorganisation) without rewrite.
