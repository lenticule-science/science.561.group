---
title: "Four Regimes of Natural Existence"
description: "The four mutually-exclusive, jointly-exhaustive regimes Obsmetrologia proves over the closure ordinal κ, read as nature — each the regime of one stage of the language: thermodynamic, causal, quantum, and kinetic existence — a descent from genuine novelty at the aperiodic top to full settlement at the finite floor."
contains: [thermodynamic-existence, causal-existence, quantum-existence, kinetic-existence]
---

This topic gathers the four terms that name natural existence's four
regimes — [thermodynamic existence](../terms/thermodynamic-existence.md),
[causal existence](../terms/causal-existence.md),
[quantum existence](../terms/quantum-existence.md), and
[kinetic existence](../terms/kinetic-existence.md) — together with the deep
dive on the regime most distinctive of nature's capacity for novelty, [kinetic
existence as the aperiodic regime](../../documents/articles/teaching-articles/explanations/kinetic-existence-as-the-aperiodic-regime.md).
Each term names one regime independently: which physical processes occupy
it, which sub-corpus of the Obsmetrologia Lean proof tree studies it, and
what kind of proof and measurement that regime admits.

It sits at this level — the root of `natural-science-services-section`'s own
glossary, above any one subdomain such as astronomy or biology — because the
regimes are not a subdomain of nature; they are the frame every subdomain's
matter and systems occupy. The section's own README already states this
frame ("nature under four regimes — kinetic, quantum, causal, and
thermodynamic"); this topic is where that sentence is made precise and
where its formal source, its Lean proofs, and its natural referents are
gathered.

## The regime ladder

The stratification is proved in
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Regime.lean`:
the closure ordinal `κ` of a settling problem lands in exactly one of four
regimes, determined by three decidable flags (Scott-continuity, a finite
base, countable cofinality) and their two corpus implications (a finite
base forces both Scott-continuity and countable cofinality). `classify`
selects the regime; `four_regime_dichotomy` proves the four are mutually
exclusive and jointly exhaustive; `cohomologyVanishes` is a definition by
cases over the four `ClosureRegime` constructors, and `cohomologyVanishes_iff`
— proved by exhaustion over those same four cases — states that definitional
table's own content: `H¹ = 0` exactly in the strict and Scott regimes. The
table is a stipulation about the four regimes, not a derivation from any
physics; what each row means for a natural process is established
separately below, module by module.

Read as nature (session ruling, this section, 2026-09-03) the four
mathematical regimes are the four regimes of natural existence named in
this section's own README and in the LAGOON architecture specification's
regime ladder
(`lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/apps/lagoon/content/text/documents/articles/notes/2026/08/29/2026-08-29-lagoon-architecture.md`,
"The regime ladder", around line 1444):

| regime (natural existence) | κ | stage | H¹ | Lean sub-corpus | proof kind (LAGOON) | spacetime field | physics register |
|---|---|---|---|---|---|---|---|
| kinetic | `κ ≥ ω₁` (aperiodic) | articulating | `≠ 0`, never drains | `KineticTheory/` | witnessed execution | informational | "it from bit" |
| quantum | `ω < κ < ω₁` (transfinite-bounded) | predicating | `≠ 0` | `QuantumContextuality/` | obstruction witness | quantum | quantum mechanics |
| causal | `κ = ω` (Scott) | positing | `= 0` | `CausalSets/` (`Causal/RegimeSection.lean`) | settlement | classical | classical mechanics |
| thermodynamic | `κ < ω` (strict) | settling | `= 0` | `Thermodynamics/` | exhaustion | thermal | thermodynamics |

The last two columns come from the monograph
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`,
"The one four-fold" (around line 227) and "The four fields" (around line
386): `spacetime field` and `physics` are the same four regimes read as
cosmology, not competing regime names — the correspondence table's own
register, not a second theory.

## The descent

The four regimes are ordered, and the order runs one way: it is the order of the language spine, articulate → predicate → posit → settle, read as nature. Kinetic existence articulates, producing genuine novelty that can only be witnessed; quantum existence predicates, and contextuality is the question whether one global section holds across every context; causal existence posits, evidence propagating along light cones by directed finite prefixes; thermodynamic existence settles, and settling stops.

The regimes are not four kinds of settling; each is one stage's (see [regime](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/regime.md)). `Regime.lean`'s
own implications (`fin_scott`, `fin_cof`) make a finite base the most
constrained case — it forces both Scott-continuity and countable
cofinality — so the strict-finite regime is nested inside the wider
conditions the other regimes only partly satisfy. The monograph gives the
same nesting a physical reading: the obstruction `H¹` is non-zero in the
two transfinite regimes (kinetic, quantum) — "the field still carries
something it cannot close from inside" — and drains to zero at the causal
and thermodynamic floors. *Condensing* carries kinetic existence's
irreducible residue down into quantum existence; *collapsing* — value
entering, measurement — is the Big Bang, the quantum-to-causal step, not
the aperiodic top and not a finite event; *thermalizing* glues causal
existence's local sections into thermodynamic existence's single global
section with `H¹ = 0`, and stops there because full thermalization is heat
death: there is nothing left to thermalize.

## What the Lean establishes and what it stipulates

`Closure.Regime.cohomologyVanishes` is a definition by cases over the four
`ClosureRegime` constructors — `true` for strict and Scott, `false` for
transfinite-bounded and aperiodic — and `cohomologyVanishes_iff` is proved
by exhaustion over those same four cases (`cases r <;> simp
[cohomologyVanishes]`). This is the regime-cohomology table stating its own
content, not a derivation from any settling-associated sheaf.

Two modules go further and build a concrete witness rather than resting on
the table. `Cohomology/FiringGenerators.lean` is, per its own header, "the
first witness making `cohomologyVanishes transfiniteBounded = false` true
by construction rather than by table stipulation" — modeled on a finite
one-vertex cochain complex where "edges = firing stages" stand in for a
finite subset of `L_ns(κ)`. No witness of this kind exists for the
aperiodic regime: `Closure/RegimeCofinality.lean`'s
`Ord.regimeOfOrdHonest_ne_aperiodic` proves the honest ordinal-shape
classifier never outputs `aperiodic`, for any ordinal or Scott-continuity
witness — the aperiodic branch is structurally unreachable from real `Ord`
evidence, not merely unbuilt, because Lean core has no transfinite
cardinals. The aperiodic regime is inhabited in the library only through a
stipulated `countableCofinality = false` flag in one hand-built
`ClosureRegimeData` (`KineticTheory/Plasma/TopologicalWaveSheaf.lean`'s
`canonicalEdgeBand`), never through ordinal evidence or a derivation from a
flow.

The 2026-09-04 regime-instantiation census
(`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/data/records/census-records/2026-09-04-regime-instantiation-census.json`)
counted every regime-bearing theorem in the library by how it reaches its
regime conclusion. Of 199 total: 70 assume a regime as a `∀`-bound
hypothesis (hypothesized), 27 reach a concrete hand-built
`ClosureRegimeData` in their proof term (hand-built), 15 reach
`Ord.regimeOfOrdHonest`/`Ord.regimeOfOrd` (derived), 81 rest on the table
alone (table-only), and 6 combine more than one route (mixed). Exactly 3
concrete `ClosureRegimeData` definitions exist in the whole library
(`spineData`, `Flow.NSCFiring.nscRegimeData`,
`Cohomology.ScottFace.regimeData`), and none sets `countableCofinality =
false` — every named datum in the corpus commits to countable cofinality.
Of the 42 theorems that conclude aperiodic, 24 are table-only, 10
hypothesized, 6 derived, 1 mixed, and 1 hand-built. Four physics-lineage
modules — `Thermodynamics/`, `QuantumContextuality/`, `ReactionNetworks/`,
`DenseMatter/` — carry zero regime-bearing theorems; `KineticTheory/`
(11), `CausalSets/` (8), and `AperiodicOrder/` (42) are populated.

## Grounding

This four-regime ladder is read as nature within Lenticule Science's own
metaphysical research program, relationality — the Leader's single-author
formalization of Lakotaean metaphysics
(`lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/relationality-services-section/README.md`).
