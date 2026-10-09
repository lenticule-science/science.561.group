---
title: "The Glass Transition as a Regime Change"
description: "A regrounding note reading the glass transition — Anderson 1995's flagship unsolved problem of solid-state theory — through the house's four regimes: states the field's own literature (Berthier-Biroli, RFOT, dynamical facilitation, kinetically constrained models, bootstrap percolation), what the house Lean glass line (KCM.lean facilitation closure, Basin.lean, Overlap.lean, Heterogeneity.lean, Crystal/Glass.lean) actually proves today, grades the provenance of the house's own regime-ladder-as-nature framing (machine-checked math versus agent-interpreted physics, several removes from any locatable owner statement), reads the 2026-09-04 deterministic facilitation-closure measurement model by model including the East model as a negative control, and states — as a hypothesis (H1) the measurement tests rather than a premise it assumes — that jamming may be a Scott-continuity failure of the facilitation closure at the infinite-lattice limit while the glass transition proper lives in the rates, with falsifiers (including H1's own refutation condition, named as a result rather than a failure) and the next instruments (an immediate density-grid rerun, then a stochastic rate-bearing instrument) named."
date-created: 2026-09-04
type: notes
name: 2026-09-04-note-on-the-glass-transition-as-a-regime-change
keywords:
  - glass-transition
  - kinetically-constrained-model
  - facilitation-closure
  - bootstrap-percolation
  - spiral-model
  - east-model
  - dynamic-heterogeneity
  - settling-cohomology
  - attention-allocation
  - provenance-grading
tags:
  - draft
status: draft-for-review
authors:
  - emsenn
  - claude-fable-5-1
references:
  anderson1995:
    authors: ["Philip W. Anderson"]
    title: "Through the Glass Lightly"
    publication: "Science"
    year: 1995
  berthier-biroli2011:
    authors: ["Ludovic Berthier", "Giulio Biroli"]
    title: "Theoretical perspective on the glass transition and amorphous materials"
    publication: "Reviews of Modern Physics"
    year: 2011
  kirkpatrick-thirumalai-wolynes1989:
    authors: ["Thomas R. Kirkpatrick", "Devarajan Thirumalai", "Peter G. Wolynes"]
    title: "Scaling concepts for the dynamics of viscous liquids near an ideal glassy state"
    publication: "Physical Review A"
    year: 1989
  garrahan-chandler2002:
    authors: ["Juan P. Garrahan", "David Chandler"]
    title: "Geometrical Explanation and Scaling of Dynamical Heterogeneities in Glass Forming Systems"
    publication: "Physical Review Letters"
    year: 2002
  ritort-sollich2003:
    authors: ["Felix Ritort", "Peter Sollich"]
    title: "Glassy dynamics of kinetically constrained models"
    publication: "Advances in Physics"
    year: 2003
  fredrickson-andersen1984:
    authors: ["Glenn H. Fredrickson", "Hans C. Andersen"]
    title: "Kinetic Ising Model of the Glass Transition"
    publication: "Physical Review Letters"
    year: 1984
  toninelli-biroli-fisher2006:
    authors: ["Cristina Toninelli", "Giulio Biroli", "Daniel S. Fisher"]
    title: "Jamming Percolation and Glass Transitions in Lattice Models"
    publication: "Physical Review Letters"
    year: 2006
  chalupa-leath-reich1979:
    authors: ["J. Chalupa", "P. L. Leath", "G. R. Reich"]
    title: "Bootstrap percolation on a Bethe lattice"
    publication: "Journal of Physics C: Solid State Physics"
    year: 1979
  holroyd2003:
    authors: ["Alexander E. Holroyd"]
    title: "Sharp metastability threshold for two-dimensional bootstrap percolation"
    publication: "Probability Theory and Related Fields"
    year: 2003
  sollich-evans1999:
    authors: ["Peter Sollich", "Martin R. Evans"]
    title: "Glassy Time-Scale Divergence and Anomalous Coarsening in a Kinetically Constrained Spin Chain"
    publication: "Physical Review Letters"
    year: 1999
  elmatad-chandler-garrahan2009:
    authors: ["Yael S. Elmatad", "David Chandler", "Juan P. Garrahan"]
    title: "Corresponding States of Structural Glass Formers"
    publication: "Journal of Physical Chemistry B"
    year: 2009
---

This is a regrounding note in the sense of
[the regrounding program](../../../../../../../../../../../../../../content/text/documents/articles/notes/2026/08/21/2026-08-21-the-regrounding-program.md):
it reads a live, unresolved field through the house's settling/cohomology
instrument, adds a falsifiable structural claim that did not exist before
the translation, and states plainly that it is a framing contribution, never
a claimed resolution. Per that program's own discipline (§3), the claim
below is graded, not asserted: the deterministic skeleton the house Lean
proves today is read against the model's actual glassy-dynamics literature,
and the boundary between what the skeleton can and cannot see is stated
honestly rather than talked past. The placement of glass on any house regime
is itself a hypothesis tested by the measurements below, never a premise
assumed in advance.

