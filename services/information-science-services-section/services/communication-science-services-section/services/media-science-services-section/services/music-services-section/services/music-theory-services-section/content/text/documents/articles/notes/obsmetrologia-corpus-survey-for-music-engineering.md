---
title: "Obsmetrologia Full-Corpus Survey for Music Engineering"
description: "A namespace-by-namespace verdict on every part of the Obsmetrologia Lean corpus as a candidate architecture source for the music engine -- which theorems are structural-architecture-candidates, which are narrow-parameter-sources, which are dead-ends and misreadings -- plus the follow-on proposal it produced for an Obsmetrologia-grounded multi-voice orchestration engine."
date-created: 2026-08-20
keywords:
  - music-engineering
  - obsmetrologia
  - generative-music
  - formal-methods
  - research-survey
requires:
  - ./verified-structures-as-compositional-grammar.md
id: obsmetrologia-corpus-survey-for-music-engineering
authors:
  - claude-sonnet-5
type: notes
status: unactioned-research
---

## Why this note exists

During the 2026-08-19/20 session that built out the generative music engine's drone/pad and call-and-response duo modes (see [Verified Structures as Compositional Grammar](./verified-structures-as-compositional-grammar.md) for the four Obsmetrologia primitives actually wired into the code by that point -- regime/operator, site/sheaf, thermodynamics, dynamics/flow, plus the later-added Lambek calculus motif grammar), the operator pushed back hard on an early, narrow "use Obsmetrologia" framing.
They asked for a genuinely broad, unbiased look at what else in the corpus might actually be useful before doing more hand-tuned building.
That produced two research passes:

1. A first, narrow six-file pass whose own initial guess about an "MLD" module was wrong (see the correction below -- this is not "Modal Logic and Duality").
2. A full-corpus survey -- a dedicated research agent (263k tokens, 164 tool uses, ~870s) reading source directly across every namespace in the library, supplemented by four background sub-agents for the largest namespaces (three returned complete reports: Cohomology, Site/Language/Articulation, AperiodicOrder; two got stuck in their own sub-delegation and never reported, leaving two namespace clusters covered only by direct spot-sampling, honestly flagged as such throughout).

The session ended (mid-build on an unrelated throat-singing-synthesis workstream) before any of this survey's recommendations were acted on beyond the two primitives already in production use.
**Nothing below is implemented.**
This is the standing research backlog for the next real pass at the engine's math layer, preserved in full because the in-conversation recap the operator actually saw was a fraction of what the survey agent actually found.

The operator's own priority call at the time (given other, more listener-facing work in flight): melodic composition quality and a real guqin transcription first, this MLD/notation-format work third, "genuinely the deepest finding, but it's infrastructure a listener won't hear directly."

---

# Obsmetrologia Deep Survey — Final Report

