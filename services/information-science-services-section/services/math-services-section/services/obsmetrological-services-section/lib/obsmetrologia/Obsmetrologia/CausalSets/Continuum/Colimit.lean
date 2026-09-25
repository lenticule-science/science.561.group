import Obsmetrologia.Closure.OrdinalCore
import Obsmetrologia.Closure.Scott
import Obsmetrologia.Calculus.Probability.RealStochasticInterval
import Obsmetrologia.CausalSets.Action.EinsteinHilbertAction

/-!
# The colimit-interchange lemma, the concrete refinement tower (construction 1), and the still-open functional

**Intent (a program, not what is proved here).** The Benincasa–Dowker action and curvature are read
against a *growing* sprinkling, and one would like the `V → ∞` continuum limit to be a directed-join
**colimit** (a limit *attained* at a finite stage, not an ε–δ limit). If that held, the continuum
scaling would live in the order/settling machinery rather than in real analysis.

**What is actually proved here is strictly weaker, and abstract.** Over the finite reading lattice, any
`≤ₖ`-monotone `ℤ`-functional `F` on a `DirectedFamily` `S` commutes with the directed join, because the
join is *attained* (`DirectedFamily.sup_mem`). The statements below quantify over an **arbitrary** `S`
and `F`: they mention no sprinkling, no causal set, no Benincasa–Dowker action. They are general
order-theoretic facts about `Reading`.

**Constructions (1) and (2) are built (in the finite-value reach); the magnitude and infinite volume
are not.** The application to the actual continuum limit needs:

1. **(BUILT below.)** the refinement tower as a *concrete* `DirectedFamily` of `Reading` — `RefinementTower`
   (a `≤ₖ`-monotone reading sequence, the partial settlings of a refining sprinkling), `upto` (its first
   `N+1` stages, a directed family), `upto_sup` (join attained at the top stage), with the
   settling-closure iteration `closureTower` as a concrete inhabitant. `tower_continuum_attained` feeds
   it to the abstract lemma, so the colimit interchange holds at a real tower, not just an arbitrary `S`.
2. **(BUILT below, finite-value reach.)** the functional `F` instantiated at the *actual* Benincasa–Dowker
   action of real causal sets: `bdF` on the `∅ ⊆ diamond` tower reads the BD action at every stage
   (`bd_tower_bridge`: `0 = ∅`'s action, `1 =` the diamond's), and `bd_construction_two` carries it through
   the colimit. `F` is no longer abstract — it is the real action.

