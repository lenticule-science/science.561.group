import Obsmetrologia.AperiodicOrder.Tiling.AndersonPutnam
import Obsmetrologia.Site.Basic
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Closure.Monad.KZ

/-!
# Settling moduli stack — the step-`n` moduli sub-stacks `M^(n)`

Corpus: `…/step-n-substitution-rule/content/step-n-moduli-substack/step-n-moduli-substack.md`.

> `M^(n) := { [S] ∈ M_aper : S is closure-equivalent to a primitive step-n substitution rule }`.
> `{M^(n)}_{n≥2}` stratifies `M_aper = (⊔_{n≥2} M^(n)) ⊔ M_{aper,residue}`. The step-shift
> `σ : M^(n) → M^(n+1)` embeds `M^(2) ↪ M^(3) ↪ ⋯`; `colim_n M^(n)` is a candidate
> RG-fixed-point. The coarse moduli is MLD: meta-points are MLD-classes.

`StepRule n` is an `n`-letter substitution `subst : Fin n → List (Fin n)` plus a primitive
active slice and a classifying-invariant carrier. `toSettling : StepRule n → Settling`
realizes it in the `aperiodic` regime. `ModuliPoint := Quot AperiodicOrder.Tiling.CohEquiv`;
`toModuli r := Quot.mk CohEquiv (toSettling r)`; equal `cl-inv` gives equal moduli point
(`toModuli_eq_of_clInv`) — identification with structural MLD-classes is the open
classification. `M (n) : ModuliPoint → Prop` holds at `p` iff some `StepRule n` realizes it.
`stepShift : StepRule n → StepRule (n+1)` extends the substitution by a fixed letter,
preserving the moduli point, realizing `M^(n) ↪ M^(n+1)`.

The ascending chain `M^(2) ↪ M^(3) ↪ ⋯` is built as a `AndersonPutnam.DirectedSystem` over
`(Nat, ≤)`; its colimit is the candidate RG-fixed-point (`Colimit.sound`/`Colimit.map_eq`).

The ℤ/2 negation gauge `⟨∼⟩ = {id, neg}` (`Positing.Gauge`) is in the invisible
automorphism subgroup of the fiber groupoid: it fixes the moduli point
(`paraconsistent_gauge_stable`, reusing `Positing.Gauge.inGauge`/`gaugeAct`/`gauge_closed`).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Moduli

open Obsmetrologia.AperiodicOrder.Tiling

/-! ## (1) Step-`n` substitution rules and their moduli points

A `StepRule n` is finite data: an `n`-letter substitution, a primitive active slice, and the
classifying invariant carrier from which the leading coordinate of `cl-inv^{(n)} ∈ ℤ^n`
is read. It realizes an aperiodic settling, and its moduli point is the MLD-class of that
settling. -/

/-- The step-shift substitution: embed the old alphabet into `Fin (n+1)` and add a new
fixed letter at `Fin.last n`. The whole enlarged substitution need not be primitive; the
primitive datum lives on an active slice. -/
def shiftedSubst {n : Nat} (subst : Fin n → List (Fin n)) : Fin (n + 1) → List (Fin (n + 1)) :=
  fun i =>
    if h : i.val < n then
      (subst ⟨i.val, h⟩).map Fin.castSucc
    else
      [Fin.last n]

/-- Iterating a substitution as words: at stage `0` a letter produces itself; each successor
stage substitutes every letter in the previous word. -/
def substIter {n : Nat} (subst : Fin n → List (Fin n)) : Nat → Fin n → List (Fin n)
  | 0, i => [i]
  | k + 1, i => (substIter subst k i).flatMap subst

/-- A substitution is primitive when some iterate sends every active letter to a word
containing every active letter. This is the list-level upstream witness whose matrix projection
is `Primitive (substMatrix subst)` in the downstream matrix layer. -/
def PrimitiveSubstitution {n : Nat} (subst : Fin n → List (Fin n)) : Prop :=
  ∃ k, ∀ i j, j ∈ substIter subst k i

/-- A **primitive active slice** of an ambient substitution. The slice has its own alphabet,
embeds into the ambient alphabet, realizes the ambient substitution on that embedded image,
and carries the actual substitution-level primitivity witness.

