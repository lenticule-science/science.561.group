import Obsmetrologia.Calculus.Order.ResiduatedLatticeStandalone
import Obsmetrologia.Language.Positing.Four
import Obsmetrologia.Language.Positing.ReadingTactic

/-!
# TwistProductResiduation — the twist product `L^⊲` and `FOUR = Two^⊲`

The corpus node `…/positing/content/residuated-lattice/content/twist-product` (and
its `references/twist-product-residuation`, `references/twist-product-chu-correspondence`,
together with `…/positing/content/pre-bilattice/content/bilattice/references/avron-representation`)
builds, over any integral commutative residuated lattice
`L = ⟨L, ∨, ∧, ·, →, 1⟩`, the **twist product** `L^⊲`:

* carrier `L × L`, an element `⟨x,y⟩ = (evidence-for x, evidence-against y)`;
* the **knowledge order** `⟨x,y⟩ ≤ₖ ⟨z,v⟩ ⟺ x≤z ∧ y≤v` (raise both coordinates);
* the **truth order** `⟨x,y⟩ ≤ₜ ⟨z,v⟩ ⟺ x≤z ∧ v≤y` (raise positive, lower negative);
* two pairs of meet/join — knowledge `⟨x∧z, y∧v⟩ / ⟨x∨z, y∨v⟩`, truth `⟨x∧z, y∨v⟩ / ⟨x∨z, y∧v⟩`;
* the **negation** `∼⟨x,y⟩ = ⟨y,x⟩` (the coordinate swap), an involution that fixes
  `≤ₖ` and reverses `≤ₜ` — the bilattice duality of the two orders;
* the **fusion** `⟨x,y⟩ ⊙ ⟨z,v⟩ = ⟨x·z, (x→v)∧(z→y)⟩` and the **right residual**
  `⟨x,y⟩ ⇒ ⟨z,v⟩ = ⟨(x→z)∧(v→y), x·v⟩`.

The headline is `twist-product-residuation`: `⟨L², ⊙, ⇒, ⟨1,1⟩⟩` is a commutative
residuated lattice **in the truth order**, with the residuation adjunction

>  `⟨a⟩ ⊙ ⟨b⟩ ≤ₜ ⟨c⟩  ⟺  ⟨a⟩ ≤ₜ ⟨b⟩ ⇒ ⟨c⟩`

proven by the corpus's eight-step iff-chain (residuation in `L` applied three times,
plus the meet-universal property). The construction is **non-integral**: the monoidal
unit `⟨1,1⟩` is *not* the truth-top of the lattice (the truth-top is `⟨1,0⟩ = ⟨⊤,⊥⟩`),
so `⟨L², ⊙, ⇒⟩` is a non-integral commutative residuated lattice — the
algebraic shape of the `⊗ ⊣ ⊸` adjunction of multiplicative linear logic
(`twist-product-chu-correspondence`: on the consistent sub-algebra
`{⟨a₊,a₋⟩ : a₊∧a₋ = 0}`, `⊙`/`⇒` coincide with the Chu tensor/implication of
`Chu(L,0)`; the full twist product extends the model beyond consistency, the
inconsistent `⊤ = ⟨1,1⟩` corresponding to `a₊∧a₋ = 1`).

By **Avron's representation theorem** (`avron-representation`; [@avron1996],
[@rivieccio2010] Thm 1.3.9–10), a bounded bilattice is interlaced iff it is
isomorphic to `L^⊲` for some bounded lattice `L`; the twist product is therefore
the *canonical and exhaustive* form of the interlaced bounded bilattice, and the
two-coordinate `⟨a₊,a₋⟩` description is the universal one. Specializing to
`L = Two` (the Boolean residuated lattice, `Obsmetrologia.Order.Two`) recovers the
smallest non-trivial interlaced bilattice **FOUR** `:= TwistProduct Two`, with the
four elements `⟨0,0⟩ = ⊥ₖ`, `⟨1,0⟩ = t`, `⟨0,1⟩ = f`, `⟨1,1⟩ = ⊤ₖ`. This module
proves the already-built `Obsmetrologia.Reading` (= `Articulating.Corner`, the FOUR bilattice of the
spine) **is** `TwistProduct Two`: the map `⟨a,b⟩ ↦ Reading.ofSlots a b` is an
order-iso for both `≤ₖ` and `≤ₜ`, settled by `decide` over the finite carrier.
-/

