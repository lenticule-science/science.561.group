import Infomaterial.Calculus.Order.OrderInfra
import Infomaterial.Articulation.Articulating.FourCorner

/-!
# NucleusAndCommutingNuclei — the standalone nuclear-quartet theory (DERIVED, L0)

This is the **canonical abstract home** of the corpus's nucleus / commuting-nuclei /
nuclear-quartet theory, built standalone on the `Order` hierarchy. The corpus states
(`…/settling/content/bigraded-diamond/content/nuclear-quartet`, and its `_archive`
`nucleus.md`, `nuclear-dyad.md`, `nuclear-quartet.md`, `commutative-nuclear-square.md`)
that a **nucleus** on a Heyting algebra is a closure operator (extensive, idempotent)
that **preserves finite meets**, and that meet-preservation is exactly what forces the
fixed-point set `Fix(j)` to inherit the *full Heyting* structure — closed under `⇒`, not
merely under `∧`,`∨`. Two **commuting** nuclei `j₁ ∘ j₂ = j₂ ∘ j₁` make the composite
`π = j₁ ∘ j₂` a nucleus with `Fix(π) = Fix(j₁) ∩ Fix(j₂)`; the four sub-algebras
`(A, Fix(j₁), Fix(j₂), A*)` form an exhaustive **commuting square** — "apply neither,
`j₁` alone, `j₂` alone, or both" — the same four-corner shape the spine meets at the
articulation phases and the bilattice charge, here as *sub-algebras under closure*.

`Infomaterial.Order` previously had **no** Heyting algebra: `Positing.Bigraded` carries its OWN
private `HeytingAlgebra`/`Nucleus`/`NuclearSquare` as the **in-situ (charge-level)**
instance of this theory — two join-nuclei on the charge knowledge-Heyting-algebra. That
module is left untouched; this module is the abstract home it should be read as
instantiating. We add:

1. `Order.HeytingAlgebra` extending `BoundedLattice` with a residual `himp` and the
   Heyting adjunction `meet a b ≤ c ⟺ b ≤ (a ⇒ c)`; derived `modus_ponens` and that
   `Fix` is closed under `himp`.
2. `Order.Nucleus` — extensive, idempotent, meet-preserving — with `Fix(j)` a
   **sub-Heyting-algebra** (closed under `meet`, `join`, `himp`, `top`) and the
   reflection `j ⊣ ι` (unit `a ≤ j a` = extensivity, counit = identity on fixed points).
3. `Order.CommutingNuclei` — the commutative nuclear square: `π = j₁∘j₂` a nucleus,
   `Fix(π) = Fix(j₁) ∩ Fix(j₂)`, the commuting square.
4. `Order.NuclearQuartet` — the four corners `(A, Fix(j₁), Fix(j₂), A*)` indexed by
   `Infomaterial.Articulating.Corner`, biject with `Infomaterial.Articulating.FourCorner` (neither/`j₁`/`j₂`/both ≅
   potential/active/stable/absurd).

Proof techniques (`fix_imp`, `compNucleus`, `fix_pi_iff`) are ported from
`Positing.Bigraded` but rebuilt over the new `Order.HeytingAlgebra`. No free data.
-/

namespace Infomaterial

/-- Flip a bare bijection `Bij α β → Bij β α`. -/
def Bij.flip {α β : Type} (b : Bij α β) : Bij β α where
  to := b.inv
  inv := b.to
  left := b.right
  right := b.left

namespace Order

/-! ## The canonical Heyting algebra on the `Order` hierarchy -/

/-- A **Heyting algebra**: a `BoundedLattice` with a residual implication `himp`
adjoint to meet. The order is the inherited lattice order `a ≤ b := a ⊓ b = a`, and the
**Heyting adjunction** is `meet a b ≤ c ⟺ b ≤ (a ⇒ c)`, with `≤` unfolded to meets.
(`Positing.Bigraded.HeytingAlgebra` is the bare-`meet` in-situ version; this one inherits
all of `BoundedLattice` — `join`, `top`, `bot`, both orders agreeing — for free.) -/
structure HeytingAlgebra extends BoundedLattice where
  /-- The residual implication `⇒` (relative pseudocomplement). -/
  himp : carrier → carrier → carrier
  /-- The Heyting adjunction `a ⊓ b ≤ c ⟺ b ≤ (a ⇒ c)`, `≤` unfolded to meets. -/
  himp_adj : ∀ a b c,
    (meet (meet a b) c = meet a b) ↔ (meet b (himp a c) = b)

