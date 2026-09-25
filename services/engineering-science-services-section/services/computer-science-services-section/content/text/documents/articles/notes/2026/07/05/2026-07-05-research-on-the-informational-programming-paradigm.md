---
title: "Research on the Informational Programming Paradigm"
description: "A first attempt at naming and deriving the programming paradigm forced by obsmetrologia (“infomaterial” at time of writing) mathematics — Mark, CHL, RMN, the witness journal — contrasted term-by-term against object-oriented and functional programming."
date-created: 2026-07-05
keywords:
  - paradigm
  - mark
  - articulating
  - curry-howard-lambek
  - rmn
  - witness-journal
  - has-ty
  - registryless
  - computing
status: design
---


## 0. Status and scope

This note names something that has not been named in this checkout before. A search for
`"informational programming"` and `"programming paradigm"` across the whole tree
(`grep -ril`, both patterns) returns nothing live under either phrase. One namesake exists
in the archived personal quarry — `"Praxonic Programming Paradigm"`
(`lib/emsenn/lib/triage/.../praxonic-programming-paradigm.md`, dated 2026-03-04) — but it
is a different object: a pre-formalization spiritual/metaphorical vocabulary (`praxon`,
`decay`, `resonance`, `field`) with no term grammar, no typing relation, no proof, and no
connection to `Mark`/CHL/RMN/the witness journal, which did not exist as formal structures at
that date. It is not a prior statement of what follows and is not extended here.

So this is a first attempt, not a recovery of settled doctrine, and it is scoped honestly:

- It is a **derivation from structures already read this session**, cited by path, not a
  speculative essay. Every principle below names the Lean theorem or TypeScript module
  that forces it.
- It is **not RULED**. Nothing here has been mechanically checked against the whole
  `src/`/`lib/` tree the way `scripts/check-derived-boundaries.mjs` checks the six-root
  import law. Falsification is invited: if a principle below is contradicted by a live
  module, the principle is wrong, not the module.
- It names a **paradigm the mathematics forces**, not a paradigm this repository
  currently practices. Section 11 states the gap between the two plainly: most of
  `@emsenn/metroplat`'s ~119K lines are ordinary imperative/OOP-flavored TypeScript with
  FP idioms layered on, and the paradigm below currently holds only on specific islands
  (`lib/language`, the CHL evaluators, `lib/persistence`, `src/stores/path-term.mts`).
- **Citation correction (Leader-ruled rewrite, 2026-07-31).** Every citation below rooted at
  `lib/emsenn/src/apps/metroplat/...` (`lib/language`, `src/evaluators`, `lib/persistence`,
  `src/articulation`, `src/stores/path-term.mts`, package `CLAUDE.md`/`AGENTS.md`) could not
  be confirmed at that path anywhere in the current tree. A differently-organized,
  differently-located package (`@red-cup-engineering/metroplat`, formerly `@emsenn/metroplat`,
  a real checkout at
  `.../javascript-engineering-services-section/lib/legacy/metroplat/`) does exist, but its internal layout
  (no `src/evaluators/`, no `lib/persistence/index.mts`; the closest analogue is
  `src/lib/records/persistence.mts`, generic-over-EAVT and explicitly not
  witness-journal-specific) does not match this note's cited structure closely enough to
  safely re-point exact line numbers. Every `lib/emsenn/src/apps/metroplat/...`-prefixed
  citation in this note should therefore be read as **unconfirmed against the current tree**,
  flagged here rather than silently re-pointed or invented. This does not withdraw the note's
  underlying argument — only its exact source citations.

## 1. What is admitted, and what is derived

Infomaterial admits exactly two primitives and derives everything else
(`lib/emsenn/src/lib/infomaterial/AGENTS.md`, "The one inviolable law: no free data";
`Infomaterial/Primitive/Mark.lean`):

- **`Mark`** — an atomic surface string, "built from nothing" — the one admitted datum.
- **`Kind`** — exactly two roles a mark can stand in, `token` (identity-carrying) and
  `claim` (content-carrying), proved exhaustive and distinct
  (`Kind.two_kinds`, `Kind.token_ne_claim`, `Mark.lean:34-44`). These are not two
  primitive *types*; they are the two positions of one relational pairing.
