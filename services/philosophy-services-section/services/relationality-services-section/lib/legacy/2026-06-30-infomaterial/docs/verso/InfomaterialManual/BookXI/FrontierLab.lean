import InfomaterialManual.DocSetup
import Infomaterial.Closure.LaxSlackDiagnosis
import Infomaterial.Cohomology.LawvereHarmonicCohomology
import Infomaterial.Dynamics.Flow.TransfiniteClosureFlow
import Infomaterial.Dynamics.Gauge.Finite

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Gauge
open Infomaterial.Valuation
open Infomaterial.Valuation.ModalFrame

/-!
A lab chapter for keeping frontier claims honest while they move toward settlement.
-/

#doc (Manual) "Frontier lab" =>

# Frontier Lab

The frontier is not a junk drawer. It is a typed workbench for claims whose
generating route is visible but whose carrier is not yet strong enough, broad
enough, or welded enough to promote the claim into a phase volume.

The claim-site carried here is:

* claim-site: the promotion discipline for frontier and lab claims;
* phase: frontier over the phase volumes;
* generating sites: closure regime, lax-idempotence, transfinite flow,
  cohomological gluing, finite physical witness;
* Lean carriers: `Infomaterial.Closure.LaxSlackDiagnosis`,
  `Infomaterial.Dynamics.Flow.TransfiniteClosureFlow`,
  `Infomaterial.Cohomology.LawvereHarmonicCohomology`,
  `Infomaterial.Dynamics.Gauge.Finite`;
* familiar comparisons: conjecture, example, application, research note, TODO,
  failed theorem, physical bridge;
* danger: treating a named frontier as if it were already a proved phase.

The governing sentence is:

> A frontier claim is useful only when it says what would have to become true
> for it to stop being frontier.

This is a book rule, not a project-management nicety. A proof-oriented knowledge
system can leave territory unsettled, but it cannot leave the reader unable to
tell the difference between settlement and pressure.

## The Promotion Gate

A frontier item enters the book only if it answers four questions:

* what carrier currently supports the claim;
* what carrier is missing;
* what theorem, counterexample, or construction would promote it;
* which phase volume should receive it after promotion.

The lab is therefore not organized by topic. It is organized by failure mode.
Some claims lack a non-thin carrier. Some lack an analytic layer. Some lack a
continuum quotient. Some lack a search surface or a provenance weld. These are
different mathematical absences, and the book must not confuse them.

## Obstruction As A First-Class Result

The most important lab move is negative: prove that a tempting carrier cannot
carry the desired phenomenon. That is not failure. It is a typed obstruction.

The lax-idempotence frontier asks for a genuine non-identity multiplication
cell: closure-of-closure should have slack rather than collapsing to strict
idempotence. The thin valuation poset cannot do that. The diagnostic theorem is:

{docstring Infomaterial.kz_strict_of_antisymm}

and its concrete closure consequence is:

{docstring Infomaterial.Valuation.ModalFrame.closureOp_no_lax_slack}

Checked:

```lean
example {alpha : Type} (le : alpha -> alpha -> Prop)
    (hanti : forall x y, le x y -> le y x -> x = y)
    (f : alpha -> alpha)
    (hinfl : forall a, le a (f a)) (a : alpha)
    (hkz : le (f (f a)) (f a)) :
    f (f a) = f a :=
  kz_strict_of_antisymm le hanti f hinfl a hkz

example (M : ModalFrame) (v : Valuation) :
    Not
      (leK (closureOp M (closureOp M v)) (closureOp M v)
        /\ Not
          (closureOp M (closureOp M v) = closureOp M v)) :=
  closureOp_no_lax_slack M v
```

The repair path is now precise. Do not keep trying to find stable contradiction
dynamics inside the antisymmetric valuation order. The missing carrier is
non-thin. The future page belongs in the closure/aperiodic regime volumes only
after that carrier exists.

## Scope Notes Are Mathematical Data

A good lab page records not only what was proved, but why the obvious stronger
statement was not proved. `TransfiniteClosureFlow` is the model example. It
retires the old Nat-only scoping for limit-stage settling by building an
internal ordinal-indexed flow, but it does not overclaim continuity for every
degenerate fundamental sequence.

The local definitions are:

{docstring Infomaterial.Valuation.ModalFrame.ContinuousAt}

{docstring Infomaterial.Valuation.ModalFrame.NSCFiringAt}

The settled theorem at the canonical limit is:

{docstring Infomaterial.Valuation.ModalFrame.tflowOf_no_nsc_firing_omega}

and the bundled transfinite-settling result is:

{docstring Infomaterial.Valuation.ModalFrame.transfinite_settling_continuity}

Checked:

```lean
example (M : ModalFrame) (seed : Valuation) :
    Not (NSCFiringAt (tflowOf M seed) Ord.ofNat) :=
  tflowOf_no_nsc_firing_omega M seed
```

The lab lesson is that a scope note is not an apology. It is a boundary theorem
for the documentation. The page may say "settling-continuity at the canonical
limit" because the theorem says that. It may not silently turn that into full
continuity over every sequence.

## A Bridge Is Not A Phase

Some lab work promotes a vocabulary bridge without promoting the entire external
theory. Finite gauge holonomy is such a bridge. It gives the book a precise
carrier for local gauge transformations, path holonomy, and Wilson-loop
invariance, while explicitly not claiming Lie groups, bundles, spinors, area
law, or quantum field theory.

The finite carrier is a group-like record named `Infomaterial.Gauge.FiniteGroup`.
The connection and local transformation carriers are `Infomaterial.Gauge.GaugeField`
and `Infomaterial.Gauge.GaugeTransform`.

The gauge action is:

{docstring Infomaterial.Gauge.transformEdge}

Path holonomy is:

{docstring Infomaterial.Gauge.holo}

The proved loop invariance is:

{docstring Infomaterial.Gauge.wilsonLoop_invariant}

Checked:

```lean
example (G : FiniteGroup) {V : Type} (A : GaugeField G V)
    (u : GaugeTransform G V) (cf : ClassFunction G)
    (x : V) (rest : List V) (hclosed : lastOf x rest = x) :
    cf.f (holo G (transformEdge G A u) x rest)
      = cf.f (holo G A x rest) :=
  wilsonLoop_invariant G A u cf x rest hclosed
```

The repair path is again explicit. If a future chapter wants color confinement,
it must not cite finite Wilson-loop invariance as if the analytic layer were
already there. It must build the missing carrier or mark the claim frontier.

## Gluing The Same Section Twice

Sometimes frontier work closes a weld between two previously separate carriers.
`LawvereHarmonicCohomology` is such a weld. The order-Laplacian harmonic section
and the Cech classifying invariant were developed separately. The chapter proves
that, in a vanishing regime, they name the same settled global section.

The weld theorem is:

{docstring Infomaterial.Cohomology.lawvere_harmonic_section_classifying_invariant_zero}

The important documentation rule is that this theorem does not license the full
real-analytic Hodge story. It gives the inner-product-free projection available in
the current carriers. The analytic Hilbert/cochain/orbifold layer remains
frontier until its carrier is actually constructed.

## How A Lab Claim Leaves The Lab

A lab claim leaves Book XI only when the following are all true:

* the carrier is in Lean;
* its scope boundary is stated;
* a checked theorem, construction, or counterexample carries the claim;
* the relevant projection has been demoted to comparison;
* the target phase volume can teach the claim without using frontier language as
  proof.

Promotion is not a change of tone. It is a change of carrier. Until that change
happens, the honest place for the claim is here.
