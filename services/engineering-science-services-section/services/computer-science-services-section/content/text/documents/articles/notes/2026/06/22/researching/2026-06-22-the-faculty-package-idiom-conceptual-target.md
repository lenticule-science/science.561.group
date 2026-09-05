---
title: "What a faculty package MUST be — the relating idiom (the conceptual target)"
description: "The synthesized conceptual target every one of the nine faculty packages must conform to, mined from the decision notes, the session transcripts, the lib/relating reference implementation, and CLAUDE.md. A faculty package is a CATEGORY presented at a boundary: schema-first carriers as objects, functions as arrows typed by schema'd domain/codomain (so they compose), and one action→induceBins→dispatch boundary projected to four faces. Seven invariants, stated prescriptively as a conformance checklist."
date: 2026-06-22
status: design
grounds: [relating, communicating, knowing, playing, animating, computing, socializing, gaming, organizing]
---

# What a faculty package MUST be

The nine faculty packages (relating + communicating/knowing/playing/animating + computing/socializing/gaming/organizing) must all be laid out like **`lib/relating`**, the reference implementation.
The principle in one line: **a faculty package is a CATEGORY presented at a boundary** — its objects are schema-first carriers, its morphisms are arrows typed by those carriers (so they compose), and its whole operation surface is one action registry projected to four transports.
This note is the conformance target, synthesized from the decision notes, the session transcripts, `lib/relating`, and CLAUDE.md.

## The eight invariants

### 1.
Carriers are single-source objects (one declaration is type + schema + validator) Each carrier is declared once with the TypeBox kernel — `carrier(id, shape)` (object shape) or `schemaCarrier(id, schema)` (any TypeBox schema, incl. recursive).
That one value supplies, simultaneously: the `Static<>` TypeScript type, the JSON Schema document with its `$id`, and the Ajv runtime validator — **no hand-written carrier interfaces, no codegen step**.
(This SUPERSEDES the 2026-06-21 "`realize` codegen at build time" mechanism — generating a separate type file caused schema↔type drift and a bootstrap cycle; the kernel makes type/schema/validator three projections of one value.
The `realize` forgetful functor `Sub(J) → StructuralTypes` survives as a live typing utility, not the carrier mechanism.)
The `$id` is the **bare package-rooted descent path** — never a URL (`relating/articulating/utterance`).
The bare `$id` `.json` documents served by OpenAPI/MCP are **outputs serialized from the registry**, not hand-authored inputs; `typing/registry` resolves `$id` across packages.

**Carriers past the early stages present their GENERATORS (free ⊣ forgetful).** A carrier that is a *free construction* over a small generating set stores only the generators; the derived structure is materialized on read — `present…` forgets to the generators, `free…` rebuilds (`free ∘ present ≅ id`, i.e. "no free data past Mark and Articulating").
Storing the derived free construction in the carrier is a category error (it bloats the wire form and blocks IR expression).

### 2.
Functions are arrows (morphisms with schema'd domain/codomain) Every operation is an `action()`: `{ verb, inputFormat/outputFormat (wire codec), domainSchema/codomainSchema ($ref to carrier $id), run | runTerm }`.
The body is a **pure morphism over admitted carriers**, not a stdin/argv script — and increasingly an **IR term** rather than freehand TS (see invariant 8).
The package's action set IS its **real morphism spine** (the category's arrows), not a flat catalog of helpers. **Carrier identity is the composition glue**: two morphisms compose — the pipe / linear-logic cut — **iff `producer.codomainSchema.$ref === consumer.domainSchema.$ref`** (an `$id` equality).
So composability is a schema fact, checkable, cross-package.