namespace Obsmetrologia
namespace Order

/-! ## The twist-product carrier and its two orders

We work over a fixed integral commutative residuated lattice `R`. The carrier is
the bare product `R.carrier × R.carrier`; `⟨x,y⟩.1` is positive evidence, `⟨x,y⟩.2`
negative evidence. All operations and orders are defined coordinatewise on the
underlying lattice/residuation of `R`. -/

namespace TwistProduct

variable (R : ResiduatedLattice)

/-- The twist-product carrier: pairs `⟨evidence-for, evidence-against⟩`. -/
abbrev Carrier := R.carrier × R.carrier

variable {R}

/-- **Knowledge order** `≤ₖ`: raise both coordinates. `⟨x,y⟩ ≤ₖ ⟨z,v⟩ ⟺ x≤z ∧ y≤v`. -/
def leK (a b : Carrier R) : Prop := R.le a.1 b.1 ∧ R.le a.2 b.2

/-- **Truth order** `≤ₜ`: raise positive, lower negative. `⟨x,y⟩ ≤ₜ ⟨z,v⟩ ⟺ x≤z ∧ v≤y`. -/
def leT (a b : Carrier R) : Prop := R.le a.1 b.1 ∧ R.le b.2 a.2

/-- **Knowledge meet** `∧ₖ = ⟨x∧z, y∧v⟩`. -/
def meetK (a b : Carrier R) : Carrier R := (R.meet a.1 b.1, R.meet a.2 b.2)
/-- **Knowledge join** `∨ₖ = ⟨x∨z, y∨v⟩`. -/
def joinK (a b : Carrier R) : Carrier R := (R.join a.1 b.1, R.join a.2 b.2)
/-- **Truth meet** `∧ₜ = ⟨x∧z, y∨v⟩`. -/
def meetT (a b : Carrier R) : Carrier R := (R.meet a.1 b.1, R.join a.2 b.2)
/-- **Truth join** `∨ₜ = ⟨x∨z, y∧v⟩`. -/
def joinT (a b : Carrier R) : Carrier R := (R.join a.1 b.1, R.meet a.2 b.2)

/-- **Negation** `∼⟨x,y⟩ = ⟨y,x⟩`: the coordinate swap. -/
def neg (a : Carrier R) : Carrier R := (a.2, a.1)

/-- **Fusion** `⟨x,y⟩ ⊙ ⟨z,v⟩ = ⟨x·z, (x→v)∧(z→y)⟩`. -/
def fuse (a b : Carrier R) : Carrier R :=
  (R.fuse a.1 b.1, R.meet (R.imp a.1 b.2) (R.imp b.1 a.2))

/-- **Right residual** `⟨x,y⟩ ⇒ ⟨z,v⟩ = ⟨(x→z)∧(v→y), x·v⟩`. -/
def imp (a b : Carrier R) : Carrier R :=
  (R.meet (R.imp a.1 b.1) (R.imp b.2 a.2), R.fuse a.1 b.2)

/-- The monoidal unit `⟨1,1⟩`. -/
def one : Carrier R := (R.one, R.one)

/-! ## Lattice helper: the meet-universal property in `R`

`c ≤ a∧b ⟺ c≤a ∧ c≤b`. Forward via `meet_le_left/right` + transitivity; backward is
`le_meet`. This is the one general lattice fact the residuation chain leans on. -/

