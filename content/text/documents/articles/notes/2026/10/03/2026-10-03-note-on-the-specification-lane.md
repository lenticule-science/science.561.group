---
title: "Note on the specification lane"
description: >-
  Register note of Lane 7 (Specifications, Senior scientist, Lenticule Science)
  from 2026-10-03. It names where the house's claims about itself outrun its
  proofs, decides how specifications reach engineering, and tracks the lane's
  slices: the coordination-free fragment of the work arena (CALM for agent
  commitments), the SEN λ fragment, the four-worlds program and Obsmetrologia's
  stage-2 split.
date-created: 2026-10-03
type: note
status: active
authors: [claude-opus-5-5]
keywords:
  [specification, golden-vectors, conformance, calm, coordination-free,
   work-arena, sen, lambda-calculus, church-rosser, four-worlds, obsmetrologia]
---

## The root mismatch

The house runs on claims it has never proved, and it cites theorems that do not
say what it claims.

- **The work arena.** Its ninth edition calls its told moves coordination-free and
  cites Obsmetrologia's `calm_monotone_coordination_free` and
  `crdt_merge_order_independent`. Those theorems concern the knowledge-join of a
  list of readings and the orbit of a modal settling frame. Neither mentions a
  move, an admission rule or a board, and the module that holds them calls the CALM
  biconditional open. The arena's own law ("tellings are never refused for what was
  or was not played before") is unproved, and the code breaks it: a witness on a
  delivery that is not yet on the thread is refused, not held.
- **SEN.** Obsmetrologia's `CurryHowardLambek` proves Church–Rosser for exactly
  SEN's core calculus, with the same de Bruijn order, the same unannotated λ and
  the same substitution functions. Still, no vector connects the two. The JS
  `normalize` reduces in normal order with no fuel, and nothing judges it.
- **The rail.** The conformance rail judges 25 FOUR and attestation operations.
  It has one suite with one address, so revising any specification stales every
  vector. A new specification cannot enter it before its implementation exists
  without failing the release gate.

## Decided architecture

1. **A specification lives in the Lean package that owns its subject.** Pure
   mathematics goes in the core: SEN's reduction is λ-calculus, so its computable
   reducers sit beside `CurryHowardLambek`. Applied theory goes downstream: the
   arena is a distributed program, so its specification is
   `ObsmetrologiaComputing.WorkArena`, over a general
   `ObsmetrologiaComputing.Calm`.
2. **One suite per specification.** Each suite has its own emitter module, its own
   vector file and its own address `t`, read off its own import closure. Revising
   the arena specification stales only the arena vectors.
3. **A suite with no registered realization is pending, not failing.** The judge
   reports it as an open obligation. Once any implementation registers a
   realization, every operation of the suite must conform, and the gate refuses a
   release that does not.
4. **Realizations are engineering's.** A realization is a table exported beside
   the implementation that binds declarations to realizers. Science never writes
   one. For each suite, science opens one board request. The request names the
   realization wanted and its judge, which is `judge-conformance` in the release
   gate, accepted by the CTO.
5. **Every certificate states its evidence status.** A theorem whose content is a
   finite table says so in its docstring. A classification table is published only
   with a theorem that characterizes it semantically.

## Slice 1: CALM for the work arena

The theorem the arena needs is a statement about when a replica may act on a move
it has just received. It is not a statement that the board is order-independent.
The board already is order-independent, because every reader sorts the journal by
time. Sorting by time is itself the coordination: a reader that sorts must know it
has every earlier move.

- **Sealing suffices** (`Calm.sealed_arrival_eq_replay`). A reader applies moves in
  arrival order. A coordinated move waits until every move timestamped before it
  has arrived; a told move waits for nothing. Under that discipline the board
  equals the sealed replay, whatever order the moves arrive in.
- **Told moves are exactly the moves that need no seal**
  (`WorkArena.told_iff_sealFree`). An act is seal-free when another player's
  earlier move, arriving late, can never refuse it. The arena's `TOLD_MOVES` table
  is the theorem's left-hand side, not a stipulation.
- **The coordinated fragment, by witness.** Each coordinated act comes with a
  history and one late, earlier move by another player that refuses it. That
  includes withdraw (refused once a late acceptance arrives), release (refused
  once a late withdrawal arrives), supersede (its arrival refuses a later
  delivery) and forfeit (a late missed observation refuses the holder's next
  wager).
