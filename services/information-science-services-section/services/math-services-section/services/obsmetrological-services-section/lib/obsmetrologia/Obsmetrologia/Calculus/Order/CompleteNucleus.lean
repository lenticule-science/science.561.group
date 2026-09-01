import Obsmetrologia.Calculus.Order.OrderInfra

/-!
# CompleteNucleus — the settling closure, generalized to arbitrary suprema (DERIVED, L0)

`NucleusAndCommutingNuclei` builds the finitary theory: on a `HeytingAlgebra`, a
`Nucleus` is extensive, idempotent, and preserves the *binary* meet, and that binary
meet-preservation is exactly what makes `Fix(j)` inherit a full sub-Heyting-algebra
structure, with `jJoin a b := j (a ⊔ b)` the reflected lub of a *pair*. This module lifts
that same closure idiom off the Heyting-algebra machinery and onto `Order.CompleteLattice`
directly — no `himp`, no residuation, just the order and its arbitrary `sSup`/`sInf` — so
the reflected join can be taken over any predicate-indexed family, not only pairs.

Binary meet does not need to be posited again: `Order.CompleteLattice.meet2` derives it
from `sInf` (item 1), with the expected glb lemmas proved from `sInf`'s universal
property alone. A `CNucleus` (item 2) is then an extensive, idempotent endomap
preserving `meet2` — finite-meet preservation only, exactly as in the finitary case;
`sSup` never appears in the axioms. Monotonicity is derived (item 3), not assumed,
mirroring `Nucleus.mono`'s proof shape exactly. `Fix(j)` and its closure under `meet2`
(item 4) mirror `Nucleus.Fix`/`fix_meet`. The reflected supremum `jSup` (item 5)
generalizes `jJoin` from pairs to predicates, with the same upper-bound / least-fixed-
upper-bound pair of lemmas (`le_jSup`, `jSup_le`) mirroring `le_jJoin_left/right` and
`jJoin_le`. The reflection `j ⊣ ι` (item 6) mirrors `Nucleus.reflection` verbatim. The
capstone (item 7) packages `Fix(j)` itself as an `Order.CompleteLattice`: the settled
points of a settling closure are, again, a complete lattice — `sSup` is `jSup`, and the
binary meet needs no new operator, since the generic `meet2`/`sInf` machinery of item 1,
instantiated at this new lattice, already computes it (`fix_meet2_eq` checks that it
restricts to the ambient `meet2`, as it must).

No free data: every definition here derives from `Order.CompleteLattice`'s `sSup`/`sInf`
universal properties, and every theorem is a real proof — no axioms, no `sorry`.
-/

namespace Obsmetrologia
namespace Order

/-! ## Item 1 — binary meet, derived from `sInf` -/

namespace CompleteLattice
variable (C : CompleteLattice)

/-- The **binary meet**, derived from `sInf` — no new field: `a ⊓ b := sInf {a, b}`. -/
def meet2 (a b : C.carrier) : C.carrier := C.sInf (fun x => x = a ∨ x = b)

/-- `meet2` is a lower bound of its left argument. -/
theorem meet2_le_left (a b : C.carrier) : C.le (C.meet2 a b) a :=
  C.sInf_le _ a (Or.inl rfl)

/-- `meet2` is a lower bound of its right argument. -/
theorem meet2_le_right (a b : C.carrier) : C.le (C.meet2 a b) b :=
  C.sInf_le _ b (Or.inr rfl)

/-- `meet2` is the **greatest** lower bound. -/
theorem le_meet2 {a b c : C.carrier} (h1 : C.le c a) (h2 : C.le c b) :
    C.le c (C.meet2 a b) :=
  C.le_sInf _ c (fun x hx => by rcases hx with rfl | rfl <;> assumption)

end CompleteLattice

/-! ## Item 2 — the complete nucleus -/

