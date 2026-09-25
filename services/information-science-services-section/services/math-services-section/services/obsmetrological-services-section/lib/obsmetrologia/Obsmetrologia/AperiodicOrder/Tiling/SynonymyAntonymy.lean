import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Language.Positing.BigradedCohomology

/-!
# Synonymy & Antonymy — MLD and the negation-twist

* `…/mutually-locally-derivable/content/synonymy/synonymy.md` — synonymy `v ∼syn v'`.
  The corpus reads synonymy as both mutual-local-derivability and cohomological
  equivalence, `v ∼MLD v' ⟺ v ∼H v'`; formalized here as `AperiodicOrder.Tiling.CohEquiv`
  (equal classifying invariants), an equivalence relation whose classes are the connected
  components of the settling fiber groupoid. Coincidence with the structural MLD relation
  is the open classification (`thm:aperiodic-mld-classification`); MLD refines it (Step 3).
* `…/synonymy/content/antonymy/antonymy.md` — antonymy `v ∼ant v' :⟺ v ∼sMLD ∼(v')`: `v`
  is strong-MLD to the negation-twisted settling of `v'`. Needs *strong*-MLD because at
  the ordinary MLD level the twist collapses to synonymy (`v ∼syn ∼v` for every `v`,
  negation-invisibility — bilattice negation `∼` preserves the firing-ordinal set,
  fixing `⊥`/`⊤` on FOUR). Strong-MLD refines MLD by the firing-orbit-type `τ^𝔻`
  (truth-only / falsity-only / ⊤), on which `∼` acts non-trivially (flips truth-only ↔
  falsity-only, fixes `⊤`). Antonymy is symmetric (via `∼∼ = id`) but generically
  non-reflexive and anti-transitive.

