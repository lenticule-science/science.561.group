import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Closure.Scott
import Obsmetrologia.Cohomology.ScottFace
import Obsmetrologia.AperiodicOrder.Tiling.KappaStratification
import Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Closure.Scott
open Obsmetrologia.Cohomology.ScottFace
open Obsmetrologia.AntiLandauer
open Obsmetrologia.AperiodicOrder.Tiling.KappaStratification
open Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges

/-!
A teaching chapter for Scott-continuity as a closure-regime phenomenon.
-/

#doc (Manual) "Scott-continuity as a regime" =>

# Scott-Continuity As A Closure Regime

Scott-continuity is not a top-level topic in this book. It is a condition inside
the closure phase.

The claim-site carried here is:

* claim-site: Scott-continuous closure;
* phase: closure;
* generating sites: charge, knowledge order, closure operator, directed join;
* Lean carrier: `Obsmetrologia.Closure.Scott`;
* familiar comparison: Scott-continuity from domain theory;
* danger: treating Scott-continuity as imported background instead of as a
  regime condition on settling.

The chapter's job is to make one sentence precise:

> A closure is Scott-continuous when it preserves the directed joins that the
> settling phase uses as limits.

## Why This Belongs To Closure

Before settling, there is no closure orbit whose limit behavior can be measured.
Before the knowledge order, there is no directed knowledge-join for a closure to
preserve. Before positing, there is no charge lattice on which this finite projection
can be checked.

So Scott-continuity is not an imported property of an ambient category. It is a
phase-local measurement of closure behavior:

* does the closure commute with directed joins?
* does a rule fire at a limit because it already fired at some finite stage?
* does the closure remain in the strict/Scott regimes, or does it expose a
  non-Scott obstruction?

That is why this chapter belongs in the closure phase.

## Directed Families

The finite model starts with directed families of charges.

{docstring Obsmetrologia.Closure.Scott.DirectedFamily}

The directed family has a supremum:

{docstring Obsmetrologia.Closure.Scott.DirectedFamily.sup}

and, over the finite charge carrier, that supremum is attained by an element of
the family:

{docstring Obsmetrologia.Closure.Scott.DirectedFamily.sup_mem}

This theorem is the finite heart of the chapter. In the finite carrier, directed
joins are not mysterious completed infinities; the join is already present in the
directed family. That is why every finite charge-closure is Scott-continuous.

## The Scott Equation

The Scott-continuity predicate is the equation:

{docstring Obsmetrologia.Closure.Scott.IsScottContinuous}

The finite theorem is:

{docstring Obsmetrologia.Closure.Scott.finite_scott_continuous}

Checked:

```lean
example (c : Charge.Closure) : IsScottContinuous c :=
  finite_scott_continuous c
```

The theorem says: for this finite charge model, every closure operator preserves
directed joins. This is not the full transfinite story. It is the strict finite
projection. But it is not a toy either: it is exactly the finite base case against
which non-Scott behavior will later be recognized.

## Finite Antecedents

The operational reading is rule firing.

The module defines a finite-antecedent firing operator:

{docstring Obsmetrologia.Closure.Scott.fire}

and proves that finite-antecedent rules commute with directed joins:

{docstring Obsmetrologia.Closure.Scott.finite_antecedent_scott_continuous}

Checked:

```lean
example (ante concl : Charge) (S : DirectedFamily) :
    fire ante concl (sup S.elems)
      = sup (S.elems.map (fire ante concl)) :=
  finite_antecedent_scott_continuous ante concl S
```

This is the usable intuition. A finite-antecedent rule fires at the directed join
only because the finite antecedent was already covered at some member of the
directed family. The limit adds no surprise.

When a rule needs an infinitary antecedent, this argument breaks. That failure is
where non-Scott firing and curvature enter.

## The Scott Face

The finite-carrier theorem above is not the whole \(\kappa=\omega\) corner.  The
separate Scott-face carrier records the genuinely unbounded finite-stage side:

{docstring Obsmetrologia.Cohomology.ScottFace.Base}

The finite approximations are ordinary finite ordinals:

{docstring Obsmetrologia.Cohomology.ScottFace.approximation}

and the closure-ordinal coordinate is exactly \(\omega\):

{docstring Obsmetrologia.Cohomology.ScottFace.closureOrdinal}

Checked:

```lean
example : closureOrdinal = Ord.omega :=
  closureOrdinal_eq_omega
```

The important order statement is the directed-join law:

{docstring Obsmetrologia.Cohomology.ScottFace.closureOrdinal_lub_of_finite_approximations}

Checked:

```lean
example (b : Ord)
    (hb : ∀ n : Base, Ord.Le (approximation n) b) :
    Ord.Le closureOrdinal b :=
  closureOrdinal_lub_of_finite_approximations b hb
```

This is the lawful form of "the \(\omega\)-stage is the directed join of finite
approximations."  The page does not assert an arbitrary fixed-point theorem for
every closure system.  It records the carrier currently built in Lean.

Finite-antecedent firing also transports to this face:

{docstring Obsmetrologia.Cohomology.ScottFace.finite_antecedent_closure_scott_continuous}

Checked:

```lean
example (ante concl : Charge) (S : DirectedFamily) :
    fire ante concl (sup S.elems)
      = sup (S.elems.map (fire ante concl)) :=
  finite_antecedent_closure_scott_continuous ante concl S
```

The regime readout is Scott:

{docstring Obsmetrologia.Cohomology.ScottFace.regime_is_scott}

and therefore the \(H^1\) obstruction vanishes:

{docstring Obsmetrologia.Cohomology.ScottFace.h1_vanishes}

This is the reversible, Landauer-free side in the current cohomology ledger: the
vanishing theorem is inherited from the strict/Scott regime table.  It is not a
claim that every Landauer, Collatz, and Zeta-star statement has already been
identified on one carrier.

## The Wired Interface

The next checked layer is a small interface package:

{docstring Obsmetrologia.AperiodicOrder.Tiling.KappaStratification.Interface}

It records Landauer through the existing \(H^1\) ledger:

{docstring Obsmetrologia.AperiodicOrder.Tiling.KappaStratification.landauer_cost_is_h1}

It records the Scott face as the vanishing bridge:

{docstring Obsmetrologia.AperiodicOrder.Tiling.KappaStratification.scott_face_is_vanishing_bridge}

It records the Collatz cylinder-lift face as the strict finite
\(\kappa\)-package under one-lock:

{docstring Obsmetrologia.AperiodicOrder.Tiling.KappaStratification.collatz_cylinder_lift_kappa_package}

and it records the current Zeta-star residual interface:

{docstring Obsmetrologia.AperiodicOrder.Tiling.KappaStratification.zeta_star_residual_interface}

Checked:

```lean
example : Interface :=
  interface
```

The material sector is wired too:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.MaterialSectorReadout}

The local matter/anti-matter carrier is no longer implicit:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.MaterialSharedKappaCarrier}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_nerve_landauer_compat}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_nerve_h1_compat}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_nerve_antiLandauer_compat}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_nerve_h0_compat}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_nerve_matter_antimatter_ledger}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_shared_kappa_carrier}

The full shared-carrier boundary is named separately:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.FullSharedKappaCarrier}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.twoAdic_cylinderLiftGap}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_collatz_inputs}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_noPositiveInfiniteBarrierStream}

The same boundary has a ledger-facing form:

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.AntimatterBarrierBoundary}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.antimatter_barrier_boundary_iff_cylinderLiftContracts}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_antimatter_barrier_boundary}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.full_shared_kappa_carrier_iff_frontierInputs}

{docstring Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges.material_kappa_sector_charges}

Checked:

```lean
example : SectorInterface :=
  sector_interface

example
    {G : Obsmetrologia.AperiodicOrder.Crystal.Glass}
    (γ : G.RatBasinFreeEnergyBridge)
    (b : G.basins.Basin) (θ : Real.Internal.Rat) :
    MaterialSharedKappaCarrier γ b θ :=
  material_shared_kappa_carrier γ b θ

example
    {G : Obsmetrologia.AperiodicOrder.Crystal.Glass}
    (γ : G.RatBasinFreeEnergyBridge)
    (b : G.basins.Basin) (θ : Real.Internal.Rat) :
    Nonempty (FullSharedKappaCarrier γ b θ) <->
      Nonempty (AntimatterBarrierBoundary γ b θ) :=
  full_shared_kappa_carrier_iff_antimatter_barrier_boundary
    γ b θ

example
    {G : Obsmetrologia.AperiodicOrder.Crystal.Glass}
    (γ : G.RatBasinFreeEnergyBridge)
    (b : G.basins.Basin) :
    let β := γ.thermalization.toBasinThermalization
    (antimatterCharge (β.nerveAt b) : Int) -
      (matterCharge (β.nerveAt b) : Int) =
        β.ledgerAt b := by
  exact material_nerve_matter_antimatter_ledger γ b
```

This is the current wiring Lean proves.  It is enough to say which theorem-proved
ports and material-sector charges a future common carrier must identify.  For
the explicit carrier structure here, the two-adic cylinder-lift side is already
constructed from the carry gap, so the remaining inhabitation gap is exactly no
positive infinite barrier stream, equivalently the current Collatz frontier
inputs.  Stronger semantic identifications beyond that carrier structure are a
later refinement.

## Regime Classification

Scott-continuity is tied to the closure-regime classifier.

{docstring Obsmetrologia.Closure.Scott.scott_continuous_iff_omega_regime}

The finite charge closure lands in the strict regime:

{docstring Obsmetrologia.Closure.Scott.finite_charge_strict}

Checked:

```lean
example (c : Charge.Closure) (x : Charge) :
    classify spineData = ClosureRegime.strict
      ∧ Charge.SettlesBy c.op x 3
      ∧ IsScottContinuous c :=
  finite_charge_strict c x
```

This proves the local phase relationship:

* finite base implies strict behavior;
* strict behavior implies finite settling;
* finite charge closure is Scott-continuous;
* cohomological obstruction vanishes in the strict/Scott side.

Scott-continuity is therefore a regime condition, not a subject heading.

## Projection Discipline

The familiar comparison is domain-theoretic Scott-continuity. The Obsmetrologia claim is
not "we imported domain theory." The Obsmetrologia claim is that the closure phase
generates a condition with the Scott-continuity shape: preservation of directed
joins.

Use the projection only after the phase is visible. A page that starts with
"Scott-continuous category" before explaining the closure operator, directed
family, and regime classifier is importing the projection too early.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Language.Positing.Charge` for the four-charge carrier.
2. Read `Obsmetrologia.Closure.Operator` for closure operators on charges.
3. Read `Obsmetrologia.Closure.Regime` for the four-regime classifier.
4. Read `Obsmetrologia.Closure.Scott` for directed families and the Scott equation.
5. Then read non-Scott firing and curvature as failures of this preservation.

The next chapter in the closure phase should teach non-Scott firing: the point at
which the limit does add surprise.
