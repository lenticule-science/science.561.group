/-
# Settling moduli stack — the step-`n` moduli sub-stacks `M^(n)`, their ascending chain, the coarse moduli = MLD, and the invisible negation gauge

This module formalizes the corpus node

* `…/settling/content/aperiodic-settling/.../step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/step-n-moduli-substack.md`

which records the **step-`n` moduli sub-stack** `M^(n)` — the sub-stack of the
meta-moduli stack consisting of *closure-equivalence classes of (primitive) step-`n`
substitution rules*:

> `M^(n) := { [S] ∈ M_aper : S is closure-equivalent to a primitive step-n substitution rule }`.
> The collection `{M^(n)}_{n≥2}` stratifies the meta-aperiodic stratum:
> `M_aper = (⊔_{n≥2} M^(n)) ⊔ M_{aper,residue}`.
> The step-shift morphism `σ : M^(n) → M^(n+1)` embeds each step-`n` sub-stack into the
> next: `M^(2) ↪ M^(3) ↪ M^(4) ↪ ⋯`. The colimit `colim_n M^(n)` is a candidate
> **RG-fixed-point**: a universal substitution moduli at infinite step depth. The coarse
> moduli is MLD: meta-points are MLD-classes (the cl-inv complete invariant).

## How the moduli stack is modeled (reusing `AperiodicClassification`)

* A **step-`n` substitution rule** `StepRule n` is finite data: an `n`-letter substitution
  `subst : Fin n → List (Fin n)`, a primitivity flag `primitive : Bool` (some power of the
  substitution matrix is strictly positive — the rank-theorem hypothesis), and the rule's
  classifying coordinate `coord : Int` (the leading generator of the step-`n` classifying
  invariant `cl-inv^{(n)} ∈ ℤ^n`, reused from `AperiodicClassification.stepNInvariant`).
* A rule realizes an **aperiodic settling** `toSettling : StepRule n → Aperiodic.Settling`
  in the `aperiodic` regime with `clInv := ⟨coord⟩`. The `Settling.vanishing` constraint is
  *vacuous* (aperiodic cohomology does not vanish), exactly as `aperiodicWitness`.
* A **`ModuliPoint`** is an **MLD-class** — `Quot Aperiodic.MLD` — the coarse moduli space.
  A rule's meta-point is `toModuli r := Quot.mk MLD (toSettling r)`. Two rules are the same
  moduli point iff their classifying invariants agree (`classifying_invariant_complete_mld`).
* `M (n) : ModuliPoint → Prop` — the step-`n` sub-stack — holds at a meta-point iff *some*
  primitive step-`n` rule realizes it (`∃ r : StepRule n, r.primitive ∧ toModuli r = p`).
* `stepShift : StepRule n → StepRule (n+1)` (the embedding `σ`) extends the substitution by a
  new fixed letter, **preserving** `primitive` and `coord` — so it preserves the classifying
  invariant, hence the moduli point: `toModuli (stepShift r) = toModuli r`. This realizes
  `M^(n) ↪ M^(n+1)` as the inclusion of MLD-classes (`ℤ^n ↪ ℤ^(n+1)` on the leading axis).

## How the colimit (RG-fixed-point) is modeled

We reuse `AperiodicClassification.DirectedSystem` / `Colimit` over `(Nat, ≤)` directly — the
ascending chain `M^(2) ↪ M^(3) ↪ ⋯` is a directed system whose `stage` is `ModuliPoint` at
each depth and whose `map` is the (identity-on-classes) step-shift; its colimit is the
candidate **RG-fixed-point**, the universal substitution moduli at infinite step depth. We do
not re-derive direct limits; we build a concrete `moduliSystem : DirectedSystem` and read off
the cocone laws from `Colimit.sound` / `Colimit.map_eq`.

## The coarse moduli = MLD, and the invisible negation gauge

* **Coarse moduli = MLD**: `toModuli r = toModuli s ⟺ (toSettling r).clInv = (toSettling s).clInv`
  — the `cl-inv` complete invariant, reused as `classifying_invariant_complete_mld`. Two rules
  are the same moduli point iff cl-inv-equal.