- **`Utterance`** — the pairing of a token-mark with a claim-mark
  (`lib/articulation/index.mts`), which opens the aperiodic articulation category at its
  potential cell (`articulate`). This is the one relational act; everything articulated,
  predicated, posited, or settled downstream is derived from repeated application of it.

Contrast what each of the other two paradigms admits as primitive:

- **OOP** admits *object identity plus mutable state* as ontological givens, one instance
  per class, with no proof obligation that identity or state composes lawfully — the
  runtime's object model is trusted, not derived.
- **FP** admits the *algebraic data types of the host language* (sums, products,
  functions as opaque host closures) as primitive, then builds programs by composing
  host-language functions over them — the function *value* itself is not a term with a
  grammar; you cannot pattern-match its constructor, serialize it, or run `hasTy` against
  it without first reflecting it into some other representation the host doesn't provide.

IPP admits one atom and one relational act, and requires every further shape (a type, a
term, a reduction, a witness row, a path) to be *derived and proved*, not declared. This
is the same discipline `lib/emsenn/src/lib/infomaterial/CLAUDE.md` states for the Lean
side ("no new primitives... every other module derives its content") — the claim here is
that it is not a Lean-only discipline; it is what a programming paradigm looks like when
that discipline is carried into the term language and the runtime that executes it.

## 2. The unit of behavior is a term, not a method or a closure

RMN's `Tm` is a closed, frozen-array JSON grammar
(`lib/emsenn/src/apps/metroplat/lib/language/index.mts:41-62`): `var`, `lam`, `app`,
`pair`, `fst`, `snd`, `star`, plus the domain extensions (`mark`, `charge`, `bool`,
`generator`, the bilattice ops, `settle`, `field`, `append`, `coincide`, `cond`, `fold`).
A term is data — admissible from JSON via `TmSchema`, portable across a wire, addressable
by content, and checkable against a type before it runs. This is stated as a design rule,
not a stylistic preference: "Behavior belongs in terms; a JS closure is lawful only at a
named host protocol boundary (fs, git, HTTP, process, clock)"
(`lib/emsenn/AGENTS.md`, RMN description).

The Curry–Howard–Lambek correspondence
(`Infomaterial/Language/Predicating/CurryHowardLambek.lean`) is what licenses treating a
term as behavior in the first place: `curry_howard_lambek` proves
**types ↔ propositions ↔ objects; terms ↔ proofs ↔ morphisms; β-reduction ↔
normalization ↔ morphism-equality**, for the minimal STLC-with-products-and-unit that RMN
realizes. A well-typed `Tm` is not a description of a computation that some separate
interpreter then performs on faith — the term *is* the proof that its type is inhabited,
and running it (`dev`/`evaluate` in
`lib/emsenn/src/apps/metroplat/src/evaluators/index.mts:323-331`) is normalizing that
proof.

Contrast: an OOP method is behavior bound to an object's identity, invisible to any
typechecker as a piece of data with a grammar — you cannot ask "what type does this
method inhabit as a term" because it was never a term. A mainstream FP closure is
better-behaved (referentially transparent, composable) but is still an opaque host value;
Haskell's `Expr` GADTs and similar approaches exist precisely because ordinary functions
resist being inspected, addressed, or shipped across a wire without hand-built
reification. IPP does not need a reification step, because the term grammar is the only
place behavior is allowed to live short of a named boundary.

## 3. Recognition is a derivation against the term's own shape, never a registry

`HasTy Γ t A` (`CurryHowardLambek.lean:173-195`) is not a lookup table of which terms have
which types. It is one Lean inductive constructor per term-former (`zero`/`succ` for
`var`, `lam`, `app`, `pair`, `fst`, `snd`, `star`), each rule reading the term's own head
constructor and recursing into its immediate parts. The live TypeScript floor —
`inferTy`/`checkTy`/`hasTy`
(`lib/emsenn/src/apps/metroplat/src/evaluators/index.mts:349-397`) — is the same
`switch (term[0])` shape: one case per constructor, recursing structurally, never
consulting a side list of predicates.