What remains **red**: a tower with *unboundedly growing* action (the `V → ∞` sprinkling)
cannot be encoded as a `Reading`-indexed family — at most four distinct values fit — so the attainment is a
feature of the finite carrier, not the infinite-volume limit; and beyond it the metric magnitude
(`−¼√g`, the Ricci scalar's normalization). The geometric reading "the continuum Ricci scalar is an
attained colimit" holds only for finite-value towers; the infinite-volume density is the real frontier.
(The discrete `∑ ricciScalar = 2·bdAction` identity in `LambekRicci` is green, an identity at a single
poset; here the action varies `0 → 1` across a refinement.)

## Main results

* `monotone_functional_commutes_with_join` — abstract: a `≤ₖ`-monotone `ℤ`-functional's value at the
  directed join bounds, and is realized among, its finite-stage values.
* `monotone_functional_limit_attained` — abstract: that join value is attained at a member of the
  family (a colimit, not an ε–δ limit) — for *any* such `S`, `F`.
* `smul_limit_attained` — abstract: a positive-scalar multiple `c·F` inherits the same attainment.
* `RefinementTower.upto` / `upto_sup` — **construction (1)**: the refinement tower's first `N+1` stages
  as a concrete `DirectedFamily`, with join attained at the top stage `stage N`.
* `closureTower` — the settling-closure iteration `cl^[n] x` as a concrete refinement tower (a witness).
* `tower_continuum_attained` — the abstract colimit lemma instantiated at the concrete tower: `F`'s
  continuum value over the tower is `F (stage N)`, attained.
* `bd_tower_bridge` / `bd_construction_two` — **construction (2)**: `bdF` reads the *actual* Benincasa–Dowker
  action of the `∅ ⊆ diamond` causal-set tower at every stage (`0`, then `1`), carried through the colimit.
  `F` is the action, within the finite-value reach of the reading lattice.
* `constructive_continuum_colimit_attained_below_omega` — the bundled constructive-continuum
  certificate: finite tower attainment at the ordinal stage `ofNat N ≤ ω`, Bishop reals as the
  `κ=ω` completion, and the real stochastic interval as a value category.

## References

`content/.../causal-dalembertian/content/sprinkling-average` (the continuum-scaling frontier, red);
the directed-join attainment of `Closure.Scott`.

## Tags

directed join, colimit, Scott continuity, abstract lemma, frontier
-/

namespace Obsmetrologia
namespace CausalSets.Continuum.Colimit

open Obsmetrologia.Closure.Scott
open Obsmetrologia.Reading

/-- **(Abstract.)** A `≤ₖ`-monotone `ℤ`-functional `F` on a `DirectedFamily` `S` commutes with the
directed join: `F (⋁ₖ S)` bounds every member value and is itself realized at a member. This is a
general fact about `Reading` and an *arbitrary* `F` — it says nothing about any sprinkling or action;
instantiating `S`/`F` at the BD continuum tower is the unbuilt frontier (see the module header). -/
theorem monotone_functional_commutes_with_join (S : DirectedFamily) (F : Reading → Int)
    (hmono : ∀ a b, KLE a b → F a ≤ F b) :
    (∀ x ∈ S.elems, F x ≤ F (sup S.elems)) ∧ F (sup S.elems) ∈ S.elems.map F := by
  refine ⟨fun x hx => hmono x (sup S.elems) (le_sup hx), ?_⟩
  exact List.mem_map.mpr ⟨sup S.elems, S.sup_mem, rfl⟩

/-- **(Abstract.)** For *any* `≤ₖ`-directed family `S` and `≤ₖ`-monotone `ℤ`-functional `F`, the join
value `F (⋁ₖ S)` is attained at a member of `S` and dominates every member — a directed-join colimit,
not an ε–δ limit. The intended reading (`S` = the sprinkling tower, `F` = the action, so "the continuum
limit is attained") requires the two unbuilt constructions in the module header; it is **not**
established by this lemma. -/
theorem monotone_functional_limit_attained (S : DirectedFamily) (F : Reading → Int)
    (hmono : ∀ a b, KLE a b → F a ≤ F b) :
    ∃ x ∈ S.elems, F x = F (sup S.elems) ∧ ∀ y ∈ S.elems, F y ≤ F x :=
  ⟨sup S.elems, S.sup_mem, rfl, fun y hy => hmono y (sup S.elems) (le_sup hy)⟩

/-- A positive-scalar multiple of a `≤ₖ`-monotone functional is `≤ₖ`-monotone. -/
theorem smul_mono (act : Reading → Int) (hmono : ∀ a b, KLE a b → act a ≤ act b) :
    ∀ a b, KLE a b → 2 * act a ≤ 2 * act b :=
  fun a b h => by have := hmono a b h; omega

/-- **(Abstract.)** A doubled monotone functional `2·act` inherits the attained-colimit property. This
is purely `monotone_functional_limit_attained` applied to `fun a => 2 * act a` for an **arbitrary**
`act : Reading → ℤ`. It contains no Ricci, no action, no sprinkling: the `act` here is abstract. The
*intended* application — `act` = the real Benincasa–Dowker action, so `2·act` = the Ricci functional via
`CausalSets.Curvature.Ricci.total_ricciScalar_eq_two_bdAction` — is the unbuilt program of the module header, **not**
proved here. -/
theorem smul_limit_attained (S : DirectedFamily) (act : Reading → Int)
    (hmono : ∀ a b, KLE a b → act a ≤ act b) :
    ∃ x ∈ S.elems, 2 * act x = 2 * act (sup S.elems)
      ∧ ∀ y ∈ S.elems, 2 * act y ≤ 2 * act x :=
  monotone_functional_limit_attained S (fun a => 2 * act a) (smul_mono act hmono)

/-! ## Construction (1): the refinement tower as a concrete `DirectedFamily`

The first of the two constructions the header names as needed to make the abstract lemmas concrete. A
**refinement tower** is a `≤ₖ`-monotone sequence of readings — the partial settlings of a growing
sprinkling, knowledge accreting as the sprinkling refines. Its first `N+1` stages form a chain, hence a
directed family, whose join is *attained* at the top stage (`upto`, `upto_sup`). This is a,
concrete `DirectedFamily`, so the abstract `monotone_functional_limit_attained` now has a real instance
(`tower_continuum_attained`). Modelled, as throughout `ScottClosure`, over the finite reading lattice; the
canonical inhabitant is the settling-closure iteration (`closureTower`).

This builds construction (1) only. The geometric BD/Ricci reading still needs construction (2) — the
*actual* Benincasa–Dowker action / Ricci functional instantiated on this tower — and the metric
magnitude (`−¼√g`); both remain unbuilt, and the finite-reading tower is the corpus's model of the
refinement order, not an infinite-volume sprinkling. -/

/-- A **refinement tower**: a `≤ₖ`-monotone sequence of readings. `stage n` is the partial settling at
refinement level `n`; `refines` says each refinement only *adds* knowledge (`≤ₖ`-monotone) — the
order-theoretic content of "a finer sprinkling witnesses more". -/
structure RefinementTower where
  /-- The partial settling at refinement level `n`. -/
  stage : Nat → Reading
  /-- Each refinement adds knowledge: the stages are `≤ₖ`-monotone. -/
  refines : ∀ n, KLE (stage n) (stage (n + 1))

namespace RefinementTower
variable (T : RefinementTower)

/-- The tower is `≤ₖ`-monotone: a later stage dominates an earlier one. -/
theorem stage_mono {i j : Nat} (h : i ≤ j) : KLE (T.stage i) (T.stage j) := by
  induction h with
  | refl => exact kle_refl _
  | step _ ih => exact kle_trans _ _ _ ih (T.refines _)

/-- **Construction (1).** The first `N+1` stages of the tower as a concrete `DirectedFamily`: a chain,
hence directed — any two stages are bounded by the later one, which is a member. -/
def upto (N : Nat) : DirectedFamily where
  elems := (List.range (N + 1)).map T.stage
  nonempty := by
    have h : ((List.range (N + 1)).map T.stage).length = N + 1 := by
      rw [List.length_map, List.length_range]
    intro hnil
    rw [hnil, List.length_nil] at h
    omega
  directed := by
    intro a ha b hb
    rw [List.mem_map] at ha hb
    obtain ⟨i, hi, rfl⟩ := ha
    obtain ⟨j, hj, rfl⟩ := hb
    rw [List.mem_range] at hi hj
    refine ⟨T.stage (max i j), ?_, T.stage_mono (by omega), T.stage_mono (by omega)⟩
    rw [List.mem_map]
    exact ⟨max i j, List.mem_range.mpr (by omega), rfl⟩

/-- **The tower's join is its top stage, attained.** `(upto N).sup = stage N` — the directed join of the
refinement tower is the settled value at the final stage, a member of the family (`sup_mem`). -/
theorem upto_sup (N : Nat) : (T.upto N).sup = T.stage N := by
  show Obsmetrologia.Closure.Scott.sup ((List.range (N + 1)).map T.stage) = T.stage N
  apply kle_antisymm
  · apply sup_le
    intro a ha
    rw [List.mem_map] at ha
    obtain ⟨i, hi, rfl⟩ := ha
    rw [List.mem_range] at hi
    exact T.stage_mono (by omega)
  · apply le_sup
    rw [List.mem_map]
    exact ⟨N, List.mem_range.mpr (by omega), rfl⟩

end RefinementTower

/-- The `n`-fold settling `cl^[n] x` (core-only iteration; no Mathlib `Function.iterate`). -/
def iter (f : Reading → Reading) : Nat → Reading → Reading
  | 0, x => x
  | n + 1, x => f (iter f n x)

/-- The **settling-closure iteration** as a concrete refinement tower: `stage n = cl^[n] x`, the
`n`-fold settling of a seed `x` under an inflationary reading-closure `c`. The canonical inhabitant — the
corpus's "tower of sprinkled settlings, ordered by refinement" realized as closure iteration. -/
def closureTower (c : Reading.Closure) (x : Reading) : RefinementTower where
  stage n := iter c.op n x
  refines n := c.infl (iter c.op n x)

/-- **The continuum value over a refinement tower is its top-stage value, attained.** Instantiating the
abstract colimit lemma at the concrete tower: for any `≤ₖ`-monotone `ℤ`-functional `F`, its
directed-join ("continuum") value over the tower's first `N+1` stages equals `F (stage N)` and is
attained there. Construction (1) makes the colimit concrete; the geometric/BD reading still needs
construction (2) and the metric magnitude. -/
theorem tower_continuum_attained (T : RefinementTower) (N : Nat) (F : Reading → Int)
    (hmono : ∀ a b, KLE a b → F a ≤ F b) :
    F ((T.upto N).sup) = F (T.stage N)
      ∧ ∃ s ∈ (T.upto N).elems,
          F s = F ((T.upto N).sup) ∧ ∀ y ∈ (T.upto N).elems, F y ≤ F s :=
  ⟨by rw [T.upto_sup], monotone_functional_limit_attained (T.upto N) F hmono⟩

/-! ## Constructive-continuum certificate

The continuum machinery assembled here is constructive-colimit machinery: a finite refinement tower
attains its directed join at a finite ordinal stage, the internally derived Bishop reals supply the
`κ = ω` Scott-continuous completion of the rationals, and the stochastic unit interval is a value
category over those reals. This is a certificate about the carriers and colimits that have been built;
it does not introduce a set-theoretic cardinal-comparison surface. -/

/-- The Bishop-real continuum carrier: every real is reached by its rational approximation orbit, and
regular Cauchy sequences of reals settle to their diagonal real. -/
def BishopRealScottCompletion : Prop :=
  (∀ a : Real.Internal.Real,
      Real.Internal.RReal.ConvergesTo
        (fun n => Real.Internal.RReal.ofRat (a.seq n)) (Real.Internal.RReal.mk a))
  ∧ (∀ (F : Nat → Real.Internal.Real)
      (hreg : ∀ i j,
        Real.Internal.RReal.Within (Nat.min i j)
          (Real.Internal.RReal.mk (F i)) (Real.Internal.RReal.mk (F j))),
      Real.Internal.RReal.ConvergesTo
        (fun n => Real.Internal.RReal.mk (F n))
        (Real.Internal.RReal.mk (Real.Internal.RReal.diagonal F hreg)))

/-- The real stochastic interval carrier: `[0,1]` over internal reals is a value category with seed
`0`. -/
def RealStochasticIntervalValueCategory : Prop :=
  Probability.RealStochastic.realUnitIntervalStochVC.carrier = Probability.RealStochastic.UnitReal
  ∧ (∀ a : Probability.RealStochastic.UnitReal,
      Probability.RealStochastic.realUnitIntervalStochVC.le a a)
  ∧ (∀ a b : Probability.RealStochastic.UnitReal,
      Probability.RealStochastic.realUnitIntervalStochVC.le a b →
        Probability.RealStochastic.realUnitIntervalStochVC.le b a → a = b)
  ∧ Probability.RealStochastic.realUnitIntervalStochVC.bot = Probability.RealStochastic.zero

/-- **Constructive continuum colimit, below `ω`.** For any finite `Reading` refinement tower and any
`≤ₖ`-monotone integer functional, the directed-join value over the first `N+1` stages is attained at
stage `N`; that stage is the finite ordinal `ofNat N` below `ω`. The same certificate records the two
continuous carriers that make the surrounding continuum constructive: Bishop reals are the
Scott-continuous `κ=ω` completion of the rationals, and the real stochastic interval `[0,1]` is a value
category. -/
theorem constructive_continuum_colimit_attained_below_omega
    (T : RefinementTower) (N : Nat) (F : Reading → Int)
    (hmono : ∀ a b, KLE a b → F a ≤ F b) :
    Ord.Le (Ord.ofNat N) Ord.omega
    ∧ BishopRealScottCompletion
    ∧ RealStochasticIntervalValueCategory
    ∧ F ((T.upto N).sup) = F (T.stage N)
    ∧ ∃ s ∈ (T.upto N).elems,
        F s = F ((T.upto N).sup) ∧ ∀ y ∈ (T.upto N).elems, F y ≤ F s := by
  refine ⟨Ord.ofNat_le_omega N,
    Real.Internal.RReal.reals_are_the_scott_continuous_settling_completion,
    Probability.RealStochastic.realUnitInterval_is_value_category,
    (tower_continuum_attained T N F hmono).1,
    (tower_continuum_attained T N F hmono).2⟩

/-! ## Construction (2): the actual Benincasa–Dowker action on the tower (the finite-value reach)

Construction (1) gave a concrete tower but kept `F` abstract. Here `F` is instantiated at the *actual*
Benincasa–Dowker action of real causal sets. The refinement `∅ ⊆ diamond` is a sprinkling step:
the empty causal set has BD action `0` (the empty fold), the causal diamond has BD action `1`
(`CausalSets.Action.EinsteinHilbertAction.diamond_bdAction`). Encoding the two stages as `⊥ₖ` (empty) and `⊤ₖ` (diamond), the
reading functional `bdF` reads off the *real* action at every stage (`bd_tower_bridge`), and its
directed-join continuum value over the tower is attained at the diamond's action `1`.

This realizes construction (2) for a tower whose action takes finitely many values — the reach of
the 4-element reading lattice. A tower with *unboundedly growing* action (the `V → ∞` sprinkling)
cannot be encoded as a `Reading`-indexed family (at most four distinct values), so the infinite-volume
continuum density — and the metric magnitude `−¼√g` — remain the real frontier. The attainment is a
feature of the finite carrier, not of the limit. -/

/-- The causal set at refinement stage `n`: empty at stage `0`, the causal diamond from stage `1` on —
the diamond's four events sprinkled in at the first refinement step. -/
def bdCausalSet : Nat → List (Fin 4)
  | 0 => []
  | _ + 1 => CausalSets.Dimension.OrderingFraction.fourEvents

/-- The stage reading: `⊥ₖ` (empty, action `0`) at stage `0`, `⊤ₖ` (the diamond, action `1`) after. -/
def bdStage : Nat → Reading
  | 0 => kBot
  | _ + 1 => kTop

/-- The Benincasa–Dowker action transported onto the reading lattice: `1` at the diamond stage `⊤ₖ`,
else `0`. The actual BD action read as a `≤ₖ`-monotone `ℤ`-functional. -/
def bdF (c : Reading) : Int := if KLE kTop c then 1 else 0

/-- `bdF` is `≤ₖ`-monotone (finite exhaustion over the four readings). -/
theorem bdF_mono : ∀ a b, KLE a b → bdF a ≤ bdF b := by
  intro a b; cases a <;> cases b <;> decide

/-- The refinement tower of the `∅ ⊆ diamond` sprinkling: knowledge climbs `⊥ₖ → ⊤ₖ` as the diamond is
sprinkled in. -/
def bdTower : RefinementTower where
  stage := bdStage
  refines n := by
    cases n with
    | zero => decide
    | succ _ => exact kle_refl kTop

/-- **The functional is the real action.** At every stage `bdF` equals the *actual* Benincasa–Dowker
action of the causal set at that stage: `bdF (bdStage n) = bdAction (bdCausalSet n) diamondPrec`
(`0 = ∅`'s action, `1 =` the diamond's action `CausalSets.Action.EinsteinHilbertAction.diamond_bdAction`). This is the bridge
construction (2) asks for — `F` is not abstract here, it reads the BD action. -/
theorem bd_tower_bridge (n : Nat) :
    bdF (bdStage n) = CausalSets.Action.EinsteinHilbertAction.bdAction (bdCausalSet n) CausalSets.Dimension.OrderingFraction.diamondPrec := by
  cases n with
  | zero => decide
  | succ _ =>
    show bdF kTop = CausalSets.Action.EinsteinHilbertAction.bdAction CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.diamondPrec
    decide

/-- **Construction (2), realized.** For the `∅ ⊆ diamond` tower: (a) `bdF` reads the actual BD action at
every stage (`bd_tower_bridge`); (b) its continuum (directed-join) value over the tower's first `N+1`
stages is attained at the top stage, equal to the diamond's action `1` for `N ≥ 1`. The abstract colimit
lemma now carries a Benincasa–Dowker functional — within the finite-value reach of the reading
lattice (see the section header for what stays frontier). -/
theorem bd_construction_two (N : Nat) :
    (∀ n, bdF (bdStage n) = CausalSets.Action.EinsteinHilbertAction.bdAction (bdCausalSet n) CausalSets.Dimension.OrderingFraction.diamondPrec)
      ∧ bdF ((bdTower.upto N).sup) = bdF (bdStage N)
      ∧ ∃ s ∈ (bdTower.upto N).elems,
          bdF s = bdF ((bdTower.upto N).sup) ∧ ∀ y ∈ (bdTower.upto N).elems, bdF y ≤ bdF s :=
  ⟨bd_tower_bridge, tower_continuum_attained bdTower N bdF bdF_mono⟩

end CausalSets.Continuum.Colimit
end Obsmetrologia
