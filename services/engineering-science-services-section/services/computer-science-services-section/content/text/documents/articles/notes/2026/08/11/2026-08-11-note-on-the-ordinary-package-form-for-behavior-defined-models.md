---
title: "The ordinary package form for behavior-defined models"
date-created: 2026-08-11
authors: ["Claude"]
status: prescriptive synthesis — the lineage sections report source read directly this session; the form sections are a recommendation grounded in that source and in the measured package census; the worked example is illustrative, not landed code
keywords:
  - package-form
  - models-and-behaviors
  - tab
  - qtops
  - section-surface
  - daily-business
  - npm-registry
  - leader-assistant
description: "The Leader's statement of the gap, 2026-08-11, near-verbatim: models defined by their behaviors, with instances parameterized over that, has been the aim for a long time; the math and theory for it exist; JavaScript/Node is the chosen…"
---


## The brief this answers

The Leader's statement of the gap, 2026-08-11, near-verbatim: models defined by
their behaviors, with instances parameterized over that, has been the aim for a
long time; the math and theory for it exist; JavaScript/Node is the chosen
carrier because it runs on every machine; what is missing is *how to design
actual node packages to meet these needs so that they are properly composable* —
the standardization of inputs and outputs keeps getting closer without being
stated. And one standing defect named directly: service sections that export
nothing are sections that provide no service. A section package should say
"this section gives you these entities and these operators."

This note states the form. It is derived from source, not invented: the
corpus has already built this pattern four times across fifteen years, and the
most recent build — inside FeltOS — is the synthesis of the previous three.
What has never been done is stating the pattern *as the npm package form*, which
is what makes it publishable, composable, and loadable at registry coordinates.

## The lineage, read from source this session

**racket-mud-5** (`.../2026-06-17-archive-emsenn-net/src/lib/code/2026/03/11/topical/arts/ludics/mud/tab/racket/personal-projects-racket-bcf/racket-mud-5/mud/thing.rkt`):

```racket
(struct thing (name id nouns adjectives qualities))
(struct quality (apply attributes))
```

A quality is literally a pair: an apply-function and attributes. `make-thing`
applies each quality's function to the thing at creation — and then returns
`(lambda (event) (event thing))`: **the thing is a function that accepts
events**. The thing *is* its interface; there is no way to reach it except
through behavior.

**qtOps / qtMUD qualities** (`.../emsops-qtmud-library/qualities/*.rkt`): a
quality is a bare function `(<>Quality thing #:params) → thing`, e.g.
`(define (<>Ackian t #:trivia [trivia #f]) (<>Teraumi t #:trivia trivia))` —
no declaration files at all; composition is function application; qualities
delegate to other qualities. Maximum flexibility, zero publishable data.

