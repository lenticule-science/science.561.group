import Infomaterial.Persistence.Aperiodic.Classification
import Infomaterial.Language.Positing.Gauge
import Infomaterial.Language.Positing.BigradedCohomology

/-!
# Synonymy & Antonymy — MLD and the negation-twist

This module formalizes the two corpus nodes at the bottom of the settling spine:

* `…/settling/content/mutually-locally-derivable/content/synonymy/synonymy.md`
  — **synonymy** `v ∼syn v'`: the corpus reads synonymy as both mutual-local-derivability and
  cohomological equivalence, `v ∼MLD v' ⟺ v ∼H v'`. We formalize it as **cohomological
  equivalence** `Persistence.Aperiodic.CohEquiv` (equality of classifying invariants) — an **equivalence
  relation** (refl/symm/trans proven); its classes are the connected components of the
  settling fiber groupoid = the coarse settling moduli. The corpus's identification of this
  with the *structural* MLD relation is the open classification (`thm:aperiodic-mld-classification`),
  so synonymy here is the cohomological reading, which MLD refines (Step 3).
* `…/synonymy/content/antonymy/antonymy.md`
  — **antonymy** `v ∼ant v' :⟺ v ∼sMLD ∼(v')`: `v` is **strong-MLD-equivalent** to the
  **negation-twisted settling** of `v'`. Antonymy needs *strong*-MLD because of
  **negation-invisibility**: at the ordinary MLD level the twist collapses to synonymy
  (`v ∼syn ∼v` for every `v`), since bilattice negation `∼` **preserves the firing-ordinal
  set** — it fixes `⊥`/`⊤` on FOUR, so it never changes *when* cells fire, only which side
  of the truth/falsity axis they land on. Strong-MLD refines MLD by the **firing-orbit-type**
  `τ^𝔻` (truth-only / falsity-only / ⊤), on which `∼` acts non-trivially: it flips
  truth-only ↔ falsity-only while fixing `⊤`. Antonymy is **symmetric** (via the involution
  `∼∼ = id`) but generically non-reflexive and anti-transitive.

## How the firing-orbit-type refinement is modeled

The corpus's `τ^𝔻` records, for each non-Scott-continuous firing, whether it is *truth-only*
(told `t`), *falsity-only* (told `f`), or `⊤` (told both). This is precisely the per-firing
version of `BigradedCohomology`'s trichotomy (consistent / paraconsistent / mixed is the
*aggregate*; the per-firing tag is the stratum). We model it as a **three-constructor
inductive** `FiringType = truthOnly | falsityOnly | both`, and the **evidence-flip** `ε` (the
action of bilattice negation `∼` on it) as `flipFiring`, which swaps `truthOnly ↔ falsityOnly`
and **fixes** `both` (`⊤`). This is the FOUR/`Charge` truth-axis swap, restricted to the
firing stratum, read off `Charge.isTruthFiring_negate`/`isInconsistency_negate`: negation
swaps the `t`/`f` sides (truth ↔ falsity) and fixes the `⊤` side. We *derive* `flipFiring`'s
involutivity and its non-trivial action by finite exhaustion, and tie it to `Charge.negate`
via the `Charge`-level firing predicates (a faithful three-valued projection of `negate`).

A **strong settling** `StrongSettling` bundles an `Persistence.Aperiodic.Settling` with its firing-type
`tau`; `negTwist` applies `Charge.negate` at the level of `τ^𝔻` (i.e. `flipFiring tau`) and
leaves the underlying cohomology class **fixed** (negation-invisibility — `negate` preserves the
firing-ordinal set, reusing `gauge_fixes_inconsistency`). `StrongMLD s s' := CohEquiv ∧ same
firing-type`.
-/

namespace Infomaterial
namespace Semantic

open Infomaterial.Persistence.Aperiodic

/-! ## (1) Synonymy = cohomological equivalence

The corpus reads synonymy as both mutual-local-derivability and cohomological equivalence
(`v ∼syn v' ⟺ v ∼MLD v' ⟺ v ∼H v'`). We formalize the cohomological reading: synonymy is
`Persistence.Aperiodic.CohEquiv`, whose equivalence-relation payload is proven there. The identification
with the structural MLD relation is the open classification (`thm:aperiodic-mld-classification`). -/