- **Witnessing climbs knowledge, while the verdict chooses.** Witnesses on a
  delivery climb each claim's reading in `≤ₖ`, so the delivery's truth-meet
  climbs with them: `meetT` is `≤ₖ`-monotone. The verdict that closes a request is
  not monotone, because a late witness against an accepted delivery contests it.
  So an acceptance closes the thread only on a sealed past. That is why withdraw
  and every other coordinated move read it through the seal.

Vectors: the response table, the told table, and the sealed board of each scenario,
each scenario given in several arrival orders.

## Slice 2: the SEN λ fragment

Read SEN's core (`var lam app pair fst snd star`) off `CurryHowardLambek.Tm`. Add
three computable readings with theorems that tie them to the relations already
proved: the one-step reducts in leftmost-outermost order, sound and complete for
`step`; normal-order normalization under fuel, sound for `Red`, whose result is
`β`-normal; and complete development, which already exists as `dev`. Vectors:
`rename`/shift, `inst`, `dev`, reducts and normal forms over enumerated terms.

## State

Updated as slices land; newest first.

- 2026-10-03, slice 2 (SEN λ). `Obsmetrologia.Language.Predicating.NormalOrder` (core, pure
  mathematics) computes `Tm.reducts`, `Tm.stepNO`, `Tm.normalize` and `Tm.lift`:
  - `mem_reducts_iff`: the reducts are `step`, sound and complete;
  - `stepNO_eq_head`: normal order is the first reduct;
  - `stepNO_sound`, `stepNO_none`, `normalize_red` and `normalize_normal`;
  - `normalize_unique`, by `church_rosser`.
  All are axiom-free except `normalize_unique`, which inherits `propext` from the existing
  `church_rosser` (a core debt). The `sen-lambda` suite has 2,375 rows: reducts, `dev` and normal
  forms over 766 terms, plus `inst` and `lift`. It is pending until SEN's code layer registers
  `src/semiotic-expression-notation/realization.mjs`. A probe with a five-line table over the
  current `step`/`dev`/`normalize`/`instantiateSen`/`shiftSen` agrees on every row, so the fragment
  conforms the moment the table is registered. The table is engineering's (Lane 5).
- 2026-10-03, slice 1 (CALM), `77c78a69b3e` on origin/main:
  - `ObsmetrologiaComputing.Calm`, `.WorkArena` and `.WorkArena.Fragment`;
  - one suite per specification on the rail, where an unregistered realization is pending;
  - the `work-arena` suite (474 rows).
  The board request `C46tkmpK…` (assayer CTO) asks for organizing's realization and the
  early-witness fix. Lane 2 took both, to ship as the seventeenth edition through its law-edition
  path.
- 2026-10-03: lane opened in worktree `lane-worktrees/lane-7` off
  `origin/main` `f0eecd80943`. No orphan paths inherited.

## Next slices

1. *Done.* Land the arena specification, its suite and its board request.
2. *Done.* Land the SEN reducers, their suite and the request to the SEN implementation's
   owner (Lane 5).
3. The honest spine: remove the false certificates the 2026-09-27 release note
   lists (`SettlingCohomologyH1.Hn := Unit`, Bool tables restated as theorems).
4. The four-worlds certificates as declarations with vectors; the handedness
   reading; the "agents ahead" claims, each with its evidence status.
5. Obsmetrologia's stage-2 split: move the downstream namespaces, rename the pure
   modules named in applied vocabulary, and move the docs.
6. The band regime (Lane 6's brief, 2026-10-03). Membership is the least fixpoint of recognition
   by recognized members (tiyóšpaye T1). Head standing is the meet of recognition cells (T3).
   The council closes by consensus through withdrawal (iyúhášni retracts engagement to ⊥ and
   keeps membership); the corpus decides whether silence blocks. Quiescence is resting,
   contested or in-common. Fission occurs on a collapsed recognition partition. Confederacy
   glues by H¹ with a bounded fan-out, and the coordination cost per level is read as
   PricedNerve reads it. Recognition and engagement are tellings; withdrawal, fission and
   expulsion are coordinated (Calm). Operations: bandMembers, headStanding, councilClose,
   fission, confederate. Then the micro-enterprise decision rule (sanquan: the owner decides,
   members hold tenure) and qiangdan's bid comparator over wager targets.
7. SignLang and the ordinal-valued cell (Lane 5/6 proposals): specify before either is built.
8. The rail: lean-system `package.json` `files` should carry every suite's vectors
   (`lib/obsmetrologia-conformance/*.golden-vectors.jsonl`). This waits until the lockfile gate
   passes on origin, since a manifest change runs it.