/-- `c ≤ a ⊓ b ⟺ (c ≤ a ∧ c ≤ b)`. -/
theorem le_meet_iff (R : ResiduatedLattice) (c a b : R.carrier) :
    R.le c (R.meet a b) ↔ R.le c a ∧ R.le c b := by
  constructor
  · intro h
    exact ⟨R.le_trans h (R.toLattice.meet_le_left a b),
           R.le_trans h (R.toLattice.meet_le_right a b)⟩
  · intro ⟨h1, h2⟩
    exact R.toLattice.le_meet h1 h2

/-! ## The two orders are partial orders

Coordinatewise reflexivity/transitivity/antisymmetry from `R`'s. -/

theorem leK_refl (a : Carrier R) : leK a a := ⟨R.le_refl a.1, R.le_refl a.2⟩
theorem leK_trans {a b c : Carrier R} (h1 : leK a b) (h2 : leK b c) : leK a c :=
  ⟨R.le_trans h1.1 h2.1, R.le_trans h1.2 h2.2⟩
theorem leK_antisymm {a b : Carrier R} (h1 : leK a b) (h2 : leK b a) : a = b := by
  have e1 : a.1 = b.1 := R.le_antisymm h1.1 h2.1
  have e2 : a.2 = b.2 := R.le_antisymm h1.2 h2.2
  exact Prod.ext e1 e2

theorem leT_refl (a : Carrier R) : leT a a := ⟨R.le_refl a.1, R.le_refl a.2⟩
theorem leT_trans {a b c : Carrier R} (h1 : leT a b) (h2 : leT b c) : leT a c :=
  ⟨R.le_trans h1.1 h2.1, R.le_trans h2.2 h1.2⟩
theorem leT_antisymm {a b : Carrier R} (h1 : leT a b) (h2 : leT b a) : a = b := by
  have e1 : a.1 = b.1 := R.le_antisymm h1.1 h2.1
  have e2 : a.2 = b.2 := R.le_antisymm h2.2 h1.2
  exact Prod.ext e1 e2

/-! ## Negation `∼` is an involution and the order duality

`∼∼ = id`; `∼` preserves `≤ₖ` (an order-iso of the knowledge order) and reverses
`≤ₜ` (antitone on the truth order) — the bilattice negation is the duality that
swaps the *roles* of positive/negative evidence. -/

/-- `∼` is **involutive**. -/
@[simp] theorem neg_neg (a : Carrier R) : neg (neg a) = a := rfl

/-- `∼` **preserves the knowledge order**: `∼a ≤ₖ ∼b ⟺ a ≤ₖ b`. An order-iso of `≤ₖ`. -/
theorem neg_leK (a b : Carrier R) : leK (neg a) (neg b) ↔ leK a b := by
  unfold leK neg
  exact ⟨fun h => ⟨h.2, h.1⟩, fun h => ⟨h.2, h.1⟩⟩

/-- `∼` **reverses the truth order**: `∼a ≤ₜ ∼b ⟺ b ≤ₜ a`. Antitone on `≤ₜ`. -/
theorem neg_leT (a b : Carrier R) : leT (neg a) (neg b) ↔ leT b a := by
  unfold leT neg
  exact ⟨fun h => ⟨h.2, h.1⟩, fun h => ⟨h.2, h.1⟩⟩

/-! ## Both orders are bounded lattices

`∧ₖ`/`∨ₖ` are the glb/lub of `≤ₖ`; `∧ₜ`/`∨ₜ` of `≤ₜ`. The bounds:
`⊥ₖ = ⟨⊥,⊥⟩`, `⊤ₖ = ⟨⊤,⊤⟩` for the knowledge order; `⊥ₜ = ⟨⊥,⊤⟩`, `⊤ₜ = ⟨⊤,⊥⟩`
for the truth order. Each is a `BoundedLattice` packaged on `Carrier R`'s order. -/

/-- Knowledge meet is a lower bound (left). -/
theorem meetK_leK_left (a b : Carrier R) : leK (meetK a b) a :=
  ⟨R.toLattice.meet_le_left a.1 b.1, R.toLattice.meet_le_left a.2 b.2⟩