This is the richer upstream datum behind the old `primitive : Bool`: step-shifting by a new
fixed letter preserves the primitive slice, even though the full block-extended ambient
substitution is generally not primitive. -/
structure PrimitiveSlice {n : Nat} (subst : Fin n → List (Fin n)) where
  /-- The active alphabet size. -/
  coreSize : Nat
  /-- The substitution on the active alphabet. -/
  coreSubst : Fin coreSize → List (Fin coreSize)
  /-- The embedding of active letters into the ambient alphabet. -/
  embed : Fin coreSize → Fin n
  /-- The ambient substitution restricted to active letters is the embedded core substitution. -/
  image_eq : ∀ i, subst (embed i) = (coreSubst i).map embed
  /-- The active substitution is primitive. -/
  primitive : PrimitiveSubstitution coreSubst

/-- Step-shifting preserves the primitive active slice by composing its embedding with
`Fin.castSucc`; the new fixed letter lies outside the active slice. -/
def PrimitiveSlice.stepShift {n : Nat} {subst : Fin n → List (Fin n)}
    (p : PrimitiveSlice subst) : PrimitiveSlice (shiftedSubst subst) where
  coreSize := p.coreSize
  coreSubst := p.coreSubst
  embed := fun i => Fin.castSucc (p.embed i)
  image_eq := by
    intro i
    unfold shiftedSubst
    simp [p.image_eq i, List.map_map, Function.comp_def]
  primitive := p.primitive

/-- A **step-`n` invariant carrier**: the full rank-`n` classifying invariant
`cl-inv^{(n)} ∈ ℤ^n` together with the distinguished generator whose coordinate is exposed
to the current coarse rank-1 `H1Class`.

This replaces the older bare `coord : Int` field on `StepRule`: the integer is still
available, but only as the value read from an upstream invariant vector at a named
generator. -/
structure StepInvariantCarrier (n : Nat) where
  /-- The full step-`n` invariant coordinates. -/
  coords : Fin n → Int
  /-- The distinguished generator used by the coarse moduli quotient. -/
  generator : Fin n

/-- The full step-`n` invariant represented by a carrier. -/
def StepInvariantCarrier.invariant {n : Nat} (c : StepInvariantCarrier n) : Fin n → Int :=
  stepNInvariant n c.coords

/-- The coarse rank-1 classifying coordinate read from the carrier's distinguished generator. -/
def StepInvariantCarrier.coord {n : Nat} (c : StepInvariantCarrier n) : Int :=
  c.invariant c.generator

/-- A **step-`n` substitution rule** — finite data modeling a primitive active slice inside an `n`-letter
substitution. `subst` is the substitution `Fin n → List (Fin n)` (each letter to its image
word); `primitiveCore` is the active slice whose substitution matrix is strictly positive at
some power; `classifying` is the
rule's rank-`n` classifying invariant carrier, from which the current coarse coordinate is
derived. -/
structure StepRule (n : Nat) where
  /-- The `n`-letter substitution: each letter `i : Fin n` maps to its image word. -/
  subst : Fin n → List (Fin n)
  /-- The primitive active slice of the substitution. -/
  primitiveCore : PrimitiveSlice subst
  /-- The full classifying invariant carrier for `cl-inv^{(n)} ∈ ℤ^n`. -/
  classifying : StepInvariantCarrier n

/-- The classifying coordinate exposed by the current rank-1 coarse moduli quotient, derived
from the rule's step-`n` invariant carrier. -/
def StepRule.coord {n : Nat} (r : StepRule n) : Int := r.classifying.coord

/-- The **aperiodic settling realized by a step-`n` rule**: it lives in the `aperiodic`
regime, with classifying invariant `cl-inv` read from the rule's carried step-`n`
invariant. The `Settling.vanishing` constraint is *vacuous* — aperiodic cohomology does
not vanish — exactly as `AperiodicOrder.Tiling.aperiodicWitness`. -/
def toSettling {n : Nat} (r : StepRule n) : Settling where
  regime := ClosureRegime.aperiodic
  carrier := coordCarrier r.coord
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- A **moduli point** — a cohomological-equivalence class of settlings, `Quot AperiodicOrder.Tiling.CohEquiv`.
This is where **modulus/moduli** is defined as a mathematical carrier in this
module: a meta-point is a `cl-inv`-class, and the later theorems prove preservation under
step-shift, sub-stack inclusion, stratification, and colimit identification. Its
identification with the *structural* MLD-classes is the open classification
(`thm:aperiodic-mld-classification`). -/
def ModuliPoint : Type 1 := Quot CohEquiv

/-- The **moduli point of a step-`n` rule** — the `cl-inv`-class of its realized settling. -/
def toModuli {n : Nat} (r : StepRule n) : ModuliPoint := Quot.mk CohEquiv (toSettling r)