**TAB** (`.../wsl-home-archive/src/lib/local/tab/` — README: *"A thing is made
from a model defining the thing's attributes and behaviors"*): the declarative
turn. A model is a **data file** (`attributes/thing.fnl`: name, `base` chain,
`behaviors` list, `additive-attributes`, grammar, defaults); behaviors live in
separate modules (`behaviors/thing.fnl`) of named functions over the thing;
`make-thing` (tab.fnl:302) folds the base chain depth-first with an
additive-attribute merge law, and dispatch is **late-bound** — a metatable
resolves method names across the thing's behavior list at call time
(`__index tab.lookup-behavior-method`).

**The undecided decision**: the FARS work item
`.../rsc-quiescent/triage/work-orchestration/texts/tasks/decide-fars-declaration-pattern-tab-vs-qtops.md`
(2026-04-05, `status: open`) asks the Captain to choose: TAB-faithful (model
files + behaviors + base chain + dispatch table), qtOps-faithful (no
declarations, runtime quality composition), or hybrid. It was never formally
closed.

**FeltOS `src/mud/things.mts`** (`.../2026-08-04-fizzos-corpus/src/mud/things.mts`,
305 lines, read in full): the de-facto answer — **hybrid, with the corpus's
mathematics applied**. It carries:

- `FeltosThingModel` — TAB-faithful declarative data: `base`, `behaviors`,
  `qualities`, `additiveAttributes`, `grammar`, `attributes`. Plain frozen data.
- `FeltosThingQuality` — qtOps-faithful runtime composition, upgraded with
  `requires`/`provides` — a quality declares what it needs and what it endows.
- `FeltosThingRegistry` — models and qualities held by id; `composeFeltosThing`
  resolves the base chain (cycle-detected), merges under the additive law
  (`mergeFeltosThingModels`), applies qualities (`applyQualities`, tracking
  `provided`).
- The upgrade the theory earns: **composition is settlement.**
  `FeltosThingComposition` is `{thing, process, settled, charge}` — composing an
  instance produces assertions and judgments settled to a FOUR charge with
  `admitted: boolean`. Instantiation is a small proof, and on the settlement
  path refusal is a typed judgment. (One honest defect, found by adversarial
  review: registry *resolution* still throws — `resolveFeltosThingBases` raises
  a JS `Error` on a cyclic or unknown base rather than returning a judgment.
  The compose-kernel extraction below should convert those throws to typed
  judgments so the whole composition path is refusal-typed, not just the
  settlement half.)
- The bridge to the world: `fizzosThingAssertions(thing)` projects the composed
  thing as plain `(entity, attribute, value, provenance)` assertions — the thing
  becomes world matter the settlement substrate can hold, join, and contest.

The theoretical warrant for "a model is defined by its behaviors" appears in
the corpus in two registers with different epistemic standing, and the
distinction matters. The settled-objects note (this directory) states it
flatly: *"The Yoneda development: an object is recoverable from nothing but its
bundle of incoming arrows — the arrows are the object."* The glass-sponge note
is more careful: it gives only a *restricted-Yoneda criterion* — "the object is
known by its coherent interactions, not by fiat from its label" (§ around line
545) — and its §26 lists specifying the restricted-Yoneda family as an **open
obligation**, not a completed development. So: the direction is canonical, the
full statement is not yet earned, and this note leans only on the modest half —
a model whose only access is through its behavior set is *operationally*
defined by its behaviors, whatever the eventual theorem says. The
registry-merge operation below is a monotone join, which is exactly the
property (`settling-calm-corollary.md`, Lean-backed) that makes composition
coordination-free.

## Why the TAB half matters specifically for npm

The declarative half is what makes this *publishable*. A model is frozen plain
data: JSON-serializable, canonicalizable, content-addressable, carryable in a
manifest or a module export, queryable through the registry. A behavior is code
at an npm coordinate. The model's `behaviors: [...]` list references behaviors
**by name** — and late-bound, name-keyed dispatch is exactly what lets those
names be resolved to *npm-published modules* at composition time. TAB's
metatable lookup and npm's module resolution are the same shape: a name, a
search path, a late binding. That is the precise sense in which the npm
registry is the coordinate system for the MUD plane: **model declarations are
data in the registry's world; behavior implementations are code at the
registry's coordinates; a registry fragment is what a section exports.**

## The form

Four module kinds and one section rule. Standard carrier everywhere: frozen
plain data in, frozen plain data out; typed judgments for refusal; JSON only at
process boundaries; assertions as the world-facing projection.

### 1. A model module

```js
// src/models/lantern.mjs
export const lantern = Object.freeze({
  id: "vr/lantern",
  base: "vr/object",                    // chain resolved at compose time
  behaviors: ["portable", "ignitable"], // names, late-bound
  additiveAttributes: ["nouns"],
  attributes: Object.freeze({ nouns: ["lantern", "lamp"], lit: false }),
});
```

Nothing here executes. It can be published, hashed, diffed, stored in a
manifest, or sent over a wire without loss.

### 2. A behavior module

```js
// src/behaviors/ignitable.mjs — named pure functions over the carrier
export const ignitable = Object.freeze({
  ignite(thing) {
    if (thing.attributes.lit === true) {
      return Object.freeze({ refused: "already-lit", thing });
    }
    return Object.freeze({
      assertions: [{ e: thing.id, a: "lit", v: true, t: { by: "ignitable" } }],
    });
  },
});
```

A behavior never mutates: it returns proposed assertions (or a typed refusal)
for the world's single admission path — the shape the ECS-world-substrate note
(this directory) specifies as the essential transition, and the shape
racket-mud-5 already had when a thing was `(lambda (event) (event thing))`.

### 3. A quality module

```js
// src/qualities/lightable.mjs — runtime endowment, qtOps-faithful
export const lightable = Object.freeze({
  id: "quality/lightable",
  requires: ["vr/object"],
  provides: ["light-source"],
  behaviors: ["ignitable"],
  attributes: Object.freeze({ lit: false }),
});
```

### 4. A registry-fragment (the composable unit)

Every package that defines models, behaviors, or qualities exports one thing:

