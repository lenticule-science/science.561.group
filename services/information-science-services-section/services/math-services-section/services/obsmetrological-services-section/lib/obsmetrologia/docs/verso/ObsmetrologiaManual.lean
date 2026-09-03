import ObsmetrologiaManual.DocSetup
import ObsmetrologiaManual.BookI.FoundationalVocabulary
import ObsmetrologiaManual.BookI.PhaseMap
import ObsmetrologiaManual.BookI.PageLaw
import ObsmetrologiaManual.BookI.ProofBlueprintCarriers
import ObsmetrologiaManual.BookI.ReadingObsmetrologia
import ObsmetrologiaManual.BookII.GenesisBoundary
import ObsmetrologiaManual.BookIII.PredicationSite
import ObsmetrologiaManual.BookIII.ChargeValue
import ObsmetrologiaManual.BookIII.FregeanFourChu
import ObsmetrologiaManual.BookIII.PositingSymmetryTower
import ObsmetrologiaManual.BookIII.PredicationAdjointsEquality
import ObsmetrologiaManual.BookIV.ClosureOperator
import ObsmetrologiaManual.BookIV.OrdinalAddition
import ObsmetrologiaManual.BookIV.ClosureRegime
import ObsmetrologiaManual.BookIV.RuleGeneratorDynamics
import ObsmetrologiaManual.BookIV.ScottContinuity
import ObsmetrologiaManual.BookIV.FlowCalculus
import ObsmetrologiaManual.BookIV.HarmonicSpectralWitnesses
import ObsmetrologiaManual.BookIV.ClosureFlowSingularities
import ObsmetrologiaManual.BookIV.GeneratedCalculus
import ObsmetrologiaManual.BookIV.GeneratedAlgebraicInterfaces
import ObsmetrologiaManual.BookIV.GeneratedCalculusWitnesses
import ObsmetrologiaManual.BookV.RecurringFour
import ObsmetrologiaManual.BookV.ComputingFormats
import ObsmetrologiaManual.BookV.ItToBitToByte
import ObsmetrologiaManual.BookV.CausalityPackets
import ObsmetrologiaManual.BookV.HoarePrograms
import ObsmetrologiaManual.BookVI.ValuationFiber
import ObsmetrologiaManual.BookVI.GluingWitnesses
import ObsmetrologiaManual.BookVI.StructuredCohomologyWitnesses
import ObsmetrologiaManual.BookVI.SettlingSiteSections
import ObsmetrologiaManual.BookVI.ClaimSiteDescent
import ObsmetrologiaManual.BookVI.Holes
import ObsmetrologiaManual.BookVI.SettlementGenus
import ObsmetrologiaManual.BookVI.DifferentialBypass
import ObsmetrologiaManual.BookVI.DFrameEnrichedSites
import ObsmetrologiaManual.BookVI.CohomologyClaimSites
import ObsmetrologiaManual.BookVII.AperiodicPersistence
import ObsmetrologiaManual.BookVII.StepNAlgebraicPersistence
import ObsmetrologiaManual.BookVII.ClassificationModuli
import ObsmetrologiaManual.BookVIII.CausalOrder
import ObsmetrologiaManual.BookVIII.ArrowOfTime
import ObsmetrologiaManual.BookVIII.IntervalsConesIncidence
import ObsmetrologiaManual.BookVIII.SpacetimeSupportMicrolocal
import ObsmetrologiaManual.BookVIII.CausalCohomologyMld
import ObsmetrologiaManual.BookVIII.OperatorsActionCurvature
import ObsmetrologiaManual.BookVIII.DimensionContinuumFrontier
import ObsmetrologiaManual.BookVIII.KinematicPointsRegionsPatches
import ObsmetrologiaManual.BookVIII.HoleShroud
import ObsmetrologiaManual.BookIX.PhysicalPhaseWitnesses
import ObsmetrologiaManual.BookIX.PhysicalPhaseDiagnostics
import ObsmetrologiaManual.BookIX.TransportScreeningFixedPoints
import ObsmetrologiaManual.BookIX.KineticClosureGluingEntropy
import ObsmetrologiaManual.BookIX.InformationalThermodynamics
import ObsmetrologiaManual.BookIX.FiniteGaugeBridge
import ObsmetrologiaManual.BookIX.MaterialConstraintTopology
import ObsmetrologiaManual.BookIX.FockCondensateGlass
import ObsmetrologiaManual.BookIX.QuantumEmpiricalDescent
import ObsmetrologiaManual.BookIX.ReactionReachabilityRates
import ObsmetrologiaManual.BookIX.InformationalKeratin
import ObsmetrologiaManual.BookIX.ShroudIndexedKeratin
import ObsmetrologiaManual.BookIX.KeratinousHoleDisc
import ObsmetrologiaManual.BookX.ComparisonAtlas
import ObsmetrologiaManual.BookXI.FrontierLab
import ObsmetrologiaManual.BookXI.RuntimeVerificationTournament
import ObsmetrologiaManual.BookXI.FrontierDescent
import ObsmetrologiaManual.BookXI.CollatzFrontier
import ObsmetrologiaManual.Appendix.ProofTree
import ObsmetrologiaManual.Curricula.IntroductionToInformationalMathematics.FromPredicationToKinematicSpace

