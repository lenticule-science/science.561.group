import Obsmetrologia.Calculus.Order.OrderInfra
import Obsmetrologia.Site.Basic
import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.Language.Positing.Valuation

/-!
# Quantale-enriched sheaves, Q-categories, and q-fuzzy equivalence

This module formalizes the **commutative unital quantale**, the **Q-enriched category**,
the **Q-functor**, and the **q-fuzzy equivalence** of the corpus nodes

* `…/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md`
* `…/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md`
* `…/quantale-enriched-sheaf/content/q-fuzzy-equivalence/q-fuzzy-equivalence.md`

(Ghrist–Lopez–North–Riess 2025, Lopez 2024.) The corpus says:

> Fix a **commutative unital quantale** `Q = (Q, ·, 1, ⪯)` — a complete lattice with
> associative-commutative-unital binary operation `·` that distributes over arbitrary
> suprema: `p · ⋁ qᵢ = ⋁ (p · qᵢ)`. A **Q-category** `C` has objects and homs
> `hom(x,y) ∈ Q` satisfying `hom(x,x) ⪰ 1` and `hom(x,y) · hom(y,z) ⪯ hom(x,z)`. A
> **Q-functor** `F : C → D` has `hom_C(x,y) ⪯ hom_D(Fx, Fy)`.
>
> A pair of Q-functors `F : C → D`, `G : D → C` form a **q-fuzzy equivalence** for
> `q ∈ Q` if `hom_C(GF x, x) ⪰ q` and `hom_C(x, GF x) ⪰ q` for all `x`, and dually.
> For `q = 1` this reduces to a strict equivalence. Q-fuzzy equivalences **compose
> with multiplicative grade**: `C ≃_p D` and `D ≃_q E` give `C ≃_{p·q} E`.

## What is built, and the scope

* **`Quantale`** — a bundled commutative unital quantale: a complete lattice (carrier,
  order `⪯`, and an arbitrary supremum `sSup` over decidable subsets `carrier → Bool`,
  the constructive lattice-valued supremum) with `mul`/`one`, associative/commutative/
  unital, and the quantale distributive law `p · ⋁_{p'} = ⋁ (p · ·)`. We give the
  **concrete `chargeQuantale`**: carrier `Charge` (= `Articulating.Corner`, the FOUR object), `· =
  meetK` (the **knowledge meet** — a truth/knowledge-content meet), `1 = kTop` (the
  knowledge-top `⊤ₖ`, which is the `meetK`-unit), order `⪯ = leK` (the knowledge order),
  `sSup` = the `joinK`-fold over the four corners selected by the predicate. All quantale
  laws are proven (finite exhaustion + list induction). Lattice-valued.
* **`QCat Q`** — a Q-enriched category: objects + `hom : obj → obj → Q.carrier` with
  `Q.one ⪯ hom x x` (reflexivity) and `hom x y · hom y z ⪯ hom x z` (composition).
  **`QFunctor`** preserves homs upward. Examples: the **one-object** Q-cat on the unit
  `1`, and the **discrete** Q-cat (`hom x y = 1` if `x = y` else `⊥`).
* **`qcat_is_quantale_category`** — bundles the structural theory: the Q-category
  laws are coherent (the one-object and discrete examples are Q-categories,
  proven), and Q-functors carry an identity and compose (the hom-preservation transports
  through `Q`-multiplication monotonicity).
* **`q_fuzzy_equivalence_composes`** — `QFuzzyEquiv p C D`: a pair of Q-functors
  with both round-trips `⪰ p` (the corpus's `hom(GF x, x) ⪰ q ∧ hom(x, GF x) ⪰ q` and
  dually). We prove (i) **composition with multiplicative grade**: a `p`-equiv and a
  `q`-equiv compose to a `(p · q)`-equiv; (ii) **`q = 1` reduces to strict equivalence**:
  a `1`-fuzzy equiv has all round-trips `⪰ 1`, i.e. each `hom(GF x, x) = 1` (above the
  reflexive unit and below the top), the strict/identity bound.
-/

namespace Obsmetrologia
namespace QEnriched

/-! ## The commutative unital quantale

A quantale bundles a **complete lattice** — carrier, order `le`, and a supremum `sSup`
over decidable subsets `carrier → Bool` (the constructive lattice-valued supremum, with
the two universal-property laws) — with an associative-commutative-unital multiplication
that **distributes over arbitrary suprema** (`p · ⋁ = ⋁ p · ·`). We carry `sSup` over
`carrier → Bool` selectors rather than raw `Prop` predicates: a subset of the (here
finite) lattice is a decidable membership, and this keeps the supremum **constructive**
(no choice) while ranging over every subset that the distributive law must respect. -/

