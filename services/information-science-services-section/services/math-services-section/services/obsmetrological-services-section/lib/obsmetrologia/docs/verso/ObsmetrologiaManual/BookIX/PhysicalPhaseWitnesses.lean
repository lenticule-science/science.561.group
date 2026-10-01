import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.CondensedMatter.GlassDynamics.KCM
import ObsmetrologiaPhysicalScience.KineticTheory.Fluid.VortexCohomology
import ObsmetrologiaPhysicalScience.KineticTheory.Plasma.ReconnectionCurvature
import ObsmetrologiaPhysicalScience.ReactionNetworks.SupportProjection
import ObsmetrologiaPhysicalScience.QuantumContextuality.HardyModel
import ObsmetrologiaPhysicalScience.QuantumContextuality.PentagonSymmetry
import ObsmetrologiaPhysicalScience.QuantumContextuality.KCBS

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Discrete
open Obsmetrologia.Flow.CurvatureRegime
open Obsmetrologia.Flow.NSCFiring
open Obsmetrologia.KineticTheory.Fluid
open Obsmetrologia.AperiodicOrder.GlassDynamics
open Obsmetrologia.KineticTheory.Plasma
open Obsmetrologia.QuantumContextuality
open Obsmetrologia.ReactionNetworks

/-!
A teaching chapter for the first cross-domain physical phase witnesses.
-/

#doc (Manual) "Physical phase witnesses" =>

# Physical Phase Witnesses

Book IX begins where a reader trained by ordinary mathematics is most likely to
misfile the work. Kinetic constraints, vortex circulation, magnetic reconnection,
reaction networks, and quantum contextuality look like different subjects. In
Obsmetrologia they are not sovereign top-level subjects. They are phase witnesses.

The claim-site carried here is:

* claim-site: older physical theories as phase-local witnesses of generated
  relational matter;
* phase: relational physical phases;
* generating sites: closure, cohomological obstruction, Scott failure,
  support projection, gluing obstruction;
* Lean carriers: `Obsmetrologia.AperiodicOrder.GlassDynamics.KCM`,
  `Obsmetrologia.KineticTheory.Fluid.VortexCohomology`,
  `Obsmetrologia.KineticTheory.Plasma.ReconnectionCurvature`,
  `Obsmetrologia.ReactionNetworks.SupportProjection`,
  `Obsmetrologia.QuantumContextuality.MeasurementScenario`,
  `Obsmetrologia.QuantumContextuality.ContextualObstruction`,
  `Obsmetrologia.QuantumContextuality.HardyModel`,
  `Obsmetrologia.QuantumContextuality.PentagonSymmetry`,
  `Obsmetrologia.QuantumContextuality.KCBS`;
* familiar comparisons: kinetically constrained models, vortex cohomology, frozen-in
  flux and reconnection, Datalog readings of reaction networks, Abramsky-
  Brandenburger contextuality;
* danger: teaching physical domains as applications pasted onto the library
  rather than as tests of which relational phase is active.

The governing sentence is:

> A physical theory enters the book when it witnesses a generated relational
> behavior under an older disciplinary name.

This is why a chapter like this cannot be organized as a list of examples. Each
domain must say which relational behavior it exposes. The older name is then a
projection of that behavior, not the source of law.

## Kinetic Facilitation Is Closure

A kinetically constrained model is not introduced as a new physical primitive.
Its deterministic skeleton is a closure operator on active sites: keep active
sites active, and activate a site when an active neighbor facilitates it.

The step is:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.activateStep}

The two closure laws already visible at one step are:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.activateStep_infl}

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.activateStep_mono}

Fixedness is the closure condition:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.activateStep_fixed}

and the settled reachable set is named directly as `ActiveClosure`:

{docstring Obsmetrologia.AperiodicOrder.GlassDynamics.activation_is_facilitation_closure}

Checked:

```lean
example {V : Type} (sites : List V) (fac : Graph V)
    (a : V -> Bool) (x : V) (hx : a x = true) :
    activateStep sites fac a x = true :=
  activateStep_infl sites fac a x hx

example {V : Type} (sites : List V) (fac : Graph V)
    (seed : V -> Bool) :
    (forall x, seed x = true ->
      ActiveClosure sites fac seed x) :=
  (activation_is_facilitation_closure sites fac seed).1
```

The phase lesson is precise: the glass word does not license a separate physics
ontology. The KCM carrier says that dynamic facilitation has a deterministic
closure projection. Stochastic relaxation remains frontier relative to this
dependency-free core; the closure witness is settled.

## Vortex Circulation Is Cohomological Obstruction

The fluid chapter should not begin with continuum vector calculus. The Lean
carrier begins with a finite loop and an integer velocity reading. Around such a
loop, gradient flows have zero circulation. Nonzero circulation is therefore an
obstruction to being a gradient.

The loop integral carrier is:

{docstring Obsmetrologia.KineticTheory.Fluid.loopSum}

{docstring Obsmetrologia.KineticTheory.Fluid.VortexLoop}

{docstring Obsmetrologia.KineticTheory.Fluid.circulation}

The gradient predicate is:

{docstring Obsmetrologia.KineticTheory.Fluid.IsGradient}

The vanishing theorem is:

{docstring Obsmetrologia.KineticTheory.Fluid.gradient_circulation_zero}

and the obstruction theorem is:

{docstring Obsmetrologia.KineticTheory.Fluid.vortex_obstruction_implies_H1_nonzero}

The unit vortex is the smallest inhabited witness:

{docstring Obsmetrologia.KineticTheory.Fluid.unitVortex}

{docstring Obsmetrologia.KineticTheory.Fluid.unitVortex_circulation}

{docstring Obsmetrologia.KineticTheory.Fluid.unitVortex_not_gradient}

Checked:

```lean
example {L : VortexLoop} (h : IsGradient L) :
    circulation L = 0 :=
  gradient_circulation_zero L h

example :
    circulation unitVortex = 1 :=
  unitVortex_circulation

example :
    Not (IsGradient unitVortex) :=
  unitVortex_not_gradient
```

The familiar mathematical comparison is first cohomology: a nonzero loop integral is
not merely a number attached to a fluid. It is a failure of exactness. The book
must teach the obstruction before it teaches the fluid image, or the reader will
mistake the image for the carrier.

## Plasma Reconnection Is Non-Scott Curvature

Magnetic reconnection is the physical name for a regime change. Ideal frozen-in
flux preserves the field-line structure across the relevant limit. Reconnection
is the failure of that preservation. In Obsmetrologia that failure is carried as
non-Scott firing and classified as curvature.

The flow carrier is:

{docstring Obsmetrologia.KineticTheory.Plasma.FieldLineFlow}

Frozen-in behavior and reconnection are opposite readings of the same
non-Scott predicate:

{docstring Obsmetrologia.KineticTheory.Plasma.FrozenIn}

{docstring Obsmetrologia.KineticTheory.Plasma.ReconnectionEvent}

{docstring Obsmetrologia.KineticTheory.Plasma.frozen_in_iff_no_reconnection}

The physical firing theorem is:

{docstring Obsmetrologia.KineticTheory.Plasma.reconnection_event_implies_firing}

and the ideal regime forbids it:

{docstring Obsmetrologia.KineticTheory.Plasma.ideal_flow_has_no_reconnection}

The canonical reconnection witness is explicit:

{docstring Obsmetrologia.KineticTheory.Plasma.canonicalReconnection}

{docstring Obsmetrologia.KineticTheory.Plasma.canonicalReconnection_is_event}

{docstring Obsmetrologia.KineticTheory.Plasma.canonicalReconnection_regime_curved}

Checked:

```lean
example :
    ReconnectionEvent canonicalReconnection :=
  canonicalReconnection_is_event

example :
    FrozenIn canonicalReconnection
      <-> Not (ReconnectionEvent canonicalReconnection) :=
  frozen_in_iff_no_reconnection canonicalReconnection

example :
    IsCurved (classify nscRegimeData) :=
  canonicalReconnection_regime_curved
```

The phase lesson is that plasma topology is not filed under electromagnetism as
a primitive. It is filed under closure regime. Reconnection matters because it
witnesses a non-Scott curvature event.

## Reaction Networks Have A Datalog Projection

Reaction networks are linear in the sense that counts can be spent. Datalog is
affine or monotone in the sense that support only grows. Forgetting counts sends
a reaction network to a support projection, but the projection is only a containment
unless no species is fully consumed.

The support projection is:

{docstring Obsmetrologia.ReactionNetworks.supp}

The support order is:

{docstring Obsmetrologia.ReactionNetworks.ble}

The Datalog step is:

{docstring Obsmetrologia.ReactionNetworks.datalogStep}

It is a closure-like support step:

{docstring Obsmetrologia.ReactionNetworks.datalogStep_infl}

{docstring Obsmetrologia.ReactionNetworks.datalogStep_mono}

The honest comparison with firing is:

{docstring Obsmetrologia.ReactionNetworks.support_fire_le_datalog}

The exact error term is consumption:

{docstring Obsmetrologia.ReactionNetworks.consumption_is_the_gap}

and the catalytic case is equality:

{docstring Obsmetrologia.ReactionNetworks.support_fire_eq_datalog_of_no_consumption}

Checked:

```lean
example {Species : Type} (univ : List Species)
    (r : Reaction Species) (b : Species -> Bool) :
    ble b (datalogStep univ r b) :=
  datalogStep_infl univ r b

example {Species : Type} (univ : List Species)
    (r : Reaction Species) {b b' : Species -> Bool}
    (h : ble b b') :
    ble (datalogStep univ r b) (datalogStep univ r b') :=
  datalogStep_mono univ r h
```

This is the repair path for a common bad page: never say "reaction networks are
Datalog." Say: the support reading of a reaction network has a Datalog support projection;
the gap between projection and firing is consumption; equality is a special
catalytic regime.

## Quantum Contextuality Is Gluing Failure

Quantum contextuality belongs in Book IX only because the fibered and
cohomological phase has already taught local-to-global gluing. The physical
claim is not "quantum mechanics is weird." The claim is that a family of local
supports may have no global section, or that a particular local section may fail
to extend even when some other global section exists.