`lib/emsenn/src/apps/metroplat/CLAUDE.md`'s "Registryless Design" section states the
general form of this and names the anti-pattern precisely: an array of
`{name, matches(x), …}` objects, grown one entry at a time, dispatched by `.find()`,
where each predicate is authored independently of the object's own structure. That is a
registry regardless of what its fields are named (`services/holography/index.mts`'s
`CutDeriver`, `src/running/catalog.mts`'s `projectorCatalog` are both named as this
already, in that file). IPP's answer to "what is this and what may be done with it" is:
attempt to build the `HasTy`/`checkTy` derivation from the thing's own term structure. A
new *kind of term* costs one new constructor and one new typing rule
(`chl_quartet_is_nuclear` proves the four formers close over the recurring FOUR corners,
so the rule set is not open-ended); a new instance of an *existing* kind costs nothing —
the derivation already covers it.

Contrast: OOP dispatch is a vtable — a hidden per-class registry maintained by the
runtime, invisible as mathematics, requiring one new vtable slot per new class. FP
typeclass dispatch (Haskell instances, Rust traits) is an *explicit* registry: one
instance declaration per (type, class) pair, independently authored, which is exactly why
the expression problem is a named open problem in FP — adding a new type OR a new
operation is free, but adding both crosswise requires touching every existing instance or
every existing type. IPP does not solve the expression problem by cleverness; it
dissolves it, because there is only one axis (term-former) that recognition can extend
along, and the term/type grammar is closed and derived, not an open matrix of
independently-declared cells.

## 4. Reduction is confluent, so a term's meaning does not depend on evaluation order

`step` is one-step β/projection reduction, congruent in every subterm
(`CurryHowardLambek.lean:199-222`); `Red` is its closure. **Church–Rosser confluence**
(`church_rosser`, `CurryHowardLambek.lean:707-713`) is proved via the Tait–Martin-Löf/
Takahashi method — parallel reduction `Par`, the complete-development function `dev`, and
the cofinality triangle `par_triangle` showing every parallel reduct of a term
parallel-reduces to the single term `dev t` (`:564-641`). The practical content: if a
term reduces two different ways, both paths reach a common term. "What this term
evaluates to" has one answer regardless of which redex a caller happens to reduce first.

This is a proved property of the term language, not an operational habit a runtime is
expected to preserve by discipline. Mainstream FP gets a version of this for free *only*
under strict purity and only informally — there is no proof shipped with, say, a Haskell
program that its evaluator is confluent, because GHC's operational semantics is not the
subject of a machine-checked theorem the program carries with it. OOP has no analogous
claim available at all: method bodies mutate shared state, so evaluation order is
observable by construction, and "does it matter which order these run in" is answered by
reading the code, never by a proof. IPP's claim is narrower and stronger: confluence is a
theorem about the grammar every term is drawn from, so it transfers to every program
written in it without being separately re-established per program.

## 5. Identity is a typed term, addresses are proofs, not pointers or opaque strings

`src/stores/path-term.mts` re-earns "paths are proof terms" as a live typed structure. A witness
address (`data/<tier>/YYYY/MM/DD/<date>-<act>-<token>`) is projected to
`pathTerm(parts) = pair(mark(tier), pair(mark(date), pair(mark(act), mark(token))))`,
typed against `PATH_TY = base × (base × (base × base))`
(`path-term.mts:18-58`). Whether an address is well-formed is
`checkTy([], term, PATH_TY)` — a decidable typing derivation — not
`parseArtifactStem`'s regex reaching a true/false. The regex still exists, at the
boundary, exactly where the placement law's Rule 17/21 says free-data parsing belongs
("boundary text is not string ontology"); the term is the coordinate the mathematics
addresses by.