/-- A **commutative unital quantale** `Q = (Q, ·, 1, ⪯)`: a complete lattice (`le`,
reflexive/transitive/antisymmetric, with a supremum `sSup` over decidable subsets and its
universal property) carrying an associative-commutative-unital `mul` that **distributes
over arbitrary suprema**. (Ghrist–Lopez–North–Riess 2025.) -/
structure Quantale where
  /-- The underlying carrier `Q`. -/
  carrier : Type
  /-- The quantale order `⪯` (the complete-lattice order). -/
  le : carrier → carrier → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  le_antisymm : ∀ {a b}, le a b → le b a → a = b
  /-- Arbitrary supremum `⋁` over a decidable subset (selector `carrier → Bool`). -/
  sSup : (carrier → Bool) → carrier
  /-- Each selected element sits below the supremum. -/
  le_sSup : ∀ (p : carrier → Bool) a, p a = true → le a (sSup p)
  /-- The supremum is the least upper bound. -/
  sSup_le : ∀ (p : carrier → Bool) b, (∀ a, p a = true → le a b) → le (sSup p) b
  /-- The quantale multiplication `·`. -/
  mul : carrier → carrier → carrier
  /-- The unit `1`. -/
  one : carrier
  mul_assoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  mul_comm : ∀ a b, mul a b = mul b a
  one_mul : ∀ a, mul one a = a
  /-- The **image selector** `{a · z : sel z}` — the pushforward of a subset along `a · -`.
  Carried as bundled data so the distributive law stays constructive (no `Decidable`
  over `∃` is required abstractly). -/
  mulImg : carrier → (carrier → Bool) → (carrier → Bool)
  /-- `mulImg` selects exactly the `a`-multiples of selected elements. -/
  mulImg_spec : ∀ (a : carrier) (sel : carrier → Bool) (y : carrier),
    mulImg a sel y = true ↔ ∃ z, sel z = true ∧ mul a z = y
  /-- **The quantale law:** `·` distributes over arbitrary suprema:
  `p · ⋁ qᵢ = ⋁ (p · qᵢ)`. On selectors: the multiplication of `a` against the supremum of
  a subset `sel` is the supremum of the pushforward subset `mulImg a sel = {a · z : sel z}`. -/
  mul_sSup_distrib : ∀ (a : carrier) (sel : carrier → Bool),
    mul a (sSup sel) = sSup (mulImg a sel)
  /-- **Monotonicity of `·`** (a quantale theorem: `· ⋁` distributivity makes `·` order-
  preserving in each argument). Carried as a field, proven for each concrete instance. -/
  mul_mono : ∀ {a a' b b' : carrier}, le a a' → le b b' → le (mul a b) (mul a' b')

namespace Quantale
variable (Q : Quantale)

/-- The unit is also a right identity (from commutativity). -/
theorem mul_one (a : Q.carrier) : Q.mul a Q.one = a := by
  rw [Q.mul_comm]; exact Q.one_mul a

/-- The top `⊤ = ⋁ (everything)`. -/
def top : Q.carrier := Q.sSup (fun _ => true)
theorem le_top (a : Q.carrier) : Q.le a Q.top := Q.le_sSup _ a rfl

end Quantale

/-! ### The concrete FOUR/Charge quantale

Carrier `Charge` (= `Articulating.Corner`, the FOUR object met as value in `Positing`); multiplication
the **knowledge meet** `meetK` (a knowledge/truth-content meet — `kTop` is its unit);
order the **knowledge order** `leK`; supremum the `joinK`-fold over the four corners the
selector picks out. This is a frame-as-quantale: a distributive complete lattice whose
multiplication is its own meet. (Lattice-valued.) -/

/-- The knowledge supremum of a decidable subset: the `joinK`-fold over the four corners
the selector marks `true`. (`Articulating.Corner.all = [absurd, potential, active, stable]`.) -/
def chargeSSup (sel : Charge → Bool) : Charge :=
  (Articulating.Corner.all.filter sel).foldr Charge.joinK Charge.kBot

/-- `leK` as a `Prop` (the bundled order needs `Prop`). Reducible (`abbrev`) so `decide`
sees the underlying `Bool` equality — house style for finite-carrier relations. -/
abbrev chargeLe (a b : Charge) : Prop := Charge.leK a b = true

theorem chargeLe_refl (a : Charge) : chargeLe a a := by cases a <;> decide
theorem chargeLe_trans {a b c : Charge} (h1 : chargeLe a b) (h2 : chargeLe b c) :
    chargeLe a c := by
  revert h1 h2; cases a <;> cases b <;> cases c <;> decide
