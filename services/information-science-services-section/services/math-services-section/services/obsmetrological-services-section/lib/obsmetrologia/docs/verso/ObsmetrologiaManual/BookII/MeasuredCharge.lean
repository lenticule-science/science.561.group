import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Spine

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The teaching carrier for the measured charge: evidence-carrying value, the
two cones and the void, and measuring a trace of articulatings.
-/

#doc (Manual) "Measured charge" =>

# Measured Charge: Value With Its Evidence

The claim-site carried here is:

* claim-site: the charge that carries its own lossless evidence, the two cones
  that bracket it, the void between them, and the trace that measures it;
* phase: positing, made honest about where a charge comes from;
* generating sites: the articulation cell (Book II, Genesis Boundary), the
  bilattice charge, the oriented cell (Book III, Oriented Cells);
* Lean carriers: `Obsmetrologia.Charged`, `Obsmetrologia.CValuation`,
  `Obsmetrologia.measure`, `Obsmetrologia.Spine.runTrace`;
* Blueprint nodes: the `positing-morphism/06-evidence-and-measure` and
  `settling/08-the-two-cones-and-the-void` nodes;
* provenance: owner ruling 2026-09-21, "the admission boundary, restored" —
  measured, not seeded; the charge is value plus lossless evidence; the two
  cones bracket every cell; the void is their gap;
* familiar comparison: a claim held together with its supporting citations,
  rather than a bare verdict; a confidence interval bracketing a measurement;
* danger: reading a charge's bare value as the whole carrier. The value
  without its evidence cannot tell "told nothing" from "cancelled."

The governing sentence is:

> A charge is measured from its evidence, never seeded onto a cell; the meet
> can drive a value below what its evidence shows, never above it, and
> presumption is the one licensed exception, in the other direction.

## Charged: Value With Its Evidence

A charged value pairs a bare `Charge` with the two witness slots it was read
off — for-evidence and against-evidence, kept separately and never discarded:

```lean
example (value : Charge) (evidence : Slot × Slot) : Charged :=
  ⟨value, evidence⟩
```

`Measured` is the invariant that the value is exactly the presence pattern of
that evidence — no more, no less:

```lean
example (x : Charged) : Prop :=
  Charged.Measured x
```

Reading a `Charged` straight off an articulation cell's own two slots is
always measured, because a cell's corner is definitionally the presence
pattern of its own slots:

```lean
example (c : Articulating.Cell) :
    Charged.Measured (Charged.ofCell c) :=
  Charged.ofCell_measured c
```

## Absurd Reached, Witnesses Kept

The knowledge meet of a potential telling and an active telling drives the
value down to knowledge-bottom while keeping both witnesses on record. The
meet is not measured, and that gap between value and evidence is the formal
difference between "absurd, told nothing" (no evidence at all) and "absurd,
two tellings that cancelled" (evidenced on both sides):

```lean
example :
    ∃ x y : Charged,
      Charged.Measured x ∧ Charged.Measured y ∧ ¬ Charged.Measured (Charged.meetK x y) :=
  Charged.meetK_not_measured
```

## Presumption: The One Sanctioned Breach

`presumeFree` raises every evidence-free side to present while leaving the
evidence itself untouched. A bare articulated cell — token witnessed, claim
free — presumes all the way from potential up to stable:

```lean
example (u : Utterance) :
    (Charged.presumeFree (Charged.ofCell (Articulating.Cell.articulate u))).value
      = Charge.kTop :=
  Charged.presumeFree_articulate u
```

## The Two Cones And The Void

A `CValuation` assigns a `Charged` value to every predication cell. The unit
cone `settle` closes each cell's own evidence; the counit cone `brim`
presumes every free side first, then closes — the least the evidence forces,
and the most it allows:

```lean
example (c : Charge.Closure) (v : CValuation) (φ : PredicationCell) :
    Charge.KLE (CValuation.settle c v φ) (CValuation.brim c v φ) :=
  CValuation.settle_le_brim c v φ
```

The void is the cells where the two cones disagree. A bare articulated cell
is void on its claim side under the identity-seeded join closure — `settle`
leaves it at potential, `brim` presumes it to stable:

```lean
example (u : Utterance) (φ : PredicationCell) :
    CValuation.Void (Charge.joinClosure Charge.kBot)
      (fun _ => Charged.ofCell (Articulating.Cell.articulate u)) φ :=
  CValuation.articulate_void u φ
```

A reconciled conflict — both sides witnessed, value driven to knowledge-bottom
by the meet — is **not** void: there is nothing left free for `brim` to
raise, so the two cones already agree:

```lean
example (u : Utterance) (w : Token) (φ : PredicationCell) :
    ¬ CValuation.Void (Charge.joinClosure Charge.kBot)
        (fun _ => Charged.meetK
          (Charged.ofCell (Articulating.Cell.articulate u))
          (⟨Articulating.Corner.active, ([], [w])⟩ : Charged)) φ :=
  CValuation.cancelled_not_void u w φ
```

This is the formal separation the theory needs between "a cell no evidence has
reached" (void) and "a cell whose evidence has reconciled to a cancellation"
(not void), even though both currently read at knowledge-bottom.

## Measuring A Trace

There is no operation asserting a charge directly. `measure` reads a `Charged`
value at a predication cell from a trace of articulatings and a codec
contrariety: for-witnesses are the head tokens of the articulatings whose
oriented cell matches, against-witnesses those whose oriented cell is the
contrary claim:

```lean
example (k : Contrary) (trace : List Articulating) (φ : PredicationCell) :
    Charged.Measured (measure k trace φ) :=
  measure_measured k trace φ
```

An articulating is always a for-witness of the cell it itself generates:

```lean
example (k : Contrary) (a : Articulating) :
    (measure k [a] (Articulating.orientedCell a)).value.pos = true :=
  measure_self_pos k a
```

There is no denial. If measuring a trace at a claim reads negative evidence,
the contrary predicate was itself articulated somewhere in the trace:

```lean
example (k : Contrary) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.neg = true) :
    ∃ a ∈ trace, a.orientedCell = PredicationCell.contrary k φ :=
  no_denial k trace φ h
```

## The Measured Composite Of The Spine

Where `Spine.run` admits a caller-supplied charge and documents that as not
itself constituting admission, `Spine.runTrace` is the composite that
actually measures: articulate, predicate, *measure*, settle.

```lean
example (closure : Charge.Closure) (k : Contrary) (trace : List Articulating)
    (φ : PredicationCell) : Meme :=
  Spine.runTrace closure k trace φ
```

## What This Page Does Not Say

It does not claim `Spine.posit`'s caller-supplied charge and a measured charge
at the same claim must ever agree; that measured-vs-seeded interaction is
left exactly where `docs/history/corner-naming-convention.md` leaves it,
open. It does not rebuild `Obsmetrologia.Site.Sheaf` over `Charged` in place
of the bare `Charge`; the site weld follows the slot cell in reading, not yet
in Lean carrier (see Book VI, Gluing Witnesses).
