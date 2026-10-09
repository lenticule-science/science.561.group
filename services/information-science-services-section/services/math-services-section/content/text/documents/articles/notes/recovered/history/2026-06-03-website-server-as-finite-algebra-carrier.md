# website-server as a finite-algebra carrier

Date: 2026-06-03

## Question

How do you serve news when the substrate is not articles but contested claims, and the site can
only serve the finite shadow of an ever-climbing trace of evidence?

## The reading that grounds it

Stated by the user, in the repository's voidmath vocabulary, and treated as the package's premise:

> the jsonl logs are the scott-continuous trace of what the website can serve only as a finite
> algebra.

That is the `posit → settle` crossing, the same chain `typed-resource-catalog/README.md:35-44`
names: `attribute/presheaf/posit` (scott-continuous) → `file/sheaf/settle` (finite). So:

- The durable substrate is **claims** — predication cells `(subject, predicate, object)` carrying
  a four-valued bilattice charge whose **witnesses are the citations**. Nobody stores "articles."
- The **JSONL logs are the scott-continuous trace**: append-only, monotone positings of claims.
- The website serves **only the finite algebra**: `settle(fold(trace))`, the sheaf, the
  knowledge-least fixed point. *Serving is the settle morphism.* No Hugo build — the build was
  always `settle`, done live.
- **Prose is downstream**: a generating agent reads the finite algebra's semantic reading; this
  slice renders the algebra faithfully (affirmed / denied / contradicted + citations).

## Decisions

### 1. Build on typed-term-memory-system + typed-filepath-addressing-system + predicate-algebra-parser; no direct kernel, no SWARM

- `trace` writes/reads through `typed-term-memory-system` (`/writing`, `/reading`) and addresses
  through `typed-filepath-addressing-system` (`/addressing`, pinned to the `jsonl`/EAVT type).
- `finite` projects belief through `predicate-algebra-parser` (`/recalling`).
- No direct dependency on `voidmath-kernel` (it arrives transitively; keeping it out preserves the
  regime boundary). No dependency on `swarm` (orchestration is a separate, deferred concern).

### 2. The citation is the transaction `t` (verified compatible)

`typed-term-memory-system`'s `read` (via `voidmath-posix-holography`) and
`predicate-algebra-parser`'s `recall`/`believe` both bottom out at the **same**
`@561/development.active.voidmath-kernel` charge morphisms. The witness mark is `{ const: t }` and
lives at `charge[0][0]` in both. Confirmed by a round-trip: writing
`{location:"valley"}` with `t:"…/a"` reads back as
`charge = [[{const:"…/a"}],[]]`, and `recall` classifies affirmed/denied/contradicted with no
adapter. **So `affirm` puts the citation in `t`**, and the finite layer recovers it at
`charge[0][0].const`. A test (`proof-trace-settle-serve.test.mjs`) pins this charge shape so a
future kernel change to the witness representation fails loudly.

### 3. Recover witnesses by walking the settled assignments, not from `believe`'s maps

`believe` collapses cells to `affirmed[predicate] = object`, dropping the witnesses and any
multi-object cells. `settle` therefore *also* walks `memory.assignments` directly to build a
`(predicate, object) → citation` index, and re-attaches citations to each belief entry. A
contradicted (`⊤`) claim carries **both** its affirming and denying witness — the contested
proposition is shown, not hidden.

### 4. Functional-predicate knowledge is itself memory

`recall` reads which predicates are functional from `(p, is, functional)` cells. Because
`typed-term-memory-system`'s `write` uses the doc *key* as the predicate, a declaration is stored as
`write(root, "predicate-knowledge/<p>", { is: "functional" })` — so the predicate name is the
*subject* and `is` the predicate, matching `recall.functionalPredicates`. `predicateKnowledgeOf`
folds all such logs into one memory; `declareFunctional` writes one.

### 5. Effects isolated to the carrier

`render` is pure string work (swappable by a prose agent). `serve` is the only module touching the
network; `trace`/`finite` touch only the filesystem (the substrate). An unknown subject settles to
an empty algebra and returns 200, not an error.

## Status

Vertical slice complete and green: `trace → finite → serve`, 12 tests
(`proof-trace-settle-serve`, `render`, `proof-serve-smoke`), plus a manual run of
`bin/website-server.mjs` rendering affirmed/denied/contradicted claims with their citations.

## Deferred

Prose generation by downstream agents; SWARM coupling; the materialized serve-from-disk mode
(`materialize`/`loadFinite` exist but the slice settles live).
