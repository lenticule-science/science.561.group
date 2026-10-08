---
title: Relational Repository Environment
keywords:
  - architecture
  - repository
  - agent
depends-on:
  - specifications/repository-process
  - system/structure/documentation
  - system/operator/documentation-nucleation
  - specifications/testing
  - specifications/recognition-carrier
  - specifications/recognition-endpoint
description: "This document describes the relational repository environment: the Git repository, filesystem layout, and agent behaviour that together form the workspace for developing the relational informational dynamics computer."
---

This document describes the **relational repository environment**: the Git
repository, filesystem layout, and agent behaviour that together form the
workspace for developing the relational informational dynamics computer. It
fixes how agents should interpret this environment when adhering to the
mathematics and specifications.

## 1. Repository as relational state

The repository is a concrete carrier for several earned structures:

- **Documentation structure.**
  Files under `docs/` instantiate the documentation structure:
  - `docs/math/acts/` are act recognitions,
  - `docs/math/theorem/**` are internal/external theorem recognitions,
  - `docs/app/spec/` are specification recognitions,
  - `docs/app/arch/` are architecture recognitions.
  Frontmatter (`layer`, `status`, `depends_on`, `claims`, `witnesses`)
  provides the metadata required by the documentation-structure and
  documentation-refinement-flow theorems.

- **Code, runbooks, and tests.**
  Directories `app/`, `runbooks/`, and `tests/` are the implementation
  carriers that specs and architecture documents point to:
  - `app/` holds Python implementations (schemas, rewriter, services),
  - `runbooks/` holds YAML runbooks that orchestrate acts,
  - `tests/` holds pytest suites that implement invariants from specs.

- **Version control trace.**
  The Git history is a trace over the documentation structure:
  - commits are recognitions that record refinement steps,
  - commit messages are required to describe *what* changed, *how*, and
    *why*, in line with the documentation style spec,
  - branches and merges witness alternative refinement flows.

Agents and tools must treat the repository as a relational state whose
documentation layer is governed by the documentation-structure and
documentation-refinement-flow theorems.

## 2. Agents as refinement and execution processes

In this environment, an **agent** is any process (human or program) that:

- reads the current repository state,
- uses the documentation refinement flow to select loci of work, and
- applies edits and runs tests in ways that respect the specifications.

Concretely, an agent:

1. Interprets `docs/` via the documentation specs:
   - uses `layer`, `status`, and `depends_on` to build the documentation
     graph,
   - applies the `Next` function from the refinement-flow theorem to identify
     nearby defective docs (non-atomic theorems, specs not instantiating
     dependencies, vague vocabulary).
2. Chooses one or more documents from `Next` (breaking ties arbitrarily when
   multiple are equally admissible) and applies **Refine** steps:
   - splitting omnibus theorems into atomic ones,
   - tightening specs and arch docs to instantiate earned structures,
   - adjusting code and tests so they match specs.
3. Uses the testing specifications (`specifications/testing.md`) to run
   appropriate tests and ensure invariants are preserved or made explicit.
4. Records each coherent refinement as a commit with an informative message,
   so the Git trace reflects the refinement flow.

An agent that adheres to these rules has a deterministic procedure, up to
tie‑breaking, for moving the repository toward a more nucleated state.

## 3. Stabilising the repository

Stabilisation means reaching a state where, for the chosen scope:

- internal theorems are atomic and well-typed,
- specs/arch docs instantiate the structures/functions they depend on,
- tests reflect the invariants asserted by specs,
- and `Next` (from the refinement-flow theorem) is empty or only contains
  items marked as intentionally provisional (`status: someday`/`later`).

To stabilise a repository slice, an agent:

1. Picks an initial document or directory of interest (e.g., `docs/app/spec/`
   or `docs/math/theorem/internal/`).
2. Computes `Next` for that slice via the documentation refinement flow.
3. Repeatedly:
   - selects an element of `Next`,
   - applies a small, justified refinement step (often making new internal
     theorems or tightening specs),
   - runs targeted tests where appropriate,
   - commits with a message that explains the refinement.
4. Stops when `Next` is empty for that slice or only contains intentionally
   provisional docs.

Because `Next` and `Refine` are defined in terms of the documentation
structure and relational operators, this procedure is determined by the
mathematics; agents differ only in tie‑breaking, not in the nature of work
they are allowed to perform.

## 4. Interfaces and recognition endpoints

The repository environment also includes interface carriers and endpoints:

- **Recognition carriers and endpoints.**
  Specs under `specifications/recognition-carrier.md` and
  `specifications/recognition-endpoint.md` define how relational state,
  traces, and policies are packaged and exposed. Agents and tools that
  perform recognition (e.g., validating docs, scanning acts, building
  indices) should treat their outputs as recognition carriers consistent with
  these specs.

- **Testing and CI.**
  The testing spec defines how to treat test suites as relational programs
  over the repository state. Automated agents (CI, bots) must run these
  tests and treat failures as witnesses of defects in the documentation or
  code.

## 5. Intended use by agents

Agents arriving in this environment and adhering to the mathematics should:

- treat the repository as a relational state equipped with documentation and
  refinement structures,
- use `Next` and `Refine` to determine where and how to work, rather than
  relying on ad-hoc heuristics,
- ensure every edit moves the documentation closer to being expressible as an
  AST of relational acts and earned structures/functions,
- and use commits/tests as recognitions that record and verify each step.

In the limit, this architecture should make it possible for agents to
stabilise the repository deterministically and autonomously with respect to
the chosen scope, purely by following the earned mathematical structures and
specifications.