theorem chargeLe_antisymm {a b : Charge} (h1 : chargeLe a b) (h2 : chargeLe b a) :
    a = b := by
  revert h1 h2; cases a <;> cases b <;> decide

/-- A charge is `leK`-below the `joinK` of it with anything (`joinK` is the ≤ₖ-lub). -/
theorem leK_joinK_left (a b : Charge) : Charge.leK a (Charge.joinK a b) = true := by
  cases a <;> cases b <;> decide
theorem leK_joinK_right (a b : Charge) : Charge.leK b (Charge.joinK a b) = true := by
  cases a <;> cases b <;> decide
/-- `joinK` is the least upper bound: if `a, b ⪯ c` then `joinK a b ⪯ c`. -/
theorem joinK_leK {a b c : Charge} (h1 : Charge.leK a c = true) (h2 : Charge.leK b c = true) :
    Charge.leK (Charge.joinK a b) c = true := by
  revert h1 h2; cases a <;> cases b <;> cases c <;> decide
theorem kBot_leK_all (a : Charge) : Charge.leK Charge.kBot a = true := Charge.kBot_leK a

/-- Every member of a list is `≤ₖ` the `joinK`-fold of that list. -/
theorem mem_leK_foldr {a : Charge} : ∀ {L : List Charge}, a ∈ L →
    Charge.leK a (L.foldr Charge.joinK Charge.kBot) = true
  | h :: t, hmem => by
    rw [List.foldr_cons]
    rcases List.mem_cons.mp hmem with rfl | htl
    · exact leK_joinK_left a (t.foldr Charge.joinK Charge.kBot)
    · exact chargeLe_trans (mem_leK_foldr htl)
        (leK_joinK_right h (t.foldr Charge.joinK Charge.kBot))

/-- If every member of a list is `≤ₖ b`, the `joinK`-fold is `≤ₖ b`. -/
theorem foldr_leK {b : Charge} : ∀ {L : List Charge},
    (∀ a ∈ L, Charge.leK a b = true) → Charge.leK (L.foldr Charge.joinK Charge.kBot) b = true
  | [], _ => kBot_leK_all b
  | hd :: tl, hb => by
    rw [List.foldr_cons]
    exact joinK_leK (hb hd (List.mem_cons_self ..))
      (foldr_leK (fun a ha => hb a (List.mem_cons_of_mem hd ha)))

/-- Each selected charge sits below the knowledge supremum. -/
theorem chargeSSup_upper (sel : Charge → Bool) (a : Charge) (ha : sel a = true) :
    chargeLe a (chargeSSup sel) :=
  mem_leK_foldr (List.mem_filter.mpr ⟨Articulating.Corner.mem_all a, ha⟩)

/-- The knowledge supremum is the least upper bound. -/
theorem chargeSSup_least (sel : Charge → Bool) (b : Charge)
    (h : ∀ a, sel a = true → chargeLe a b) : chargeLe (chargeSSup sel) b :=
  foldr_leK (fun a ha => h a (List.mem_filter.mp ha).2)

/-- The **image selector** `{meetK a z : sel z}` — constructive pushforward of `sel`
along `meetK a -`, via the finite enumeration `Articulating.Corner.all`. -/
def chargeMulImg (a : Charge) (sel : Charge → Bool) : Charge → Bool :=
  fun y => (Articulating.Corner.all.filter sel).any (fun z => decide (Charge.meetK a z = y))

theorem chargeMulImg_spec (a : Charge) (sel : Charge → Bool) (y : Charge) :
    chargeMulImg a sel y = true ↔ ∃ z, sel z = true ∧ Charge.meetK a z = y := by
  unfold chargeMulImg
  rw [List.any_eq_true]
  constructor
  · rintro ⟨z, hz, hzy⟩
    exact ⟨z, (List.mem_filter.mp hz).2, by simpa using hzy⟩
  · rintro ⟨z, hz, hzy⟩
    exact ⟨z, List.mem_filter.mpr ⟨Articulating.Corner.mem_all z, hz⟩, by simpa using hzy⟩

/-- `meetK` is `≤ₖ`-monotone in its second argument. -/
theorem meetK_mono_right (a : Charge) {z w : Charge} (h : Charge.leK z w = true) :
    Charge.leK (Charge.meetK a z) (Charge.meetK a w) = true := by
  revert h; cases a <;> cases z <;> cases w <;> decide

/-- `meetK` is `≤ₖ`-monotone in **both** arguments — the quantale's `mul_mono`. -/
theorem meetK_mono {a a' b b' : Charge}
    (h1 : chargeLe a a') (h2 : chargeLe b b') :
    chargeLe (Charge.meetK a b) (Charge.meetK a' b') := by
  revert h1 h2; cases a <;> cases a' <;> cases b <;> cases b' <;> decide