(Full text of the survey agent's final consolidated report, verbatim.)

I read source directly across every namespace listed, supplemented by four background research agents for the largest namespaces (three of which returned complete, well-grounded consolidated reports: Cohomology, Site/Language/Articulation, AperiodicOrder).
Two agents (covering GameTheory/KineticTheory/DenseMatter/CausalSets, and Calculus/Closure/Computing/Dynamics/Primitive/ReactionNetworks/Settlement/Thermodynamics) got stuck in their own internal sub-delegation and never returned consolidated reports despite repeated prompting.
For those namespaces this report rests on my own direct sampling (10–15 files each, not exhaustive), which I flag honestly below rather than padding with unverified claims.

## Cohomology (~20 files, full agent sweep)

**The standout cluster — structural-architecture-candidate**: `CoordinationCohomology.lean` (a real discrete Čech H¹ of a "who agrees with whom" graph, `H1rank` vanishing iff the graph is a forest), `CurrencyCocone.lean` (a proven categorical colimit merging five independent obstruction-price metrics into one canonical budget number), `AttentionAllocation.lean`/`AllocationSolver.lean` (a real 0/1-knapsack with two provably-optimal solvers whose tie-breaking bias is formally characterized in bits), `CRDTCohomologicalCALM.lean` (real CRDT confluence/order-independent merge).
These map directly onto multi-voice coordination, tension/budget accounting, and networked/live-coding consistency.

**Second-tier structural candidate**: `BigradedTruthKnowledgeLES.lean` has a genuinely rich concrete nonzero-obstruction "irreducible contradiction" instance and a quench/mapping-torus model of ambiguity that freezes/thaws -- good for harmonic-ambiguity modeling, but deeply entangled in corpus-internal `Charge`/`Valuation` types.
`AntiLandauerEntropy.lean` has a real index theorem (`H⁰−H¹=χ`) as a conserved tension/release quantity.
`AlexandrovHusainov.lean`'s Alexandrov-topology half and `TransfiniteCellComplex.lean`'s colimit-of-finite-subcomplexes are solid general reusable math.

**Dead-end**: `KZCoherentSheaf.lean`, `SettlingLocalConstancy.lean`, `ScottFace.lean`, `DifferentialBypass.lean`, `HoleDiamondHusainov.lean` -- the interesting non-trivial cases are explicitly left as prose/open frontier; what's actually proved is vacuous triviality in the strict regime.

## Cohomology/FrobeniusTQFT.lean (personally read in full)

Genuinely real: a from-scratch `FrobeniusAlgebra` bundle (ℤ-module + associative unital bilinear `μ`, counit `ε`, comultiplication `Δ`, Frobenius compatibility all as proven fields, not axioms), instantiated concretely as `ℤ[x]/(x²)` with **every axiom proved** by `Int` arithmetic, plus a full, correctly-stated Abrams correspondence (commutative Frobenius algebra ⟺ 2D TQFT) with the round-trip proved on the worked instance.
**Verdict: structural-architecture-candidate, the real thing.**
Sections/phrases as cobordisms with genuine gluing laws is exactly what's modeled -- unit=disk, `μ`=pair-of-pants merge, counit=trace, `Δ`=split.
This could genuinely underlie a piece-structure formalism where boundary states are "chord/harmonic-field objects" and sections are cobordisms between them, with the Frobenius compatibility law giving a real algebraic constraint on how splits and merges must compose.
Caveat: the tensor product is modeled as literal `List (A×A)` formal sums (finite, computational) rather than abstract linear algebra, and it's a single worked 2-dimensional instance, not a general n-object TQFT -- extending it to richer "chord alphabets" would need real work, but the scaffolding (structure fields, theorem shapes) transfers directly.

## Cohomology/LawvereHarmonicCohomology.lean + LawvereKernelH0.lean + LawvereLaplacianSpectralGap.lean (personally read in full) — IMPORTANT CORRECTION

**This is not about Lawvere algebraic theories.**
"Lawvere" here names the *Lawvere Laplacian* (Ghrist–Lopez–North–Riess 2025 / Ghrist–Riess 2022's graph/sheaf Laplacian, extended to Q-enriched sheaves on a site) -- a spectral/diffusion/harmonic-analysis construction (`lawvereLaplacian M v := M.closureOp v`, the modal round-trip `□∘◇`), proven to have harmonic kernel ≅ H⁰, with an "orbit ascends to the fixed point" convergence/spectral-gap argument.
It has **no connection** to Lawvere theories (the categorical framework for specifying algebraic operation signatures via a category with finite products) -- there is no signature/arity/operation vocabulary here at all.
**Verdict for the notation-format algebraic-backbone question: dead-end.**
This module cannot serve as the algebraic backbone for operation signatures in a notation format; it's a real (if narrow) diffusion-convergence/spectral-gap result about closure dynamics, useful at most as a narrow-parameter-source for "how many steps does a harmonic-resolution process take to converge" (its `lfp_reached_by_three`-style bound).
Recommend telling the notation-format effort to look elsewhere in the library (or outside it, e.g. actual Lawvere-theory/PROP formalizations) for algebraic-signature machinery.

## QuantumContextuality (all 13 files, personally read in full)

This is genuinely the strongest match to the operator's hypothesis about harmonic ambiguity/interference.
Real content, not name-dropping:

- **`MeasurementScenario.lean`**: `Scenario`/`Model` (a cover of "contexts," each with a support predicate over local outcome assignments), `HasGlobalSection`/`StronglyContextual`, and the PR box (`prBox`) proven strongly contextual by Boolean exhaustion -- a genuine finite witness that local data can be locally consistent everywhere yet admit *no* single global reading.
- **`ContextualObstruction.lean`**: a real three-rung hierarchy (strong ⟹ logical ⟹ ¬noncontextual), each inclusion proved.
- **`HardyModel.lean`/`HardyEmpiricalModel.lean`**: the **exact structure the operator asked about** -- a model that *has* a global reading yet still has one local passage (`a'=1,b'=1`) that cannot be consistently extended to that reading.
  This is precisely "a passage admits an overall consistent interpretation, but one specific local reading of it is provably irreconcilable with any global one" -- directly transferable to contested manuscript passages that have *a* defensible overall reading but one clause that can't be squared with it.
- **`CohomologicalContextuality.lean`**: reduces the parity/XOR contextuality obstruction to an honest discrete graph-cohomology H¹ (a 4-cycle "gradient telescoping" argument), and separately proves a `⊤`-holding "held-both/contested" charge-record framework whose merged inconsistency count is a real but *lossy* (undercounting) readout of the true obstruction rank (`fig8_merge_top_below_rank`) -- a rigorous formal statement that "collapsing multiple simultaneous contested readings into one merged record loses information," which is exactly the risk profile a notation format needs to reckon with honestly.
- **`KCBS.lean`, `MagicSquare.lean`, `LeggettGarg.lean`**: further real, distinct contextuality phenomena (exclusivity-graph independence number vs. quantum bound; state-independent all-versus-nothing parity double-count; contextuality *in time*, i.e. no-single-trajectory-fits-history) -- the temporal (Leggett-Garg) one is worth flagging separately as a formal vocabulary for "this passage's successive readings at three points cannot all be reconciled to one consistent narrative arc," genuinely different from the spatial contextuality cases.
- **`DisclinationLink.lean`, `FockCondensate.lean`**: interesting cross-namespace glue (KCBS pentagon realized as the boundary link of an `AperiodicOrder.Defect` disclination) but narrower/more physics-specific.

**Verdict: structural-architecture-candidate**, genuinely, for both generative interference effects and for the notation format's contested-reading representation need.
Recommend `HardyModel.lean` + `CohomologicalContextuality.lean`'s held-`⊤`/merge apparatus as the first things to build on.

## Site / Language / Articulation (full agent sweep — the second major finding)

This turned out to be **one coherent layered architecture**, not three separate topics, and it is directly relevant to the notation-format effort:

- `Language/Spine.lean` proves the whole pipeline is literally one composed function: `run = settle ∘ posit ∘ predicate ∘ articulate`.
- The FOUR-valued object is **definitionally identical** across layers: `Charge := Articulating.Corner`, proved by `rfl` in `Articulation/Articulating/FourCorner.lean`.
- `Language/Positing/Record.lean`: multiplicity-preserving evidence (tallies of "told-true"/"told-false" counts, not booleans) with a **proven-forced** (not chosen) collapse map down to the four-valued contested/settled charge (`bottom_reflecting_hom_eq_charge`) -- a strong, ready-made model for "N manuscript sources attest reading A, M attest reading B" with a canonical collapse to a settled/contested verdict.
- `Language/Predicating/CellPartition.lean`: proves predication cells deliberately carry **no value field** -- object identity is kept strictly separate from valuation-relative interpretation -- exactly the separation a notation format needs between "this is a note-event" and "which pitch it denotes under which reading."
- `Language/Predicating/Equality.lean`: **derives** (not postulates) two distinct equality predicates from the same adjoint machinery -- classical and paraconsistent -- both agreeing on *where* they hold but not on *what charge* they carry.
- `Site/Intension.lean`: a genuine multi-context reading apparatus (`IntensionalFrame`, `AnchoredTerm`) with a distinguished "actual" context and proven structure-preserving transport maps to every other context.
- `Site/Section.lean` (`AssocSheaf`): a proven split exact sequence decomposing any contested reading into its uncontroversial-true part and its held-both/contested residue.
- `Language/Positing/Morphism.lean`: an order-independent, CRDT-style merge algebra for multiple simultaneous assert/deny/contest witnesses on the same claim.

**Verdict: structural-architecture-candidate, the strongest architectural finding in the whole survey.**
This is a genuinely adoptable layered design (object-identity layer → predication/fibration layer → four-valued evidence layer → fixed-point convergence layer → topological/multi-context gluing layer) for the notation-serialization format's core problem of holding and merging contested historical readings.
Not narrow vocabulary borrowing -- it's a load-bearing, internally-consistent formal architecture.

Weaker/narrow within this sweep: `Language/Positing/Gauge.lean`/`D4Gauge.lean`/`Quartet.lean` (elegant symmetry-group proofs of an already-adopted object, decorative rather than additive), `Language/Predicating/CurryHowardLambek.lean` (high quality but adds nothing beyond what `Charge`/`Equality` already give), `Site/FilterFiberSector.lean` (generic plumbing shared with unrelated physics modules, dead-end for this purpose).

## AperiodicOrder (~70 files, full agent sweep + my own spot-checks)

**Real find — structural-architecture-candidate**: `Tiling/SoficShift.lean` + `Tiling/StepN/{MetallicMean,SubstitutionMatrix,Recurrence,Salem,GoldenFieldBridge}.lean` + `Tiling/Universality.lean` form a genuine, proof-backed substitution-system/SFT engine: real substitution rules (Fibonacci, Padovan, silver, bronze), proved Cayley–Hamilton matrix identities, a proved Pisot-vs-Salem spectral classification matching real aperiodic-order theory (Pisot ⟹ pure-point diffraction, Salem ⟹ singular-continuous), and shift-equivalence as a genuine equivalence relation for comparing generative rules.
This has real precedent in algorithmic rhythm research (metallic-ratio/Fibonacci substitution generation) and is proof-backed, not just formula-backed.
`WeaveDraft.lean`/`PortGraph.lean`/`PortGrowth.lean` show this machinery already successfully reused once outside physics (textile pattern generation), good evidence of portability.

Also strong: `AffineHolonomy.lean` (a complete, correctly-proved `Z²⋊Z/4` transformation group with a "Burgers vector" drift invariant -- good for tracking how a repeated transposition/inversion sequence drifts) and `Defect.lean` (a real, proof-backed discrete curvature/annealing model: place tension points, run a proven-terminating relaxation, distinguish paired-cancelling vs. surviving unpaired defects -- a genuine tension/resolution engine).

**Narrow-parameter-source**: `GlassDynamics/*` and `Percolation`/`MatterTopology`/`CondensateMatter` are generic, reusable finite combinatorics (contagion spreading, guaranteed-terminating relaxation, similarity metrics, density thresholds) dressed in glass-physics vocabulary -- useful utility functions but not distinctively aperiodic.

**Dead-end**: the large cohomological-classification cluster (`Classification*`, `CoClassifying`, `InverseHull`, `Moduli*`, `Autopoiesis`) builds substantial Lean machinery around a core object that is literally `structure H1Class where coord : Int`, genuine effort, thin mathematical content, with the hard parts explicitly deferred as "open frontier."
`Witness/JeandelRao*` cites real, famous aperiodic-tiling mathematics but is a hand-transcribed finite cohomology-invariant certificate, not an executable tile-generation engine.
**Confirmed as a separate research thread, not aperiodic order at all**: `MaterialSectors/Contact/{Keratin,CollatzBarrier*}` is genuinely Collatz-conjecture number theory plus a generic monotone-poset formalism, connected to this namespace only by shared bookkeeping infrastructure and metaphor.

## GameTheory/VerificationTournament.lean (personally read in full)

**Verdict: dead-end for interactive/multi-agent composition**, contrary to what the name suggests.
This is not formalized game theory -- there are no strategies, payoff functions, or a real Nash-equilibrium computation.
It is proof-carrying-code scaffolding for an actual software verification protocol (a claim/refutation "Dialectica witness" tournament over libp2p): nearly every field is an uninstantiated `Prop` placeholder, and the one real theorem (`Charge.no_periodic_orbits`) is a generic closure-fixed-point fact borrowed from `Closure.Monad`, not game-theoretic content.
Nothing here would drive an interactive/adaptive multi-voice generative system.

## KineticTheory (personal sample: Gas/BoltzmannClosure, Gas/DiscreteVelocityCollision, Fluid/VortexCohomology, Liquid/OrnsteinZernikeClosure — Plasma files not personally verified)

**Structural-architecture-candidate**: `DiscreteVelocityCollision.lean` + `BoltzmannClosure.lean` are genuinely real kinetic theory -- a particle population as a multiset, binary collisions with proven conservation of arbitrary "balanced weights" (number/momentum/energy as instances), conservation proved along an entire multi-collision evolution, and the whole thing wired into the closure-rule engine as a least-fixed-point.
This is a natural, proof-backed fit for granular synthesis: grain populations undergoing pairwise interactions with formally conserved quantities (e.g. total spectral energy or grain count invariant across a texture transformation).
`VortexCohomology.lean` is a genuine, self-contained discrete de Rham H¹ (loop circulation as a cochain, zero iff the flow is a gradient/coboundary) -- good for tracking topological "defects" (vortices) in a generated texture field, distinct from and complementary to `AperiodicOrder.Defect`.

**Narrow-parameter-source**: `OrnsteinZernikeClosure.lean` is explicitly described in its own docstring as "the same Tarski closure" already used elsewhere (`Closure.Regime`/`MaterialSectors.Contact.Keratin`), just reinstantiated -- real but not additive architecture.

**Not personally verified**: the four Plasma files (DebyeGraphScreening, Quasineutrality, ReconnectionCurvature, TopologicalWaveSheaf) and Liquid/DensityFunctionalFlow -- flagging this gap honestly rather than guessing.

## DenseMatter (personal sample: Neutron/EOS.lean, Quark.lean)

**Surprising find — structural-architecture-candidate**: `Quark.lean` is not really about QCD physics; it's a genuine, general finite discrete **gauge theory** (holonomy, gauge transformations, Wilson-loop gauge invariance, all proved from a bare `FiniteGroup` with no Lie-group machinery) -- and it has an explicit, concrete cross-namespace payoff: `pureGauge_iff_delta0` and `prConnection_flux` prove that the PR box's contextuality obstruction, read as a ℤ/2 gauge connection, has **nonzero Wilson-loop flux** exactly where it's not pure gauge.
This is a rigorous formal statement that **quantum contextuality is gauge flux** -- a genuinely evocative, proof-backed bridge that could motivate "harmonic tension/ambiguity as flux around an interpretive cycle" as a real formal metaphor, not just a name.
Worth flagging prominently even though it sits in an unexpected namespace.

**Narrow-parameter-source**: `Neutron/EOS.lean` (stability `dP/dε≥0` + causality `c_s²≤c²` as order/arithmetic constraints on a sampled equation of state) is real but narrow -- could drive a monotone-dynamic-range/no-runaway-intensity constraint on an arrangement, nothing more.
`Neutron/PastaTopology.lean` not personally read.

## CausalSets (personal sample beyond Causal/Order.lean: BlackHoles/Hole.lean, Dimension/OrderingFraction.lean, Incidence/Mobius.lean; most other files not personally read)

**Structural-architecture-candidate**: `BlackHoles/Hole.lean` is genuinely real -- a finite computable "no-readout region" with proven future/past-closure, disjointness from its exterior, and (with an anchor hypothesis) proven topological connectedness of the region.
This maps cleanly onto "a passage that cannot causally reach a designated resolution/cadence region" as a formal horizon concept.
`Dimension/OrderingFraction.lean` computes the real Myrheim–Meyer dimension estimator from a causal set's ordering fraction (a rational number derived purely from order-relation counting) -- a genuine, non-arbitrary complexity/density metric usable for "how many independent causal threads are active" scoring.
`Incidence/Mobius.lean` is a real incidence-algebra Möbius function on the causal order with proven inversion identities -- usable for inclusion-exclusion-style voice-leading or dependency combinatorics.

**Coverage gap, honestly flagged**: Action/, Continuum/, Curvature/, Operator/, Support/ (roughly 15 more files) were not personally verified and the delegated agent never returned a report on them -- treat any prior claims about these as unverified until read directly.

## Calculus (personal sample: Logic/LambekCalculus.lean, Optimization/Majorization.lean; most subdirectories not personally read — Algebra, Order, Probability, Real largely unverified beyond what the prior narrow pass already used)

**Structural-architecture-candidate**: `Logic/LambekCalculus.lean` is a real, correctly-derived (not postulated) non-commutative residuated-lattice formalization of the Lambek calculus -- bi-residuation, derived modus ponens laws, the commutative collapse to a single implication.
This is genuine categorial-grammar algebra with real precedent in formal-grammar approaches to melodic/phrase generation (a `\`/`/` residuation structure is exactly a "what must follow/precede this fragment to close a well-formed phrase" combinator).
Worth a serious look for phrase-grammar generation.
(Note: as of this survey, this primitive had already been ported into `lambek.mjs`/`motif-grammar.mjs` for token-level motif shape -- see the compositional-grammar note; the observation above about a fuller phrase-level grammar remains open.)

**Important correction**: `Optimization/Majorization.lean` is **not** classical majorization (the doubly-stochastic/Muirhead–Hardy–Littlewood–Pólya smoothing order relevant to voice-leading-doubling theory).
It's a different, unrelated "majorize-minimize" (MM-algorithm-style) optimization scheme -- an inflationary, monotone-but-not-idempotent improvement operator converging via its ω-orbit.
Don't conflate the two; if classical majorization for voice-leading is wanted, it isn't here (unverified whether it exists elsewhere in `Calculus/Order`).

**Not personally verified**: Algebra/, Arithmetic/, Order/{GraphColoring,Ramsey,FormalConceptAnalysis,ChromaticNumber}, Probability/ (beyond what the prior narrow pass used), Real/ (beyond GoldenLog referenced elsewhere) -- genuine gap, flagged rather than guessed at.

## Closure (personal sample: Odometer.lean; Regime.lean already known from prior pass; most other files not personally read)

**Structural-architecture-candidate**: `Odometer.lean` is a real, well-proved Bratteli–Vershik dyadic adic-successor construction (the canonical minimal Cantor system) -- carry-propagation "+1" on binary paths, proven periodicity dichotomy, proven density/minimality of every orbit, explicitly wired into `AperiodicOrder.Tiling` as a serial/time ordering for tiling growth.
This is a genuine, proof-backed self-similar aperiodic binary-sequence generator -- directly usable for rhythmic gate patterns with proven non-periodicity and proven orbit structure, complementary to the `Tiling/StepN` substitution engine.

**Not personally verified**: Coalgebra, Modal, Monad(+KZ, LaxSlack), Ordinal(+Arithmetic,Finite,SignedTally), RuleDynamics, RuleSystem, Scott, SettlementSpiral, SettlingMonotonicityQuiescence, and the ~14 Collatz/* files (the latter almost certainly the same Collatz-conjecture thread confirmed elsewhere, not aperiodic-order content).

## Computing (personal sample: FormatsFour.lean; CausalityPacket.lean not read)

**Structural-architecture-candidate, directly relevant to the notation-format goal**: `FormatsFour.lean` classifies eight real serialization formats (bytes/plaintext/json/rdf/markdown/html/tex/rmnHtml) along two independent axes -- a content-commitment "corner" (the same FOUR object as everywhere else in the corpus) and a **completion regime** (strict/scott/transfiniteBounded/aperiodic, i.e. how computationally hard it is to fully interpret the format, up to and including "requires Turing-complete computation like HTML/TeX").
This is a genuine, formally grounded taxonomy for exactly the question a notation-serialization-format designer needs to answer: what class of computation does parsing/interpreting this format actually require, and is that decidable.
Worth reading directly -- it's short and squarely on-target.

## Primitive (Mark.lean, both files, read in full)

`Mark` (a bare surface string) and `Kind` (token/claim) are the absolute foundational atomic type -- confirmed by the Site/Language/Articulation sweep to be the literal base every other layer (`Utterance`, `Articulating`, eventually `Charge`) is built from.
**Verdict: structural-architecture-candidate as the foundational keystone type**, though trivial in isolation -- its value is entirely in being the thing everything else provably reduces to.

## ReactionNetworks (personal sample: Network.lean; DetailedBalance, Entropy, FreeEnergyDescent, MassActionRate, Reachability not personally read beyond the prior narrow pass's use of SupportProjection)

**Structural-architecture-candidate, beyond the narrow entropy-formula use already made**: `Network.lean` is a real non-monotone resource-consumption model -- species counts, reactions that genuinely spend reactants (proven non-monotone, unlike the corpus's usual accumulate-only closures), mass conservation, catalysis formalized as a fixed point of the resource map, and -- the most interesting result -- appending a reaction that closes a cycle among already-coupled species provably raises the `CoordinationCohomology.H1rank` coupling invariant by exactly one.
This is a genuine, quantitative "adding a new dependency/resolution raises formal coupling by exactly one unit" law, useful for a motif-development/resource-budget model where introducing new material has a provable, countable effect on structural coupling.

## Settlement.lean (single file, read in full)

**Structural-architecture-candidate**: a real cross-cutting abstraction, not a mere import aggregator.
`Settlement` = (base, content-type-indexed-by-base, admission-law) with a single proven theorem instantiating the same shape four independent times (tile local-rule satisfaction, beadwork thread legality, black-hole causal-shroud effect-sourcing, Čech cocycle gluing).
This is a genuine reusable design pattern -- "generated content that must satisfy its base's own admission law" -- directly applicable as the constraint-satisfaction backbone for a generative process (a grammar/rule-base plus content proven admissible against it), independent of any one physical domain.

## Dynamics (personal sample: Flow/FreeEnergyLyapunov.lean; Flow.lean and CurvatureRegime.lean already known from prior pass; BlowupClassification, ClosureFlowDynamics, FiringBlowup, FiringSpiral, NSCFiring, TransfiniteClosureFlow, Laplacianizability not personally read)

**Structural-architecture-candidate, beyond the prior pass's narrow use**: `FreeEnergyLyapunov.lean` proves a genuine H-theorem -- closure settling is gradient descent of a `Nat`-valued "free-energy deficit" that strictly decreases on every firing step and reaches the fixed point in at most (initial deficit) steps, giving a real, computable convergence-time bound tied to the closure-ordinal/curvature (H¹) structure.
This is a proof-backed model for "guaranteed, boundedly-fast convergence to resolution" -- useful for pacing a piece's tension/release arc with a formally justified upper bound on how long resolution takes, distinct from and more structural than the earlier "Boltzmann entropy as a jitter formula" use.

**Not personally verified**: the other seven Flow files -- a real gap; treat unverified.

## Thermodynamics (both files: BoltzmannEntropy.lean, Temperature.lean)

Confirmed via directory listing that these are the only two files in the namespace -- fully covered by the prior narrow pass already (see the compositional-grammar note).
No further namespace content exists to survey here.

---

## Overall assessment (survey agent's own summary)

The two clearest wins for **genuine architectural (not vocabulary) reuse** are:

1. **Site/Language/Articulation** as a single layered architecture for representing and merging contested/multi-source historical readings -- this is the strongest, most directly actionable finding for the notation-serialization-format effort specifically (`Language/Positing/Record.lean`, `Language/Predicating/CellPartition.lean`, `Site/Intension.lean`, `Language/Predicating/Equality.lean`, `Language/Positing/Morphism.lean`, `Site/Section.lean`).
2. **QuantumContextuality**, especially `HardyModel.lean`/`HardyEmpiricalModel.lean` and `CohomologicalContextuality.lean`, for genuine harmonic-ambiguity/interference modeling with a formally proven "collapsing contested readings loses information" result -- and its surprising, concrete tie into `DenseMatter/Quark.lean`'s gauge-flux formalism ("contextuality is gauge flux").

Secondary genuine finds worth building on: `Cohomology/FrobeniusTQFT.lean` (real cobordism piece-structure formalism), the `AperiodicOrder/Tiling/{SoficShift,StepN}` substitution engine plus `Closure/Odometer.lean` (real, proof-backed aperiodic pattern generators), the `Cohomology` coordination/allocation/CRDT cluster, `Settlement.lean`'s constraint-satisfaction pattern, `KineticTheory`'s collision-conservation engine, `ReactionNetworks/Network.lean`, and `Computing/FormatsFour.lean` (directly on-target for the notation format's completion-semantics question).

Two important corrections against the operator's stated hopes: `Cohomology/LawvereHarmonicCohomology.lean` is not about Lawvere algebraic theories and cannot serve as an operation-signature backbone; `Calculus/Optimization/Majorization.lean` is not classical (voice-leading-relevant) majorization.
And two confirmed dead-ends: `GameTheory/VerificationTournament.lean` is software-verification scaffolding, not game theory; `AperiodicOrder/MaterialSectors/Contact/{Keratin,CollatzBarrier*}` is a Collatz-conjecture research thread filed under this namespace by convention only.

**Honest coverage gaps** (namespaces/subfolders not personally verified, where the delegated agents failed to report): CausalSets/{Action,Continuum,Curvature,Operator,Support} (~15 files); Calculus/{Algebra,Arithmetic,Order,Probability,Real} beyond the two files sampled; Closure/{Coalgebra,Modal,Monad,Ordinal,RuleDynamics,RuleSystem,Scott,SettlementSpiral,Collatz/*}; Dynamics/Flow/{BlowupClassification,ClosureFlowDynamics,FiringBlowup,FiringSpiral,NSCFiring,TransfiniteClosureFlow,Laplacianizability}; KineticTheory/Plasma (4 files) and Liquid/DensityFunctionalFlow; DenseMatter/Neutron/PastaTopology.lean; ReactionNetworks/{DetailedBalance,Entropy,FreeEnergyDescent,MassActionRate,Reachability}; Computing/CausalityPacket.lean.
These should be treated as unaudited rather than assumed dead-end or assumed promising.

---

## Follow-on, same session, last thing discussed before it ended: an orchestration engine as the real payoff

After this survey, the operator observed (correctly, and the point is worth preserving in their own words' spirit) that "use Obsmetrologia" was never really about borrowing a filter formula -- it's math of **coordination and conflict resolution**, i.e. it's the actual mathematics of *conducting an orchestration*.
That reframing produced a concrete architectural proposal, the last substantive idea of the session, never built or written up elsewhere:

The multi-voice consolidation problem the engine actually has -- N independent voices, each with claims on a shared time-window, needing to be admitted, merged, or arbitrated without either silently overriding each other or deadlocking -- is not a vague analogy to "coordination and conflict resolution."
It is the literal shape of several things this survey already found:

- **`CoordinationCohomology.lean`'s `H1rank`** (a real "who-defers-to-whom" graph, vanishing exactly iff it's a forest -- no conflict cycles) is *directly* the turn-taking arbitration problem: when two voices both want the floor in the same window, is there a consistent priority ordering, or a genuine cycle that needs resolving?
  That's not a metaphor for a scheduler, it's a scheduler.
- **`cover.mjs`'s sub-check/join-check sheaf-cover admission** -- already built, already used in the engine for "which pitch classes get a voice" -- generalizes to "which *instruments* get to sound this window" as the exact same primitive over a different domain.
  The orchestration engine's core admission decision might not need new code at all, just a second instantiation of what's already there.
- **`Support/Charged.lean`'s paraconsistent convergence** (independent sources meeting at a point: agreement reinforces, genuine contradiction is *held* as its own real fourth value rather than forced to resolve) is precisely what should happen when two voices' phrases actually clash -- real ensemble tension/suspension as a first-class state, not a bug to silently paper over.
- **The Site/Language/Articulation multiplicity-preserving-evidence → forced-collapse-to-a-verdict architecture** (documented in full above) is, read the right way, a conductor's decision function.

The proposed next real brief, never started: don't build "one orchestration engine" as generic plumbing -- build it *as* an application of this coordination math, closing the loop the whole session had been circling toward: not vocabulary borrowed for a filter formula, but the actual mechanism deciding who plays when, when voices agree, and what happens when they genuinely can't be reconciled.
This was to be folded in "once throat-singing lands" -- the session ended before that happened.

## Status

Unactioned research as of session end (2026-08-20).
Only the four primitives listed in [Verified Structures as Compositional Grammar](./verified-structures-as-compositional-grammar.md) plus the Lambek motif grammar were in production use at that point.
Everything in this note -- the MLD port, the Site/Language/Articulation notation-format architecture, the TQFT-as-cobordism macro-form, the QuantumContextuality harmonic-ambiguity modeling, and the orchestration-engine proposal above -- is backlog, not implemented, as far as this note's author can verify against the repository.
