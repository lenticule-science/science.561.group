---
title: "Research on the Faculty Package Idiom as Conceptual Target"
description: "The conformance target for laying out all nine faculty packages like lib/relating: a faculty package is a category presented at a boundary, with schema-first single-source structures as objects, schema-typed composable arrows as morphisms, and the whole operation surface projected to four transports, stated as eight invariants (with a 2026-07-05 registry-wording correction)."
date-created: 2026-06-22
keywords:
  - package
  - faculty
  - conformance
  - structure
  - morphism
  - action
  - term-ir
  - relating
  - descent
  - apex
  - capability
  - codec
status: design
grounds: [relating, communicating, knowing, playing, animating, computing, socializing, gaming, organizing]
---

# Research on the Faculty Package Idiom as Conceptual Target

The nine faculty packages (relating + communicating/knowing/playing/animating + computing/socializing/gaming/organizing) must all be laid out like **`lib/relating`**, the reference implementation.
The principle in one line: **a faculty package is a CATEGORY presented at a boundary** — its objects are schema-first structures, its morphisms are arrows typed by those structures (so they compose), and its whole operation surface is projected to four transports.
This note is the conformance target, synthesized from the decision notes, the session transcripts, `lib/relating`, and CLAUDE.md.

**Correction (2026-07-05):** "one action registry" was removed from the principle
above during an earlier, too-fast pass. On direct read, action dispatch
(`src/running/dispatch.mts`'s `actionsByVerb`) is a `Map` keyed by exact verb name
and `src/registries/action-instruments.mts` is `actions.map(actionInstrument)` — a
functorial derivation, not a hand-grown predicate table — so "registry" was loose
wording, not a confirmed violation; the correction to the principle line stands
regardless, since the mechanism doesn't need that word either way. `typing/registry`
mentioned below no longer exists under that name in the live tree, so that specific
claim is stale/unverifiable rather than confirmed wrong.

## The eight invariants

### 1.
Structures are single-source objects (one declaration is type + schema + validator) Each structure is declared once with the TypeBox kernel — `structure(id, shape)` (object shape) or `schemaStructure(id, schema)` (any TypeBox schema, incl. recursive).
That one value supplies, simultaneously: the `Static<>` TypeScript type, the JSON Schema document with its `$id`, and the Ajv runtime validator — **no hand-written structure interfaces, no codegen step**.
(This SUPERSEDES the 2026-06-21 "`realize` codegen at build time" mechanism — generating a separate type file caused schema↔type drift and a bootstrap cycle; the kernel makes type/schema/validator three projections of one value.
The `realize` forgetful functor `Sub(J) → StructuralTypes` survives as a live typing utility, not the structure mechanism.)
The `$id` is the **bare package-rooted descent path** — never a URL (`relating/articulating/utterance`).
The bare `$id` `.json` documents served by OpenAPI/MCP are **outputs serialized from the registry**, not hand-authored inputs; `typing/registry` resolves `$id` across packages.

**Structures past the early stages present their GENERATORS (free ⊣ forgetful).** A structure that is a *free construction* over a small generating set stores only the generators; the derived structure is materialized on read — `present…` forgets to the generators, `free…` rebuilds (`free ∘ present ≅ id`, i.e. "no free data past Mark and Articulating").
Storing the derived free construction in the structure is a category error (it bloats the wire form and blocks IR expression).

### 2.
Functions are arrows (morphisms with schema'd domain/codomain) Every operation is an `action()`: `{ verb, inputFormat/outputFormat (wire codec), domainSchema/codomainSchema ($ref to schema $id), run | runTerm }`.
The body is a **pure morphism over admitted structures**, not a stdin/argv script — and increasingly an **IR term** rather than freehand TS (see invariant 8).
The package's action set IS its **real morphism spine** (the category's arrows), not a flat catalog of helpers. **Structure identity is the composition glue**: two morphisms compose — the pipe / linear-logic cut — **iff `producer.codomainSchema.$ref === consumer.domainSchema.$ref`** (an `$id` equality).
So composability is a schema fact, checkable, cross-package.

### 3.
The boundary: register once, project to four faces `induceBins(actions)` assembles the **coproduct apex** (the discovery structure) from the registered actions. **One `dispatch`** runs any verb as CLI (reads stdin once, decodes by the argv-selected codec, runs the morphism, encodes, writes stdout).
`serve` binds the *same* apex to `node:http`.
The **four faces — CLI / OpenAPI / MCP / web — are functorial projections of the one apex** (no second ontology; every HTTP/MCP/form POST runs through `dispatch`).
Exactly **two bins** (`relate` / `relate-serve` for the package's namesake), never per-verb scripts. **Package-bin executable serving is DROPPED** — the CLI/dispatch surface replaces it.

### 4.
Self-witnessing Every scripted play reached through `dispatch` appends **one EAVT row** — E=caller, A=verb+arguments, V=return, T=timestamp — to the package's own dated, term-addressed ledger, settling into Datoms (`log → state → record → content` holography).
A direct in-process `run(...)
` is **not** a scripted play and is **not** witnessed.
The append-only log is the write-model; the projected state is the read-model.

### 5.
Schema-node mounting (composability across packages) A package mounts its apex at the **`$id`-node of its domain structure** in the host namespace; the URL path **spells the composition** (the proof tree), not a flat `/pkg/verb` list.
`serveManifold`/`tileManifold` tile a chosen subset of packages as one bundle on one origin; the wiring graph is **derived from the schemas** (edge producer→consumer iff codomain `$id` = domain `$id`); **four faces at every schema node**.
An endomorphic package (domain `$id` = codomain `$id`, e.g. communicating on the meme) mounts as a **self-loop** at that node.

### 6.
Layout: the directory IS the descent `src/<descent>/<name>` mirrors the structure `$id`.
`index.mts` rolls the categorical chain up as a **flat namespace** (the ordinary public API).
The substrate subpaths are uniform: **`/acting`** (action registrations + the dispatcher/serve/mounting), **`/codecs`** (wire-format boundaries, not structures), **`/holography`** (`log→state→record→content`), **`/typing`** (`realize` codegen + the `$id` registry), **`/articulating`** (+ the rest of the descent's structure schemas + generated types).
The `package.json` **exports map IS the categorical / capability surface** — the normative API; source JSDoc is the spec.

### 7.
Governing discipline (CLAUDE.md) - **Capability-preserving normalization:** keep domain logic in pure module functions and make transport a thin binding over them.
Normalizing to this idiom MUST preserve every capability — deleting verbs/sessions/features and replacing them with thinner stand-ins is regression, not normalization. - **The absence rule:** a removed/missing symbol is a design judgment that the old way was wrong; find the new principled composition (the primitive it collapsed into), **never restore, alias, or stub** it. - **The capability surface:** a package's `bin` and `exports` names are the vocabulary of what it can already do; a missing function is almost always present under a better name — read the surface before acting.

### 8.
Operation bodies are IR terms (the typed-total-LISP, gated by arrow/boundary) A morphism's `runTerm` is a value of the term layer (`relating/term`): a JSON s-expression shadow of the proven `RelMath.
CHL.
Tm` calculus (de-Bruijn STLC) extended with the domain primitives (`mark`, the FOUR `charge` algebra, `settle`) and structural primitives (`field`, `append`, `coincide`, `cond`).
`evaluate` runs it; **all four faces run the same IR through one `dispatch`**, so a morphism's logic is language-neutral data Lean can prove over and Rust can extract — not per-transport TS. **The gate is arrow/boundary:** a run MUST be an IR term iff the action is a true morphism (domain AND codomain are admitted structures); **boundary** actions — raw-input *admission* and wire/text *transport/codecs* — are framework, exempt by that computable check, not a curated list.
Faithfulness of an IR term is checked against the proven model (Lean golden vectors where the math is Lean-able; differential against the real TS op for structure-specific morphisms).

## Conformance, in one checklist

A faculty package conforms iff: (a) every structure is a single-source TypeBox declaration (`structure`/`schemaStructure`) — one value is its `Static<>` type, `$id`-bare JSON Schema, and Ajv validator, no hand-written structure interfaces and no codegen step; structures past the early stages present their generators (`present`/`free`); (b) every operation is an `action()` with `domainSchema`/`codomainSchema` `$ref`s and a pure body; (c) the action set is the real morphism spine and composes by `$id` equality; (d) `induceBins` + one `dispatch` + `serve` give the four faces from the one apex, with EAVT witnessing; (e) the package mounts at its domain structure's `$id`-node; (f) `src/` mirrors the descent and the exports map is the categorical surface; (g) no package-bin serving, no restored/aliased absences, no dropped capability; (h) every true-morphism body is an IR term (the arrow/boundary gate), faithfulness checked against the proven model (Lean / differential).

## How the nine stand (to be audited next)

`relating` is the reference (conformant by construction).
`communicating` is the proven migration template (endomorphic on the meme, schema-first, induceBins).
The remaining seven (knowing/playing/animating/computing/socializing/gaming/organizing) each need a per-package audit against the seven invariants — especially: are ALL structures schema-first (vs hand-written interfaces)? is EVERY public function an `action` with schema'd domain/codomain (vs ad-hoc exported helpers)? does the action set compose by `$id`?
That audit, and the per-package conformance work it scopes, is the next campaign — the understanding above is its yardstick.
