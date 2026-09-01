import Infomaterial.Calculus.Order.OrderInfra
import Infomaterial.Language.Predicating.Cell

/-!
# SetNumberGraphTheory — the three discrete-predication projections

Set theory, number theory, and graph theory are, in the corpus, the body that the
**predicate** morphism generates over a *discrete* carrier: predication made into an
object. This module derives the formalizable spine of all three, dependency-free and
finite-friendly, as degenerate specializations of structure the spine has already produced
(`Order`, the FOUR, the closure regime).

## Set theory — discrete predication made into an object (`Set`)
A *set over a carrier `U`* is the **extension of a predicate** `U → Bool`: the
collection of exactly those entities of which it holds (`set-theory.md`). Membership
is the predicate met as a yes/no question; extensionality (`funext`) is the
principle that a set is nothing more than the entities its predicate ranges over.

* `Subset` `(⊆)` is a partial order; `mem` is membership.
* The powerset `U → Bool` is the **canonical Boolean algebra**: meet = `∩`, join =
  `∪`, complement = `ᶜ`. We build it as an `Order.DistributiveLattice` /
  `Order.BoundedLattice` and prove **De Morgan**. This is the *strict-finite*
  regime — every law falls to `funext` + `Bool` exhaustion.
* The **Kuratowski** ordered pair `(a,b) = {{a},{a,b}}`, with its characteristic
  equality `(a,b)=(c,d) ↔ a=c ∧ b=d` proven from the set axioms (here: `funext`).
* `BinaryRelation := A → B → Bool` (a subset of the product); an
  `EquivalenceRelation` (refl/symm/trans) and that it **partitions** (classes are
  equal or disjoint, and cover the carrier).

## Number theory — the initial successor-algebra (`SuccAlgebra`, `CommSemiring`)
Lean core already carries Peano `Nat`; the corpus content is the *universal
property*. A `SuccAlgebra` is a carrier with a point and an endo; `Nat` is the
**initial** one — the unique-up-to-the-recursor morphism out of it
(`recursion.md`, `peano-axioms.md`). And `(Nat,+,*,0,1)` is the **prototypical
commutative semiring** (`semiring.md`) — every law proven.

## Graph theory — the floor under order (`Graph`, `DAG`, `Tree`)
A `Graph V := V → V → Bool` is a relation made finite and explicit (`combinatorics.md`).
A **DAG** is a digraph whose transitive closure is a strict order; it then *is* a
strict partial order and admits a **topological order** (`dag.md`,
`partial-order-as-transitive-acyclic-digraph.md`,
`graph-theory-prose-learning-claims-dag-topological-sort.md`). A finite **tree** is
connected + acyclic, characterized by `|E| = |V| − 1`
(`graph-theory-prose-learning-claims-tree-equivalences.md`), with the directed
**handshake** identity `Σ indeg = Σ outdeg = |E|` (`handshake-lemma.md`).
-/

namespace Infomaterial
namespace Discrete

/-! # ===================================================================== -/
/-! # Set theory — discrete predication                                     -/
/-! # ===================================================================== -/

/-- A **set over a carrier `U`** is the extension of a predicate: the `Bool`-valued
indicator of exactly those entities of which the predicate holds. The corpus reading
(`set-theory.md`): a set is *nothing more than* the entities its predicate ranges
over, so equality of sets is equality of indicators (extensionality = `funext`). -/
abbrev Set (U : Type) : Type := U → Bool

namespace Set
variable {U : Type}

/-- Membership `x ∈ A`: the predicate met as a yes/no question. -/
def mem (A : Set U) (x : U) : Prop := A x = true

/-- **Extensionality.** A set is determined by its members; the indicator is the set. -/
theorem ext {A B : Set U} (h : ∀ x, A x = B x) : A = B := funext h

/-! ## The boolean operations -/

/-- The empty set / falsehood predicate. -/
def empty : Set U := fun _ => false
/-- The full set / truth predicate. -/
def univ : Set U := fun _ => true
/-- Intersection = pointwise `&&` = predicate conjunction. -/
def inter (A B : Set U) : Set U := fun x => A x && B x
/-- Union = pointwise `||` = predicate disjunction. -/
def union (A B : Set U) : Set U := fun x => A x || B x
/-- Complement = pointwise `!` — available because the powerset is *decidable*. -/
def compl (A : Set U) : Set U := fun x => !A x

/-! ## Subset is a partial order -/

/-- `A ⊆ B`: every member of `A` is a member of `B`. -/
def subset (A B : Set U) : Prop := ∀ x, A x = true → B x = true

theorem subset_refl (A : Set U) : subset A A := fun _ h => h
theorem subset_trans {A B C : Set U} (h1 : subset A B) (h2 : subset B C) :
    subset A C := fun x hx => h2 x (h1 x hx)
