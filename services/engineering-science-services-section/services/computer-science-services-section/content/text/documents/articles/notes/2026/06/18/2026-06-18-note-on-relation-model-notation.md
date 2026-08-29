---
title: "Reference on Relation Model Notation"
description: "Relation Model Notation (RMN): the frozen-array JSON term grammar for pure structure-to-structure morphism bodies, its reduction engine, and its JSON bridge."
date-created: 2026-06-18
date-modified: 2026-08-11
keywords:
  - RMN
  - term-ir
  - structure
  - morphism
  - CHL
  - Lean
---

# Reference on Relation Model Notation

Relation Model Notation (RMN) is a JSON s-expression term language for pure structure-to-structure morphism bodies. A term is data — a frozen array such as `["lam", ["var", 0]]` — never a JavaScript closure, so a morphism body can be serialized, hashed, inspected, and replayed.

RMN is the runtime surface of a simply-typed lambda calculus with products and unit, extended with lists and four executable forms. `relation-model-notation-service/src/types.mjs` mirrors metroplat's `src/lib/language/ast/types.mts`; `relation-model-notation-eval-service` mirrors `src/lib/language/eval/index.mts`, behavior preserved exactly. The seven-form core RMN extends — `var`/`lam`/`app`/`pair`/`fst`/`snd`/`star` — is exactly the term calculus proved confluent (Church–Rosser) in Obsmetrologia's Lean development (`Language/Predicating/CurryHowardLambek.lean`, `theorem church_rosser`). That proof covers the seven-form core; it does not cover `mark`, `coincide`, `cond`, or `fold`, which are additional executable forms the reduction engine implements alongside the proved core, not forms the Lean proof itself ranges over.

## Types and terms

Five types:

```
Ty = base | arrow Ty Ty | prod Ty Ty | unit | list Ty
```

Eleven term forms, de-Bruijn indexed:

```
Tm =
  var n                de-Bruijn variable
  lam body             lambda abstraction
  app fn arg           function application
  pair left right      product introduction
  fst t | snd t        product projection
  star                 unit / terminal
  mark s               opaque atomic string — the sole primitive-data constructor
  coincide l r         structural equality test, reduces to a mark-encoded boolean
  cond test then else  conditional on a mark-encoded boolean
  fold f init list     structural recursion over an array-encoded list — the one recursion primitive
```

That is the complete grammar. Nothing else is a term constructor. `mark` is the only place a bare value enters; every other form is either a binder, an eliminator, or `fold`.

A term is a **value** exactly when it is `mark`, `star`, or a `pair` of two values (`isValueTerm`, checked structurally, not by a separate value tag).

## The reduction engine

- **`step(term)`** — every one-step reduct, non-deterministic, congruent in every subterm: the full one-step reduction relation made total and enumerable.
- **`dev(term)`** — Takahashi complete development. Contracts every redex currently present in one structural pass — beta on `app`/`lam`, projection on `fst`/`snd` of `pair`, `coincide` on two fully-reduced values, `cond` on a resolved boolean, one `fold` unrolling when its list argument is resolved — without chasing redexes the pass itself creates. This is the map whose triangle property (every parallel reduct of `t` parallel-reduces to `dev t`) gives Church–Rosser its diamond directly.
- **`normalize(term)`** (aliased as `evaluate`) — recurses to full normal form, re-normalizing after each substitution; the only one of the three guaranteed to return an irreducible term.
- **`evaluateRunTerm(runTerm, input)`** — admits `input` through the JSON bridge, applies `runTerm`, evaluates to normal form, and decodes the result back through the bridge. The single entry point for running a morphism body against JSON data.

## Charge, boolean, and the field/append helpers are not term forms

Charge values are not a separate term constructor. A charge is encoded as a distinguished `mark`, one of four names: `"unknown"`, `"held"`, `"denied"`, `"contested"`. The charge algebra — `negate`, `joinK`/`meetK`, `joinT`/`meetT`, `leK`/`leT` — lives in the grammar layer as functions (`tm.negate`, `tm.joinK`, and so on) that compose `cond`/`coincide` over those marks. They are not opcodes the reduction engine switches on.

Boolean is likewise not a primitive term form: a boolean is derived from the truth-axis pair of the charge encoding (`held`/`denied`), not the other way around.

`field` (named-field projection) and `append` (list concatenation) are, in the same sense, `fold` compositions built in the grammar layer, not opcodes the reduction engine has separate cases for.

## The JSON structure bridge

`jsonToTerm(value)` / `termToJson(term)` are a round-tripping, canonical bijection on admitted JSON, implemented in `relation-model-notation-json-codec-service`. Every JSON value is admitted as a `pair` of a tag `mark` and a payload:

| JSON | Term |
|---|---|
| `null` | `pair(mark("rmn.json.null"), star())` |
| `boolean` | `pair(mark("rmn.json.boolean"), mark("true"))` or `mark("false")` |
| `string` | `pair(mark("rmn.json.string"), mark(canonicalBytes(value)))` |
| `number` | `pair(mark("rmn.json.number"), mark(canonicalBytes(value)))` |
| `[x, y, ...]` | `pair(mark("rmn.json.array"), listTerm([...items]))` |
| `{k: v, ...}` | `pair(mark("rmn.json.object"), listTerm(sorted entries))` |

Object keys are sorted lexicographically before encoding, so the bridge is canonical: the same JSON value always produces the same term, and the same term always decodes to the same JSON value. `listTerm`/`termList` build and read the array/entry spine as an ordinary right-nested `pair`-list terminated by `star`.

`objectTerm`, `arrayTerm`, and `stringTerm` build the same encodings directly at term-authoring time, for callers that don't have a JSON value in hand to bridge from.

## Positional field projection

`projectField(fieldNames, key, objectValue)` reads a named field out of an object term by direct position — `fst`/`snd` down the object's own sorted spine — for the common case where the object's field set is fixed and known when the term is written. This is a genuine categorical projection, typeable with the existing `prod`/`base`/`unit` vocabulary alone, and it matches how Obsmetrologia's own `PredicationCell` reads its fields (`φ.subject`, a real structure field, not a string-keyed runtime lookup — `Obsmetrologia/Language/Predicating/Cell.lean`). It is distinct from the generic, `fold`-based `field` helper, which is the right tool when an object's field set isn't known at term-authoring time.

## Typing

`inferTy`/`checkTy`/`tyEqual`, in `relation-model-notation-typing-service`, are a bidirectional typer over exactly the eleven-form grammar above — transcribed from metroplat's `src/lib/language/check/index.mts`, behavior preserved exactly. The typer adds no judgments and no term or type forms of its own.

## Packaging

The grammar, reduction engine, JSON codec, and typer are published as four packages — `@red-cup-engineering/relation-model-notation`, `-eval`, `-json-codec`, `-typing` — each a direct transcription of the corresponding metroplat module (TypeScript type annotations dropped, JSDoc typedefs substituted in their place), with no remaining runtime dependency on metroplat itself.