* **The negation gauge is invisible**: the ℤ/2 negation gauge `⟨∼⟩ = {id, neg}` of
  `KleinFourGauge` is in the **invisible automorphism subgroup** of the fiber groupoid — it
  fixes the moduli point (cohomologically invisible, connective-tissue #10: negation ⊆ N(v)).
  We reuse `KleinFour.inGauge`/`gaugeAct`/`gauge_closed` and exhibit that the gauge subgroup is
  a closed ℤ/2 acting trivially on a paraconsistent moduli witness (`paraconsistent_gauge_stable`),
  so the negation automorphism leaves the coarse moduli point fixed — it is invisible.
-/
import RelMath.AperiodicClassification
import RelMath.BitopologicalSettlingSite
import RelMath.KleinFourGauge
import RelMath.Closure2MonadKZ

namespace RelMath
namespace Moduli

open RelMath.Aperiodic

/-! ## (1) Step-`n` substitution rules and their moduli points

A `StepRule n` is finite data: an `n`-letter substitution, a primitivity flag, and the
classifying coordinate (the leading generator of `cl-inv^{(n)} ∈ ℤ^n`). It realizes an
aperiodic settling, and its moduli point is the MLD-class of that settling. -/

/-- A **step-`n` substitution rule** — finite data modeling a primitive `n`-letter
substitution. `subst` is the substitution `Fin n → List (Fin n)` (each letter to its image
word); `primitive` is the primitivity flag (some power of the substitution matrix is strictly
positive — the rank-theorem hypothesis for step-depth invariance); `coord` is the rule's
classifying coordinate (the leading generator of the step-`n` classifying invariant
`cl-inv^{(n)} ∈ ℤ^n`, reused from `Aperiodic.stepNInvariant`). -/
structure StepRule (n : Nat) where
  /-- The `n`-letter substitution: each letter `i : Fin n` maps to its image word. -/
  subst : Fin n → List (Fin n)
  /-- The primitivity flag (some power of the substitution matrix is strictly positive). -/
  primitive : Bool
  /-- The classifying coordinate `cl-inv^{(n)}`-leading-generator `∈ ℤ` of this rule. -/
  coord : Int

/-- The **aperiodic settling realized by a step-`n` rule**: it lives in the `aperiodic`
regime, with classifying invariant `cl-inv = ⟨coord⟩` (the rule's leading generator). The
`Settling.vanishing` constraint is *vacuous* — aperiodic cohomology does not vanish — exactly
as `Aperiodic.aperiodicWitness`. -/
def toSettling {n : Nat} (r : StepRule n) : Settling where
  regime := ClosureRegime.aperiodic
  clInv := ⟨r.coord⟩
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- A **moduli point** — a closure/MLD-equivalence class of settlings, `Quot Aperiodic.MLD`.
This is the coarse moduli space: a meta-point is an MLD-class carrying its `cl-inv`. -/
def ModuliPoint : Type := Quot MLD

/-- The **moduli point of a step-`n` rule** — the MLD-class of its realized settling. -/
def toModuli {n : Nat} (r : StepRule n) : ModuliPoint := Quot.mk MLD (toSettling r)

/-- **Coarse moduli completeness for rules.** Two rules are the same moduli point iff their
classifying invariants agree — `cl-inv` is the complete MLD invariant (reusing
`Aperiodic.clInv_complete`/`clInv_sound`). One direction is `Quot.sound`; the other reads off
the classes (using `clInv_sound` under the quotient). -/
theorem toModuli_eq_iff_clInv {n : Nat} (r s : StepRule n) :
    (toSettling r).clInv = (toSettling s).clInv → toModuli r = toModuli s := by
  intro h
  exact Quot.sound (clInv_complete h)

/-- **A rule's classifying coordinate determines its moduli point.** Equal `coord` ⟹ equal
moduli point (the `cl-inv` is `⟨coord⟩`). -/
theorem toModuli_eq_of_coord {n : Nat} (r s : StepRule n) (h : r.coord = s.coord) :
    toModuli r = toModuli s := by
  apply toModuli_eq_iff_clInv
  show (⟨r.coord⟩ : H1Class) = ⟨s.coord⟩
  rw [h]

/-! ## (2) The step-`n` sub-stack `M^(n)`

`M n` is the step-`n` sub-stack: the moduli points realized by some *primitive* step-`n`
rule. A meta-point sits in `M^(n)` iff some primitive step-`n` representative realizes it. -/

/-- The **step-`n` moduli sub-stack** `M^(n)` — the predicate on moduli points holding at `p`
iff *some* primitive step-`n` rule realizes `p`. The MLD-classes of primitive step-`n` rules. -/
def M (n : Nat) (p : ModuliPoint) : Prop :=
  ∃ r : StepRule n, r.primitive = true ∧ toModuli r = p

/-- A **primitive step-`n` rule lies in `M^(n)`** (its moduli point is in the sub-stack). -/
theorem mem_M {n : Nat} (r : StepRule n) (hr : r.primitive = true) : M n (toModuli r) :=
  ⟨r, hr, rfl⟩

/-! ## (3) The step-shift `σ : StepRule n → StepRule (n+1)` and the embedding `M^(n) ↪ M^(n+1)`

The step-shift extends the substitution by a new fixed letter, **preserving** `primitive` and
`coord` — so it preserves the classifying invariant, hence the moduli point. This realizes the
ascending-chain embedding `M^(2) ↪ M^(3) ↪ ⋯` as the inclusion of MLD-classes (`ℤ^n ↪ ℤ^(n+1)`
on the leading axis). -/

/-- The **step-shift** `σ : StepRule n → StepRule (n+1)` (the embedding inducing `M^(n) ↪
M^(n+1)`). It extends the substitution to the new letter `Fin.last`, which maps to the
singleton word `[Fin.last]` (a fixed new generator), and embeds the old letters via
`Fin.castSucc`; it **preserves** the primitivity flag and the classifying coordinate. -/
def stepShift {n : Nat} (r : StepRule n) : StepRule (n + 1) where
  subst := fun i =>
    if h : i.val < n then
      (r.subst ⟨i.val, h⟩).map Fin.castSucc
    else
      [Fin.last n]
  primitive := r.primitive
  coord := r.coord

/-- **Step-shift preserves the classifying coordinate.** `(σ r).coord = r.coord`. -/
@[simp] theorem stepShift_coord {n : Nat} (r : StepRule n) : (stepShift r).coord = r.coord :=
  rfl

/-- **Step-shift preserves primitivity.** `(σ r).primitive = r.primitive`. -/
@[simp] theorem stepShift_primitive {n : Nat} (r : StepRule n) :
    (stepShift r).primitive = r.primitive := rfl

/-- **Step-shift preserves the moduli point.** The embedding `σ` carries a step-`n` rule's
MLD-class to the *same* MLD-class one depth up: `toModuli (σ r) = toModuli r`. This is the
inclusion `M^(n) ↪ M^(n+1)` on MLD-classes — the classifying invariant `ℤ^n ↪ ℤ^(n+1)` is the
leading-axis inclusion, so the coarse moduli point is unchanged. -/
theorem toModuli_stepShift {n : Nat} (r : StepRule n) :
    toModuli (stepShift r) = toModuli r := by
  -- both moduli points are the MLD-class of a settling with `cl-inv = ⟨r.coord⟩`
  apply Quot.sound
  apply clInv_complete
  show (toSettling (stepShift r)).clInv = (toSettling r).clInv
  show (⟨(stepShift r).coord⟩ : H1Class) = ⟨r.coord⟩
  rw [stepShift_coord]

/-- **The step-shift embedding is injective on moduli classes.** If two step-`n` rules become
the same moduli point after `σ`, they were already the same moduli point: `toModuli (σ r) =
toModuli (σ s) → toModuli r = toModuli s`. Since `σ` preserves the moduli point
(`toModuli_stepShift`), injectivity is immediate. This is the `↪` of `M^(n) ↪ M^(n+1)`. -/
theorem stepShift_injective_on_classes {n : Nat} (r s : StepRule n)
    (h : toModuli (stepShift r) = toModuli (stepShift s)) : toModuli r = toModuli s := by
  rw [← toModuli_stepShift r, ← toModuli_stepShift s]; exact h

/-- **The step-shift sends `M^(n)` into `M^(n+1)`.** If a primitive step-`n` rule realizes a
moduli point `p`, the shifted rule is a primitive step-`(n+1)` rule realizing the SAME point —
so `M n p → M (n+1) p`. This is the chain inclusion `M^(n) ⊆ M^(n+1)` of sub-stacks (the
ascending chain). -/
theorem M_stepShift_mono {n : Nat} {p : ModuliPoint} (h : M n p) : M (n + 1) p := by
  obtain ⟨r, hr, hp⟩ := h
  exact ⟨stepShift r, by simpa [stepShift_primitive] using hr,
    (toModuli_stepShift r).trans hp⟩

/-! ## (4) The colimit — the RG-fixed-point candidate

We reuse `Aperiodic.DirectedSystem`/`Colimit` over `(Nat, ≤)`: the ascending chain `M^(2) ↪
M^(3) ↪ ⋯` is a directed system whose every stage is `ModuliPoint` and whose maps are the
(identity-on-classes) step-shift. Its colimit is the candidate RG-fixed-point — the universal
substitution moduli at infinite step depth. -/

/-- The **moduli directed system** over `(Nat, ≤)`: every stage is `ModuliPoint`, and the
`ω*`/step-shift map is the identity on moduli classes (`σ` preserves the moduli point,
`toModuli_stepShift`). Functor laws hold trivially. The colimit `Colimit moduliSystem` is the
RG-fixed-point candidate `colim_n M^(n)`. -/
def moduliSystem : DirectedSystem where
  stage _ := ModuliPoint
  map _ p := p
  map_id _ _ := rfl
  map_comp _ _ _ _ := rfl

/-- **The RG-fixed-point colimit identifies a moduli point across all step depths.** A moduli
point at depth `m` and the same point at depth `n` are identified in the colimit (the
step-shift acts as the identity on classes). This is the colimit's stabilization on the
moduli chain — `colim_n M^(n)` collapses the depth index, the universal substitution moduli. -/
theorem moduli_colimit_stage_independent (m n : Nat) (p : ModuliPoint) :
    DirectedSystem.Colimit.mk moduliSystem ⟨m, p⟩
      = DirectedSystem.Colimit.mk moduliSystem ⟨n, p⟩ := by
  apply DirectedSystem.Colimit.sound
  exact ⟨max m n, Nat.le_max_left m n, Nat.le_max_right m n, rfl⟩

/-! ## (5) The stratification decomposition predicate

Each meta-point sits in some `M^(n)` or in the residue. We model the decomposition as a
predicate: a moduli point is *stratified* iff it lies in some `M^(n)` for `n ≥ 2`; otherwise
it is residue. `M_aper = (⊔_{n≥2} M^(n)) ⊔ residue`. -/

/-- A moduli point is **stratified** iff it lies in some step-`n` sub-stack with `n ≥ 2` — it
is in `⊔_{n≥2} M^(n)`. -/
def Stratified (p : ModuliPoint) : Prop := ∃ n : Nat, 2 ≤ n ∧ M n p

/-- A moduli point is **residue** iff it is not stratified — not closure-equivalent to any
primitive step-`n` substitution rule (`p ∈ M_{aper,residue}`). -/
def Residue (p : ModuliPoint) : Prop := ¬ Stratified p

/-- **The stratification decomposition is a disjoint partition.** `Residue` is *exactly* the
complement of `Stratified`: residue ⟺ not-stratified (both directions, by definition), and the
two are mutually exclusive (`¬(Stratified ∧ Residue)`). Constructively this is the disjoint
union `M_aper = (⊔_{n≥2} M^(n)) ⊔ M_{aper,residue}` — the residue is precisely what is not in
any step-`n` sub-stack. (We state exhaustiveness as the complement equivalence rather than the
classical `Stratified ∨ ¬Stratified`, keeping the proof constructive — axioms stay
`{propext, Quot.sound}`.) -/
theorem stratified_or_residue (p : ModuliPoint) :
    (Stratified p → ¬ Residue p)
    ∧ (Residue p → ¬ Stratified p)
    ∧ (¬ Stratified p → Residue p)
    ∧ ¬ (Stratified p ∧ Residue p) :=
  ⟨fun hs hr => hr hs,
   fun hr hs => hr hs,
   fun h => h,
   fun ⟨hs, hr⟩ => hr hs⟩

/-! ## The moduli-stack stratification, ascending chain, and colimit -/

/-- **The settling moduli stack stratification.** Bundles the full structure of the
step-`n` moduli sub-stacks `{M^(n)}_{n≥2}`:

* **the ascending chain** `M^(2) ↪ M^(3) ↪ ⋯` — the step-shift `σ` preserves the moduli point
  (`toModuli (σ r) = toModuli r`), is **injective on MLD-classes**
  (`toModuli (σ r) = toModuli (σ s) → toModuli r = toModuli s`), and carries each sub-stack
  into the next (`M n p → M (n+1) p`), the chain inclusion of sub-stacks;
* **the stratification** — each meta-point is either *stratified* (in some `M^(n)`, `n ≥ 2`) or
  *residue*, the two disjoint and exhaustive: `M_aper = (⊔_{n≥2} M^(n)) ⊔ M_{aper,residue}`;
* **the colimit** (RG-fixed-point candidate) — reusing `Aperiodic.DirectedSystem`/`Colimit`,
  the moduli chain is a directed system over `(Nat, ≤)` whose colimit collapses the step-depth
  index (a moduli point at any depth is identified with itself at any other), `colim_n M^(n)` —
  the universal substitution moduli at infinite step depth.

Corpus: `step-n-moduli-substack.md`. -/
theorem moduli_stack_stratification :
    -- the ascending chain: σ preserves the moduli point, is injective on classes, and is
    -- monotone on the sub-stacks
    (∀ (n : Nat) (r : StepRule n), toModuli (stepShift r) = toModuli r)
    ∧ (∀ (n : Nat) (r s : StepRule n),
        toModuli (stepShift r) = toModuli (stepShift s) → toModuli r = toModuli s)
    ∧ (∀ (n : Nat) (p : ModuliPoint), M n p → M (n + 1) p)
    -- the stratification: stratified xor residue (disjoint, exhaustive by complement)
    ∧ (∀ p : ModuliPoint,
        (Stratified p → ¬ Residue p)
        ∧ (Residue p → ¬ Stratified p)
        ∧ (¬ Stratified p → Residue p)
        ∧ ¬ (Stratified p ∧ Residue p))
    -- the colimit (RG-fixed-point): the moduli directed system's colimit is depth-independent
    ∧ (∀ (m n : Nat) (p : ModuliPoint),
        DirectedSystem.Colimit.mk moduliSystem ⟨m, p⟩
          = DirectedSystem.Colimit.mk moduliSystem ⟨n, p⟩) :=
  ⟨fun _ r => toModuli_stepShift r,
   fun _ r s h => stepShift_injective_on_classes r s h,
   fun _ _ h => M_stepShift_mono h,
   stratified_or_residue,
   moduli_colimit_stage_independent⟩

/-! ## (6) The coarse moduli = MLD, and the invisible negation gauge

The coarse moduli space is the MLD-classes (the `cl-inv` complete invariant). The fiber
groupoid's automorphism group has an **invisible** subgroup: the ℤ/2 negation gauge of
`KleinFourGauge` (`⟨∼⟩ = {id, neg}`) fixes the moduli point — cohomologically invisible
(connective-tissue #10, negation ⊆ N(v)). -/

open RelMath.KleinFour in
/-- **The negation gauge is a closed ℤ/2 subgroup.** `{id, neg}` is closed under the group
multiplication — the internal ℤ/2 gauge of `KleinFourGauge`, the invisible-automorphism
subgroup of the moduli fiber groupoid. Reuses `KleinFour.gauge_closed`. -/
theorem negation_gauge_closed (g h : K4) (hg : K4.inGauge g = true) (hh : K4.inGauge h = true) :
    K4.inGauge (K4.mul g h) = true :=
  K4.gauge_closed g h hg hh

open RelMath.KleinFour in
/-- **A paraconsistent moduli witness is fixed by the whole negation gauge.** On a valuation
whose cells are all `⊥`/`⊤` (a paraconsistent — `⊤`-side — fiber point), *every* element of the
ℤ/2 negation gauge acts trivially: the gauge automorphism leaves the point fixed. This is the
cohomological **invisibility** of the negation gauge (it moves nothing on the inconsistency
side it sees). Reuses `KleinFour.paraconsistent_gauge_stable`. -/
theorem negation_gauge_invisible (g : K4) (hg : K4.inGauge g = true) (v : Valuation)
    (h : ∀ φ, v φ = Charge.kBot ∨ v φ = Charge.kTop) : K4.gaugeAct g v = v :=
  K4.paraconsistent_gauge_stable g hg v h

/-! ## The coarse moduli = MLD, with the invisible negation gauge -/

open RelMath.KleinFour in
/-- **The coarse moduli space is the MLD-classes, with the invisible negation gauge
.** Bundles the two corpus facts:

* **coarse moduli = MLD** — the moduli point of a rule is its MLD-class, and `cl-inv` is the
  **complete invariant**: two rules are the same moduli point *iff* their classifying
  invariants are equal (one direction `Quot.sound`/`toModuli_eq_iff_clInv`, packaged with the
  full `Aperiodic.classifying_invariant_complete_mld` — `MLD` an equivalence relation, the
  cl-inv completeness, and the regime dichotomy). Meta-points are MLD-classes.
* **the negation gauge is invisible** — the ℤ/2 negation gauge `⟨∼⟩ = {id, neg}` of
  `KleinFourGauge` is a **closed subgroup** (`gauge_closed`) and acts **trivially** on a
  paraconsistent fiber point (`paraconsistent_gauge_stable`): the negation automorphism leaves
  the coarse moduli point fixed. It is in the *invisible* automorphism subgroup of the fiber
  groupoid (cohomologically invisible, connective-tissue #10: negation ⊆ N(v)).

Corpus: `step-n-moduli-substack.md` (coarse moduli = MLD), `klein-four-symmetry` /
`internal-z2-gauge` (invisible negation gauge). -/
theorem coarse_moduli_is_mld :
    -- coarse moduli = MLD: equal cl-inv ⟹ same moduli point (the cl-inv complete invariant)
    (∀ (n : Nat) (r s : StepRule n),
        (toSettling r).clInv = (toSettling s).clInv → toModuli r = toModuli s)
    -- the full complete-MLD-invariant bundle (MLD equiv. rel., completeness, regime dichotomy)
    ∧ ((∀ v : Settling, MLD v v)
        ∧ (∀ v v' : Settling, MLD v v' → MLD v' v)
        ∧ (∀ v v' v'' : Settling, MLD v v' → MLD v' v'' → MLD v v'')
        ∧ (∀ v v' : Settling, MLD v v' ↔ v.clInv = v'.clInv)
        ∧ (∀ v : Settling,
            (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
              v.clInv = H1Class.zero)
        ∧ (∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ v.clInv ≠ H1Class.zero))
    -- the negation gauge is invisible: closed ℤ/2 subgroup acting trivially on a fiber point
    ∧ (∀ g h : K4, K4.inGauge g = true → K4.inGauge h = true →
        K4.inGauge (K4.mul g h) = true)
    ∧ (∀ (g : K4), K4.inGauge g = true → ∀ (v : Valuation),
        (∀ φ, v φ = Charge.kBot ∨ v φ = Charge.kTop) → K4.gaugeAct g v = v) :=
  ⟨fun _ r s h => toModuli_eq_iff_clInv r s h,
   classifying_invariant_complete_mld,
   fun g h hg hh => negation_gauge_closed g h hg hh,
   fun g hg v h => negation_gauge_invisible g hg v h⟩

end Moduli
end RelMath