/-- Knowledge meet is a lower bound (right). -/
theorem meetK_leK_right (a b : Carrier R) : leK (meetK a b) b :=
  ⟨R.toLattice.meet_le_right a.1 b.1, R.toLattice.meet_le_right a.2 b.2⟩
/-- Knowledge meet is the greatest lower bound. -/
theorem leK_meetK {a b c : Carrier R} (h1 : leK c a) (h2 : leK c b) : leK c (meetK a b) :=
  ⟨R.toLattice.le_meet h1.1 h2.1, R.toLattice.le_meet h1.2 h2.2⟩

/-- Knowledge join is an upper bound (left). -/
theorem leK_joinK_left (a b : Carrier R) : leK a (joinK a b) :=
  ⟨R.toLattice.le_join_left a.1 b.1, R.toLattice.le_join_left a.2 b.2⟩
/-- Knowledge join is an upper bound (right). -/
theorem leK_joinK_right (a b : Carrier R) : leK b (joinK a b) :=
  ⟨R.toLattice.le_join_right a.1 b.1, R.toLattice.le_join_right a.2 b.2⟩
/-- Knowledge join is the least upper bound. -/
theorem joinK_leK {a b c : Carrier R} (h1 : leK a c) (h2 : leK b c) : leK (joinK a b) c :=
  ⟨R.toLattice.join_le h1.1 h2.1, R.toLattice.join_le h1.2 h2.2⟩

/-- Truth meet is a lower bound (left). -/
theorem meetT_leT_left (a b : Carrier R) : leT (meetT a b) a :=
  ⟨R.toLattice.meet_le_left a.1 b.1, R.toLattice.le_join_left a.2 b.2⟩
/-- Truth meet is a lower bound (right). -/
theorem meetT_leT_right (a b : Carrier R) : leT (meetT a b) b :=
  ⟨R.toLattice.meet_le_right a.1 b.1, R.toLattice.le_join_right a.2 b.2⟩
/-- Truth meet is the greatest lower bound. -/
theorem leT_meetT {a b c : Carrier R} (h1 : leT c a) (h2 : leT c b) : leT c (meetT a b) :=
  ⟨R.toLattice.le_meet h1.1 h2.1, R.toLattice.join_le h1.2 h2.2⟩

/-- Truth join is an upper bound (left). -/
theorem leT_joinT_left (a b : Carrier R) : leT a (joinT a b) :=
  ⟨R.toLattice.le_join_left a.1 b.1, R.toLattice.meet_le_left a.2 b.2⟩
/-- Truth join is an upper bound (right). -/
theorem leT_joinT_right (a b : Carrier R) : leT b (joinT a b) :=
  ⟨R.toLattice.le_join_right a.1 b.1, R.toLattice.meet_le_right a.2 b.2⟩
/-- Truth join is the least upper bound. -/
theorem joinT_leT {a b c : Carrier R} (h1 : leT a c) (h2 : leT b c) : leT (joinT a b) c :=
  ⟨R.toLattice.join_le h1.1 h2.1, R.toLattice.le_meet h1.2 h2.2⟩

/-! ### The bounds -/

/-- Knowledge bottom `⊥ₖ = ⟨⊥,⊥⟩`. -/
def kBot : Carrier R := (R.bot, R.bot)
/-- Knowledge top `⊤ₖ = ⟨⊤,⊤⟩`. -/
def kTop : Carrier R := (R.top, R.top)
/-- Truth bottom `⊥ₜ = ⟨⊥,⊤⟩`. -/
def tBot : Carrier R := (R.bot, R.top)
/-- Truth top `⊤ₜ = ⟨⊤,⊥⟩`. -/
def tTop : Carrier R := (R.top, R.bot)

theorem kBot_leK (a : Carrier R) : leK kBot a :=
  ⟨R.toBoundedLattice.bot_le a.1, R.toBoundedLattice.bot_le a.2⟩
