import Obsmetrologia.Calculus.Order.OrderInfra
import Obsmetrologia.Language.Predicating.Cell

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
  equality `(a,b)=(c,d) ↔ a=c ∧ b=d` derived from extensionality alone — the
  construction that makes a *pair* ordered without assuming order.
* `BinaryRelation := A → B → Bool` (a subset of the product); an
  `EquivalenceRelation` (refl/symm/trans) and that it **partitions** (classes are
  equal or disjoint, and cover the carrier).

## Number theory — the initial successor-algebra (`SuccAlgebra`)
Lean core already carries Peano `Nat`; the corpus content is the *universal
property*. A `SuccAlgebra` is a carrier with a point and an endo; `Nat` is the
**initial** one — the unique-up-to-the-recursor morphism out of it
(`recursion.md`, `peano-axioms.md`). And `(Nat,+,*,0,1)` is a **commutative
semiring** (`semiring.md`) — every law proven directly over `Nat`.

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

namespace Obsmetrologia
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

/-- **Decidable extensions agree when their predicates imply each other.** The
`propext`-free substitute for rewriting under `decide`: `decide_eq_true_iff` and `simp`'s
propositional rewriting both incur `propext`, whereas the two one-directional core lemmas
`decide_eq_true` / `decide_eq_false` incur nothing. Taking the equivalence apart into its
two implications keeps the whole Kuratowski development on `Quot.sound` alone (which
`funext`, and hence set extensionality, unavoidably costs). -/
theorem decide_eq_decide_of_imp {p q : Prop} [Decidable p] [Decidable q]
    (hpq : p → q) (hqp : q → p) : decide p = decide q := by
  by_cases h : p
  · rw [decide_eq_true h, decide_eq_true (hpq h)]
  · rw [decide_eq_false h, decide_eq_false (fun hq => h (hqp hq))]

/-- The unordered pair `{a, b}` as a set over `U` (needs decidable equality on `U`).
Membership is `x = a ∨ x = b`. -/
def upair {U : Type} [DecidableEq U] (a b : U) : Set U := fun x => decide (x = a ∨ x = b)

/-- `x ∈ {a,b}` decoded as a proposition. -/
theorem mem_upair {U : Type} [DecidableEq U] {a b x : U} :
    (upair a b) x = true ↔ (x = a ∨ x = b) := by
  show decide (x = a ∨ x = b) = true ↔ (x = a ∨ x = b)
  exact Iff.intro of_decide_eq_true decide_eq_true

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
      exact decide_eq_decide_of_imp Or.symm Or.symm

/-- The Kuratowski pair `(a,b) = { {a}, {a,b} }`, encoded as a set over `Set U`. -/
def kpair {U : Type} [DecidableEq U] [DecidableEq (Set U)] (a b : U) : Set (Set U) :=
  fun s => decide (s = upair a a ∨ s = upair a b)

/-- The singleton `{a}` is `upair a a`. -/
theorem upair_self {U : Type} [DecidableEq U] (a : U) :
    upair a a = (fun x => decide (x = a)) := by
  funext x
  show decide (x = a ∨ x = a) = decide (x = a)
  exact decide_eq_decide_of_imp (fun h => h.elim id id) Or.inl

/-- `s ∈ (a,b)` decoded. -/
theorem mem_kpair {U : Type} [DecidableEq U] [DecidableEq (Set U)] {a b : U} {s : Set U} :
    (kpair a b) s = true ↔ (s = upair a a ∨ s = upair a b) := by
  show decide (s = upair a a ∨ s = upair a b) = true ↔ _
  exact Iff.intro of_decide_eq_true decide_eq_true

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

/-- `Nat` is **not** a ring: there is no additive inverse for `1` — `(Nat,+,*,0,1)` is
a strict semiring (`semiring.md`: "you cannot always subtract"). -/
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
variable { α β : Type }

private theorem appendNil (xs : List α) : xs ++ [] = xs := by
  induction xs with
  | nil => rfl
  | cons a as ih => exact congrArg (List.cons a) ih

private theorem appendAssoc (xs ys zs : List α) :
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  induction xs with
  | nil => rfl
  | cons a as ih => exact congrArg (List.cons a) ih

private theorem consAppend (a : α) (xs ys : List α) :
    (a :: xs) ++ ys = a :: (xs ++ ys) := rfl

private theorem nilAppend (xs : List α) : [] ++ xs = xs := rfl

private theorem singletonAppend (a : α) (xs : List α) :
    [a] ++ xs = a :: xs := rfl

private theorem lengthAppend (xs ys : List α) :
    (xs ++ ys).length = xs.length + ys.length := by
  induction xs with
  | nil => exact (Nat.zero_add ys.length).symm
  | cons _ as ih =>
      exact Eq.trans (congrArg Nat.succ ih)
        (Nat.succ_add as.length ys.length).symm

private theorem memAppendForward {x : α} {xs ys : List α} :
    x ∈ xs ++ ys → x ∈ xs ∨ x ∈ ys := by
  intro h
  induction xs with
  | nil => exact Or.inr h
  | cons a _ ih =>
      cases h with
      | head => exact Or.inl (List.Mem.head _)
      | tail _ ht =>
          cases ih ht with
          | inl hl => exact Or.inl (List.Mem.tail a hl)
          | inr hr => exact Or.inr hr

private theorem memAppendBackward {x : α} {xs ys : List α} :
    x ∈ xs ∨ x ∈ ys → x ∈ xs ++ ys := by
  intro h
  cases h with
  | inl hl =>
      induction xs with
      | nil => cases hl
      | cons a _ ih =>
          cases hl with
          | head => exact List.Mem.head _
          | tail _ ht => exact List.Mem.tail a (ih ht)
  | inr hr =>
      induction xs with
      | nil => exact hr
      | cons a _ ih => exact List.Mem.tail a ih

private theorem memConsForward {x a : α} {as : List α} :
    x ∈ a :: as → x = a ∨ x ∈ as := by
  intro h
  cases h with
  | head => exact Or.inl rfl
  | tail _ htail => exact Or.inr htail

private theorem memSingletonEq {x a : α} (h : x ∈ [a]) : x = a := by
  cases memConsForward h with
  | inl heq => exact heq
  | inr hnone => nomatch hnone

private theorem pairwiseAppend {R : α → α → Prop} {xs ys : List α}
    (hxs : xs.Pairwise R) (hys : ys.Pairwise R)
    (cross : ∀ x, x ∈ xs → ∀ y, y ∈ ys → R x y) :
    (xs ++ ys).Pairwise R := by
  induction xs with
  | nil => exact hys
  | cons a _ ih =>
      cases hxs with
      | cons ha ht =>
          apply List.Pairwise.cons
          · intro y hy
            cases memAppendForward hy with
            | inl hleft => exact ha y hleft
            | inr hright => exact cross a (List.Mem.head _) y hright
          · exact ih ht (fun x hx y hy =>
              cross x (List.Mem.tail a hx) y hy)

private theorem pairwiseAppendForward {R : α → α → Prop} {xs ys : List α} :
    (xs ++ ys).Pairwise R →
      xs.Pairwise R ∧ ys.Pairwise R ∧
        ∀ x, x ∈ xs → ∀ y, y ∈ ys → R x y := by
  intro h
  induction xs with
  | nil =>
      exact ⟨List.Pairwise.nil, h, fun _ hx => nomatch hx⟩
  | cons a rest ih =>
      cases h with
      | cons ha ht =>
          obtain ⟨hrest, hys, hcross⟩ := ih ht
          refine ⟨List.Pairwise.cons ?_ hrest, hys, ?_⟩
          · intro y hy
            exact ha y (memAppendBackward (Or.inl hy))
          · intro x hx y hy
            cases hx with
            | head => exact ha y (memAppendBackward (Or.inr hy))
            | tail _ htail => exact hcross x htail y hy

private def blocksDisjoint (left right : List α) : Prop :=
  ∀ x, x ∈ left → x ∉ right

private theorem blocksDisjointSymm {left right : List α}
    (h : blocksDisjoint left right) : blocksDisjoint right left := by
  intro x hxRight hxLeft
  exact h x hxLeft hxRight

private theorem blocksDisjointAppendLeft {left right other : List α}
    (hleft : blocksDisjoint other left)
    (hright : blocksDisjoint other right) :
    blocksDisjoint other (left ++ right) := by
  intro x hx hmerged
  cases memAppendForward hmerged with
  | inl h => exact hleft x hx h
  | inr h => exact hright x hx h

private theorem blocksDisjointAppendRight {left right other : List α}
    (hleft : blocksDisjoint left other)
    (hright : blocksDisjoint right other) :
    blocksDisjoint (left ++ right) other := by
  intro x hx hother
  cases memAppendForward hx with
  | inl h => exact hleft x h hother
  | inr h => exact hright x h hother

private theorem nodupAppend {xs ys : List α}
    (hxs : xs.Nodup) (hys : ys.Nodup)
    (cross : ∀ x, x ∈ xs → x ∉ ys) : (xs ++ ys).Nodup :=
  pairwiseAppend hxs hys (fun x hx _ hy hxy => cross x hx (hxy ▸ hy))

private theorem prefixRefl (xs : List α) : xs <+: xs :=
  ⟨[], appendNil xs⟩

private theorem anyAppend (xs ys : List α) (p : α → Bool) :
    (xs ++ ys).any p = (xs.any p || ys.any p) := by
  induction xs with
  | nil => rfl
  | cons a as ih =>
      change (p a || (as ++ ys).any p) =
        ((p a || as.any p) || ys.any p)
      exact Eq.trans (congrArg (Bool.or (p a)) ih)
        (Bool.or_assoc _ _ _).symm

private theorem anyMemForward (p : α → Bool) :
    (xs : List α) → xs.any p = true →
      ∃ x, x ∈ xs ∧ p x = true
  | [], h => nomatch h
  | a :: rest, h => by
      cases hp : p a with
      | true => exact ⟨a, List.Mem.head rest, hp⟩
      | false =>
          have hrest : rest.any p = true := Eq.trans
            (congrArg (fun b => b || rest.any p) hp).symm h
          obtain ⟨x, hx, hpx⟩ := anyMemForward p rest hrest
          exact ⟨x, List.Mem.tail a hx, hpx⟩

private theorem anyMemBackward (p : α → Bool) :
    (xs : List α) → (∃ x, x ∈ xs ∧ p x = true) → xs.any p = true
  | [], h => by obtain ⟨_, hx, _⟩ := h; nomatch hx
  | a :: rest, h => by
      obtain ⟨x, hx, hpx⟩ := h
      cases hx with
      | head =>
          exact Eq.trans (congrArg (fun b => b || rest.any p) hpx) rfl
      | tail _ htail =>
          have hrest := anyMemBackward p rest ⟨x, htail, hpx⟩
          cases hp : p a with
          | true =>
              exact Eq.trans (congrArg (fun b => b || rest.any p) hp) rfl
          | false =>
              exact Eq.trans (congrArg (fun b => b || rest.any p) hp)
                hrest

private theorem reverseAuxEq (xs acc : List α) :
    xs.reverseAux acc = xs.reverse ++ acc := by
  induction xs generalizing acc with
  | nil => rfl
  | cons a as ih =>
      change as.reverseAux (a :: acc) = as.reverseAux [a] ++ acc
      exact Eq.trans (ih (a :: acc))
        (Eq.trans (appendAssoc as.reverse [a] acc).symm
          (congrArg (fun front => front ++ acc) (ih [a]).symm))

private theorem reverseCons (a : α) (xs : List α) :
    (a :: xs).reverse = xs.reverse ++ [a] := reverseAuxEq xs [a]

private def cleanMap (f : α → β) : List α → List β
  | [] => []
  | a :: as => f a :: cleanMap f as

private theorem cleanMapLength (f : α → β) :
    (xs : List α) → (cleanMap f xs).length = xs.length
  | [] => rfl
  | _ :: as => congrArg Nat.succ (cleanMapLength f as)

private theorem cleanMapMemForward (f : α → β) {y : β} :
    (xs : List α) → y ∈ cleanMap f xs → ∃ x, x ∈ xs ∧ f x = y
  | [], h => nomatch h
  | a :: as, h => by
      cases h with
      | head => exact ⟨a, List.Mem.head _, rfl⟩
      | tail _ ht =>
          obtain ⟨x, hx, heq⟩ := cleanMapMemForward f as ht
          exact ⟨x, List.Mem.tail a hx, heq⟩

private theorem cleanMapMemBackward (f : α → β) {y : β} :
    (xs : List α) → (∃ x, x ∈ xs ∧ f x = y) → y ∈ cleanMap f xs
  | [], h => by obtain ⟨_, hx, _⟩ := h; nomatch hx
  | a :: as, h => by
      change y ∈ f a :: cleanMap f as
      obtain ⟨x, hx, heq⟩ := h
      cases hx with
      | head => exact heq ▸ List.Mem.head _
      | tail _ ht =>
          exact List.Mem.tail (f a)
            (cleanMapMemBackward f as ⟨x, ht, heq⟩)

private def cleanFilter (p : α → Bool) : List α → List α
  | [] => []
  | a :: as => match p a with
      | true => a :: cleanFilter p as
      | false => cleanFilter p as

private theorem cleanFilterConsFalse (p : α → Bool)
    (a : α) (as : List α) (h : p a = false) :
    cleanFilter p (a :: as) = cleanFilter p as := by
  exact congrArg (fun b => match b with
    | true => a :: cleanFilter p as
    | false => cleanFilter p as) h

private theorem cleanFilterConsTrue (p : α → Bool)
    (a : α) (as : List α) (h : p a = true) :
    cleanFilter p (a :: as) = a :: cleanFilter p as := by
  exact congrArg (fun b => match b with
    | true => a :: cleanFilter p as
    | false => cleanFilter p as) h

private theorem cleanFilterEqFilter (p : α → Bool) :
    (xs : List α) → cleanFilter p xs = xs.filter p
  | [] => rfl
  | a :: as => by
      cases hp : p a with
      | false =>
          exact Eq.trans (cleanFilterConsFalse p a as hp)
            (Eq.trans (cleanFilterEqFilter p as)
              (List.filter_cons_of_neg (by
                intro htrue
                exact Bool.noConfusion (Eq.trans hp.symm htrue))).symm)
      | true =>
          exact Eq.trans (cleanFilterConsTrue p a as hp)
            (Eq.trans (congrArg (List.cons a) (cleanFilterEqFilter p as))
              (List.filter_cons_of_pos hp).symm)