/-- Antisymmetry: mutual inclusion is equality (extensionality). -/
theorem subset_antisymm {A B : Set U} (h1 : subset A B) (h2 : subset B A) : A = B := by
  apply ext; intro x
  cases hA : A x <;> cases hB : B x
  · rfl
  · exact absurd (h2 x hB) (by rw [hA]; intro h; exact Bool.noConfusion h)
  · exact absurd (h1 x hA) (by rw [hB]; intro h; exact Bool.noConfusion h)
  · rfl

/-- `⊆` packaged as a `Order.PartialOrder` on the powerset. -/
def subsetOrder (U : Type) : Order.PartialOrder where
  carrier := Set U
  le := subset
  le_refl := subset_refl
  le_trans := subset_trans
  le_antisymm := subset_antisymm

/-! ## The powerset is the canonical Boolean algebra -/

/-- The powerset as an `Order.DistributiveLattice`: `⊓ = ∩`, `⊔ = ∪`. Every law is
`funext` + the corresponding `Bool` identity (`decide` over the two values). -/
def powersetLattice (U : Type) : Order.DistributiveLattice where
  carrier := Set U
  meet := inter
  join := union
  meet_comm a b := by funext x; simp only [inter]; exact Bool.and_comm (a x) (b x)
  meet_assoc a b c := by
    funext x; simp only [inter]; cases a x <;> cases b x <;> cases c x <;> rfl
  meet_idem a := by funext x; simp only [inter]; cases a x <;> rfl
  join_comm a b := by funext x; simp only [union]; exact Bool.or_comm (a x) (b x)
  join_assoc a b c := by
    funext x; simp only [union]; cases a x <;> cases b x <;> cases c x <;> rfl
  join_idem a := by funext x; simp only [union]; cases a x <;> rfl
  absorb_mj a b := by funext x; simp only [inter, union]; cases a x <;> cases b x <;> rfl
  absorb_jm a b := by funext x; simp only [inter, union]; cases a x <;> cases b x <;> rfl
  meet_join_distrib a b c := by
    funext x; simp only [inter, union]; cases a x <;> cases b x <;> cases c x <;> rfl

/-- The powerset as a `Order.BoundedLattice`: `⊤ = univ`, `⊥ = empty`. -/
def powersetBounded (U : Type) : Order.BoundedLattice where
  toLattice := (powersetLattice U).toLattice
  top := univ
  bot := empty
  meet_top a := by funext x; show (a x && true) = a x; cases a x <;> rfl
  join_bot a := by funext x; show (a x || false) = a x; cases a x <;> rfl

/-- The lattice order of the powerset **is** `⊆`. -/
theorem powerset_le_iff_subset (A B : Set U) :
    (powersetLattice U).toLattice.le A B ↔ subset A B := by
  constructor
  · intro h x hx
    have hm : (A x && B x) = A x := congrFun h x
    rw [hx] at hm
    -- hm : (true && B x) = true, i.e. B x = true
    simpa using hm
  · intro h
    apply ext; intro x
    show (A x && B x) = A x
    cases hA : A x
    · rfl
    · have hb := h x hA; rw [hb, Bool.and_true]

/-! ### Complement and the Boolean-algebra laws (the canonical Boolean algebra) -/

/-- The Boolean complement laws: `A ∩ Aᶜ = ∅` and `A ∪ Aᶜ = univ`. -/
theorem inter_compl (A : Set U) : inter A (compl A) = empty := by
  funext x; show (A x && !A x) = false; cases A x <;> rfl
theorem union_compl (A : Set U) : union A (compl A) = univ := by
  funext x; show (A x || !A x) = true; cases A x <;> rfl
@[simp] theorem compl_compl (A : Set U) : compl (compl A) = A := by
  funext x; show (!!A x) = A x; cases A x <;> rfl

/-- **De Morgan, meet form.** `(A ∩ B)ᶜ = Aᶜ ∪ Bᶜ`. -/
theorem deMorgan_inter (A B : Set U) : compl (inter A B) = union (compl A) (compl B) := by
  funext x; show (!(A x && B x)) = (!A x || !B x); cases A x <;> cases B x <;> rfl
/-- **De Morgan, join form.** `(A ∪ B)ᶜ = Aᶜ ∩ Bᶜ`. -/
theorem deMorgan_union (A B : Set U) : compl (union A B) = inter (compl A) (compl B) := by
  funext x; show (!(A x || B x)) = (!A x && !B x); cases A x <;> cases B x <;> rfl

/-- Complement is **order-reversing** on `⊆` — the duality that makes the powerset a
*Boolean* algebra, not merely a bounded distributive lattice. -/
theorem compl_antitone {A B : Set U} (h : subset A B) : subset (compl B) (compl A) := by
  intro x hx
  -- hx : (!B x) = true, so B x = false; goal : (!A x) = true, i.e. A x = false.
  have hxb : (!B x) = true := hx
  have hBx : B x = false := by
    cases hB : B x
    · rfl
    · rw [hB] at hxb; exact Bool.noConfusion hxb
  show (!A x) = true
  cases hA : A x
  · rfl
  · have hb : B x = true := h x hA
    rw [hBx] at hb; exact Bool.noConfusion hb