theorem leK_kTop (a : Carrier R) : leK a kTop :=
  ⟨R.toBoundedLattice.le_top a.1, R.toBoundedLattice.le_top a.2⟩
theorem tBot_leT (a : Carrier R) : leT tBot a :=
  ⟨R.toBoundedLattice.bot_le a.1, R.toBoundedLattice.le_top a.2⟩
theorem leT_tTop (a : Carrier R) : leT a tTop :=
  ⟨R.toBoundedLattice.le_top a.1, R.toBoundedLattice.bot_le a.2⟩

/-! ## The residuation adjunction `⊙ ⊣ ⇒` in the truth order

The corpus's `twist-product-residuation` theorem, part (3). We prove the central
**eight-step iff-chain** directly:

> `⟨a,b⟩ ⊙ ⟨c,d⟩ ≤ₜ ⟨e,f⟩  ⟺  ⟨a,b⟩ ≤ₜ ⟨c,d⟩ ⇒ ⟨e,f⟩`.

Unfolding both sides through `≤ₜ`, `⊙`, `⇒`, and `le_meet_iff`, the equivalence
reduces to three applications of residuation in `R` (with `fuse_comm` to reorder
products) and the meet-universal property. -/

/-- **Residuation adjunction for `⊙ ⊣ ⇒` in the truth order.** The full eight-step
iff-chain of `twist-product-residuation`, over any integral commutative residuated
lattice. -/
theorem fuse_leT_iff (a b : Carrier R) (c : Carrier R) :
    leT (fuse a b) c ↔ leT a (imp b c) := by
  obtain ⟨a1, a2⟩ := a
  obtain ⟨c1, c2⟩ := b   -- second twist element ⟨c,d⟩
  obtain ⟨e1, e2⟩ := c   -- third twist element ⟨e,f⟩
  -- Names matching the corpus: a=a1, b=a2, c=c1, d=c2, e=e1, f=e2.
  unfold leT fuse imp
  simp only []
  -- LHS: a1·c1 ≤ e1  ∧  e2 ≤ (a1→c2) ⊓ (c1→a2)
  -- RHS: a1 ≤ (c1→e1) ⊓ (e2→c2)  ∧  c1·e2 ≤ a2
  rw [le_meet_iff, le_meet_iff]
  constructor
  · intro ⟨hfst, hsnd1, hsnd2⟩
    -- hfst : a1·c1 ≤ e1 ;  hsnd1 : e2 ≤ a1→c2 ;  hsnd2 : e2 ≤ c1→a2
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · -- a1 ≤ c1→e1  from  a1·c1 ≤ e1 (commute to c1·a1? fuse_le_iff is a·b ≤ c ↔ a ≤ b→c)
      exact (R.fuse_le_iff a1 c1 e1).mp hfst
    · -- a1 ≤ e2→c2  from  e2 ≤ a1→c2  ⟺  a1·e2 ≤ c2  ⟺  e2·a1 ≤ c2  ⟺  e2 ≤ a1→c2 ✓
      -- want a1 ≤ e2→c2 ⟺ a1·e2 ≤ c2.  From hsnd1: e2 ≤ a1→c2 ⟺ e2·a1 ≤ c2.
      apply (R.fuse_le_iff a1 e2 c2).mp
      have h := (R.fuse_le_iff e2 a1 c2).mpr hsnd1
      rw [R.fuse_comm] at h; exact h
    · -- c1·e2 ≤ a2  from  e2 ≤ c1→a2  ⟺  e2·c1 ≤ a2  ⟺  c1·e2 ≤ a2
      have h := (R.fuse_le_iff e2 c1 a2).mpr hsnd2
      rw [R.fuse_comm] at h; exact h
  · intro ⟨⟨h1, h2⟩, h3⟩
    -- h1 : a1 ≤ c1→e1 ;  h2 : a1 ≤ e2→c2 ;  h3 : c1·e2 ≤ a2
    refine ⟨?_, ?_, ?_⟩
    · -- a1·c1 ≤ e1
      exact (R.fuse_le_iff a1 c1 e1).mpr h1
    · -- e2 ≤ a1→c2  ⟺  e2·a1 ≤ c2  ⟺  a1·e2 ≤ c2  ⟺  a1 ≤ e2→c2 = h2
      apply (R.fuse_le_iff e2 a1 c2).mp
      have h := (R.fuse_le_iff a1 e2 c2).mpr h2
      rw [R.fuse_comm] at h; exact h
    · -- e2 ≤ c1→a2  ⟺  e2·c1 ≤ a2  ⟺  c1·e2 ≤ a2 = h3
      apply (R.fuse_le_iff e2 c1 a2).mp
      rw [R.fuse_comm]; exact h3

