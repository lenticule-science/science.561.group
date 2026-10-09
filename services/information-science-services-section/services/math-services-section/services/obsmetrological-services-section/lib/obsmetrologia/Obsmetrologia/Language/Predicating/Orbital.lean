/-!
# Orbital — generator exhaustiveness for predication reindexings

The monograph's "predication forces FOUR" claim, in its *generator
exhaustiveness* sense: reindexings of an oriented `(subject, object)` pair
that are natural in the entity type are exhausted by exactly four maps —
identity, converse, subject-projection, object-projection. Those four are
already named on `PredicationCell` in `Cell.lean` (`converse`, `subjProj`,
`objProj`, and the identity morphism); this module proves, independently of
that file's concrete cell type, that a `Sym(E)`-equivariant self-map of
`E × E` can be nothing else.

## Statement proved, and an honest correction to the given hypothesis

The task's proof sketch asks for the hypothesis "`E` has (at least) three
pairwise-distinct elements". That hypothesis is genuinely **too weak**: at
exactly three elements there is a *fifth* equivariant self-map of `E × E` —
send every off-diagonal pair to the doubled *excluded third element* — and
it is none of the four orbital maps (see `ThreeSample.thirdMap` below, and
`ThreeSample.thirdMap_equivariant` / `ThreeSample.thirdMap_not_orbital` for
the fully checked witness). The proof sketch's own construction silently
needs a *second* spare element beyond the moved point to build the
witnessing swap — i.e. a fourth element distinct from the pair and from the
point being moved — and has none to spare when `E` has only three elements
total. So `orbital_exhaustive` below is proved from **four** pairwise
distinct elements, not three; `three` alone is exactly enough for the
diagonal half of the argument (`diagonal_fixed`) but not the off-diagonal
half (`offdiag_contained`). This is a correction to the literal hypothesis
requested, made because the four-element hypothesis is what is actually
true and provable; the three-element version is refuted below rather than
asserted.

## Contents

* `Perm` — a bijection presented with both directions and both round-trip
  laws, and `Perm.mapPair`, its diagonal action on ordered pairs.
* `Equivariant` — naturality of a self-map of `E × E` under every
  permutation of `E`.
* `Perm.swap` — the transposition permutation, built from `DecidableEq`,
  with its laws proved by `if`/`dif` rewriting (`if_pos`/`if_neg`), never by
  `simp` on an `Iff` lemma.
* `transport_exists` — `Sym E` acts transitively on ordered pairs of
  distinct points, via a permutation built from at most two swaps
  (`Perm.comp`).
* `orbital_exhaustive` — the theorem.
* `id_equivariant`, `converse_equivariant`, `subjProj_equivariant`,
  `objProj_equivariant` — the four orbital maps on `E × E`, shown
  equivariant (unconditionally, for any `E`). These are the pair-level
  shadows of `PredicationCell.converse` / `subjProj` / `objProj` / identity
  from `Cell.lean`; this module does not import that file, to stay clear of
  the concurrent refactor there.
* `ThreeSample` — the boundary counterexample making the three-vs-four
  correction precise and checked, not merely asserted.

Every declaration in this file is checked to depend on no axiom (see the
`#print axioms` block at the end of the accompanying report).
-/

namespace Obsmetrologia
namespace Orbital

/-! ## Permutations and their diagonal action on pairs -/

/-- A permutation of `E`, presented as a bijection with an explicit inverse
and both round-trip laws — no bundled coercions to unfold. -/
structure Perm (E : Type) where
  /-- The forward direction. -/
  toFun : E → E
  /-- The inverse direction. -/
  invFun : E → E
  /-- The inverse undoes the forward direction. -/
  left : ∀ x, invFun (toFun x) = x
  /-- The forward direction undoes the inverse. -/
  right : ∀ x, toFun (invFun x) = x

namespace Perm

variable {E : Type}

/-- The diagonal action of a permutation on ordered pairs. -/
def mapPair (σ : Perm E) : E × E → E × E := fun p => (σ.toFun p.1, σ.toFun p.2)

/-- The identity permutation. -/
def id : Perm E where
  toFun := fun x => x
  invFun := fun x => x
  left := fun _ => rfl
  right := fun _ => rfl