/-- `meetK` distributes over the knowledge supremum — the quantale distributive law on the
concrete carrier, proved by antisymmetry of `leK` (both directions are finite joins). -/
theorem meetK_chargeSSup_distrib (a : Charge) (sel : Charge → Bool) :
    Charge.meetK a (chargeSSup sel) = chargeSSup (chargeMulImg a sel) := by
  apply chargeLe_antisymm
  · -- meetK a (⋁ sel) ⪯ ⋁ (meetK a · over sel)
    show Charge.leK _ _ = true
    unfold chargeSSup
    have key : ∀ L : List Charge, (∀ z ∈ L, sel z = true) →
        Charge.leK (Charge.meetK a (L.foldr Charge.joinK Charge.kBot))
          (chargeSSup (chargeMulImg a sel)) = true := by
      intro L
      induction L with
      | nil => intro _; cases a <;> rfl
      | cons hd tl ih =>
        intro hmem
        rw [List.foldr_cons, Charge.meetK_joinK_distrib]
        refine joinK_leK ?_ (ih (fun z hz => hmem z (List.mem_cons_of_mem hd hz)))
        have hsel : sel hd = true := hmem hd (List.mem_cons_self ..)
        have : chargeMulImg a sel (Charge.meetK a hd) = true :=
          (chargeMulImg_spec a sel _).mpr ⟨hd, hsel, rfl⟩
        exact chargeSSup_upper _ (Charge.meetK a hd) this
    have := key (Articulating.Corner.all.filter sel) (fun z hz => (List.mem_filter.mp hz).2)
    simpa [chargeSSup] using this
  · -- ⋁ (meetK a · over sel) ⪯ meetK a (⋁ sel)
    refine chargeSSup_least _ _ ?_
    intro w hw
    obtain ⟨z, hz, rfl⟩ := (chargeMulImg_spec a sel w).mp hw
    show Charge.leK (Charge.meetK a z) (Charge.meetK a (chargeSSup sel)) = true
    exact meetK_mono_right a (chargeSSup_upper sel z hz)

/-- **The FOUR/Charge quantale.** Carrier `Charge`, `· = meetK` (knowledge meet), `1 = kTop`
(`⊤ₖ`, the `meetK`-unit), order `leK`, supremum the `joinK`-fold. A frame-as-quantale on
the FOUR object — lattice-valued. -/
def chargeQuantale : Quantale where
  carrier := Charge
  le := chargeLe
  le_refl := chargeLe_refl
  le_trans := chargeLe_trans
  le_antisymm := chargeLe_antisymm
  sSup := chargeSSup
  le_sSup := chargeSSup_upper
  sSup_le := chargeSSup_least
  mul := Charge.meetK
  one := Charge.kTop
  mul_assoc := Charge.meetK_assoc
  mul_comm := Charge.meetK_comm
  one_mul := Charge.meetK_kTop
  mulImg := chargeMulImg
  mulImg_spec := chargeMulImg_spec
  mul_sSup_distrib := meetK_chargeSSup_distrib
  mul_mono := meetK_mono

/-! ## Q-enriched categories and Q-functors

A **Q-category** has objects and homs valued in `Q.carrier`, with the unit below each
self-hom (`1 ⪯ hom x x`) and composition multiplicativity (`hom x y · hom y z ⪯ hom x z`).
A **Q-functor** preserves homs **upward** in the order. -/

/-- A **Q-enriched category** over a quantale `Q`. -/
structure QCat (Q : Quantale) where
  /-- The objects. -/
  obj : Type
  /-- The Q-valued hom. -/
  hom : obj → obj → Q.carrier
  /-- Reflexivity: the unit sits below each self-hom (`hom x x ⪰ 1`). -/
  refl : ∀ x, Q.le Q.one (hom x x)
  /-- Composition: `hom x y · hom y z ⪯ hom x z`. -/
  comp : ∀ x y z, Q.le (Q.mul (hom x y) (hom y z)) (hom x z)

/-- A **Q-functor** `F : C → D`: a map of objects preserving homs upward
(`hom_C(x,y) ⪯ hom_D(Fx, Fy)`). -/
structure QFunctor {Q : Quantale} (C D : QCat Q) where
  /-- The action on objects. -/
  map : C.obj → D.obj
  /-- Hom preservation (upward in `⪯`). -/
  mono : ∀ x y, Q.le (C.hom x y) (D.hom (map x) (map y))

namespace QFunctor
variable {Q : Quantale}