/-! ### Fusion is a commutative monoid with unit `⟨1,1⟩`

`twist-product-residuation` part (2): currying `(x·y)→z = x→(y→z)` and integrality
`x→1 = 1` give the unit law; commutativity/associativity of `·` and `⊓` give the
rest. We prove commutativity and the unit law `⟨a⟩ ⊙ ⟨1,1⟩ = ⟨a⟩`. -/

/-- `⊙` is **commutative**. -/
theorem fuse_comm (a b : Carrier R) : fuse a b = fuse b a := by
  unfold fuse
  apply Prod.ext
  · exact R.fuse_comm a.1 b.1
  · exact R.toLattice.meet_comm _ _

/-- The unit law `⟨a,b⟩ ⊙ ⟨1,1⟩ = ⟨a,b⟩`. Uses `fuse_one`, the currying-free
integral facts `a→1 = ⊤` (= top, the lattice unit absorbed) and `1→b = b`. -/
theorem fuse_one (a : Carrier R) : fuse a one = a := by
  unfold fuse one
  apply Prod.ext
  · exact R.fuse_one a.1
  · -- (a.1 → 1) ⊓ (1 → a.2) = a.2
    -- a.1 → 1 = top (since 1 = top, x→top = top), and 1 → a.2 = a.2.
    have hleft : R.imp a.1 R.one = R.top := by
      apply R.le_antisymm
      · exact R.le_top _
      · -- top ≤ a.1 → 1  ⟺  top·a.1 ≤ 1, and everything ≤ 1
        apply (R.fuse_le_iff R.top a.1 R.one).mp
        exact R.le_one _
    have hright : R.imp R.one a.2 = a.2 := by
      apply R.le_antisymm
      · -- 1→a.2 ≤ a.2 : from modus ponens (1→a.2)·1 ≤ a.2 and fuse_one
        have h := R.modus_ponens R.one a.2
        rw [R.fuse_one] at h; exact h
      · -- a.2 ≤ 1→a.2  ⟺  a.2·1 ≤ a.2, true by fuse_one
        apply (R.fuse_le_iff a.2 R.one a.2).mp
        rw [R.fuse_one]; exact R.le_refl _
    rw [hleft, hright, R.toLattice.meet_comm, R.meet_top]

/-! ### Non-integrality: the unit is not the truth-top

The corpus remark: `⟨1,1⟩ ≠ ⟨1,0⟩ = ⊤ₜ` in general, so `⟨L², ⊙, ⇒⟩` is a
**non-integral** commutative residuated lattice. We witness this concretely on
`Two`, where `⟨1,1⟩ = (true,true)` and `⊤ₜ = (true,false)` differ. -/

end TwistProduct

/-! ## `FOUR := TwistProduct Two` and the iso `FOUR ≅ Reading`

Specializing to the Boolean residuated lattice `Two`, the twist-product carrier is
`Bool × Bool`. We name it `FOUR` and identify it with the spine's already-built
bilattice of readings `Reading` (= `Articulating.Corner`) via `⟨a,b⟩ ↦ Reading.ofSlots a b`. -/