Contrast: an OOP reference is a pointer into mutable heap state — identity is whatever
the runtime's object model says it is, unprovable and unaddressable as data. FP typically
erases identity in favor of structural/referential equality on immutable values, which is
real progress over OOP but stops short of a further claim IPP makes: that the *address
itself* — not just the value — is a term whose well-formedness is a proof. Nothing in
mainstream FP treats "is this a legal path into storage" as a typing judgment.

This is also the stated open edge of the campaign (`lib/emsenn/CLAUDE.md`, "The gap this
names, concretely"): `token` in `path-term.mts` is still one opaque `mark`, undecomposed —
which is exactly why registry-style string matchers (`token === "x"`,
`token.startsWith("y-")`) keep getting reached for downstream. The registryless/IPP
fix named there is to extend the token leg of `PATH_TY` into a properly-typed
sum/product per named family, decomposed by `fst`/`snd` the way `inferTy` already
decomposes any other product — not a new capability, the same one applied one level
deeper.

## 6. State is a witnessed derivation over an append-only source, never a stored fact

`lib/emsenn/src/apps/metroplat/lib/persistence/index.mts` is cited by this note as stating
the pure row shape of witness time: a `WitnessRow` is `{e, a, v, t}` (entity, action, value,
time), and the four witness-journal tiers — `log` (rank 3, role `source`), `state` (rank 2,
`sufficient-statistic`), `record` (rank 1, `rate-distortion-code`), `content` (rank 0,
`lossy-cut`) — are described as forming an information chain (cited as `RwilInformationChain`/
`rwilInformationChain`, `:150-170`) whose projections are checked to be non-information-
increasing, a violation recorded rather than silently allowed. **Citation correction:** this
rewrite could not confirm `RwilInformationChain`/`rwilInformationChain` or the path
`persistence/index.mts:150-170` anywhere in the current tree (see the §0 correction). The
2026-06-25 witness-journal note grounds why the underlying shape should hold regardless: the
bilattice knowledge order `≤k` **is** an information order (Belnap's FOUR was introduced as a
theory of information from sources), so `log → state → record → content` is a Markov chain and
the data-processing inequality governs it — information is monotone non-increasing along the
fold, a theorem, not a policy. The corollary this note draws — a duplicate witness costs zero
surprisal, so appending it must be free — is corroborated by the witness-journal glossary
term's confirmed, real dedup law (`eavtId`, a hash of the canonical row, gives idempotent
append; `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/emsenn-services-section/content/text/glossary/terms/witness-journal.md`), though the
specific cited identifier `witnessLogInformation` and path `persistence/index.mts:259-271`
remain unconfirmed.

So "the current value of this field" is never itself a primitive fact to mutate in place;
it is `state`, a *derived, lossy statistic* of an immutable append-only log, computed by a
deterministic projection whose information loss is bounded by a proved chain. Contrast:
OOP's encapsulation *is* information destruction by design — a mutated field has no
retained history unless a caller builds one by hand, and there is no proof anywhere that
what a getter returns is a lawful summary of anything. FP's typical answer (immutable
snapshots, an explicit `State` monad thread) is real progress — no hidden mutation — but
still carries no intrinsic law that a derived read has *not* lost more than a stated
tier's query class permits; that guarantee has to be built per-program if wanted at all.
IPP makes retention/forgetting itself a proved property of the tier, per `preserves`/
`mayForget` fields on what this note calls the witness-journal tier type (cited as
`RwilTier`, `persistence/index.mts:39-48`) checked by a projection-step function (cited as
`rwilProjectionStep`, `:135-148`) — both citations unconfirmed against the current tree per
the §0 correction.

## 7. Outcomes are FOUR charges, not booleans or exceptions

`feedEntropyCharge` (`persistence/index.mts:286-289`) is a small, concrete instance of the
pattern: a feed's bytes-per-entropy-unit ratio is charged through
`chargeValueOfSides`/`chargeValueName` rather than returned as a boolean pass/fail, with
the zero-entropy edge case (no ratio to obstruct) handled as its own reading rather than a
divide-by-zero guard bolted on. `RMN`'s `Tm` grammar carries the charge type as a term
constructor directly (`charge: ["charge", ChargeValueName]`,
`lib/language/index.mts:50,91`) with exactly the four values `absurd`/`potential`/
`active`/`stable` — the same four corners CHL's `TypeFormer` bijects with
(`chl_quartet_is_nuclear`, `CurryHowardLambek.lean:854-928`).