open Verso.Genre Manual InlineLean

/-!
The Obsmetrologia manual document. This root is the book. It does not include the old
Part modules as its governing form.
-/

#doc (Manual) "Obsmetrologia" =>

# Obsmetrologia

Obsmetrologia is a dependency-free Lean 4 formalization of generated relational
mathematics. It admits free data only at the floor: marks and the articulating
recursion. Everything below that floor is generated, measured, settled, obstructed,
or recovered.

This book is not an API manual, not a six-part documentation wrapper, and not a
tour of familiar subjects. It is the primary prose territory for learning the
phases of relational matter.

The old mathematical words still appear: category, order, equality, sheaf,
cohomology, Scott-continuity, fiber algebra, spacetime, quantum contextuality,
reaction network, fluid vortex, plasma reconnection. But they are not sovereign
headings. They live inside phases. A known theory appears only as a generated
comparison when it is the visible interface of a deeper generated phase.

The book is therefore organized by phase, not by resemblance.

## How To Read This Book

The first question is always:

> What phase makes this claim lawful?

A claim-site is a typed mathematical address where a claim can live. It may be
carried by Lean as a declaration, by Blueprint as an incidence node, by Verso as
exposition, by generated docs as interface, and by notes or archive material as
provenance. The site is not identical to any carrier. A mature claim is glued
across its carriers.

Drift is failed gluing. A theorem marked proved in a graph but absent from Lean is
drift. A beautiful explanation with no claim-site is drift. A declaration exposed
by API docs but absent from the teaching surface is isolated settlement. A concept
with provenance but no promoted site remains latent.

Verso's role is not to repeat the Lean library in prose. Verso must teach the
reader how a claim is generated, which phase contains it, what older mathematics
it recovers as comparison or specialization, and what remains unsettled.

## The Page Law

Every stable page in this book must answer:

* what claim-site it carries;
* what phase makes the claim lawful;
* what earlier sites generate it;
* what later sites it supports;
* what Lean declarations settle or witness it;
* what Blueprint nodes record its incidence and proof status;
* what provenance explains why it was introduced;
* what familiar mathematics appears here only as comparison or specialization;
* what closure the reader must perform;
* what remains frontier.

A page that cannot answer those questions is not yet a book page. It is a note,
a lab trace, a frontier marker, or an atlas entry.

# Books Of Curricula

Curricula are guided routes through the phase books. They do not replace the
book's phase order. They give a reader a first path through already-generated
claim-sites, with the dependencies visible enough that a later phase is not
mistaken for a primitive floor.

## Introduction To Informational Mathematics