/-- **FOUR** — the twist product of the Boolean residuated lattice `Two`. Carrier
`Bool × Bool`; this *is* the smallest non-trivial interlaced bilattice. -/
abbrev FOUR : Type := TwistProduct.Carrier Two

namespace FOUR

/-- The four elements of FOUR, by `(positive, negative)` evidence. -/
def kBot4 : FOUR := (false, false)   -- ⟨0,0⟩ = ⊥ₖ
def tTop4 : FOUR := (true, false)    -- ⟨1,0⟩ = t
def tBot4 : FOUR := (false, true)    -- ⟨0,1⟩ = f
def kTop4 : FOUR := (true, true)     -- ⟨1,1⟩ = ⊤ₖ

/-- The four named elements agree with the general twist bounds over `Two`. -/
theorem kBot4_eq : kBot4 = TwistProduct.kBot (R := Two) := rfl
theorem kTop4_eq : kTop4 = TwistProduct.kTop (R := Two) := rfl
theorem tTop4_eq : tTop4 = TwistProduct.tTop (R := Two) := rfl
theorem tBot4_eq : tBot4 = TwistProduct.tBot (R := Two) := rfl

/-- **The four elements are distinct and exhaust FOUR.** -/
theorem four_elements (x : FOUR) :
    x = kBot4 ∨ x = tTop4 ∨ x = tBot4 ∨ x = kTop4 := by
  obtain ⟨p, n⟩ := x
  cases p <;> cases n <;> simp [kBot4, tTop4, tBot4, kTop4]

/-- The forward map `FOUR → Reading`, `⟨a,b⟩ ↦ ofSlots a b` (positive→pos, negative→neg). -/
def toReading (x : FOUR) : Reading := Reading.ofSlots x.1 x.2
/-- The inverse `Reading → FOUR`, `c ↦ ⟨c.pos, c.neg⟩`. -/
def ofReading (c : Reading) : FOUR := (c.pos, c.neg)

/-- **The bijection `FOUR ≅ Reading`.** Both round-trips are identities (`decide` over
the finite carriers). -/
def readingBij : Bij FOUR Reading where
  to := toReading
  inv := ofReading
  left := fun a => by obtain ⟨p, n⟩ := a; reading
  right := fun c => by reading

/-- The four elements map to the four named readings:
`⟨0,0⟩ ↦ ⊥ₖ`, `⟨1,0⟩ ↦ t`, `⟨0,1⟩ ↦ f`, `⟨1,1⟩ ↦ ⊤ₖ`. -/
theorem toReading_table :
    toReading kBot4 = Reading.kBot ∧ toReading tTop4 = Reading.tTop
      ∧ toReading tBot4 = Reading.tBot ∧ toReading kTop4 = Reading.kTop :=
  ⟨rfl, rfl, rfl, rfl⟩

/-! ### The iso is an order-iso for **both** orders

`FOUR`'s `≤ₖ`/`≤ₜ` (the twist orders over `Two`) match `Reading`'s `KLE`/`TLE`
under the bijection — settled by `decide` over the 16 element pairs. This is the
content of `FOUR ≅ Two^⊲` as **bilattices**, not just sets. -/

/-- `Two`'s lattice order is Boolean implication: `x ≤ y ⟺ (¬x ∨ y)`. The bridge
that reduces the twist orders over `Two` to decidable `Bool` predicates. -/
theorem twoLe_iff (x y : Bool) : ResiduatedLattice.le Two x y ↔ ((!x) || y) = true := by
  show Two.meet x y = x ↔ _
  cases x <;> cases y <;> simp [Two]

/-- **Knowledge order matches.** `a ≤ₖ b` in FOUR `⟺` `KLE (toReading a) (toReading b)`. -/
theorem toReading_kle (a b : FOUR) :
    TwistProduct.leK a b ↔ Reading.KLE (toReading a) (toReading b) := by
  obtain ⟨p1, n1⟩ := a; obtain ⟨p2, n2⟩ := b
  show (ResiduatedLattice.le Two p1 p2 ∧ ResiduatedLattice.le Two n1 n2) ↔ _
  rw [twoLe_iff, twoLe_iff]
  reading

