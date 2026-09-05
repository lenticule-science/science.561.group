import ObsmetrologiaManual.DocSetup
import ObsmetrologiaManual.PartVII.LeanModuleLayout
import ObsmetrologiaManual.PartVII.Topics.Primitives
import ObsmetrologiaManual.PartVII.Topics.Predication
import ObsmetrologiaManual.PartVII.Topics.Positing
import ObsmetrologiaManual.PartVII.Topics.Settling
import ObsmetrologiaManual.PartVII.TheoryOverviews.CoreSpine
import ObsmetrologiaManual.PartVII.TheoryOverviews.OrderClosure
import ObsmetrologiaManual.PartVII.TheoryOverviews.FourValuedBilattice
import ObsmetrologiaManual.PartVII.TheoryOverviews.LogicCategories
import ObsmetrologiaManual.PartVII.TheoryOverviews.SheafCohomology
import ObsmetrologiaManual.PartVII.TheoryOverviews.AlgebraDiscrete
import ObsmetrologiaManual.PartVII.TheoryOverviews.DynamicsGeometryPhysics
import ObsmetrologiaManual.PartVII.TheoryOverviews.AperiodicityFrontier

open Verso.Genre Manual InlineLean

#doc (Manual) "Library atlas" =>

# Back Matter A: Library Atlas

The atlas is the first Mathlib-quality coverage layer for the Lean modules that
already exist in `Obsmetrologia/`. It is not a substitute for generated API docs. It is
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
`Mark`, `Utterance`, `Articulating`, `Articulating.Cell`, `Predicating`,
`Positing`, `Settling`, `Four`, `Articulating.FourCorner`.

Order, closure, and fixed points:
`OrderInfra`, `TruthOrder`, `Ord`, `ClosureRegimeData`,
`Closure.Monad`, `Closure.Monad.KZ`, `Closure.Operator`, `ClosureRule.RuleSystem`,
`Closure.Scott`, `KnasterTarskiStandalone`, `AperiodicOrder.Tiling.StepN.Recurrence`,
`AperiodicOrder.Tiling.StepN.FixedPoint`, `TransfiniteClosureFlow`, `Ordinal`.

Four-valued, bilattice, and nuclear structure:
`ResiduatedLatticeStandalone`, `TwistProductResiduation`, `D4Gauge`,
`Positing.Gauge.K4`, `QuartetRecurrence`, `NuclearSquare`,
`Positing.BigradedTower`, `Positing.FiberAlgebra`, `ValuationQuartetDischarge`,
`NucleusAndCommutingNuclei`, `AperiodicOrder.Tiling.Autopoiesis`,
`PairwiseStoneClopen`, `ModalKripkeFourValued`.

Logic, category, and type-theoretic recovery:
`Hyperdoctrine`, `Quantifying`, `Fibration`,
`Predicating.HyperdoctrineDual`, `Closure.Modal`,
`ResiduatedLatticeStandalone`, `TwistProductResiduation`, `LinearLogicChu`,
`Predicating.CurryHowardLambek`, `LambekCalculus`, `FCALambekCircle`,
`Temporal`, `YonedaArrowsFirst`, `KZCoherentSheaf`,
`QEnriched`, `TheoryRelativeIdeal`, `Factorization`.

Sheaves, cohomology, and settling sites:
`Sheaf`, `DFrame`, `AssocSheaf`, `SettlingCohomologyH1`,
`Positing.Value`, `Cohomology.FrobeniusTQFT`,
`AperiodicOrder.Tiling.Moduli`, `SettlingLocalConstancy`,
`BigradedCohomology`, `BigradedSettlingCohomology`,
`CohomologicalEquivalence`, `CRDTCohomologicalCALM`,
`InconsistencySheaf`, `NegativeParaconsistentSheaf`,
`Site`.

Algebra, combinatorics, and discrete recovery:
`AlgebraHierarchy`, `SetNumberGraphTheory`, `NumberTheoryCombinatorics`,
`CombinatoricsExtremal`, `LinearAlgebra`, `Calculus.LinearAlgebra.RankNullity`,
`FormalConceptAnalysis`, `Equality`, `OrderSwapDuality`, `SynonymyAntonymy`,
`AperiodicOrder.Tiling.Universality`, `Real.Internal`.

Dynamics, optimization, geometry, and physical analogues:
`ClosureFlowDynamics`, `Flow.CurvatureRegime`, `FiringBlowup`,
`Flow.NSCFiring`, `BlowupClassification`, `FreeEnergyLyapunov`,
`Optimization`, `Probability.Stochastic`, `Probability.Measure`,
`CausalSets.Causal.Order`, `CausalSets.Dimension.OrderingFraction`,
`LawvereLaplacianSpectralGap`, `Laplacianizability`,
`AlexandrovHusainov`, `TransfiniteCellComplex`, `SettlingCoalgebra`.

Aperiodic and finite-certificate frontier:
`AperiodicOrder.Tiling.Classification`, `AperiodicOrder.Tiling.Witness.JeandelRao`,
`AperiodicOrder.Tiling.CoClassifying`.

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

{include 1 ObsmetrologiaManual.PartVII.LeanModuleLayout}

{include 1 ObsmetrologiaManual.PartVII.Topics.Primitives}

{include 1 ObsmetrologiaManual.PartVII.Topics.Predication}

{include 1 ObsmetrologiaManual.PartVII.Topics.Positing}

{include 1 ObsmetrologiaManual.PartVII.Topics.Settling}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.CoreSpine}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.OrderClosure}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.FourValuedBilattice}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.LogicCategories}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.SheafCohomology}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.AlgebraDiscrete}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.DynamicsGeometryPhysics}

{include 1 ObsmetrologiaManual.PartVII.TheoryOverviews.AperiodicityFrontier}