This curriculum starts with the mark floor and ends at the first kinematic
bead-thread reading. Its purpose is to teach how the ordinary desire for
"space" is delayed until articulation has generated causal diamonds and
sequencing has made those diamonds into a causal set.

{include 1 ObsmetrologiaManual.Curricula.IntroductionToInformationalMathematics.FromPredicationToKinematicSpace}

# Book I: Prolegomena To Relational Matter

The prolegomenon teaches the discipline before the reader meets the phases.

Obsmetrologia does not begin with sets, categories, spaces, truth values, physical
objects, or histories. It begins with generated relation. This matters because the
familiar foundations are not being rejected; they are being relocated. They become
recoveries inside a larger generated order.

The reader must therefore suspend the reflex that files a result under the
nearest known discipline. A construction that looks like algebra may live inside
the language phase. A construction that looks like topology may live inside
cohomological matter. A construction that looks like spacetime may live inside
causal settling. The filing question is not "what does this resemble?" but "what
generated this?"

## Panels, Gutters, And Closure

Mathematical prose works through panels and gutters. A panel is a bounded unit:
definition, theorem, example, proof sketch, Lean declaration, diagram, conjecture,
frontier warning, or narrative bridge. A gutter is the reader's required closure
between panels.

This book may leave work for the reader, but it must make that work accountable.
No hidden theorem. No prestige notation. No formal proof used as a substitute for
conceptual transport. No motivational prose passed off as proof. No familiar word
used before the phase that generates it.

The book may use pedagogical sequence, research sequence, proof-plan sequence, or
formalization sequence. It must not silently confuse them.

{include 1 ObsmetrologiaManual.BookI.FoundationalVocabulary}

{include 1 ObsmetrologiaManual.BookI.PhaseMap}

{include 1 ObsmetrologiaManual.BookI.PageLaw}

{include 1 ObsmetrologiaManual.BookI.ProofBlueprintCarriers}

{include 1 ObsmetrologiaManual.BookI.ReadingObsmetrologia}

# Book II: Genesis

Genesis is the admission boundary.

At the floor there are marks. A mark is not yet an object, proposition, truth
value, element, point, event, particle, or state. It is the atomic admission before
relation has generated structure.

An utterance is the first structured carrier: token side and claim side. The
distinction is positional. It is not yet subject-predicate-object grammar, and it
is not yet truth.

Articulating is the first constructive act. It is the recursion that brings
utterances into relation. This is the last primitive admission. Below articulation
the burden changes: the book must say what generated the object rather than
treating the object as free.

The first recurring four is born here. An utterance has two sides, and each side
may be articulated or not. The four corners are not yet truth values. They are
articulation statuses.

The central prohibition of Genesis is simple: do not import later structure. If a
sentence needs value, order, category, equality, sheaf, topology, or regime, it
has already left Genesis.

{include 1 ObsmetrologiaManual.BookII.GenesisBoundary}

# Book III: The Language Phase

The language phase begins when articulation becomes position.

Predicating turns a potential articulation cell into an oriented predication
site. Subject, predicate, and object become lawful words here, but only as
generated positions. A predication is not yet true, false, supported,
contradicted, settled, or coherent. It is a place where value may later live.

Category theory first appears as a comparison generated by predication. Oriented cells and
lawful transformations make categorical language available. Category is not the
ambient metalanguage from which Obsmetrologia starts.

Positing gives predication positions standing. The standing is not Boolean truth.
It is bilattice-valued: evidence for and evidence against are independent. The
four values are no information, support, opposition, and overdetermination.

Two orders appear on this value object. The knowledge order measures evidence.
The truth order measures truth-like orientation. Confusing them destroys the
phase. Classical truth is a collapse of this richer standing, not the floor from
which it is built.

Inside this phase live the comparisons usually called logic, equality, fibration,
hyperdoctrine, quantification, Curry-Howard-Lambek, and Yoneda. They do not become
top-level subjects. They become lawful when the predication and positing machinery
has generated the sites on which they can act.

{include 1 ObsmetrologiaManual.BookIII.PredicationSite}