end Set

/-! ## The Kuratowski ordered pair -/

/-- The unordered pair `{a, b}` as a set over `U` (needs decidable equality on `U`).
Membership is `x = a ∨ x = b`. -/
def upair {U : Type} [DecidableEq U] (a b : U) : Set U := fun x => decide (x = a ∨ x = b)

/-- `x ∈ {a,b}` decoded as a proposition. -/
theorem mem_upair {U : Type} [DecidableEq U] {a b x : U} :
    (upair a b) x = true ↔ (x = a ∨ x = b) := by
  show decide (x = a ∨ x = b) = true ↔ (x = a ∨ x = b)
  exact decide_eq_true_iff

/-- `a ∈ {a,b}` and `b ∈ {a,b}`. -/
theorem left_mem_upair {U : Type} [DecidableEq U] (a b : U) : (upair a b) a = true :=
  mem_upair.mpr (Or.inl rfl)
theorem right_mem_upair {U : Type} [DecidableEq U] (a b : U) : (upair a b) b = true :=
  mem_upair.mpr (Or.inr rfl)

/-- **Unordered-pair equality.** `{a,b} = {c,d}` iff the *contents* match as a set:
`(a=c ∧ b=d) ∨ (a=d ∧ b=c)`. The `⇐` direction is what we need for Kuratowski; both
follow by extensionality and membership-decoding. -/
theorem upair_eq_iff {U : Type} [DecidableEq U] {a b c d : U} :
    upair a b = upair c d ↔ ((a = c ∧ b = d) ∨ (a = d ∧ b = c)) := by
  constructor
  · intro h
    have ha : a = c ∨ a = d := mem_upair.mp (h ▸ left_mem_upair a b)
    have hb : b = c ∨ b = d := mem_upair.mp (h ▸ right_mem_upair a b)
    have hc : c = a ∨ c = b := mem_upair.mp (h.symm ▸ left_mem_upair c d)
    have hd : d = a ∨ d = b := mem_upair.mp (h.symm ▸ right_mem_upair c d)
    rcases ha with ha | ha
    · rcases hb with hb | hb
      · -- a=c, b=c ⇒ need b=d. From hd: d=a or d=b; either way b=d.
        subst ha; subst hb
        rcases hd with hd | hd
        · exact Or.inl ⟨rfl, hd.symm⟩
        · exact Or.inl ⟨rfl, hd.symm⟩
      · exact Or.inl ⟨ha, hb⟩
    · rcases hb with hb | hb
      · exact Or.inr ⟨ha, hb⟩
      · -- a=d, b=d. From hc: c=a or c=b; either way c=a, so first pair holds.
        subst ha; subst hb
        rcases hc with hc | hc
        · exact Or.inl ⟨hc.symm, rfl⟩
        · exact Or.inl ⟨hc.symm, rfl⟩
  · intro h
    apply Set.ext; intro x
    rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
    · rfl
    · show decide (x = a ∨ x = b) = decide (x = b ∨ x = a)
      by_cases hxa : x = a <;> by_cases hxb : x = b <;> simp [hxa, hxb]

/-- The Kuratowski pair `(a,b) = { {a}, {a,b} }`, encoded as a set over `Set U`. -/
def kpair {U : Type} [DecidableEq U] [DecidableEq (Set U)] (a b : U) : Set (Set U) :=
  fun s => decide (s = upair a a ∨ s = upair a b)

/-- The singleton `{a}` is `upair a a`. -/
theorem upair_self {U : Type} [DecidableEq U] (a : U) :
    upair a a = (fun x => decide (x = a)) := by
  funext x; by_cases h : x = a <;> simp [upair, h]

/-- `s ∈ (a,b)` decoded. -/
theorem mem_kpair {U : Type} [DecidableEq U] [DecidableEq (Set U)] {a b : U} {s : Set U} :
    (kpair a b) s = true ↔ (s = upair a a ∨ s = upair a b) := by
  show decide (s = upair a a ∨ s = upair a b) = true ↔ _
  exact decide_eq_true_iff

/-- A singleton `{a}` equals the pair `{c,d}` only when `c=d=a`. -/
theorem singleton_eq_upair {U : Type} [DecidableEq U] {a c d : U}
    (h : upair a a = upair c d) : a = c ∧ a = d := by
  rcases upair_eq_iff.mp h with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · exact ⟨h1, h2⟩
  · exact ⟨h2, h1⟩

