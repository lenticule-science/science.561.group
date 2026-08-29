import InfomaterialManual.DocSetup
import InfomaterialManual.PartVII.LeanModuleLayout
import InfomaterialManual.PartVII.Topics.Primitives
import InfomaterialManual.PartVII.Topics.Predication
import InfomaterialManual.PartVII.Topics.Positing
import InfomaterialManual.PartVII.Topics.Settling
import InfomaterialManual.PartVII.TheoryOverviews.CoreSpine
import InfomaterialManual.PartVII.TheoryOverviews.OrderClosure
import InfomaterialManual.PartVII.TheoryOverviews.FourValuedBilattice
import InfomaterialManual.PartVII.TheoryOverviews.LogicCategories
import InfomaterialManual.PartVII.TheoryOverviews.SheafCohomology
import InfomaterialManual.PartVII.TheoryOverviews.AlgebraDiscrete
import InfomaterialManual.PartVII.TheoryOverviews.DynamicsGeometryPhysics
import InfomaterialManual.PartVII.TheoryOverviews.AperiodicityFrontier

open Verso.Genre Manual InlineLean

#doc (Manual) "Library atlas" =>

# Back Matter A: Library Atlas

The atlas is the first Mathlib-quality coverage layer for the Lean modules that
already exist in `Infomaterial/`. It is not a substitute for generated API docs. It is
the narrative map that tells a reader why the modules exist, how they hang
together, and which route to take before reading declarations one by one.

The standard is simple: every active Lean module should be findable from the
manual by mathematical role, from API docs by declaration name, and from the
scope guide by status.

## Coverage Policy

An active module is covered when it appears in at least one theory overview and
has a clear status:

* foundation,
* recovered mathematics,
* frontier witness,
* infrastructure,
* archive candidate.

The first pass below is intentionally broad. It covers the whole current active
library by families so the project has a real documentation map. Later passes
should split these overviews into richer pages with declaration links, examples,
and checked snippets.

## Active Module Families

Core foundation:
`Mark`, `Utterance`, `Articulating`, `ArticulationCell`, `Predicating`,
`Positing`, `Settling`, `Four`, `FourCornerCell`.

Order, closure, and fixed points:
`OrderInfra`, `TruthOrder`, `ClosureOrdinal`, `ClosureOrdinalRegime`,
`ClosureMonad`, `Closure2MonadKZ`, `ClosureOperatorFiber`, `ClosureRuleSystem`,
`ScottContinuousClosure`, `KnasterTarskiStandalone`, `StepNRecurrence`,
`StepNFixedPoint`, `TransfiniteClosureFlow`, `Ordinal`.

Four-valued, bilattice, and nuclear structure:
`ResiduatedLatticeStandalone`, `TwistProductResiduation`, `D4Gauge`,
`KleinFourGauge`, `QuartetRecurrence`, `BigradedDiamond`,
`BigradedDiamondTower`, `ValuationFiberAlgebra`, `ValuationQuartetDischarge`,
`NucleusAndCommutingNuclei`, `NuclearAutopoiesisCell`,
`PairwiseStoneClopen`, `ModalKripkeFourValued`.

Logic, category, and type-theoretic recovery:
`Hyperdoctrine`, `Quantifying`, `PredicationFibration`,
`PredicationHyperdoctrineDual`, `ModalPairAdjunction`, `LinearLogicChu`,
`CurryHowardLambekQuartet`, `LambekCalculus`, `TemporalTwoCategory`,
`YonedaArrowsFirst`, `KZCoherentSheaf`, `QuantaleEnrichedSheaf`,
`TheoryRelativeIdeal`, `Factorization`.

Sheaves, cohomology, and settling sites:
`Sheaf`, `DFrame`, `SettlingAssociatedSheaf`, `SettlingCohomologyH1`,
`SettlingOverValueCategory`, `SettlingFrobeniusTQFT`,
`SettlingModuliStack`, `SettlingLocalConstancy`,
`BigradedCohomology`, `BigradedSettlingCohomology`,
`CohomologicalEquivalence`, `CRDTCohomologicalCALM`,
`InconsistencySheaf`, `NegativeParaconsistentSheaf`,
`BitopologicalSettlingSite`.

Algebra, combinatorics, and discrete recovery:
`AlgebraHierarchy`, `SetNumberGraphTheory`, `NumberTheoryCombinatorics`,
`CombinatoricsExtremal`, `LinearAlgebra`, `LinearAlgebraRankNullity`,
`FormalConceptAnalysis`, `FCALambekCircle`, `Equality`,
`OrderSwapDuality`, `SynonymyAntonymy`, `SubstitutionUniversalityClass`,
`InternalReals`.

Dynamics, optimization, geometry, and physical analogues:
`ClosureFlowDynamics`, `ClosureFlowCurvatureRegime`, `FiringBlowup`,
`NonScottContinuousFiring`, `BlowupClassification`, `FreeEnergyLyapunov`,
`Optimization`, `StochasticSettling`, `ProbabilityMeasure`,
`LorentzianCausalSettling`, `LorentzianMyrheimMeyer`,
`LawvereLaplacianSpectralGap`, `Laplacianizability`,
`AlexandrovHusainov`, `TransfiniteCellComplex`, `SettlingCoalgebra`.

Aperiodic and finite-certificate frontier:
`AperiodicClassification`, `AperiodicWitnessJeandelRao`,
`AperiodicCoClassifyingInvariant`.

## What This Part Must Become

The present pages are the scaffolding. The finished version should have:

* one overview per theory family,
* one compact module table per overview,
* declaration links into generated API docs,
* small checked examples in Verso,
* status and provenance for every frontier theorem,
* explicit "do not confuse this with" warnings for familiar recovered concepts.

This is the right kind of ambition: not one giant essay, but a durable
documentation architecture that can absorb the whole Lean library.

{include 1 InfomaterialManual.PartVII.LeanModuleLayout}

{include 1 InfomaterialManual.PartVII.Topics.Primitives}

{include 1 InfomaterialManual.PartVII.Topics.Predication}

{include 1 InfomaterialManual.PartVII.Topics.Positing}

{include 1 InfomaterialManual.PartVII.Topics.Settling}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.CoreSpine}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.OrderClosure}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.FourValuedBilattice}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.LogicCategories}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.SheafCohomology}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.AlgebraDiscrete}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.DynamicsGeometryPhysics}

{include 1 InfomaterialManual.PartVII.TheoryOverviews.AperiodicityFrontier}