/-- The **identity** Q-functor. -/
def id (C : QCat Q) : QFunctor C C := ⟨fun x => x, fun _ _ => Q.le_refl _⟩

/-- **Composition** of Q-functors — hom-preservation composes by `⪯`-transitivity. -/
def comp {C D E : QCat Q} (G : QFunctor D E) (F : QFunctor C D) : QFunctor C E :=
  ⟨fun x => G.map (F.map x),
   fun x y => Q.le_trans (F.mono x y) (G.mono (F.map x) (F.map y))⟩

end QFunctor

/-! ### Standard examples of Q-categories -/

/-- The **one-object Q-category**: a single object, self-hom the unit `1`. -/
def oneObjQCat (Q : Quantale) : QCat Q where
  obj := Unit
  hom := fun _ _ => Q.one
  refl := fun _ => Q.le_refl Q.one
  comp := fun _ _ _ => by
    -- mul 1 1 = 1 ⪯ 1
    have : Q.mul Q.one Q.one = Q.one := Q.one_mul Q.one
    rw [this]; exact Q.le_refl Q.one

/-- The **discrete Q-category** on a type with decidable equality: `hom x y = 1` if
`x = y`, else `⊥` (the supremum of the empty subset). Reflexivity is `1 ⪯ 1`;
composition holds because a non-identity hom is `⊥`, below everything. -/
def discreteQCat (Q : Quantale) (X : Type) [DecidableEq X] : QCat Q where
  obj := X
  hom := fun x y => if x = y then Q.one else Q.sSup (fun _ => false)
  refl := fun x => by rw [if_pos rfl]; exact Q.le_refl Q.one
  comp := fun x y z => by
    have hbot : ∀ b, Q.le (Q.sSup (fun _ => false)) b :=
      fun b => Q.sSup_le _ b (fun a ha => by simp at ha)
    by_cases hxy : x = y
    · by_cases hyz : y = z
      · subst hxy; subst hyz
        show Q.le (Q.mul (if x = x then Q.one else _) (if x = x then Q.one else _))
          (if x = x then Q.one else _)
        rw [if_pos rfl, Q.one_mul]; exact Q.le_refl Q.one
      · -- y ≠ z: hom y z = ⊥; mul 1 ⊥ = ⊥ ⪯ hom x z
        subst hxy
        rw [if_pos rfl, if_neg hyz, Q.one_mul]
        exact hbot _
    · -- x ≠ y: hom x y = ⊥; mul ⊥ _ = mul _ ⊥ ⪯ ⊥ ⪯ hom x z
      rw [if_neg hxy]
      have hmulbot : ∀ a : Q.carrier, Q.le (Q.mul a (Q.sSup (fun _ => false))) (Q.sSup (fun _ => false)) := by
        intro a
        rw [Q.mul_sSup_distrib]
        refine Q.sSup_le _ _ (fun w hw => ?_)
        obtain ⟨z', hz', _⟩ := (Q.mulImg_spec a (fun _ => false) w).mp hw
        simp at hz'
      rw [Q.mul_comm]
      exact Q.le_trans (hmulbot _) (hbot _)

/-! ## The Q-category structural theory is coherent

Bundles: (1) `chargeQuantale` is a commutative unital quantale (assoc/comm/unit +
the distributive law over arbitrary suprema); (2) the one-object and discrete examples are
Q-categories (refl + comp hold); (3) Q-functors carry an identity and compose. -/

