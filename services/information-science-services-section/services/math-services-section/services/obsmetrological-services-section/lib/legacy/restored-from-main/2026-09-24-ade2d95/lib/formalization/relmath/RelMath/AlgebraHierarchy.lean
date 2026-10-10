/-
# AlgebraHierarchy — the algebraic tower (magma→…→field) as a degenerate shadow

Received Western *algebra* — the magma → semigroup → monoid → group →
ring → field tower — is, in the corpus, a **degenerate shadow**: there is no single
`algebra-hierarchy` corpus node, exactly as there is none for set/number/graph theory
(`SetNumberGraphTheory.lean`). The two in-chain anchors that the tower is the shadow
*of* are:

* `positing/content/residuated-lattice/residuated-lattice.md` — the integral
  commutative residuated lattice `⟨L,∨,∧,·,→,1⟩`, whose `⟨L,∧⟩` is a lattice and
  whose `⟨L,·,1⟩` is a **commutative monoid**. The lattice/monoid *family* the algebra
  tower formalizes is generated here. (`ResiduatedLatticeStandalone.lean` derives it.)
* the **klein-four-symmetry** node
  (`…/pre-bilattice/content/bilattice/content/klein-four-symmetry`) — the concrete group
  `K₄ ≅ ℤ/2 × ℤ/2 = ⟨∼,−⟩`. (`KleinFourGauge.lean` packages it with the full group
  laws proven by exhaustion.)

This module bundles the multiplicative tower as `structure`s (carrying the laws as
**fields** — the house style of `OrderInfra.Lattice` and `Discrete.CommSemiring`, NOT
free data), derives a few bites (uniqueness of identity, two-sided inverse from
one-sided), and culminates in two **concrete worked shadows proven from already-derived
material**:

* `kleinFourGroup : AbelianGroup` — the corpus's named group `K₄` living in the tower,
  every law **reused** from `KleinFour.K4`'s proven lemmas (no re-proof).
* `boolField : Field` — the two-element field `𝔽₂` on `Bool` (add = xor, mul = and),
  every field law by `decide`/exhaustion.