/-- Composition: apply `σ` first, then `τ`. -/
def comp (σ τ : Perm E) : Perm E where
  toFun := τ.toFun ∘ σ.toFun
  invFun := σ.invFun ∘ τ.invFun
  left := fun x => by
    show σ.invFun (τ.invFun (τ.toFun (σ.toFun x))) = x
    rw [τ.left]
    exact σ.left x
  right := fun x => by
    show τ.toFun (σ.toFun (σ.invFun (τ.invFun x))) = x
    rw [σ.right]
    exact τ.right x

/-- Composition acts on pairs by acting with `σ`, then with `τ`. -/
theorem comp_mapPair (σ τ : Perm E) (p : E × E) :
    (comp σ τ).mapPair p = τ.mapPair (σ.mapPair p) := rfl

/-- The inverse permutation. -/
def inv (σ : Perm E) : Perm E where
  toFun := σ.invFun
  invFun := σ.toFun
  left := σ.right
  right := σ.left

/-- A permutation's forward direction is injective (from its left inverse). -/
theorem toFun_injective (σ : Perm E) {x y : E} (h : σ.toFun x = σ.toFun y) : x = y := by
  have hinj := congrArg σ.invFun h
  rw [σ.left, σ.left] at hinj
  exact hinj

end Perm

/-- A self-map of `E × E` is **equivariant** when it commutes with the
diagonal action of every permutation of `E`. This is naturality of a
reindexing of the `(subject, object)` pair under relabeling the entity
type. -/
def Equivariant {E : Type} (f : E × E → E × E) : Prop :=
  ∀ (σ : Perm E) (p : E × E), f (σ.mapPair p) = σ.mapPair (f p)

/-! ## The transposition -/

variable {E : Type} [DecidableEq E]

/-- The raw swapping function: exchange `a` and `b`, fix everything else. -/
def swapFun (a b x : E) : E :=
  if x = a then b else if x = b then a else x

theorem swapFun_at_left (a b : E) : swapFun a b a = b := if_pos rfl

theorem swapFun_at_right (a b : E) : swapFun a b b = a := by
  unfold swapFun
  by_cases hba : b = a
  · rw [if_pos hba, hba]
  · rw [if_neg hba, if_pos rfl]

theorem swapFun_fix {a b x : E} (hxa : x ≠ a) (hxb : x ≠ b) : swapFun a b x = x := by
  unfold swapFun
  rw [if_neg hxa, if_neg hxb]

/-- The transposition is its own inverse. Proved by `if_pos`/`if_neg`
rewriting on the two nested conditionals, never by `simp` on an `Iff`
lemma. -/
theorem swapFun_involutive (a b x : E) : swapFun a b (swapFun a b x) = x := by
  unfold swapFun
  by_cases hxa : x = a
  · rw [if_pos hxa]
    by_cases hba : b = a
    · rw [if_pos hba, hba, hxa]
    · rw [if_neg hba, if_pos rfl, hxa]
  · rw [if_neg hxa]
    by_cases hxb : x = b
    · rw [if_pos hxb]
      by_cases haa : a = a
      · rw [if_pos haa, hxb]
      · exact absurd rfl haa
    · rw [if_neg hxb, if_neg hxa, if_neg hxb]

/-- The transposition permutation: exchange `a` and `b`, fix everything
else. Self-inverse, so both directions of `Perm` are the same function. -/
def swap (a b : E) : Perm E where
  toFun := swapFun a b
  invFun := swapFun a b
  left := swapFun_involutive a b
  right := swapFun_involutive a b

theorem swap_left (a b : E) : (swap a b).toFun a = b := swapFun_at_left a b

theorem swap_right (a b : E) : (swap a b).toFun b = a := swapFun_at_right a b

theorem swap_fix {a b x : E} (hxa : x ≠ a) (hxb : x ≠ b) : (swap a b).toFun x = x :=
  swapFun_fix hxa hxb