`τ^𝔻` (the per-firing stratum of `BigradedCohomology`'s trichotomy) is the three-constructor
inductive `FiringType = truthOnly | falsityOnly | both`; the evidence-flip `flipFiring` is
the action of `∼` on it, tied to `Reading.negate` via `Reading.isTruthFiring_negate`/
`isInconsistency_negate`. `StrongSettling` bundles a `Settling` with its `tau : FiringType`;
`negTwist` applies `flipFiring` to `tau` and leaves the underlying cohomology class fixed
(`gauge_fixes_inconsistency`). `StrongMLD s s' := CohEquiv s.base s'.base ∧ s.tau = s'.tau`.
-/

namespace Obsmetrologia
namespace Semantic

open Obsmetrologia.AperiodicOrder.Tiling

/-! ## (1) Synonymy = cohomological equivalence -/

/-- `Synonymy v v' := CohEquiv v v'`. -/
def Synonymy (v v' : Settling) : Prop := CohEquiv v v'

theorem synonymy_refl (v : Settling) : Synonymy v v := cohEquiv_refl v

theorem synonymy_symm {v v' : Settling} (h : Synonymy v v') : Synonymy v' v := cohEquiv_symm h

theorem synonymy_trans {v v' v'' : Settling}
    (h : Synonymy v v') (h' : Synonymy v' v'') : Synonymy v v'' := cohEquiv_trans h h'

/-! ## (2) The firing-orbit-type refinement `τ^𝔻` -/

/-- The firing-orbit-type `τ^𝔻` of a non-Scott-continuous firing: truth-only (told `t`),
falsity-only (told `f`), or `⊤` (told both). -/
inductive FiringType where
  /-- A `t`-only firing — told true, the truth-only side of the truth/falsity axis. -/
  | truthOnly
  /-- An `f`-only firing — told false, the falsity-only side. -/
  | falsityOnly
  /-- A `⊤` firing — told both; paraconsistent, the `∼`-fixed side. -/
  | both
  deriving DecidableEq, Repr, Inhabited

namespace FiringType

/-- The three firing-types, enumerated. -/
def all : List FiringType := [truthOnly, falsityOnly, both]

/-- Every firing-type is in the enumeration. -/
theorem mem_all (τ : FiringType) : τ ∈ all := by cases τ <;> decide

/-- There are exactly three firing-types. -/
theorem card_eq_three : all.length = 3 := rfl

/-- The **evidence-flip** `ε` — the action of bilattice negation `∼` on `τ^𝔻`: it swaps
truth-only ↔ falsity-only (the `t`/`f` swap of `Reading.negate`) and **fixes** `⊤` (`⊤` is
`∼`-fixed). The faithful three-valued projection of `Reading.negate` on the firing stratum. -/
def flipFiring : FiringType → FiringType
  | truthOnly  => falsityOnly
  | falsityOnly => truthOnly
  | both       => both

@[simp] theorem flipFiring_flipFiring (τ : FiringType) : flipFiring (flipFiring τ) = τ := by
  cases τ <;> rfl

@[simp] theorem flipFiring_both : flipFiring both = both := rfl

theorem flipFiring_swaps :
    flipFiring truthOnly = falsityOnly ∧ flipFiring falsityOnly = truthOnly :=
  ⟨rfl, rfl⟩

/-- Witnesses antonymy as a refinement of synonymy. -/
theorem flipFiring_moves_truthOnly : flipFiring truthOnly ≠ truthOnly := by decide

/-- `flipFiring` agrees with `Reading.negate` on the `Reading`-level projection of firing type. -/
theorem flipFiring_is_negate :
    (Reading.negate Reading.tTop = Reading.tBot)   -- truthOnly ↦ falsityOnly
    ∧ (Reading.negate Reading.tBot = Reading.tTop) -- falsityOnly ↦ truthOnly
    ∧ (Reading.negate Reading.kTop = Reading.kTop) -- both (⊤) fixed
    ∧ flipFiring truthOnly = falsityOnly
    ∧ flipFiring falsityOnly = truthOnly
    ∧ flipFiring both = both :=
  ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

end FiringType

/-! ## (3) Strong settlings, the negation-twist, and strong-MLD -/

structure StrongSettling where
  base : Settling
  tau : FiringType

namespace StrongSettling

/-- Bilattice negation on a strong settling: fixes `base` (negation-invisibility), flips
`tau` by `flipFiring`. -/
def negTwist (s : StrongSettling) : StrongSettling :=
  ⟨s.base, FiringType.flipFiring s.tau⟩

/-- **The negation-twist fixes the underlying MLD-class** — `(∼ s).base = s.base`. This IS
negation-invisibility at the carrier level: `∼` does not move the classifying invariant. -/
@[simp] theorem negTwist_base (s : StrongSettling) : (negTwist s).base = s.base := rfl

/-- **The negation-twist acts as the evidence-flip on `τ^𝔻`.** -/
@[simp] theorem negTwist_tau (s : StrongSettling) :
    (negTwist s).tau = FiringType.flipFiring s.tau := rfl

/-- **The negation-twist is an involution** `∼∼ = id` — reusing the evidence-flip involution
(`flipFiring_flipFiring`), itself the projection of `Reading.negate_negate`. This is the
`negation-involution-on-settling-category` fact `∼∼ = id` that powers antonymy's symmetry. -/
@[simp] theorem negTwist_negTwist (s : StrongSettling) : negTwist (negTwist s) = s := by
  cases s with
  | mk base tau => simp [negTwist]

/-- **Strong-MLD** `s ∼sMLD s'` — cohomological equivalence on the underlying settlings *and*
equal firing-orbit-type `τ^𝔻`. The refinement of the cohomological reading by `τ^𝔻`
(`strong-mld-via-composed-duality`); its identification with the *structural* strong-MLD rests
on the open classification. -/
def StrongMLD (s s' : StrongSettling) : Prop :=
  CohEquiv s.base s'.base ∧ s.tau = s'.tau

/-- **Strong-MLD is reflexive.** -/
theorem strongMLD_refl (s : StrongSettling) : StrongMLD s s := ⟨cohEquiv_refl s.base, rfl⟩

/-- **Strong-MLD is symmetric.** -/
theorem strongMLD_symm {s s' : StrongSettling} (h : StrongMLD s s') : StrongMLD s' s :=
  ⟨cohEquiv_symm h.1, h.2.symm⟩

/-- **Strong-MLD is transitive.** -/
theorem strongMLD_trans {s s' s'' : StrongSettling}
    (h : StrongMLD s s') (h' : StrongMLD s' s'') : StrongMLD s s'' :=
  ⟨cohEquiv_trans h.1 h'.1, h.2.trans h'.2⟩

/-- `s ∼sMLD s' ⟺ ∼s ∼sMLD ∼s'`. -/
theorem strongMLD_negTwist {s s' : StrongSettling} :
    StrongMLD s s' ↔ StrongMLD (negTwist s) (negTwist s') := by
  constructor
  · intro h
    exact ⟨h.1, by rw [negTwist_tau, negTwist_tau, h.2]⟩
  · intro h
    refine ⟨h.1, ?_⟩
    have := h.2
    rw [negTwist_tau, negTwist_tau] at this
    -- flipFiring is injective: apply it again
    have := congrArg FiringType.flipFiring this
    simpa using this

end StrongSettling

/-! ## Synonymy is an equivalence relation, and negation is invisible to it -/

open StrongSettling in
/-- Synonymy is an equivalence relation; negation is invisible to it (`v ∼syn ∼v` for
every `v`, since `∼` preserves the firing-ordinal set). Corpus: `synonymy.md`,
`negation-invisibility.md`. -/
theorem synonymy_equiv_and_negation_invisible :
    -- (a) synonymy (= MLD) is an equivalence relation
    (∀ v : Settling, Synonymy v v)
    ∧ (∀ v v' : Settling, Synonymy v v' → Synonymy v' v)
    ∧ (∀ v v' v'' : Settling, Synonymy v v' → Synonymy v' v'' → Synonymy v v'')
    -- (b) negation-invisibility: ∼ leaves the underlying MLD-class fixed, so v ∼syn (∼v).base
    ∧ (∀ s : StrongSettling, Synonymy (negTwist s).base s.base)
    -- and the firing-ordinal/inconsistency set is preserved by negation (the mechanism)
    ∧ (∀ (cells : List PredicationCell) (v : Valuation),
        inconsistencyContent cells (negateVal v) = inconsistencyContent cells v) :=
  ⟨synonymy_refl,
   fun _ _ h => synonymy_symm h,
   fun _ _ _ h h' => synonymy_trans h h',
   fun s => synonymy_refl s.base,
   fun cells v => gauge_fixes_inconsistency cells v⟩

/-! ## Antonymy is symmetric, and a refinement of synonymy -/

open StrongSettling in
/-- **Antonymy** `s ∼ant s'` — the corpus's `antonymy.md` relation: `s` is strong-MLD to the
negation-twist of `s'`. -/
def Antonymy (s s' : StrongSettling) : Prop := StrongMLD s (negTwist s')

open StrongSettling in
/-- Antonymy is symmetric (via `∼∼ = id`); it refines synonymy since `flipFiring` acts
non-trivially on `τ^𝔻` (unlike negation on synonymy). Corpus: `antonymy.md`. -/
theorem antonymy_symmetric :
    -- symmetry of antonymy
    (∀ s s' : StrongSettling, Antonymy s s' → Antonymy s' s)
    -- the negation involution ∼∼ = id (the mechanism of symmetry)
    ∧ (∀ s : StrongSettling, negTwist (negTwist s) = s)
    -- non-triviality: ε acts non-trivially on τ^𝔻 (truth-only ↦ falsity-only ≠ truth-only),
    -- so the negation-twist generically changes the strong-MLD class — antonymy ≠ synonymy
    ∧ (FiringType.flipFiring FiringType.truthOnly ≠ FiringType.truthOnly)
    ∧ (∃ s : StrongSettling, (negTwist s).tau ≠ s.tau) := by
  refine ⟨?_, negTwist_negTwist, FiringType.flipFiring_moves_truthOnly, ?_⟩
  · -- symmetry
    intro s s' h
    -- h : StrongMLD s (negTwist s')
    -- apply negation-involution: StrongMLD (negTwist s) (negTwist (negTwist s'))
    have h2 : StrongMLD (negTwist s) (negTwist (negTwist s')) :=
      strongMLD_negTwist.mp h
    rw [negTwist_negTwist] at h2
    -- h2 : StrongMLD (negTwist s) s'  →  symm  →  StrongMLD s' (negTwist s)
    exact strongMLD_symm h2
  · -- witness: any strong settling with tau = truthOnly is moved
    exact ⟨⟨aperiodicWitness, FiringType.truthOnly⟩, by decide⟩

end Semantic
end Obsmetrologia
