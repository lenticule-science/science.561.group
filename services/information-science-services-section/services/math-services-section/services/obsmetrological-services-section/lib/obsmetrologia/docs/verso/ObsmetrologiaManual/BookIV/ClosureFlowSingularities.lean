import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Dynamics.Flow.ClosureFlowDynamics
import Obsmetrologia.Dynamics.Flow.FiringBlowup
import Obsmetrologia.Dynamics.Flow.BlowupClassification
import Obsmetrologia.Dynamics.Flow.FreeEnergyLyapunov
import Obsmetrologia.Dynamics.Flow.CurvatureRegime
import Obsmetrologia.Dynamics.Flow.TransfiniteClosureFlow

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for closure-flow singularities, Lyapunov descent, and
curvature regimes.
-/

#doc (Manual) "Closure-flow singularities" =>

# Closure-Flow Singularities

The flow calculus page teaches the Lawvere-Laplacian closure projection. This page
teaches the companion dynamics: the closure orbit ascends, smooth steps are
quiescent, firing steps are non-smooth, a firing has local blowup data, free
energy descends along the orbit, and curvature is the regime-side obstruction
classification.

The claim-site carried here is:

* claim-site: closure-flow singularities as generated firing, blowup, energy,
  and curvature witnesses;
* phase: closure phase, after valuation and closure operators are lawful and
  before physical curvature events reuse the language;
* generating sites: modal-frame closure orbit, knowledge order, smooth/firing
  step dichotomy, blowup predecessor and actual value, finite support energy,
  closure regime, and transfinite ordinal flow;
* downstream uses: plasma reconnection, topological wave sheaf criterions,
  reaction/material Lyapunov diagnostics, frontier transfinite flow pages, and
  comparison-atlas curvature entries;
* Lean declarations: `Obsmetrologia.Valuation.ModalFrame.flow_ascends`,
  `Obsmetrologia.Valuation.ModalFrame.firing_iff_not_smooth`,
  `Obsmetrologia.Blowup.predecessor_le_actual`,
  `Obsmetrologia.Valuation.freeEnergy_antitone`,
  `Obsmetrologia.Flow.CurvatureRegime.curvature_regime_table`,
  `Obsmetrologia.Valuation.ModalFrame.transfinite_settling_continuity`;
* Blueprint/proof-tree nodes: this page is a Lean-side promotion of closure-flow
  archive nodes; later Blueprint physics nodes should point here before using
  curvature language;
* provenance: closure-flow dynamics, firing-blowup, free-energy Lyapunov, and
  curvature-regime archive material;
* familiar mathematical comparison: dynamical system, smooth step, singularity,
  blowup, Lyapunov function, spectral gap, and curvature module;
* reader closure: read flow words as closure-orbit words unless a stronger
  analytic carrier has been constructed;
* frontier status: differential geometry, PDE blowup, smooth manifolds,
  analytic spectral theory, and real-valued thermodynamic free energy remain
  missing carriers.

The governing sentence is:

> Flow is closure motion until a stronger analytic carrier is built.

## The Orbit Ascends

The closure flow is the modal-frame orbit. It ascends in the knowledge order:

{docstring Obsmetrologia.Valuation.ModalFrame.flow_ascends}

and lands on the least fixed point:

{docstring Obsmetrologia.Valuation.ModalFrame.flow_lands_on_lfp}

Checked:

```lean
example (M : Valuation.ModalFrame)
    (seed : Valuation) {m n : Nat} (h : m <= n) :
    (M.orbit seed m).leK (M.orbit seed n) :=
  Valuation.ModalFrame.flow_ascends M seed h
```

This is the legal entry point for "dynamics": monotone ascent of settled
valuation, not an imported phase space.

## Smooth And Firing Steps

The local dichotomy is explicit:

{docstring Obsmetrologia.Valuation.ModalFrame.firing_iff_not_smooth}

Settled states do not fire:

{docstring Obsmetrologia.Valuation.ModalFrame.settled_no_firing}

Checked:

```lean
example (M : Valuation.ModalFrame)
    (seed : Valuation) (n : Nat) :
    Valuation.ModalFrame.FiringStep M seed n
      <-> Not (Valuation.ModalFrame.SmoothStep M seed n) :=
  Valuation.ModalFrame.firing_iff_not_smooth M seed n

example (M : Valuation.ModalFrame)
    (seed : Valuation) (n : Nat) :
    Not (Valuation.ModalFrame.FiringStep
      M (M.settle seed) n) :=
  Valuation.ModalFrame.smooth_not_firing
    M (M.settle seed) n
    (Valuation.ModalFrame.settled_no_firing
      M seed n)
```

This is why later physical pages may call a non-smooth closure event a firing.
They may not silently import a continuum singularity.

## Blowup Is Local Increment Data

At a firing, the predecessor and actual value are ordered:

{docstring Obsmetrologia.Blowup.predecessor_le_actual}

The local data carrier is
{name Obsmetrologia.Blowup.localData}`localData`: incidence, firing type, and
failure pattern extracted cellwise.

Checked:

```lean
example (M : Valuation.ModalFrame)
    (seed : Valuation) (n : Nat) :
    (Blowup.predecessor M seed n).leK
      (Blowup.actual M seed n) :=
  Blowup.predecessor_le_actual M seed n

example (M : Valuation.ModalFrame)
    (seed : Valuation) (n : Nat) :
    Blowup.localData M seed n
      = Blowup.localData M seed n :=
  rfl
```

The familiar blowup word is therefore local and combinatorial here. A PDE
singularity is a frontier promotion, not a consequence.

## Free Energy Is A Finite Lyapunov Witness

Free energy is a finite support deficit over the knowledge height:

{docstring Obsmetrologia.Valuation.freeEnergy}

One step decreases it:

{docstring Obsmetrologia.Valuation.freeEnergy_antitone}

Checked:

```lean
example (c : Reading.Closure)
    (seed : Valuation)
    (cells : List PredicationCell) (n : Nat) :
    Valuation.freeEnergy c seed cells (n + 1)
      <= Valuation.freeEnergy c seed cells n :=
  Valuation.freeEnergy_antitone c seed cells n
```

The Lyapunov language is lawful only on this finite support. Real thermodynamic
free energy is not being claimed.

## Curvature Is a Regime Label

Curvature enters only as two labels on the declared regime table:

{docstring Obsmetrologia.Flow.CurvatureRegime.curvature_regime_table}

Checked:

```lean
example (r : ClosureRegime) :
  (Flow.CurvatureRegime.DeclaredFlat r <->
    Not (Flow.CurvatureRegime.DeclaredCurved r)) :=
  (Flow.CurvatureRegime.curvature_regime_table
    r).1
```

The phrase "curved" is generated here. Plasma, wave, or spacetime pages must
refer back to this carrier or build a stronger one.

## Transfinite Continuity

The transfinite closure flow supplies real ordinal limit stages:

{docstring Obsmetrologia.Valuation.ModalFrame.transfinite_settling_continuity}

The global regularity theorem is the no-blowup statement Lean proves. It ranges over
settling limit sequences: fundamental sequences whose predecessors have reached
the settled value.

{docstring Obsmetrologia.Valuation.ModalFrame.transfinite_closure_flow_no_blowup}

Checked:

```lean
example (M : Valuation.ModalFrame)
    (seed : Valuation) :
    Not (Valuation.ModalFrame.NSCFiringAt
      (M.tflowOf seed) Ord.ofNat) :=
  (Valuation.ModalFrame.transfinite_settling_continuity
    M seed).2.2

example (M : Valuation.ModalFrame)
    (seed : Valuation) (f : Nat -> Ord)
    (hf :
      Valuation.ModalFrame.SettlingLimitSequence
        M seed f) :
    Not (Valuation.ModalFrame.NSCFiringAt
      (M.tflowOf seed) f) :=
  (Valuation.ModalFrame.transfinite_closure_flow_no_blowup
    M seed).2.1 f hf
```

This is the honest boundary between finite flow prose and transfinite flow
construction. Raw continuity over every degenerate fundamental sequence and
general analytic continuity are still absent.

## Reader Closure

When a later page says dynamics, firing, blowup, free energy, spectral gap, or
curvature, return here and identify the closure-flow carrier. If the desired
claim needs differential equations, manifolds, or analytic spectra, it remains a
frontier promotion task.