/-- Applying `swap a s` to anything but `a` never lands back on `s`. The one
fact the two-point transport construction below needs. -/
theorem swap_apply_ne (a s b : E) (hab : a ≠ b) : s ≠ swapFun a s b := by
  unfold swapFun
  have hba : b ≠ a := fun h => hab h.symm
  rw [if_neg hba]
  by_cases hbs : b = s
  · rw [if_pos hbs]
    intro heq
    exact hab (hbs.trans heq).symm
  · rw [if_neg hbs]
    exact fun h => hbs h.symm

/-- **Two-point transport.** `Sym E` acts transitively on ordered pairs of
distinct points: any `(a,b)` with `a ≠ b` can be carried to any `(s,o)` with
`s ≠ o` by a permutation built from at most two swaps. -/
theorem transport_exists (a b s o : E) (hab : a ≠ b) (hso : s ≠ o) :
    ∃ σ : Perm E, σ.toFun a = s ∧ σ.toFun b = o := by
  refine ⟨Perm.comp (swap a s) (swap (swapFun a s b) o), ?_, ?_⟩
  · show (swap (swapFun a s b) o).toFun ((swap a s).toFun a) = s
    rw [swap_left a s]
    exact swap_fix (swap_apply_ne a s b hab) hso
  · show (swap (swapFun a s b) o).toFun ((swap a s).toFun b) = o
    show (swap (swapFun a s b) o).toFun (swapFun a s b) = o
    exact swap_left (swapFun a s b) o

/-! ## Pigeonhole helpers -/

/-- Three pairwise-distinct witnesses give, for any two elements, a third
element distinct from both. -/
theorem exists_ne_two (three : ∃ a b c : E, a ≠ b ∧ b ≠ c ∧ a ≠ c) (s x : E) :
    ∃ z : E, z ≠ s ∧ z ≠ x := by
  obtain ⟨a, b, c, hab, hbc, hac⟩ := three
  by_cases ha : a = s ∨ a = x
  · by_cases hb : b = s ∨ b = x
    · by_cases hc : c = s ∨ c = x
      · exfalso
        rcases ha with ha | ha <;> rcases hb with hb | hb <;> rcases hc with hc | hc <;>
          first
            | exact hab (ha.trans hb.symm)
            | exact hbc (hb.trans hc.symm)
            | exact hac (ha.trans hc.symm)
      · exact ⟨c, fun h => hc (Or.inl h), fun h => hc (Or.inr h)⟩
    · exact ⟨b, fun h => hb (Or.inl h), fun h => hb (Or.inr h)⟩
  · exact ⟨a, fun h => ha (Or.inl h), fun h => ha (Or.inr h)⟩

/-- Four pairwise-distinct witnesses give, for any three elements, a fourth
element distinct from all three. This is the fact that genuinely needs a
**fourth** element beyond `three`. -/
theorem exists_ne_three
    (four : ∃ a b c d : E, a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d)
    (s o x : E) : ∃ z : E, z ≠ s ∧ z ≠ o ∧ z ≠ x := by
  obtain ⟨a, b, c, d, hab, hac, had, hbc, hbd, hcd⟩ := four
  by_cases ha : a = s ∨ a = o ∨ a = x
  · by_cases hb : b = s ∨ b = o ∨ b = x
    · by_cases hc : c = s ∨ c = o ∨ c = x
      · by_cases hd : d = s ∨ d = o ∨ d = x
        · exfalso
          rcases ha with ha | ha | ha <;> rcases hb with hb | hb | hb <;>
            rcases hc with hc | hc | hc <;> rcases hd with hd | hd | hd <;>
            first
              | exact hab (ha.trans hb.symm)
              | exact hac (ha.trans hc.symm)
              | exact had (ha.trans hd.symm)
              | exact hbc (hb.trans hc.symm)
              | exact hbd (hb.trans hd.symm)
              | exact hcd (hc.trans hd.symm)
        · exact ⟨d, fun h => hd (Or.inl h), fun h => hd (Or.inr (Or.inl h)),
            fun h => hd (Or.inr (Or.inr h))⟩
      · exact ⟨c, fun h => hc (Or.inl h), fun h => hc (Or.inr (Or.inl h)),
          fun h => hc (Or.inr (Or.inr h))⟩
    · exact ⟨b, fun h => hb (Or.inl h), fun h => hb (Or.inr (Or.inl h)),
        fun h => hb (Or.inr (Or.inr h))⟩
  · exact ⟨a, fun h => ha (Or.inl h), fun h => ha (Or.inr (Or.inl h)),
      fun h => ha (Or.inr (Or.inr h))⟩