Contrast: OOP exceptions are an out-of-band control channel orthogonal to the type
system — a caller cannot see from a method's declared type whether it may throw, what it
may throw, or what "partial success with conflicting evidence" would even mean. FP's
`Either`/`Result`/`Maybe` are real improvement (failure is in the type) but are still a
two-valued lattice, collapsing "told nothing" and "told both, in conflict" into the same
undifferentiated "no" — there is no FP-mainstream idiom that keeps a contradiction as the
*most* informative outcome rather than an error to be resolved away. IPP's outcome
algebra is the bilattice FOUR precisely because the underlying claim is about information
received, not truth asserted, and `⊤` (conflict held) is the maximally informative
corner, not a failure mode.

## 8. One recursion, not a library of combinators

RMN's structural operations — `rename`, `subst`, `inst`
(`lib/language/index.mts:156-222`) — are each a single structural recursion over `Tm`'s
constructors, mirroring `Articulating`'s own recursive descent. `fold`'s own comment
states this explicitly: "the one structural recursion (over `Articulating`)"
(`lib/language/index.mts:150`); `map`/`filter`-shaped operations are not separate
combinators the grammar has to carry — they are expressible via `cond`+`fold` over that
one recursion, the way `dev`'s `fold` case (`evaluators/index.mts:311-319`) walks an
array-encoded list one head/tail decomposition at a time via `arrayHeadTail`
(`evaluators/projecting/index.mts:94-102`).