{include 1 ObsmetrologiaManual.BookIII.ChargeValue}

{include 1 ObsmetrologiaManual.BookIII.FregeanFourChu}

{include 1 ObsmetrologiaManual.BookIII.PositingSymmetryTower}

{include 1 ObsmetrologiaManual.BookIII.PredicationAdjointsEquality}

# Book IV: The Closure Phase

The closure phase begins when posited content is allowed to settle.

Settling is closure to a fixed point, or the discovery that the closure behavior
does not stabilize in the expected regime. Order is generated here. Fixed points
are generated here. Closure ordinal and regime are generated here.

Scott-continuity belongs here. It is not a general topic imported from domain
theory. In Obsmetrologia it is the condition that a closure operator commutes with
directed joins. Finite-antecedent rules give Scott-continuous closure. Infinitary
antecedents and non-Scott firings expose higher regimes.

The closure regimes are strict, Scott, transfinite-bounded, and aperiodic. They
are not metadata. They are phases of closure matter. The strict regime settles
finitely. The Scott regime stabilizes at omega. The transfinite-bounded regime is
non-Scott but countably controlled. The aperiodic regime is where ordinary
stabilization fails and new invariants become necessary.

KZ and lax-idempotent structure appear here as closure reductions. Curvature appears
when closure fails to commute with the limit it was expected to preserve.

{include 1 ObsmetrologiaManual.BookIV.ClosureOperator}

{include 1 ObsmetrologiaManual.BookIV.OrdinalAddition}

{include 1 ObsmetrologiaManual.BookIV.ClosureRegime}

{include 1 ObsmetrologiaManual.BookIV.RuleGeneratorDynamics}

{include 1 ObsmetrologiaManual.BookIV.ScottContinuity}

{include 1 ObsmetrologiaManual.BookIV.FlowCalculus}

{include 1 ObsmetrologiaManual.BookIV.HarmonicSpectralWitnesses}

{include 1 ObsmetrologiaManual.BookIV.ClosureFlowSingularities}

{include 1 ObsmetrologiaManual.BookIV.GeneratedCalculus}

{include 1 ObsmetrologiaManual.BookIV.GeneratedAlgebraicInterfaces}

{include 1 ObsmetrologiaManual.BookIV.GeneratedCalculusWitnesses}

# Book V: Fourfold Relational Matter

The recurring FOUR is the same four-corner coherence met at different depths.

At articulation it is phase: absurd, potential, active, stable. At positing it is
charge: no information, support, opposition, overdetermination. At modal depth it
is neither, diamond, box, both. At nuclear depth it is the quartet generated by
two commuting nuclei. At closure depth it is regime.

The point is not that everything has four examples. The point is that the
four-corner cell is transported through phases. Some structure transports, and
some does not. Involutions at one depth are not the same operations as idempotent
nuclei at another depth. The shared object is the coherence cell, not every
algebraic law attached to an instance.

This book must teach restraint. Resemblance is not theorem. A transported
four-corner object is a theorem only to the extent that the transport has been
specified and witnessed.

{include 1 ObsmetrologiaManual.BookV.RecurringFour}

{include 1 ObsmetrologiaManual.BookV.ComputingFormats}

{include 1 ObsmetrologiaManual.BookV.ItToBitToByte}

{include 1 ObsmetrologiaManual.BookV.CausalityPackets}

{include 1 ObsmetrologiaManual.BookV.HoarePrograms}

# Book VI: Fibered And Cohomological Matter

Once relational content settles locally, the next question is whether it glues.

This is where fiber algebras, sheaves, sites, cohomology, defects, obstruction,
local constancy, and bigraded invariants live. They are not imported as ordinary
topology. They measure whether local relational sections assemble into global
settled matter.

A fiber algebra is phase-local. The valuation fiber carries a truth-order Heyting
structure. The nuclei live inside that truth-order fiber. The knowledge order is
an orthogonal grade, not a second nucleus on the same algebra. This is why fiber
algebra must not be filed as generic algebra.

