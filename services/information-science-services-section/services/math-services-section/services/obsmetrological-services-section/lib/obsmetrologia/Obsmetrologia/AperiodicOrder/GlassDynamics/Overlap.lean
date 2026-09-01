/-!
# Finite configuration overlap (the replica-overlap count)

A glassy system's static data is a **configuration** — an assignment of a local state to each site.
The central comparison between two configurations is their **overlap**: how many sites agree. Over a
finite list of sites this is an `Nat`-valued count, the finite combinatorial invariant of the
replica overlap `q` of spin-glass theory (and of Hamming similarity). The full overlap as a random
variable with its Parisi order-parameter distribution needs probability and is out of this
dependency-free core; the finite count is exactly in it.

`overlapCount sites x y = #{ s ∈ sites | x s = y s }`. The canonical instance takes `State := Charge`
and `Site := PredicationCell`, i.e. configurations are `Valuation`s; the definition is kept generic so
it serves any finite alphabet.

## Main definitions
* `Configuration`, `overlapCount`.

## Main results
* `overlapCount_self` — a configuration overlaps itself on every site (`= sites.length`).
* `overlapCount_symm` — overlap is symmetric.
* `overlapCount_le_length` — overlap never exceeds the number of sites.

## References
Corpus glass line; the spin-glass frontier memo (replica overlap `q`, Parisi order parameter — the
analytic theory; here the finite projection).

## Tags
glass, replica overlap, configuration, Hamming, spin glass
-/

namespace Obsmetrologia
namespace AperiodicOrder.GlassDynamics

/-- A **configuration**: an assignment of a local `State` to each `Site`. The canonical instance is a
`Valuation` (`State = Charge`, `Site = PredicationCell`). -/
abbrev Configuration (Site State : Type) := Site → State

/-- The **overlap count** of two configurations over a finite site list: the number of sites on which
they agree — the finite replica-overlap / Hamming-similarity count. -/
def overlapCount {Site State : Type} [DecidableEq State]
    (sites : List Site) (x y : Configuration Site State) : Nat :=
  sites.countP (fun s => decide (x s = y s))

@[simp] theorem overlapCount_nil {Site State : Type} [DecidableEq State]
    (x y : Configuration Site State) : overlapCount [] x y = 0 := rfl

/-- **A configuration overlaps itself everywhere.** Every site agrees with itself, so the self-overlap
is the full site count. -/
theorem overlapCount_self {Site State : Type} [DecidableEq State]
    (sites : List Site) (x : Configuration Site State) :
    overlapCount sites x x = sites.length := by
  induction sites with
  | nil => rfl
  | cons s rest ih =>
      simp only [overlapCount, List.countP_cons, List.length_cons] at *
      rw [ih]
      simp

/-- **Overlap is symmetric** — agreement does not depend on the order of comparison. -/
theorem overlapCount_symm {Site State : Type} [DecidableEq State]
    (sites : List Site) (x y : Configuration Site State) :
    overlapCount sites x y = overlapCount sites y x := by
  unfold overlapCount
  have hp : (fun s => decide (x s = y s)) = (fun s => decide (y s = x s)) := by
    funext s
    by_cases h : x s = y s
    · rw [h]
    · have h' : ¬ (y s = x s) := fun he => h he.symm
      simp [h, h']
  rw [hp]

/-- **Overlap never exceeds the number of sites.** -/
theorem overlapCount_le_length {Site State : Type} [DecidableEq State]
    (sites : List Site) (x y : Configuration Site State) :
    overlapCount sites x y ≤ sites.length :=
  List.countP_le_length

end AperiodicOrder.GlassDynamics
end Obsmetrologia
