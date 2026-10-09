import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.KineticTheory.Gas.DiscreteVelocityCollision
import ObsmetrologiaPhysicalScience.KineticTheory.Plasma.Quasineutrality
import ObsmetrologiaPhysicalScience.KineticTheory.Plasma.DebyeGraphScreening
import ObsmetrologiaPhysicalScience.KineticTheory.Plasma.TopologicalWaveSheaf
import ObsmetrologiaPhysicalScience.KineticTheory.Fluid.VortexCohomology
import ObsmetrologiaPhysicalScience.KineticTheory.Liquid.OrnsteinZernikeClosure
import ObsmetrologiaPhysicalScience.KineticTheory.Liquid.DensityFunctionalFlow

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for transport, screening, circulation, and liquid fixed
points as relational physical carriers.
-/

#doc (Manual) "Transport, screening, and fixed points" =>

# Transport, Screening, And Fixed Points

The aggregate diagnostics page names kinetic, plasma, fluid, and liquid
carriers. This page separates the claim-sites those names otherwise blur:
finite collision invariants, reading-neutral relaxation, graph screening,
degree-zero wave fixed points, circulation superposition, Ornstein-Zernike
closure, and density-functional settling.

The claim-site carried here is:

* claim-site: transport, screening, circulation, and liquid structure as
  generated finite witnesses;
* phase: relational physical phases after closure, finite graph support,
  generated calculus, and cohomological gluing are lawful;
* generating sites: finite populations, collision rules, Nat-indexed relaxation,
  Tarski sheaf closure, reading quantale Laplacian, finite loop circulation, and
  internal-real Lyapunov descent;
* downstream uses: kinetic invariants, plasma screening and edge-mode obstructions,
  vortex obstruction pages, liquid closure diagnostics, dense-matter analogies,
  and frontier PDE entries;
* Lean declarations: `Obsmetrologia.KineticTheory.Gas.step_conserves`,
  `Obsmetrologia.KineticTheory.Plasma.relax_neutral`,
  `Obsmetrologia.KineticTheory.Plasma.source_le_screened`,
  `Obsmetrologia.KineticTheory.Plasma.laplacian_H0_modes_are_global_sections`,
  `Obsmetrologia.KineticTheory.Fluid.circulation_superpose`,
  `Obsmetrologia.KineticTheory.Liquid.oz_image_iff_fixed`,
  `Obsmetrologia.KineticTheory.Liquid.equilibrium_orbit_const`;
* Blueprint/proof-tree nodes: no standalone Blueprint node is promoted for this
  bridge; downstream relational-physics nodes rely on these Lean carriers;
* provenance: kinetic, plasma, vortex, liquid, and density-functional projection
  notes refit as finite relational witnesses;
* familiar mathematical comparison: Boltzmann collision invariants, quasineutral
  screening, Debye clouds, topological plasma waves, vortex circulation,
  Ornstein-Zernike closure, and density-functional descent;
* reader closure: ask which finite carrier carries the physical word before
  reading continuum intuition into it;
* frontier status: Boltzmann PDEs, Vlasov-Maxwell systems, Debye-Huckel Green
  functions, Navier-Stokes vorticity, Fourier liquid theory, functional
  derivatives, and continuum DFT are missing carriers.

The governing sentence is:

> The physical name is lawful only where a finite relational invariant,
> relaxation, or fixed point has been carried.

## Kinetic Conservation

The collision carrier is
{name Obsmetrologia.KineticTheory.Gas.Collision}`Collision`. A step preserves a
weight exactly when the collision conserves that weight:

{docstring Obsmetrologia.KineticTheory.Gas.step_conserves}

Evolution preserves the same invariant through a list of collisions:

{docstring Obsmetrologia.KineticTheory.Gas.evolution_conserves}

Checked:

```lean
example {V : Type}
    {c : KineticTheory.Gas.Collision V}
    {w : V -> Int}
    {p q : KineticTheory.Gas.Population V}
    (hc : c.Conserves w)
    (h : KineticTheory.Gas.Step c p q) :
    KineticTheory.Gas.total w p
      = KineticTheory.Gas.total w q :=
  KineticTheory.Gas.step_conserves hc h
```

This licenses finite collision invariants. It does not license kinetic PDEs or
hydrodynamic limits.

## Plasma Relaxation And Screening