## 1. The problem, as the field states it

Philip Anderson named it directly: "the deepest and most interesting
unsolved problem in solid state theory is probably the theory of the nature
of glass and the glass transition" [@anderson1995]. A liquid cooled fast
enough to avoid crystallization does not settle into an ordered ground
state; its viscosity rises by ten to fifteen orders of magnitude over a
modest temperature window and it falls out of equilibrium at the glass
transition temperature `T_g`, freezing into an amorphous solid whose
static structure is barely distinguishable from the liquid it came from.
What actually happens at `T_g` — whether it marks a genuine underlying phase
transition or is purely a kinetic artifact of falling out of equilibrium on
laboratory timescales — is the field's open question
[@berthier-biroli2011].

Two broad families of theory answer it differently:

- **Random first-order transition theory (RFOT)** [@kirkpatrick-thirumalai-wolynes1989]
  holds that an underlying thermodynamic transition exists: a rugged
  free-energy landscape with an exponentially large number of metastable
  "inherent structures," a configurational entropy that shrinks as the
  system is cooled, and a genuine (if experimentally inaccessible) **Kauzmann
  temperature** `T_K < T_g` where the configurational entropy would
  extrapolate to zero — an ideal-glass singularity that the real,
  kinetically-arrested transition at `T_g` merely precedes and hides.
- **Dynamical facilitation theory** [@garrahan-chandler2002], developed
  further the following year (Garrahan & Chandler 2003), denies any such
  singularity: glassiness is a purely dynamic, kinetic phenomenon — dynamic
  heterogeneity (spatially and temporally correlated regions of fast and
  slow relaxation) arising from **kinetically constrained models (KCMs)**,
  lattice models with a trivial (often non-interacting) equilibrium measure
  but constrained transitions, where a site may relax only when a
  facilitation condition on its neighbors is met.

The KCM literature itself is not one model but a family, surveyed at
length in [@ritort-sollich2003]:

- The **Fredrickson–Andersen (FA) model** [@fredrickson-andersen1984] — the
  archetypal KCM, a kinetic Ising model where a spin may flip only if at
  least a threshold number of its neighbors are already in the mobile
  (excited) state.
- The **East model** (Jäckle & Eisinger 1991, not separately carried here)
  — a one-dimensional, strongly asymmetric KCM where a site may flip only
  if its single left neighbor is mobile, producing hierarchical relaxation
  whose relaxation time obeys a **parabolic law** in inverse temperature
  [@elmatad-chandler-garrahan2009], derived from a hierarchical
  coarsening argument over nested length and time scales
  [@sollich-evans1999].
- The **Spiral Model** [@toninelli-biroli-fisher2006] — a two-dimensional
  KCM in the same family that, unlike FA and East, has a genuine sharp
  **jamming transition**: above a critical density of permanently blocked
  ("unfacilitatable") sites, a positive fraction of the lattice freezes
  irreversibly, in the universality class of directed site percolation
  (`p_c^DP ≈ 0.705`).

Distinct from the KCM literature but sharing its combinatorial shape is
**bootstrap percolation** [@chalupa-leath-reich1979]: on a lattice, seed a
random subset of sites active, then repeatedly activate any site with at
least `r` already-active neighbors (the "threshold-`r`" rule) until no
further site can activate. Holroyd proved the sharp finite-size threshold
for two-dimensional threshold-2 bootstrap percolation on an `L × L` grid,
`p_c(L) ~ π² / (18 ln L)` [@holroyd2003] — the density above which the whole
lattice activates with probability tending to 1 as `L → ∞`, converging to
that limit only logarithmically slowly. Bootstrap percolation is not itself
a glass model — it seeds *activity*, not blockage, and has no facilitation
constraint that can leave a genuinely frozen residual — but it is the
purely combinatorial ancestor of the same closure-under-a-neighbor-rule
mechanism the Spiral Model uses to produce jamming, and is a useful control
case precisely because its own known threshold behavior is independently
proven.

## 2. What the house Lean proves today, and what it does not

The house's glass line lives in
`Obsmetrologia/AperiodicOrder/GlassDynamics/` and
`Obsmetrologia/AperiodicOrder/Crystal/Glass.lean`, in the Obsmetrologia
proof tree at
`lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/`.
Four modules carry the finite skeleton:

- **`AperiodicOrder/GlassDynamics/KCM.lean`** — the deterministic
  **facilitation closure**. `activateStep sites fac a x = a x ∨ ∃ y ∈
  sites. a y ∧ fac y x` is the 1-place analogue of the Boolean
  transitive-closure step `CausalSets.Causal.Order.causalStep`, with a
  facilitation graph in place of causal links. It is proved inflationary
  (`activateStep_infl`) and monotone (`activateStep_mono`) — a genuine
  closure step — and any seed-extending, facilitation-closed field is a
  fixed point (`activateStep_fixed`). `ActiveClosure`, an inductive
  reachability relation, is proved to be exactly this closure
  (`activation_is_facilitation_closure`): the deterministic activation
  settling equals the facilitation closure of the seed. The module's own
  header states its scope precisely: "the stochastic KCM (Fredrickson–Andersen,
  East) and its glassy relaxation need probability and are out of this
  dependency-free core; the deterministic facilitation skeleton is in it."
- **`AperiodicOrder/GlassDynamics/Basin.lean`** — a basin-graph reading of
  metastable-state landscape theory: basins with `Nat`-valued energy, a
  `Descends` relation for strictly energy-lowering transitions, and
  `no_descending_cycle`, the finite combinatorial H-theorem that a
  strictly descending dynamics cannot cycle back to its start.
