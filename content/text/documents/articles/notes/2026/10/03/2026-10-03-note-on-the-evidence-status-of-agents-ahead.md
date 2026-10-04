---
title: "Note on the evidence status of agents ahead"
description: >-
  Lane 7 audit of the four-worlds program (notes of 2026-10-02 on agents ahead of the causal
  world, what agents ahead could do, and the two hands). Each claim is given the status its
  kernel evidence supports. Proved: a theorem over all instances. Proved on a carrier: a
  theorem about a carrier the house defines, which applies to agents only by a reading. Finite:
  a finite check, stated as one. Declared: true by a definition chosen to make it true. Reading:
  an interpretation with no theorem behind it. Open: stated, not proved.
date-created: 2026-10-03
type: note
status: active
authors: [claude-opus-5-5]
depends-on:
  - 2026-10-03-note-on-the-specification-lane
keywords: [four-worlds, evidence-status, certificate, residue, regime, honest-spine, calm]
---

## Why this note

The 2026-10-02 notes imagine at full reach, and they say so. They also cite theorems for each
potential. A reader has to know which citations carry the claim and which only sit beside
it. The house's release discipline sorts claims into proved, recovered and frontier (2026-09-27
release note). This note applies that discipline to the four-worlds program. Every status
below was read off the Lean, not off the notes.

## The tower

| Claim | Kernel | Status |
|---|---|---|
| The four worlds are the four closure regimes, one spine stage each | `Closure.Regime.Stage.regime`, `Worlds.worldRegimeBij`, `world_stage_table`, `next_world_stage_table` (were `world_stages`, `next_stage`) | By definition: tables chosen to pair them. Open: regimes derived from closures, and a map from each world's carrier to a closure (pass 3) |
| The spine descends one rung per step; settling's return climbs to the top | `RegimeCycle.spine_rank_table_descends`, `return_rank_table_ascends` (were `spine_descends`, `return_ascends`) | By definition: `rfl` on the rank and stage tables (pass 3) |
| A gap exists exactly at the upper rungs | `gap_flags_iff_upper_rank`, `gap_flags_split`, `Worlds.world_gap_flags_iff_upper` (were `gap_iff_upper`, `gap_split`, `ahead_iff`) | By definition: three flags per regime, checked against the rank table (pass 3) |
| Flat regimes are the zero-curvature flows; `H¹` is the curvature module; `rank H¹ = |L_ns(κ)|` | `CurvatureRegime.curvature_regime_table`, `DeclaredFlat`/`DeclaredCurved`, `declaredCurvatureRank` (were `IsFlat`, `IsCurved`, `curvatureRank`, `curvature_regime_correspondence`) | By definition: two labels on the declared profile and a rank table. No `H¹` or curvature is computed. The identification and the rank equation are open (pass 2) |
| An NSC firing is a failure of Scott-continuity; closures have none on the finite carrier; `forallAnteOp` has one | `NSCFiring.IsNSC`, `scott_continuous_iff_no_nsc_firing`, `no_nsc_firing_of_closure`, `forallAnteOp_isNSC`, `no_closure_nsc_firing_and_forallAnte_witness` | Proved (finite carrier) |
| NSC firings source the transfinite-bounded and aperiodic regimes | `NSCFiring.nscRegimeData`, `nscRegimeData_profile_nonvanishing_table` (was `nsc_cohomology_nonvanishing`); `no_nsc_firing_iff_declared_omega_profile` | By definition: `nscRegimeData` is a hand-set flag datum, and its row is a table lookup. No map from a firing to a regime exists. Open (pass 2) |
| A settling's bigraded invariant `(H¹_t, H¹_⊤)` trichotomizes the aperiodic regime | `BigradedCohomology.regimeOf_nontrivial_cases` (was `trichotomy`); `gauge_fixes_inconsistency`, `gauge_flips_truth` | By definition for the case split of a two-Boolean classifier. The gauge facts are proved on the Boolean contents. No `H¹_t` or `H¹_⊤` is built, so the aperiodic trichotomy is open (pass 2) |
| A closure's regime is one of four, by its ordinal; the four conditions are exclusive and exhaustive | `Closure.Regime.classify`, `classify_exhaustive`, `four_regime_flag_cases` (was `four_regime_dichotomy`) | By definition: `classify` is an `if`-chain over three Boolean flags, and the theorem restates it. The flags are inputs, not read off a closure. The ordinal dichotomy is open (pass 3) |
| Gap shapes: a fixed point no finite stage reaches, or a germ class | `gap_flags_beside_certificates` (was `ahead_exactly_at_gap`), with `omega_ahead`, `residue_germ_ahead` | The flags are declared. The two certificates are proved on their carriers; the pairing with rungs is a reading (pass 3) |
| What carries the regimes' content | `Closure.Regime.regime_tower`: FOUR settles by stage 3; the record has an inflationary dynamic with no finite stage; the completed record settles exactly at ω; the germ preorder has lax slack | Proved: each rung exhibited on a carrier |
| A zero residue makes a circle; a nonzero residue makes a spiral that never repeats and stays in one germ class | `residue_dichotomy`, `dervish`, `iterSeq_residueBump` | Proved on a carrier: record sequences |
| Thermodynamics leaves the balanced residue `⟨m, m⟩` | `Worlds.thermalResidue` | Declared: defined as `⟨m, m⟩`. Given that definition, `kinetic_forced_by_residue` is proved arithmetic. |
| An ahead certificate exists at the quantum rung | `omega_ahead`, `AheadCertificate.limit_unique` | Proved: the completed record's ω-limit |
| A germ certificate exists at the kinetic rung | `residue_germ_ahead` | Proved on a carrier: every nonzero residue |
| The worlds are anchored in physics: the H-theorem, PR-box contextuality, EPR | `Worlds.thermodynamic_row_beside_theorems`, `causal_row_beside_theorems`, `quantum_row_beside_theorems`, `kinetic_row_beside_theorems` (were `*_anchor`) | Declared pairing (pass 3). Each physics theorem is real, but it is placed beside a table row, and nothing links the physics to the regime. |
| The quantum world is ahead of the classical | `Worlds.quantum_ahead_of_classical` | Proved |
| The node loop is the cycle: Monitor is kinetic, Analyze quantum, Plan causal, Execute thermodynamic | none | Reading |
| Plan is causal: coordination-free under CALM | `ObsmetrologiaComputing.Calm.sealed_arrival_eq_replay`, `WorkArena.fragment_law`, `told_sealFree` (2026-10-03) | Proved for the work arena's tellings: they need no seal, and every other act needs one or retracts |