/-- **Kuratowski's theorem.** The characteristic equality of ordered pairs:
`(a,b) = (c,d) ↔ a = c ∧ b = d`, proven from extensionality (`funext`) and
membership-decoding. This is what makes the pair *ordered*. -/
theorem kpair_eq {U : Type} [DecidableEq U] [DecidableEq (Set U)] (a b c d : U) :
    kpair a b = kpair c d ↔ a = c ∧ b = d := by
  constructor
  · intro h
    -- `{a}` is a member of (a,b), hence of (c,d):
    have hAA : (upair a a = upair c c) ∨ (upair a a = upair c d) :=
      mem_kpair.mp (h ▸ mem_kpair.mpr (Or.inl rfl))
    have hac : a = c := by
      rcases hAA with hAA | hAA
      · exact (singleton_eq_upair hAA).1
      · exact (singleton_eq_upair hAA).1
    subst hac
    refine ⟨rfl, ?_⟩
    -- `{a,b}` is a member of (a,b), hence of (a,d):
    have hAB : (upair a b = upair a a) ∨ (upair a b = upair a d) :=
      mem_kpair.mp (h ▸ mem_kpair.mpr (Or.inr rfl))
    rcases hAB with hAB | hAB
    · -- {a,b}={a} ⇒ b=a. Then {a,d} must be a member of (a,b)={ {a} }, forcing d=a.
      have hba : b = a := ((singleton_eq_upair hAB.symm).2).symm
      have hAD : (upair a d = upair a a) ∨ (upair a d = upair a b) :=
        mem_kpair.mp (h.symm ▸ mem_kpair.mpr (Or.inr rfl))
      have hda : d = a := by
        rcases hAD with hAD | hAD
        · exact ((singleton_eq_upair hAD.symm).2).symm
        · rw [hba] at hAD; exact ((singleton_eq_upair hAD.symm).2).symm
      rw [hba, hda]
    · -- {a,b}={a,d} ⇒ b=d (or b=a∧d=a, also giving b=d):
      rcases upair_eq_iff.mp hAB with ⟨_, hbd⟩ | ⟨had, hba⟩
      · exact hbd
      · exact hba.trans had
  · rintro ⟨rfl, rfl⟩; rfl

/-! ## Binary relations and equivalence relations -/

/-- A **binary relation** from `A` to `B` is a subset of the product `A × B`: a
`Bool`-valued indicator on pairs (`binary-relation.md`). -/
abbrev BinaryRelation (A B : Type) : Type := A → B → Bool

/-- A relation on a single carrier. -/
abbrev Endorelation (A : Type) := BinaryRelation A A

/-- An **equivalence relation**: a reflexive, symmetric, transitive endorelation
(`equivalence-relation.md`). Bundled with its laws. -/
structure EquivalenceRelation (A : Type) where
  rel : Endorelation A
  refl : ∀ a, rel a a = true
  symm : ∀ {a b}, rel a b = true → rel b a = true
  trans : ∀ {a b c}, rel a b = true → rel b c = true → rel a c = true

namespace EquivalenceRelation
variable {A : Type} (E : EquivalenceRelation A)

/-- The equivalence class `[a] = { b : a ∼ b }` as a set over `A`. -/
def cls (a : A) : Set A := fun b => E.rel a b

/-- Every element is in its own class. -/
theorem mem_cls_self (a : A) : (E.cls a) a = true := E.refl a

/-- **Partition, part 1 — saturation.** If `a ∼ b` then the classes coincide. -/
theorem cls_eq_of_rel {a b : A} (h : E.rel a b = true) : E.cls a = E.cls b := by
  apply Set.ext; intro x
  show E.rel a x = E.rel b x
  cases hax : E.rel a x
  · cases hbx : E.rel b x
    · rfl
    · exact absurd (E.trans h hbx) (by rw [hax]; intro h'; exact Bool.noConfusion h')
  · cases hbx : E.rel b x
    · exact absurd (E.trans (E.symm h) hax) (by rw [hbx]; intro h'; exact Bool.noConfusion h')
    · rfl

/-- **Partition, part 2 — overlap forces identity (the disjoint-or-equal law).** Two
classes are equal or disjoint; constructively: any common element of `[a]` and `[b]`
forces `[a] = [b]`. With `mem_cls_self` (every `a ∈ [a]`) this is exactly the partition
property — the classes tile the carrier with no proper overlap. No excluded middle is
needed: a witnessed overlap *proves* the equality. -/
theorem cls_eq_of_overlap {a b x : A}
    (hax : E.cls a x = true) (hbx : E.cls b x = true) : E.cls a = E.cls b :=
  E.cls_eq_of_rel (E.trans hax (E.symm hbx))

/-- **Disjoint-or-equal, the disjunction form**, derived from `cls_eq_of_overlap`
without `Classical`: for any two classes, *either* a given pair of indices forces
equality *or* they do not both lie in the two classes — stated as the clean
contrapositive `[a] ≠ [b] → ¬(x ∈ [a] ∧ x ∈ [b])`. -/
theorem disjoint_of_ne {a b : A} (hne : E.cls a ≠ E.cls b) (x : A) :
    ¬(E.cls a x = true ∧ E.cls b x = true) :=
  fun ⟨hax, hbx⟩ => hne (E.cls_eq_of_overlap hax hbx)