namespace HeytingAlgebra
variable (H : HeytingAlgebra)

/-- The inherited lattice order `a ≤ b ⇔ a ⊓ b = a`. -/
def le (a b : H.carrier) : Prop := H.toLattice.le a b

theorem le_refl (a : H.carrier) : H.le a a := H.toLattice.le_refl a
theorem le_trans {a b c : H.carrier} (h1 : H.le a b) (h2 : H.le b c) : H.le a c :=
  H.toLattice.le_trans h1 h2
theorem le_antisymm {a b : H.carrier} (h1 : H.le a b) (h2 : H.le b a) : a = b :=
  H.toLattice.le_antisymm h1 h2

/-- The lattice glb/lub, restated on `H.le`. -/
theorem meet_le_left (a b : H.carrier) : H.le (H.meet a b) a := H.toLattice.meet_le_left a b
theorem meet_le_right (a b : H.carrier) : H.le (H.meet a b) b := H.toLattice.meet_le_right a b
theorem le_meet {a b c : H.carrier} (h1 : H.le c a) (h2 : H.le c b) :
    H.le c (H.meet a b) := H.toLattice.le_meet h1 h2
theorem le_join_left (a b : H.carrier) : H.le a (H.join a b) := H.toLattice.le_join_left a b
theorem le_join_right (a b : H.carrier) : H.le b (H.join a b) := H.toLattice.le_join_right a b
theorem join_le {a b c : H.carrier} (h1 : H.le a c) (h2 : H.le b c) :
    H.le (H.join a b) c := H.toLattice.join_le h1 h2
theorem le_top (a : H.carrier) : H.le a H.top := H.toBoundedLattice.le_top a

/-- The adjunction restated with `le` (definitionally the `meet` form). -/
theorem himp_le_iff (a b c : H.carrier) :
    H.le (H.meet a b) c ↔ H.le b (H.himp a c) := H.himp_adj a b c

/-- **Meet is monotone** in its right argument (rebuilt over `H.le`). -/
theorem meet_mono (z : H.carrier) {x y : H.carrier} (h : H.le x y) :
    H.le (H.meet z x) (H.meet z y) := by
  show H.meet (H.meet z x) (H.meet z y) = H.meet z x
  calc H.meet (H.meet z x) (H.meet z y)
      = H.meet z (H.meet x (H.meet z y)) := H.meet_assoc z x _
    _ = H.meet z (H.meet (H.meet x z) y) := by rw [H.meet_assoc x z y]
    _ = H.meet z (H.meet (H.meet z x) y) := by rw [H.meet_comm x z]
    _ = H.meet z (H.meet z (H.meet x y)) := by rw [H.meet_assoc z x y]
    _ = H.meet z (H.meet z x) := by rw [h]
    _ = H.meet (H.meet z z) x := (H.meet_assoc z z x).symm
    _ = H.meet z x := by rw [H.meet_idem]

/-- **Modus ponens / the counit.** `a ⊓ (a ⇒ c) ≤ c`: the adjunction's backward
direction at the reflexive witness `(a ⇒ c) ≤ (a ⇒ c)`. -/
theorem modus_ponens (a c : H.carrier) : H.le (H.meet a (H.himp a c)) c :=
  (H.himp_le_iff a (H.himp a c) c).mpr (H.le_refl (H.himp a c))

end HeytingAlgebra

/-! ## The nucleus -/

/-- A **nucleus** on a Heyting algebra: an inflationary (extensive), idempotent,
meet-preserving endomap (`…/nuclear-quartet/_archive/nucleus.md`). Monotonicity follows;
its fixed points form a Heyting *sub-algebra* — not merely a sub-lattice — precisely
because of meet-preservation. -/
structure Nucleus (H : HeytingAlgebra) where
  j : H.carrier → H.carrier
  /-- Extensive: `a ≤ j a`. -/
  infl : ∀ a, H.le a (j a)
  /-- Idempotent: `j (j a) = j a`. -/
  idem : ∀ a, j (j a) = j a
  /-- Meet-preserving: `j (a ⊓ b) = j a ⊓ j b`. -/
  meet : ∀ a b, j (H.meet a b) = H.meet (j a) (j b)