/-! ## The diagonal is always fixed (needs only `three`) -/

/-- Every equivariant `f` fixes the diagonal: `f (s,s) = (s,s)`. Only
`three` pairwise-distinct elements are needed — enough to find, for any
candidate stray coordinate, a third element to swap it away with while
fixing `s`. -/
theorem diagonal_fixed (three : ∃ a b c : E, a ≠ b ∧ b ≠ c ∧ a ≠ c)
    (f : E × E → E × E) (hf : Equivariant f) (s : E) :
    f (s, s) = (s, s) := by
  have hfix : ∀ σ : Perm E, σ.toFun s = s → f (s, s) = σ.mapPair (f (s, s)) := by
    intro σ hσ
    have hmap : σ.mapPair (s, s) = (s, s) := by
      show (σ.toFun s, σ.toFun s) = (s, s)
      rw [hσ]
    have hkey := hf σ (s, s)
    rw [hmap] at hkey
    exact hkey
  have h1 : (f (s, s)).1 = s := by
    by_cases hne : (f (s, s)).1 = s
    · exact hne
    · exfalso
      obtain ⟨z, hzs, hzx⟩ := exists_ne_two three s (f (s, s)).1
      have hσ : (swap (f (s, s)).1 z).toFun s = s := swap_fix (Ne.symm hne) (Ne.symm hzs)
      have heq := hfix (swap (f (s, s)).1 z) hσ
      have h1eq := congrArg Prod.fst heq
      change (f (s, s)).1 = (swap (f (s, s)).1 z).toFun (f (s, s)).1 at h1eq
      rw [swap_left] at h1eq
      exact hzx h1eq.symm
  have h2 : (f (s, s)).2 = s := by
    by_cases hne : (f (s, s)).2 = s
    · exact hne
    · exfalso
      obtain ⟨z, hzs, hzx⟩ := exists_ne_two three s (f (s, s)).2
      have hσ : (swap (f (s, s)).2 z).toFun s = s := swap_fix (Ne.symm hne) (Ne.symm hzs)
      have heq := hfix (swap (f (s, s)).2 z) hσ
      have h2eq := congrArg Prod.snd heq
      change (f (s, s)).2 = (swap (f (s, s)).2 z).toFun (f (s, s)).2 at h2eq
      rw [swap_left] at h2eq
      exact hzx h2eq.symm
  have hp : f (s, s) = ((f (s, s)).1, (f (s, s)).2) := rfl
  rw [h1, h2] at hp
  exact hp

/-! ## Off-diagonal values are contained in `{s,o} × {s,o}` (needs `four`) -/