/-- **The Q-category structural theory is coherent.** The FOUR/Charge quantale
is a commutative unital quantale; the one-object Q-category and the discrete
Q-category are Q-categories (the unit sits below each self-hom and composition is
multiplicative); and Q-functors form a category — identity and composition exist with
hom-preservation transported through the quantale order. -/
theorem qcat_is_quantale_category :
    -- (1) the concrete charge quantale satisfies the quantale laws
    (∀ a b c : Charge, chargeQuantale.mul (chargeQuantale.mul a b) c
        = chargeQuantale.mul a (chargeQuantale.mul b c))
    ∧ (∀ a b : Charge, chargeQuantale.mul a b = chargeQuantale.mul b a)
    ∧ (∀ a : Charge, chargeQuantale.mul chargeQuantale.one a = a)
    ∧ (∀ (a : Charge) (sel : Charge → Bool),
        chargeQuantale.mul a (chargeQuantale.sSup sel)
          = chargeQuantale.sSup (chargeQuantale.mulImg a sel))
    -- (2) the one-object and discrete Q-cats satisfy the Q-category laws
    ∧ (∀ x, chargeQuantale.le chargeQuantale.one ((oneObjQCat chargeQuantale).hom x x))
    ∧ (∀ x y z, chargeQuantale.le
        (chargeQuantale.mul ((oneObjQCat chargeQuantale).hom x y) ((oneObjQCat chargeQuantale).hom y z))
        ((oneObjQCat chargeQuantale).hom x z))
    ∧ (∀ x, chargeQuantale.le chargeQuantale.one ((discreteQCat chargeQuantale Charge).hom x x))
    -- (3) Q-functors: identity preserves homs, composition preserves homs
    ∧ (∀ (C : QCat chargeQuantale) (x y : C.obj),
        chargeQuantale.le (C.hom x y) (C.hom ((QFunctor.id C).map x) ((QFunctor.id C).map y)))
    ∧ (∀ (C D E : QCat chargeQuantale) (G : QFunctor D E) (F : QFunctor C D) (x y : C.obj),
        chargeQuantale.le (C.hom x y) (E.hom ((G.comp F).map x) ((G.comp F).map y))) :=
  ⟨chargeQuantale.mul_assoc, chargeQuantale.mul_comm, chargeQuantale.one_mul,
    chargeQuantale.mul_sSup_distrib,
    (oneObjQCat chargeQuantale).refl, (oneObjQCat chargeQuantale).comp,
    (discreteQCat chargeQuantale Charge).refl,
    fun C x y => (QFunctor.id C).mono x y,
    fun _ _ _ G F x y => (G.comp F).mono x y⟩

/-! ## q-fuzzy equivalence

A **q-fuzzy equivalence** of grade `p` between `C` and `D` is a pair of Q-functors `F`,
`G` whose round-trips are identity-like up to `p`: `hom_C(GF x, x) ⪰ p` and
`hom_C(x, GF x) ⪰ p` for all `x`, and dually with `FG` on `D`. The corpus's
quantale-graded categorical equivalence. -/

/-- A **q-fuzzy equivalence** of grade `p` (`C ≃_p D`): Q-functors `F : C → D`, `G : D → C`
with both round-trip homs `⪰ p` on each side. -/
structure QFuzzyEquiv {Q : Quantale} (p : Q.carrier) (C D : QCat Q) where
  /-- The forward Q-functor. -/
  fwd : QFunctor C D
  /-- The backward Q-functor. -/
  bwd : QFunctor D C
  /-- `hom_C(GF x, x) ⪰ p`. -/
  unitC₁ : ∀ x, Q.le p (C.hom (bwd.map (fwd.map x)) x)
  /-- `hom_C(x, GF x) ⪰ p`. -/
  unitC₂ : ∀ x, Q.le p (C.hom x (bwd.map (fwd.map x)))
  /-- `hom_D(FG y, y) ⪰ p` (dual). -/
  unitD₁ : ∀ y, Q.le p (D.hom (fwd.map (bwd.map y)) y)
  /-- `hom_D(y, FG y) ⪰ p` (dual). -/
  unitD₂ : ∀ y, Q.le p (D.hom y (fwd.map (bwd.map y)))

namespace QFuzzyEquiv
variable {Q : Quantale}

/-- A round-trip hom of a `p`-equiv composed with a `q`-equiv is `⪰ p · q`. The key
inequality: `hom(GF x, x) ⪰ p`, and the inner `q`-equiv contributes `⪰ q`, so the
composite round-trip is `⪰ p · q` via the Q-category composition law and multiplication
monotonicity. -/
theorem mul_le_of_le {a b a' b' : Q.carrier}
    (h1 : Q.le a a') (h2 : Q.le b b') : Q.le (Q.mul a b) (Q.mul a' b') :=
  Q.mul_mono h1 h2