/-- A **complete nucleus** on a complete lattice `C`: an inflationary (extensive),
idempotent endomap `j` that preserves the **binary** meet `meet2` — precisely the
finitary `Nucleus` of `NucleusAndCommutingNuclei`, freed from the Heyting-algebra
machinery so it can act on a genuine `Order.CompleteLattice`. Only finite-meet
preservation is axiomatized: `sSup` never appears in these fields. Read `j` as a
settling closure — the map that pushes a point to where it settles — and `Fix(j)`
(below) as the settled points it lands on. -/
structure CNucleus (C : CompleteLattice) where
  /-- The settling map. -/
  j : C.carrier → C.carrier
  /-- Extensive: `a ≤ j a`. -/
  infl : ∀ a, C.le a (j a)
  /-- Idempotent: `j (j a) = j a`. -/
  idem : ∀ a, j (j a) = j a
  /-- Meet-preserving, binary only: `j (a ⊓ b) = j a ⊓ j b`. -/
  meet2 : ∀ a b, j (C.meet2 a b) = C.meet2 (j a) (j b)

namespace CNucleus
variable {C : CompleteLattice} (N : CNucleus C)

/-! ## Item 3 — monotonicity, derived -/

/-- A complete nucleus is **monotone** — derived from binary meet-preservation, by
exactly the argument that proves `Nucleus.mono`: rewrite `a ≤ b` as `meet2 a b = a`,
push `j` through `meet2` via the meet-preservation axiom, and read off that `j a` sits
below `j b` in the resulting meet. -/
theorem mono {a b : C.carrier} (h : C.le a b) : C.le (N.j a) (N.j b) := by
  have hab : C.meet2 a b = a :=
    C.le_antisymm (C.meet2_le_left a b) (C.le_meet2 (C.le_refl a) h)
  have hjm := N.meet2 a b
  rw [hab] at hjm
  rw [hjm]
  exact C.meet2_le_right (N.j a) (N.j b)

/-! ## Item 4 — `Fix(j)`, closed under `meet2` -/

/-- `Fix(j)`: the predicate picking out the **settled points** — where the closure has
already landed. -/
def Fix (a : C.carrier) : Prop := N.j a = a

/-- `Fix(j)` is closed under **`meet2`**: meet-preservation, directly. -/
theorem fix_meet2 {a b : C.carrier} (ha : N.Fix a) (hb : N.Fix b) :
    N.Fix (C.meet2 a b) := by
  show N.j (C.meet2 a b) = C.meet2 a b
  rw [N.meet2, ha, hb]

/-! ## Item 5 — the reflected supremum -/

/-- The **reflected supremum**: `jSup S := j (sSup S)`. This generalizes `jJoin`
(finitary, a reflected join of a *pair*) to a reflected join of an arbitrary
predicate-indexed family — the join *inside* `Fix(j)`, reached by settling the ambient
`sSup`. -/
def jSup (S : C.carrier → Prop) : C.carrier := N.j (C.sSup S)

/-- `jSup S` is always **settled** (idempotence), just as `jJoin a b` always is. -/
theorem fix_jSup (S : C.carrier → Prop) : N.Fix (N.jSup S) := N.idem (C.sSup S)

/-- `jSup S` is an **upper bound** of `S`: every member sits below the ambient `sSup`,
which sits below its own settling. Mirrors `le_jJoin_left`/`le_jJoin_right`. -/
theorem le_jSup {S : C.carrier → Prop} {a : C.carrier} (ha : S a) :
    C.le a (N.jSup S) :=
  C.le_trans (C.le_sSup S a ha) (N.infl _)

/-- `jSup S` is the **least settled upper bound**: any already-settled `b` dominating
every member of `S` dominates `jSup S`. Mirrors `jJoin_le`. -/
theorem jSup_le {S : C.carrier → Prop} {b : C.carrier}
    (hb : N.Fix b) (h : ∀ a, S a → C.le a b) : C.le (N.jSup S) b := by
  have hpre : C.le (N.j (C.sSup S)) (N.j b) := N.mono (C.sSup_le S b h)
  rwa [hb] at hpre

/-! ## Item 6 — the reflection -/