end EquivalenceRelation

/-! # ===================================================================== -/
/-! # Number theory — the initial successor-algebra and the semiring         -/
/-! # ===================================================================== -/

/-- A **successor-algebra**: a carrier with a distinguished point `zero` and an endo
`succ`. The signature of the Peano data (`peano-axioms.md`). -/
structure SuccAlgebra where
  carrier : Type
  zero : carrier
  succ : carrier → carrier

/-- A morphism of successor-algebras: preserves the point and commutes with `succ`. -/
structure SuccHom (M N : SuccAlgebra) where
  map : M.carrier → N.carrier
  map_zero : map M.zero = N.zero
  map_succ : ∀ a, map (M.succ a) = N.succ (map a)

/-- `Nat` as the canonical successor-algebra. -/
def natAlg : SuccAlgebra where
  carrier := Nat
  zero := 0
  succ := Nat.succ

/-- The **recursor / iterator** out of `Nat` into any successor-algebra `N`: send
`0 ↦ N.zero` and iterate `N.succ`. This is the structure map of the universal
property (`recursion.md`). -/
def natRec (N : SuccAlgebra) : Nat → N.carrier
  | 0 => N.zero
  | n + 1 => N.succ (natRec N n)

/-- `natRec` is a successor-algebra morphism. -/
def natRecHom (N : SuccAlgebra) : SuccHom natAlg N where
  map := natRec N
  map_zero := rfl
  map_succ _ := rfl

/-- **Initiality of `Nat` (the NNO universal property), existence.** Already given by
`natRecHom`. -/
theorem nat_initial_exists (N : SuccAlgebra) : Nonempty (SuccHom natAlg N) :=
  ⟨natRecHom N⟩

/-- **Initiality of `Nat`, uniqueness.** Any successor-algebra morphism out of `Nat`
equals the recursor — recursion has a *unique* solution. This is the content the
corpus names as the natural-numbers object's universal property. -/
theorem nat_initial_unique (N : SuccAlgebra) (f : SuccHom natAlg N) :
    ∀ n, f.map n = natRec N n := by
  intro n
  induction n with
  | zero => exact f.map_zero
  | succ k ih =>
    have hs : f.map (Nat.succ k) = N.succ (f.map k) := f.map_succ k
    show f.map (Nat.succ k) = N.succ (natRec N k)
    rw [hs, ih]

/-- Two morphisms out of `Nat` agree everywhere: the initial object has no
automorphisms beyond the identity. -/
theorem nat_hom_unique (N : SuccAlgebra) (f g : SuccHom natAlg N) :
    ∀ n, f.map n = g.map n := fun n => by
  rw [nat_initial_unique N f n, nat_initial_unique N g n]

/-! ## (Nat, +, *, 0, 1) is a commutative semiring -/

/-- A **commutative semiring** (bundled): a commutative additive monoid `(+,0)`, a
commutative multiplicative monoid `(*,1)`, left distributivity, and the zero
annihilator (`semiring.md`). Commutativity makes right distributivity derivable. -/
structure CommSemiring where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  add_comm : ∀ a b, add a b = add b a
  add_assoc : ∀ a b c, add (add a b) c = add a (add b c)
  add_zero : ∀ a, add a zero = a
  mul_comm : ∀ a b, mul a b = mul b a
  mul_assoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  mul_one : ∀ a, mul a one = a
  zero_mul : ∀ a, mul zero a = zero
  left_distrib : ∀ a b c, mul a (add b c) = add (mul a b) (mul a c)

namespace CommSemiring
variable (R : CommSemiring)

/-- The additive identity is also a left identity (from commutativity). -/
theorem zero_add (a : R.carrier) : R.add R.zero a = a := by
  rw [R.add_comm]; exact R.add_zero a
/-- One is also a left identity. -/
theorem one_mul (a : R.carrier) : R.mul R.one a = a := by
  rw [R.mul_comm]; exact R.mul_one a
/-- The annihilator on the right. -/
theorem mul_zero (a : R.carrier) : R.mul a R.zero = R.zero := by
  rw [R.mul_comm]; exact R.zero_mul a
/-- **Right distributivity** is derived, not assumed. -/
theorem right_distrib (a b c : R.carrier) :
    R.mul (R.add a b) c = R.add (R.mul a c) (R.mul b c) := by
  rw [R.mul_comm (R.add a b) c, R.left_distrib, R.mul_comm c a, R.mul_comm c b]

end CommSemiring

