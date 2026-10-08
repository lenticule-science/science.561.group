---
title: Repository Process and Development Flow
keywords:
  - meta
  - repository
  - process
layer: spec
status: plan
depends-on:
  - system/structure/interface-port
  - theorem/internal/trace-infrastructure
  - theorem/internal/universal-state-hypertensor
  - theorem/internal/structure
  - theorem/internal/function
  - theorem/internal/documentation-structure
  - theorem/internal/documentation-refinement-flow
description: This specification describes how the relational computer's development process should operate, and how the repository structure exists only to support that process.
---

This specification describes how the relational computer's development process
should operate, and how the repository structure exists only to support that
process. The goal is to reduce internal confusion by enforcing a clear flow
through acts, theorems, specifications, architecture, and code.

It is intentionally a **plan**: a first pass that we will refine by tightening
its connection to the internal theorem stack and updating code to match.

## 1. Directory roles

The repository is partitioned into layers that mirror the mathematical stack.
Each directory has a precise role; ambiguity between them is treated as an
error to be resolved in favour of the higher layer (acts ≻ theorems ≻ specs ≻
arch ≻ code ≻ tests):

- `docs/math/acts/`
  - Atomic relational acts. Each file defines a single act with:
    - `slug`, `top`, `bottom` metadata,
    - a derivation trace `(Top Bottom)` and interpretation.
  - Acts are **pure rewrite rules**; they do not introduce carriers or
    implementation details.

- `docs/math/theorem/internal/`
  - Internal theorems about structures and functions induced by acts.
  - Each theorem document is **atomic**:
    - it either asserts the existence of a single structure (with its laws),
    - or asserts the existence of a single operator between previously
      defined structures (with its laws).
  - Each such theorem must:
    - name the acts it depends on,
    - name exactly one structure or function,
    - state the type/shape and laws for that one thing.

- `docs/math/theorem/external/`
  - Correspondence theorems relating internal structures to external
    mathematics (e.g. simply-typed lambda calculus, Heyting algebras, sheaf toposes, quantum
    mechanics).
  - Each theorem must:
    - cite the internal structures it relies on,
    - specify the external structure,
    - state the equivalence or correspondence.

- `docs/app/spec/`
  - Implementation specifications. Each spec groups:
    - one or more carriers provided by internal theorems,
    - a finite set of functions/operations over those carriers,
    - invariants and behaviours that must be realised in code.

- `docs/app/arch/`
  - Architecture views of how specs are realised as services, runbooks, and
    interfaces.
  - Each document explains:
    - which specs it instantiates,
    - which modules (`app/*`), runbooks (`runbooks/*`), and endpoints expose
      the functionality.

## 2. Frontmatter conventions

Documents participate in a simple metadata scheme to clarify their role and
status:

- `layer`: one of `act`, `internal-theorem`, `external-theorem`, `spec`,
  `arch`.
- `status`: one of:
  - `someday`, `later`, `soon` – prospective or rough ideas,
  - `plan` – sketched but not yet wired into code,
  - `make` – being implemented,
  - `test` – implementation exists and is under active testing,
  - `doc` – implementation and documentation aligned,
  - `release` – stable, relied upon by other components.
- `depends_on`: list of act/theorem/spec identifiers this document relies on.
- For specs and arch docs, optional `implements` or `realises` fields may
  point back to theorem identifiers.

Optionally, documents may also declare:

- `claims`: a list of the main judgements or assertions the document makes,
  phrased so they could be rewritten as judgements over the earned structures
  and operators (or implementation types/functions in specs/arch), and
- `witnesses`: a list of external trace files or proof logs that record how
  those claims are derived from the dependencies under the allowed derivations
  for the document’s layer.

These fields are descriptive at first; over time we will enforce them via
checks and tests so that status, dependencies, and claims are mechanically
visible.

## 3. Development flow as flow/nucleation