/-- Every equivariant `f` sends an off-diagonal pair `(s,o)` to a pair whose
two coordinates each lie in `{s,o}`. This step genuinely needs **four**
pairwise-distinct elements: to rule out a stray coordinate `x ∉ {s,o}` we
swap it away with some `z ∉ {s,o,x}`, a *fourth* element beyond `s`, `o`,
and the stray `x` itself. -/
theorem offdiag_contained
    (four : ∃ a b c d : E, a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d)
    (f : E × E → E × E) (hf : Equivariant f) (s o : E) (_hso : s ≠ o) :
    ((f (s, o)).1 = s ∨ (f (s, o)).1 = o) ∧ ((f (s, o)).2 = s ∨ (f (s, o)).2 = o) := by
  have hfix : ∀ σ : Perm E, σ.toFun s = s → σ.toFun o = o →
      f (s, o) = σ.mapPair (f (s, o)) := by
    intro σ hs ho
    have hmap : σ.mapPair (s, o) = (s, o) := by
      show (σ.toFun s, σ.toFun o) = (s, o)
      rw [hs, ho]
    have hkey := hf σ (s, o)
    rw [hmap] at hkey
    exact hkey
  refine ⟨?_, ?_⟩
  · by_cases h1 : (f (s, o)).1 = s
    · exact Or.inl h1
    · by_cases h2 : (f (s, o)).1 = o
      · exact Or.inr h2
      · exfalso
        obtain ⟨z, hzs, hzo, hzx⟩ := exists_ne_three four s o (f (s, o)).1
        have hσs : (swap (f (s, o)).1 z).toFun s = s := swap_fix (Ne.symm h1) (Ne.symm hzs)
        have hσo : (swap (f (s, o)).1 z).toFun o = o := swap_fix (Ne.symm h2) (Ne.symm hzo)
        have heq := hfix (swap (f (s, o)).1 z) hσs hσo
        have h1eq := congrArg Prod.fst heq
        change (f (s, o)).1 = (swap (f (s, o)).1 z).toFun (f (s, o)).1 at h1eq
        rw [swap_left] at h1eq
        exact hzx h1eq.symm
  · by_cases h1 : (f (s, o)).2 = s
    · exact Or.inl h1
    · by_cases h2 : (f (s, o)).2 = o
      · exact Or.inr h2
      · exfalso
        obtain ⟨z, hzs, hzo, hzx⟩ := exists_ne_three four s o (f (s, o)).2
        have hσs : (swap (f (s, o)).2 z).toFun s = s := swap_fix (Ne.symm h1) (Ne.symm hzs)
        have hσo : (swap (f (s, o)).2 z).toFun o = o := swap_fix (Ne.symm h2) (Ne.symm hzo)
        have heq := hfix (swap (f (s, o)).2 z) hσs hσo
        have h2eq := congrArg Prod.snd heq
        change (f (s, o)).2 = (swap (f (s, o)).2 z).toFun (f (s, o)).2 at h2eq
        rw [swap_left] at h2eq
        exact hzx h2eq.symm

/-- The off-diagonal value is exactly one of the four possible pairs built
from `{s,o}`. -/
theorem offdiag_four
    (four : ∃ a b c d : E, a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d)
    (f : E × E → E × E) (hf : Equivariant f) (s o : E) (hso : s ≠ o) :
    f (s, o) = (s, s) ∨ f (s, o) = (s, o) ∨ f (s, o) = (o, s) ∨ f (s, o) = (o, o) := by
  obtain ⟨h1, h2⟩ := offdiag_contained four f hf s o hso
  have hp : f (s, o) = ((f (s, o)).1, (f (s, o)).2) := rfl
  rcases h1 with h1 | h1 <;> rcases h2 with h2 | h2
  · exact Or.inl (by rw [hp, h1, h2])
  · exact Or.inr (Or.inl (by rw [hp, h1, h2]))
  · exact Or.inr (Or.inr (Or.inl (by rw [hp, h1, h2])))
  · exact Or.inr (Or.inr (Or.inr (by rw [hp, h1, h2])))

/-! ## Generator exhaustiveness -/

/-- **Generator exhaustiveness.** For an entity type `E` with at least
**four** pairwise-distinct elements, every equivariant self-map of `E × E`
is one of the four orbital maps: identity, converse, subject-projection,
object-projection.

