---
title: "SPEC.md improvement prompt"
type: prompt
date-created: 2026-03-12
authors:
  - claude-code
---


## Role

You are a specification engineer improving a formal software specification.
You are not building software. You are not exploring architecture. You are
making an existing specification more precise.

## Context

`SPEC.md` at the repo root specifies **qtOps**: software for instantiating a
Multi-Agent Semiotic Hub, an agential semioverse within a quasicrystalline
hypertensor topos.

The specification is structured as a set of named sections, each defining
either a data type or a procedure. Sections use custom headline IDs
(`## name {#name}`) and cross-reference each other as anchor links
(`[name](#name)`).

The architecture and the names are correct. Your job is to improve precision,
not to change anything.

## Task

Read `SPEC.md`. Identify sections that fail any of the criteria below. Fix
them. Output only the updated `SPEC.md`.

### Criteria for a complete type definition

A type definition is complete when:
- It has a named record shape listing every field with its type.
- Every field type is either a primitive (`str`, `int`, `bool`, `bytes`) or
  references another named type defined in the spec.
- No field type is `any`, `map[str, any]`, or otherwise unconstrained without
  a stated reason.

### Criteria for a complete procedure definition

A procedure definition is complete when:
- It has a function signature: named parameters with types, and a return type.
- Every parameter type and return type is a named type defined in the spec.
- The body is a numbered list of steps. Each step is a single atomic action.
- Every step that can fail states what error is returned or raised and whether
  execution halts or continues.
- Every call to another procedure names the procedure by its spec ID and states
  exactly which variables are passed as which arguments.
- Every mutation to `MachineState` is explicit: which field is modified, how,
  and at which step.
- The return value at the final step is explicit.

### Criteria for complete invariant coverage

An invariant is covered when it appears as a `MUST` or `MUST NOT` normative
statement, not as a description or a comment.

### Criteria for self-contained definitions

The specification is self-contained when:
- Every term, concept, or type used anywhere in the spec is defined within
  the spec itself, either as a named section or as an inline definition at
  first use.
- No reader should need to consult any external file to understand the
  meaning of any term, type, or procedure in the spec.
- Every acronym is expanded at first use.
- Every section that uses a term from another section MUST reference that
  section by its anchor ID.

## Source material

When a section is vague and the correct content is not derivable from the rest
of `SPEC.md`, consult the following sources. Read each file once. Do not
re-read. Do not paraphrase — extract the precise content needed and place it
directly in `SPEC.md`.

1. `library/agents/persona/emsenn/projects/emsdeavor/developing/semiotic-repository/planning/ideas/quasicrystalline-hypertensor-machine/quasicrystalline-hypertensor-topos-machine-specification.md`
   — Primary authority. Use for: Cell and Trace structure, ISA operator laws
   and their algebraic invariants, Profile construction, normalization
   procedures, Program semantics, MachineState transitions, the Observation
   Pipeline, QCHTTopos mathematical ground.

2. `library/agents/persona/emsenn/projects/emsdeavor/developing/semiotic-repository/planning/ideas/relational-computer-architecture-specification.md`
   — Secondary authority. Use only if source 1 is unclear on a specific point.

3. `library/triage/stuff-from-github/relationality-snapshots/034-2025-11-29-e63ce621/relationality/`
   — Reference implementation. Use to resolve ambiguity about how a construct
   is concretely realized. Relevant files: `models.py` (data types), `aog.py`
   (graph operations), `execution.py` (program execution), `system.py`
   (interact loop), `runtime.py` (boot sequence), `registry.py` (realizer
   binding).

If after reading these sources a correct answer is still not determinable,
output a clearly marked open question rather than inventing content.

## Constraints

- Do not produce any file other than the updated `SPEC.md`.

## Immediate issues

The main issue is not lack of terminology. It is that several normative sections over-specify intent but under-specify constructive procedure. The most important gaps are in enrich, profile construction, and parts of RTL evaluation. For example, enrich says to compute leq from “containment of recognition scope” and to generate full Heyting structure from the site/topos data, but it does not define a concrete algorithm that two implementers could follow and provably obtain the same tables. The same problem appears in sheafification: “add a recognition element witnessing their glueing if the sections agree on overlaps” is mathematically suggestive, but not operationally precise enough for deterministic implementation.

There are also a few direct consistency problems.

First, boot and profiles conflict at Core level. boot calls construct_profile(set(aog.cells.keys()), aog), but nucleate_profile says Core level requires a singleton cell_ids set and defines omega only in that case. construct_profile later sets omega = top(aog.cells[list(cell_ids)[0]]) “at Core level (singleton),” yet boot passes the full cell set. Either Core boot must construct one singleton profile, or Core profiles must support multi-cell omega semantics.

Second, Cell status semantics drift. Earlier, library cells are said to seed as "loaded" and become algebraically complete only after enrich; later, boot step 3 requires the AOG to contain fully enriched Cells with status = "live", not loaded stubs. That can be reconciled, but some surrounding language still treats library-seeded cells as "loaded" at boot. The spec should say explicitly: library files produce seeds, not Cells; after enrich, boot inserts only "live" Cells into the AOG.

Third, acts changes meaning. In the Cell record it is list[CellID], but in the cell-json section the example shape shows "acts": ["<OperatorName>", ...]. Those are incompatible. One of them has to change.

Fourth, the CDS-Storage section appears to require an "id" field in the stored JSON object, but the CDS record definition uses cell_id, not id. That is a concrete schema mismatch. The storage layer and CDS schema need one canonical field name.

Fifth, RTL typing has a product notation inconsistency. RTLType defines Prod as binary with "left" and "right", while the typing rule for prod uses an n-ary form Prod(A_0, ..., A_n). That can be repaired either by making products explicitly n-ary in the type grammar or by defining prod as right-associated binary products.

Sixth, RTLEquation.lhs and related fields are first declared as str, then later normatively redefined as JSON pattern objects. You do patch this with the “Note on legacy str fields,” but the earlier record declarations should be updated directly so the schema is not self-contradictory.

Seventh, some error codes do not line up. enrich references CCE_MERGE_FIXED_LAYER_EMPTY and CCE_STABILIZATION_TIMEOUT, while the official error table uses CCE_ERR_MERGE_FIXED_LAYER_EMPTY and does not define CCE_STABILIZATION_TIMEOUT. Those need normalization.

Eighth, a few storage and serialization claims are too strong or slightly circular. PutCell says to verify CDS structural requirements before canonicalization, but CDS structural requirements include fields whose own correctness depends on canonical derivation from Cell structure and topology. That is fine in principle, but it would help to distinguish syntactic validation from semantic validation and content-address verification.

There is also a deeper design tension around “this document contains everything required to implement CCS without consulting any other file.” In practice, that is not yet true, because the SMD section still says SMD is specified elsewhere, and several core mathematical-to-operational translations are only partially given. The document is close to being self-contained conceptually, but not yet algorithmically.