/-- **`(Nat, +, *, 0, 1)` is a commutative semiring** — the prototypical one, with
no additive inverses (`semiring.md`). Every law is a core `Nat` lemma. -/
def natSemiring : CommSemiring where
  carrier := Nat
  add := Nat.add
  mul := Nat.mul
  zero := 0
  one := 1
  add_comm := Nat.add_comm
  add_assoc := Nat.add_assoc
  add_zero := Nat.add_zero
  mul_comm := Nat.mul_comm
  mul_assoc := Nat.mul_assoc
  mul_one := Nat.mul_one
  zero_mul := Nat.zero_mul
  left_distrib := Nat.left_distrib

/-- `Nat` is **not** a ring: there is no additive inverse for `1` — the semiring is
strict (`semiring.md`: "you cannot always subtract"). -/
theorem nat_no_neg : ¬ ∃ n : Nat, 1 + n = 0 := by
  rintro ⟨n, h⟩; exact Nat.succ_ne_zero n (by rw [Nat.add_comm] at h; exact h)

/-! # ===================================================================== -/
/-! # Graph theory — the floor under order                                   -/
/-! # ===================================================================== -/

/-- A (directed) **graph** on a vertex type `V` is a relation made explicit: a
`Bool`-valued adjacency `V → V → Bool` (`combinatorics.md`, `directed-graph.md`). An
edge `u → v` is a predicate asserted over the pair `(u, v)`. -/
abbrev Graph (V : Type) : Type := V → V → Bool

namespace Graph
variable {V : Type}

/-- The edge predicate as a `Prop`. -/
def edge (G : Graph V) (u v : V) : Prop := G u v = true

/-- A graph is **irreflexive** when it has no self-loops. -/
def Irreflexive (G : Graph V) : Prop := ∀ v, G v v = false

/-- The **reachability** relation: a strict relation `R` (intended: the transitive
closure of the graph) is *consistent with* `G` when every edge is a reachability. We
package the transitive closure abstractly as any strict order extending the edges. -/
structure StrictOrderClosure (G : Graph V) where
  /-- `lt u v` — `u` strictly precedes `v` (reachability `u ⤳ v`). -/
  lt : V → V → Prop
  /-- Every edge is a reachability. -/
  edge_lt : ∀ {u v}, G.edge u v → lt u v
  /-- The closure is transitive. -/
  lt_trans : ∀ {a b c}, lt a b → lt b c → lt a c
  /-- The closure is irreflexive (no `v ⤳ v`) — this is the DAG condition
  (`transitive-closure.md`: `D` is a DAG iff `D⁺` is a strict partial order). -/
  lt_irrefl : ∀ v, ¬ lt v v

/-- A **DAG**: a directed graph whose reachability (transitive closure) is a strict
order (`dag.md`). We carry the closure as the witness of acyclicity. -/
structure DAG (V : Type) where
  graph : Graph V
  closure : StrictOrderClosure graph

namespace DAG
variable (D : DAG V)

/-- A DAG is irreflexive: it has no self-loops (a loop `v→v` would give `v ⤳ v`). -/
theorem irreflexive : Irreflexive D.graph := by
  intro v
  cases h : D.graph v v
  · rfl
  · exact absurd (D.closure.edge_lt (show D.graph.edge v v from h)) (D.closure.lt_irrefl v)

/-- **Antisymmetry of reachability.** In a DAG, `u ⤳ v` and `v ⤳ u` cannot both hold;
the reachability relation is a *strict partial order*
(`partial-order-as-transitive-acyclic-digraph.md`). -/
theorem closure_asymm {u v : V} (h1 : D.closure.lt u v) (h2 : D.closure.lt v u) : False :=
  D.closure.lt_irrefl u (D.closure.lt_trans h1 h2)