/-- **The reflection `j ⊣ ι`.** For any `a` and any *settled* `b`: `j a ≤ b ⟺ a ≤ b`.
The settling map `j` is left adjoint to the inclusion `Fix(j) ↪ C`. Mirrors
`Nucleus.reflection` verbatim, over the weaker `CompleteLattice` substrate. -/
theorem reflection {a b : C.carrier} (hb : N.Fix b) :
    C.le (N.j a) b ↔ C.le a b := by
  constructor
  · intro h; exact C.le_trans (N.infl a) h
  · intro h
    have hjb : C.le (N.j a) (N.j b) := N.mono h
    rwa [hb] at hjb

/-! ## Item 7 — the fixed points form a complete lattice -/

/-- The underlying `C`-predicate corresponding to a predicate `S` on `Fix(j)`: `a`
qualifies exactly when it is settled and, under that settledness witness, satisfies
`S`. -/
def fixPred (S : {a : C.carrier // N.Fix a} → Prop) (a : C.carrier) : Prop :=
  ∃ h : N.Fix a, S ⟨a, h⟩

/-- **The settled points of a complete nucleus form a complete lattice.** `Fix(j) = {a //
N.Fix a}` inherits `C`'s order; its `sSup` is `jSup` — well-typed because `jSup` always
lands back in `Fix(j)` (`fix_jSup`), an upper bound (`le_jSup`) and the least such
settled upper bound (`jSup_le`), which is exactly the `sSup` universal property
restricted to `Fix(j)`. No binary meet needs positing: `sInf`/`meet2` derive from `sSup`
automatically, by the very same `CompleteLattice.meet2` construction of item 1 — see
`fix_meet2_eq` below for the check that this derived meet restricts to the ambient
`meet2`, as `fix_meet2` says it must. -/
def fix_isCompleteLattice : CompleteLattice where
  carrier := {a : C.carrier // N.Fix a}
  le x y := C.le x.val y.val
  le_refl x := C.le_refl x.val
  le_trans := fun {_ _ _} hxy hyz => C.le_trans hxy hyz
  le_antisymm := fun {_ _} hxy hyx => Subtype.ext (C.le_antisymm hxy hyx)
  sSup S := ⟨N.jSup (N.fixPred S), N.fix_jSup (N.fixPred S)⟩
  le_sSup := fun S x hx => N.le_jSup (a := x.val) ⟨x.property, hx⟩
  sSup_le := fun S b hb =>
    N.jSup_le b.property (fun a ha => by
      obtain ⟨hfa, hSa⟩ := ha
      exact hb ⟨a, hfa⟩ hSa)

/-- **The fixed-point lattice's binary meet is the ambient `meet2`, restricted.**
Confirms that item 7's capstone needed no bespoke meet operator: the generic
`CompleteLattice.meet2` (item 1), instantiated at `fix_isCompleteLattice N`, computes
exactly `C.meet2` applied to the underlying values (well-typed by `fix_meet2`). -/
theorem fix_meet2_eq (a b : (N.fix_isCompleteLattice).carrier) :
    (N.fix_isCompleteLattice).meet2 a b =
      ⟨C.meet2 a.val b.val, N.fix_meet2 a.property b.property⟩ := by
  have hle1 : (N.fix_isCompleteLattice).le
      ((N.fix_isCompleteLattice).meet2 a b)
      ⟨C.meet2 a.val b.val, N.fix_meet2 a.property b.property⟩ :=
    C.le_meet2
      ((N.fix_isCompleteLattice).meet2_le_left a b)
      ((N.fix_isCompleteLattice).meet2_le_right a b)
  have hle2 : (N.fix_isCompleteLattice).le
      ⟨C.meet2 a.val b.val, N.fix_meet2 a.property b.property⟩
      ((N.fix_isCompleteLattice).meet2 a b) :=
    (N.fix_isCompleteLattice).le_meet2
      (C.meet2_le_left a.val b.val) (C.meet2_le_right a.val b.val)
  exact (N.fix_isCompleteLattice).le_antisymm hle1 hle2

end CNucleus

end Order
end Obsmetrologia
