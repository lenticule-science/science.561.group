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

- 2026-10-03, slice 4b (honest spine, second pass). Five census targets read and graded:
  - `CurvatureRegime`: by definition. `IsFlat`/`IsCurved`/`curvatureRank` become
    `DeclaredFlat`/`DeclaredCurved`/`declaredCurvatureRank`, `curvature_regime_correspondence`
    becomes `curvature_regime_table`; the curvature identification and `rank H¹ = |L_ns|` are
    `-- OPEN:`.
  - `NSCFiring`: mixed. Proved: `IsNSC`, `scott_continuous_iff_no_nsc_firing`,
    `no_nsc_firing_of_closure`, `forallAnteOp_isNSC`. By definition: the regime half
    (`nscRegimeData` is hand-set; `nsc_cohomology_nonvanishing` becomes
    `nscRegimeData_profile_nonvanishing_table`; `nsc_firing_source_of_aperiodic` loses its table
    conjunct and becomes `no_closure_nsc_firing_and_forallAnte_witness`).
  - `history_separation_aperiodicity`: by definition (three unlinked facts), renamed
    `varying_family_beside_aperiodic_witness`; the forcing is the `Prop`
    `HistorySeparationForcesAperiodicity`, stated without proof.
  - `trichotomy`: by definition (a case split of a two-Boolean classifier), renamed
    `regimeOf_nontrivial_cases`; the aperiodic bigraded trichotomy is `-- OPEN:`.
  - `k4_is_PT`: by definition (restates the sign tables), renamed `signs_table`; the action,
    faithfulness and multiplicativity are `act_centered`, `act_space`, `signs_injective`,
    `timeSign_mul`, `spaceSign_mul`, which stay.
  Built with `LEAN_NUM_THREADS=1`, per module, in Obsmetrologia and ObsmetrologiaPhysicalScience.
  Candidate `lane-7/honest-spine-2`.

- 2026-10-03, slice 4 (honest spine, first pass; P3; evidence ledger).
  - `SettlingCohomologyH1.Hn := Unit` and `hn_vanishes_above_one` are removed. So are their
    conjuncts in seven bundles, the derived `Hmn`, and the prose, blueprint and Verso
    citations. Each bundle now says no complex above degree 1 is constructed.
  - The regime tables are restated as the declared profile: `cohomologyVanishes` and its
    `_iff`, `spine_is_strict`, `spine_settles_in_settling_regime`, and RegimeGate's
    `gate_eq_cohomologyVanishes`, whose docstring had claimed a derivation it does not contain.
    The keystone defs (`quartet_recurrence`, `twistoring_eq_commutating`) and the Fregean
    correspondence are demoted in their docstrings, the root docstring and the blueprint
    (theorem → definition/proposition). The blueprint's keystone is now the orbital theorem.
  - P3 is settled: `Worlds.kinetic_reconstruction` proves `KineticReconstruction n` for every
    `n` (integer joints, the content argument with a list Bézout, `KineticTheory.Gas.Reconstruction`).
    Two-particle structure is visible to pairwise data.
  - Science note 2026-10-03, on the evidence status of agents ahead: every four-worlds and
    potential claim graded as proved, proved on a carrier, finite, declared, reading or open.
  - Core `Record.leK`/`Record.leT` are axiom-free Bool orders. The `obsmetrologia` suite gains
    rows for `Reading.impK` and `FiberAlgebra.Reading.impT`, which four.mjs binds since
    `0cd87db602e` (644 rows; conforms). The `Record.leK`/`leT` rows wait until four.mjs binds its
    `recordLeqK`/`recordLeqT` under those names, since an unbound operation in a registered suite
    reads absurd.

- 2026-10-03, slice 3 (band regime, for Lane 6). `ObsmetrologiaComputing.Band`. Every theorem
  rests on `Quot.sound` at most:
  - membership as the least fixpoint of recognition: `IsMember`, computed with `members_iff`
    by a pigeonhole stabilization;
  - `recognition_monotone` and `withdrawal_retracts`;
  - head standing as the knowledge-meet of recognition cells, with `head_collapses`;
  - the council close as the knowledge-join of the engaged: `silence_never_blocks`,
    `council_order_free`, `posits_climb`, `consensus_by_withdrawal`;
  - `fission_keeps_everyone` and `fission_disjoint`, with kinship kept as camps-with;
  - `confederate_glued_iff`, which glues or names the obstruction;
  - `council_cost_bounded` (k(k−1)/2 per council) and `council_tree_reaches`.

  Silence does not block. The corpus's merge is the knowledge-join, and ⊥ is its identity, so
  organizing's current silence-blocks rule contradicts the theory it cites. The `band` suite
  has 380 rows and is pending until organizing registers `src/agency/band-realization.mjs`.
  The Lakota sources are cited as the theory basis; the module states only the organizational
  mathematics, in general vocabulary.
- 2026-10-03, honest-spine census (read-only). The widest false certificate is
  `Closure.Regime.cohomologyVanishes`/`cohomologyVanishes_iff`, a table presented as "H¹ = 0 iff
  strict/Scott" with no H¹ in it, at about 97 references across 37 files. Its family is
  RegimeGate's flag tables and their `rfl` "derivations", `CurvatureRegime`, `NSCFiring`, and
  copies in physical science. Also:
  - `Hn := Unit` (9 users);
  - `classify` and `four_regime_dichotomy` (no ordinal);
  - `spine_is_strict` (a hand-set flag);
  - the Fregean keystone and `quartet_recurrence`/`twistoring_eq_commutating` (defs presented
    as keystones);
  - `BigradedCohomology.trichotomy`;
  - RegimeCycle's and Worlds' world↔regime facts.
  Substantive and kept: `residue_dichotomy`, `dervish`, `omega_ahead`, `residue_germ_ahead`,
  `iterSeq_residueBump`, `quantum_ahead_of_classical`, `kinetic_forced_by_residue` (with
  `thermalResidue` defined as balanced), the orbital theorem, `measure_cons_le`, the Record
  collapse, `kz_iff_strict`, and the root identification.

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
3. The honest spine, from the census above. A regime label is a definition, the declared
   profile of a closure, and never a theorem about cohomology. Restate each table as a
   definition and drop the claims it cannot carry. Then derive regimes from closure ordinals
   where a carrier allows it. Remove `Hn := Unit` and its users. Demote the keystone defs.
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
   Lane 6 also asked for skills as designs: a judged play as a ludics interaction, where the
   delivery is the Proponent's design and the conditions are the Opponent's tests. Accepted
   means orthogonal. Discipline is the behaviour of designs orthogonal to customers' tests, and
   mastery is being material in it. It needs loci per condition, `unmet` as divergence, and
   vectors for mastered, admitted-not-material and not-admitted cases. Lane 5's asks:
   - FOUR rows for `Reading.impK`, `FiberAlgebra.Reading.impT` and Bool `Record` orders;
   - a regime for a projector's read, derived from its decode's closure data;
   - pymetrologic (Python) as a realization on the rail through a Python runner;
   - SignGraph's Lean Site with declaration names.
8. The rail: lean-system `package.json` `files` should carry every suite's vectors
   (`lib/obsmetrologia-conformance/*.golden-vectors.jsonl`). This waits until the lockfile gate
   passes on origin, since a manifest change runs it.