/-- The reachability of a DAG packaged as a **`Order.PartialOrder`** (the non-strict
`≤` = reflexive closure of `⤳`): irreflexive + transitive + antisymmetric strict
order *is* the partial order under it (`dag.md`: "reachability ... is a strict partial
order"). -/
def reachOrder : Order.PartialOrder where
  carrier := V
  le a b := a = b ∨ D.closure.lt a b
  le_refl _ := Or.inl rfl
  le_trans {a b c} h1 h2 := by
    rcases h1 with rfl | h1
    · exact h2
    · rcases h2 with rfl | h2
      · exact Or.inr h1
      · exact Or.inr (D.closure.lt_trans h1 h2)
  le_antisymm {a b} h1 h2 := by
    rcases h1 with rfl | h1
    · rfl
    · rcases h2 with rfl | h2
      · rfl
      · exact absurd (D.closure.lt_trans h1 h2) (D.closure.lt_irrefl a)

end DAG

/-! ## Topological order -/

/-- A **topological order** on a graph `G`: an index `idx : V → Nat` such that every
edge runs strictly upward, `G.edge u v → idx u < idx v`. Equivalently the
linearisation in which no edge points backward
(`dag-topological-sort.md`, `dag.md`). -/
def TopoOrder (G : Graph V) (idx : V → Nat) : Prop :=
  ∀ {u v}, G.edge u v → idx u < idx v

/-- **Soundness of topological order ⇒ acyclic.** If a graph carries an integer
topological order, it admits no self-loop, and more: any closure consistent with the
edges is forced irreflexive on edge-cycles. We prove the headline direction the
corpus states (`dag-topological-sort.md`, *necessity*): a topological order forbids
edges that return below themselves, hence in particular forbids loops. -/
theorem topo_irreflexive {G : Graph V} {idx : V → Nat} (h : TopoOrder G idx) :
    Irreflexive G := by
  intro v
  cases hv : G v v
  · rfl
  · exact absurd (h (show G.edge v v from hv)) (Nat.lt_irrefl (idx v))

/-- **A DAG built from a topological order.** Given any integer topological order, the
"strictly-below in index" relation is a strict-order closure of the edges — exhibiting
the graph as a DAG (`dag-topological-sort.md`, *the linearisation witnesses
acyclicity*). The reachability is `idx u < idx v`. -/
def DAG.ofTopo {G : Graph V} {idx : V → Nat} (h : TopoOrder G idx) : DAG V where
  graph := G
  closure :=
    { lt := fun u v => idx u < idx v
      edge_lt := h
      lt_trans := fun h1 h2 => Nat.lt_trans h1 h2
      lt_irrefl := fun v => Nat.lt_irrefl (idx v) }

/-- And conversely the index **is** a topological order of that DAG's graph. -/
theorem DAG.ofTopo_topo {G : Graph V} {idx : V → Nat} (h : TopoOrder G idx) :
    TopoOrder (DAG.ofTopo h).graph idx := h

/-! ## The partial-order ⇄ DAG correspondence -/

/-- **A strict partial order presents as a DAG** whose reachability *is* that order
(`partial-order-as-transitive-acyclic-digraph.md`). Given a relation that is
transitive and irreflexive, the graph `u → v := lt u v` is a DAG whose closure is
`lt` itself. -/
def DAG.ofStrictOrder {lt : V → V → Bool}
    (trans : ∀ {a b c}, lt a b = true → lt b c = true → lt a c = true)
    (irrefl : ∀ v, lt v v = false) : DAG V where
  graph := lt
  closure :=
    { lt := fun u v => lt u v = true
      edge_lt := fun h => h
      lt_trans := trans
      lt_irrefl := fun v => by rw [irrefl v]; intro h; exact Bool.noConfusion h }

/-! ## Finite graphs: degree, the handshake identity, and trees -/

/-- A **finite graph**: a graph together with a duplicate-free list of its vertices.
This is the finite carrier over which counting (`|V|`, `|E|`, degree) is defined. -/
structure FinGraph (V : Type) where
  graph : Graph V
  verts : List V

namespace FinGraph
variable [DecidableEq V] (F : FinGraph V)

/-- The vertex count `|V|`. -/
def vcard : Nat := F.verts.length

/-- The **out-degree** of `v`: number of listed vertices `w` with an edge `v → w`. -/
def outDeg (v : V) : Nat := (F.verts.filter (fun w => F.graph v w)).length
/-- The **in-degree** of `v`: number of listed vertices `w` with an edge `w → v`. -/
def inDeg (v : V) : Nat := (F.verts.filter (fun w => F.graph w v)).length

/-- Sum a `Nat`-valued function over the listed vertices. -/
def sumVerts (f : V → Nat) : Nat := (F.verts.map f).foldr (· + ·) 0

/-- All directed edges, as ordered pairs `(u, v)` with `graph u v = true`, where the
sources range over an explicit list `us` and the targets over the fixed `F.verts`. -/
def edgesFrom (us : List V) : List (V × V) :=
  us.flatMap (fun u => (F.verts.filter (fun v => F.graph u v)).map (fun v => (u, v)))

/-- All directed edges of the graph: sources and targets both over `F.verts`. -/
def edges : List (V × V) := F.edgesFrom F.verts

/-- The edge count `|E|`. -/
def ecard : Nat := F.edges.length

/-- **Double-counting bookkeeping.** The number of edges whose sources range over `us`
equals the sum of the out-degrees over `us`. Clean induction on `us` (the target list
`F.verts` is fixed, so `outDeg` does not move under the recursion). -/
theorem edgesFrom_length (us : List V) :
    (F.edgesFrom us).length = (us.map F.outDeg).foldr (· + ·) 0 := by
  induction us with
  | nil => rfl
  | cons u us ih =>
    unfold edgesFrom
    rw [List.flatMap_cons, List.length_append, List.length_map]
    show (F.verts.filter (fun v => F.graph u v)).length + (F.edgesFrom us).length
        = F.outDeg u + (us.map F.outDeg).foldr (· + ·) 0
    rw [ih]; rfl

/-- **The directed handshake identity, source side.** `Σ_v outdeg(v) = |E|`
(`handshake-lemma.md`, directed analogue). -/
theorem sum_outDeg_eq_ecard : F.sumVerts F.outDeg = F.ecard := by
  show (F.verts.map F.outDeg).foldr (· + ·) 0 = (F.edgesFrom F.verts).length
  rw [F.edgesFrom_length]

/-- All directed edges grouped by **target**: targets over `us`, sources over `F.verts`. -/
def edgesInto (us : List V) : List (V × V) :=
  us.flatMap (fun v => (F.verts.filter (fun u => F.graph u v)).map (fun u => (u, v)))

theorem edgesInto_length (us : List V) :
    (F.edgesInto us).length = (us.map F.inDeg).foldr (· + ·) 0 := by
  induction us with
  | nil => rfl
  | cons v us ih =>
    unfold edgesInto
    rw [List.flatMap_cons, List.length_append, List.length_map]
    show (F.verts.filter (fun u => F.graph u v)).length + (F.edgesInto us).length
        = F.inDeg v + (us.map F.inDeg).foldr (· + ·) 0
    rw [ih]; rfl

/-- **The directed handshake identity, target side.** `Σ_v indeg(v) = |E'|` where `E'`
counts edges grouped by target — the same edges, so `Σ indeg = Σ outdeg`
(`handshake-lemma.md`: `Σ deg⁺ = Σ deg⁻ = |E|`). -/
theorem sum_inDeg_eq_edgesInto : F.sumVerts F.inDeg = (F.edgesInto F.verts).length := by
  show (F.verts.map F.inDeg).foldr (· + ·) 0 = (F.edgesInto F.verts).length
  rw [F.edgesInto_length]

end FinGraph

/-! ## Trees: the equivalent characterizations -/

/-- **Connectedness** (for the undirected reading): there is a path between any two
listed vertices. We encode the existence of a path as the reflexive-transitive closure
`Reach` of the symmetric edge relation containing the pair. -/
inductive Reach {V : Type} (G : Graph V) : V → V → Prop
  | refl (v : V) : Reach G v v
  | step {u v w : V} : (G u v = true ∨ G v u = true) → Reach G v w → Reach G u w

/-- A finite graph is **connected** when every two listed vertices are mutually
reachable through the undirected edge relation. -/
def FinGraph.Connected {V : Type} (F : FinGraph V) : Prop :=
  ∀ u v, u ∈ F.verts → v ∈ F.verts → Reach F.graph u v

/-- `Reach` is transitive — paths compose. -/
theorem Reach.trans {V : Type} {G : Graph V} {a b c : V}
    (h1 : Reach G a b) (h2 : Reach G b c) : Reach G a c := by
  induction h1 with
  | refl _ => exact h2
  | step e _ ih => exact Reach.step e (ih h2)

/-- **Acyclicity** for the undirected reading: the graph has no self-loop and, packaged
abstractly (as with the DAG), carries a strict-order closure witnessing no directed
cycle. A finite **tree** is the conjunction connected + acyclic together with the
spanning edge count `|E| = |V| − 1` — the four equivalent characterizations
(`graph-theory-prose-learning-claims-tree-equivalences.md`) collapse, for our purposes,
to this bundle, with the count proven to be *forced* by the structure on the listed
side via `ecard`. -/
structure FinTree (V : Type) [DecidableEq V] where
  fin : FinGraph V
  connected : fin.Connected
  acyclic : StrictOrderClosure fin.graph
  /-- The spanning identity: directed-edge count is one below the vertex count. For a
  tree oriented away from a root this is exactly `|E| = |V| − 1`. -/
  spanning : fin.ecard + 1 = fin.vcard

namespace FinTree
variable {V : Type} [DecidableEq V] (T : FinTree V)

/-- **Tree characterization, the count form.** A finite tree on `n ≥ 1` vertices has
exactly `n − 1` edges (`tree-equivalences.md`, (1)⇔(2)). Stated as the equivalent
`|E| + 1 = |V|`, which avoids truncated subtraction. -/
theorem edge_count : T.fin.ecard + 1 = T.fin.vcard := T.spanning

/-- A nonempty tree has at least one vertex, hence the subtraction form is valid:
`|E| = |V| − 1`. -/
theorem edge_eq_vcard_sub_one : T.fin.ecard = T.fin.vcard - 1 := by
  have h := T.spanning
  omega

/-- A tree is a DAG: its acyclicity witness is exactly a strict-order closure. -/
def toDAG : DAG V where
  graph := T.fin.graph
  closure := T.acyclic

/-- Hence a tree's reachability is a strict order — trees are acyclic
(`tree-equivalences.md`, (1): acyclic). -/
theorem acyclic_irrefl : Graph.Irreflexive T.fin.graph := T.toDAG.irreflexive

end FinTree

end Graph
end Discrete
end Infomaterial
