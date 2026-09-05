import InfomaterialManual.DocSetup
import InfomaterialManual.BookI.FoundationalVocabulary
import InfomaterialManual.BookI.PhaseMap
import InfomaterialManual.BookI.PageLaw
import InfomaterialManual.BookI.ProofBlueprintCarriers
import InfomaterialManual.BookI.ReadingInfomaterial
import InfomaterialManual.BookII.GenesisBoundary
import InfomaterialManual.BookIII.PredicationSite
import InfomaterialManual.BookIII.ChargeValue
import InfomaterialManual.BookIII.PositingSymmetryTower
import InfomaterialManual.BookIII.PredicationAdjointsEquality
import InfomaterialManual.BookIV.ClosureOperator
import InfomaterialManual.BookIV.ClosureRegime
import InfomaterialManual.BookIV.RuleGeneratorDynamics
import InfomaterialManual.BookIV.ScottContinuity
import InfomaterialManual.BookIV.FlowCalculus
import InfomaterialManual.BookIV.HarmonicSpectralWitnesses
import InfomaterialManual.BookIV.ClosureFlowSingularities
import InfomaterialManual.BookIV.GeneratedCalculus
import InfomaterialManual.BookIV.GeneratedAlgebraicInterfaces
import InfomaterialManual.BookIV.GeneratedCalculusWitnesses
import InfomaterialManual.BookV.RecurringFour
import InfomaterialManual.BookV.ComputingFormats
import InfomaterialManual.BookVI.ValuationFiber
import InfomaterialManual.BookVI.GluingWitnesses
import InfomaterialManual.BookVI.StructuredCohomologyWitnesses
import InfomaterialManual.BookVI.SettlingSiteSections
import InfomaterialManual.BookVI.ClaimSiteDescent
import InfomaterialManual.BookVI.HolesAndInfoholes
import InfomaterialManual.BookVI.DFrameEnrichedSites
import InfomaterialManual.BookVI.CohomologyClaimSites
import InfomaterialManual.BookVII.AperiodicPersistence
import InfomaterialManual.BookVII.StepNAlgebraicPersistence
import InfomaterialManual.BookVII.ClassificationModuli
import InfomaterialManual.BookVIII.CausalOrder
import InfomaterialManual.BookVIII.IntervalsConesIncidence
import InfomaterialManual.BookVIII.SpacetimeSupportMicrolocal
import InfomaterialManual.BookVIII.CausalCohomologyMld
import InfomaterialManual.BookVIII.OperatorsActionCurvature
import InfomaterialManual.BookVIII.DimensionContinuumFrontier
import InfomaterialManual.BookVIII.InfoholeShroud
import InfomaterialManual.BookIX.PhysicalPhaseWitnesses
import InfomaterialManual.BookIX.PhysicalPhaseDiagnostics
import InfomaterialManual.BookIX.TransportScreeningFixedPoints
import InfomaterialManual.BookIX.KineticClosureGluingEntropy
import InfomaterialManual.BookIX.InformationalThermodynamics
import InfomaterialManual.BookIX.FiniteGaugeBridge
import InfomaterialManual.BookIX.MaterialConstraintTopology
import InfomaterialManual.BookIX.QuantumEmpiricalDescent
import InfomaterialManual.BookIX.ReactionReachabilityRates
import InfomaterialManual.BookIX.InformationalKeratin
import InfomaterialManual.BookIX.ShroudIndexedKeratin
import InfomaterialManual.BookIX.KeratinousInfoholeDisc
import InfomaterialManual.BookX.ComparisonAtlas
import InfomaterialManual.BookXI.FrontierLab
import InfomaterialManual.BookXI.RuntimeVerificationTournament
import InfomaterialManual.BookXI.FrontierDescent
import InfomaterialManual.Appendix.ProofTree

open Verso.Genre Manual InlineLean

/-!
The Infomaterial manual document. This root is the book. It does not include the old
Part modules as its governing form.
-/

#doc (Manual) "Infomaterial" =>

# Infomaterial

Infomaterial is a dependency-free Lean 4 formalization of generated relational
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

# Book I: Prolegomena To Relational Matter

The prolegomenon teaches the discipline before the reader meets the phases.

Infomaterial does not begin with sets, categories, spaces, truth values, physical
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

{include 1 InfomaterialManual.BookI.FoundationalVocabulary}

{include 1 InfomaterialManual.BookI.PhaseMap}

{include 1 InfomaterialManual.BookI.PageLaw}

{include 1 InfomaterialManual.BookI.ProofBlueprintCarriers}

{include 1 InfomaterialManual.BookI.ReadingInfomaterial}

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

{include 1 InfomaterialManual.BookII.GenesisBoundary}

# Book III: The Language Phase

The language phase begins when articulation becomes position.

Predicating turns a potential articulation cell into an oriented predication
site. Subject, predicate, and object become lawful words here, but only as
generated positions. A predication is not yet true, false, supported,
contradicted, settled, or coherent. It is a place where value may later live.

Category theory first appears as a comparison generated by predication. Oriented cells and
lawful transformations make categorical language available. Category is not the
ambient metalanguage from which Infomaterial starts.

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

{include 1 InfomaterialManual.BookIII.PredicationSite}

{include 1 InfomaterialManual.BookIII.ChargeValue}

{include 1 InfomaterialManual.BookIII.PositingSymmetryTower}

{include 1 InfomaterialManual.BookIII.PredicationAdjointsEquality}

# Book IV: The Closure Phase

