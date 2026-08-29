---
title: "Failure-Math: Defects, Blowups, Curvature, Cohomology, and Free-Energy Descent in RelMath"
description: "A research note proposing failure-math as the next formal layer of RelMath: a theory in which failure is positive mathematical structure — local bilattice increment, free-energy drop, curvature event, H¹ generator — with the core theorems 'failure mass = free-energy drop' and 'Scott defect = curvature event = H¹ generator.'"
date-created: 2026-06-22
keywords: ["bilattice", "cohomology", "curvature", "failure-math", "free-energy", "H1", "relmath", "research-note", "sheaf", "Tarski-Laplacian"]
---

# Failure-Math: Defects, Blowups, Curvature, Cohomology, and Free-Energy Descent in RelMath

## Abstract

This note proposes **failure-math** as the next coherent layer of RelMath: a formal theory in which failure is not treated as an external defect, contradiction, exception, or error condition, but as the **positive mathematical structure of a nontrivial comparison**. In the current Lean development, the ingredients already exist in separate files: non-Scott-continuous firing as failure of directed-join commutation, firing blowup as a nonidentity local comparison arrow, local blowup data as a complete invariant, curvature regime as nonvanishing `H¹`, paraconsistent sheaf splitting as a truth/inconsistency decomposition, and free-energy deficit as a Lyapunov potential consumed by firings. The next step is to make these one object-language: **a failure is a classified local bilattice increment whose cohomological, geometric, and thermodynamic projections are related by theorems**.

The proposed core theorem is:

```text id="cppgcl"
failure mass = free-energy drop
```

for finite supported monotone firings, and the proposed transfinite extension is:

```text id="gjfeen"
Scott defect = curvature event = H¹ generator
```

for non-Scott-continuous settling. Together these give a mathematical slogan that is not merely poetic:

```text id="urz0u9"
local failure is nonidentity;
finite failure is energy descent;
transfinite failure is curvature/cohomology.
```

## 1. Where this sits relative to existing sheaf/Laplacian literature