/-- **Truth order matches.** `a ≤ₜ b` in FOUR `⟺` `TLE (toReading a) (toReading b)`. -/
theorem toReading_tle (a b : FOUR) :
    TwistProduct.leT a b ↔ Reading.TLE (toReading a) (toReading b) := by
  obtain ⟨p1, n1⟩ := a; obtain ⟨p2, n2⟩ := b
  show (ResiduatedLattice.le Two p1 p2 ∧ ResiduatedLattice.le Two n2 n1) ↔ _
  rw [twoLe_iff, twoLe_iff]
  reading

/-! ### Negation and the bilattice operations match the spine

`FOUR`'s twist negation/meets/joins (over `Two`) coincide with `Reading.negate`,
`Reading.meetK/joinK/meetT/joinT` under `toReading` — the already-built FOUR bilattice
**is** `TwistProduct Two`, operation by operation. All `decide`. -/

theorem toReading_neg (a : FOUR) :
    toReading (TwistProduct.neg a) = Reading.negate (toReading a) := by
  obtain ⟨p, n⟩ := a; reading

theorem toReading_meetK (a b : FOUR) :
    toReading (TwistProduct.meetK a b) = Reading.meetK (toReading a) (toReading b) := by
  obtain ⟨p1, n1⟩ := a; obtain ⟨p2, n2⟩ := b
  reading

theorem toReading_joinK (a b : FOUR) :
    toReading (TwistProduct.joinK a b) = Reading.joinK (toReading a) (toReading b) := by
  obtain ⟨p1, n1⟩ := a; obtain ⟨p2, n2⟩ := b
  reading

theorem toReading_meetT (a b : FOUR) :
    toReading (TwistProduct.meetT a b) = Reading.meetT (toReading a) (toReading b) := by
  obtain ⟨p1, n1⟩ := a; obtain ⟨p2, n2⟩ := b
  reading

theorem toReading_joinT (a b : FOUR) :
    toReading (TwistProduct.joinT a b) = Reading.joinT (toReading a) (toReading b) := by
  obtain ⟨p1, n1⟩ := a; obtain ⟨p2, n2⟩ := b
  reading

/-- **FOUR is non-integral.** The monoidal unit `⟨1,1⟩` is *not* the truth-top
`⟨1,0⟩` — witnessed on `Two`, the smallest case. This is the corpus remark made
concrete: `Two^⊲` is a non-integral commutative residuated lattice. -/
theorem unit_ne_tTop : (TwistProduct.one : FOUR) ≠ TwistProduct.tTop (R := Two) := by
  intro h
  -- ⟨1,1⟩ = ⟨1,0⟩ in Bool×Bool forces the second coordinate true = false.
  have : (true : Bool) = false := congrArg Prod.snd h
  exact Bool.noConfusion this

/-- **The full FOUR iso.** `toReading`/`ofReading` is a bijection carrying both twist
orders to `Reading`'s `KLE`/`TLE` and the negation to `Reading.negate`: the spine's
FOUR bilattice **is** `TwistProduct Two`, as bilattices. -/
theorem four_is_twist_two :
    (∀ a : FOUR, ofReading (toReading a) = a)
      ∧ (∀ c : Reading, toReading (ofReading c) = c)
      ∧ (∀ a b : FOUR, TwistProduct.leK a b ↔ Reading.KLE (toReading a) (toReading b))
      ∧ (∀ a b : FOUR, TwistProduct.leT a b ↔ Reading.TLE (toReading a) (toReading b))
      ∧ (∀ a : FOUR, toReading (TwistProduct.neg a) = Reading.negate (toReading a)) :=
  ⟨readingBij.left, readingBij.right, toReading_kle, toReading_tle, toReading_neg⟩

end FOUR

end Order
end Obsmetrologia