The measurement cover and support model are:

{docstring Obsmetrologia.QuantumContextuality.Scenario}

{docstring Obsmetrologia.QuantumContextuality.Model}

The global-gluing question is:

{docstring Obsmetrologia.QuantumContextuality.HasGlobalSection}

{docstring Obsmetrologia.QuantumContextuality.StronglyContextual}

The PR box inhabits strong contextuality:

{docstring Obsmetrologia.QuantumContextuality.prBox}

{docstring Obsmetrologia.QuantumContextuality.prBox_no_global}

{docstring Obsmetrologia.QuantumContextuality.prBox_strongly_contextual}

Logical contextuality asks about extending one local section:

{docstring Obsmetrologia.QuantumContextuality.Extends}

{docstring Obsmetrologia.QuantumContextuality.LogicallyContextual}

{docstring Obsmetrologia.QuantumContextuality.prBox_logicallyContextual}

The Hardy model proves that the middle rung is real, not a prose distinction:

{docstring Obsmetrologia.QuantumContextuality.hardyBox}

{docstring Obsmetrologia.QuantumContextuality.hardyWitness}

{docstring Obsmetrologia.QuantumContextuality.hardy_witness_not_extends}

{docstring Obsmetrologia.QuantumContextuality.hardyBox_logical_not_strong}

Checked:

```lean
example :
    StronglyContextual prBox :=
  prBox_strongly_contextual

example :
    LogicallyContextual prBox :=
  prBox_logicallyContextual

example :
    Noncontextual hardyBox /\ LogicallyContextual hardyBox
      /\ Not (StronglyContextual hardyBox) :=
  hardyBox_logical_not_strong

example :
    Not (Extends hardyBox
      [(false, true), (true, true)] hardyWitness) :=
  hardy_witness_not_extends
```

The phase lesson is again filing discipline. Contextuality is a gluing
obstruction over a support-valued model. Hilbert space is not the carrier here.
The carrier is the finite measurement scenario whose local support sections
cannot be globally glued.

## KCBS Is The Pentagon's Own Gluing Question

The Hardy model split logical from strong contextuality on four measurements.
The Klyachko-Can-Binicioglu-Shumovsky (KCBS) pentagon puts the same gluing
question on five: one system, five yes/no measurements sitting on the vertices
of a 5-cycle, adjacent measurements exclusive. It is admitted here for the same
reason as the rest of this chapter, not because "five" is an interesting
number: it is a support model over a different cover shape, and that cover has
its own symmetry, which is worth carrying explicitly rather than leaving
implicit.

The cover's symmetry is the dihedral group of the pentagon, built the same way
Book III built the reading square's D4 -- as a generated automorphism group, not
imported group theory:

{docstring Obsmetrologia.QuantumContextuality.D5}

{docstring Obsmetrologia.QuantumContextuality.D5.adj}

{docstring Obsmetrologia.QuantumContextuality.D5.act_preserves_adj}

The KCBS scenario and its exclusivity support sit on that same cover:

{docstring Obsmetrologia.QuantumContextuality.kcbsScenario}

{docstring Obsmetrologia.QuantumContextuality.kcbsModel}

Unlike the PR box, a global section always exists here (the all-`false`
assignment), so KCBS is not strongly contextual in the possibilistic sense.
Its content is a bound on *how much* a classical assignment can claim, not
whether one exists:

{docstring Obsmetrologia.QuantumContextuality.trueCount}

{docstring Obsmetrologia.QuantumContextuality.kcbs_classical_bound}

Checked:

```lean
example :
    AllContextsInhabited kcbsModel :=
  kcbsModel_inhabited

example (g : Fin 5 -> Bool)
    (hg : forall C, C ∈ kcbsScenario.contexts -> kcbsModel.support C g) :
    trueCount g <= 2 :=
  kcbs_classical_bound g hg
```

This is the possibilistic half only: the classical bound `2`, proved as a
finite fact by exhaustion over the cover's `2^5` assignments. The quantum value
`sqrt 5` that exceeds it is a real-valued refinement not yet built here (see
`Obsmetrologia.AperiodicOrder.Tiling.StepN.GoldenFieldBridge` for the golden
field that value would land in, and the Blueprint's Dervish Recurrence
Conjecture node for the larger pattern this pentagon is one reading of).

## The Common Form

The six witnesses have one common form:

* KCM: a physical transition skeleton is closure;
* vortex: a physical circulation is a cohomological obstruction;
* plasma: a physical reconnection event is non-Scott curvature;
* reaction: a physical firing system has a monotone support projection whose error
  term is consumption;
* quantum (PR/Hardy): a physical contextuality phenomenon is failure of local
  support data to glue;
* quantum (KCBS): a physical contextuality bound is the independence number of
  the cover's own exclusivity graph.

This is the structure Book IX must preserve. Physical pages are admitted when
they identify a relational phase behavior, name the older physical reading, and
show the Lean declaration that carries the claim-site. A page that only explains
the physical subject is not yet a Obsmetrologia page. A page that only lists theorem
names is not yet a book page. The glued page must let a reader pass from
generated relational behavior to the familiar comparison and back again.