private theorem cleanFilterMemForward (p : α → Bool) {x : α} :
    (xs : List α) → x ∈ cleanFilter p xs → x ∈ xs ∧ p x = true
  | [], h => nomatch h
  | a :: as, h => by
      cases hp : p a with
      | false =>
          have ht : x ∈ cleanFilter p as := Eq.mp
            (congrArg (fun xs => x ∈ xs) (cleanFilterConsFalse p a as hp)) h
          obtain ⟨hx, hpx⟩ := cleanFilterMemForward p as ht
          exact ⟨List.Mem.tail a hx, hpx⟩
      | true =>
          have hc : x ∈ a :: cleanFilter p as := Eq.mp
            (congrArg (fun xs => x ∈ xs) (cleanFilterConsTrue p a as hp)) h
          cases hc with
          | head => exact ⟨List.Mem.head _, hp⟩
          | tail _ ht =>
              obtain ⟨hx, hpx⟩ := cleanFilterMemForward p as ht
              exact ⟨List.Mem.tail a hx, hpx⟩

private theorem cleanFilterMemBackward (p : α → Bool) {x : α} :
    (xs : List α) → x ∈ xs → p x = true → x ∈ cleanFilter p xs
  | [], h, _ => nomatch h
  | a :: as, h, hpx => by
      cases hp : p a with
      | false =>
          cases h with
          | head =>
              exact False.elim (Bool.noConfusion (Eq.trans hp.symm hpx))
          | tail _ ht =>
              apply Eq.mpr (congrArg (fun xs => x ∈ xs)
                (cleanFilterConsFalse p a as hp))
              exact cleanFilterMemBackward p as ht hpx
      | true =>
          apply Eq.mpr (congrArg (fun xs => x ∈ xs)
            (cleanFilterConsTrue p a as hp))
          cases h with
          | head => exact List.Mem.head _
          | tail _ ht =>
              exact List.Mem.tail a (cleanFilterMemBackward p as ht hpx)

private def cleanFlatMap (f : α → List β) : List α → List β
  | [] => []
  | a :: as => f a ++ cleanFlatMap f as

private theorem cleanFlatMapMemForward (f : α → List β) {y : β} :
    (xs : List α) → y ∈ cleanFlatMap f xs →
      ∃ x, x ∈ xs ∧ y ∈ f x
  | [], h => nomatch h
  | a :: as, h => by
      cases memAppendForward h with
      | inl ha => exact ⟨a, List.Mem.head _, ha⟩
      | inr ht =>
          obtain ⟨x, hx, hy⟩ := cleanFlatMapMemForward f as ht
          exact ⟨x, List.Mem.tail a hx, hy⟩

private theorem cleanFlatMapMemBackward (f : α → List β) {y : β} :
    (xs : List α) → (∃ x, x ∈ xs ∧ y ∈ f x) →
      y ∈ cleanFlatMap f xs
  | [], h => by obtain ⟨_, hx, _⟩ := h; nomatch hx
  | a :: as, h => by
      obtain ⟨x, hx, hy⟩ := h
      cases hx with
      | head => exact memAppendBackward (Or.inl hy)
      | tail _ ht => exact memAppendBackward (Or.inr
          (cleanFlatMapMemBackward f as ⟨x, ht, hy⟩))

private theorem memTailOfNe {x a : α} {as : List α}
    (hmem : x ∈ a :: as) (hne : x ≠ a) : x ∈ as := by
  cases hmem with
  | head => exact False.elim (hne rfl)
  | tail _ h => exact h