The closure phase begins when posited content is allowed to settle.

Settling is closure to a fixed point, or the discovery that the closure behavior
does not stabilize in the expected regime. Order is generated here. Fixed points
are generated here. Closure ordinal and regime are generated here.

Scott-continuity belongs here. It is not a general topic imported from domain
theory. In Infomaterial it is the condition that a closure operator commutes with
directed joins. Finite-antecedent rules give Scott-continuous closure. Infinitary
antecedents and non-Scott firings expose higher regimes.

The closure regimes are strict, Scott, transfinite-bounded, and aperiodic. They
are not metadata. They are phases of closure matter. The strict regime settles
finitely. The Scott regime stabilizes at omega. The transfinite-bounded regime is
non-Scott but countably controlled. The aperiodic regime is where ordinary
stabilization fails and new invariants become necessary.

KZ and lax-idempotent structure appear here as closure reductions. Curvature appears
when closure fails to commute with the limit it was expected to preserve.

{include 1 InfomaterialManual.BookIV.ClosureOperator}

{include 1 InfomaterialManual.BookIV.ClosureRegime}

{include 1 InfomaterialManual.BookIV.RuleGeneratorDynamics}

{include 1 InfomaterialManual.BookIV.ScottContinuity}

{include 1 InfomaterialManual.BookIV.FlowCalculus}

{include 1 InfomaterialManual.BookIV.HarmonicSpectralWitnesses}

{include 1 InfomaterialManual.BookIV.ClosureFlowSingularities}

{include 1 InfomaterialManual.BookIV.GeneratedCalculus}

{include 1 InfomaterialManual.BookIV.GeneratedAlgebraicInterfaces}

{include 1 InfomaterialManual.BookIV.GeneratedCalculusWitnesses}

# Book V: Fourfold Relational Matter

The recurring FOUR is the same four-corner coherence met at different depths.

At articulation it is phase: potential, active, stable, absurd. At positing it is
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

{include 1 InfomaterialManual.BookV.RecurringFour}

{include 1 InfomaterialManual.BookV.ComputingFormats}

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

{include 1 InfomaterialManual.BookVI.ValuationFiber}

{include 1 InfomaterialManual.BookVI.GluingWitnesses}

{include 1 InfomaterialManual.BookVI.StructuredCohomologyWitnesses}

{include 1 InfomaterialManual.BookVI.SettlingSiteSections}

{include 1 InfomaterialManual.BookVI.ClaimSiteDescent}

{include 1 InfomaterialManual.BookVI.HolesAndInfoholes}

{include 1 InfomaterialManual.BookVI.DFrameEnrichedSites}

{include 1 InfomaterialManual.BookVI.CohomologyClaimSites}

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

{include 1 InfomaterialManual.BookVII.AperiodicPersistence}

{include 1 InfomaterialManual.BookVII.StepNAlgebraicPersistence}

{include 1 InfomaterialManual.BookVII.ClassificationModuli}

# Book VIII: Relational Spacetime

Spacetime is a relational phase domain.

A causal structure is a Boolean settling over pairs of events. The seed relation
records direct causal links. The closure step adds factorizations through
intermediate events. The settled valuation is the transitive causal order.

From that causal settling come Alexandrov intervals, cones, incidence, Mobius
inversion, d'Alembertian operators, dimension estimators, curvature invariants,
action invariants, boundary horizons, and continuum reconstruction frontiers.

Lorentzian geometry is not the primitive setting. It is recovered as a comparison from
causal settling and its incidence/cohomological invariants. The continuum is not
the floor; it is a limit problem.

{include 1 InfomaterialManual.BookVIII.CausalOrder}

{include 1 InfomaterialManual.BookVIII.IntervalsConesIncidence}

{include 1 InfomaterialManual.BookVIII.SpacetimeSupportMicrolocal}

{include 1 InfomaterialManual.BookVIII.CausalCohomologyMld}

{include 1 InfomaterialManual.BookVIII.OperatorsActionCurvature}

{include 1 InfomaterialManual.BookVIII.DimensionContinuumFrontier}

{include 1 InfomaterialManual.BookVIII.InfoholeShroud}

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

{include 1 InfomaterialManual.BookIX.PhysicalPhaseWitnesses}

{include 1 InfomaterialManual.BookIX.PhysicalPhaseDiagnostics}

{include 1 InfomaterialManual.BookIX.TransportScreeningFixedPoints}

{include 1 InfomaterialManual.BookIX.KineticClosureGluingEntropy}

{include 1 InfomaterialManual.BookIX.InformationalThermodynamics}

{include 1 InfomaterialManual.BookIX.FiniteGaugeBridge}

{include 1 InfomaterialManual.BookIX.MaterialConstraintTopology}

{include 1 InfomaterialManual.BookIX.QuantumEmpiricalDescent}

{include 1 InfomaterialManual.BookIX.ReactionReachabilityRates}

{include 1 InfomaterialManual.BookIX.InformationalKeratin}

{include 1 InfomaterialManual.BookIX.ShroudIndexedKeratin}

{include 1 InfomaterialManual.BookIX.KeratinousInfoholeDisc}

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

{include 1 InfomaterialManual.BookX.ComparisonAtlas}

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

{include 1 InfomaterialManual.BookXI.FrontierLab}

{include 1 InfomaterialManual.BookXI.RuntimeVerificationTournament}

{include 1 InfomaterialManual.BookXI.FrontierDescent}

# Appendix: Proof Tree

{include 1 InfomaterialManual.Appendix.ProofTree}