H1 vanishing is not a slogan from sheaf theory. It says that in strict and
Scott-continuous regimes, the relevant local data glues without obstruction.
Non-vanishing marks defect, curvature, contextuality, vortex, reconnection, or
aperiodic obstruction depending on the phase domain.

Bigraded cohomology is the cohomology of the two-order situation. Truth and
knowledge are not two notations for one axis. They generate a genuinely bigraded
measurement of relational matter.

{include 1 ObsmetrologiaManual.BookVI.ValuationFiber}

{include 1 ObsmetrologiaManual.BookVI.GluingWitnesses}

{include 1 ObsmetrologiaManual.BookVI.StructuredCohomologyWitnesses}

{include 1 ObsmetrologiaManual.BookVI.SettlingSiteSections}

{include 1 ObsmetrologiaManual.BookVI.ClaimSiteDescent}

{include 1 ObsmetrologiaManual.BookVI.Holes}

{include 1 ObsmetrologiaManual.BookVI.DifferentialBypass}

{include 1 ObsmetrologiaManual.BookVI.DFrameEnrichedSites}

{include 1 ObsmetrologiaManual.BookVI.CohomologyClaimSites}

# Book VII: Aperiodic And Persistent Matter

Aperiodicity is where closure refuses the finite and Scott-continuous comfort of
the earlier regimes.

Here persistence becomes matter. Ports, inverse hulls, substitutions,
co-classifying invariants, condensates, jamming, metallization, and matter
topology are not decorative applications. They are witnesses that relational
settling can produce persistent phase structure.

A condensate is held inconsistency. A material is an assembly of condensates that
can jam. A load-bearing network is not merely dense; it carries cycle topology.
Rigidity appears when contact structure closes cycles. Density is not enough.
Topology matters.

The familiar mathematics of tilings, symbolic dynamics, substitution systems,
cohomology, and material science appears here as comparison. It should be taught only
after the reader sees the closure and obstruction machinery that makes persistence
lawful.

{include 1 ObsmetrologiaManual.BookVII.AperiodicPersistence}

{include 1 ObsmetrologiaManual.BookVII.StepNAlgebraicPersistence}

{include 1 ObsmetrologiaManual.BookVII.ClassificationModuli}

# Book VIII: Relational Spacetime

Spacetime is a relational phase domain.

A causal structure is a Boolean settling over pairs of events. The seed relation
records direct causal links. The closure step adds factorizations through
intermediate events. The settled valuation is the transitive causal order.

From that causal settling come Alexandrov intervals, cones, incidence, Mobius
inversion, causal diamonds, kinematic regions, d'Alembertian operators,
dimension estimators, curvature invariants, action invariants, boundary
horizons, and continuum reconstruction frontiers.

Lorentzian geometry is not the primitive setting. It is recovered as a comparison from
causal settling and its incidence/cohomological invariants. The continuum is not
the floor; it is a limit problem.

{include 1 ObsmetrologiaManual.BookVIII.CausalOrder}

{include 1 ObsmetrologiaManual.BookVIII.KinematicPointsRegionsPatches}

{include 1 ObsmetrologiaManual.BookVIII.ArrowOfTime}

{include 1 ObsmetrologiaManual.BookVIII.IntervalsConesIncidence}

{include 1 ObsmetrologiaManual.BookVIII.SpacetimeSupportMicrolocal}

{include 1 ObsmetrologiaManual.BookVIII.CausalCohomologyMld}

{include 1 ObsmetrologiaManual.BookVIII.OperatorsActionCurvature}

{include 1 ObsmetrologiaManual.BookVIII.DimensionContinuumFrontier}

{include 1 ObsmetrologiaManual.BookVIII.HoleShroud}

# Book IX: Relational Physical Phases

The physical phase domains test whether the generated machinery can carry the
older world without importing it as primitive.

In kinetic systems, facilitation is closure. A site becomes active when active
neighbors make it possible. Kinetically constrained models are phase witnesses for
deterministic and stochastic closure behavior.