namespace Nucleus
variable {H : HeytingAlgebra} (N : Nucleus H)

/-- A nucleus is **monotone** — derived from meet-preservation. -/
theorem mono {a b : H.carrier} (h : H.le a b) : H.le (N.j a) (N.j b) := by
  show H.meet (N.j a) (N.j b) = N.j a
  rw [← N.meet, h]

/-- `Fix(j)`: the predicate picking out fixed points (the quiescent pole). -/
def Fix (a : H.carrier) : Prop := N.j a = a

/-- **Counit = identity.** `j` restricted to `Fix(j)` is the identity. -/
theorem fix_counit {a : H.carrier} (ha : N.Fix a) : N.j a = a := ha

/-- **Unit = extensivity.** The reflection's unit `a ≤ j a`. -/
theorem fix_unit (a : H.carrier) : H.le a (N.j a) := N.infl a

/-- **The reflection `j ⊣ ι`** (adjunction form). For any `a` and any *fixed* `b`,
`a ≤ ι b ⟺ j a ≤ b` — i.e. `j a ≤ b ⟺ a ≤ b` whenever `j b = b`. The free→quiescent
map `j` is left adjoint to the inclusion `ι : Fix(j) ↪ A`. -/
theorem reflection {a b : H.carrier} (hb : N.Fix b) :
    H.le (N.j a) b ↔ H.le a b := by
  constructor
  · intro h; exact H.le_trans (N.infl a) h
  · intro h
    have : H.le (N.j a) (N.j b) := N.mono h
    rwa [N.fix_counit hb] at this

/-! ### `Fix(j)` is a sub-Heyting-algebra -/

/-- `Fix(j)` is closed under **meet**: meet-preservation directly. -/
theorem fix_meet {a b : H.carrier} (ha : N.Fix a) (hb : N.Fix b) :
    N.Fix (H.meet a b) := by
  show N.j (H.meet a b) = H.meet a b
  rw [N.meet, ha, hb]

/-- `Fix(j)` is closed under **join** — but the sub-algebra join is `jJoin a b :=
j (a ⊔ b)`, *not* the ambient `a ⊔ b` (a nucleus preserves meets, not joins, so the
ambient join of two fixed points need not be fixed). The reflected join `j (a ⊔ b)` is
always fixed (idempotence) and is the least fixed point above both `a` and `b` — the
genuine lub inside `Fix(j)`. -/
def jJoin (a b : H.carrier) : H.carrier := N.j (H.join a b)

theorem fix_jJoin (a b : H.carrier) : N.Fix (N.jJoin a b) := N.idem (H.join a b)

/-- `jJoin` is an **upper bound** of both fixed inputs (lands in `Fix(j)`). -/
theorem le_jJoin_left (a b : H.carrier) : H.le a (N.jJoin a b) :=
  H.le_trans (H.le_join_left a b) (N.infl _)
theorem le_jJoin_right (a b : H.carrier) : H.le b (N.jJoin a b) :=
  H.le_trans (H.le_join_right a b) (N.infl _)

/-- `jJoin` is the **least** fixed upper bound: if `a ≤ c`, `b ≤ c`, and `c` is fixed,
then `jJoin a b ≤ c`. This is the lub property *inside* `Fix(j)`. -/
theorem jJoin_le {a b c : H.carrier} (h1 : H.le a c) (h2 : H.le b c) (hc : N.Fix c) :
    H.le (N.jJoin a b) c := by
  have : H.le (N.j (H.join a b)) (N.j c) := N.mono (H.join_le h1 h2)
  rwa [N.fix_counit hc] at this