Quasineutrality is a fixed point of the finite screening step:

{docstring Obsmetrologia.KineticTheory.Plasma.quasineutral_iff_screen_fixed}

Repeated relaxation reaches quasineutrality once the step budget covers the
initial imbalance:

{docstring Obsmetrologia.KineticTheory.Plasma.relax_neutral}

Checked:

```lean
example (c : List Int) :
    KineticTheory.Plasma.Quasineutral
      (KineticTheory.Plasma.relax
        (KineticTheory.Plasma.imbalance c) c) :=
  KineticTheory.Plasma.relax_neutral
    (KineticTheory.Plasma.imbalance c) c
    (Nat.le_refl _)
```

Graph screening is a Tarski-sheaf closure projection:

{docstring Obsmetrologia.KineticTheory.Plasma.source_le_screened}

{docstring Obsmetrologia.KineticTheory.Plasma.screened_potential_idem}

Checked:

```lean
example (G : KineticTheory.Plasma.DebyeGraph)
    (source : KineticTheory.Plasma.Screened G) :
    forall v, KineticTheory.Plasma.ScreenStalk.le
      (source v)
      (KineticTheory.Plasma.screenedPotential G source v) :=
  KineticTheory.Plasma.source_le_screened G source
```

The lawful claim is finite relaxation and closure. Continuum Debye-Huckel
analysis remains frontier.

## Topological Plasma Waves

The topological-wave carrier uses the already generated reading quantale
Laplacian. Bulk modes are degree-zero fixed points:

{docstring Obsmetrologia.KineticTheory.Plasma.laplacian_H0_modes_are_global_sections}

Checked:

```lean
example (s : Reading) :
    forall x : Reading,
  KineticTheory.Plasma.IsBulkMode s
    (QEnriched.laplacian s x) :=
  (KineticTheory.Plasma.laplacian_H0_modes_are_global_sections
    s).1
```

This is not spectral plasma physics. It is the degree-zero fixed-point core of
an enriched sheaf criterion, downstream of Book VI.

## Fluid Circulation

The fluid carrier is finite loop circulation. Superposition is a theorem:

{docstring Obsmetrologia.KineticTheory.Fluid.circulation_superpose}

Checked:

```lean
example (size : Nat) (v w : Nat -> Int) :
    KineticTheory.Fluid.circulation
      { size := size, velocity := fun i => v i + w i }
      = KineticTheory.Fluid.circulation
          { size := size, velocity := v }
        + KineticTheory.Fluid.circulation
          { size := size, velocity := w } :=
  KineticTheory.Fluid.circulation_superpose size v w
```

The vortex page already teaches nonzero circulation as non-exactness. This page
adds the linearity law on the finite carrier. Continuum vector calculus remains
outside the present proof.

## Liquid Fixed Points

Ornstein-Zernike closure is a fixed-point image of a Tarski complex:

{docstring Obsmetrologia.KineticTheory.Liquid.oz_image_iff_fixed}

Density-functional flow has an equilibrium fixed orbit:

{docstring Obsmetrologia.KineticTheory.Liquid.equilibrium_orbit_const}

Checked:

```lean
example {C : Order.CompleteLattice}
    (O : KineticTheory.Liquid.OZSystem C)
    (x : O.Bin -> C.carrier) :
    (exists seed,
      Tarski.settle (KineticTheory.Liquid.ozComplex O)
        seed = x)
      <->
    Tarski.IsHarmonic
      (KineticTheory.Liquid.ozComplex O) x :=
  KineticTheory.Liquid.oz_image_iff_fixed O x

example (F : KineticTheory.Liquid.DFTFlow)
    (s : F.State)
    (h : KineticTheory.Liquid.IsEquilibrium F s)
    (n : Nat) :
    KineticTheory.Liquid.orbit F s n = s :=
  KineticTheory.Liquid.equilibrium_orbit_const
    F s h n
```

The familiar liquid-state names are projections of closure and Lyapunov fixedness.
Fourier transforms, structure factors, and continuum density functionals remain
promotion tasks.

## Reader Closure

Kinetic, plasma, fluid, and liquid pages are not four applications. They are
four tests of generated physical law: invariant, relaxation, obstruction,
linearity, and fixed point. If a later page needs a stronger physical claim, it
must construct the stronger carrier rather than borrowing the name.
