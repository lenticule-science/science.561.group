import InfomaterialManual.DocSetup
import Infomaterial.Relational.Material.Constraint.KCM
import Infomaterial.Relational.Fluid.VortexCohomology
import Infomaterial.Relational.Plasma.ReconnectionCurvature
import Infomaterial.Relational.Reaction.SupportProjection
import Infomaterial.Relational.Quantum.HardyModel

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Discrete
open Infomaterial.Flow.CurvatureRegime
open Infomaterial.Flow.NSCFiring
open Infomaterial.Relational.Fluid
open Infomaterial.Relational.Material.Glass
open Infomaterial.Relational.Plasma
open Infomaterial.Relational.Quantum
open Infomaterial.Relational.Reaction

/-!
A teaching chapter for the first cross-domain physical phase witnesses.
-/

#doc (Manual) "Physical phase witnesses" =>

# Physical Phase Witnesses

Book IX begins where a reader trained by ordinary mathematics is most likely to
misfile the work. Kinetic constraints, vortex circulation, magnetic reconnection,
reaction networks, and quantum contextuality look like different subjects. In
Infomaterial they are not sovereign top-level subjects. They are phase witnesses.

The claim-site carried here is:

* claim-site: older physical theories as phase-local witnesses of generated
  relational matter;
* phase: relational physical phases;
* generating sites: closure, cohomological obstruction, Scott failure,
  support projection, gluing obstruction;
* Lean carriers: `Infomaterial.Relational.Material.Constraint.KCM`,
  `Infomaterial.Relational.Fluid.VortexCohomology`,
  `Infomaterial.Relational.Plasma.ReconnectionCurvature`,
  `Infomaterial.Relational.Reaction.SupportProjection`,
  `Infomaterial.Relational.Quantum.MeasurementScenario`,
  `Infomaterial.Relational.Quantum.ContextualObstruction`,
  `Infomaterial.Relational.Quantum.HardyModel`;
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

{docstring Infomaterial.Relational.Material.Glass.activateStep}

The two closure laws already visible at one step are:

{docstring Infomaterial.Relational.Material.Glass.activateStep_infl}

{docstring Infomaterial.Relational.Material.Glass.activateStep_mono}

Fixedness is the closure condition:

{docstring Infomaterial.Relational.Material.Glass.activateStep_fixed}

and the settled reachable set is named directly as `ActiveClosure`:

{docstring Infomaterial.Relational.Material.Glass.activation_is_facilitation_closure}

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

{docstring Infomaterial.Relational.Fluid.loopSum}

{docstring Infomaterial.Relational.Fluid.VortexLoop}

{docstring Infomaterial.Relational.Fluid.circulation}

The gradient predicate is:

{docstring Infomaterial.Relational.Fluid.IsGradient}

The vanishing theorem is:

{docstring Infomaterial.Relational.Fluid.gradient_circulation_zero}

and the obstruction theorem is:

{docstring Infomaterial.Relational.Fluid.vortex_obstruction_implies_H1_nonzero}

The unit vortex is the smallest inhabited witness:

{docstring Infomaterial.Relational.Fluid.unitVortex}

{docstring Infomaterial.Relational.Fluid.unitVortex_circulation}

{docstring Infomaterial.Relational.Fluid.unitVortex_not_gradient}

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
is the failure of that preservation. In Infomaterial that failure is carried as
non-Scott firing and classified as curvature.

The flow carrier is:

{docstring Infomaterial.Relational.Plasma.FieldLineFlow}

Frozen-in behavior and reconnection are opposite readings of the same
non-Scott predicate:

{docstring Infomaterial.Relational.Plasma.FrozenIn}

{docstring Infomaterial.Relational.Plasma.ReconnectionEvent}

{docstring Infomaterial.Relational.Plasma.frozen_in_iff_no_reconnection}

The physical firing theorem is:

{docstring Infomaterial.Relational.Plasma.reconnection_event_implies_firing}

and the ideal regime forbids it:

{docstring Infomaterial.Relational.Plasma.ideal_flow_has_no_reconnection}

The canonical reconnection witness is explicit:

{docstring Infomaterial.Relational.Plasma.canonicalReconnection}

{docstring Infomaterial.Relational.Plasma.canonicalReconnection_is_event}

{docstring Infomaterial.Relational.Plasma.canonicalReconnection_regime_curved}

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

{docstring Infomaterial.Relational.Reaction.supp}

The support order is:

{docstring Infomaterial.Relational.Reaction.ble}

The Datalog step is:

{docstring Infomaterial.Relational.Reaction.datalogStep}

It is a closure-like support step:

{docstring Infomaterial.Relational.Reaction.datalogStep_infl}

{docstring Infomaterial.Relational.Reaction.datalogStep_mono}

The honest comparison with firing is:

{docstring Infomaterial.Relational.Reaction.support_fire_le_datalog}

The exact error term is consumption:

{docstring Infomaterial.Relational.Reaction.consumption_is_the_gap}

and the catalytic case is equality:

{docstring Infomaterial.Relational.Reaction.support_fire_eq_datalog_of_no_consumption}

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

{docstring Infomaterial.Relational.Quantum.Scenario}

{docstring Infomaterial.Relational.Quantum.Model}

The global-gluing question is:

{docstring Infomaterial.Relational.Quantum.HasGlobalSection}

{docstring Infomaterial.Relational.Quantum.StronglyContextual}

The PR box inhabits strong contextuality:

{docstring Infomaterial.Relational.Quantum.prBox}

{docstring Infomaterial.Relational.Quantum.prBox_no_global}

{docstring Infomaterial.Relational.Quantum.prBox_strongly_contextual}

Logical contextuality asks about extending one local section:

{docstring Infomaterial.Relational.Quantum.Extends}

{docstring Infomaterial.Relational.Quantum.LogicallyContextual}

{docstring Infomaterial.Relational.Quantum.prBox_logicallyContextual}

The Hardy model proves that the middle rung is real, not a prose distinction:

{docstring Infomaterial.Relational.Quantum.hardyBox}

{docstring Infomaterial.Relational.Quantum.hardyWitness}

{docstring Infomaterial.Relational.Quantum.hardy_witness_not_extends}

{docstring Infomaterial.Relational.Quantum.hardyBox_logical_not_strong}

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
    Not (Extends hardyBox [1, 3] hardyWitness) :=
  hardy_witness_not_extends
```

The phase lesson is again filing discipline. Contextuality is a gluing
obstruction over a support-valued model. Hilbert space is not the carrier here.
The carrier is the finite measurement scenario whose local support sections
cannot be globally glued.

## The Common Form

The five witnesses have one common form:

* KCM: a physical transition skeleton is closure;
* vortex: a physical circulation is a cohomological obstruction;
* plasma: a physical reconnection event is non-Scott curvature;
* reaction: a physical firing system has a monotone support projection whose error
  term is consumption;
* quantum: a physical contextuality phenomenon is failure of local support data
  to glue.

This is the structure Book IX must preserve. Physical pages are admitted when
they identify a relational phase behavior, name the older physical reading, and
show the Lean declaration that carries the claim-site. A page that only explains
the physical subject is not yet a Infomaterial page. A page that only lists theorem
names is not yet a book page. The glued page must let a reader pass from
generated relational behavior to the familiar comparison and back again.