### 3.
The boundary: register once, project to four faces `induceBins(actions)` assembles the **coproduct apex** (the discovery carrier) from the registered actions. **One `dispatch`** runs any verb as CLI (reads stdin once, decodes by the argv-selected codec, runs the morphism, encodes, writes stdout).
`serve` binds the *same* apex to `node:http`.
The **four faces — CLI / OpenAPI / MCP / web — are functorial projections of the one apex** (no second ontology; every HTTP/MCP/form POST runs through `dispatch`).
Exactly **two bins** (`relate` / `relate-serve` for the package's namesake), never per-verb scripts. **Package-bin executable serving is DROPPED** — the CLI/dispatch surface replaces it.

### 4.
Self-witnessing Every scripted play reached through `dispatch` appends **one EAVT row** — E=caller, A=verb+arguments, V=return, T=timestamp — to the package's own dated, term-addressed ledger, settling into Datoms (`log → state → record → content` holography).
A direct in-process `run(...)
` is **not** a scripted play and is **not** witnessed.
The append-only log is the write-model; the projected state is the read-model.

### 5.
Carrier-node mounting (composability across packages) A package mounts its apex at the **`$id`-node of its domain carrier** in the host namespace; the URL path **spells the composition** (the proof tree), not a flat `/pkg/verb` list.
`serveManifold`/`tileManifold` tile a chosen subset of packages as one bundle on one origin; the wiring graph is **derived from the schemas** (edge producer→consumer iff codomain `$id` = domain `$id`); **four faces at every carrier node**.
An endomorphic package (domain `$id` = codomain `$id`, e.g. communicating on the meme) mounts as a **self-loop** at that node.

### 6.
Layout: the directory IS the descent `src/<descent>/<name>` mirrors the carrier `$id`.
`index.mts` rolls the categorical chain up as a **flat namespace** (the ordinary public API).
The substrate subpaths are uniform: **`/acting`** (action registrations + the dispatcher/serve/mounting), **`/codecs`** (wire-format boundaries, not carriers), **`/holography`** (`log→state→record→content`), **`/typing`** (`realize` codegen + the `$id` registry), **`/articulating`** (+ the rest of the descent's carrier schemas + generated types).
The `package.json` **exports map IS the categorical / capability surface** — the normative API; source JSDoc is the spec.

### 7.
Governing discipline (CLAUDE.md) - **Capability-preserving normalization:** keep domain logic in pure module functions and make transport a thin binding over them.
Normalizing to this idiom MUST preserve every capability — deleting verbs/sessions/features and replacing them with thinner stand-ins is regression, not normalization. - **The absence rule:** a removed/missing symbol is a design judgment that the old way was wrong; find the new principled composition (the primitive it collapsed into), **never restore, alias, or stub** it. - **The capability surface:** a package's `bin` and `exports` names are the vocabulary of what it can already do; a missing function is almost always present under a better name — read the surface before acting.

### 8.
Operation bodies are IR terms (the typed-total-LISP, gated by arrow/boundary) A morphism's `runTerm` is a value of the term layer (`relating/term`): a JSON s-expression shadow of the proven `RelMath.
CHL.
Tm` calculus (de-Bruijn STLC) extended with the domain primitives (`mark`, the FOUR `charge` algebra, `settle`) and structural primitives (`field`, `append`, `coincide`, `cond`).
`evaluate` runs it; **all four faces run the same IR through one `dispatch`**, so a morphism's logic is language-neutral data Lean can prove over and Rust can extract — not per-transport TS. **The gate is arrow/boundary:** a run MUST be an IR term iff the action is a true morphism (domain AND codomain are admitted carriers); **boundary** actions — raw-input *admission* and wire/text *transport/codecs* — are framework, exempt by that computable check, not a curated list.
Faithfulness of an IR term is checked against the proven model (Lean golden vectors where the math is Lean-able; differential against the real TS op for carrier-specific morphisms).

## Conformance, in one checklist

A faculty package conforms iff: (a) every carrier is a single-source TypeBox declaration (`carrier`/`schemaCarrier`) — one value is its `Static<>` type, `$id`-bare JSON Schema, and Ajv validator, no hand-written carrier interfaces and no codegen step; carriers past the early stages present their generators (`present`/`free`); (b) every operation is an `action()` with `domainSchema`/`codomainSchema` `$ref`s and a pure body; (c) the action set is the real morphism spine and composes by `$id` equality; (d) `induceBins` + one `dispatch` + `serve` give the four faces from the one apex, with EAVT witnessing; (e) the package mounts at its domain carrier's `$id`-node; (f) `src/` mirrors the descent and the exports map is the categorical surface; (g) no package-bin serving, no restored/aliased absences, no dropped capability; (h) every true-morphism body is an IR term (the arrow/boundary gate), faithfulness checked against the proven model (Lean / differential).

## How the nine stand (to be audited next)

`relating` is the reference (conformant by construction).
`communicating` is the proven migration template (endomorphic on the meme, schema-first, induceBins).
The remaining seven (knowing/playing/animating/computing/socializing/gaming/organizing) each need a per-package audit against the seven invariants — especially: are ALL carriers schema-first (vs hand-written interfaces)? is EVERY public function an `action` with schema'd domain/codomain (vs ad-hoc exported helpers)? does the action set compose by `$id`?
That audit, and the per-package conformance work it scopes, is the next campaign — the understanding above is its yardstick.