/-- **`cl-inv` determines the moduli point.** Equal classifying invariants ⟹ same moduli point
(`Quot.sound` on `CohEquiv`). The converse (same moduli point ⟹ equal `cl-inv`) needs `Quot`
exactness and is not asserted; the content is this well-definedness direction. -/
theorem toModuli_eq_of_clInv {n : Nat} (r s : StepRule n) :
    (toSettling r).clInv = (toSettling s).clInv → toModuli r = toModuli s := by
  intro h
  exact Quot.sound h

/-- **A rule's classifying coordinate determines its moduli point.** Equal `coord` ⟹ equal
moduli point (the `cl-inv` is `⟨coord⟩`). -/
theorem toModuli_eq_of_coord {n : Nat} (r s : StepRule n) (h : r.coord = s.coord) :
    toModuli r = toModuli s := by
  apply toModuli_eq_of_clInv
  show (⟨r.coord⟩ : H1Class) = ⟨s.coord⟩
  rw [h]

/-! ## (2) The step-`n` sub-stack `M^(n)`

`M n` is the step-`n` sub-stack: the moduli points realized by some *primitive* step-`n`
rule. A meta-point sits in `M^(n)` iff some primitive step-`n` representative realizes it. -/

/-- The **step-`n` moduli sub-stack** `M^(n)` — the predicate on moduli points holding at `p`
iff *some* primitive step-`n` rule realizes `p`. The MLD-classes of primitive step-`n` rules. -/
def M (n : Nat) (p : ModuliPoint) : Prop :=
  ∃ r : StepRule n, toModuli r = p

/-- A **primitive step-`n` rule lies in `M^(n)`** (its moduli point is in the sub-stack). -/
theorem mem_M {n : Nat} (r : StepRule n) : M n (toModuli r) :=
  ⟨r, rfl⟩

/-! ## (3) The step-shift `σ : StepRule n → StepRule (n+1)` and the embedding `M^(n) ↪ M^(n+1)`

The step-shift extends the substitution by a new fixed letter, **preserving** the primitive
active slice and derived coordinate — so it preserves the classifying invariant, hence the moduli point. This realizes the
ascending-chain embedding `M^(2) ↪ M^(3) ↪ ⋯` as the inclusion of MLD-classes (`ℤ^n ↪ ℤ^(n+1)`
on the leading axis). -/

/-- The **step-shift** `σ : StepRule n → StepRule (n+1)` (the embedding inducing `M^(n) ↪
M^(n+1)`). It extends the substitution to the new letter `Fin.last`, which maps to the
singleton word `[Fin.last]` (a fixed new generator), and embeds the old letters via
`Fin.castSucc`; it **preserves** the primitive active slice and the classifying coordinate. -/
def stepShift {n : Nat} (r : StepRule n) : StepRule (n + 1) where
  subst := shiftedSubst r.subst
  primitiveCore := r.primitiveCore.stepShift
  classifying :=
    { coords := fun i =>
        if h : i.val < n then
          r.classifying.invariant ⟨i.val, h⟩
        else
          0
      generator := Fin.castSucc r.classifying.generator }

/-- **Step-shift preserves the classifying coordinate.** `(σ r).coord = r.coord`. -/
@[simp] theorem stepShift_coord {n : Nat} (r : StepRule n) : (stepShift r).coord = r.coord :=
  by
    unfold StepRule.coord StepInvariantCarrier.coord StepInvariantCarrier.invariant stepNInvariant stepShift
    simp
    rfl

/-- **Step-shift preserves primitivity on the active slice.** The full enlarged ambient
substitution has a new fixed-letter block and need not be primitive; the carried active slice is
primitive by the original slice witness. -/
theorem stepShift_primitive {n : Nat} (r : StepRule n) :
    PrimitiveSubstitution (stepShift r).primitiveCore.coreSubst :=
  (stepShift r).primitiveCore.primitive

/-- **Step-shift preserves the moduli point.** The embedding `σ` carries a step-`n` rule's
MLD-class to the *same* MLD-class one depth up: `toModuli (σ r) = toModuli r`. This is the
inclusion `M^(n) ↪ M^(n+1)` on MLD-classes — the classifying invariant `ℤ^n ↪ ℤ^(n+1)` is the
leading-axis inclusion, so the coarse moduli point is unchanged. -/
theorem toModuli_stepShift {n : Nat} (r : StepRule n) :
    toModuli (stepShift r) = toModuli r := by
  -- both moduli points are the cl-inv-class of a settling with `cl-inv = ⟨r.coord⟩`
  apply Quot.sound
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
  obtain ⟨r, hp⟩ := h
  exact ⟨stepShift r, (toModuli_stepShift r).trans hp⟩