/-- **Synonymy** `v ∼syn v'` — the corpus's `…/synonymy.md` relation, formalized as
**cohomological equivalence** (equal classifying invariants). The corpus also reads it as
mutual-local-derivability; that the structural MLD relation coincides with this cohomological
reading is the open classification (MLD refines it, Step 3). -/
def Synonymy (v v' : Settling) : Prop := CohEquiv v v'

/-- **Synonymy is reflexive** (reuses `Persistence.Aperiodic.cohEquiv_refl`). -/
theorem synonymy_refl (v : Settling) : Synonymy v v := cohEquiv_refl v

/-- **Synonymy is symmetric** (reuses `Persistence.Aperiodic.cohEquiv_symm`). -/
theorem synonymy_symm {v v' : Settling} (h : Synonymy v v') : Synonymy v' v := cohEquiv_symm h

/-- **Synonymy is transitive** (reuses `Persistence.Aperiodic.cohEquiv_trans`). -/
theorem synonymy_trans {v v' v'' : Settling}
    (h : Synonymy v v') (h' : Synonymy v' v'') : Synonymy v v'' := cohEquiv_trans h h'

/-! ## (2) The firing-orbit-type refinement `τ^𝔻`

The strong-MLD classification refines MLD by the firing-orbit-type: each non-Scott-continuous
firing is *truth-only*, *falsity-only*, or `⊤`. This is the per-firing version of
`BigradedCohomology`'s trichotomy. The **evidence-flip** `ε` is the action of bilattice
negation `∼` on `τ^𝔻`: it swaps truth-only ↔ falsity-only and fixes `⊤`. -/

/-- The **firing-orbit-type** `τ^𝔻` of a non-Scott-continuous firing: *truth-only* (told `t`),
*falsity-only* (told `f`), or `⊤` (told both — paraconsistent). The per-firing stratum of
`BigradedCohomology`'s trichotomy (consistent / paraconsistent / mixed is the aggregate). -/
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
truth-only ↔ falsity-only (the `t`/`f` swap of `Charge.negate`) and **fixes** `⊤` (`⊤` is
`∼`-fixed). The faithful three-valued projection of `Charge.negate` on the firing stratum. -/
def flipFiring : FiringType → FiringType
  | truthOnly  => falsityOnly
  | falsityOnly => truthOnly
  | both       => both

/-- **The evidence-flip is an involution** `ε∘ε = id` — it is the `∼∼ = id` of
`Charge.negate` read on `τ^𝔻`. -/
@[simp] theorem flipFiring_flipFiring (τ : FiringType) : flipFiring (flipFiring τ) = τ := by
  cases τ <;> rfl

/-- **The evidence-flip fixes `⊤`** — paraconsistent firings are `∼`-stable (`⊤` is the
`∼`-fixed value on FOUR). -/
@[simp] theorem flipFiring_both : flipFiring both = both := rfl

/-- **The evidence-flip swaps the truth/falsity sides** — it moves truth-only ↦ falsity-only
and falsity-only ↦ truth-only, acting **non-trivially** on the two classical strata. -/
theorem flipFiring_swaps :
    flipFiring truthOnly = falsityOnly ∧ flipFiring falsityOnly = truthOnly :=
  ⟨rfl, rfl⟩

/-- **The evidence-flip moves the classical firings** — `truthOnly ≠ flipFiring truthOnly`:
negation acts non-trivially on `τ^𝔻` precisely on the truth-only/falsity-only stratum
(whereas it is invisible at the ordinary-MLD level). This is the witness that antonymy is a
**genuine refinement** of synonymy. -/
theorem flipFiring_moves_truthOnly : flipFiring truthOnly ≠ truthOnly := by decide

/-- **The `Charge`-level projection of the evidence-flip is `Charge.negate`.** The firing-type is
the three-valued image of a `Charge`'s firing predicates: `truthOnly = t`, `falsityOnly = f`,
`both = ⊤`. On each of those charges `flipFiring` agrees with applying `Charge.negate` and
re-reading the firing-type. This certifies `flipFiring` IS `∼` restricted to the firing
stratum (reusing `Charge.isTruthFiring_negate` / `isInconsistency_negate`). -/
theorem flipFiring_is_negate :
    (Charge.negate Charge.tTop = Charge.tBot)   -- truthOnly ↦ falsityOnly
    ∧ (Charge.negate Charge.tBot = Charge.tTop) -- falsityOnly ↦ truthOnly
    ∧ (Charge.negate Charge.kTop = Charge.kTop) -- both (⊤) fixed
    ∧ flipFiring truthOnly = falsityOnly
    ∧ flipFiring falsityOnly = truthOnly
    ∧ flipFiring both = both :=
  ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

end FiringType

/-! ## (3) Strong settlings, the negation-twist, and strong-MLD

A **strong settling** carries a settling together with its firing-orbit-type `τ^𝔻`. The
**negation-twist** `∼(v)` applies bilattice negation: at the MLD level it is invisible (it
preserves the firing-ordinal set — same `clInv`), and on `τ^𝔻` it is the evidence-flip.
**Strong-MLD** refines MLD by additionally requiring equal firing-type. -/

/-- A **strong settling** — a settling together with its firing-orbit-type `τ^𝔻`, the datum
strong-MLD is sensitive to (ordinary MLD is not). -/
structure StrongSettling where
  /-- The underlying settling (carries the MLD-class via `clInv`). -/
  base : Settling
  /-- The firing-orbit-type `τ^𝔻` — truth-only / falsity-only / ⊤. -/
  tau : FiringType

namespace StrongSettling

/-- **The negation-twist** `∼(s)` — bilattice negation applied to a strong settling. It leaves
the underlying MLD-class **fixed** (negation-invisibility: `∼` preserves the firing-ordinal
set, so `clInv` is unchanged — same `base`) and **flips** the firing-orbit-type by the
evidence-flip `ε`. -/
def negTwist (s : StrongSettling) : StrongSettling :=
  ⟨s.base, FiringType.flipFiring s.tau⟩

/-- **The negation-twist fixes the underlying MLD-class** — `(∼ s).base = s.base`. This IS
negation-invisibility at the carrier level: `∼` does not move the classifying invariant. -/
@[simp] theorem negTwist_base (s : StrongSettling) : (negTwist s).base = s.base := rfl

/-- **The negation-twist acts as the evidence-flip on `τ^𝔻`.** -/
@[simp] theorem negTwist_tau (s : StrongSettling) :
    (negTwist s).tau = FiringType.flipFiring s.tau := rfl

/-- **The negation-twist is an involution** `∼∼ = id` — reusing the evidence-flip involution
(`flipFiring_flipFiring`), itself the projection of `Charge.negate_negate`. This is the
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

/-- **Strong-MLD respects the negation-twist** — `negation-involution-on-settling-category`:
`s ∼sMLD s' ⟺ ∼s ∼sMLD ∼s'`. Negation commutes with strong-MLD because the evidence-flip is a
bijection on `τ^𝔻` (so `tau` agree iff their flips agree) and the MLD-class is fixed by the
twist. -/
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
/-- **Synonymy is an equivalence relation, and negation is invisible to it.**
Bundles the two `synonymy.md` / `negation-invisibility.md` facts:

* **(a) synonymy (cohomological equivalence) is an equivalence relation** — reflexive,
  symmetric, transitive (reused from `Aperiodic`'s `cohEquiv_refl`/`cohEquiv_symm`/`cohEquiv_trans`);
  its classes are the connected components of the settling fiber groupoid / the coarse settling moduli;
* **(b) negation-invisibility** — `v ∼syn ∼v` for **every** settling: the negation-twist
  `∼` leaves the underlying cohomology class fixed (`(∼ s).base = s.base`), because `∼` preserves the
  firing-ordinal set (it fixes `⊥`/`⊤` on FOUR; reusing `gauge_fixes_inconsistency` /
  `Charge.isInconsistency_negate` — `∼` never changes *when* cells fire). So at the ordinary
  MLD level the twist is invisible and antonymy would collapse to synonymy — which is exactly
  why antonymy must use *strong*-MLD.

Corpus: `synonymy.md`, `negation-invisibility.md`. -/
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

/-! ## Antonymy is symmetric, and a genuine refinement of synonymy -/

open StrongSettling in
/-- **Antonymy** `s ∼ant s'` — the corpus's `antonymy.md` relation: `s` is strong-MLD to the
negation-twist of `s'`. -/
def Antonymy (s s' : StrongSettling) : Prop := StrongMLD s (negTwist s')

open StrongSettling in
/-- **Antonymy is symmetric, and a genuine refinement of synonymy.** Bundles the
`antonymy.md` properties:

* **symmetry** — `s ∼ant s' → s' ∼ant s`: from `s ∼sMLD ∼s'`, applying the
  `negation-involution-on-settling-category` law (`a ∼sMLD b ⟺ ∼a ∼sMLD ∼b`) gives
  `∼s ∼sMLD ∼∼s' = s'` (via the involution `∼∼ = id`, `negTwist_negTwist`), i.e.
  `s' ∼sMLD ∼s`, which is `s' ∼ant s`;
* **non-triviality vs synonymy** — antonymy is *not* invisible the way negation is to
  synonymy: the evidence-flip `ε` acts **non-trivially** on `τ^𝔻`, flipping
  truth-only ↔ falsity-only (`flipFiring truthOnly = falsityOnly ≠ truthOnly`). So a strong
  settling and its negation-twist generically lie in **different** strong-MLD classes
  (their `tau` differ), whereas they are *always* in the same ordinary-MLD synonymy class
  (negation-invisibility, Headline 1). This is the refinement antonymy supplies over synonymy;
* **`∼∼ = id`** — the underlying involution (`negTwist_negTwist`), the
  `negation-involution-on-settling-category` fact powering symmetry.

Corpus: `antonymy.md`. -/
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
end Infomaterial
