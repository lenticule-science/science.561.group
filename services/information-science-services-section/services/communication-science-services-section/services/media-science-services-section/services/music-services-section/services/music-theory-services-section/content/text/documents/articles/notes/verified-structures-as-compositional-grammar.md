---
title: "Verified Structures as Compositional Grammar"
description: "How Obsmetrologia's Lean-proved settling/sheaf/thermodynamic structures are repurposed, unmodified in their proof content, as a generative-music grammar -- and why that is a different claim than a hand-tuned Markov or context-free grammar."
aliases:
  - "Verified Structures as Compositional Grammar"
date-created: 2026-08-19
keywords:
  - music-theory
  - generative-music
  - formal-methods
  - ambient
requires:
  - ./foundations-of-musical-structure.md
teaches:
  - "regime dichotomy as macro-form"
  - "sheaf cover as polyphony gate"
  - "CRDT chord merge"
  - "Boltzmann temperature as humanization"
  - "driven closure flow as phrase logic"
  - "Lambek bi-residuation as motif grammar"
id: verified-structures-as-compositional-grammar
authors:
  - claude-sonnet-5
type: lesson
---

## Opening frame

[Kulitta](https://github.com/donya-quick/Kulitta) and [Euterpea](https://www.euterpea.com/), the two Haskell algorithmic-composition systems this note keeps returning to for contrast, generate music from hand-authored grammars: stochastic context-free grammars over chord functions, Markov transition tables fit or hand-set for voice leading, constraint solvers tuned until the output stops sounding wrong. Their correctness criterion is, structurally, "sounds plausible to the author" — a grammar rule stays in the system because nobody caught it producing garbage yet, not because anyone proved it couldn't.

The engine documented here does something narrower and stranger: it takes theorems that were already machine-checked, in a Lean 4 proof library called Obsmetrologia that has nothing to do with music — it formalizes settling processes, sheaf cohomology, and reaction-network thermodynamics — and uses them as the literal control logic for a piece of generative music. The proofs were not written with sound in mind. They were checked, by Lean's kernel, before any of this project's audio code existed. Structural properties of the generated music — which voices are allowed to sound together, whether a chord merges to the same result regardless of arrival order, whether register spread converges instead of clumping, whether a drifting parameter settles instead of oscillating — are *consequences* of those proofs, not qualities tuned in afterward by listening.

That is the concrete, falsifiable difference from Kulitta and Euterpea. Their grammars could, in principle, generate an invalid or inconsistent structure — a voice-leading rule with an uncaught edge case, a Markov table with an unreachable state, a constraint solver that occasionally violates its own constraint — and the only defense is more testing. Several of this engine's structural guarantees are not testable-away bugs in that sense. Order-independent chord merging, the absence of periodic orbits in parameter drift, and non-negative entropy change under the register-balancing rule are proof-backed invariants, ported at the level of the algorithm itself, from a domain where they were established for reasons that have nothing to do with how anything sounds.

None of this makes the music good. It changes what kind of claim can be made about why the music is structured the way it is.

## The four Obsmetrologia primitives in use, and their proof provenance

### Regime / Operator

**Lean source:** `Obsmetrologia.Closure.Regime`, `Obsmetrologia.Closure.RegimeCofinality`, `Obsmetrologia.Closure.Operator`, `Obsmetrologia.Closure.SettlementSpiral`

**What it actually proves:** any settling process falls into exactly one of four mutually exclusive, jointly exhaustive regimes — `strict`, `scott`, `transfiniteBounded`, `aperiodic` — decided by three booleans via a decidable `classify()`, with a proved dichotomy theorem. Separately, `Operator.lean` proves the closure operator is inflationary, monotone, idempotent, admits no non-trivial periodic orbits under iteration, and reaches its least fixed point above any seed within a small finite bound (`kHeight = 3`). `SettlementSpiral.lean` proves a genuine strict growth tower — Padovan < Fibonacci < Tribonacci < 2^n, and the general k-bonacci family bounded above by 2^n — while explicitly disavowing (and in one checked case actively refuting) the legacy claim that these recurrences correspond one-to-one with the four regimes.

**One-line translation:** [regime](../../glossary/terms/regime.md) — the current section's classification, which selects both its duration and its onset-timing generator, never claimed to *be* anything about the section beyond that classification.

### Site / Sheaf

**Lean source:** `Obsmetrologia.Site.Basic`, `Obsmetrologia.Site.Sheaf`, `Obsmetrologia.Site.Section`

**What it actually proves:** a real Grothendieck site over a 4-element clopen Boolean algebra, with the three basis axioms (identity, pullback-stability, transitivity) proved by exhaustive case analysis; a separate load-bearing theorem, `no_temporal_covers`, that covers refine only the clopen leg at a *fixed* context and never advance across time on their own; and, on top of that site, a merge operation (`joinK`) proved to be a commutative, idempotent, associative join-semilattice — a CRDT — with order-independence proved concretely as `joinList_congr`. `Sheaf.separated` proves a section is uniquely pinned by its cover.

**One-line translation:** [cover](../../glossary/terms/cover.md) — the sub-check-and-join test that decides which candidate voices are legitimately allowed to sound together in a given window.

### Thermodynamics

**Lean source:** `Obsmetrologia.Thermodynamics.BoltzmannEntropy`, `Obsmetrologia.Thermodynamics.Temperature`

**What it actually proves:** a real-valued Boltzmann entropy S = log(N!) − H, with an H-theorem showing that an equilibrating exchange (moving one particle from a fuller cell to an equal-or-emptier one) never increases H — the increment is computed exactly as log(a+1) − log(b+1) ≥ 0, not assumed to be non-negative. `Temperature.lean` derives a concrete stage temperature T = mints / flux, with a proved worked example establishing the two poles: a pure-commitment step gives T = 0 exactly, an all-mint step gives T = 1 exactly.

**One-line translation:** [temperature](../../glossary/terms/temperature.md) — the piece's own ratio of newly-injected to total pitch-class events in a window, scaling every jitter parameter that quarter.

### Dynamics / Flow

**Lean source:** `Obsmetrologia.Dynamics.Flow.ClosureFlowDynamics` (aggregated via `Obsmetrologia.Dynamics.Flow`)

**What it actually proves:** the driven flow drive(n+1) = closureOp(join(drive(n), u(n))) is inflationary at every step regardless of the increment u(n); every step is exhaustively classified as either a `SmoothStep` (no change) or a `FiringStep` (genuine change), the two being provably exclusive and exhaustive; and — the central proved fact — smoothness is terminal: once a run goes smooth, it is provably smooth at every later time (`smooth_is_terminal`).

**One-line translation:** [chord-merge](../../glossary/terms/chord-merge.md)'s driving loop — the macro-tick that decides whether this tick develops the piece or holds it, and guarantees the piece's late section can only quiet down, never spontaneously re-erupt.

### Lambek Calculus (motif grammar)

**Lean source:** `Obsmetrologia.Calculus.Logic.LambekCalculus`

**What it actually proves:** a `LambekAlgebra` is a lattice-ordered monoid `⟨L, ∧, ∨, ·, e⟩` with a possibly-non-commutative product `·` and two residuals (left `\`, right `/`) satisfying bi-residuation — `a·b ≤ c ⟺ b ≤ a\c ⟺ a ≤ c/b` — from which left/right modus ponens, two-sided fusion monotonicity, residual mono/antitonicity, and the commutative-collapse-to-a-single-implication theorem are all derived, never re-posited. The file witnesses the structure only with the trivial one-element algebra; it does not itself construct a non-trivial instance.

**One-line translation:** motif shape (`motif-grammar.mjs`) — a "what must follow this fragment to reach a well-formed closing shape" reachability test, computed literally as a left residual, deciding which step token is legal next.

This is the one primitive in this document added after the melodic layer's own hardcoded motif-shape enum was flagged (see Macro-form section below for the parallel fix to section boundaries) as the same disease as a fixed time-fraction schedule: four hand-designed contour functions, dressed up as "variety." Unlike the other four primitives, the Lean file's `LambekAlgebra` is witnessed only trivially there, so using it for anything required constructing a genuine non-trivial instance first — `lambek.mjs` does this as the standard formal-languages-under-concatenation model (finite languages over a bounded alphabet, ordered by inclusion; `dot` = length-bounded concatenation; `lres`/`rres` = the ordinary left/right quotients), the same model semanticists use for the Lambek calculus (syntactic concept lattices, Wurm 2012, cited in the Lean file's own header — documented there, not formalized). That the instance actually satisfies the algebra is checked directly, not assumed: `test/lambek.test.mjs` runs `dot`'s associativity and the full bi-residuation adjunction as property-based tests over random finite languages, plus both modus-ponens laws and a concrete non-commutativity witness (the reason two residuals are needed at all, rather than the commutative single-implication case the Lean file also proves).

`motif-grammar.mjs`'s `generateTokenSequence` puts the residual to real generative work: a target "closing category" (a net-displacement range over a small step-token alphabet, optionally requiring or forbidding a genuine leap) is built as an explicit finite language, and at each position, only tokens whose left residual against that category (re-scoped to the remaining length budget) is non-empty survive as candidates — a literal application of `modus_ponens_left`/`dot_lres_adj`, not a metaphorical one. The result is well-formed by construction rather than well-formed on average, and it draws from a combinatorially larger space than the 4-shape enum it replaced (checked in `test/melody.test.mjs` and `test/motif-grammar.test.mjs`: hundreds of draws produce dozens to hundreds of distinct interval-sequence shapes, not 4 buckets).

**Honest limit of this port:** this is not a full categorial grammar in the sense of typing every melodic function (motif, phrase, cadence) and composing them the way subject/predicate categories compose in natural-language parsing. It is a real, tested instance of the algebra applied narrowly to one question — legal next-token continuation — because that is the piece of the Lean file's structure this engine actually had concrete use for. A grammar that also typed phrase-level or section-level combination the same way would be a substantially larger piece of work, not attempted here.

## Macro-form: the regime dichotomy as section logic

`classify()` is the piece's section-selection function. Every macro-tick, three measured engine quantities stand in for the three Lean booleans: `finiteBase` from the count of currently active voices, `scottContinuous` from the smoothness of recent filter drift, `countableCofinality` from time elapsed since the last hard reset. Feeding these through `classify()` returns one of the four regimes, and that regime selects both the macro-tick window length for the coming section and which onset-interval generator (Padovan, Fibonacci, Tribonacci, or a rising-k k-bonacci sequence) drives sub-beat grain and swell timing within it. These four generators are used only for their genuinely distinct growth rates — not as evidence that the section *is* its regime in some deeper sense, which matches `SettlementSpiral.lean`'s own disavowal of that correspondence rather than overriding it.

The `kHeight = 3` settle-or-clamp rule is why parameter drift within a section is audibly monotone-then-still rather than wobbly. Any drifting parameter — filter cutoff, tension — is only permitted to move in one direction and must reach a stable value within three iterations of the bounded convergence loop or be force-clamped there. The audible result is a section that tightens toward a resting value and then holds it, never a parameter that hunts back and forth.

`APERIODIC` is used deliberately as an unreachable asymptote — a direction of rising tension and instability that the piece can lean toward but that the classification logic, following `RegimeCofinality.lean`'s own honest limitation, is not built to actually witness. It is a horizon in the section-selection space, not a destination the piece ever lands in. That is not a shortcoming worked around; it is the same limitation the Lean corpus states about its own formalization, inherited here without softening it.

**Correction to an earlier version of this account:** for a period, the melodic foreground layer's own large-scale shape (OPENING/DEVELOPMENT/RETURN, `melody.mjs`) did *not* use `classify()` at all — it split the piece into fixed time-fraction windows (0-28%/28-80%/80-100% of the clock) instead, and that revision's own comment argued using `classify()` for this would be curve-fitting, since `classify()` is reactive rather than a pre-planned arc. That argument was backwards, and is worth stating plainly rather than quietly fixing: a fixed clock-percentage schedule *is* the curve-fit — it cannot be wrong about whether anything in the piece actually happened, only about whether the clock has ticked past 80% yet — while `classify()`'s three booleans are exactly the record of what the engine's own state has done. This has been corrected: `melody.mjs`'s `advanceMacroFormPhase` now derives OPENING/DEVELOPMENT/RETURN directly from the same `regimeTag` sequence `classify()` already produces every macro-tick, with a genuine state-driven "return" condition (STRICT recurring after the piece has left it at least once) replacing the old "past 80% of the clock" test. One real consequence of the correction, not hidden: because `classify()` is reactive rather than monotone in time, RETURN can now recur multiple times over a long piece (a rondo-like structure), and a given RETURN window can be short enough that the phrase-scheduling loop doesn't always start new material inside it — both are honest properties of a state-driven classifier, not properties a fixed 20%-of-the-clock reservation would ever have exhibited, for better and for worse.

## Polyphony: sheaf covers instead of voice-leading rules

The decision of which voices are allowed to sound together in a given window is not made by hand-written voice-leading rules. It is made by a cover check against the site's 4-element clopen algebra: a candidate voice grouping is admitted only if it passes a sub-check (each member is contained in the target) and a join-check (the members' union, computed as an OR-reduction, equals the target exactly). A grouping that fails either check is not silently allowed through — it is retargeted.

The `no_temporal_covers` theorem — that covers refine only the fixed-context clopen leg, never advance across time on their own — is enforced as a literal scheduling rule, not a metaphor. Voice-grouping decisions are frozen for the entire window and are only re-decided at the next window boundary, as a discrete re-cover. This is the direct mechanism behind this project's brief that harmonic material should have no percussive attack transients and a slow harmonic rhythm: harmonic regime changes are structurally discrete events — a proof-mandated design constraint, not an audio-engineering choice — even though their rendering, with long attack and release envelopes, makes them sound continuous to a listener. The discreteness lives in the scheduling logic; the continuity lives only in the envelope shaping laid on top of it.

## Determinism under concurrency: the CRDT chord merge

`joinList_congr` — the proof that a list of deltas merged via the knowledge-join depends only on the delta *set*, never on order or multiplicity — is the literal mechanism that lets a live, asynchronously-scheduled engine produce the same sounding chord no matter what order its voice events happen to arrive in. The chord commit itself is exactly this fold: `mergeChord = events.reduce((m, e) => m | e.pitchClassBit, 0)`, an OR-accumulation over pitch-class bits that is commutative, idempotent, and associative by construction, and therefore order-independent by the same proof.

Kulitta and Euterpea never needed to solve this problem, because they don't have it: both are single-threaded, deterministically-ordered generators where "what order did the events arrive in" is not a question that can even be asked. This is not a case of the verified engine solving a harder version of a problem the comparison systems already solved — it is a case of a real-time, independently-scheduled voice engine introducing a genuinely new failure mode (races producing wrong notes depending on scheduling jitter), and a proof from an entirely unrelated formal domain turning out to be exactly the theorem that closes it.

## Micro-variation: temperature derived from the piece's own material, not hand-set

T = mints / flux — the fraction of a window's total pitch-class events that are newly-injected rather than repetitions or resolutions — scales gaussian detune-cents, filter-cutoff jitter, and onset-jitter uniformly, every window, directly from that ratio. A quiet, repetitive window is measurably calmer (T near 0, jitter near zero); a highly developmental window is measurably more alive (T near 1, jitter scaled up). The number driving the humanization is read off the piece's own recent material, not set by a knob.

The Kulitta/Euterpea-adjacent practice this replaces is: add some random jitter, and tune the amount by ear until it stops sounding robotic. That practice is not wrong, but its correctness criterion is a listening test performed after the fact. Here, T = 0 and T = 1 are proven exact poles of `Temperature.lean`'s worked example — a pure-commitment step gives T = 0 exactly, an all-mint step gives T = 1 exactly — not empirically-typical low and high readings that happened to cluster near those numbers in testing.

Separately, an 8-bin register-occupation table runs the H-theorem migration literally, once per tick: p = (log(nFull+1) − log(nEmpty+1)) / norm, and the fullest bin's newest voice is probabilistically nudged toward the emptiest. Because the underlying entropy increment is proved non-negative for this kind of exchange, this is a proof-backed self-balancing register spread, not a heuristic anti-clumping rule — it prevents the common failure mode of naive pad engines where all voices drift into the same octave, and it does so as a consequence of the H-theorem rather than a patch added after the clumping was noticed.

## What is and isn't proved

This is the honest ledger, and it matters exactly because the source material practices the same discipline.

**Proved, and ported directly, as theorems about the algorithm:**

- CRDT convergence of the chord merge (`joinList_congr`) — the sounding chord is genuinely order-independent.
- H-theorem non-negativity of the entropy-driven register migration — the exchange step cannot increase disorder as measured.
- No periodic orbits in the closure operator's iteration — a drifting parameter cannot get stuck oscillating; it settles or is clamped.
- Sheaf separation / uniqueness — a voice grouping's admitted section is uniquely determined by its cover, not ambiguous.
- The Lambek bi-residuation adjunction and both modus-ponens laws, for `lambek.mjs`'s bounded finite-language instance specifically (not merely asserted to hold because the general Lean theorem exists for *some* algebra — checked directly against this instance in `test/lambek.test.mjs`, since the Lean file only witnesses the structure trivially).

**Compositional analogies invented for this engine, and *not* proved of the music itself:**

- That leaning toward the `APERIODIC` regime actually sounds more unstable or tense to a listener. Nothing in Obsmetrologia's proofs says anything about perceived tension; that mapping is this project's own aesthetic choice, untested against listeners as of this writing.
- That the growth-tower onset sequences (Padovan/Fibonacci/Tribonacci/k-bonacci) produce onset patterns a listener would judge as good rhythm, as opposed to merely distinct rates of change. The theorem proves the rates are distinct; it says nothing about whether distinctness is musically useful.
- That the four regimes correspond to four musically meaningful "moods" or sections in any principled sense beyond "the classification function returned a different label." (Using them to drive the melodic layer's OPENING/DEVELOPMENT/RETURN phase, corrected above, is a claim about *when* material changes character, not about what character a given regime inherently has.)
- That the specific step-token vocabulary and net-displacement categories `motif-grammar.mjs` builds (repeat/small-step/leap; "narrow" vs. "wide-required" biases) are the musically correct categories, as opposed to *a* set of categories the residuation algebra can operate over honestly. The algebra's laws are proved of this instance directly; which categories to define and which section should draw from which is this project's own compositional choice, exactly as the growth-tower-to-regime mapping above is.
- That the maximal-evenness scale generator's non-diatonic/non-pentatonic cardinalities (2, 3, 4, 6, 8, 9, 10, 11 at c=12) are equally usable for ambient/drone material as the diatonic and pentatonic ones the engine defaults to. Maximal evenness is a real, provable spread-evenness property at every cardinality; whether a sparser or denser-than-diatonic set sounds appropriately consonant for this genre is untested, which is why `scale.mjs`'s own random-mode helper restricts its default range to cardinalities 5-8 rather than the full 2-11 space.

`SettlementSpiral.lean` itself explicitly disavows — and in one checked instance actively refutes — the legacy claim that the growth-tower recurrences correspond one-to-one with the four regimes. This document inherits that same disavowal rather than quietly overclaiming a tidier story where growth-tower choice and regime line up neatly. They don't, provably, and no attempt is made here to paper over that.

## Comparison table: this engine vs. Kulitta/Euterpea

| Axis | Kulitta / Euterpea | This engine |
|---|---|---|
| Pitch-material source | Hand-authored stochastic context-free grammar / Markov table over chord functions | Sheaf-cover admission over a proved Grothendieck site; growth-tower onset generators selected by regime |
| Structural validity guarantee | Tested for plausibility by the author; no formal invariant | Proof-backed: sheaf separation, no-periodic-orbits, kHeight-bounded settling |
| Concurrency-safety guarantee | Not applicable — single-threaded, deterministic event ordering | CRDT chord merge, proved order-independent (`joinList_congr`) regardless of arrival order |
| Humanization source | Hand-tuned random jitter, amount set by ear | T = mints/flux, derived from the piece's own material each window; T=0/T=1 are proven exact poles |
| Worked-example status | Extensive published corpora and generated-piece examples | A working implementation with proof-traceable behavior; no comparable corpus of finished pieces yet |

## Related

- [Foundations of Musical Structure](./foundations-of-musical-structure.md) — the source note's caution about treating musical parameters as culturally-situated tools applies here too: regime, cover, and temperature are analytical tools this project has adopted, not neutral facts about what music is.
- [harmony](../../glossary/terms/harmony.md), [dissonance](../../glossary/terms/dissonance.md) — the existing glossary terms this document's cover-and-regime vocabulary sits alongside without replacing.
- [regime](../../glossary/terms/regime.md) — term to be coined: the four-way settling classification used as section logic.
- [cover](../../glossary/terms/cover.md) — term to be coined: the sheaf-theoretic admission test used as a polyphony gate.
- [temperature](../../glossary/terms/temperature.md) — term to be coined: the mints/flux ratio used as this engine's humanization source.
- [chord-merge](../../glossary/terms/chord-merge.md) — term to be coined: the CRDT fold used to make concurrent voice events converge deterministically.
- The engineering service README for the runnable implementation (`src/generative/regime.mjs`, `flow.mjs`, `cover.mjs`, `thermo.mjs`) — not yet published in this corpus as of this note's writing.