private def cleanAttach : (xs : List α) → List {x // x ∈ xs}
  | [] => []
  | a :: as =>
      ⟨a, List.Mem.head as⟩ :: cleanMap
        (fun x => ⟨x.val, List.Mem.tail a x.property⟩) (cleanAttach as)

private theorem cleanAttachLength : (xs : List α) →
    (cleanAttach xs).length = xs.length
  | [] => rfl
  | _ :: as => congrArg Nat.succ
      (Eq.trans (cleanMapLength _ (cleanAttach as))
        (cleanAttachLength as))

private theorem cleanAttachMem [DecidableEq α] :
    (xs : List α) → (x : {x // x ∈ xs}) → x ∈ cleanAttach xs
  | [], x => False.elim (nomatch x.property)
  | a :: as, x => by
      by_cases heq : x.val = a
      · have hx : x = ⟨a, List.Mem.head as⟩ := Subtype.ext heq
        exact hx ▸ List.Mem.head _
      · have htail : x.val ∈ as := memTailOfNe x.property heq
        let tx : {x // x ∈ as} := ⟨x.val, htail⟩
        apply List.Mem.tail
        apply cleanMapMemBackward
        exact ⟨tx, cleanAttachMem as tx, Subtype.ext rfl⟩

private theorem cleanMapNodup (f : α → β) (hinjective : Function.Injective f) :
    (xs : List α) → xs.Nodup → (cleanMap f xs).Nodup
  | [], _ => List.Pairwise.nil
  | a :: as, h => by
      cases h with
      | cons hnot ht =>
          apply List.Pairwise.cons
          · intro y hy heq
            obtain ⟨x, hx, hfx⟩ := cleanMapMemForward f as hy
            have hax : a = x := hinjective (Eq.trans heq hfx.symm)
            cases hax
            exact (hnot a hx) rfl
          · exact cleanMapNodup f hinjective as ht

private theorem cleanAttachNodup :
    (xs : List α) → xs.Nodup → (cleanAttach xs).Nodup
  | [], _ => List.Pairwise.nil
  | a :: as, h => by
      cases h with
      | cons hnot ht =>
          apply List.Pairwise.cons
          · intro y hy heq
            obtain ⟨tailValue, htailValue, hmap⟩ := cleanMapMemForward
              (fun x : {x // x ∈ as} =>
                (⟨x.val, List.Mem.tail a x.property⟩ :
                  {x // x ∈ a :: as})) (cleanAttach as) hy
            have hvalue : a = tailValue.val := congrArg Subtype.val
              (Eq.trans heq hmap.symm)
            cases hvalue
            exact (hnot tailValue.val tailValue.property) rfl
          · apply cleanMapNodup
            · intro left right heq
              apply Subtype.ext
              exact congrArg
                (fun z : {x // x ∈ a :: as} => z.val) heq
            · exact cleanAttachNodup as ht

private theorem cleanSingletonMapNodup [DecidableEq α] :
    (xs : List α) → xs.Nodup → (cleanMap (fun x => [x]) xs).Nodup
  | [], _ => List.Pairwise.nil
  | a :: as, h => by
      cases h with
      | cons hnot ht =>
          apply List.Pairwise.cons
          · intro block hblock heq
            obtain ⟨x, hx, hsingle⟩ :=
              cleanMapMemForward (fun y : α => [y]) as hblock
            have hax : a = x := (List.cons.inj
              (Eq.trans heq hsingle.symm)).1
            cases hax
            exact (hnot a hx) rfl
          · exact cleanSingletonMapNodup as ht

private theorem cleanSingletonMapPairwiseDisjoint [DecidableEq α] :
    (xs : List α) → xs.Nodup →
      (cleanMap (fun x => [x]) xs).Pairwise
        (fun left right => ∀ x, x ∈ left → x ∉ right)
  | [], _ => List.Pairwise.nil
  | a :: as, h => by
      cases h with
      | cons hnot ht =>
          apply List.Pairwise.cons
          · intro block hblock x hx hxb
            obtain ⟨y, hy, heq⟩ :=
              cleanMapMemForward (fun z : α => [z]) as hblock
            cases hx with
            | head =>
                cases heq
                cases hxb with
                | head => exact (hnot a hy) rfl
                | tail _ htail => nomatch htail
            | tail _ htail => nomatch htail
          · exact cleanSingletonMapPairwiseDisjoint as ht

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
  cleanFlatMap (fun u => cleanMap (fun v => (u, v))
    (cleanFilter (fun v => F.graph u v) F.verts)) us

/-- All directed edges of the graph: sources and targets both over `F.verts`. -/
def edges : List (V × V) := F.edgesFrom F.verts

/-- The edge count `|E|`. -/
def ecard : Nat := F.edges.length

/-! ## Exact finite presentations and executable component folds -/

/-- A finite graph presentation enumerates every ambient vertex exactly once. -/
structure ExactPresentation where
  verts_nodup : F.verts.Nodup
  verts_complete : ∀ v : V, v ∈ F.verts

/-- A proof-carrying partition of the enumerated vertices. -/
structure ComponentPartition where
  blocks : List (List V)
  blocks_nodup : blocks.Nodup
  block_nodup : ∀ block, block ∈ blocks → block.Nodup
  blocks_nonempty :
    ∀ block, block ∈ blocks → ∃ head tail, block = head :: tail
  blocks_pairwise_disjoint :
    blocks.Pairwise (fun left right => ∀ v, v ∈ left → v ∉ right)
  coverage :
    ∀ v, v ∈ F.verts ↔ ∃ block, block ∈ blocks ∧ v ∈ block

namespace ComponentPartition

/-- Every certified block has a total, proof-carrying head. -/
def blockHead (P : F.ComponentPartition)
    (block : {block // block ∈ P.blocks}) : V :=
  match block.val, P.blocks_nonempty block.val block.property with
  | head :: _, _ => head

/-- One representative, in block order, for every component block. -/
def representatives (P : F.ComponentPartition) : List V :=
  cleanMap (blockHead (F := F) P) (cleanAttach P.blocks)

@[simp] theorem representatives_length (P : F.ComponentPartition) :
    P.representatives.length = P.blocks.length := by
  exact Eq.trans (cleanMapLength _ (cleanAttach P.blocks))
    (cleanAttachLength P.blocks)

theorem blockHead_mem (P : F.ComponentPartition)
    (block : {block // block ∈ P.blocks}) :
    blockHead (F := F) P block ∈ block.val := by
  rcases block with ⟨block, hblock⟩
  obtain ⟨head, tail, hshape⟩ := P.blocks_nonempty block hblock
  subst block
  exact List.Mem.head tail

end ComponentPartition

/-- The singleton partition used before any edge is processed. -/
def singletonBlocks : List (List V) := cleanMap (fun v => [v]) F.verts

/-- Executable component-fold state and its successful-merge count. -/
structure ComponentFoldState (F : FinGraph V) where
  blocks : List (List V)
  successfulMerges : Nat

def initialComponentFoldState : F.ComponentFoldState where
  blocks := F.singletonBlocks
  successfulMerges := 0

/-- Find the first block containing a vertex. -/
private def cleanContains (x : V) : List V → Bool
  | [] => false
  | a :: as =>
      match decide (x = a) with
      | true => true
      | false => cleanContains x as

private theorem cleanContains_sound {x : V} :
    (xs : List V) → cleanContains x xs = true → x ∈ xs
  | [], h => nomatch h
  | a :: as, h => by
      cases hdec : decide (x = a) with
      | true =>
          have heq : x = a := of_decide_eq_true hdec
          exact heq ▸ List.Mem.head as
      | false =>
          have halg : cleanContains x (a :: as) = cleanContains x as :=
            congrArg (fun b => match b with
              | true => true
              | false => cleanContains x as) hdec
          exact List.Mem.tail a (cleanContains_sound as (Eq.trans halg.symm h))

private theorem cleanContains_complete {x : V} :
    (xs : List V) → x ∈ xs → cleanContains x xs = true
  | [], h => nomatch h
  | a :: as, h => by
      cases hdec : decide (x = a) with
      | true =>
          exact congrArg (fun b => match b with
            | true => true
            | false => cleanContains x as) hdec
      | false =>
          have hne : x ≠ a := of_decide_eq_false hdec
          have ht : x ∈ as := memTailOfNe h hne
          have hrec := cleanContains_complete as ht
          exact Eq.trans (congrArg (fun b => match b with
            | true => true
            | false => cleanContains x as) hdec) hrec

private theorem cleanContains_of_not_mem {x : V} :
    (xs : List V) → x ∉ xs → cleanContains x xs = false
  | [], _ => rfl
  | a :: as, hnot => by
      cases hdec : decide (x = a) with
      | true =>
          have heq : x = a := of_decide_eq_true hdec
          exact False.elim (hnot (heq ▸ List.Mem.head as))
      | false =>
          have htail : x ∉ as := fun h => hnot (List.Mem.tail a h)
          exact Eq.trans (congrArg (fun b => match b with
            | true => true
            | false => cleanContains x as) hdec)
            (cleanContains_of_not_mem as htail)

private theorem cleanContains_false_sound {x : V} {xs : List V}
    (h : cleanContains x xs = false) : x ∉ xs := by
  intro hmem
  exact Bool.noConfusion
    (Eq.trans h.symm (cleanContains_complete xs hmem))

def findContainingBlock? (blocks : List (List V)) (v : V) : Option (List V) :=
  match blocks with
  | [] => none
  | block :: rest =>
      match cleanContains v block with
      | true => some block
      | false => findContainingBlock? rest v

theorem containingBlock_unique
    (blocks : List (List V))
    (hpairwise :
      blocks.Pairwise (fun left right => ∀ x, x ∈ left → x ∉ right))
    {left right : List V} {v : V}
    (hleft : left ∈ blocks) (hvleft : v ∈ left)
    (hright : right ∈ blocks) (hvright : v ∈ right) :
    left = right := by
  induction blocks generalizing left right with
  | nil => nomatch hleft
  | cons head tail ih =>
      cases hpairwise with
      | cons hhead htail =>
          cases hleft with
          | head =>
              cases hright with
              | head => rfl
              | tail _ hright =>
                  exact False.elim (hhead right hright v hvleft hvright)
          | tail _ hleft =>
              cases hright with
              | head =>
                  exact False.elim (hhead left hleft v hvright hvleft)
              | tail _ hright =>
                  exact ih htail hleft hvleft hright hvright

private theorem findContainingBlock?_sound
    {blocks : List (List V)} {v : V} {block : List V}
    (h : findContainingBlock? blocks v = some block) :
    block ∈ blocks ∧ v ∈ block := by
  induction blocks with
  | nil => nomatch h
  | cons first rest ih =>
      cases hcontains : cleanContains v first with
      | true =>
          have halg : findContainingBlock? (first :: rest) v = some first :=
            congrArg (fun b => match b with
              | true => some first
              | false => findContainingBlock? rest v) hcontains
          have heq : first = block := Option.some.inj (Eq.trans halg.symm h)
          cases heq
          exact ⟨List.Mem.head rest, cleanContains_sound block hcontains⟩
      | false =>
          have halg : findContainingBlock? (first :: rest) v =
              findContainingBlock? rest v :=
            congrArg (fun b => match b with
              | true => some first
              | false => findContainingBlock? rest v) hcontains
          obtain ⟨hblock, hv⟩ := ih (Eq.trans halg.symm h)
          exact ⟨List.Mem.tail first hblock, hv⟩

private theorem findContainingBlock?_complete
    {blocks : List (List V)}
    (hpairwise :
      blocks.Pairwise (fun left right => ∀ x, x ∈ left → x ∉ right))
    {v : V} {block : List V}
    (hblock : block ∈ blocks) (hv : v ∈ block) :
    findContainingBlock? blocks v = some block := by
  induction blocks generalizing block with
  | nil => nomatch hblock
  | cons first rest ih =>
      cases hpairwise with
      | cons hfirst hrest =>
          cases hcontains : cleanContains v first with
          | true =>
              have hvfirst : v ∈ first := cleanContains_sound first hcontains
              have heq : first = block := containingBlock_unique
                (first :: rest) (List.Pairwise.cons hfirst hrest)
                (List.Mem.head rest) hvfirst hblock hv
              cases heq
              exact congrArg (fun b => match b with
                | true => some first
                | false => findContainingBlock? rest v) hcontains
          | false =>
              have hblockRest : block ∈ rest := by
                cases hblock with
                | head =>
                    exact False.elim (Bool.noConfusion (Eq.trans
                      hcontains.symm (cleanContains_complete first hv)))
                | tail _ ht => exact ht
              have hrec := ih hrest hblockRest hv
              exact Eq.trans (congrArg (fun b => match b with
                | true => some first
                | false => findContainingBlock? rest v) hcontains) hrec

theorem findContainingBlock?_eq_some_iff
    (blocks : List (List V))
    (hpairwise :
      blocks.Pairwise (fun left right => ∀ x, x ∈ left → x ∉ right))
    (v : V) (block : List V) :
    findContainingBlock? blocks v = some block ↔
      block ∈ blocks ∧ v ∈ block := by
  constructor
  · exact findContainingBlock?_sound
  · intro h
    exact findContainingBlock?_complete hpairwise h.1 h.2

/-- One merge step returns the new ordered blocks and whether a merge occurred. -/
structure MergeStepResult where
  blocks : List (List V)
  merged : Bool

inductive MergeScanState (V : Type) where
  | seeking (beforeRev : List (List V))
  | carryingU (beforeRev : List (List V)) (earlier : List V)
      (betweenRev : List (List V))
  | carryingV (beforeRev : List (List V)) (earlier : List V)
      (betweenRev : List (List V))

private def noMergeResult (original : List (List V)) :
    MergeStepResult (V := V) :=
  { blocks := original, merged := false }

def mergeBlocksScan (original : List (List V)) (edge : V × V) :
    MergeScanState V → List (List V) → MergeStepResult (V := V)
  | _, [] => noMergeResult original
  | .seeking beforeRev, block :: rest =>
      match cleanContains edge.1 block with
      | true => match cleanContains edge.2 block with
        | true =>
          noMergeResult original
        | false =>
          mergeBlocksScan original edge (.carryingU beforeRev block []) rest
      | false => match cleanContains edge.2 block with
        | true =>
        mergeBlocksScan original edge (.carryingV beforeRev block []) rest
        | false =>
        mergeBlocksScan original edge (.seeking (block :: beforeRev)) rest
  | .carryingU beforeRev earlier betweenRev, block :: rest =>
      match cleanContains edge.2 block with
      | true =>
        { blocks := beforeRev.reverse ++
            (earlier ++ block) :: betweenRev.reverse ++ rest
          merged := true }
      | false =>
        mergeBlocksScan original edge
          (.carryingU beforeRev earlier (block :: betweenRev)) rest
  | .carryingV beforeRev earlier betweenRev, block :: rest =>
      match cleanContains edge.1 block with
      | true =>
        { blocks := beforeRev.reverse ++
            (earlier ++ block) :: betweenRev.reverse ++ rest
          merged := true }
      | false =>
        mergeBlocksScan original edge
          (.carryingV beforeRev earlier (block :: betweenRev)) rest

@[simp] theorem mergeBlocksScan_nil
    (original : List (List V)) (edge : V × V)
    (state : MergeScanState V) :
    mergeBlocksScan original edge state [] = noMergeResult original := by
  cases state <;> rfl

theorem mergeBlocksScan_seeking_same
    (original beforeRev : List (List V)) (u v : V)
    (block : List V) (rest : List (List V))
    (hu : u ∈ block) (hv : v ∈ block) :
    mergeBlocksScan original (u, v) (.seeking beforeRev) (block :: rest) =
      noMergeResult original := by
  rw [mergeBlocksScan, cleanContains_complete block hu,
    cleanContains_complete block hv]

theorem mergeBlocksScan_seeking_u
    (original beforeRev : List (List V)) (u v : V)
    (block : List V) (rest : List (List V))
    (hu : u ∈ block) (hv : v ∉ block) :
    mergeBlocksScan original (u, v) (.seeking beforeRev) (block :: rest) =
      mergeBlocksScan original (u, v) (.carryingU beforeRev block []) rest := by
  rw [mergeBlocksScan, cleanContains_complete block hu,
    cleanContains_of_not_mem block hv]

theorem mergeBlocksScan_seeking_v
    (original beforeRev : List (List V)) (u v : V)
    (block : List V) (rest : List (List V))
    (hu : u ∉ block) (hv : v ∈ block) :
    mergeBlocksScan original (u, v) (.seeking beforeRev) (block :: rest) =
      mergeBlocksScan original (u, v) (.carryingV beforeRev block []) rest := by
  rw [mergeBlocksScan, cleanContains_of_not_mem block hu,
    cleanContains_complete block hv]

theorem mergeBlocksScan_seeking_skip
    (original beforeRev : List (List V)) (u v : V)
    (block : List V) (rest : List (List V))
    (hu : u ∉ block) (hv : v ∉ block) :
    mergeBlocksScan original (u, v) (.seeking beforeRev) (block :: rest) =
      mergeBlocksScan original (u, v) (.seeking (block :: beforeRev)) rest := by
  rw [mergeBlocksScan, cleanContains_of_not_mem block hu,
    cleanContains_of_not_mem block hv]

theorem mergeBlocksScan_carryingU_found
    (original beforeRev betweenRev : List (List V)) (u v : V)
    (earlier block : List V) (rest : List (List V)) (hv : v ∈ block) :
    mergeBlocksScan original (u, v)
        (.carryingU beforeRev earlier betweenRev) (block :: rest) =
      { blocks := beforeRev.reverse ++
          (earlier ++ block) :: betweenRev.reverse ++ rest
        merged := true } := by
  rw [mergeBlocksScan, cleanContains_complete block hv]

theorem mergeBlocksScan_carryingU_skip
    (original beforeRev betweenRev : List (List V)) (u v : V)
    (earlier block : List V) (rest : List (List V)) (hv : v ∉ block) :
    mergeBlocksScan original (u, v)
        (.carryingU beforeRev earlier betweenRev) (block :: rest) =
      mergeBlocksScan original (u, v)
        (.carryingU beforeRev earlier (block :: betweenRev)) rest := by
  rw [mergeBlocksScan, cleanContains_of_not_mem block hv]

theorem mergeBlocksScan_carryingV_found
    (original beforeRev betweenRev : List (List V)) (u v : V)
    (earlier block : List V) (rest : List (List V)) (hu : u ∈ block) :
    mergeBlocksScan original (u, v)
        (.carryingV beforeRev earlier betweenRev) (block :: rest) =
      { blocks := beforeRev.reverse ++
          (earlier ++ block) :: betweenRev.reverse ++ rest
        merged := true } := by
  rw [mergeBlocksScan, cleanContains_complete block hu]

theorem mergeBlocksScan_carryingV_skip
    (original beforeRev betweenRev : List (List V)) (u v : V)
    (earlier block : List V) (rest : List (List V)) (hu : u ∉ block) :
    mergeBlocksScan original (u, v)
        (.carryingV beforeRev earlier betweenRev) (block :: rest) =
      mergeBlocksScan original (u, v)
        (.carryingV beforeRev earlier (block :: betweenRev)) rest := by
  rw [mergeBlocksScan, cleanContains_of_not_mem block hu]

private def cleanListEq [DecidableEq α] : List α → List α → Bool
  | [] => fun ys => match ys with
      | [] => true
      | _ :: _ => false
  | a :: as => fun ys => match ys with
      | [] => false
      | b :: bs =>
          match decide (a = b) with
          | true => cleanListEq as bs
          | false => false

private theorem cleanListEq_sound [DecidableEq α] :
    (xs ys : List α) → cleanListEq xs ys = true → xs = ys
  | [], [], _ => rfl
  | [], _ :: _, h => nomatch h
  | _ :: _, [], h => nomatch h
  | a :: as, b :: bs, h => by
      cases hdec : decide (a = b) with
      | false =>
          have halg : cleanListEq (a :: as) (b :: bs) = false :=
            congrArg (fun value => match value with
              | true => cleanListEq as bs
              | false => false) hdec
          exact False.elim (Bool.noConfusion (Eq.trans halg.symm h))
      | true =>
          have hab : a = b := of_decide_eq_true hdec
          have halg : cleanListEq (a :: as) (b :: bs) = cleanListEq as bs :=
            congrArg (fun value => match value with
              | true => cleanListEq as bs
              | false => false) hdec
          have htail : as = bs := cleanListEq_sound as bs (Eq.trans halg.symm h)
          cases hab
          cases htail
          rfl

private theorem cleanListEq_refl [DecidableEq α] :
    (xs : List α) → cleanListEq xs xs = true
  | [] => rfl
  | a :: as => by
      cases hdec : decide (a = a) with
      | false =>
          exact False.elim ((of_decide_eq_false hdec) rfl)
      | true =>
          exact Eq.trans (congrArg (fun value => match value with
            | true => cleanListEq as as
            | false => false) hdec) (cleanListEq_refl as)

private theorem cleanListEq_of_ne [DecidableEq α]
    {xs ys : List α} (hne : xs ≠ ys) : cleanListEq xs ys = false := by
  cases h : cleanListEq xs ys with
  | false => rfl
  | true => exact False.elim (hne (cleanListEq_sound xs ys h))

def mergeBlocksForEdge (blocks : List (List V)) (edge : V × V) :
    MergeStepResult (V := V) :=
  match findContainingBlock? blocks edge.1 with
  | none => noMergeResult blocks
  | some left =>
      match findContainingBlock? blocks edge.2 with
      | none => noMergeResult blocks
      | some right =>
          match cleanListEq left right with
          | true => noMergeResult blocks
          | false => mergeBlocksScan blocks edge (.seeking []) blocks

/-- Exact ordered result of joining two distinct endpoint blocks. -/
def StableMerge (blocks result : List (List V)) (u v : V) : Prop :=
  ∃ before earlier between later after,
    blocks = before ++ earlier :: between ++ later :: after ∧
    ((u ∈ earlier ∧ v ∈ later) ∨ (v ∈ earlier ∧ u ∈ later)) ∧
    result = before ++ (earlier ++ later) :: between ++ after

private theorem mergedBlocksMemForward
    (before : List (List V)) (earlier : List V)
    (between : List (List V)) (later : List V) (after : List (List V))
    {block : List V}
    (h : block ∈ before ++ (earlier ++ later) :: between ++ after) :
    block = earlier ++ later ∨
      block ∈ before ++ earlier :: between ++ later :: after := by
  cases memAppendForward h with
  | inr hafter =>
      exact Or.inr (memAppendBackward (Or.inr (List.Mem.tail later hafter)))
  | inl hfront =>
      cases memAppendForward hfront with
      | inl hbefore =>
          exact Or.inr
            (memAppendBackward (Or.inl (memAppendBackward (Or.inl hbefore))))
      | inr hmergedOrBetween =>
          cases hmergedOrBetween with
          | head => exact Or.inl rfl
          | tail _ hbetween =>
              exact Or.inr (memAppendBackward (Or.inl
                (memAppendBackward (Or.inr
                  (List.Mem.tail earlier hbetween)))))

private theorem originalBlocksMemForward
    (before : List (List V)) (earlier : List V)
    (between : List (List V)) (later : List V) (after : List (List V))
    {block : List V}
    (h : block ∈ before ++ earlier :: between ++ later :: after) :
    block = earlier ∨ block = later ∨
      block ∈ before ++ (earlier ++ later) :: between ++ after := by
  cases memAppendForward h with
  | inr hlaterOrAfter =>
      cases hlaterOrAfter with
      | head => exact Or.inr (Or.inl rfl)
      | tail _ hafter =>
          exact Or.inr (Or.inr (memAppendBackward (Or.inr hafter)))
  | inl hfront =>
      cases memAppendForward hfront with
      | inl hbefore =>
          exact Or.inr (Or.inr
            (memAppendBackward (Or.inl (memAppendBackward (Or.inl hbefore)))))
      | inr hearlierOrBetween =>
          cases hearlierOrBetween with
          | head => exact Or.inl rfl
          | tail _ hbetween =>
              exact Or.inr (Or.inr (memAppendBackward (Or.inl
                (memAppendBackward (Or.inr
                  (List.Mem.tail (earlier ++ later) hbetween))))))

private theorem mergePairwiseDisjoint
    (before : List (List V)) (earlier : List V)
    (between : List (List V)) (later : List V) (after : List (List V))
    (h : (before ++ earlier :: between ++ later :: after).Pairwise
      blocksDisjoint) :
    (before ++ (earlier ++ later) :: between ++ after).Pairwise
      blocksDisjoint := by
  have hold : before ++ earlier :: between ++ later :: after =
      before ++ (earlier :: (between ++ (later :: after))) :=
    appendAssoc before (earlier :: between) (later :: after)
  have hcanonical :
      (before ++ (earlier :: (between ++ (later :: after)))).Pairwise
        blocksDisjoint :=
    Eq.mp (congrArg (fun xs => xs.Pairwise blocksDisjoint) hold) h
  obtain ⟨hbefore, htail, hcrossBefore⟩ :=
    pairwiseAppendForward (xs := before)
      (ys := earlier :: (between ++ (later :: after))) hcanonical
  cases htail with
  | cons hEarlier hbetweenLaterAfter =>
      obtain ⟨hbetween, hlaterAfter, hcrossBetween⟩ :=
        pairwiseAppendForward (xs := between) (ys := later :: after)
          hbetweenLaterAfter
      cases hlaterAfter with
      | cons hLater hafter =>
          have hbetweenAfter : (between ++ after).Pairwise blocksDisjoint :=
            pairwiseAppend hbetween hafter (fun x hx y hy =>
              hcrossBetween x hx y (List.Mem.tail later hy))
          have hmerged : ∀ block, block ∈ between ++ after →
              blocksDisjoint (earlier ++ later) block := by
            intro block hblock
            cases memAppendForward hblock with
            | inl hbetweenBlock =>
                exact blocksDisjointAppendRight
                  (hEarlier block (memAppendBackward (Or.inl hbetweenBlock)))
                  (blocksDisjointSymm
                    (hcrossBetween block hbetweenBlock later
                      (List.Mem.head after)))
            | inr hafterBlock =>
                exact blocksDisjointAppendRight
                  (hEarlier block (memAppendBackward
                    (Or.inr (List.Mem.tail later hafterBlock))))
                  (hLater block hafterBlock)
          have hnewTail :
              ((earlier ++ later) :: (between ++ after)).Pairwise
                blocksDisjoint :=
            List.Pairwise.cons hmerged hbetweenAfter
          have hcrossNew : ∀ block, block ∈ before →
              ∀ other, other ∈ (earlier ++ later) :: (between ++ after) →
                blocksDisjoint block other := by
            intro block hblock other hother
            cases hother with
            | head =>
                exact blocksDisjointAppendLeft
                  (hcrossBefore block hblock earlier (List.Mem.head _))
                  (hcrossBefore block hblock later (List.Mem.tail earlier
                    (memAppendBackward (Or.inr (List.Mem.head after)))))
            | tail _ hrest =>
                cases memAppendForward hrest with
                | inl hbetweenBlock =>
                    exact hcrossBefore block hblock other
                      (List.Mem.tail earlier
                        (memAppendBackward (Or.inl hbetweenBlock)))
                | inr hafterBlock =>
                    exact hcrossBefore block hblock other
                      (List.Mem.tail earlier (memAppendBackward
                        (Or.inr (List.Mem.tail later hafterBlock))))
          have hnewCanonical :=
            pairwiseAppend hbefore hnewTail hcrossNew
          have hnewEq : before ++ (earlier ++ later) :: between ++ after =
              before ++ ((earlier ++ later) :: (between ++ after)) :=
            appendAssoc before ((earlier ++ later) :: between) after
          exact Eq.mpr
            (congrArg (fun xs => xs.Pairwise blocksDisjoint) hnewEq)
            hnewCanonical

private theorem earlierLaterDisjoint
    (before : List (List V)) (earlier : List V)
    (between : List (List V)) (later : List V) (after : List (List V))
    (h : (before ++ earlier :: between ++ later :: after).Pairwise
      blocksDisjoint) : blocksDisjoint earlier later := by
  have hold : before ++ earlier :: between ++ later :: after =
      before ++ (earlier :: (between ++ (later :: after))) :=
    appendAssoc before (earlier :: between) (later :: after)
  have hcanonical :
      (before ++ (earlier :: (between ++ (later :: after)))).Pairwise
        blocksDisjoint :=
    Eq.mp (congrArg (fun xs => xs.Pairwise blocksDisjoint) hold) h
  obtain ⟨_, htail, _⟩ := pairwiseAppendForward (xs := before)
    (ys := earlier :: (between ++ (later :: after))) hcanonical
  cases htail with
  | cons hEarlier _ =>
      exact hEarlier later
        (memAppendBackward (Or.inr (List.Mem.head after)))

private theorem mergeBlocksScan_carryingU_find
    (original beforeRev betweenRev : List (List V))
    (earlier : List V) (remaining : List (List V)) (later : List V) (u v : V)
    (hfind : findContainingBlock? remaining v = some later) :
    ∃ between after,
      remaining = between ++ later :: after ∧
      mergeBlocksScan original (u, v)
          (.carryingU beforeRev earlier betweenRev) remaining =
        { blocks := beforeRev.reverse ++
            (earlier ++ later) :: betweenRev.reverse ++ between ++ after
          merged := true } := by
  induction remaining generalizing betweenRev with
  | nil => nomatch hfind
  | cons block rest ih =>
      cases hcontains : cleanContains v block with
      | true =>
        have hv : v ∈ block := cleanContains_sound block hcontains
        have hhead : findContainingBlock? (block :: rest) v = some block := by
          exact congrArg (fun b => match b with
            | true => some block
            | false => findContainingBlock? rest v)
            hcontains
        have hbl : block = later := Option.some.inj (hhead.symm.trans hfind)
        subst later
        refine ⟨[], rest, rfl, ?_⟩
        rw [mergeBlocksScan_carryingU_found _ _ _ _ _ _ _ _ hv]
        rw [appendNil]
      | false =>
        have hv : v ∉ block := cleanContains_false_sound hcontains
        have hrest : findContainingBlock? rest v = some later := by
          have hskip : findContainingBlock? (block :: rest) v =
              findContainingBlock? rest v :=
            congrArg (fun b => match b with
              | true => some block
              | false => findContainingBlock? rest v)
              hcontains
          exact Eq.trans hskip.symm hfind
        obtain ⟨between, after, hremaining, hscan⟩ :=
          ih (betweenRev := block :: betweenRev) hrest
        refine ⟨block :: between, after,
          congrArg (List.cons block) hremaining, ?_⟩
        rw [mergeBlocksScan_carryingU_skip _ _ _ _ _ _ _ _ hv, hscan]
        rw [reverseCons]
        congr 1
        exact congrArg (fun front => front ++ after)
          (Eq.trans
            (appendAssoc beforeRev.reverse
              ((earlier ++ later) :: (betweenRev.reverse ++ [block])) between)
            (Eq.trans
              (congrArg
                (fun tail => beforeRev.reverse ++ (earlier ++ later) :: tail)
                (appendAssoc betweenRev.reverse [block] between))
              (appendAssoc beforeRev.reverse
                ((earlier ++ later) :: betweenRev.reverse)
                (block :: between)).symm))

private theorem mergeBlocksScan_carryingV_find
    (original beforeRev betweenRev : List (List V))
    (earlier : List V) (remaining : List (List V)) (later : List V) (u v : V)
    (hfind : findContainingBlock? remaining u = some later) :
    ∃ between after,
      remaining = between ++ later :: after ∧
      mergeBlocksScan original (u, v)
          (.carryingV beforeRev earlier betweenRev) remaining =
        { blocks := beforeRev.reverse ++
            (earlier ++ later) :: betweenRev.reverse ++ between ++ after
          merged := true } := by
  induction remaining generalizing betweenRev with
  | nil => nomatch hfind
  | cons block rest ih =>
      cases hcontains : cleanContains u block with
      | true =>
        have hu : u ∈ block := cleanContains_sound block hcontains
        have hhead : findContainingBlock? (block :: rest) u = some block := by
          exact congrArg (fun b => match b with
            | true => some block
            | false => findContainingBlock? rest u)
            hcontains
        have hbl : block = later := Option.some.inj (hhead.symm.trans hfind)
        subst later
        refine ⟨[], rest, rfl, ?_⟩
        rw [mergeBlocksScan_carryingV_found _ _ _ _ _ _ _ _ hu]
        rw [appendNil]
      | false =>
        have hu : u ∉ block := cleanContains_false_sound hcontains
        have hrest : findContainingBlock? rest u = some later := by
          have hskip : findContainingBlock? (block :: rest) u =
              findContainingBlock? rest u :=
            congrArg (fun b => match b with
              | true => some block
              | false => findContainingBlock? rest u)
              hcontains
          exact Eq.trans hskip.symm hfind
        obtain ⟨between, after, hremaining, hscan⟩ :=
          ih (betweenRev := block :: betweenRev) hrest
        refine ⟨block :: between, after,
          congrArg (List.cons block) hremaining, ?_⟩
        rw [mergeBlocksScan_carryingV_skip _ _ _ _ _ _ _ _ hu, hscan]
        rw [reverseCons]
        congr 1
        exact congrArg (fun front => front ++ after)
          (Eq.trans
            (appendAssoc beforeRev.reverse
              ((earlier ++ later) :: (betweenRev.reverse ++ [block])) between)
            (Eq.trans
              (congrArg
                (fun tail => beforeRev.reverse ++ (earlier ++ later) :: tail)
                (appendAssoc betweenRev.reverse [block] between))
              (appendAssoc beforeRev.reverse
                ((earlier ++ later) :: betweenRev.reverse)
                (block :: between)).symm))

private theorem mergeBlocksScan_seeking_find_distinct
    (original beforeRev remaining : List (List V))
    (u v : V) (left right : List V)
    (hu : findContainingBlock? remaining u = some left)
    (hv : findContainingBlock? remaining v = some right)
    (hne : left ≠ right) :
    let result := mergeBlocksScan original (u, v) (.seeking beforeRev) remaining
    result.merged = true ∧
      StableMerge (beforeRev.reverse ++ remaining) result.blocks u v := by
  induction remaining generalizing beforeRev left right with
  | nil => nomatch hu
  | cons block rest ih =>
      cases hubSearch : cleanContains u block with
      | true =>
        have hub : u ∈ block := cleanContains_sound block hubSearch
        have hfu : findContainingBlock? (block :: rest) u = some block := by
          exact congrArg (fun b => match b with
            | true => some block
            | false => findContainingBlock? rest u)
            hubSearch
        have hleft : block = left := Option.some.inj (hfu.symm.trans hu)
        subst left
        have hvb : v ∉ block := by
          intro hvb
          have hfv : findContainingBlock? (block :: rest) v = some block := by
            exact congrArg (fun b => match b with
              | true => some block
              | false => findContainingBlock? rest v)
              (cleanContains_complete block hvb)
          have : block = right := Option.some.inj (hfv.symm.trans hv)
          exact hne this
        have hvrest : findContainingBlock? rest v = some right := by
          have hskip : findContainingBlock? (block :: rest) v =
              findContainingBlock? rest v :=
            congrArg (fun b => match b with
              | true => some block
              | false => findContainingBlock? rest v)
              (cleanContains_of_not_mem block hvb)
          exact Eq.trans hskip.symm hv
        obtain ⟨between, after, hrest, hscan⟩ :=
          mergeBlocksScan_carryingU_find original beforeRev [] block rest right u v hvrest
        rw [mergeBlocksScan_seeking_u _ _ _ _ _ _ hub hvb]
        rw [hscan]
        constructor
        · rfl
        · refine ⟨beforeRev.reverse, block, between, right, after, ?_, ?_, ?_⟩
          · exact Eq.trans
              (congrArg (fun tail => beforeRev.reverse ++ block :: tail) hrest)
              (appendAssoc beforeRev.reverse (block :: between)
                (right :: after)).symm
          · exact Or.inl ⟨hub, (findContainingBlock?_sound hv).2⟩
          · exact congrArg (fun front => front ++ after)
              (appendAssoc beforeRev.reverse [block ++ right] between)
      | false =>
        have hub : u ∉ block := cleanContains_false_sound hubSearch
        cases hvbSearch : cleanContains v block with
        | true =>
          have hvb : v ∈ block := cleanContains_sound block hvbSearch
          have hfv : findContainingBlock? (block :: rest) v = some block := by
            exact congrArg (fun b => match b with
              | true => some block
              | false => findContainingBlock? rest v)
              hvbSearch
          have hright : block = right := Option.some.inj (hfv.symm.trans hv)
          subst right
          have hurest : findContainingBlock? rest u = some left := by
            have hskip : findContainingBlock? (block :: rest) u =
                findContainingBlock? rest u :=
              congrArg (fun b => match b with
                | true => some block
                | false => findContainingBlock? rest u)
                (cleanContains_of_not_mem block hub)
            exact Eq.trans hskip.symm hu
          obtain ⟨between, after, hrest, hscan⟩ :=
            mergeBlocksScan_carryingV_find original beforeRev [] block rest left u v hurest
          rw [mergeBlocksScan_seeking_v _ _ _ _ _ _ hub hvb]
          rw [hscan]
          constructor
          · rfl
          · refine ⟨beforeRev.reverse, block, between, left, after, ?_, ?_, ?_⟩
            · exact Eq.trans
                (congrArg (fun tail => beforeRev.reverse ++ block :: tail) hrest)
                (appendAssoc beforeRev.reverse (block :: between)
                  (left :: after)).symm
            · exact Or.inr ⟨hvb, (findContainingBlock?_sound hu).2⟩
            · exact congrArg (fun front => front ++ after)
                (appendAssoc beforeRev.reverse [block ++ left] between)
        | false =>
          have hvb : v ∉ block := cleanContains_false_sound hvbSearch
          have hurest : findContainingBlock? rest u = some left := by
            have hskip : findContainingBlock? (block :: rest) u =
                findContainingBlock? rest u :=
              congrArg (fun b => match b with
                | true => some block
                | false => findContainingBlock? rest u)
                (cleanContains_of_not_mem block hub)
            exact Eq.trans hskip.symm hu
          have hvrest : findContainingBlock? rest v = some right := by
            have hskip : findContainingBlock? (block :: rest) v =
                findContainingBlock? rest v :=
              congrArg (fun b => match b with
                | true => some block
                | false => findContainingBlock? rest v)
                (cleanContains_of_not_mem block hvb)
            exact Eq.trans hskip.symm hv
          have hrec := ih (beforeRev := block :: beforeRev)
            (left := left) (right := right) hurest hvrest hne
          rw [mergeBlocksScan_seeking_skip _ _ _ _ _ _ hub hvb]
          constructor
          · exact hrec.1
          · have hsource : (block :: beforeRev).reverse ++ rest =
                beforeRev.reverse ++ block :: rest :=
              Eq.trans
                (congrArg (fun front => front ++ rest)
                  (reverseCons block beforeRev))
                (appendAssoc beforeRev.reverse [block] rest)
            exact Eq.mp (congrArg (fun source =>
              StableMerge source
                (mergeBlocksScan original (u, v)
                  (.seeking (block :: beforeRev)) rest).blocks u v) hsource) hrec.2

theorem mergeBlocksForEdge_missing_noop
    (blocks : List (List V)) (u v : V)
    (hmissing :
      findContainingBlock? blocks u = none ∨
      findContainingBlock? blocks v = none) :
    mergeBlocksForEdge blocks (u, v) =
      { blocks := blocks, merged := false } := by
  rcases hmissing with hu | hv
  · rw [mergeBlocksForEdge, hu]
    rfl
  · cases hu : findContainingBlock? blocks u with
    | none =>
        rw [mergeBlocksForEdge, hu]
        rfl
    | some left =>
        rw [mergeBlocksForEdge, hu, hv]
        rfl

theorem mergeBlocksForEdge_same_block_noop
    (blocks : List (List V)) (u v : V) (block : List V)
    (hu : findContainingBlock? blocks u = some block)
    (hv : findContainingBlock? blocks v = some block) :
    mergeBlocksForEdge blocks (u, v) =
      { blocks := blocks, merged := false } := by
  rw [mergeBlocksForEdge, hu, hv]
  change (match cleanListEq block block with
    | true => noMergeResult blocks
    | false => mergeBlocksScan blocks (u, v) (.seeking []) blocks) = _
  rw [cleanListEq_refl]
  rfl

theorem mergeBlocksForEdge_distinct_blocks_merged
    (blocks : List (List V)) (u v : V) (left right : List V)
    (hu : findContainingBlock? blocks u = some left)
    (hv : findContainingBlock? blocks v = some right)
    (hne : left ≠ right) :
    let result := mergeBlocksForEdge blocks (u, v)
    result.merged = true ∧ StableMerge blocks result.blocks u v := by
  simp only [mergeBlocksForEdge, hu, hv, cleanListEq_of_ne hne]
  have hscan := mergeBlocksScan_seeking_find_distinct
    blocks [] blocks u v left right hu hv hne
  constructor
  · exact hscan.1
  · have hsource : [].reverse ++ blocks = blocks := by
      rw [List.reverse_nil]
      exact nilAppend blocks
    exact Eq.mp (congrArg (fun source => StableMerge source
      (mergeBlocksScan blocks (u, v) (.seeking []) blocks).blocks u v)
      hsource) hscan.2

private theorem mergedBlockCount
    (before between after : List α) (merged earlier later : α) :
    (before ++ merged :: between ++ after).length + 1 =
      (before ++ earlier :: between ++ later :: after).length := by
  induction before with
  | nil =>
      change Nat.succ (between ++ after).length + 1 =
        Nat.succ (between ++ later :: after).length
      apply congrArg Nat.succ
      induction between with
      | nil =>
          change after.length + 1 = Nat.succ after.length
          exact Eq.trans (Nat.add_succ after.length 0)
            (congrArg Nat.succ (Nat.add_zero after.length))
      | cons _ rest ih =>
          change Nat.succ (rest ++ after).length + 1 =
            Nat.succ (rest ++ later :: after).length
          exact congrArg Nat.succ ih
  | cons _ rest ih =>
      change Nat.succ (rest ++ merged :: between ++ after).length + 1 =
        Nat.succ (rest ++ earlier :: between ++ later :: after).length
      exact congrArg Nat.succ ih

theorem mergeBlocksForEdge_merged_length
    (blocks : List (List V)) (edge : V × V)
    (hmerged : (mergeBlocksForEdge blocks edge).merged = true) :
    (mergeBlocksForEdge blocks edge).blocks.length + 1 = blocks.length := by
  rcases edge with ⟨u, v⟩
  cases hu : findContainingBlock? blocks u with
  | none =>
      have hno := mergeBlocksForEdge_missing_noop blocks u v (Or.inl hu)
      have hfalse := congrArg MergeStepResult.merged hno
      exact False.elim (Bool.noConfusion (Eq.trans hfalse.symm hmerged))
  | some left =>
      cases hv : findContainingBlock? blocks v with
      | none =>
          have hno := mergeBlocksForEdge_missing_noop blocks u v (Or.inr hv)
          have hfalse := congrArg MergeStepResult.merged hno
          exact False.elim (Bool.noConfusion (Eq.trans hfalse.symm hmerged))
      | some right =>
          by_cases hsame : left = right
          · subst right
            have hno := mergeBlocksForEdge_same_block_noop
              blocks u v left hu hv
            have hfalse := congrArg MergeStepResult.merged hno
            exact False.elim
              (Bool.noConfusion (Eq.trans hfalse.symm hmerged))
          · have hstable :=
              (mergeBlocksForEdge_distinct_blocks_merged blocks u v left right
                hu hv hsame).2
            rcases hstable with ⟨before, earlier, between, later, after,
              hsource, -, hresult⟩
            rw [hresult]
            rw [hsource]
            exact mergedBlockCount before between after
              (earlier ++ later) earlier later

private theorem mergeBlocksForEdge_noop_eq
    (blocks : List (List V)) (edge : V × V)
    (hnoop : (mergeBlocksForEdge blocks edge).merged = false) :
    (mergeBlocksForEdge blocks edge).blocks = blocks := by
  rcases edge with ⟨u, v⟩
  cases hu : findContainingBlock? blocks u with
  | none =>
      exact congrArg MergeStepResult.blocks
        (mergeBlocksForEdge_missing_noop blocks u v (Or.inl hu))
  | some left =>
      cases hv : findContainingBlock? blocks v with
      | none =>
          exact congrArg MergeStepResult.blocks
            (mergeBlocksForEdge_missing_noop blocks u v (Or.inr hv))
      | some right =>
          by_cases hsame : left = right
          · subst right
            exact congrArg MergeStepResult.blocks
              (mergeBlocksForEdge_same_block_noop blocks u v left hu hv)
          · have hm :=
              (mergeBlocksForEdge_distinct_blocks_merged blocks u v left right
                hu hv hsame).1
            exact False.elim
              (Bool.noConfusion (Eq.trans hnoop.symm hm))

theorem mergeBlocksForEdge_noop_length
    (blocks : List (List V)) (edge : V × V)
    (hnoop : (mergeBlocksForEdge blocks edge).merged = false) :
    (mergeBlocksForEdge blocks edge).blocks.length = blocks.length := by
  rw [mergeBlocksForEdge_noop_eq blocks edge hnoop]

/-- One executable fold step. -/
def componentFoldStep (state : F.ComponentFoldState) (edge : V × V) :
    F.ComponentFoldState :=
  let result := mergeBlocksForEdge state.blocks edge
  { blocks := result.blocks
    successfulMerges :=
      if result.merged then state.successfulMerges + 1
      else state.successfulMerges }

def componentFoldPrefix (edgePrefix : List (V × V)) : F.ComponentFoldState :=
  edgePrefix.foldl F.componentFoldStep F.initialComponentFoldState

/-- Structural and counting invariant of the public component fold. -/
structure ComponentFoldInvariant (state : F.ComponentFoldState) : Prop where
  blocks_nodup : state.blocks.Nodup
  block_nodup : ∀ block, block ∈ state.blocks → block.Nodup
  blocks_nonempty :
    ∀ block, block ∈ state.blocks → ∃ head tail, block = head :: tail
  blocks_pairwise_disjoint :
    state.blocks.Pairwise (fun left right => ∀ v, v ∈ left → v ∉ right)
  coverage :
    ∀ v, v ∈ F.verts ↔ ∃ block, block ∈ state.blocks ∧ v ∈ block
  block_count :
    state.blocks.length + state.successfulMerges = F.vcard

theorem initialComponentFoldState_invariant
    (exact : F.ExactPresentation) :
    F.ComponentFoldInvariant F.initialComponentFoldState := by
  constructor
  · change (F.singletonBlocks).Nodup
    unfold singletonBlocks
    exact cleanSingletonMapNodup F.verts exact.verts_nodup
  · intro block hblock
    change block ∈ cleanMap (fun v : V => [v]) F.verts at hblock
    obtain ⟨v, _, heq⟩ :=
      cleanMapMemForward (fun v : V => [v]) F.verts hblock
    cases heq
    exact List.Pairwise.cons (fun _ h => nomatch h) List.Pairwise.nil
  · intro block hblock
    change block ∈ cleanMap (fun v : V => [v]) F.verts at hblock
    obtain ⟨v, _, heq⟩ :=
      cleanMapMemForward (fun v : V => [v]) F.verts hblock
    exact ⟨v, [], heq.symm⟩
  · change (cleanMap (fun v : V => [v]) F.verts).Pairwise _
    exact cleanSingletonMapPairwiseDisjoint F.verts exact.verts_nodup
  · intro v
    constructor
    · intro hv
      refine ⟨[v], ?_, List.Mem.head []⟩
      change [v] ∈ cleanMap (fun x : V => [x]) F.verts
      exact cleanMapMemBackward _ F.verts ⟨v, hv, rfl⟩
    · intro h
      obtain ⟨block, hblock, hvblock⟩ := h
      change block ∈ cleanMap (fun x : V => [x]) F.verts at hblock
      obtain ⟨w, hw, heq⟩ := cleanMapMemForward _ F.verts hblock
      cases heq
      cases hvblock with
      | head => exact hw
      | tail _ ht => nomatch ht
  · change (cleanMap (fun v : V => [v]) F.verts).length + 0 =
      F.verts.length
    exact Eq.trans (Nat.add_zero _)
      (cleanMapLength (fun v : V => [v]) F.verts)

theorem mergeBlocksForEdge_noop_preserves_invariant
    (state : F.ComponentFoldState) (edge : V × V)
    (hinvariant : F.ComponentFoldInvariant state)
    (hnoop : (mergeBlocksForEdge state.blocks edge).merged = false) :
    F.ComponentFoldInvariant
      { blocks := (mergeBlocksForEdge state.blocks edge).blocks
        successfulMerges := state.successfulMerges } := by
  have hblocks := mergeBlocksForEdge_noop_eq state.blocks edge hnoop
  have hstate :
      ({ blocks := (mergeBlocksForEdge state.blocks edge).blocks
         successfulMerges := state.successfulMerges } : F.ComponentFoldState) =
        state :=
    congrArg (fun blocks =>
      ({ blocks := blocks
         successfulMerges := state.successfulMerges } : F.ComponentFoldState))
      hblocks
  exact Eq.mpr
    (congrArg (fun next => F.ComponentFoldInvariant next) hstate)
    hinvariant

private theorem pairwise_disjoint_nonempty_nodup
    (blocks : List (List V))
    (hpairwise :
      blocks.Pairwise (fun left right => ∀ x, x ∈ left → x ∉ right))
    (hnonempty : ∀ block, block ∈ blocks → ∃ head tail, block = head :: tail) :
    blocks.Nodup := by
  induction blocks with
  | nil => exact List.Pairwise.nil
  | cons block rest ih =>
      cases hpairwise with
      | cons hhead htail =>
          apply List.Pairwise.cons
          · intro other hother heq
            subst other
            obtain ⟨head, tail, hshape⟩ :=
              hnonempty block (List.Mem.head rest)
            have hheadmem : head ∈ block :=
              Eq.mpr (congrArg (fun xs => head ∈ xs) hshape)
                (List.Mem.head tail)
            exact hhead block hother head hheadmem hheadmem
          · exact ih htail (fun other hother =>
              hnonempty other (List.Mem.tail block hother))

theorem mergeBlocksForEdge_distinct_preserves_invariant
    (state : F.ComponentFoldState) (u v : V)
    (hinvariant : F.ComponentFoldInvariant state)
    (hu : u ∈ F.verts) (hv : v ∈ F.verts)
    (hmerged : (mergeBlocksForEdge state.blocks (u, v)).merged = true) :
    F.ComponentFoldInvariant
      { blocks := (mergeBlocksForEdge state.blocks (u, v)).blocks
        successfulMerges := state.successfulMerges + 1 } := by
  obtain ⟨left, hleft, huleft⟩ := (hinvariant.coverage u).mp hu
  obtain ⟨right, hright, hvright⟩ := (hinvariant.coverage v).mp hv
  have hulook : findContainingBlock? state.blocks u = some left :=
    (findContainingBlock?_eq_some_iff state.blocks
      hinvariant.blocks_pairwise_disjoint u left).2 ⟨hleft, huleft⟩
  have hvlook : findContainingBlock? state.blocks v = some right :=
    (findContainingBlock?_eq_some_iff state.blocks
      hinvariant.blocks_pairwise_disjoint v right).2 ⟨hright, hvright⟩
  have hne : left ≠ right := by
    intro heq
    subst right
    have hno := mergeBlocksForEdge_same_block_noop state.blocks u v left hulook hvlook
    rw [hno] at hmerged
    contradiction
  have hstable :=
    (mergeBlocksForEdge_distinct_blocks_merged state.blocks u v left right
      hulook hvlook hne).2
  rcases hstable with ⟨before, earlier, between, later, after,
    hblocks, hends, hresult⟩
  have hblocks_nodup := hinvariant.blocks_nodup
  have hblock_nodup := hinvariant.block_nodup
  have hblocks_nonempty := hinvariant.blocks_nonempty
  have hpairwise := hinvariant.blocks_pairwise_disjoint
  have hcoverage := hinvariant.coverage
  have hcount := hinvariant.block_count
  rw [hblocks] at hblocks_nodup hblock_nodup hblocks_nonempty hpairwise hcoverage hcount
  have hnew_nonempty : ∀ block,
      block ∈ before ++ (earlier ++ later) :: between ++ after →
        ∃ head tail, block = head :: tail := by
    intro block hblock
    cases mergedBlocksMemForward before earlier between later after hblock with
    | inl hm =>
        subst block
        obtain ⟨head, tail, heq⟩ := hblocks_nonempty earlier
          (memAppendBackward (Or.inl (memAppendBackward
            (Or.inr (List.Mem.head between)))))
        cases heq
        exact ⟨head, tail ++ later, rfl⟩
    | inr hold => exact hblocks_nonempty block hold
  have hnew_block_nodup : ∀ block,
      block ∈ before ++ (earlier ++ later) :: between ++ after → block.Nodup := by
    intro block hblock
    cases mergedBlocksMemForward before earlier between later after hblock with
    | inl hm =>
        subst block
        exact nodupAppend
          (hblock_nodup earlier (memAppendBackward (Or.inl
            (memAppendBackward (Or.inr (List.Mem.head between))))))
          (hblock_nodup later (memAppendBackward
            (Or.inr (List.Mem.head after))))
          (earlierLaterDisjoint before earlier between later after hpairwise)
    | inr hold => exact hblock_nodup block hold
  have hnew_pairwise :
      (before ++ (earlier ++ later) :: between ++ after).Pairwise
        (fun left right => ∀ x, x ∈ left → x ∉ right) := by
    exact mergePairwiseDisjoint before earlier between later after hpairwise
  have hnew_coverage : ∀ x, x ∈ F.verts ↔
      ∃ block, block ∈ before ++ (earlier ++ later) :: between ++ after ∧
        x ∈ block := by
    intro x
    constructor
    · intro hxverts
      obtain ⟨block, hblock, hx⟩ := (hcoverage x).mp hxverts
      cases originalBlocksMemForward before earlier between later after hblock with
      | inl hearlier =>
          subst block
          exact ⟨earlier ++ later,
            memAppendBackward (Or.inl (memAppendBackward
              (Or.inr (List.Mem.head between)))),
            memAppendBackward (Or.inl hx)⟩
      | inr hrest =>
          cases hrest with
          | inl hlater =>
              subst block
              exact ⟨earlier ++ later,
                memAppendBackward (Or.inl (memAppendBackward
                  (Or.inr (List.Mem.head between)))),
                memAppendBackward (Or.inr hx)⟩
          | inr hnew => exact ⟨block, hnew, hx⟩
    · intro hnewWitness
      obtain ⟨block, hblock, hx⟩ := hnewWitness
      apply (hcoverage x).mpr
      cases mergedBlocksMemForward before earlier between later after hblock with
      | inl hmerged =>
          subst block
          cases memAppendForward hx with
          | inl hearlier =>
              exact ⟨earlier, memAppendBackward (Or.inl
                (memAppendBackward (Or.inr (List.Mem.head between)))), hearlier⟩
          | inr hlater =>
              exact ⟨later, memAppendBackward
                (Or.inr (List.Mem.head after)), hlater⟩
      | inr hold => exact ⟨block, hold, hx⟩
  have hlen := mergeBlocksForEdge_merged_length state.blocks (u, v) hmerged
  have hlenMerged :
      (before ++ (earlier ++ later) :: between ++ after).length + 1 =
        (before ++ earlier :: between ++ later :: after).length :=
    Eq.trans
      (Eq.mp (congrArg (fun blocks => blocks.length + 1 = state.blocks.length)
        hresult) hlen)
      (congrArg List.length hblocks)
  rw [hresult]
  constructor
  · exact pairwise_disjoint_nonempty_nodup _ hnew_pairwise hnew_nonempty
  · exact hnew_block_nodup
  · exact hnew_nonempty
  · exact hnew_pairwise
  · exact hnew_coverage
  · dsimp only
    exact Eq.trans
      (Eq.trans
        (congrArg (Nat.add
          (before ++ (earlier ++ later) :: between ++ after).length)
          (Nat.add_comm state.successfulMerges 1))
        (Nat.add_assoc
          (before ++ (earlier ++ later) :: between ++ after).length
          1 state.successfulMerges).symm)
      (Eq.trans
        (congrArg (fun n => n + state.successfulMerges) hlenMerged)
        hcount)

theorem componentFoldStep_invariant
    (state : F.ComponentFoldState) (u v : V)
    (hinvariant : F.ComponentFoldInvariant state)
    (hu : u ∈ F.verts) (hv : v ∈ F.verts) :
    F.ComponentFoldInvariant (F.componentFoldStep state (u, v)) := by
  cases hmerged : (mergeBlocksForEdge state.blocks (u, v)).merged with
  | false =>
      have hstep : F.componentFoldStep state (u, v) =
          { blocks := (mergeBlocksForEdge state.blocks (u, v)).blocks
            successfulMerges := state.successfulMerges } := by
        unfold componentFoldStep
        dsimp only
        apply congrArg (fun count =>
          ({ blocks := (mergeBlocksForEdge state.blocks (u, v)).blocks
             successfulMerges := count } : F.ComponentFoldState))
        exact if_neg (fun htrue =>
          Bool.noConfusion (Eq.trans hmerged.symm htrue))
      exact Eq.mpr
        (congrArg (fun next => F.ComponentFoldInvariant next) hstep)
        (mergeBlocksForEdge_noop_preserves_invariant F state (u, v)
          hinvariant hmerged)
  | true =>
      have hstep : F.componentFoldStep state (u, v) =
          { blocks := (mergeBlocksForEdge state.blocks (u, v)).blocks
            successfulMerges := state.successfulMerges + 1 } := by
        unfold componentFoldStep
        dsimp only
        apply congrArg (fun count =>
          ({ blocks := (mergeBlocksForEdge state.blocks (u, v)).blocks
             successfulMerges := count } : F.ComponentFoldState))
        exact if_pos hmerged
      exact Eq.mpr
        (congrArg (fun next => F.ComponentFoldInvariant next) hstep)
        (mergeBlocksForEdge_distinct_preserves_invariant F state u v
          hinvariant hu hv hmerged)

private theorem edge_endpoints_mem (edge : V × V) (hedge : edge ∈ F.edges) :
    edge.1 ∈ F.verts ∧ edge.2 ∈ F.verts := by
  rcases edge with ⟨u, v⟩
  change (u, v) ∈ cleanFlatMap _ F.verts at hedge
  obtain ⟨source, hsource, hmap⟩ := cleanFlatMapMemForward _ F.verts hedge
  obtain ⟨target, htarget, heq⟩ := cleanMapMemForward _ _ hmap
  obtain ⟨htargetVerts, _⟩ := cleanFilterMemForward _ F.verts htarget
  cases heq
  exact ⟨hsource, htargetVerts⟩

private theorem componentFoldList_invariant
    (state : F.ComponentFoldState) (edgePrefix : List (V × V))
    (hinvariant : F.ComponentFoldInvariant state)
    (hendpoints : ∀ edge, edge ∈ edgePrefix →
      edge.1 ∈ F.verts ∧ edge.2 ∈ F.verts) :
    F.ComponentFoldInvariant (edgePrefix.foldl F.componentFoldStep state) := by
  induction edgePrefix generalizing state with
  | nil => exact hinvariant
  | cons edge rest ih =>
      rcases edge with ⟨u, v⟩
      have huv := hendpoints (u, v) (List.Mem.head rest)
      apply ih (state := F.componentFoldStep state (u, v))
      · exact componentFoldStep_invariant F state u v hinvariant
          huv.1 huv.2
      · intro edge hedge
        exact hendpoints edge (List.Mem.tail (u, v) hedge)

theorem componentFoldPrefix_invariant
    (exact : F.ExactPresentation) (edgePrefix : List (V × V))
    (hprefix : List.IsPrefix edgePrefix F.edges) :
    F.ComponentFoldInvariant (F.componentFoldPrefix edgePrefix) := by
  unfold componentFoldPrefix
  apply componentFoldList_invariant F F.initialComponentFoldState edgePrefix
    (initialComponentFoldState_invariant F exact)
  intro edge hedge
  exact F.edge_endpoints_mem edge (hprefix.subset hedge)

private theorem componentFoldList_successfulMerges_le
    (state : F.ComponentFoldState) (edgePrefix : List (V × V)) :
    (edgePrefix.foldl F.componentFoldStep state).successfulMerges ≤
      state.successfulMerges + edgePrefix.length := by
  induction edgePrefix generalizing state with
  | nil => exact Nat.le_refl state.successfulMerges
  | cons edge rest ih =>
      change (rest.foldl F.componentFoldStep
        (F.componentFoldStep state edge)).successfulMerges ≤
          state.successfulMerges + Nat.succ rest.length
      calc
        (rest.foldl F.componentFoldStep
            (F.componentFoldStep state edge)).successfulMerges ≤
            (F.componentFoldStep state edge).successfulMerges + rest.length :=
          ih (state := F.componentFoldStep state edge)
        _ ≤ state.successfulMerges + Nat.succ rest.length := by
          cases hm : (mergeBlocksForEdge state.blocks edge).merged with
          | false =>
              have hstep : (F.componentFoldStep state edge).successfulMerges =
                  state.successfulMerges := by
                unfold componentFoldStep
                dsimp only
                exact if_neg (fun htrue =>
                  Bool.noConfusion (Eq.trans hm.symm htrue))
              apply Eq.mpr (congrArg (fun n =>
                n + rest.length ≤ state.successfulMerges + Nat.succ rest.length)
                hstep)
              exact Nat.add_le_add_left (Nat.le_succ rest.length)
                state.successfulMerges
          | true =>
              have hstep : (F.componentFoldStep state edge).successfulMerges =
                  state.successfulMerges + 1 := by
                unfold componentFoldStep
                dsimp only
                exact if_pos hm
              apply Eq.mpr (congrArg (fun n =>
                n + rest.length ≤ state.successfulMerges + Nat.succ rest.length)
                hstep)
              exact Nat.le_of_eq (Eq.trans
                (Nat.add_assoc state.successfulMerges 1 rest.length)
                (congrArg (Nat.add state.successfulMerges)
                  (Eq.trans (Nat.succ_add 0 rest.length)
                    (congrArg Nat.succ (Nat.zero_add rest.length)))))

theorem componentFoldPrefix_successfulMerges_le
    (edgePrefix : List (V × V)) :
    (F.componentFoldPrefix edgePrefix).successfulMerges ≤ edgePrefix.length := by
  unfold componentFoldPrefix
  have h := componentFoldList_successfulMerges_le F
    F.initialComponentFoldState edgePrefix
  change (edgePrefix.foldl F.componentFoldStep
    F.initialComponentFoldState).successfulMerges ≤ 0 + edgePrefix.length at h
  exact Eq.mp (congrArg (fun n =>
    (edgePrefix.foldl F.componentFoldStep
      F.initialComponentFoldState).successfulMerges ≤ n)
    (Nat.zero_add edgePrefix.length)) h

/-- **Double-counting bookkeeping.** The number of edges whose sources range over `us`
equals the sum of the out-degrees over `us`. Clean induction on `us` (the target list
`F.verts` is fixed, so `outDeg` does not move under the recursion). -/
theorem edgesFrom_length (us : List V) :
    (F.edgesFrom us).length = (us.map F.outDeg).foldr (· + ·) 0 := by
  induction us with
  | nil => rfl
  | cons u us ih =>
    change (cleanMap (fun v => (u, v))
        (cleanFilter (fun v => F.graph u v) F.verts) ++
        F.edgesFrom us).length = F.outDeg u +
          (us.map F.outDeg).foldr (· + ·) 0
    have hdegree :
        (cleanFilter (fun v => F.graph u v) F.verts).length = F.outDeg u :=
      congrArg List.length
        (cleanFilterEqFilter (fun v => F.graph u v) F.verts)
    exact Eq.trans (lengthAppend _ _)
      (Eq.trans (congrArg (fun n => n + (F.edgesFrom us).length)
        (cleanMapLength (fun v => (u, v))
          (cleanFilter (fun v => F.graph u v) F.verts)))
        (Eq.trans
          (congrArg (fun n => n + (F.edgesFrom us).length) hdegree)
          (congrArg (Nat.add (F.outDeg u)) ih)))

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

/-- Undirected public reachability is symmetric. -/
theorem Reach.symm {V : Type} {G : Graph V} {a b : V}
    (h : Reach G a b) : Reach G b a := by
  induction h with
  | refl v => exact Reach.refl v
  | @step u v w hedge _ ih =>
      apply ih.trans
      apply Reach.step
      · rcases hedge with hedge | hedge
        · exact Or.inr hedge
        · exact Or.inl hedge
      · exact Reach.refl u

namespace FinGraph
variable [DecidableEq V] (F : FinGraph V)

/-- The directed graph presented by exactly a list of ordered edge pairs. -/
def graphOfEdgePrefix (edgePrefix : List (V × V)) : Graph V :=
  fun u v => edgePrefix.any (fun edge => decide (edge.1 = u ∧ edge.2 = v))

/-- Two vertices occur in one block of an explicit partition list. -/
def sameBlock (blocks : List (List V)) (u v : V) : Prop :=
  ∃ block, block ∈ blocks ∧ u ∈ block ∧ v ∈ block

@[simp] private theorem graphOfEdgePrefix_nil (u v : V) :
    graphOfEdgePrefix ([] : List (V × V)) u v = false := rfl

private theorem graphOfEdgePrefix_cons_true_iff
    (edge : V × V) (edgePrefix : List (V × V)) (u v : V) :
    graphOfEdgePrefix (edge :: edgePrefix) u v = true ↔
      (edge.1 = u ∧ edge.2 = v) ∨
        graphOfEdgePrefix edgePrefix u v = true := by
  constructor
  · intro h
    cases hdec : decide (edge.1 = u ∧ edge.2 = v) with
    | true => exact Or.inl (of_decide_eq_true hdec)
    | false =>
        exact Or.inr (Eq.trans
          (congrArg (fun b => b || graphOfEdgePrefix edgePrefix u v) hdec).symm h)
  · intro h
    cases h with
    | inl hedge =>
        have hdec : decide (edge.1 = u ∧ edge.2 = v) = true := by
          cases hvalue : decide (edge.1 = u ∧ edge.2 = v) with
          | false => exact False.elim ((of_decide_eq_false hvalue) hedge)
          | true => rfl
        exact Eq.trans
          (congrArg (fun b => b || graphOfEdgePrefix edgePrefix u v)
            hdec) rfl
    | inr hrest =>
        cases hdec : decide (edge.1 = u ∧ edge.2 = v) with
        | true =>
            exact Eq.trans
              (congrArg (fun b => b || graphOfEdgePrefix edgePrefix u v) hdec)
              rfl
        | false =>
            exact Eq.trans
              (congrArg (fun b => b || graphOfEdgePrefix edgePrefix u v) hdec)
              hrest

private theorem graphOfEdgePrefix_true_iff_mem
    (edgePrefix : List (V × V)) (u v : V) :
    graphOfEdgePrefix edgePrefix u v = true ↔ (u, v) ∈ edgePrefix := by
  constructor
  · intro h
    obtain ⟨edge, hedge, hdec⟩ := anyMemForward
      (fun edge : V × V => decide (edge.1 = u ∧ edge.2 = v)) edgePrefix h
    obtain ⟨hu, hv⟩ := of_decide_eq_true hdec
    have heq : edge = (u, v) := Prod.ext hu hv
    exact heq ▸ hedge
  · intro h
    apply anyMemBackward
    have hdec : decide ((u, v).1 = u ∧ (u, v).2 = v) = true := by
      cases hvalue : decide ((u, v).1 = u ∧ (u, v).2 = v) with
      | false =>
          exact False.elim ((of_decide_eq_false hvalue) ⟨rfl, rfl⟩)
      | true => rfl
    exact ⟨(u, v), h, hdec⟩

theorem mem_edges_iff_graph_true
    (exact : F.ExactPresentation) (u v : V) :
    (u, v) ∈ F.edges ↔ F.graph u v = true := by
  constructor
  · intro hedge
    change (u, v) ∈ cleanFlatMap _ F.verts at hedge
    obtain ⟨source, _, hmap⟩ := cleanFlatMapMemForward _ F.verts hedge
    obtain ⟨target, htarget, heq⟩ := cleanMapMemForward _ _ hmap
    obtain ⟨_, hgraph⟩ := cleanFilterMemForward _ F.verts htarget
    cases heq
    exact hgraph
  · intro hgraph
    change (u, v) ∈ cleanFlatMap _ F.verts
    apply cleanFlatMapMemBackward
    refine ⟨u, exact.verts_complete u, ?_⟩
    apply cleanMapMemBackward
    exact ⟨v, cleanFilterMemBackward _ F.verts
      (exact.verts_complete v) hgraph, rfl⟩

theorem graphOfEdgePrefix_edges_eq (exact : F.ExactPresentation) :
    graphOfEdgePrefix F.edges = F.graph := by
  funext u v
  cases hgraph : F.graph u v with
  | false =>
      cases hprefix : graphOfEdgePrefix F.edges u v with
      | false => rfl
      | true =>
          have hmem := (graphOfEdgePrefix_true_iff_mem F.edges u v).mp hprefix
          have htrue := (F.mem_edges_iff_graph_true exact u v).mp hmem
          exact False.elim (Bool.noConfusion (Eq.trans hgraph.symm htrue))
  | true =>
      have hmem := (F.mem_edges_iff_graph_true exact u v).mpr hgraph
      have hprefix := (graphOfEdgePrefix_true_iff_mem F.edges u v).mpr hmem
      exact hprefix

private theorem sameBlock_refl
    (state : F.ComponentFoldState)
    (hinvariant : F.ComponentFoldInvariant state)
    {v : V} (hv : v ∈ F.verts) :
    sameBlock state.blocks v v := by
  obtain ⟨block, hblock, hvblock⟩ := (hinvariant.coverage v).mp hv
  exact ⟨block, hblock, hvblock, hvblock⟩

private theorem sameBlock_symm {blocks : List (List V)} {u v : V}
    (h : sameBlock blocks u v) : sameBlock blocks v u := by
  rcases h with ⟨block, hblock, hu, hv⟩
  exact ⟨block, hblock, hv, hu⟩

private theorem sameBlock_trans
    (state : F.ComponentFoldState)
    (hinvariant : F.ComponentFoldInvariant state)
    {a b c : V} (hab : sameBlock state.blocks a b)
    (hbc : sameBlock state.blocks b c) : sameBlock state.blocks a c := by
  rcases hab with ⟨left, hleft, ha, hb⟩
  rcases hbc with ⟨right, hright, hb', hc⟩
  have heq := containingBlock_unique state.blocks
    hinvariant.blocks_pairwise_disjoint hleft hb hright hb'
  subst right
  exact ⟨left, hleft, ha, hc⟩

private theorem mergeBlocksForEdge_noop_sameBlock
    (state : F.ComponentFoldState) (u v : V)
    (hinvariant : F.ComponentFoldInvariant state)
    (hu : u ∈ F.verts) (hv : v ∈ F.verts)
    (hnoop : (mergeBlocksForEdge state.blocks (u, v)).merged = false) :
    sameBlock state.blocks u v := by
  obtain ⟨left, hleft, huleft⟩ := (hinvariant.coverage u).mp hu
  obtain ⟨right, hright, hvright⟩ := (hinvariant.coverage v).mp hv
  have hulook := (findContainingBlock?_eq_some_iff state.blocks
    hinvariant.blocks_pairwise_disjoint u left).2 ⟨hleft, huleft⟩
  have hvlook := (findContainingBlock?_eq_some_iff state.blocks
    hinvariant.blocks_pairwise_disjoint v right).2 ⟨hright, hvright⟩
  by_cases hne : left = right
  · subst right
    exact ⟨left, hleft, huleft, hvright⟩
  · have hm := (mergeBlocksForEdge_distinct_blocks_merged state.blocks
      u v left right hulook hvlook hne).1
    rw [hm] at hnoop
    contradiction

private theorem componentFoldStep_sameBlock_iff
    (state : F.ComponentFoldState) (u v x y : V)
    (hinvariant : F.ComponentFoldInvariant state)
    (hu : u ∈ F.verts) (hv : v ∈ F.verts) :
    sameBlock (F.componentFoldStep state (u, v)).blocks x y ↔
      sameBlock state.blocks x y ∨
      (sameBlock state.blocks x u ∧ sameBlock state.blocks v y) ∨
      (sameBlock state.blocks x v ∧ sameBlock state.blocks u y) := by
  have hstepBlocks : (F.componentFoldStep state (u, v)).blocks =
      (mergeBlocksForEdge state.blocks (u, v)).blocks := rfl
  cases hm : (mergeBlocksForEdge state.blocks (u, v)).merged with
  | false =>
      have heq := mergeBlocksForEdge_noop_eq state.blocks (u, v) hm
      have huv := mergeBlocksForEdge_noop_sameBlock F state u v
        hinvariant hu hv hm
      have hblocksEq : (F.componentFoldStep state (u, v)).blocks =
          state.blocks := Eq.trans hstepBlocks heq
      constructor
      · intro hxy
        exact Or.inl (Eq.mp
          (congrArg (fun blocks => sameBlock blocks x y) hblocksEq) hxy)
      · intro h
        have hold : sameBlock state.blocks x y := by
          rcases h with h | h | h
          · exact h
          · exact sameBlock_trans F state hinvariant h.1
              (sameBlock_trans F state hinvariant huv h.2)
          · exact sameBlock_trans F state hinvariant h.1
              (sameBlock_trans F state hinvariant (sameBlock_symm huv) h.2)
        exact Eq.mpr
          (congrArg (fun blocks => sameBlock blocks x y) hblocksEq) hold
  | true =>
      have hstable : StableMerge state.blocks
          (mergeBlocksForEdge state.blocks (u, v)).blocks u v := by
        cases hulook : findContainingBlock? state.blocks u with
        | none =>
            have hno := mergeBlocksForEdge_missing_noop state.blocks u v
              (Or.inl hulook)
            have hfalse := congrArg MergeStepResult.merged hno
            exact False.elim
              (Bool.noConfusion (Eq.trans hfalse.symm hm))
        | some left =>
            cases hvlook : findContainingBlock? state.blocks v with
            | none =>
                have hno := mergeBlocksForEdge_missing_noop state.blocks u v
                  (Or.inr hvlook)
                have hfalse := congrArg MergeStepResult.merged hno
                exact False.elim
                  (Bool.noConfusion (Eq.trans hfalse.symm hm))
            | some right =>
                by_cases heq : left = right
                · subst right
                  have hno := mergeBlocksForEdge_same_block_noop
                    state.blocks u v left hulook hvlook
                  have hfalse := congrArg MergeStepResult.merged hno
                  exact False.elim
                    (Bool.noConfusion (Eq.trans hfalse.symm hm))
                · exact (mergeBlocksForEdge_distinct_blocks_merged state.blocks
                    u v left right hulook hvlook heq).2
      rcases hstable with ⟨before, earlier, between, later, after,
        hblocks, hends, hresult⟩
      have hearlier : earlier ∈ state.blocks :=
        Eq.mpr (congrArg (fun blocks => earlier ∈ blocks) hblocks)
          (memAppendBackward (Or.inl (memAppendBackward
            (Or.inr (List.Mem.head between)))))
      have hlater : later ∈ state.blocks :=
        Eq.mpr (congrArg (fun blocks => later ∈ blocks) hblocks)
          (memAppendBackward (Or.inr (List.Mem.head after)))
      have hmergedMem : earlier ++ later ∈
          before ++ (earlier ++ later) :: between ++ after :=
        memAppendBackward (Or.inl (memAppendBackward
          (Or.inr (List.Mem.head between))))
      have hstepMerged : (F.componentFoldStep state (u, v)).blocks =
          before ++ (earlier ++ later) :: between ++ after :=
        Eq.trans hstepBlocks hresult
      constructor
      · intro hxy
        have hnew : sameBlock
            (before ++ (earlier ++ later) :: between ++ after) x y :=
          Eq.mp (congrArg (fun blocks => sameBlock blocks x y) hstepMerged) hxy
        rcases hnew with ⟨block, hblock, hx, hy⟩
        cases mergedBlocksMemForward before earlier between later after hblock with
        | inl hb =>
          subst block
          cases memAppendForward hx with
          | inl hxEarlier =>
            cases memAppendForward hy with
            | inl hyEarlier =>
              exact Or.inl ⟨earlier, hearlier, hxEarlier, hyEarlier⟩
            | inr hyLater =>
              rcases hends with hends | hends
              · exact Or.inr (Or.inl
                  ⟨⟨earlier, hearlier, hxEarlier, hends.1⟩,
                    ⟨later, hlater, hends.2, hyLater⟩⟩)
              · exact Or.inr (Or.inr
                  ⟨⟨earlier, hearlier, hxEarlier, hends.1⟩,
                    ⟨later, hlater, hends.2, hyLater⟩⟩)
          | inr hxLater =>
            cases memAppendForward hy with
            | inl hyEarlier =>
              rcases hends with hends | hends
              · exact Or.inr (Or.inr
                  ⟨⟨later, hlater, hxLater, hends.2⟩,
                    ⟨earlier, hearlier, hends.1, hyEarlier⟩⟩)
              · exact Or.inr (Or.inl
                  ⟨⟨later, hlater, hxLater, hends.2⟩,
                    ⟨earlier, hearlier, hends.1, hyEarlier⟩⟩)
            | inr hyLater =>
              exact Or.inl ⟨later, hlater, hxLater, hyLater⟩
        | inr hold =>
            exact Or.inl ⟨block,
              Eq.mpr (congrArg (fun blocks => block ∈ blocks) hblocks) hold,
              hx, hy⟩
      · intro hold
        have mergeContains (a b : V) (ha : sameBlock state.blocks a u)
            (hb : sameBlock state.blocks v b) :
            sameBlock (before ++ (earlier ++ later) :: between ++ after) a b := by
          rcases ha with ⟨ablock, hablock, haa, hau⟩
          rcases hb with ⟨bblock, hbblock, hvb, hbb⟩
          rcases hends with hends | hends
          · have hae : ablock = earlier := containingBlock_unique state.blocks
                hinvariant.blocks_pairwise_disjoint hablock hau hearlier hends.1
            have hbl : bblock = later := containingBlock_unique state.blocks
                hinvariant.blocks_pairwise_disjoint hbblock hvb hlater hends.2
            subst ablock
            subst bblock
            exact ⟨earlier ++ later, hmergedMem,
              memAppendBackward (Or.inl haa), memAppendBackward (Or.inr hbb)⟩
          · have hal : ablock = later := containingBlock_unique state.blocks
                hinvariant.blocks_pairwise_disjoint hablock hau hlater hends.2
            have hbe : bblock = earlier := containingBlock_unique state.blocks
                hinvariant.blocks_pairwise_disjoint hbblock hvb hearlier hends.1
            subst ablock
            subst bblock
            exact ⟨earlier ++ later, hmergedMem,
              memAppendBackward (Or.inr haa), memAppendBackward (Or.inl hbb)⟩
        have hnew : sameBlock
            (before ++ (earlier ++ later) :: between ++ after) x y := by
          rcases hold with hold | hold | hold
          · rcases hold with ⟨block, hblock, hx, hy⟩
            cases originalBlocksMemForward before earlier between later after
                (Eq.mp (congrArg (fun blocks => block ∈ blocks) hblocks) hblock) with
            | inl hearlier =>
                subst block
                exact ⟨earlier ++ later, hmergedMem,
                  memAppendBackward (Or.inl hx), memAppendBackward (Or.inl hy)⟩
            | inr hrest =>
                cases hrest with
                | inl hlaterEq =>
                    subst block
                    exact ⟨earlier ++ later, hmergedMem,
                      memAppendBackward (Or.inr hx), memAppendBackward (Or.inr hy)⟩
                | inr hnewBlock => exact ⟨block, hnewBlock, hx, hy⟩
          · exact mergeContains x y hold.1 hold.2
          · exact sameBlock_symm
              (mergeContains y x (sameBlock_symm hold.2) (sameBlock_symm hold.1))
        exact Eq.mpr
          (congrArg (fun blocks => sameBlock blocks x y) hstepMerged) hnew

private def EdgeClosure (G : Graph V) (u v a b : V) : Prop :=
  Reach G a b ∨
    (Reach G a u ∧ Reach G v b) ∨
    (Reach G a v ∧ Reach G u b)

private theorem edgeClosure_refl (G : Graph V) (u v a : V) :
    EdgeClosure G u v a a := Or.inl (Reach.refl a)

private theorem edgeClosure_trans (G : Graph V) (u v a b c : V)
    (hab : EdgeClosure G u v a b) (hbc : EdgeClosure G u v b c) :
    EdgeClosure G u v a c := by
  unfold EdgeClosure at hab hbc ⊢
  rcases hab with hab | hab | hab <;>
    rcases hbc with hbc | hbc | hbc
  · exact Or.inl (hab.trans hbc)
  · exact Or.inr (Or.inl ⟨hab.trans hbc.1, hbc.2⟩)
  · exact Or.inr (Or.inr ⟨hab.trans hbc.1, hbc.2⟩)
  · exact Or.inr (Or.inl ⟨hab.1, hab.2.trans hbc⟩)
  · exact Or.inr (Or.inl ⟨hab.1, hbc.2⟩)
  · exact Or.inl (hab.1.trans hbc.2)
  · exact Or.inr (Or.inr ⟨hab.1, hab.2.trans hbc⟩)
  · exact Or.inl (hab.1.trans hbc.2)
  · exact Or.inr (Or.inr ⟨hab.1, hbc.2⟩)

private theorem reach_mono {G H : Graph V} {a b : V}
    (hmono : ∀ x y, G x y = true → H x y = true)
    (h : Reach G a b) : Reach H a b := by
  induction h with
  | refl x => exact Reach.refl x
  | @step x y z hedge _ ih =>
      apply Reach.step
      · rcases hedge with hedge | hedge
        · exact Or.inl (hmono x y hedge)
        · exact Or.inr (hmono y x hedge)
      · exact ih

private theorem adjacency_cons_edgeClosure
    (edgePrefix : List (V × V)) (u v a b : V)
    (h : graphOfEdgePrefix ((u, v) :: edgePrefix) a b = true ∨
      graphOfEdgePrefix ((u, v) :: edgePrefix) b a = true) :
    EdgeClosure (graphOfEdgePrefix edgePrefix) u v a b := by
  rcases h with h | h
  · have hcons := (graphOfEdgePrefix_cons_true_iff
      (u, v) edgePrefix a b).mp h
    rcases hcons with ⟨rfl, rfl⟩ | h
    · exact Or.inr (Or.inl ⟨Reach.refl u, Reach.refl v⟩)
    · exact Or.inl (Reach.step (Or.inl h) (Reach.refl b))
  · have hcons := (graphOfEdgePrefix_cons_true_iff
      (u, v) edgePrefix b a).mp h
    rcases hcons with ⟨rfl, rfl⟩ | h
    · exact Or.inr (Or.inr ⟨Reach.refl v, Reach.refl u⟩)
    · exact Or.inl (Reach.step (Or.inr h) (Reach.refl b))

private theorem reach_graphOfEdgePrefix_cons_iff
    (edgePrefix : List (V × V)) (u v a b : V) :
    Reach (graphOfEdgePrefix ((u, v) :: edgePrefix)) a b ↔
      EdgeClosure (graphOfEdgePrefix edgePrefix) u v a b := by
  constructor
  · intro h
    induction h with
    | refl x => exact edgeClosure_refl _ _ _ _
    | @step x y z hedge _ ih =>
        exact edgeClosure_trans _ _ _ _ _ _
          (adjacency_cons_edgeClosure edgePrefix u v x y hedge) ih
  · intro h
    have lift : ∀ {x y}, Reach (graphOfEdgePrefix edgePrefix) x y →
        Reach (graphOfEdgePrefix ((u, v) :: edgePrefix)) x y := by
      intro x y hxy
      exact reach_mono (fun p q hp =>
        (graphOfEdgePrefix_cons_true_iff (u, v) edgePrefix p q).2 (Or.inr hp)) hxy
    have huv : Reach (graphOfEdgePrefix ((u, v) :: edgePrefix)) u v :=
      Reach.step (Or.inl ((graphOfEdgePrefix_cons_true_iff
        (u, v) edgePrefix u v).2 (Or.inl ⟨rfl, rfl⟩))) (Reach.refl v)
    unfold EdgeClosure at h
    rcases h with h | h | h
    · exact lift h
    · exact (lift h.1).trans (huv.trans (lift h.2))
    · exact (lift h.1).trans (huv.symm.trans (lift h.2))

private theorem reach_graphOfEdgePrefix_snoc_iff
    (edgePrefix : List (V × V)) (u v a b : V) :
    Reach (graphOfEdgePrefix (edgePrefix ++ [(u, v)])) a b ↔
      EdgeClosure (graphOfEdgePrefix edgePrefix) u v a b := by
  have hedgeOrder : ∀ p q,
      graphOfEdgePrefix (edgePrefix ++ [(u, v)]) p q = true ↔
        graphOfEdgePrefix ((u, v) :: edgePrefix) p q = true := by
    intro p q
    constructor
    · intro h
      have hmem := (graphOfEdgePrefix_true_iff_mem
        (edgePrefix ++ [(u, v)]) p q).mp h
      cases memAppendForward hmem with
      | inl hprefix =>
          exact (graphOfEdgePrefix_true_iff_mem ((u, v) :: edgePrefix) p q).mpr
            (List.Mem.tail (u, v) hprefix)
      | inr hsingle =>
          have heq : (p, q) = (u, v) := memSingletonEq hsingle
          cases heq
          exact (graphOfEdgePrefix_true_iff_mem
            ((u, v) :: edgePrefix) u v).mpr (List.Mem.head edgePrefix)
    · intro h
      have hmem := (graphOfEdgePrefix_true_iff_mem
        ((u, v) :: edgePrefix) p q).mp h
      cases memConsForward hmem with
      | inl heq =>
          cases heq
          exact (graphOfEdgePrefix_true_iff_mem
            (edgePrefix ++ [(u, v)]) u v).mpr
            (memAppendBackward (Or.inr (List.Mem.head [])))
      | inr hprefix =>
          exact (graphOfEdgePrefix_true_iff_mem
            (edgePrefix ++ [(u, v)]) p q).mpr
            (memAppendBackward (Or.inl hprefix))
  have hforward : ∀ {x y},
      Reach (graphOfEdgePrefix (edgePrefix ++ [(u, v)])) x y →
        Reach (graphOfEdgePrefix ((u, v) :: edgePrefix)) x y := by
    intro x y h
    exact reach_mono (fun p q hp => (hedgeOrder p q).mp hp) h
  have hbackward : ∀ {x y},
      Reach (graphOfEdgePrefix ((u, v) :: edgePrefix)) x y →
        Reach (graphOfEdgePrefix (edgePrefix ++ [(u, v)])) x y := by
    intro x y h
    exact reach_mono (fun p q hp => (hedgeOrder p q).mpr hp) h
  constructor
  · intro h
    exact (reach_graphOfEdgePrefix_cons_iff edgePrefix u v a b).1 (hforward h)
  · intro h
    exact hbackward ((reach_graphOfEdgePrefix_cons_iff edgePrefix u v a b).2 h)

private theorem componentFoldList_sameBlock_iff
    (state : F.ComponentFoldState) (baseEdges edgePrefix : List (V × V))
    (hinvariant : F.ComponentFoldInvariant state)
    (hendpoints : ∀ edge, edge ∈ edgePrefix →
      edge.1 ∈ F.verts ∧ edge.2 ∈ F.verts)
    (hbase : ∀ a b, sameBlock state.blocks a b ↔
      Reach (graphOfEdgePrefix baseEdges) a b) :
    ∀ a b, sameBlock (edgePrefix.foldl F.componentFoldStep state).blocks a b ↔
      Reach (graphOfEdgePrefix (baseEdges ++ edgePrefix)) a b := by
  induction edgePrefix generalizing state baseEdges with
  | nil =>
      intro a b
      have hedgeEq : baseEdges ++ [] = baseEdges := appendNil baseEdges
      constructor
      · intro hsame
        have hreach := (hbase a b).mp hsame
        exact Eq.mpr (congrArg (fun edges =>
          Reach (graphOfEdgePrefix edges) a b) hedgeEq) hreach
      · intro hreach
        apply (hbase a b).mpr
        exact Eq.mp (congrArg (fun edges =>
          Reach (graphOfEdgePrefix edges) a b) hedgeEq) hreach
  | cons edge rest ih =>
      rcases edge with ⟨u, v⟩
      have huv := hendpoints (u, v) (List.Mem.head rest)
      have hinv' := componentFoldStep_invariant F state u v hinvariant
          huv.1 huv.2
      have hendpoints' : ∀ edge, edge ∈ rest →
          edge.1 ∈ F.verts ∧ edge.2 ∈ F.verts := by
        intro edge hedge
        exact hendpoints edge (List.Mem.tail (u, v) hedge)
      have hbase' : ∀ a b,
          sameBlock (F.componentFoldStep state (u, v)).blocks a b ↔
            Reach (graphOfEdgePrefix (baseEdges ++ [(u, v)])) a b := by
        intro a b
        have hstep := componentFoldStep_sameBlock_iff F state u v a b
          hinvariant huv.1 huv.2
        have hsnoc := reach_graphOfEdgePrefix_snoc_iff baseEdges u v a b
        constructor
        · intro hsame
          apply hsnoc.mpr
          cases hstep.mp hsame with
          | inl hold => exact Or.inl ((hbase a b).mp hold)
          | inr hnew =>
              cases hnew with
              | inl hforward =>
                  exact Or.inr (Or.inl
                    ⟨(hbase a u).mp hforward.1,
                      (hbase v b).mp hforward.2⟩)
              | inr hbackward =>
                  exact Or.inr (Or.inr
                    ⟨(hbase a v).mp hbackward.1,
                      (hbase u b).mp hbackward.2⟩)
        · intro hreach
          apply hstep.mpr
          cases hsnoc.mp hreach with
          | inl hold => exact Or.inl ((hbase a b).mpr hold)
          | inr hnew =>
              cases hnew with
              | inl hforward =>
                  exact Or.inr (Or.inl
                    ⟨(hbase a u).mpr hforward.1,
                      (hbase v b).mpr hforward.2⟩)
              | inr hbackward =>
                  exact Or.inr (Or.inr
                    ⟨(hbase a v).mpr hbackward.1,
                      (hbase u b).mpr hbackward.2⟩)
      have hrec := ih (state := F.componentFoldStep state (u, v))
        (baseEdges := baseEdges ++ [(u, v)]) hinv' hendpoints' hbase'
      intro a b
      have hedgeEq : (baseEdges ++ [(u, v)]) ++ rest =
          baseEdges ++ (u, v) :: rest :=
        appendAssoc baseEdges [(u, v)] rest
      constructor
      · intro hsame
        have hreach := (hrec a b).mp hsame
        exact Eq.mp (congrArg (fun edges =>
          Reach (graphOfEdgePrefix edges) a b) hedgeEq) hreach
      · intro hreach
        apply (hrec a b).mpr
        exact Eq.mpr (congrArg (fun edges =>
          Reach (graphOfEdgePrefix edges) a b) hedgeEq) hreach

private theorem reach_empty_eq {a b : V}
    (h : Reach (graphOfEdgePrefix ([] : List (V × V))) a b) : a = b := by
  induction h with
  | refl x => rfl
  | @step x y z hedge _ ih =>
      cases hedge with
      | inl hfalse => nomatch hfalse
      | inr hfalse => nomatch hfalse

theorem componentFoldPrefix_sameBlock_iff_reach
    (exact : F.ExactPresentation) (edgePrefix : List (V × V))
    (hprefix : List.IsPrefix edgePrefix F.edges) (u v : V) :
    sameBlock (F.componentFoldPrefix edgePrefix).blocks u v ↔
      Reach (graphOfEdgePrefix edgePrefix) u v := by
  unfold componentFoldPrefix
  apply componentFoldList_sameBlock_iff F F.initialComponentFoldState [] edgePrefix
    (initialComponentFoldState_invariant F exact)
  · intro edge hedge
    exact F.edge_endpoints_mem edge (hprefix.subset hedge)
  · intro a b
    constructor
    · rintro ⟨block, hblock, ha, hb⟩
      change block ∈ cleanMap (fun x : V => [x]) F.verts at hblock
      obtain ⟨x, _, heq⟩ := cleanMapMemForward _ F.verts hblock
      cases heq
      cases ha with
      | head =>
          cases hb with
          | head => exact Reach.refl a
          | tail _ ht => nomatch ht
      | tail _ ht => nomatch ht
    · intro h
      have heq := reach_empty_eq h
      subst b
      exact sameBlock_refl F F.initialComponentFoldState
        (initialComponentFoldState_invariant F exact)
        (exact.verts_complete a)

private theorem graph_edges_true_iff (exact : F.ExactPresentation) (u v : V) :
    graphOfEdgePrefix F.edges u v = true ↔ F.graph u v = true := by
  constructor
  · intro h
    exact (F.mem_edges_iff_graph_true exact u v).mp
      ((graphOfEdgePrefix_true_iff_mem F.edges u v).mp h)
  · intro h
    exact (graphOfEdgePrefix_true_iff_mem F.edges u v).mpr
      ((F.mem_edges_iff_graph_true exact u v).mpr h)

theorem componentFold_edges_sameBlock_iff_public_Reach
    (exact : F.ExactPresentation) (u v : V) :
    sameBlock (F.componentFoldPrefix F.edges).blocks u v ↔ Reach F.graph u v := by
  have hfold := componentFoldPrefix_sameBlock_iff_reach F exact F.edges
    (prefixRefl _) u v
  constructor
  · intro hsame
    exact reach_mono (fun a b h => (F.graph_edges_true_iff exact a b).1 h)
      (hfold.mp hsame)
  · intro hreach
    apply hfold.mpr
    exact reach_mono (fun a b h => (F.graph_edges_true_iff exact a b).2 h)
      hreach

/-- The executable connected-component partition derived from the graph incidence. -/
def derivedComponents (exact : F.ExactPresentation) : F.ComponentPartition :=
  let state := F.componentFoldPrefix F.edges
  let invariant := F.componentFoldPrefix_invariant exact F.edges (prefixRefl _)
  { blocks := state.blocks
    blocks_nodup := invariant.blocks_nodup
    block_nodup := invariant.block_nodup
    blocks_nonempty := invariant.blocks_nonempty
    blocks_pairwise_disjoint := invariant.blocks_pairwise_disjoint
    coverage := invariant.coverage }

private theorem representatives_mem
    (P : F.ComponentPartition) {r : V} :
    r ∈ P.representatives ↔
      ∃ block : {block // block ∈ P.blocks},
        P.blockHead (F := F) block = r := by
  unfold ComponentPartition.representatives
  constructor
  · intro h
    obtain ⟨block, _, heq⟩ := cleanMapMemForward _ _ h
    exact ⟨block, heq⟩
  · rintro ⟨block, rfl⟩
    exact cleanMapMemBackward _ _ ⟨block,
      cleanAttachMem P.blocks block, rfl⟩

theorem derivedComponents_representatives_nodup (exact : F.ExactPresentation) :
    (F.derivedComponents exact).representatives.Nodup := by
  let P := F.derivedComponents exact
  have hinjective : Function.Injective (P.blockHead (F := F)) := by
    intro left right heq
    apply Subtype.ext
    apply containingBlock_unique P.blocks P.blocks_pairwise_disjoint
      left.property (P.blockHead_mem (F := F) left) right.property
    exact Eq.mpr (congrArg (fun x => x ∈ right.val) heq)
      (P.blockHead_mem (F := F) right)
  unfold ComponentPartition.representatives
  exact cleanMapNodup _ hinjective _ (cleanAttachNodup P.blocks P.blocks_nodup)

theorem derivedComponents_sound (exact : F.ExactPresentation)
    {r s : V}
    (hr : r ∈ (F.derivedComponents exact).representatives)
    (hs : s ∈ (F.derivedComponents exact).representatives)
    (hne : r ≠ s) : ¬ Reach F.graph r s := by
  intro hreach
  let P := F.derivedComponents exact
  obtain ⟨rblock, hrhead⟩ := (representatives_mem F P).1 hr
  obtain ⟨sblock, hshead⟩ := (representatives_mem F P).1 hs
  have hsame := (componentFold_edges_sameBlock_iff_public_Reach F exact r s).2 hreach
  rcases hsame with ⟨block, hblock, hrblock', hsblock'⟩
  have hre : rblock.val = block := containingBlock_unique P.blocks
    P.blocks_pairwise_disjoint rblock.property
    (Eq.mp (congrArg (fun x => x ∈ rblock.val) hrhead)
      (P.blockHead_mem (F := F) rblock)) hblock hrblock'
  have hse : sblock.val = block := containingBlock_unique P.blocks
    P.blocks_pairwise_disjoint sblock.property
    (Eq.mp (congrArg (fun x => x ∈ sblock.val) hshead)
      (P.blockHead_mem (F := F) sblock)) hblock hsblock'
  apply hne
  have hsub : rblock = sblock := Subtype.ext (hre.trans hse.symm)
  calc
    r = P.blockHead (F := F) rblock := hrhead.symm
    _ = P.blockHead (F := F) sblock := congrArg (P.blockHead (F := F)) hsub
    _ = s := hshead

theorem derivedComponents_complete (exact : F.ExactPresentation) :
    ∀ v, ∃ r, r ∈ (F.derivedComponents exact).representatives ∧
      Reach F.graph v r := by
  intro v
  let P := F.derivedComponents exact
  obtain ⟨block, hblock, hv⟩ := (P.coverage v).mp (exact.verts_complete v)
  let attached : {block // block ∈ P.blocks} := ⟨block, hblock⟩
  refine ⟨P.blockHead (F := F) attached, ?_, ?_⟩
  · exact (representatives_mem F P).2 ⟨attached, rfl⟩
  · apply (componentFold_edges_sameBlock_iff_public_Reach F exact v
      (P.blockHead (F := F) attached)).1
    exact ⟨block, hblock, hv, P.blockHead_mem (F := F) attached⟩

theorem derivedComponents_unique (exact : F.ExactPresentation)
    {v r s : V}
    (hr : r ∈ (F.derivedComponents exact).representatives)
    (hs : s ∈ (F.derivedComponents exact).representatives)
    (hvr : Reach F.graph v r) (hvs : Reach F.graph v s) : r = s := by
  by_cases heq : r = s
  · exact heq
  · exact False.elim
      (derivedComponents_sound F exact hr hs heq (hvr.symm.trans hvs))

theorem derivedComponents_block_count (exact : F.ExactPresentation) :
    (F.derivedComponents exact).representatives.length +
      (F.componentFoldPrefix F.edges).successfulMerges = F.vcard := by
  exact Eq.trans
    (congrArg (fun n => n +
      (F.componentFoldPrefix F.edges).successfulMerges)
      (ComponentPartition.representatives_length F (F.derivedComponents exact)))
    ((F.componentFoldPrefix_invariant exact F.edges
      (prefixRefl _)).block_count)

theorem derivedComponents_successfulMerges_le_ecard
    (exact : F.ExactPresentation) :
    (F.componentFoldPrefix F.edges).successfulMerges ≤ F.ecard := by
  unfold ecard
  exact F.componentFoldPrefix_successfulMerges_le F.edges

theorem derivedComponents_spanning_bound (exact : F.ExactPresentation) :
    F.vcard ≤ F.ecard + (F.derivedComponents exact).representatives.length := by
  have hcount := F.derivedComponents_block_count exact
  have hmerge := F.derivedComponents_successfulMerges_le_ecard exact
  exact Nat.le_trans (Nat.le_of_eq hcount.symm)
    (Nat.le_trans
      (Nat.add_le_add_left hmerge
        (F.derivedComponents exact).representatives.length)
      (Nat.le_of_eq (Nat.add_comm
        (F.derivedComponents exact).representatives.length F.ecard)))

end FinGraph

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
end Obsmetrologia