Development is treated as a flow/nucleus process over this structure: we move
along traces (documents and code), and the nucleus (acts + internal theorems)
constrains which moves are allowed.

1. **Desire / Idea.**
   - Begin with a desired behaviour, typically captured in a prospective spec
     (`status: someday`/`later`) under `docs/app/spec/` or an informal
     description.

   From the documentation-refinement-flow theorem, the documentation structure
   itself provides a refinement flow: for any current slice of work, the
   `Next` function identifies nearby defective documents (non-atomic theorems,
   specs that do not instantiate their dependencies, or vague vocabulary) that
   are closest to acts in the dependency graph. These are the mathematically
   determined loci of work; human choice is only used to break ties when
   several are equally admissible.

2. **Theoretical grounding (acts + theorems).**
   - Identify the acts in `docs/math/acts/` that should generate or witness
     the behaviour.
   - Locate or write internal theorems in `docs/math/theorem/internal/` that
     provide:
     - carriers,
     - functions,
     - invariants.
   - Where appropriate, connect to external theorems in
     `docs/math/theorem/external/` to understand external semantics.

3. **Specification.**
   - Create or refine a spec in `docs/app/spec/` that:
     - selects carriers and functions from the internal theorem layer,
     - states concrete invariants and expected behaviours,
     - records dependencies in `depends_on`.

4. **Architecture.**
   - Update arch docs in `docs/app/arch/` to:
     - decide which modules and runbooks realise the spec,
     - describe how inputs/outputs and recognitions flow.

5. **Implementation.**
   - Implement or adjust:
     - Pydantic carriers in `app/schemas/`,
     - act handlers in `app/rewriter/acts/`,
     - runbooks in `runbooks/library/`,
     - surface APIs in `app/main.py` / `app/mcp_server.py`.

6. **Testing and documentation alignment.**
   - Add or refine tests under `tests/` that assert the spec’s invariants.
   - Update doc frontmatter `status` as code and docs converge.

7. **Backtracking on failure.**
   - When tests fail or behaviour feels wrong, treat this as a witness that
     something is mis-specified.
   - Prefer to correct **higher layers first**:
     - acts/theorems if the math is wrong or underspecified,
     - specs if the implementation contract is unclear,
     - arch if wiring is inconsistent.
   - When two adjacent documents disagree, the upstream layer is the default
     authority unless we deliberately revise it.
   - Avoid patching code or tests to satisfy outdated specs or ideas.

## 4. Intended effects

When this specification is fully realised:

- Every substantive code path in `app/` can be traced:
  - from act(s) → internal theorem(s) → spec(s) → arch doc(s) → implementation.
- Idea notes are clearly separated from binding specs and can be promoted only
  when backed by acts/theorems.
- Repository structure itself becomes a small, enforced nucleus that reduces
  confusion about where truth lives and which documents/code are authoritative.

Subsequent iterations will:

- tighten `depends_on`/`implements` fields for existing docs,
- split internal theorems into more atomic claims,
- and adjust code/tests so that this flow is respected in practice.
Each such iteration is itself a nucleation step on the documentation
structure: we apply refinement and normalization functions so that the
documentation layer moves closer to a normal form aligned with the
relational calculus.

## 5. Documentation as a view of the relational computer

In the limit, the repository should present a documentation layer that is
functionally isomorphic (at the level of observable behaviour) to the
relational calculus defined in `docs/math/acts/` and its theorems:

- Acts and internal theorems describe the abstract dynamics on recognitions,
  traces, contexts, and sheaf sections.
- Specs and architecture documents describe finite, implementable views of
  those dynamics on conventional hardware.
- Code, runbooks, and tests realise those views.

The role of this specification is to ensure that development steps over the
repository—edits to acts, theorems, specs, architecture, and code—respect the
same flow/nucleus discipline as the underlying mathematics: we move through
documentation along well-typed dependency traces, and we repeatedly enforce
invariants (atomic theorems, coherent specs, consistent wiring) so that the
implementation remains aligned with the earned relational math.