The adjacent public literature already contains several powerful ingredients. Hansen and Ghrist’s spectral sheaf program lifts graph Laplacian methods to cellular sheaves and relates Hodge Laplacians, spectra, sheaf cohomology, and cell structure. ([arxiv.org](https://arxiv.org/abs/1808.01513?utm_source=chatgpt.com)) Hansen and Ghrist’s discourse sheaves develop sheaf Laplacians and diffusion dynamics for opinion and communication over networks, including selective opinion modulation and lying. ([arxiv.org](https://arxiv.org/abs/2005.12798?utm_source=chatgpt.com)) Ghrist and Riess’s Tarski Laplacian develops a lattice-valued sheaf Hodge theory in which fixed points of a Tarski Laplacian recover degree-zero global-section behavior. ([arxiv.org](https://arxiv.org/abs/2007.04099?utm_source=chatgpt.com)) Recent distributed-systems sheaf work uses cellular sheaves to characterize task solvability, with global sections representing terminating solutions and cohomology encoding obstructions to solution. ([arxiv.org](https://arxiv.org/abs/2503.02556?utm_source=chatgpt.com))

RelMath’s failure-math should not claim novelty by pretending those ingredients are absent. The novelty is the **direction of generation**. The sheaf, obstruction, Laplacian, and curvature are not placed over an externally given network merely to analyze consistency. They are produced by the settling process itself. `SettlingAssociatedSheaf` explicitly models `F_U` as the free `ℤ`-module on newly designated truth cells, then builds the paraconsistent Belnap-designated sheaf and the inconsistency-only cokernel; the masks split as `dK = dT ∨ dTop`, with `dT` and `dTop` disjoint. fileciteturn46file0L29-L38

That is the frontier seam: **failure is not merely detected by cohomology; failure is generated as a settling event, localized as a blowup, measured as free-energy descent, and globalized as cohomology/curvature when it cannot be killed by gluing.**

## 2. The governing idea: failure as nonidentity comparison

The primitive conceptual move is:

```text id="96r622"
failure ≠ absence of success
failure = nonidentity of a canonical comparison
```

A comparison has two sides:

```text id="lhmwyd"
expected : A
actual   : A
```

A failure is the condition:

```text id="qkoz9u"
actual ≠ expected
```

But RelMath almost never wants raw inequality alone. It wants comparison with structure. So the first useful distinction is:

```text id="vyatru"
OrderedFailure(A, ≤) :
  expected ≤ actual
  actual ≠ expected
```

versus

```text id="jrwymr"
CommutationFailure :
  F(sup S) ≠ sup(F S)
```

These are different species of failure.

An **ordered failure** is a monotone jump: the system has gained information. A **commutation failure** is a coherence defect: two structurally expected routes disagree. The current Lean development already separates these without naming them that way. `FiringBlowup` models a firing as a predecessor-to-actual comparison in the knowledge order, while `NonScottContinuousFiring` models NSC firing as failure of the Scott equation `op (sup S.elems) ≠ sup (S.elems.map op)`. fileciteturn62file0L79-L91 fileciteturn61file0L83-L91

So failure-math begins with two primitive definitions:

```text id="8qbw3c"
JumpDefect:
  before ≤ₖ after
  before ≠ after

ScottDefect:
  op(⋁ S) ≠ ⋁ op(S)
```

Jump-defect is local and energetic. Scott-defect is transfinite/coherence-theoretic and curvature-producing.

## 3. Existing formal footholds in RelMath

The repo already has most of the needed machinery.

First, `NonScottContinuousFiring` defines NSC firing as failure of closure to commute with the join of prior stages: the closure applied after taking the join differs from the join of closures. The file’s prose reads this as the closure producing cells not obtainable as filtered colimits of earlier stages, with each NSC firing contributing a generator to transfinite-bounded or aperiodic `H¹`. fileciteturn61file0L18-L28

Second, `FiringBlowup` defines the local firing blowup. A firing compares the predecessor value `v^{→μ}` with the actual value `v_μ`; the blowup is the arrow-category object `(predecessor, actual)`, trivial exactly when source and target coincide, nontrivial exactly when some cell genuinely increments. fileciteturn62file0L10-L19 fileciteturn62file0L93-L105

Third, `BlowupClassification` extracts local data from a firing: incidence pattern, firing-type function, and consistency-failure source. It proves the local data is complete: same predecessor plus same firing type reconstructs the actual value, hence determines the blowup. fileciteturn65file0L18-L45 fileciteturn66file0L28-L60

Fourth, `ClosureFlowCurvatureRegime` identifies flat regimes with strict/Scott regimes and curved regimes with transfinite-bounded/aperiodic regimes. It explicitly states the dictionary: flat iff Scott-continuity iff `H¹ = 0`; curvature events are NSC firings; the curvature module is `H¹`; and `rank H¹` counts NSC curvature events, with finite/transfinite scoping handled by `Option Nat`. fileciteturn63file0L19-L23 fileciteturn63file0L60-L65

Fifth, `FreeEnergyLyapunov` gives the thermodynamic projection. It defines a knowledge-height `kHeight`, a finite-support deficit relative to a settled value, proves the deficit weakly decreases along monotone settling, and proves a strict drop when a support cell fires. fileciteturn64file0L33-L50 fileciteturn64file0L94-L118 fileciteturn64file0L128-L163

Sixth, `CRDTCohomologicalCALM` already gives one of the most important equivalence chains: `H¹ = 0`, order-independent merge, confluence, and unique settled fixed point are bundled as simultaneous readings of convergence. fileciteturn55file0L24-L44 fileciteturn55file0L128-L165

Failure-math is therefore not a new theme imposed from outside. It is a missing **unifying object-language** for proofs that already exist in separate regions.

## 4. The local periodic table of failure

The existing `FiringType` has three values:

```text id="q0roez"
tSide
fSide
top
```

This is good for the first blowup classification theorem, but it is too coarse for failure-math. The `top` case collapses three different local transitions:

```text id="xr57ie"
⊥ → ⊤
t → ⊤
f → ⊤
```

These are not the same kind of failure.

The refined local failure kinds should be:

```text id="aosdwq"
truthBirth              : ⊥ → t
falsityBirth            : ⊥ → f
contradictionBirth      : ⊥ → ⊤
truthContradicted       : t → ⊤
falsityContradicted     : f → ⊤
```

This is the **local periodic table of failure**. Each cell of a firing is either unchanged or undergoes exactly one of these five valid monotone transitions in FOUR.

The first new definition should therefore be:

```text id="0kyqph"
CellFailureKind
```

with a function:

```text id="3fvwds"
cellFailureKind : Charge → Charge → Option CellFailureKind
```

valid under the hypothesis:

```text id="bdkbvo"
before ≤ₖ after
```

The two basic theorems are:

```text id="jpxcxb"
cellFailureKind_none_iff_eq :
  before ≤ₖ after →
  cellFailureKind before after = none ↔ before = after
```

and

```text id="gbkz64"
reconstruct_failureKind :
  before ≤ₖ after →
  reconstructFailure before (cellFailureKind before after) = after
```

These mirror the existing `cellType_none_iff` and `reconstruct_cellType`, but preserve more information. The current file already proves the corresponding coarser facts for `FiringType`: `cellType` is `none` iff the cell does not fire, and `reconstruct before (cellType before after) = after` for monotone cell increments. fileciteturn65file0L105-L151

## 5. Failure pattern and failure spectrum

Once cell failure kinds exist, there are two natural invariants.

The first is the **failure pattern**:

```text id="6pyzzi"
FailurePattern := PredicationCell → Option CellFailureKind
```

This is the complete local pattern over the predication base.

The second is the **failure spectrum** over a finite support:

```text id="d7xczx"
FailureSpectrum:
  truthBirths             : Nat
  falsityBirths           : Nat
  contradictionBirths     : Nat
  truthsContradicted      : Nat
  falsitiesContradicted   : Nat
```

The pattern is local and classificatory. The spectrum is aggregated and energetic.

There should be a map:

```text id="19b649"
failurePattern before after φ =
  cellFailureKind (before φ) (after φ)
```

and a finite-support aggregator:

```text id="6luzb3"
failureSpectrum cells before after
```

defined by counting the five kinds over `cells`.

The classification theorem should be:

```text id="2848wg"
failurePattern_complete :
  before₁ = before₂ →
  failurePattern before₁ after₁ = failurePattern before₂ after₂ →
  before₁ ≤ₖ after₁ →
  before₂ ≤ₖ after₂ →
  after₁ = after₂
```

This is the refined version of `blowup_classified`. In words:

```text id="ck01ve"
same predecessor + same refined failure pattern = same blowup
```

This makes model singularities classifiable by local failure data. The existing `blowup_classified` already proves this with the coarser firing-type function. fileciteturn66file0L28-L60

## 6. Failure mass

Now the thermodynamic measurement.

Define per-cell jump height:

```text id="0l13il"
jumpHeight before after = kHeight after - kHeight before
```

Then over finite support:

```text id="q4hzf4"
jumpMass cells before after =
  Σ_{φ ∈ cells} jumpHeight (before φ) (after φ)
```

The masses of the five atomic failure kinds are:

```text id="tgukzz"
truthBirth             1
falsityBirth           1
contradictionBirth     2
truthContradicted      1
falsityContradicted    1
```

This is not decorative. It means the refined failure spectrum computes the energy consumed by the firing:

```text id="yjhzd3"
jumpMass =
  truthBirths
+ falsityBirths
+ 2 * contradictionBirths
+ truthsContradicted
+ falsitiesContradicted
```

The theorem should be:

```text id="11bxv2"
jumpMass_eq_spectrum_mass
```

In words:

```text id="bm0nhy"
the finite failure spectrum computes total jump mass
```

This is the first theorem where failure stops being “an event” and becomes a measurable quantity.

## 7. Exact energy accounting

The current Lyapunov result says the deficit decreases, and strictly decreases at a firing. The stronger theorem should be an exact balance law.

Given:

```text id="5wnntw"
before ≤ₖ after ≤ₖ settled
```

prove:

```text id="454jvc"
deficit cells before settled
=
jumpMass cells before after + deficit cells after settled
```

Name:

```text id="lj6ioe"
failure_mass_is_energy_drop
```

or:

```text id="ozqdzm"
deficit_energy_balance
```

This is the finite thermodynamic core of failure-math.

It says:

```text id="4w3vbo"
free-energy drop across a firing = total local failure mass
```

This is stronger than “firings make energy go down.” It says the energy drop is exactly accounted for by the local bilattice increments.

Then derive:

```text id="y496ad"
jumpMass_positive_iff_firesOn
```

where:

```text id="v89ph5"
FiresOn cells before after :=
  ∃ φ, φ ∈ cells ∧ before φ ≠ after φ
```

and then:

```text id="63nyoz"
strict_energy_drop_iff_firesOn :
  deficit cells after settled < deficit cells before settled
  ↔ FiresOn cells before after
```

under finite support and monotonicity hypotheses.

This gives the finite failure cube:

```text id="vds7jx"
nonidentity blowup
↔ nonempty incidence
↔ positive jump mass
↔ strict free-energy drop
```

That theorem family is the first “real” failure-math layer.

## 8. Failure cochains

The same local event has a sheaf-theoretic projection.

Define the incidence mask:

```text id="55w403"
failureMask before after φ :=
  decide (before φ ≠ after φ)
```

Define the canonical failure cochain:

```text id="6hbqou"
failureOne before after φ :=
  if failureMask before after φ then 1 else 0
```

Then prove:

```text id="f6erqw"
failureOne_support_eq_incidence
```

and over finite support:

```text id="4bkssv"
failureOne_zero_iff_no_firesOn
```

This turns the local firing into a cochain. Then the existing cohomology story can say when that cochain is merely a coboundary and when it survives as an obstruction.

Here is the useful conceptual split:

```text id="fl7wvm"
local failure = firing cochain
global failure = cohomology class
```

Or more sharply:

```text id="8eva7t"
H¹ is failure modulo local repair.
```

A failure that is a coboundary was only locally misassembled. A failure that survives in `H¹` is not removable by choosing compatible local sections.

This matches the existing `SettlingCohomologyH1` formalization: `H¹` is modeled as the Čech gluing obstruction, with cocycles as agreeing local families and coboundaries as families arising from a single global section; `h1_vanishes` proves every agreeing family glues uniquely in the vanishing case. fileciteturn50file0L35-L53 fileciteturn51file0L11-L23

## 9. Failure sheaf and splitting by kind

The designated sheaf already splits truth and inconsistency:

```text id="wktutv"
0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0
```

and this sequence splits because `dT` and `dTop` are disjoint and `dK = dT ∨ dTop`. fileciteturn49file0L8-L21

Failure-math should introduce the analogous **firing sheaf**:

```text id="hwcv92"
F_fire(μ) = ℤ^{π_μ}
```

the free `ℤ`-module on cells that fired at stage `μ`.

Then refine by failure kind:

```text id="chmoqh"
F_fire^truthBirth
F_fire^falsityBirth
F_fire^contradictionBirth
F_fire^truthContradicted
F_fire^falsityContradicted
```

The first theorem should only be Boolean:

```text id="wds3dv"
failure_masks_disjoint_union
```

The five refined masks are pairwise disjoint and their Boolean union is the incidence mask.

Then the module theorem:

```text id="cwynnd"
failure_sheaf_splits_by_kind :
  F_fire ≅
    F_truthBirth
  ⊕ F_falsityBirth
  ⊕ F_contradictionBirth
  ⊕ F_truthContradicted
  ⊕ F_falsityContradicted
```

This gives a genuine algebra of failure sectors.

The important conceptual point is that contradiction is one sector of failure, not all of it. `⊤` is failure internalized as value; `H¹` is failure externalized as obstruction; NSC is failure temporalized as noncommutation; deficit is failure measured as remaining descent.

## 10. Scott defect and curvature

The transfinite/coherence side should be named separately.

Define:

```text id="e3ockr"
ScottExpected op S := sup (S.elems.map op)
ScottActual   op S := op (sup S.elems)
ScottDefect   op S := (ScottExpected op S, ScottActual op S)
```

Then:

```text id="15mchi"
nsc_iff_scottDefect_nonidentity :
  IsNSC op S ↔ ScottActual op S ≠ ScottExpected op S
```

This theorem is tiny, but the vocabulary matters. It says NSC firing is exactly a nonidentity comparison between two ways of passing through a directed join.

Then define:

```text id="nubr8e"
CurvatureEvent op S := IsNSC op S
```

and connect it to the existing regime theorem:

```text id="gxgy3r"
curvature_event_is_scott_defect
```

and eventually:

```text id="3u66oh"
curvature_event_contributes_h1_generator
```

The current `ClosureFlowCurvatureRegime` already states the regime-level correspondence: `cohomologyVanishes r = true ↔ IsFlat r` and `cohomologyVanishes r = false ↔ IsCurved r`, with curved regimes being the transfinite-bounded and aperiodic regimes. fileciteturn63file0L126-L140

So the transfinite slogan becomes:

```text id="jz5obu"
curvature = nonvanishing Scott defect
```

and:

```text id="umc5uw"
H¹ = accumulated curvature defects modulo repair
```

## 11. The failure event bundle

Eventually, define a bundled object:

```text id="ah34ld"
FailureEvent
```

with fields:

```text id="ddjmcq"
before      : Valuation
after       : Valuation
hle         : before ≤ₖ after
support     : List PredicationCell
supported   : ∀ φ, φ ∉ support → before φ = after
nontrivial  : before ≠ after
```

Derived projections:

```text id="7p3yp6"
pattern        : FailurePattern
spectrum       : FailureSpectrum
jumpMass       : Nat
failureCochain : Cochain
blowup         : Valuation × Valuation
isContradictory : Prop
```

Then prove the finite dictionary:

```text id="zujfdn"
failure_event_dictionary :
  nontrivial comparison
  ↔ nonempty incidence
  ↔ failure cochain nonzero
  ↔ positive jump mass
  ↔ strict free-energy drop
```

This is the finite core.

The transfinite extension is not the same theorem; it is a second dictionary:

```text id="nd8swa"
scott_defect_dictionary :
  Scott defect nonidentity
  → curvature event
  → curved regime
  → H¹ nonvanishing
```

The distinction between these dictionaries keeps the theory honest.

## 12. Failure and observability

A perfectly settled system is almost invisible. If everything commutes, glues, stabilizes, and has zero deficit, most invariants collapse.

Failure is what makes the system observable.

A nontrivial firing gives a support: where did something change?  
A failure kind gives a local spectrum: what kind of change occurred?  
A blowup gives a singularity: what is the local arrow type?  
A cochain gives a sheaf projection: how does this local event restrict and glue?  
A cohomology class gives persistence: what cannot be repaired locally?  
A deficit gives thermodynamics: how much settling remains?  
A Scott defect gives curvature: where did directed approximation fail?

So the philosophical slogan is mathematically precise:

```text id="zit6m5"
failure is how form becomes measurable
```

because every measurement arises as a projection of nonidentity comparison.

## 13. Failure and time

Time in this picture is not merely an external index. Time appears because not all failures burn at once.

A strict-finite system has a bounded failure burn-down.  
A Scott-continuous system may require an `ω`-style directed approximation, but without curvature.  
A transfinite-bounded system has limit-stage failure.  
An aperiodic system has failure that cannot be exhausted by countable stabilization.

So closure ordinal measures the **depth of unrepaired failure**, not just duration.

The proposed definition:

```text id="pa1zr6"
temporal depth of a settling = least stage where all jump defects vanish
```

and the proposed transfinite refinement:

```text id="webfbu"
curvature depth = order type of Scott defects
```

The existing `ClosureFlowCurvatureRegime` already interprets flat/curved regimes through closure-flow curvature and `H¹`, while `Ordinal` now gives an internal Brouwer/tree ordinal with limit-as-supremum behavior. fileciteturn63file0L11-L23 fileciteturn41file0L47-L66 fileciteturn41file0L127-L136

## 14. Failure and causality

Causality can be approached as propagation of failure dependency.

Define a relation on cells:

```text id="hgdpgr"
φ causes ψ
```

when a failure at `φ` is required for, propagates to, or constrains a later firing at `ψ`.

Then causal order is the transitive closure of failure propagation.

A causal diamond is then not imposed as geometric primitive; it is the closure envelope of dependency between a past failure boundary and a future failure boundary.

This gives a possible descent:

```text id="0s4pef"
predications carry values
values settle by closure
nontrivial closures expose dependencies
dependencies generate causal order
noncommuting dependencies generate curvature
```

This would connect `LorentzianCausalSettling` and `LorentzianMyrheimMeyer` back to failure-math: the causal structure is not just an analogy to causal sets; it is the visible order of firing dependency. The current roadmap says `LorentzianMyrheimMeyer` already models rational ordering fractions, a diamond witness, and geometry/topology independence witnesses, but the deeper bridge should be a theorem that failure propagation induces the causal order rather than merely being compatible with it. fileciteturn30file0L68-L74

## 15. Failure and quantum-like alternatives

The quantum-like reading should be handled carefully.

The right claim is not “this is Hilbert-space quantum mechanics.” The better claim is:

```text id="z8nojz"
settling alternatives form a non-Boolean event structure with paraconsistent value,
and closure behaves like measurement without collapsing contradiction into explosion.
```

In FOUR:

```text id="pz1qrx"
⊥ = no evidence
t = evidence for
f = evidence against
⊤ = evidence both ways
```

A local failure transition is a movement through this non-Boolean value object. Branch selection appears as `⊥ → t` or `⊥ → f`; coexistence appears as `⊥ → ⊤`; later interference/contradiction appears as `t → ⊤` or `f → ⊤`.

So the quantum-like theorem should not start with amplitudes. It should start with the event logic:

```text id="90b47u"
failure transitions generate a non-Boolean algebra of alternatives
```

and later ask whether stochastic/probabilistic enrichment turns that into a recognizable quantum-adjacent structure.

## 16. Failure and thermodynamics

Thermal structure appears when one stops asking only what failed and asks how much failure remains.

Current `FreeEnergyLyapunov` works in the zero-temperature/hard-closure regime: no real-valued entropy is fabricated; the potential is a `Nat`-valued deficit built from knowledge-order height over finite support. fileciteturn64file0L52-L65

The next idea is entropy of failure schedules.

Given a finite set of remaining failure events and a dependency order among them, define:

```text id="10nf2v"
entropy = number of admissible firing schedules
```

or, later, a measure over schedules.

Then:

```text id="1rrisk"
energy = how much failure remains
entropy = how many ways failure can still be spent
temperature = how much schedule multiplicity matters against direct descent
```

The zero-temperature theorem is the first step:

```text id="1fp0x7"
failure mass = energy drop
```

The positive-temperature theory comes later.

## 17. Failure and governance / computation

The CRDT/CALM seam gives a computational interpretation.

If `H¹ = 0`, local deltas integrate without coordination; the system can be distributed and monotone. `CRDTCohomologicalCALM` already bundles `H¹ = 0`, order-independent merge, confluence, and unique fixed point. fileciteturn55file0L128-L165

If `H¹ ≠ 0`, local repairs cannot produce a coherent global section under the current site/topology/closure rules. The system must do one of the following: accept persistent contradiction, change the cover, add communication, alter the closure rules, or carry the obstruction as regime data.

This yields a precise governance sentence:

```text id="k7eh4t"
coordination is demanded exactly where failure stops being a coboundary
```

That is not a moral slogan. It is a sheaf-theoretic criterion.

## 18. The conservation-like law

The deepest direction is a balance law.

In flat finite regimes, one should be able to prove:

```text id="c6237p"
initial deficit = sum of firing masses
```

In paraconsistent regimes, some failure mass may become persistent `⊤` charge.

In curved/transfinite regimes, some failure mass may survive as `H¹`.

The eventual grand balance law might look like:

```text id="opx11j"
initial free energy
=
integrated jump mass
+ persistent contradiction charge
+ residual cohomological obstruction
```

In the strict/Scott flat case, residual cohomology is zero. In the paraconsistent case, the `⊤`-summand stores internalized contradiction. In the aperiodic case, nonzero `H¹` stores failure that cannot be killed by local repair.

This is the closest thing to a “physics” theorem in the current direction.

## 19. Proposed file architecture

The clean next files are:

```text id="f2se35"
RelMath.FailureCore
RelMath.FailureEnergy
RelMath.FailureSheaf
RelMath.FailureCurvature
RelMath.FailureBalance
```

The first file should be finite and local. It should not mention transfinite ordinals, `H¹`, spectral gaps, or causality except in comments.

### `FailureCore`

Definitions:

```text id="nmatxy"
CellFailureKind
cellFailureKind
reconstructFailure
FailurePattern
FailureSpectrum
```

Theorems:

```text id="sq8vbu"
cellFailureKind_none_iff_eq
reconstruct_failureKind
failurePattern_complete
failure_masks_disjoint_union
```

### `FailureEnergy`

Definitions:

```text id="978bai"
jumpHeight
jumpMass
FailureSpectrum.mass
```

Theorems:

```text id="bilucc"
jumpHeight_of_failureKind
jumpMass_eq_spectrum_mass
deficit_energy_balance
jumpMass_positive_iff_firesOn
strict_energy_drop_iff_firesOn
```

### `FailureSheaf`

Definitions:

```text id="8vp463"
failureMask
failureOne
F_fire
F_fire split by CellFailureKind
```

Theorems:

```text id="jj79g9"
failureOne_support_eq_incidence
failureOne_zero_iff_no_firesOn
failure_sheaf_splits_by_kind
```

### `FailureCurvature`

Definitions:

```text id="mmoah7"
ScottExpected
ScottActual
ScottDefect
CurvatureEvent
```

Theorems:

```text id="9r7xip"
nsc_iff_scottDefect_nonidentity
curvature_event_is_scott_defect
curved_iff_exists_scott_defect
```

The last theorem may need honest transfinite scoping.

### `FailureBalance`

The later synthesis:

```text id="yfvxgc"
finite_failure_dictionary
flat_failure_balance
curved_failure_residue
```

This should wait until the earlier files are stable.

## 20. The smallest theorem worth doing first

The first theorem to hand to the Lean programmer is not the grand dictionary. It is:

```text id="v9krk8"
deficit_energy_balance
```

because it makes the whole theory accountable.

Prose statement:

Given finite support `cells`, monotone valuations `before ≤ₖ after ≤ₖ settled`, and the existing `deficit` from `FreeEnergyLyapunov`, define `jumpMass cells before after` as the sum of per-cell knowledge-height increments. Then:

```text id="xpw7e6"
deficit cells before settled
=
jumpMass cells before after
+
deficit cells after settled
```

This says:

```text id="xe6eyw"
the free-energy consumed by a firing is exactly the mass of the local failure it resolves or internalizes
```

Once this theorem is in Lean, the phrase **failure is the local currency of settling** becomes theorem-backed.

## 21. Closing thesis

Failure-math is the study of the structured residue of nonidentity comparisons in settling systems.

At the cell level, failure is a classified bilattice transition.  
At the firing level, failure is a nonidentity blowup.  
At the finite energetic level, failure has mass and exactly accounts for free-energy drop.  
At the sheaf level, failure is a cochain; if repairable, it is a coboundary.  
At the cohomological level, persistent failure is `H¹`.  
At the curvature level, transfinite failure is Scott noncommutation.  
At the regime level, failure separates flat from curved settlings.  
At the thermal level, failure is the deficit that descent burns into structure.

The final compressed form:

```text id="81a9xv"
Failure is not what prevents settlement.
Failure is the measurable form of settlement happening.
```