It also shows the **shadow collapse** order→algebra: a `BoundedLattice` is a
`CommMonoid` under meet (unit `⊤`), and a residuated lattice is a `CommMonoid` under its
fusion `·` (reusing the dep's fusion monoid laws). The order structures *are* the
algebraic ones.
-/
import RelMath.OrderInfra
import RelMath.ResiduatedLatticeStandalone
import RelMath.KleinFourGauge

namespace RelMath
namespace Algebra

/-! # =====================================================================
    # (A) The multiplicative tower: Magma → … → AbelianGroup
    # ===================================================================== -/

/-- A **magma**: a carrier with a binary operation, no laws. The floor of the tower. -/
structure Magma where
  carrier : Type
  op : carrier → carrier → carrier

/-- A **semigroup**: a magma whose operation is associative. -/
structure Semigroup extends Magma where
  op_assoc : ∀ a b c, op (op a b) c = op a (op b c)

/-- A **monoid**: a semigroup with a two-sided identity `one`. -/
structure Monoid extends Semigroup where
  one : carrier
  one_mul : ∀ a, op one a = a
  mul_one : ∀ a, op a one = a

namespace Monoid
variable (M : Monoid)

/-- **Uniqueness of the identity.** Any element `e` that is a left-and-right identity
equals `one` — the monoid identity bites. -/
theorem one_unique (e : M.carrier)
    (hl : ∀ a, M.op e a = a) (_hr : ∀ a, M.op a e = a) : e = M.one := by
  calc e = M.op e M.one := (M.mul_one e).symm
    _ = M.one := hl M.one

end Monoid

/-- A **commutative monoid**: a monoid whose operation commutes. -/
structure CommMonoid extends Monoid where
  mul_comm : ∀ a b, op a b = op b a

/-- A **group**: a monoid with a two-sided-derivable inverse — here a left inverse
`inv a · a = one`. The other side is *derived* below. -/
structure Group extends Monoid where
  inv : carrier → carrier
  mul_left_inv : ∀ a, op (inv a) a = one

namespace Group
variable (G : Group)

/-- A left inverse is also a right inverse: `a · a⁻¹ = 1`. The classic group argument,
using only associativity, the left identity and the *left* inverse axiom. -/
theorem mul_right_inv (a : G.carrier) : G.op a (G.inv a) = G.one := by
  -- Let b = a⁻¹, c = b⁻¹ = (a⁻¹)⁻¹.
  have hb : G.op (G.inv a) a = G.one := G.mul_left_inv a
  have hc : G.op (G.inv (G.inv a)) (G.inv a) = G.one := G.mul_left_inv (G.inv a)
  calc G.op a (G.inv a)
      = G.op (G.one) (G.op a (G.inv a)) := (G.one_mul _).symm
    _ = G.op (G.op (G.inv (G.inv a)) (G.inv a)) (G.op a (G.inv a)) := by rw [hc]
    _ = G.op (G.inv (G.inv a)) (G.op (G.inv a) (G.op a (G.inv a))) := by
          rw [G.op_assoc]
    _ = G.op (G.inv (G.inv a)) (G.op (G.op (G.inv a) a) (G.inv a)) := by
          rw [G.op_assoc]
    _ = G.op (G.inv (G.inv a)) (G.op G.one (G.inv a)) := by rw [hb]
    _ = G.op (G.inv (G.inv a)) (G.inv a) := by rw [G.one_mul]
    _ = G.one := hc

/-- The inverse is two-sided: `(a⁻¹·a = 1) ∧ (a·a⁻¹ = 1)`. -/
theorem inv_two_sided (a : G.carrier) :
    G.op (G.inv a) a = G.one ∧ G.op a (G.inv a) = G.one :=
  ⟨G.mul_left_inv a, G.mul_right_inv a⟩

/-- **Left cancellation.** `a·b = a·c ⟹ b = c`. -/
theorem mul_left_cancel {a b c : G.carrier} (h : G.op a b = G.op a c) : b = c := by
  calc b = G.op G.one b := (G.one_mul b).symm
    _ = G.op (G.op (G.inv a) a) b := by rw [G.mul_left_inv]
    _ = G.op (G.inv a) (G.op a b) := G.op_assoc _ _ _
    _ = G.op (G.inv a) (G.op a c) := by rw [h]
    _ = G.op (G.op (G.inv a) a) c := (G.op_assoc _ _ _).symm
    _ = G.op G.one c := by rw [G.mul_left_inv]
    _ = c := G.one_mul c

end Group

/-- An **abelian group**: a group whose operation commutes. -/
structure AbelianGroup extends Group where
  mul_comm : ∀ a b, op a b = op b a

namespace AbelianGroup
variable (A : AbelianGroup)

/-- The underlying commutative monoid of an abelian group (the monoid laws plus
commutativity). -/
def toCommMonoid : CommMonoid where
  toMonoid := A.toMonoid
  mul_comm := A.mul_comm

end AbelianGroup

/-! # =====================================================================
    # (B) Monoid homomorphisms: identity and composition
    # ===================================================================== -/

/-- A **monoid homomorphism**: a map preserving the operation and the identity. -/
structure Homomorphism (M N : Monoid) where
  map : M.carrier → N.carrier
  map_one : map M.one = N.one
  map_op : ∀ a b, map (M.op a b) = N.op (map a) (map b)

namespace Homomorphism

/-- The **identity homomorphism** on a monoid. -/
def id (M : Monoid) : Homomorphism M M where
  map := fun a => a
  map_one := rfl
  map_op := fun _ _ => rfl

/-- The **composite** of two monoid homomorphisms is a homomorphism. -/
def comp {M N P : Monoid} (g : Homomorphism N P) (f : Homomorphism M N) :
    Homomorphism M P where
  map := fun a => g.map (f.map a)
  map_one := by rw [f.map_one, g.map_one]
  map_op := fun a b => by rw [f.map_op, g.map_op]

/-- Composition with the identity on the left is the identity. -/
theorem id_comp {M N : Monoid} (f : Homomorphism M N) :
    (comp (id N) f).map = f.map := rfl

/-- Composition with the identity on the right is the identity. -/
theorem comp_id {M N : Monoid} (f : Homomorphism M N) :
    (comp f (id M)).map = f.map := rfl

/-- Composition of homomorphisms is associative (on the underlying maps). -/
theorem comp_assoc {M N P Q : Monoid}
    (h : Homomorphism P Q) (g : Homomorphism N P) (f : Homomorphism M N) :
    (comp (comp h g) f).map = (comp h (comp g f)).map := rfl

end Homomorphism

/-! # =====================================================================
    # (C) Lattice-family tie-in: the order structures ARE the algebraic ones
    # ===================================================================== -/

/-- **A bounded lattice is a commutative monoid under meet**, with unit `⊤`. The meet
laws (`meet_comm`, `meet_assoc`, `meet_top`) are exactly the commutative-monoid laws;
the left identity is derived from `meet_top` by commutativity. This is the shadow
collapse: the order's `⊓` *is* a monoid multiplication
(`positing/content/residuated-lattice`: `⟨L,∧⟩` carries a meet-semilattice = idempotent
commutative monoid). -/
def meetMonoid (L : Order.BoundedLattice) : CommMonoid where
  carrier := L.carrier
  op := L.meet
  op_assoc := L.meet_assoc
  one := L.top
  one_mul a := by rw [L.meet_comm]; exact L.meet_top a
  mul_one := L.meet_top
  mul_comm := L.meet_comm

/-- **A bounded lattice is a commutative monoid under join**, with unit `⊥` — the dual
collapse. -/
def joinMonoid (L : Order.BoundedLattice) : CommMonoid where
  carrier := L.carrier
  op := L.join
  op_assoc := L.join_assoc
  one := L.bot
  one_mul a := by rw [L.join_comm]; exact L.join_bot a
  mul_one := L.join_bot
  mul_comm := L.join_comm

/-- **A residuated lattice is a commutative monoid under its fusion `·`**, unit `1`.
The monoid laws are *reused* directly from `ResiduatedLattice`'s `fuse_comm`,
`fuse_assoc`, `fuse_one` — the residuated structure's fusion **is** the algebraic
multiplication (`positing/content/residuated-lattice`: `⟨L,·,1⟩` is a commutative
monoid). The left identity is derived from `fuse_one` by commutativity. -/
def fuseMonoid (R : Order.ResiduatedLattice) : CommMonoid where
  carrier := R.carrier
  op := R.fuse
  op_assoc := R.fuse_assoc
  one := R.one
  one_mul a := by rw [R.fuse_comm]; exact R.fuse_one a
  mul_one := R.fuse_one
  mul_comm := R.fuse_comm

/-- Confirming the collapse on the canonical base: `Two` (the 2-element Boolean
residuated lattice) yields a commutative monoid under fusion `&&`. -/
def twoFuseMonoid : CommMonoid := fuseMonoid Order.Two

/-! # =====================================================================
    # (D) Ring/field shadow: Semiring → Ring → Field, and 𝔽₂ = boolField
    # ===================================================================== -/

/-- A **semiring**: an additive commutative monoid `(+,0)`, a multiplicative monoid
`(*,1)`, two-sided distributivity, and a two-sided zero annihilator. (Bundled, every
law a field — house style of `Discrete.CommSemiring`.) -/
structure Semiring where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  add_assoc : ∀ a b c, add (add a b) c = add a (add b c)
  add_comm : ∀ a b, add a b = add b a
  add_zero : ∀ a, add a zero = a
  zero_add : ∀ a, add zero a = a
  mul_assoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a, mul one a = a
  mul_one : ∀ a, mul a one = a
  left_distrib : ∀ a b c, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : ∀ a b c, mul (add a b) c = add (mul a c) (mul b c)
  zero_mul : ∀ a, mul zero a = zero
  mul_zero : ∀ a, mul a zero = zero

/-- A **ring**: a semiring with additive inverses (`neg`, two-sided). The additive part
becomes an abelian group. -/
structure Ring extends Semiring where
  neg : carrier → carrier
  add_left_neg : ∀ a, add (neg a) a = zero

/-- A **commutative ring**: a ring whose multiplication commutes. -/
structure CommRing extends Ring where
  mul_comm : ∀ a b, mul a b = mul b a

/-- A **field**: a commutative ring with multiplicative inverses on the nonzero
elements (`inv`, with `inv 0 = 0` by convention) and `0 ≠ 1`. -/
structure Field extends CommRing where
  inv : carrier → carrier
  mul_inv_cancel : ∀ a, a ≠ zero → mul a (inv a) = one
  inv_zero : inv zero = zero
  zero_ne_one : zero ≠ one

namespace Ring
variable (R : Ring)

/-- The additive part of a ring is an abelian group. The additive group's `inv` is
`neg`; its `mul_left_inv` is `add_left_neg`. -/
def addAbelianGroup : AbelianGroup where
  carrier := R.carrier
  op := R.add
  op_assoc := R.add_assoc
  one := R.zero
  one_mul := R.zero_add
  mul_one := R.add_zero
  inv := R.neg
  mul_left_inv := R.add_left_neg
  mul_comm := R.add_comm

end Ring

/-! ## 𝔽₂ = the two-element field on `Bool` -/

/-- **`boolField : Field`** — the two-element field `𝔽₂` on `Bool`: addition is `xor`
(`Bool.xor`), multiplication is `and`, `0 = false`, `1 = true`, negation is the identity
(`x = -x` in characteristic 2), and inversion is the identity (the only nonzero element
`true` is its own inverse). Every field law is finite over `Bool`, so `decide` settles
each (`zero_ne_one` is `Bool.noConfusion`). This is the concrete worked shadow: a full
`Field` instance with every law proven. -/
def boolField : Field where
  carrier := Bool
  add := xor
  mul := (· && ·)
  zero := false
  one := true
  add_assoc := by decide
  add_comm := by decide
  add_zero := by decide
  zero_add := by decide
  mul_assoc := by decide
  one_mul := by decide
  mul_one := by decide
  left_distrib := by decide
  right_distrib := by decide
  zero_mul := by decide
  mul_zero := by decide
  neg := fun a => a
  add_left_neg := by decide
  mul_comm := by decide
  inv := fun a => a
  mul_inv_cancel := by decide
  inv_zero := rfl
  zero_ne_one := by decide

/-! # =====================================================================
    # the Klein-four group K₄ in the abelian-group tower
    # ===================================================================== -/

/-- **`kleinFourGroup : AbelianGroup`** — the corpus's named group `K₄ ≅ ℤ/2 × ℤ/2`
(`…/pre-bilattice/content/bilattice/content/klein-four-symmetry`) living in the algebraic
hierarchy. Carrier `KleinFour.K4`, operation `K4.mul`, identity `K4.id`, and **inverse =
identity** (every element is self-inverse). ALL the structure's laws are supplied by
**reusing** `KleinFour.K4`'s already-proven lemmas — no re-proof:

* `op_assoc` ← `K4.mul_assoc`
* `one_mul` ← `K4.id_mul`, `mul_one` ← `K4.mul_id`
* `mul_left_inv` (`(g⁻¹)·g = id` with `g⁻¹ := g`) ← `K4.mul_self`
* `mul_comm` ← `K4.mul_comm`

so `kleinFourGroup` is exactly the group object `K4.isGroup` certified, re-presented as
an `AbelianGroup` in this tower. -/
def kleinFourGroup : AbelianGroup where
  carrier := KleinFour.K4
  op := KleinFour.K4.mul
  op_assoc := KleinFour.K4.mul_assoc
  one := KleinFour.K4.id
  one_mul := KleinFour.K4.id_mul
  mul_one := KleinFour.K4.mul_id
  inv := fun g => g
  mul_left_inv := KleinFour.K4.mul_self
  mul_comm := KleinFour.K4.mul_comm

/-- The Klein-four group is, in particular, a commutative monoid — the same proven laws
viewed one rung down the tower. -/
def kleinFourCommMonoid : CommMonoid := kleinFourGroup.toCommMonoid

/-- **The headlines bite the derived theorems.** In `kleinFourGroup` the one-sided
inverse axiom yields the two-sided inverse via `Group.mul_right_inv`: each `K4` element
times itself is the identity on the right, too — exactly `K4.mul_self` recovered through
the abstract group derivation. -/
theorem kleinFour_right_inv (g : KleinFour.K4) :
    KleinFour.K4.mul g g = KleinFour.K4.id :=
  kleinFourGroup.toGroup.mul_right_inv g

/-- And `boolField`'s additive part is an abelian group whose identity is unique: any
two-sided additive identity over `Bool` equals `false`. -/
theorem boolField_zero_unique (e : Bool)
    (hl : ∀ a, xor e a = a) (hr : ∀ a, xor a e = a) : e = false :=
  boolField.toRing.addAbelianGroup.toMonoid.one_unique e hl hr

end Algebra
end RelMath