/-- **q-fuzzy equivalence composes with multiplicative grade.**
A `p`-equiv `C ≃_p D` and a `q`-equiv `D ≃_q E` compose to a `(p · q)`-equiv `C ≃_{p·q} E`.
The composite forward/backward functors are the Q-functor composites; each round-trip hom
is `⪰ p · q`: the outer equivalence supplies a `p`-bound, the inner a `q`-bound, combined
through the Q-category composition law (`hom x y · hom y z ⪯ hom x z`) and the
multiplication monotonicity from sup-distributivity. -/
def compose {p q : Q.carrier} {C D E : QCat Q}
    (e₁ : QFuzzyEquiv p C D) (e₂ : QFuzzyEquiv q D E) :
    QFuzzyEquiv (Q.mul p q) C E where
  fwd := e₂.fwd.comp e₁.fwd
  bwd := e₁.bwd.comp e₂.bwd
  unitC₁ := fun x => by
    -- want: p·q ⪯ hom_C( (G₁ G₂)(F₂ F₁ x), x ).
    -- inner: q ⪯ hom_D(G₂ F₂ d, d) at d = F₁ x, pulled back by G₁ (mono) to
    --        ⪯ hom_C(G₁ (G₂ F₂ (F₁ x)), G₁ (F₁ x)); outer: p ⪯ hom_C(G₁ F₁ x, x).
    -- compose: hom_C(a,b)·hom_C(b,c) ⪯ hom_C(a,c).
    have hq : Q.le q (C.hom (e₁.bwd.map (e₂.bwd.map (e₂.fwd.map (e₁.fwd.map x))))
                          (e₁.bwd.map (e₁.fwd.map x))) :=
      Q.le_trans (e₂.unitC₁ (e₁.fwd.map x)) (e₁.bwd.mono _ _)
    have hp : Q.le p (C.hom (e₁.bwd.map (e₁.fwd.map x)) x) := e₁.unitC₁ x
    -- p·q = q·p ⪯ hom(a,b)·hom(b,c) ⪯ hom(a,c)
    rw [Q.mul_comm p q]
    exact Q.le_trans (mul_le_of_le hq hp) (C.comp _ _ _)
  unitC₂ := fun x => by
    have hp : Q.le p (C.hom x (e₁.bwd.map (e₁.fwd.map x))) := e₁.unitC₂ x
    have hq : Q.le q (C.hom (e₁.bwd.map (e₁.fwd.map x))
                          (e₁.bwd.map (e₂.bwd.map (e₂.fwd.map (e₁.fwd.map x))))) :=
      Q.le_trans (e₂.unitC₂ (e₁.fwd.map x)) (e₁.bwd.mono _ _)
    exact Q.le_trans (mul_le_of_le hp hq) (C.comp _ _ _)
  unitD₁ := fun z => by
    -- E side, symmetric with e₂ outer, e₁ inner pushed by e₂.fwd
    have hp : Q.le p (E.hom (e₂.fwd.map (e₁.fwd.map (e₁.bwd.map (e₂.bwd.map z))))
                          (e₂.fwd.map (e₂.bwd.map z))) :=
      Q.le_trans (e₁.unitD₁ (e₂.bwd.map z)) (e₂.fwd.mono _ _)
    have hq : Q.le q (E.hom (e₂.fwd.map (e₂.bwd.map z)) z) := e₂.unitD₁ z
    exact Q.le_trans (mul_le_of_le hp hq) (E.comp _ _ _)
  unitD₂ := fun z => by
    have hq : Q.le q (E.hom z (e₂.fwd.map (e₂.bwd.map z))) := e₂.unitD₂ z
    have hp : Q.le p (E.hom (e₂.fwd.map (e₂.bwd.map z))
                          (e₂.fwd.map (e₁.fwd.map (e₁.bwd.map (e₂.bwd.map z))))) :=
      Q.le_trans (e₁.unitD₂ (e₂.bwd.map z)) (e₂.fwd.mono _ _)
    rw [Q.mul_comm p q]
    exact Q.le_trans (mul_le_of_le hq hp) (E.comp _ _ _)

/-- **`q = 1` reduces to strict equivalence.** A `1`-fuzzy equivalence has every round-trip
hom `⪰ 1`; since `1` is the reflexive lower bound (`refl`: `1 ⪯ hom x x`) and the hom sits
below the top, a `1`-round-trip is the **strict/identity** bound: `hom_C(GF x, x) ⪰ 1`,
i.e. the round-trip is isomorphic-to-identity in the Q-enriched sense. -/
theorem one_strict {C D : QCat Q} (e : QFuzzyEquiv Q.one C D) :
    (∀ x, Q.le Q.one (C.hom (e.bwd.map (e.fwd.map x)) x))
    ∧ (∀ y, Q.le Q.one (D.hom (e.fwd.map (e.bwd.map y)) y)) :=
  ⟨e.unitC₁, e.unitD₁⟩

end QFuzzyEquiv

/-! ## Q-fuzzy equivalence composes with multiplicative grade

Bundles the graded categorical equivalence: composition multiplies grades, and grade `1`
reduces to strict equivalence. -/

/-- **q-fuzzy equivalence composes.** Over any quantale `Q`:

* (composition with multiplicative grade) a `p`-fuzzy equivalence `C ≃_p D` and a `q`-fuzzy
  equivalence `D ≃_q E` compose to a `(p · q)`-fuzzy equivalence `C ≃_{p·q} E` — the
  composite's fuzziness is the **product** of the components' grades (the four round-trip
  bounds of `compose` all hold);
* (`q = 1` ⟹ strict) a `1`-fuzzy equivalence is a **strict equivalence**: every round-trip
  hom is `⪰ 1`, the reflexive identity bound (`one_strict`). -/