Contrast: OOP composes structure through inheritance hierarchies plus a menagerie of
special-purpose control constructs (loops, iterator protocols, the visitor pattern
standing in for the dispatch a closed sum type would give for free). FP typically ships
one *general* recursion scheme (structural recursion / catamorphisms) but then grows a
large standing library of specific combinators per container shape (`map`, `filter`,
`fold`, `traverse`, `zipWith`, …) independently implemented per type. IPP's claim is
narrower: because the term grammar itself is the one thing being recursed over
(`Articulating`'s descent), every derived combinator is *defined from*, not
independently implemented alongside, that one recursion.

## 9. The cone: one apex, many legs, recognition happens once

`lib/emsenn/CLAUDE.md`'s "Registryless Design" section names this directly: every
representation the system speaks — JSON, SHP, EAVT rows, English prose, Lean —
is a leg of a cone whose apex is the CHL/RMN term language.
`jsonToTerm`/`termToJson`
(`lib/emsenn/src/apps/metroplat/src/evaluators/projecting/index.mts:128-165`) admit a
JSON value into the term layer and project a normal-form term back out, deterministically
(object keys sorted, so the same JSON value always yields the same term). Recognizing
what a piece of data *is* happens once, at the apex, via `hasTy`; adding a new
representation means adding one cone leg (a translation to/from terms), never a new
per-representation recognizer.

Contrast: OOP's polymorphism scatters "what is this" across every subclass's own
override — recognition is distributed across the class hierarchy, not centralized.
FP's typeclasses scatter the same question across every instance declaration for every
(type × class) pair — the expression problem again, from a different angle. IPP puts
recognition in exactly one place (the apex typing judgment) and pushes every
representation concern to the boundary, which is also why RMN needs no growing
`CutDeriver`-shaped array to add a new wire format: it needs one new `jsonToTerm`-style
leg.

## 10. Summary table

| Axis | OOP | FP (mainstream) | Informational Programming (IPP) |
| --- | --- | --- | --- |
| Admitted primitive | object identity + mutable state | host ADTs + opaque closures | one `Mark` + one relational pairing (`Utterance`) |
| Unit of behavior | method bound to identity | host-language function value | a `Tm` — data, addressable, typed, reducible |
| Recognition/dispatch | vtable (hidden per-class registry) | typeclass/trait instances (explicit registry) | `hasTy`/`checkTy` — structural derivation over the term's own shape |
| Extensibility axis | new class → new vtable slot | new type or new op free, both crosswise costly (expression problem) | new term-former → one typing rule; new instance of existing former → free |
| Evaluation order | observable (shared mutable state) | confluent in practice, rarely proved | confluent by theorem (`church_rosser`, Takahashi diamond) |
| Identity / address | pointer into mutable heap | structural/referential equality on values | address is itself a typed term; well-formedness is `checkTy` |
| State model | mutation, history discarded by design | immutable snapshots / explicit threading | append-only witnessed source; every read is a proved-lossy derived statistic |
| Failure/outcome | out-of-band exceptions | two-valued `Either`/`Maybe` | FOUR-valued bilattice charge; conflict held as maximal information |
| Structural recursion | ad hoc per construct (loops, visitor) | one scheme, many independently-built combinators | one recursion (`Articulating`'s descent); combinators derived from it |
| Cross-representation recognition | scattered per subclass override | scattered per instance declaration | centralized at one apex (`hasTy`); representations are cone legs |

## 11. The gap: forced, not practiced

Every principle above is cited to a theorem or module that exists and, where checked, passes
(`lean_verify`-clean theorems in `CurryHowardLambek.lean`; `evaluators/index.mts` and
`persistence/index.mts` live and imported). But `lib/emsenn/AGENTS.md` states the package
is ~119K lines and ~8,700 functions, and the same file that states the registryless
principle also names two live counter-examples in the current tree:
`services/holography/index.mts`'s `CutDeriver` array and `src/running/catalog.mts`'s
`projectorCatalog`/`classifyAt` — both hand-grown arrays of independently authored
predicates, the exact shape Section 3 above says IPP forbids. These are not hidden or
denied; `CLAUDE.md` names them as the correction in progress, not as settled violations
someone forgot to fix.

So the honest claim is: IPP is what the admitted mathematics (Mark, CHL, RMN, the witness
journal) *forces*, checkable proof by proof, module by module — and the bulk of the code that
calls itself part of this system does not yet conform to it. That gap is the actual
research frontier this note opens, not a defect in the note. Closing it — replacing
registries with derivations, closures with terms, mutation with witnessed projection,
booleans with charges, wherever a module's own domain math already supports the swap — is
future work, not claimed here as done.

## Provenance

Read in full or in the cited section this session (2026-07-05): `Infomaterial/Primitive/Mark.lean`;
`Infomaterial/Language/Predicating/CurryHowardLambek.lean`;
`lib/emsenn/src/lib/infomaterial/AGENTS.md` and `CLAUDE.md`;
`lib/emsenn/src/apps/metroplat/lib/language/index.mts`;
`lib/emsenn/src/apps/metroplat/lib/persistence/index.mts`;
`lib/emsenn/src/apps/metroplat/lib/articulation/index.mts`;
`lib/emsenn/src/apps/metroplat/src/evaluators/index.mts` (lines 300–420);
`lib/emsenn/src/apps/metroplat/src/evaluators/projecting/index.mts`;
`lib/emsenn/src/apps/metroplat/src/stores/path-term.mts`;
`lib/emsenn/src/apps/metroplat/dev/content/notes/2026/06/25/2026-06-25-research-on-witness-journal-the-relation-witness-information-log.md`;
`lib/emsenn/src/apps/metroplat/dev/content/notes/2026/07/04/2026-07-04-research-on-the-categorical-node-packaging-placement-law.md`;
the archived `praxonic programming paradigm.md` (read to confirm it is a different,
unconnected object, not a prior statement of this note).

No claim above rests on a source that was not itself opened and read this session.

**Provenance correction (Leader-ruled rewrite, 2026-07-31):** every `lib/emsenn/src/apps/metroplat/...`-rooted
path listed above could not be confirmed anywhere in the current tree by this rewrite (see §0).
This flags the citations as unconfirmed against the current checkout; it does not assert the
2026-07-05 session's own read was fabricated.
