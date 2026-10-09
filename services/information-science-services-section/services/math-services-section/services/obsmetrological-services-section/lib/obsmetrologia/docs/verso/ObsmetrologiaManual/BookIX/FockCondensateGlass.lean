import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.QuantumContextuality.FockCondensate

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.QuantumContextuality

/-!
A teaching chapter for the finite C4/Fock condensate and glass-overlap
nonfactorization carrier.
-/

#doc (Manual) "Fock condensates and glass overlap" =>

# Fock Condensates And Glass Overlap

This page records the finite claim the library proves. The words Fock,
coherent state, condensate, and entanglement are admitted here only through the
carriers that the library actually supplies: a four-entry ledger, finite
particle-number sectors, a no-readout hole, finite glass overlap, and a
nonfactorizing joint.

The claim-site carried here is:

* claim-site: C4 ledger, condensate hole, and glass-overlap
  nonfactorization;
* phase: relational physical matter after finite glass diagnostics, molecular
  gluing, and hole shrouds are lawful;
* generating sites: finite creation/annihilation entries, `Fin n` sectors,
  no-readout holes, finite configuration overlap, and two-particle joints;
* downstream uses: analytic Fock-space frontier, coherent condensate frontier,
  glass entanglement diagnostics, and comparison-atlas quantum/material entries;
* Lean declarations: `Obsmetrologia.QuantumContextuality.C4Ledger`,
  `Obsmetrologia.QuantumContextuality.FockSpace`,
  `Obsmetrologia.QuantumContextuality.CoherentCondensate`,
  `Obsmetrologia.QuantumContextuality.CondensateHole`, and
  `Obsmetrologia.QuantumContextuality.GlassOverlapEntanglement`;
* Blueprint/proof-tree nodes: `thm:c4-ledger-fock-sector`,
  `thm:condensate-hole-coherent-support`,
  `thm:glass-overlap-entanglement-order-parameter`, and
  `thm:analytic-fock-coherent-field-frontier`;
* provenance: finite glass overlap, molecular-chaos gluing, hole shroud,
  and thermodynamic creation/discharge ledger pages;
* familiar mathematical comparison: Fock sector grading, coherent-state
  indefinite particle number, and entanglement as nonseparable joint state;
* reader closure: read the result as finite generated carrier first, analytic
  Hilbert-space field theory only as frontier;
* frontier status: operator algebra, normalization, infinite direct sums,
  analytic coherent amplitudes, and continuum overlap distributions remain red.

The governing sentence is:

> The proved claim is finite sector generation and nonfactorization, not the
> analytic field completion.

## The C4 Ledger Generates Sectors

The four ledger entries are `matterCreate`, `antimatterCreate`,
`matterAnnihilate`, and `antimatterAnnihilate`.

The finite ledger is:

{docstring Obsmetrologia.QuantumContextuality.C4Ledger}

Its creation, annihilation, and generated particle-number readings are:

{docstring Obsmetrologia.QuantumContextuality.C4Ledger.creationCount}

{docstring Obsmetrologia.QuantumContextuality.C4Ledger.annihilationCount}

{docstring Obsmetrologia.QuantumContextuality.C4Ledger.particleNumber}

The generated Fock carrier is not an analytic Hilbert space. It is the finite
sector carrier indexed by particle number:

{docstring Obsmetrologia.QuantumContextuality.FockSpace}

{docstring Obsmetrologia.QuantumContextuality.C4Ledger.fockSector}

Checked:

```lean
example {Mode : Type} (L : C4Ledger)
    (occupation : Fin L.particleNumber -> Mode) :
    (L.fockSector occupation).particleNumber = L.particleNumber :=
  L.fockSector_particleNumber occupation

example :
    C4Ledger.particleNumber
      ⟨[C4LedgerStep.matterCreate]⟩ = 1 :=
  C4Ledger.particleNumber_single_create
```

This proves the phrase "ledger generates Fock sectors." It does not prove
creation and annihilation operators on a completed vector space.

## Condensate Holes Carry Indefinite Support

A Fock state is represented as support over finite sectors:

{docstring Obsmetrologia.QuantumContextuality.FockState}

Indefinite particle number means that two supported sectors have different
particle numbers:

{docstring Obsmetrologia.QuantumContextuality.IndefiniteParticleNumber}

The coherent condensate packages that support with one retained order
parameter:

{docstring Obsmetrologia.QuantumContextuality.CoherentCondensate}

and the hole carrier attaches it to the no-readout object:

{docstring Obsmetrologia.QuantumContextuality.CondensateHole}

Checked:

```lean
example {Mode OrderParameter : Type}
    (psi : CoherentCondensate Mode OrderParameter) :
    IndefiniteParticleNumber psi.support :=
  psi.has_indefinite_particle_number

example {Event Mode OrderParameter : Type}
    (H : CondensateHole Event Mode OrderParameter) :
    H.condensate.orderParameterCount = 1 :=
  H.one_order_parameter
```

This proves the finite coherent-state sentence: a condensate hole carries
indefinite particle-number support and one order parameter.

## Glass Overlap As Nonfactorization Order Parameter

The glass side supplies the finite overlap count. The kinetic side supplies
factorized gluing and its obstruction. The combined carrier is:

{docstring Obsmetrologia.QuantumContextuality.GlassOverlapEntanglement}

Its order parameter is exactly the glass overlap:

{docstring Obsmetrologia.QuantumContextuality.GlassOverlapEntanglement.orderParameter_eq_overlapCount}

and its joint state fails to factor:

{docstring Obsmetrologia.QuantumContextuality.GlassOverlapEntanglement.joint_fails_to_factor}

Factorized gluing is excluded:

{docstring Obsmetrologia.QuantumContextuality.GlassOverlapEntanglement.not_factorized_gluing}

Checked:

```lean
example {Site State : Type} [DecidableEq State]
    (G : GlassOverlapEntanglement Site State) :
    G.orderParameter =
      Obsmetrologia.AperiodicOrder.GlassDynamics.overlapCount
        G.sites G.left G.right :=
  G.orderParameter_eq_overlapCount

example {Site State : Type} [DecidableEq State]
    (G : GlassOverlapEntanglement Site State) :
    Not (Obsmetrologia.KineticTheory.Gas.Factorizes G.joint) :=
  G.joint_fails_to_factor
```

The concrete two-state witness has full overlap and does not factor:

{docstring Obsmetrologia.QuantumContextuality.eprGlassOverlapEntanglement_orderParameter}

{docstring Obsmetrologia.QuantumContextuality.eprGlassOverlapEntanglement_not_factorizes}

Checked:

```lean
example :
    eprGlassOverlapEntanglement.orderParameter = 2 :=
  eprGlassOverlapEntanglement_orderParameter

example :
    Not (Obsmetrologia.KineticTheory.Gas.Factorizes
      eprGlassOverlapEntanglement.joint) :=
  eprGlassOverlapEntanglement_not_factorizes
```

The reader closure is sharp: the finite overlap is an entanglement order
parameter only for this finite nonfactorization witness. A Parisi distribution,
operator-valued field, normalized coherent vector, or continuum entanglement
measure is still frontier.