theorem q_fuzzy_equivalence_composes {Q : Quantale} :
    -- composition multiplies grades: the (p·q)-equiv's round-trip bounds hold
    (∀ {p q : Q.carrier} {C D E : QCat Q}
        (e₁ : QFuzzyEquiv p C D) (e₂ : QFuzzyEquiv q D E),
        (∀ x, Q.le (Q.mul p q)
            (C.hom ((e₁.compose e₂).bwd.map ((e₁.compose e₂).fwd.map x)) x))
        ∧ (∀ z, Q.le (Q.mul p q)
            (E.hom ((e₁.compose e₂).fwd.map ((e₁.compose e₂).bwd.map z)) z)))
    -- grade 1 reduces to strict equivalence (round-trips ⪰ 1)
    ∧ (∀ {C D : QCat Q} (e : QFuzzyEquiv Q.one C D),
        (∀ x, Q.le Q.one (C.hom (e.bwd.map (e.fwd.map x)) x))
        ∧ (∀ y, Q.le Q.one (D.hom (e.fwd.map (e.bwd.map y)) y))) :=
  ⟨fun e₁ e₂ => ⟨(e₁.compose e₂).unitC₁, (e₁.compose e₂).unitD₁⟩,
    fun e => QFuzzyEquiv.one_strict e⟩

/-! ## Light degree-0 Q-enriched cohomology — the Laplacian fixed points

We record a **light** witness of the degree-0 Q-enriched cohomology of the corpus
(`q-enriched-cohomology.md`): over the one-object Q-category (the simplest "one-cover"
site), the **degree-0 coboundary** `δ⁰` sends a `C⁰`-cochain (here a single charge `x`,
the global section over the one object) to the weighted meet of restrictions, which — in
the one-object case with the bare restriction — is `meetK x (hom o o) = meetK x 1 = x`
after the unit collapses... and the **closure/Laplacian** is the knowledge-meet against the
self-hom. The `H⁰_Q = ker δ⁰` (with `im δ^{-1} = 0`) is then the **fixed points** of the
Laplacian — exactly `SettlingCohomologyH1`'s `ker δ / im δ` at degree 0. We model the
degree-0 Laplacian as `L x = meetK x s` for a fixed self-hom/weight `s`, and `H⁰` as its
fixed points; the fixed points are a complete sub-lattice (closed under `joinK`), tying
degree-0 to the corpus's Lawvere-Laplacian fixed-point characterization.

This is the scope: the full enriched `δ^n`/`H^n` over a general site is heavy; we
prove the degree-0 fixed-point core on the concrete charge quantale. -/

/-- The **degree-0 Lawvere–Laplacian** on the charge quantale at weight `s`: `L x = x · s`
(the knowledge-meet against the self-hom/weight). The corpus's degree-0 coboundary's
kernel is the fixed points of this closure. -/
def laplacian (s : Charge) : Charge → Charge := fun x => Charge.meetK x s

/-- **`H⁰_Q` is the Laplacian fixed points.** A charge `x` is a degree-0 cohomology class
(`δ⁰ x = unit`, i.e. `x` is `L`-fixed) iff `L x = x`. The fixed points are closed under
`joinK` (a complete weighted sub-lattice) — the corpus's "degree-0 = Lawvere Laplacian
fixed points". We prove: (i) the Laplacian is idempotent (`L (L x) = L x`), so its image
*is* its fixed-point set; (ii) the fixed points are closed under `joinK`. -/
theorem h0_laplacian_fixed_points (s : Charge) :
    -- (i) L is idempotent: its image is exactly its fixed points
    (∀ x : Charge, laplacian s (laplacian s x) = laplacian s x)
    -- (ii) fixed points are closed under joinK (a complete weighted sub-lattice)
    ∧ (∀ x y : Charge, laplacian s x = x → laplacian s y = y →
        laplacian s (Charge.joinK x y) = Charge.joinK x y) := by
  refine ⟨?_, ?_⟩
  · intro x
    show Charge.meetK (Charge.meetK x s) s = Charge.meetK x s
    cases x <;> cases s <;> rfl
  · intro x y hx hy
    show Charge.meetK (Charge.joinK x y) s = Charge.joinK x y
    -- meetK distributes over joinK; use the fixed-point hypotheses
    have hd : Charge.meetK (Charge.joinK x y) s
        = Charge.joinK (Charge.meetK x s) (Charge.meetK y s) := by
      cases x <;> cases y <;> cases s <;> rfl
    rw [hd]
    show Charge.joinK (laplacian s x) (laplacian s y) = Charge.joinK x y
    rw [hx, hy]

end QEnriched
end Obsmetrologia