The hypothesis is `four`, not the `three` requested by the proof sketch:
see the module docstring and `ThreeSample.thirdMap_equivariant` for why
`three` is genuinely insufficient (a fifth equivariant map exists at
exactly three elements). -/
theorem orbital_exhaustive
    (four : ∃ a b c d : E, a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d)
    (f : E × E → E × E) (hf : Equivariant f) :
    (∀ p, f p = p) ∨ (∀ p, f p = (p.2, p.1)) ∨ (∀ p, f p = (p.1, p.1)) ∨
      (∀ p, f p = (p.2, p.2)) := by
  obtain ⟨a, b, c, d, hab, hac, had, hbc, hbd, hcd⟩ := four
  have three : ∃ x y z : E, x ≠ y ∧ y ≠ z ∧ x ≠ z := ⟨a, b, c, hab, hbc, hac⟩
  have four' : ∃ x y z w : E, x ≠ y ∧ x ≠ z ∧ x ≠ w ∧ y ≠ z ∧ y ≠ w ∧ z ≠ w :=
    ⟨a, b, c, d, hab, hac, had, hbc, hbd, hcd⟩
  have hbase := offdiag_four four' f hf a b hab
  rcases hbase with hbase | hbase | hbase | hbase
  · -- f (a,b) = (a,a) : subject-projection pattern
    refine Or.inr (Or.inr (Or.inl ?_))
    intro p
    obtain ⟨s, o⟩ := p
    by_cases hso : s = o
    · subst hso; exact diagonal_fixed three f hf s
    · obtain ⟨σ, hσa, hσb⟩ := transport_exists a b s o hab hso
      have hmap : σ.mapPair (a, b) = (s, o) := by
        show (σ.toFun a, σ.toFun b) = (s, o)
        rw [hσa, hσb]
      have hkey := hf σ (a, b)
      rw [hmap, hbase] at hkey
      show f (s, o) = (s, s)
      rw [hkey]
      show (σ.toFun a, σ.toFun a) = (s, s)
      rw [hσa]
  · -- f (a,b) = (a,b) : identity pattern
    refine Or.inl ?_
    intro p
    obtain ⟨s, o⟩ := p
    by_cases hso : s = o
    · subst hso; exact diagonal_fixed three f hf s
    · obtain ⟨σ, hσa, hσb⟩ := transport_exists a b s o hab hso
      have hmap : σ.mapPair (a, b) = (s, o) := by
        show (σ.toFun a, σ.toFun b) = (s, o)
        rw [hσa, hσb]
      have hkey := hf σ (a, b)
      rw [hmap, hbase] at hkey
      show f (s, o) = (s, o)
      rw [hkey]
      show (σ.toFun a, σ.toFun b) = (s, o)
      rw [hσa, hσb]
  · -- f (a,b) = (b,a) : converse pattern
    refine Or.inr (Or.inl ?_)
    intro p
    obtain ⟨s, o⟩ := p
    by_cases hso : s = o
    · subst hso; exact diagonal_fixed three f hf s
    · obtain ⟨σ, hσa, hσb⟩ := transport_exists a b s o hab hso
      have hmap : σ.mapPair (a, b) = (s, o) := by
        show (σ.toFun a, σ.toFun b) = (s, o)
        rw [hσa, hσb]
      have hkey := hf σ (a, b)
      rw [hmap, hbase] at hkey
      show f (s, o) = (o, s)
      rw [hkey]
      show (σ.toFun b, σ.toFun a) = (o, s)
      rw [hσa, hσb]
  · -- f (a,b) = (b,b) : object-projection pattern
    refine Or.inr (Or.inr (Or.inr ?_))
    intro p
    obtain ⟨s, o⟩ := p
    by_cases hso : s = o
    · subst hso; exact diagonal_fixed three f hf s
    · obtain ⟨σ, hσa, hσb⟩ := transport_exists a b s o hab hso
      have hmap : σ.mapPair (a, b) = (s, o) := by
        show (σ.toFun a, σ.toFun b) = (s, o)
        rw [hσa, hσb]
      have hkey := hf σ (a, b)
      rw [hmap, hbase] at hkey
      show f (s, o) = (o, o)
      rw [hkey]
      show (σ.toFun b, σ.toFun b) = (o, o)
      rw [hσb]

/-! ## The four generators, on the pair level

Pair-level shadows of `PredicationCell.converse` / `subjProj` / `objProj`
and the identity morphism from `Cell.lean`, shown equivariant. These hold
for **any** `E` — no distinctness hypothesis at all — since each is built
from `Perm.mapPair` termwise. -/

theorem id_equivariant {E : Type} : Equivariant (fun p : E × E => p) := by
  intro σ p; rfl

theorem converse_equivariant {E : Type} : Equivariant (fun p : E × E => (p.2, p.1)) := by
  intro σ p; rfl

theorem subjProj_equivariant {E : Type} : Equivariant (fun p : E × E => (p.1, p.1)) := by
  intro σ p; rfl

theorem objProj_equivariant {E : Type} : Equivariant (fun p : E × E => (p.2, p.2)) := by
  intro σ p; rfl