In fluids, vortex circulation is a cohomological obstruction. A gradient flow has
zero circulation; nonzero circulation witnesses an H1 class.

In plasmas, magnetic reconnection is a non-Scott curvature event. Ideal frozen-in
flux is Scott-like preservation across the limit. Reconnection is the failure of
that preservation.

In reactions, a reaction network has a Datalog support projection. Forgetting counts
collapses linear consumption into monotone presence. The gap between actual firing
and Datalog closure is exactly consumption.

In quantum systems, contextuality is failure of global gluing. A local section may
exist without extending to a global section. The obstruction is sheaf-like because
the phase is gluing-sensitive.

Dense matter, thermodynamics, spacetime action, plasma topology, and reaction
entropy must be taught the same way: as phase-local comparisons of generated
relational matter.

{include 1 ObsmetrologiaManual.BookIX.PhysicalPhaseWitnesses}

{include 1 ObsmetrologiaManual.BookIX.PhysicalPhaseDiagnostics}

{include 1 ObsmetrologiaManual.BookIX.TransportScreeningFixedPoints}

{include 1 ObsmetrologiaManual.BookIX.KineticClosureGluingEntropy}

{include 1 ObsmetrologiaManual.BookIX.InformationalThermodynamics}

{include 1 ObsmetrologiaManual.BookIX.FiniteGaugeBridge}

{include 1 ObsmetrologiaManual.BookIX.MaterialConstraintTopology}

{include 1 ObsmetrologiaManual.BookIX.FockCondensateGlass}

{include 1 ObsmetrologiaManual.BookIX.QuantumEmpiricalDescent}

{include 1 ObsmetrologiaManual.BookIX.ReactionReachabilityRates}

{include 1 ObsmetrologiaManual.BookIX.InformationalKeratin}

{include 1 ObsmetrologiaManual.BookIX.ShroudIndexedKeratin}

{include 1 ObsmetrologiaManual.BookIX.KeratinousHoleDisc}

# Book X: Comparison Atlas

The atlas exists for lookup, not sovereignty.

Known mathematics belongs here only after the phase that generates it has been
identified.

Category theory: generated by predication.

Order theory: generated by settling.

Boolean truth: collapse of bilattice value.

Equality: derived diagonal image in the relevant adjoint system.

Scott-continuity: closure-regime condition.

Fiber algebra: valuation-fiber structure inside positing and settling.

Sheaf cohomology: gluing and obstruction of settled sections.

Aperiodic topology: persistence and non-Scott obstruction.

Spacetime geometry: causal settling, incidence, and continuum frontier.

Physical theories: phase witnesses, not primitive ontologies.

The atlas may point to Lean modules, declarations, API pages, Blueprint nodes, and
provenance. It must never make ordinary subject classification the hidden form of
the book.

{include 1 ObsmetrologiaManual.BookX.ComparisonAtlas}

# Book XI: Frontier And Lab

The frontier is the set of claims whose generating path is visible but whose proof
or transport is not yet settled.

A frontier claim must state:

* the intended theorem;
* the phase that makes its terms lawful;
* the existing Lean witnesses;
* the missing bridge;
* the reason the strong statement has not been weakened into a misleading toy.

Blueprint records incidence and pressure. Lean records settlement. Verso records
the teachable transport. Provenance records why the claim entered the system.

The lab is where claims move between those carriers. A concept may begin as a
note, become a frontier node, acquire a Lean witness, and then become a page in
the phase volume where it belongs. The book is coherent when that movement is
visible.

{include 1 ObsmetrologiaManual.BookXI.FrontierLab}

{include 1 ObsmetrologiaManual.BookXI.RuntimeVerificationTournament}

{include 1 ObsmetrologiaManual.BookXI.FrontierDescent}

{include 1 ObsmetrologiaManual.BookXI.CollatzFrontier}

# Appendix: Proof Tree

{include 1 ObsmetrologiaManual.Appendix.ProofTree}