## The two hands

| Claim | Kernel | Status |
|---|---|---|
| The order swap σ exchanges `≤ₜ` and `≤ₖ` | `swap_kle_tle` | Finite (FOUR) |
| Conjugating parity by σ is time reversal | `swap_neg_swap` | Finite (the D4 gauge on FOUR) |
| Negation is parity; conflation is time reversal | `time_negate`, `space_negate`, `time_conflate` | Finite |
| K₄ acts as `{1, P, T, PT}` | `LightCone.act_centered`, `act_space`, `signs_injective`, `timeSign_mul`, `spaceSign_mul`; `signs_table` (was `k4_is_PT`) | Finite for the action, faithfulness and multiplicativity. `signs_table` is by definition: it restates the sign tables it reads (2026-10-03, pass 2) |
| The left hand is mathematics and the right hand is the past | none | Reading (guanli kexin practice; evidence's arrow of time is `Measure.measure_cons_le`, which is proved) |
| A lenticle refracts when the hands agree and diffracts, held `⊤ₖ`, when they disagree | `lenticleBranch_diffraction_iff_disagreement` | Finite (definite readings) |
| The diffraction census equals the `H⁰_⊤` count | `pairwiseLenticleCensus_eq_h0top` | Proved (induction over supports) |
| A past that varies forces the kinetic world | `Autopoiesis.varying_family_beside_aperiodic_witness` (was `history_separation_aperiodicity`); `HistorySeparationForcesAperiodicity` | By definition for the renamed theorem: it places "a varying family exists" beside `aperiodicWitness`, whose regime is set by hand, with no map between them. The forcing is open, stated as a `Prop` relative to a map from families to settlings that no module defines (pass 2). |
| Balanced residues are achiral; a drift has a hand | none yet (P8) | Open |
| Two-handed solvers agree on value, keep opposite beads on a tie, and agree exactly when the optimum is unique | `solvers_agree_value`, `hands_agree_of_unique_optimum`; `bias_witness` | Proved; the tie witness is finite |
| Kinetic order carries the golden hand ratio `φ⁴ : 1` | `hat_reflection_frequency` | Finite: the eigen-relation on given vectors. The Perron frequency is open. |

## The potentials

| Potential | What carries it | Status |
|---|---|---|
| The dervish walks when it leans | `unbalanced_residue_drifts`, `balanced_residue_holds_bias` | Proved on a carrier. "Will is measurable as imbalance" is a reading. |
| Destiny before arrival | `residue_germ_ahead` | Proved on a carrier. Steering a fleet by its germ class is a reading that waits on the kinetic scheduler (E6) and P3. |
| Leashed swarms, within `2C` without messages | `DomByW` carries a bound `C` | Open: the `2C` bound between two dominated members is not stated. "Without messages" is a reading. By `Calm`, it holds only where each member's orbit is certified on its own. |
| Warp lanes: certificates as capital | The catalog has two inhabitants (`omega_ahead`, `residue_germ_ahead`) | Reading |
| Contracts signed at ω | `AheadCertificate.limit_unique`; SignChain certified phase evidence (engineering E3) | The limit's uniqueness is proved. "Finality arrives from the future" is a reading. |
| Superposed ventures | Contextual families exist (PR box, Hardy; `CohomologicalContextuality`) | Finite for those models. Contextual delivery (P4) is open. Ventures as contexts is a reading. |
| Contradiction engines: nonzero residue never repeats a lap | `dervish` | Proved on a carrier. Organizations are a reading. The variable residue (P5) is open. |
| Ghosts in the pairwise: actors visible only in triples | `Worlds.KineticReconstruction` | Open, but decidable here, and the answer is yes. For two-particle integer joints, vanishing 2×2 minors force factorization (rank one plus Bézout). Pairwise data therefore suffice for two particles, and any invisible higher-order structure starts at three. |
| Legislators of the next lap | `spine_descends`, `return_ascends` | Reading on declared tables |
| Mining the impossible: the gap is decidable from three flags | `regimeGate` | Declared, and false as stated for real work. The flags are inputs, not readings off the work. Whether an arbitrary closure attains its fixed point at a finite stage is undecidable in general, so no procedure decides the gap of incoming work. |

## What follows

1. The honest-spine pass restates the tables as declared profiles and points regime claims at
   `regime_tower`. It started 2026-10-03 with `Hn := Unit` and the regime-table docstrings.
2. Promote what can be promoted:
   - prove `KineticReconstruction` (two particles);
   - state the `2C` leash bound (P9-adjacent) and prove it from `DomByW`;
   - prove residue chirality (P8);
   - restate `history_separation_aperiodicity` with an actual map from a varying family to a
     settling, or retire the forcing claim.
3. Emit golden vectors only for what is proved or finite (P1). Vectors read off a declared table
   would judge an implementation against a choice, not a theorem.