/-! ## Three is not enough: a fifth equivariant map at exactly three elements

The witness making the module docstring's correction precise: at exactly
three elements, the map sending every off-diagonal pair to the doubled
*excluded third element* is equivariant, and is none of the four orbital
maps. So `three` alone cannot prove `orbital_exhaustive`; `four` is not a
proof artifact, it is load-bearing. -/

/-- A bespoke three-element type: the minimal witness that `three` is not
enough. -/
inductive ThreeSample where
  | a | b | c
  deriving DecidableEq, Repr, Inhabited

namespace ThreeSample

/-- The element of `{a,b,c}` excluded by a distinct pair; junk on the
diagonal (unused there). -/
def third : ThreeSample → ThreeSample → ThreeSample
  | .a, .b => .c | .b, .a => .c
  | .a, .c => .b | .c, .a => .b
  | .b, .c => .a | .c, .b => .a
  | .a, .a => .a | .b, .b => .b | .c, .c => .c

theorem third_spec (x y : ThreeSample) (h : x ≠ y) : third x y ≠ x ∧ third x y ≠ y := by
  cases x <;> cases y <;> first | exact absurd rfl h | decide

theorem third_unique (x y z : ThreeSample) (hxy : x ≠ y) (hzx : z ≠ x) (hzy : z ≠ y) :
    z = third x y := by
  cases x <;> cases y <;> cases z <;>
    first
      | exact absurd rfl hxy
      | exact absurd rfl hzx
      | exact absurd rfl hzy
      | decide

/-- The fifth map: fix the diagonal, send every off-diagonal pair to the
doubled excluded third element. -/
def thirdMap (p : ThreeSample × ThreeSample) : ThreeSample × ThreeSample :=
  if p.1 = p.2 then (p.1, p.1) else (third p.1 p.2, third p.1 p.2)

/-- `thirdMap` is equivariant under every permutation of `ThreeSample`. -/
theorem thirdMap_equivariant : Equivariant thirdMap := by
  intro σ p
  obtain ⟨x, y⟩ := p
  by_cases hxy : x = y
  · subst hxy
    show thirdMap (σ.toFun x, σ.toFun x) =
      (σ.toFun (thirdMap (x, x)).1, σ.toFun (thirdMap (x, x)).2)
    unfold thirdMap
    rw [if_pos rfl, if_pos rfl]
  · show thirdMap (σ.toFun x, σ.toFun y) =
      (σ.toFun (thirdMap (x, y)).1, σ.toFun (thirdMap (x, y)).2)
    unfold thirdMap
    rw [if_neg hxy]
    have hxy' : σ.toFun x ≠ σ.toFun y := fun h => hxy (σ.toFun_injective h)
    rw [if_neg hxy']
    have hzx : σ.toFun (third x y) ≠ σ.toFun x :=
      fun h => (third_spec x y hxy).1 (σ.toFun_injective h)
    have hzy : σ.toFun (third x y) ≠ σ.toFun y :=
      fun h => (third_spec x y hxy).2 (σ.toFun_injective h)
    have hchar := third_unique (σ.toFun x) (σ.toFun y) (σ.toFun (third x y)) hxy' hzx hzy
    rw [← hchar]

/-- `thirdMap` disagrees with all four orbital maps already at `(a,b)`, so
the four-way disjunction of `orbital_exhaustive` genuinely needs `four`, not
merely `three`. -/
theorem thirdMap_not_orbital :
    ¬ ((∀ p, thirdMap p = p) ∨ (∀ p, thirdMap p = (p.2, p.1)) ∨
        (∀ p, thirdMap p = (p.1, p.1)) ∨ (∀ p, thirdMap p = (p.2, p.2))) := by
  intro h
  have hab : thirdMap (a, b) = (c, c) := rfl
  rcases h with h | h | h | h
  · rw [h (a, b)] at hab; exact absurd hab (by decide)
  · rw [h (a, b)] at hab; exact absurd hab (by decide)
  · rw [h (a, b)] at hab; exact absurd hab (by decide)
  · rw [h (a, b)] at hab; exact absurd hab (by decide)

end ThreeSample

end Orbital
end Obsmetrologia