/-- **Why meet-preservation matters.** `Fix(j)` is closed under `⇒`: if `b` is fixed
then so is `a ⇒ b`. This is the `fix_imp` technique of `Positing.Bigraded`, rebuilt over
`Order.HeytingAlgebra` — it is what makes `Fix(j)` a Heyting *sub-algebra*, not merely a
sub-lattice. -/
theorem fix_himp {a b : H.carrier} (hb : N.Fix b) :
    N.Fix (H.himp a b) := by
  show N.j (H.himp a b) = H.himp a b
  refine H.le_antisymm ?_ (N.infl _)
  -- Goal `j (a ⇒ b) ≤ a ⇒ b`. By the adjunction, equiv to `a ⊓ j (a ⇒ b) ≤ b`.
  rw [← H.himp_le_iff a (N.j (H.himp a b)) b]
  -- `a ⊓ j (a⇒b) ≤ j a ⊓ j (a⇒b) = j (a ⊓ (a⇒b)) ≤ j b = b`.
  have step1 : H.le (H.meet a (N.j (H.himp a b)))
      (H.meet (N.j a) (N.j (H.himp a b))) :=
    H.toLattice.le_meet
      (H.toLattice.le_trans (H.meet_le_left a (N.j (H.himp a b))) (N.infl a))
      (H.meet_le_right a (N.j (H.himp a b)))
  rw [(N.meet a (H.himp a b)).symm] at step1
  have step2 : H.le (N.j (H.meet a (H.himp a b))) b := by
    have := N.mono (H.modus_ponens a b); rwa [hb] at this
  exact H.le_trans step1 step2

/-- `Fix(j)` is closed under **top** (`⊤` is fixed): `⊤ ≤ j ⊤ ≤ ⊤`. -/
theorem fix_top : N.Fix H.top := H.le_antisymm (H.le_top _) (N.infl H.top)

end Nucleus

/-! ## Commuting nuclei — the commutative nuclear square -/

/-- A **commutative nuclear square**: two commuting nuclei on one Heyting algebra
(`…/nuclear-quartet/_archive/commutative-nuclear-square.md`). Read `j1, j2` as the
knowledge/truth closures `(j_k, j_t)`, or as saturation/transfer `(σ, Δ)` — the
past-facing and future-facing nuclei of an aperiodic settling. -/
structure CommutingNuclei (H : HeytingAlgebra) where
  j1 : Nucleus H
  j2 : Nucleus H
  /-- The hinge: `j₁ ∘ j₂ = j₂ ∘ j₁`. -/
  comm : ∀ a, j1.j (j2.j a) = j2.j (j1.j a)

namespace CommutingNuclei
variable {H : HeytingAlgebra} (Q : CommutingNuclei H)

/-- The joint closure `π = j₁ ∘ j₂` — the doubly-quiescent corner's operator. -/
def pi (a : H.carrier) : H.carrier := Q.j1.j (Q.j2.j a)

/-- **Nuclear Quartet Theorem, part 1.** Commuting nuclei compose to a nucleus. -/
def compNucleus : Nucleus H where
  j := Q.pi
  infl a := H.le_trans (Q.j2.infl a) (Q.j1.infl (Q.j2.j a))
  idem a := by
    calc Q.pi (Q.pi a)
        = Q.j1.j (Q.j2.j (Q.j1.j (Q.j2.j a))) := rfl
      _ = Q.j1.j (Q.j1.j (Q.j2.j (Q.j2.j a))) := by rw [← Q.comm (Q.j2.j a)]
      _ = Q.j1.j (Q.j1.j (Q.j2.j a)) := by rw [Q.j2.idem]
      _ = Q.j1.j (Q.j2.j a) := Q.j1.idem _
      _ = Q.pi a := rfl
  meet a b := by
    show Q.j1.j (Q.j2.j (H.meet a b))
        = H.meet (Q.j1.j (Q.j2.j a)) (Q.j1.j (Q.j2.j b))
    rw [Q.j2.meet, Q.j1.meet]

/-- **Nuclear Quartet Theorem, part 2.** `Fix(π) = Fix(j₁) ∩ Fix(j₂)` — the
joint-quiescent corner is exactly the joint fixed point. Commutativity is the hinge.
(`fix_pi_iff`, rebuilt over `Order.HeytingAlgebra`.) -/
theorem fix_pi_iff (a : H.carrier) :
    Q.pi a = a ↔ (Q.j1.Fix a ∧ Q.j2.Fix a) := by
  constructor
  · intro h
    have hu : Q.j1.j (Q.j2.j a) = a := h
    have hge : H.le a (Q.j2.j a) := Q.j2.infl a
    have hle : H.le (Q.j2.j a) a := by
      have h' := Q.j1.infl (Q.j2.j a); rw [hu] at h'; exact h'
    have hj2 : Q.j2.j a = a := H.le_antisymm hle hge
    rw [hj2] at hu; exact ⟨hu, hj2⟩
  · intro ⟨h1, h2⟩
    show Q.j1.j (Q.j2.j a) = a
    rw [Q.j2.fix_counit h2, Q.j1.fix_counit h1]

