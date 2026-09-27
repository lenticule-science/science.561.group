import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Spine

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The teaching carrier for the measured reading: evidence-carrying value, the
two cones and the void, and measuring a trace of articulatings.
-/

#doc (Manual) "Measured reading" =>

# Measured Reading: Value With Its Evidence

The claim-site carried here is:

* claim-site: the reading that carries its own lossless evidence, the two cones
  that bracket it, the void between them, and the trace that measures it;
* phase: positing, made honest about where a reading comes from;
* generating sites: the articulation cell (Book II, Genesis Boundary), the
  bilattice reading, the oriented cell (Book III, Oriented Cells);
* Lean carriers: `Obsmetrologia.Valued`, `Obsmetrologia.CValuation`,
  `Obsmetrologia.measure`, `Obsmetrologia.Spine.runTrace`;
* Blueprint nodes: the `positing-morphism/06-evidence-and-measure` and
  `settling/08-the-two-cones-and-the-void` nodes;
* provenance: owner ruling 2026-09-21, "the admission boundary, restored" —
  measured, not seeded; the reading is value plus lossless evidence; the two
  cones bracket every cell; the void is their gap;
* familiar comparison: a claim held together with its supporting citations,
  rather than a bare verdict; a confidence interval bracketing a measurement;
* danger: reading a charge's bare value as the whole carrier. The value
  without its evidence cannot tell "told nothing" from "cancelled."

The governing sentence is:

> A reading is measured from its evidence, never seeded onto a cell; the meet
> can drive a value below what its evidence shows, never above it, and
> presumption is the one licensed exception, in the other direction.

## Valued: Value With Its Evidence

A valued value pairs a bare `Reading` with the two witness slots it was read
off — for-evidence and against-evidence, kept separately and never discarded:

```lean
example (value : Reading) (evidence : Slot × Slot) : Valued :=
  ⟨value, evidence⟩
```

`Measured` is the invariant that the value is exactly the presence pattern of
that evidence — no more, no less:

```lean
example (x : Valued) : Prop :=
  Valued.Measured x
```

Evidence belongs to value, which enters at positing: an articulation cell's
subject and object slots are positions of a predication, not evidence, and are
not read as a value. A value witnessed on one coordinate only, by one token, is
measured:

```lean
example (t : Token) :
    Valued.Measured (Valued.oneSided t) :=
  Valued.oneSided_measured t
```

## Absurd Reached, Witnesses Kept

The knowledge meet of a potential telling and an active telling drives the
value down to knowledge-bottom while keeping both witnesses on record. The
meet is not measured, and that gap between value and evidence is the formal
difference between "absurd, told nothing" (no evidence at all) and "absurd,
two tellings that cancelled" (evidenced on both sides):

```lean
example :
    ∃ x y : Valued,
      Valued.Measured x ∧ Valued.Measured y ∧ ¬ Valued.Measured (Valued.meetK x y) :=
  Valued.meetK_not_measured
```

## Presumption: The One Sanctioned Breach

`presumeFree` raises every evidence-free side to present while leaving the
evidence itself untouched. A one-sided value, its second coordinate free,
presumes all the way from potential up to stable:

```lean
example (t : Token) :
    (Valued.presumeFree (Valued.oneSided t)).value = Reading.kTop :=
  Valued.presumeFree_oneSided t
```

## The Two Cones And The Void

A `CValuation` assigns a `Valued` value to every predication cell. The unit
cone `settle` closes each cell's own evidence; the counit cone `brim`
presumes every free side first, then closes — the least the evidence forces,
and the most it allows:

```lean
example (c : Reading.Closure) (v : CValuation) (φ : PredicationCell) :
    Reading.KLE (CValuation.settle c v φ) (CValuation.brim c v φ) :=
  CValuation.settle_le_brim c v φ
```

The void is the cells where the two cones disagree. A one-sided value is void
on its free coordinate under the identity-seeded join closure — `settle` leaves
it at potential, `brim` presumes it to stable:

```lean
example (t : Token) (φ : PredicationCell) :
    CValuation.Void (Reading.joinClosure Reading.kBot)
      (fun _ => Valued.oneSided t) φ :=
  CValuation.oneSided_void t φ
```

A reconciled conflict — both sides witnessed, value driven to knowledge-bottom
by the meet — is **not** void: there is nothing left free for `brim` to
raise, so the two cones already agree:

```lean
example (t w : Token) (φ : PredicationCell) :
    ¬ CValuation.Void (Reading.joinClosure Reading.kBot)
        (fun _ => Valued.meetK (Valued.oneSided t)
          (⟨Articulating.Corner.active, ([], [w])⟩ : Valued)) φ :=
  CValuation.cancelled_not_void t w φ
```

This is the formal separation the theory needs between "a cell no evidence has
reached" (void) and "a cell whose evidence has reconciled to a cancellation"
(not void), even though both currently read at knowledge-bottom.

## Measuring A Trace

There is no operation asserting a reading directly. `measure` reads a `Valued`
value at a predication cell from a trace of articulatings and the codec's
contradiction, which pairs each claim with the mark of its denial: for-witnesses
are the head tokens of the articulatings whose oriented cell matches,
against-witnesses those whose oriented cell is the contradictory claim, the same
subject and object told against, as in Belnap's four-valued logic:

```lean
example (k : Contradictory) (trace : List Articulating) (φ : PredicationCell) :
    Valued.Measured (measure k trace φ) :=
  measure_measured k trace φ
```

An articulating is always a for-witness of the cell it itself generates:

```lean
example (k : Contradictory) (a : Articulating) :
    (measure k [a] (Articulating.orientedCell a)).value.pos = true :=
  measure_self_pos k a
```

There is no denial primitive. If measuring a trace at a claim reads negative
evidence, the contradictory claim was itself articulated somewhere in the trace:

```lean
example (k : Contradictory) (trace : List Articulating) (φ : PredicationCell)
    (h : (measure k trace φ).value.neg = true) :
    ∃ a ∈ trace, a.orientedCell = PredicationCell.contradictory k φ :=
  no_denial k trace φ h
```

Negation is measured, not assumed. Measuring the contradictory claim exchanges
the two evidence sides of measuring the claim, which is Belnap negation:

```lean
example (k : Contradictory) (trace : List Articulating) (φ : PredicationCell) :
    (measure k trace (PredicationCell.contradictory k φ)).value
      = Reading.negate (measure k trace φ).value :=
  measure_contradictory_negate k trace φ
```

## The Measured Composite Of The Spine

`Spine.runTrace` is the composite that actually measures: articulate,
predicate, *measure*, settle, at any cell of a trace. The spine itself,
`Spine.run`, is that composite at a newly articulated claim, and what is
articulated is told for: its settled reading has a positive side.

```lean
example (closure : Reading.Closure) (k : Contradictory) (trace : List Articulating)
    (a : Articulating) :
    (Spine.run closure k trace a).reading.pos = true :=
  Spine.run_pos closure k trace a
```

`Spine.runSupplied` keeps the value-algebra composite, which admits a
caller-supplied reading and constructs no admission.

```lean
example (closure : Reading.Closure) (k : Contradictory) (trace : List Articulating)
    (φ : PredicationCell) : Meme :=
  Spine.runTrace closure k trace φ
```

## What This Page Does Not Say

It does not claim `Spine.posit`'s caller-supplied reading and a measured reading
at the same claim must ever agree; that measured-vs-seeded interaction is
left exactly where `docs/history/corner-naming-convention.md` leaves it,
open. It does not rebuild `Obsmetrologia.Site.Sheaf` over `Valued` in place
of the bare `Reading`; the site weld follows the slot cell in reading, not yet
in Lean carrier (see Book VI, Gluing Witnesses).