- **`AperiodicOrder/GlassDynamics/Overlap.lean`** and
  **`Heterogeneity.lean`** — finite counts. `overlapCount` is the
  Hamming-similarity count between two configurations (the finite
  projection of the spin-glass replica overlap `q`); `mobilityCount`,
  built on it, is the count of sites that changed (the finite projection of
  the local mobility field whose four-point correlations define dynamic
  heterogeneity's `χ₄`).
- **`AperiodicOrder/Crystal/Glass.lean`** — the projection bundle. `Glass`
  packages quasicrystal support together with the four finite diagnostics
  above and a lifted thermodynamic-temperature bridge, and proves, in the
  module's own words, "projection theorems from that bundle. They do not
  identify glass with the analytic Parisi layer; they prove that a glass
  phase retains the already-built finite skeleton and the stationary-temperature
  bridge."

Every one of these theorems is about a **finite, deterministic, rate-free**
object. None of them touches: transition rates or probabilities (the actual
stochastic KCM dynamics), the analytic Parisi mean-field spin-glass free
energy, RFOT's configurational entropy or Kauzmann temperature, or
mode-coupling theory's density-correlator equations. This is not an
oversight the note is here to paper over; it is exactly the grading the
house's own frontier memo gives this territory. Its detailed mapping table
(§10) rates "KCM facilitation" as **Horizon** — "causal closure and graph
reachability" is the repo hook, "deterministic KCM projection" the
proof-agent target — and rates "RFOT/MCT" as **Not visible**, with the flat
instruction "do not overclaim." `KCM.lean` and its siblings *realize* that
Horizon-graded target (Docket H of the same memo: `activateStep_infl`,
`activateStep_mono`, and a reachability theorem, all present and proved).
They do not, and were never claimed to, reach RFOT or MCT. The deterministic
facilitation closure is the KCM literature's *rule* with its *rate* deleted:
it tells you what a seed of active sites eventually activates, not how long
that takes or with what probability, and it is silent on whether any
residual stays forever frozen once the rate is restored.

## 3. Status of the framing and evidence

The placement of glass on a house regime is a hypothesis, not an established
result. The available theoretical framing of physical phenomena includes
extrapolations that are not recoverable to specific source records. This
section grades every carrier used in §2 and every hypothesis in §5 by direct
inspection of the carrier text rather than by reputation.

The older `source-snapshot: 2026-08-17-windows-561-group` material, with its
triage-site source path, is salvaged draft content rather than a reviewed
carrier. It presents four regimes as spacetime fields, forced inflation rates
as n-bonacci Perron–Frobenius eigenvalues, three-dimensional space as a
golden-ratio icosahedral quasicrystal, and the Hubble tension as stages of one
spiral. The mathematical prose is confident and precise, but the claims lack
inline references to the specific proved Lean theorems they require. They are
therefore unverified framing extrapolations, several steps removed from
checkable evidence.

Nothing in this note's kinetic-rung hypothesis depends on that older framing
being established. The measurements and stated falsifiers determine the
hypothesis's status; stronger evidence may change that status, and the note
should then be revised in place.

## 4. The measurement

The 2026-09-04 deterministic facilitation-closure measurement
(`data/records/2026-09-04-facilitation-closure-measurement.json`, this
section) instantiates `activateStep` as three monotone facilitation
predicates on finite tori/rings and runs the closure to a fixed point (or a
200,000-stage budget, `maxStagesPerCell`) from Bernoulli(`p`) active-site
seeds, four seeds per cell, `L ∈ {32, 64, 128, 256}`. It reads the closure's
own **stage count** — how many synchronous `activateStep` rounds elapse
before the field stops changing — as the finite stand-in for a relaxation
time, and the **frozen fraction** (sites still inactive at the fixed point)
as the finite stand-in for a jammed residual. Neither quantity has units or
a probability distribution attached; they are exactly what the deterministic
closure can report, per §2 above.

**Bootstrap percolation, threshold 2** (`bootstrap2`; site facilitated iff
≥ 2 of its 4 von Neumann neighbours are active; Chalupa, Leath & Reich
1979; Holroyd 2003). At `L = 256`, the smallest tested density already sat
well inside the frozen regime: `p = 0.02` gave mean frozen fraction
`0.9770469665527344`. Mean frozen fraction fell to `0.9314918518066406` at
`p = 0.04` and dropped to `0` at `p = 0.06` — so the true finite-size
crossing lies between the grid's `p = 0.04` and `p = 0.06` points, below the
tested grid's own lower bound of coverage for the transition itself. Stage
counts stayed small relative to the 200,000-stage budget: the largest
number of stages observed anywhere in the `bootstrap2` grid was `392`, at
`L = 128`, `p = 0.04` — not at `L = 256`, `p = 0.06`, the location this
note's own commissioning brief named; the record itself, read directly,
places the maximum at the smaller lattice near the threshold, consistent
with the largest stage counts clustering close to a not-yet-fully-resolved
transition rather than growing monotonically with `L`. Evaluating
Holroyd's own asymptotic formula, `p_c(L) ~ π² / (18 ln L)`, at `L = 256`
places the asymptotic threshold above the whole tested grid's crossing
region — plausibly the well-known slow logarithmic convergence of the
sharp threshold at finite `L`, not a rule defect, and worth a
larger-seed-count confirmation before leaning on this instrument for a
quantitative bootstrap-percolation claim.

**The Spiral Model** (`spiral`; site facilitated iff (NE both active OR SW
both active) AND (NW both active OR SE both active), the verified
diagonal-pair rule of Biroli & Toninelli, arXiv:0709.0583 §2 — not the
naive four-neighbour pairing a "widely stated form" fallback would have
given; Toninelli, Biroli & Fisher 2006). The record's spiral grid is
densities `p ∈ {0.2, 0.25, 0.27, 0.28, 0.29, 0.295, 0.3, 0.31, 0.32,
0.35, 0.4, 0.45}` in the measurement's own active-site-density units; the
record states its own conversion directly: arXiv:0709.0583's `p_c^DP ≈
0.705` is defined on occupied (blocked) density, so in active-density
units the transition sits at `1 − 0.705 = 0.295` — a density the grid
names explicitly as one of its points, straddling the transition rather
than sitting to one side of it. At `L = 256`, mean frozen fraction runs
`0.7846755981445312` (`p = 0.2`), `0.7058448791503906` (`p = 0.25`),
`0.6701850891113281` (`p = 0.27`), `0.5859718322753906` (`p = 0.28`),
`0.5294914245605469` (`p = 0.29`), `0.5175819396972656` (`p = 0.295`),
`0.46091461181640625` (`p = 0.3`), `0.10321044921875` (`p = 0.31`), and
`0` from `p = 0.32` through `p = 0.45` — a sharp drop concentrated almost
entirely between `p = 0.3` and `p = 0.32`, close to the grid's own named
transition point. The record's own reading confirms this directly:
`firstDensityAboveFrozenFraction0_5AtLargestL = 0.2` and
`firstDensityBelowFrozenFraction0_5AtLargestL = 0.3` at `L = 256`. At
`L = 128` the crossing is present but noisier — `0.7816619873046875`
(`p = 0.2`) down to `0.6181488037109375` (`p = 0.29`), a dip to
`0.3708038330078125` at exactly `p = 0.295`, back up to
`0.5686798095703125` at `p = 0.3`, then `0.271942138671875` (`p = 0.31`),
`0.122406005859375` (`p = 0.32`), and `0` from `p = 0.35` — the same
four-seed noise visible elsewhere in this measurement, not a different
mechanism. **This is the first grid in this measurement that directly
observes the sharp frozen-fraction transition the literature predicts,**
rather than sitting entirely on one side of it. The largest stage count
observed anywhere in the whole `spiral` grid is `1153`, still well inside
the 200,000-stage budget (`anyCellExhausted` false).

**The East model skeleton** (`east`; 1D, ring of `L` sites, site
facilitated iff its left neighbour is active; Sollich & Evans 1999 — the
model's actual glassiness lives in its stochastic rates, not this closure).
This is the note's negative control. No density in the tested grid produced
a mean frozen fraction above `0` at `L = 256`. A nonzero mean frozen
fraction did appear at small `L` and small `p` — e.g. `L = 32`, `p = 0.01`
gave mean frozen fraction `0.75`, mean stage count `7.75` — but this comes
entirely from **trivial all-inactive seed draws** (a Bernoulli(`0.01`) seed
on 32 sites has a non-negligible chance of drawing zero active sites, which
the closure correctly leaves entirely frozen forever, since nothing exists
to facilitate from) rather than from any dynamical freezing mechanism. At
`L = 256`, `p = 0.01`, mean frozen fraction fell to `0.25` and mean stage
count rose to `129.25`, with the largest stage count observed anywhere in
the `east` grid at `255` (`L = 256`, `p = 0.01`) — growth entirely
attributable to the finite-`L` all-inactive-seed artifact shrinking as `L`
grows, not to a real frozen residual. The East model's own glassiness is
invisible to the deterministic facilitation closure. This is exactly what
§2 predicts: East's slow relaxation is a property of its stochastic rates
(the hierarchical, hard-to-facilitate cascade Sollich & Evans derive), not
of what its facilitation closure eventually reaches from a seed — and the
deterministic closure, having no rates, cannot see it. §5 below states
plainly why this negative control, while consistent with H1, is not by
itself evidence *for* H1's specific mechanism.

**Does `κ_L` grow with `L` at the Spiral transition?** At the grid's own
named transition point, `p = 0.295`, mean stage count runs `17.25`
(`L = 32`), `36.25` (`L = 64`), `400.5` (`L = 128`), `348` (`L = 256`) —
the record's own `kappaLGrowthNearTransition` field, which reports
`nonDecreasingAcrossSizes: false`. Read plainly: this is a strong rise
across the first three sizes — more than a tenfold jump from `L = 64` to
`L = 128` — followed by a dip at the fourth. It is a mixed finite-size
signal, not a clean diverging-length-scale signature, and with only four
seeds per cell the `L = 128` → `L = 256` dip is at least as consistent
with sampling noise as with a genuine plateau — the same four-seed noise
already visible in the frozen-fraction values immediately above (e.g.
`L = 128`'s own non-monotonic frozen fraction at `p = 0.295`). §5 reads
this result against Hypothesis H1 directly; §7 names the larger-seed,
larger-`L` rerun that would resolve whether the dip is noise or a genuine
plateau.

## 5. Hypothesis H1: what would place glass on the kinetic rung, and what the measurement says about it

Per §3's provenance grading, nothing below is a premise. It is a hypothesis
this note poses and §4's measurement is read against — honestly, including
where the measurement does not yet decide it.

**H1.** *Spiral-Model jamming is a Scott-continuity failure of the
facilitation closure at the infinite-lattice limit* — i.e., jamming sits on
the kinetic (aperiodic) rung of the house's regime ladder, carrying a
non-zero `H¹` residual, rather than being an ordinary finite-regime
crossover that the closure formalism simply has no different way to
describe.

The house's own regime ladder gives H1 a precise shape to test:
`Obsmetrologia.Closure.Regime.classify` sorts a closure problem's ordinal
`κ` into exactly one of four regimes by three decidable flags
(Scott-continuity, finite base, countable cofinality —
`four_regime_dichotomy` proves the four mutually exclusive and jointly
exhaustive), and `cohomologyVanishes_iff` proves settling cohomology `H¹`
vanishes exactly in the strict (`κ < ω`) and Scott (`κ = ω`) regimes and is
non-zero in the transfinite-bounded and aperiodic regimes above them — all
in `Obsmetrologia/Closure/Regime.lean`. A finite `L × L` bootstrap-percolation
or Spiral-Model closure is, trivially, always in the strict/finite regime
(`H¹ = 0`, by `fin_scott`/`fin_cof` and `cohomologyVanishes_iff`) —
**regardless of whether H1 is true or false in nature**: the measurement in
§4 necessarily sees every finite cell reach a fixed point, whether or not a
frozen residual survives. What `Regime.lean` actually sorts, and what H1 is
a claim about, is the **family** of closures as `L → ∞`: below the jamming
density, does the infinite-lattice limit of `activateStep`'s finite fixed
points stay Scott-continuous (a countable, `ω`-indexed directed join of the
finite fixed points reaches the infinite one, `κ = ω`, `H¹ = 0`), while
above it the limit fails to commute with the join — a discontinuous firing
exactly at the limit stage, the same shape
`KineticTheory.Plasma.ReconnectionCurvature`'s `IsNSC` already formalizes
for magnetic reconnection (a `FieldLineFlow` update failing to commute with
its history's limiting join, proved by
`reconnection_event_implies_H1_nonzero` to force `cohomologyVanishes =
false`, and forbidden in the flat regime by
`flat_regime_forbids_reconnection_event`)? If H1 holds, a jamming transition
is the facilitation-closure analogue of a reconnection event: a
non-Scott-continuous firing at the infinite-lattice limit, carrying a
non-zero `H¹` residual that no finite truncation — however large — can
itself exhibit, because every finite truncation is forced into the
strict/Scott regime by construction. If H1 fails, no such limiting
discontinuity exists, and jamming is an ordinary finite-regime phenomenon
this note's regime-ladder framing simply has no distinctive place for.

**What §4's measurement actually says about H1: consistent, not decisive.**
The spiral grid (§4) directly observes what H1 requires to even be a live
question: a sharp frozen-fraction transition at finite `L`, crossing `0.5`
within a narrow band (between `p = 0.3` and `p = 0.32` at `L = 256`)
close to the grid's own named transition point `p = 0.295`. That a sharp
finite-size transition exists at all is necessary for H1 but does not
settle it — every one of `Regime.lean`'s four regimes admits sharp
finite-size crossovers; what distinguishes H1 specifically is the
*limiting* behavior of `κ_L` as `L → ∞`, and there the data is genuinely
mixed: a strong, more-than-tenfold rise in mean stage count from `L = 64`
to `L = 128` at the transition density (`36.25 → 400.5`), the kind of
growth H1 predicts, followed by a dip at `L = 256` (`400.5 → 348`), which
a clean divergence would not show. With four seeds per cell, this dip is
at least as consistent with sampling noise as with a genuine plateau.
**The measurement, honestly read, neither confirms nor refutes H1: it is
the first grid that could, and the signal it returns is inconclusive at
the size and seed count tested.** A larger-seed, larger-`L` rerun (§7) is
what would move this from suggestive to decisive in either direction.

**Reading the East negative control the same way, not as confirmation.**
East showing no frozen residual anywhere in its grid (§4) is *consistent*
with H1 — East has no jamming transition in the literature, and H1 predicts
no regime-crossing discontinuity where there is no jamming to begin with —
but it is not evidence *for* H1's specific mechanism, for two reasons
stated plainly: (1) every finite closure, East's included, is forced into
the strict/Scott regime by `fin_scott`/`fin_cof` regardless of whether H1
is true anywhere, so a finite-`L` null result cannot distinguish "H1 is
correct and East has no limiting discontinuity because it has no jamming"
from "no such limiting-discontinuity phenomenon exists in nature at all,
and the whole regime-ladder reading is the wrong frame"; (2) a real,
well-documented glassy slowdown does occur in the East model
experimentally-analogous sense (the parabolic law, §1) with no jamming and
no frozen residual at all, which is exactly why §5's separate reading
(below) places that slowdown outside the closure entirely, in a rate layer
H1 does not speak to either way.

Separately from H1 — and not tested by the deterministic instrument at all,
by construction, per §2 — kinetically constrained models are read, in this
house, as **acknowledgement-gated dynamics**: a site may move only when a
neighbour is mobile, only when that neighbour has, in effect, been
*acknowledged* as a source of facilitation. The East model's hierarchical
relaxation [@sollich-evans1999] is read as a **nested facilitation chain**:
to mobilize a site at hierarchy level `n`, a facilitating neighbour must
first itself have been mobilized, which required its own facilitating
neighbour, and so on — a chain of nested acknowledgements whose depth is
what the parabolic relaxation law [@elmatad-chandler-garrahan2009] is a law
*about*. This reading is inference, not a formalized correspondence and not
a claim §4's instrument can bear on either way (it has no rates); §8 below
states what would be needed to formalize it. On this reading, the house
Lean locus for the glass transition proper is not `KCM.lean` at all, but
`Obsmetrologia/Cohomology/AttentionAllocation.lean`: a bounded agent with a
finite attention budget `B`, many `Obstruction`s each carrying a
reconciliation `cost` and a `benefit`, where selecting an obstruction
consumes budget monotonically and irreversibly (`cost_monotone_cons`,
`feasible_of_cons`) and residual held-`⊤` is antitone in captured benefit
(`residual_antitone`). Read as facilitation: each site waiting to be
acknowledged is an `Obstruction`; its `cost` is the attention (the rate) it
takes to acknowledge the facilitating neighbour; the *budget* `B` is the
system's total attention allocation per unit time. The East model's
parabolic law, on this reading, states how that per-acknowledgement cost
compounds with nested chain depth — restating Sollich & Evans's own
hierarchical argument [@sollich-evans1999] in the attention-budget
vocabulary, not superseding it.

**The falsifiable structural claim this translation adds, that did not
exist in either the KCM literature or the house Lean before this note:** if
H1 holds, the glass transition and the jamming transition are not the same
phenomenon read twice, but two different mathematical events in the regime
ladder — jamming a Scott-continuity failure of the (rate-free) facilitation
closure at the infinite-lattice limit (a `κ`-regime boundary crossing,
structural), the glass transition a rate phenomenon in the
attention-allocation budget over facilitation chains (a cost-schedule
divergence, not a `κ`-regime crossing at all) — with the Spiral Model the
special KCM where these two events would coincide (its jamming *is*
dynamically sharp), and the East and FA models the KCMs where they would
not (no `κ`-regime crossing at any finite density, per §4's negative
control, yet a real, experimentally documented glassy slowdown occurring
anyway, entirely in the rate/budget layer). This claim's *first* half — H1
itself — is exactly what §7's rerun would test; its second half (the rate
placement) is not decidable by any deterministic instrument regardless of
how that rerun comes out, and needs the stochastic instrument named in §7.

## 6. Falsifiers

Three placements are made above, and each has a stated way to be wrong —
including H1 itself, by this note's own instrument.

**Against H1: jamming's closure behaving as Scott, not kinetic, at the
limit.** §4's own `kappaLGrowthNearTransition` reading — `17.25 → 36.25 →
400.5 → 348` across `L = 32, 64, 128, 256` at the grid's named transition
density `p = 0.295` — is exactly the kind of result this falsifier is
about, and on four seeds it does not yet decide it either way: a clean,
sustained refutation of H1 would show `κ_L` **staying bounded** in `L` all
the way out, with the frozen residual recognized already at some finite
stage rather than growing toward the limit; a clean confirmation would
show `κ_L` growing without bound as `L` grows. The recorded signal — a
strong rise then a dip, on four seeds — is neither. **If a larger-seed,
larger-`L` rerun (§7) confirms the dip (`κ_L` plateaus or falls as `L`
grows further), H1 is refuted for jamming by this note's own instrument**
— a result, not a failure: it would say jamming is an ordinary
finite/Scott-regime phenomenon, and the kinetic-rung placement in §5 is
wrong for it specifically, whatever the provenance of the framing that
suggested it. If instead the rise continues (`κ_L` keeps growing, the
`L = 256` dip revealed as seed noise), that is consistent with H1, though
still not a proof.

**Against placing the glass transition (as opposed to jamming) on the
kinetic rung at all** — i.e. against the rate-layer half of §5's claim:
a rigorously *proved* thermodynamic ideal-glass singularity — a genuine
Kauzmann-temperature phase transition, `T_K > 0`, established for a
concrete finite-dimensional statistical-mechanical model, not merely
consistent-with-RFOT numerical extrapolation — would refute reading glass
as a rate phenomenon over a settled closure and would instead place it in
the causal or thermodynamic regime as an ordinary equilibrium phase
transition whose *approach* merely looks kinetic. RFOT's own configurational-entropy
extrapolations to `T_K` are suggestive but are exactly the kind of claim
the frontier memo's "do not overclaim" instruction (§2 above) forbids
treating as settled; a proof, not a fit, is the falsifier.

**Against the framing itself, independent of any measurement:** the
provenance grading is falsifiable by better evidence. If a source record
demonstrates that the regime-ladder-as-nature reading, or specifically the
placement of glass or jamming within it, is supported by a considered
argument rather than extrapolation, this section should be revised in place
to reflect that evidence.

## 7. The next instruments

Two next steps, distinguished by what each can and cannot settle.

**Immediate, and the direct test of H1: a larger-seed, larger-`L` rerun at
the transition.** No new density range is needed — the grid already
straddles the transition (§4) at `p = 0.295`, matching the instrument
lot's own earlier stated goal of a grid spanning roughly active density
0.20–0.45 "to actually straddle the Spiral Model's true jamming transition
and observe the discontinuous frozen-fraction jump and diverging
kappa_L." What remains inconclusive is `κ_L`'s behavior at that density:
four seeds and `L` up to `256` give a strong `L = 64 → L = 128` rise
(`36.25 → 400.5`) followed by an `L = 128 → L = 256` dip (`400.5 → 348`)
that four seeds cannot distinguish from noise. The next measurement is the
same instrument, same seeded `splitmix32` generator, run with
substantially more seeds per cell (tens rather than four) and at least one
larger `L` (`512` or `1024`, budget permitting under the existing
200,000-stage cap), concentrated on the narrow band `p ∈ [0.28, 0.32]`
where §4 finds the crossing. This is the rerun §6 names as H1's own test:
a confirmed, noise-resistant divergence in `κ_L` as `L` grows is
consistent with H1; a confirmed plateau or decline refutes it for
jamming.

**Harder, and needed regardless of how H1 comes out: a rate-bearing
instrument for the glass-transition-proper claim.** The deterministic
facilitation closure cannot, by construction, see rates — §2 states this as
the skeleton's own declared scope, and §4's East-model negative control
confirms it empirically. Testing §5's rate-layer reading requires an
instrument with rates restored: a **stochastic KCM run** whose facilitation
events are timestamped rather than simply counted, so that each site's
first-acknowledgement time can be read off directly, and whose total
acknowledgement throughput per unit time is bounded by an explicit budget —
the attention-allocation model of
`Obsmetrologia/Cohomology/AttentionAllocation.lean`, `totalCost`,
`totalBenefit`, `Feasible`, applied with each pending facilitation as an
`Obstruction`. Concretely: run the same three models (bootstrap2, Spiral,
East) with a genuine stochastic clock — each currently-facilitatable site
acknowledged (flipped active) at rate 1, in continuous or discretized time
— count acknowledgement events as **ACKs**, and read the East model's
parabolic-law exponent directly off the ACK-count-versus-`1/T` curve rather
than off a proxy stage count, to test whether it matches the
nested-chain-depth reading of §5 against Sollich & Evans's own hierarchical
prediction [@sollich-evans1999] and against the corresponding-states
parabolic fits of Elmatad, Chandler & Garrahan
[@elmatad-chandler-garrahan2009]. This is a genuinely new instrument, not a
rerun of §4's grid with more points; it needs a seeded stochastic clock
(the replay ethic still applies — a recorded seed, not `Math.random`) and a
new record shape carrying ACK timestamps rather than stage counts.

## 8. Lean targets

Stated as theorem claims in prose, not code, each explicitly a target for
future proof work, not a claim about what is proved today:

1. **A regime-boundary theorem bridging `KCM.lean` and `Regime.lean`** —
   the formal statement of H1 itself, not H1's confirmation. For an
   infinite family of finite facilitation closures (the `L × L` tori of
   §4, `L → ∞`) sharing one facilitation rule and one seed density `p`,
   the family's infinite-lattice closure ordinal `κ(p)` equals `ω` (Scott
   regime, `H¹ = 0`) for `p` below the family's jamming density and jumps
   to the aperiodic regime (`κ ≥ ω₁`, `H¹ ≠ 0`, `cohomologyVanishes_iff`)
   at or above it — the facilitation-closure analogue of
   `reconnection_event_implies_H1_nonzero` and
   `flat_regime_forbids_reconnection_event` in
   `KineticTheory/Plasma/ReconnectionCurvature.lean`, with `IsNSC`'s role
   played by the finite fixed points' failure to directedly join to the
   infinite one. Proving this theorem does not prove H1 true of any real
   glass former; it would prove H1's *mathematical content* is coherent,
   which today it is not yet even stated as a theorem.
2. **An acknowledgement-cost theorem in `AttentionAllocation.lean`.** For a
   facilitation chain of nested depth `d` (§5's reading of East-model
   hierarchical relaxation), the minimum feasible attention budget `B(d)`
   needed to acknowledge the chain (under `Feasible`, `totalCost`) is
   monotone increasing in `d` (an immediate consequence of
   `cost_monotone_cons`), and — the frontier target, not yet formalized —
   its growth rate, fit against the stochastic instrument of §7, equals the
   parabolic law's exponent expressed in acknowledgement-count terms.
3. **A negative-control theorem for `East` and `FA`.** For any finite seed
   density `p > 0` on a ring or lattice, the East-model and FA-model
   facilitation closures (as instantiated in §4) reach a fixed point with
   frozen fraction `0` in the infinite-`L` limit — formalizing §4's
   empirical finding that the observed nonzero frozen fractions at finite
   `L` are entirely an all-inactive-seed artifact vanishing as `L → ∞`,
   the Lean statement of "the East model has no genuine frozen residual."

Per the frontier memo's own discipline (§9, "do not overclaim"): none of
these three are claimed proved by this note. `KCM.lean`, `Basin.lean`,
`Overlap.lean`, `Heterogeneity.lean`, and `Crystal/Glass.lean` are the
Horizon-graded territory realized today; the theorems above are the
proof-agent docket this note adds to it, named honestly as targets, not
results — and, per §3, even a proved target-1 theorem would certify H1's
mathematical coherence, not its physical truth.

## See also

- The measurement this note reads:
  `data/records/2026-09-04-facilitation-closure-measurement.json`, this
  section.
- [Kinetic existence](../../../../../../../../../../../../content/text/glossary/terms/kinetic-existence.md)
  — the regime §5's Hypothesis H1 places jamming into, and §3 grades the
  provenance of.
- [The four regimes of natural existence](../../../../../../../../../../../../content/text/glossary/topics/four-regimes-of-natural-existence.md)
  — the regime ladder `Regime.lean` proves, §5 applies as a hypothesis, and
  §3 reads for its own stated provenance ("session ruling, this section,
  2026-09-03").
- [Magnetic reconnection](../../../../../../glossary/terms/magnetic-reconnection.md)
  — this section's own exemplar of a non-Scott-continuous firing forcing
  `H¹ ≠ 0`, the structural pattern H1 reads jamming into.
- [The regrounding program](../../../../../../../../../../../../../../content/text/documents/articles/notes/2026/08/21/2026-08-21-the-regrounding-program.md)
  — the discipline this note is written under.