/-! ## (4) The colimit — the RG-fixed-point candidate

We reuse `AperiodicOrder.Tiling.DirectedSystem`/`Colimit` over `(Nat, ≤)`: the ascending chain `M^(2) ↪
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

/-- The ascending chain `M^(2) ↪ M^(3) ↪ ⋯` (`σ` preserves and is injective on moduli
points, and carries each sub-stack into the next); the stratification `M_aper = (⊔_{n≥2}
M^(n)) ⊔ M_{aper,residue}` (disjoint, exhaustive); and the colimit (RG-fixed-point
candidate) is depth-independent. Corpus: `step-n-moduli-substack.md`. -/
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
`Positing.Gauge` (`⟨∼⟩ = {id, neg}`) fixes the moduli point — cohomologically invisible
(connective-tissue #10, negation ⊆ N(v)). -/

open Obsmetrologia.Positing.Gauge in
/-- **The negation gauge is a closed ℤ/2 subgroup.** `{id, neg}` is closed under the group
multiplication — the internal ℤ/2 gauge of `Positing.Gauge`, the invisible-automorphism
subgroup of the moduli fiber groupoid. Reuses `Positing.Gauge.gauge_closed`. -/
theorem negation_gauge_closed (g h : K4) (hg : K4.inGauge g = true) (hh : K4.inGauge h = true) :
    K4.inGauge (K4.mul g h) = true :=
  K4.gauge_closed g h hg hh

open Obsmetrologia.Positing.Gauge in
/-- **A paraconsistent moduli witness is fixed by the whole negation gauge.** On a valuation
whose cells are all `⊥`/`⊤` (a paraconsistent — `⊤`-side — fiber point), *every* element of the
ℤ/2 negation gauge acts trivially: the gauge automorphism leaves the point fixed. This is the
cohomological **invisibility** of the negation gauge (it moves nothing on the inconsistency
side it sees). Reuses `Positing.Gauge.paraconsistent_gauge_stable`. -/
theorem negation_gauge_invisible (g : K4) (hg : K4.inGauge g = true) (v : Valuation)
    (h : ∀ φ, v φ = Charge.kBot ∨ v φ = Charge.kTop) : K4.gaugeAct g v = v :=
  K4.paraconsistent_gauge_stable g hg v h

/-! ## The coarse moduli (cl-inv-classes), with the invisible negation gauge -/

open Obsmetrologia.Positing.Gauge in
/-- `cl-inv` determines the moduli point; MLD-related settlings share a moduli point
(Step 3; the converse is the open classification); and the ℤ/2 negation gauge is a
closed subgroup that acts trivially on a paraconsistent fiber point, so it is invisible
to the coarse moduli. Corpus: `step-n-moduli-substack.md`, `klein-four-symmetry`. -/
theorem coarse_moduli_wellDefined_gauge_invisible (D : LocalDerivability) :
    -- cl-inv determines the moduli point (well-definedness of the coarse moduli)
    (∀ (n : Nat) (r s : StepRule n),
        (toSettling r).clInv = (toSettling s).clInv → toModuli r = toModuli s)
    -- Step 3: MLD-related settlings share a moduli point (the easy half of coarse moduli = MLD)
    ∧ (∀ v v' : Settling, D.Mld v v' → Quot.mk CohEquiv v = Quot.mk CohEquiv v')
    -- the negation gauge is invisible: closed ℤ/2 subgroup acting trivially on a fiber point
    ∧ (∀ g h : K4, K4.inGauge g = true → K4.inGauge h = true →
        K4.inGauge (K4.mul g h) = true)
    ∧ (∀ (g : K4), K4.inGauge g = true → ∀ (v : Valuation),
        (∀ φ, v φ = Charge.kBot ∨ v φ = Charge.kTop) → K4.gaugeAct g v = v) :=
  ⟨fun _ r s h => toModuli_eq_of_clInv r s h,
   fun _ _ h => Quot.sound (mld_refines_cohEquiv D h),
   fun g h hg hh => negation_gauge_closed g h hg hh,
   fun g hg v h => negation_gauge_invisible g hg v h⟩

end AperiodicOrder.Tiling.Moduli
end Obsmetrologia
