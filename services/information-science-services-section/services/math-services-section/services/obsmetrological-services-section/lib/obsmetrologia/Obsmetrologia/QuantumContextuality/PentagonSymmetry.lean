/-! # `D₅` — the dihedral symmetry of the pentagon `C₅`

The KCBS pentagon (`content/.../imaging-kcbs-pentagon`, sibling module `MeasurementScenario`)
puts its five measurements on the vertices of a 5-cycle, exclusivity running along the edges.
That cycle's symmetry group is the dihedral group of order 10, `D₅ = ⟨r, s ∣ r⁵ = s² = 1, srs =
r⁻¹⟩`. This module builds `D₅` as a first-class carrier acting on `Fin 5` (the pentagon
vertices), mirroring `Language.Positing.D4Gauge`'s treatment of `D₄` on `Charge`.

Unlike `D₄` — whose eight elements each carry independent FOUR-specific meaning (negation,
conflation, the order-swap …) — `D₅`'s ten elements are the generic rotations and reflections of
a cycle, so the carrier here is the semidirect-product pair `(rot, flip) : Fin 5 × Bool` rather
than a hand-named inductive: `act ⟨k, false⟩ i = k + i` (rotate by `k`), `act ⟨k, true⟩ i = k -
i` (reflect through the axis at `k / 2`). Every group law reduces to a finite arithmetic fact
over `Fin 5`, decided directly (`Fin` — unlike `Charge`/`Corner` — carries a decidable-forall
instance in core, so `revert … ; decide` closes each case without hand-rolled case tables).

## Main definitions

* `D5` — the ten-element carrier `Fin 5 × Bool`, `act` its action on the pentagon vertices,
  `mul`/`inv`/`id5` the group structure.
* `r`, `s` — the order-5 rotation and an order-2 reflection generating `D₅`.
* `adj` — the pentagon's cyclic adjacency (the `C₅` edge relation).

## Main results

* `act_mul`, `id_mul`, `mul_id`, `mul_assoc`, `inv_mul`, `mul_inv` — `D₅` is a group acting on
  `Fin 5` via `act`.
* `faithful` — the action is faithful: distinct elements act as distinct permutations.
* `r_pow_five`, `s_sq`, `s_r_s`, `non_abelian` — the dihedral presentation `r⁵ = s² = 1`, `srs =
  r⁻¹`, non-abelian.
* `card_eq_ten` — `D₅` has exactly ten elements.
* `act_preserves_adj` — every `D₅` element is a graph automorphism of `C₅`: it preserves the
  cyclic adjacency relation.

## Implementation notes

`act_preserves_adj` proves `D₅` acts by automorphisms of `C₅`; it does **not** prove `D₅` is the
*full* automorphism group (that every adjacency-preserving permutation of `Fin 5` is one of these
ten) — that stronger claim is left for the frontier.

## References

`content/.../imaging-kcbs-pentagon`; mirrors `Obsmetrologia.D4.D8`.

## Tags

dihedral group, pentagon, five-cycle, KCBS, symmetry
-/

namespace Obsmetrologia
namespace QuantumContextuality

/-! ## The carrier and its action -/

/-- The dihedral group `D₅` of the pentagon, as the semidirect-product pair `(rot, flip)`: `rot :
Fin 5` is the rotation amount, `flip` marks whether a reflection is composed in. Ten elements:
five rotations (`flip = false`) and five reflections (`flip = true`). -/
structure D5 where
  /-- The rotation component. -/
  rot : Fin 5
  /-- Whether this element includes the reflection. -/
  flip : Bool
  deriving DecidableEq, Repr, Inhabited

/-- The action `D₅ → Fin 5 → Fin 5` on the pentagon vertices: a pure rotation sends `i ↦ rot +
i`; a reflection sends `i ↦ rot − i`, written uniformly as `rot + (±i)`. -/
def D5.act (g : D5) (i : Fin 5) : Fin 5 :=
  g.rot + (if g.flip then -i else i)

/-- The group multiplication, the semidirect product `(Fin 5) ⋊ Bool`: `mul g h` is the element
acting as `act g ∘ act h`. -/
def D5.mul (g h : D5) : D5 :=
  ⟨g.rot + (if g.flip then -h.rot else h.rot), Bool.xor g.flip h.flip⟩

/-- The identity element: no rotation, no reflection. -/
def D5.id5 : D5 := ⟨0, false⟩

/-- The inverse: a rotation inverts by negating; a reflection is its own inverse (every
reflection in a dihedral group of odd order has a single fixed point and order 2). -/
def D5.inv (g : D5) : D5 := if g.flip then g else ⟨-g.rot, false⟩

namespace D5

@[simp] theorem act_id (i : Fin 5) : act id5 i = i := by simp [act, id5]

/-- **The action is a homomorphism.** `act (g·h) i = act g (act h i)` — the semidirect-product
multiplication realizes composition of the underlying `Fin 5` maps. -/
theorem act_mul (g h : D5) (i : Fin 5) : act (mul g h) i = act g (act h i) := by
  rcases g with ⟨grot, gflip⟩
  rcases h with ⟨hrot, hflip⟩
  cases gflip <;> cases hflip <;> revert grot hrot i <;> decide

/-- **Faithful.** Distinct elements of `D₅` act as distinct permutations of the pentagon: for
`g ≠ h` there is a vertex where they disagree. -/
theorem faithful (g h : D5) (hgh : g ≠ h) : ∃ i : Fin 5, act g i ≠ act h i := by
  rcases g with ⟨grot, gflip⟩
  rcases h with ⟨hrot, hflip⟩
  cases gflip <;> cases hflip <;> revert grot hrot hgh <;> decide

/-! ## The group laws -/

@[simp] theorem id_mul (g : D5) : mul id5 g = g := by
  rcases g with ⟨grot, gflip⟩
  cases gflip <;> revert grot <;> decide

@[simp] theorem mul_id (g : D5) : mul g id5 = g := by
  rcases g with ⟨grot, gflip⟩
  cases gflip <;> revert grot <;> decide

theorem mul_assoc (g h k : D5) : mul (mul g h) k = mul g (mul h k) := by
  rcases g with ⟨grot, gflip⟩
  rcases h with ⟨hrot, hflip⟩
  rcases k with ⟨krot, kflip⟩
  cases gflip <;> cases hflip <;> cases kflip <;> revert grot hrot krot <;> decide

@[simp] theorem inv_mul (g : D5) : mul (inv g) g = id5 := by
  rcases g with ⟨grot, gflip⟩
  cases gflip <;> revert grot <;> decide

@[simp] theorem mul_inv (g : D5) : mul g (inv g) = id5 := by
  rcases g with ⟨grot, gflip⟩
  cases gflip <;> revert grot <;> decide

/-! ## The dihedral presentation `⟨r, s ∣ r⁵ = s² = 1, srs = r⁻¹⟩` -/

/-- The order-5 rotation generator: rotate by one vertex. -/
def r : D5 := ⟨1, false⟩
/-- A reflection generator: the axis through vertex `0`. -/
def s : D5 := ⟨0, true⟩

/-- `r⁵ = id`: the rotation has order 5. -/
theorem r_pow_five : mul r (mul r (mul r (mul r r))) = id5 := by decide

/-- `s² = id`: the reflection is an involution. -/
theorem s_sq : mul s s = id5 := by decide

/-- **The dihedral relation** `s·r·s = r⁻¹`: conjugating the rotation by the reflection inverts
it — the defining non-abelian relation of `D₅`. -/
theorem s_r_s : mul (mul s r) s = inv r := by decide

/-- **Non-abelian.** `r·s ≠ s·r`. -/
theorem non_abelian : mul r s ≠ mul s r := by decide

/-! ## Ten elements -/

/-- The ten elements of `D₅`, enumerated: five rotations then five reflections. -/
def all : List D5 :=
  (List.finRange 5).flatMap (fun k => [⟨k, false⟩, ⟨k, true⟩])

/-- Every element of `D₅` is in the enumeration. -/
theorem mem_all (g : D5) : g ∈ all := by
  rcases g with ⟨grot, gflip⟩
  cases gflip <;> revert grot <;> decide

/-- `D₅` has exactly ten elements. -/
theorem card_eq_ten : all.length = 10 := by decide

/-! ## `D₅` acts by automorphisms of the pentagon `C₅` -/

/-- The pentagon's cyclic adjacency: `i` and `j` are adjacent iff one follows the other around
the 5-cycle. This is the `C₅` exclusivity graph of the KCBS pentagon. -/
def adj (i j : Fin 5) : Prop := j = i + 1 ∨ i = j + 1

/-- **`D₅` acts by graph automorphisms of `C₅`.** Every element of `D₅` preserves the cyclic
adjacency relation: rotations and reflections both carry edges to edges. -/
theorem act_preserves_adj (g : D5) (i j : Fin 5) (h : adj i j) : adj (act g i) (act g j) := by
  rcases g with ⟨grot, gflip⟩
  cases gflip <;> revert grot i j <;> (unfold adj act; decide)

end D5
end QuantumContextuality
end Obsmetrologia