```js
// src/registry.mjs
import { lantern } from "./models/lantern.mjs";
import { ignitable } from "./behaviors/ignitable.mjs";
import { lightable } from "./qualities/lightable.mjs";
export const registry = Object.freeze({
  models: Object.freeze({ [lantern.id]: lantern }),
  behaviors: Object.freeze({ ignitable }),
  qualities: Object.freeze({ [lightable.id]: lightable }),
});
```

Registry fragments merge by key-union. Merge is monotone — adding a fragment
never removes an entity or operator — so composition of fragments inherits the
CALM property: it needs no coordination, and two loads in either order yield
the same registry. Key collisions are contested cells, to be *held* and
reported, not last-writer-wins.

### 5. The section rule — the correction this note exists to state

**A section package exports the registry of its section.** The measured census
(2026-08-11, this session; method: a live package counts as a container when it
holds zero `.mjs`/`.mts` source files under `src/`, `lib/`, `scripts/`,
`test/`, or its root) found 437 of 939 live packages are containers with no
source at all. That is not taxonomy; it is the defect list. The section rule:

```jsonc
// <x>-services-section/package.json
{
  "name": "@red-cup-engineering/<x>-services-section",
  "exports": {
    ".": "./src/registry.mjs",          // the section's merged fragment
    "./models": "./src/models.mjs",     // entities this section gives you
    "./behaviors": "./src/behaviors.mjs" // operators this section gives you
  }
}
```

where `src/registry.mjs` imports each child service's fragment and merges.
A section that cannot yet export a registry should export an empty frozen
fragment rather than nothing — an empty section is then *visibly* empty
(`Object.keys(registry.models).length === 0` is a checkable fact) instead of
silently structureless. "This service section gives you these entities and
these operators" becomes a one-import question:

```js
import { registry } from "@red-cup-engineering/http-services-section";
Object.keys(registry.models);     // the entities
Object.keys(registry.behaviors);  // the operators
```

### 6. Instances

An instance is a parameterization of a model over a registry, and composing it
is a settlement:

```js
const composition = composeThing(registry, "vr/lantern", { name: "brass lantern" });
composition.charge;    // FOUR value of the composition itself
composition.admitted;  // did the proof go through
composition.judgments; // why, or why not — typed, never thrown
```

`things.mts` is the reference implementation of `composeThing` (base-chain
resolution, additive merge law, quality application with `provided` tracking,
settlement to charge). It is 305 lines with no dependency beyond the FOUR join
and the assertion type. **Extracting it as a standalone package — the compose
kernel — is the single package this form needs that does not yet exist as a
publishable unit.**

### 7. What stays from the measured hygiene form

The census's dominant discipline (`src/*.mjs` + `test/*.test.mjs`; `check` =
`node --check src/*.mjs`; `test` = `node --test test/*.test.mjs`; `verify` =
check && test, plus `npm pack --dry-run` where releasable; exact-version
dependencies against the Verdaccio registry; source-direct entries, no build
layer) remains the package hygiene baseline. It is one paragraph here because
it is scaffolding, not the service: a package passes `verify` *and* exports a
registry fragment. The first without the second is an empty container with
good posture.

## What this resolves, what it defers, what it needs ruled

**Resolves (recommendation):** the open FARS declaration-pattern decision. The
evidence says hybrid — TAB-faithful declarations because declarations are
publishable data, qtOps-faithful qualities because runtime endowment is how
capability arrives, settlement-charged composition because that is what the
mathematics is *for*. FeltOS's `things.mts` already chose this; this note
proposes ratifying the choice at the package-form level rather than leaving it
implicit inside one archived corpus.

**Defers:** operation contracts richer than typed refusals (the reconstitution
note's Phase-1 contract schema — authority, effects, determinism classes —
composes on top of behaviors, not instead of them); any sheaf-strength claim
about registry fragments (key-union merge is a join-semilattice, and that is
all this note claims); wiring composed things through the full
`utter → settle` pipeline (the theory-practice-bridge note's integration seam,
unchanged).

**Open decisions:**
1. Ratify or amend the hybrid as the declaration pattern (closing the 2026-04-05
   FARS work item).
2. The section rule as an obligation: does every section owe a registry export,
   and is an empty frozen fragment the lawful placeholder?
3. Naming of the registry-fragment export surface (`registry` / `./models` /
   `./behaviors` here; `entities`/`operators` reads equally well and is closer
   to the Leader's own phrasing).
4. Commission the compose-kernel extraction from `things.mts` as a package with
   a real owner section.