/-- **The commuting square.** Both paths `A → A*` agree. -/
theorem square (a : H.carrier) : Q.j1.j (Q.j2.j a) = Q.j2.j (Q.j1.j a) := Q.comm a

end CommutingNuclei

/-! ## The nuclear quartet — four corners indexed by `Articulating.Corner` -/

/-- A **nuclear quartet** is a commutative nuclear square together with its four
corners. The corner operators are read off the recurring FOUR: `potential` = the free
carrier (neither nucleus acted), `active` = `j₁`-quiescent, `stable` = `j₂`-quiescent,
`absurd` = joint-quiescent (`π`). -/
abbrev NuclearQuartet (H : HeytingAlgebra) := CommutingNuclei H

namespace NuclearQuartet
variable {H : HeytingAlgebra} (Q : NuclearQuartet H)

/-- The corner operator selected by a `Articulating.Corner`: the four canonical sub-algebra
reflectors `(A, Fix(j₁), Fix(j₂), A*)`.

* `potential` ↦ identity (the free carrier `A`),
* `active`    ↦ `j₁` (reflects onto `Fix(j₁)`),
* `stable`    ↦ `j₂` (reflects onto `Fix(j₂)`),
* `absurd`    ↦ `π`  (reflects onto `A* = Fix(j₁) ∩ Fix(j₂)`). -/
def cornerOp (c : Articulating.Corner) (a : H.carrier) : H.carrier :=
  match c with
  | .potential => a
  | .active => Q.j1.j a
  | .stable => Q.j2.j a
  | .absurd => Q.pi a

@[simp] theorem cornerOp_potential (a) : Q.cornerOp .potential a = a := rfl
@[simp] theorem cornerOp_active (a) : Q.cornerOp .active a = Q.j1.j a := rfl
@[simp] theorem cornerOp_stable (a) : Q.cornerOp .stable a = Q.j2.j a := rfl
@[simp] theorem cornerOp_absurd (a) : Q.cornerOp .absurd a = Q.pi a := rfl

/-- **The four corners are the recurring FOUR.** The quartet's four corners — indexed
here by their slot-presence pair `(j₁-applied?, j₂-applied?)` — biject with
`Infomaterial.Articulating.Corner` (and hence, by `Articulating.FourCorner.cornerBij`, with `Articulating.FourCorner = Bool × Bool`
and with `Charge = Articulating.Corner`). `(false,false) = potential` (neither), `(true,false) =
active` (`j₁`), `(false,true) = stable` (`j₂`), `(true,true) = absurd` (both). -/
def cornerBij : Bij Articulating.Corner Articulating.FourCorner := Articulating.FourCorner.cornerBij.flip

/-- The corner's slot-presence reading: `(j₁ applied?, j₂ applied?)`. -/
def cornerStatus (c : Articulating.Corner) : Articulating.FourCorner := Articulating.FourCorner.ofCorner c

@[simp] theorem cornerStatus_potential : (cornerStatus .potential) = (false, false) := rfl
@[simp] theorem cornerStatus_active : (cornerStatus .active) = (true, false) := rfl
@[simp] theorem cornerStatus_stable : (cornerStatus .stable) = (false, true) := rfl
@[simp] theorem cornerStatus_absurd : (cornerStatus .absurd) = (true, true) := rfl

/-- **The quartet is exhaustive: exactly four corners.** The four canonical options
"apply neither, `j₁` alone, `j₂` alone, or both" exhaust the corners — there is no
fifth. -/
theorem corners_card_eq_four : Articulating.Corner.all.length = 4 := Articulating.Corner.card_eq_four

/-- **The joint corner is the intersection.** Restated via the corner operators:
`a` is `absurd`-quiescent iff it is both `active`- and `stable`-quiescent —
`Fix(π) = Fix(j₁) ∩ Fix(j₂)`. -/
theorem absurd_iff_active_and_stable (a : H.carrier) :
    Q.cornerOp .absurd a = a ↔
      (Q.cornerOp .active a = a ∧ Q.cornerOp .stable a = a) :=
  Q.fix_pi_iff a

end NuclearQuartet

end Order
end Infomaterial
