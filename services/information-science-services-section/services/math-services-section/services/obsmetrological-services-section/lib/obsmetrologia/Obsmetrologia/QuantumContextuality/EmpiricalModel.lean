import Obsmetrologia.QuantumContextuality.MeasurementScenario
import Obsmetrologia.Calculus.Real.IVT
import Obsmetrologia.Calculus.Real.Inverse
import Obsmetrologia.Calculus.Real.MultiplicationOrder

/-! # Empirical models and no-signaling

The probabilistic refinement of `QuantumContextuality.MeasurementScenario`: a context now carries not a
bare support but a finite **distribution** over its local outcome assignments. This is the
quantitative Abramsky–Brandenburger empirical model, the posit made quantitative one level up
from `Probability.Measure` — value entering a *measurement context* by weighted evidence.

## Weights are counts (by design)

Following `Probability.Measure` (the counting measure `μ(A) ∈ Nat`), a distribution over the
local assignments of a context is a finite **list of weighted assignments** `WDist`
(`(M → O) × Nat`) — the faithful finite reading of an empirical model. Marginals are `Nat`
sums; "probabilities" are tracked as weight ratios with the `/` left implicit. The
real-valued version (no-signaling distributions and CHSH/Bell numerics over
`Probability.RealStochasticInterval`, the internal `[0,1] ⊂ ℝ`) is the natural next layer.

## No-signaling as a theorem

**No-signaling** is the physical requirement that the marginal on a shared measurement does
not depend on which context it is read through: if measurement `m` lies in two contexts
`C`, `C'`, the `m`-marginal of `dist C` equals the `m`-marginal of `dist C'`. The structural
theorem `globalDist_implies_noSignaling` proves a model induced by a single **global**
distribution is automatically no-signaling — the probabilistic analogue of
`globalSection_restricts_compatible`. (No-signaling is a *nontrivial* predicate: a generic
per-context family of distributions violates it.)

## The PR-box witness

`prBoxP` is the Popescu–Rohrlich box as a probabilistic model: each of its four contexts
carries the uniform distribution over its two PR-allowed outcome pairs — **
different lists per context**, not the restriction of one global table. `prBoxP_noSignaling`
proves it is nonetheless no-signaling (its shared-measurement marginals are uniform on both
sides). Yet its *support* is the strongly contextual `prBox` of `MeasurementScenario`, so it
admits **no** global distribution — that nonexistence (Fine's theorem) is a finite
linear-programming argument over the deterministic vertices, buildable on
`Probability.RealStochasticInterval`; it is the natural next step, not done here.

## Main definitions

* `WDist`, `singleMarginal` — a finite weighted distribution and its single-measurement
  marginal (a `Nat` count).
* `PModel`, `NoSignaling` — a per-context empirical model and the no-signaling predicate.
* `inducedModel` — the model in which every context reads one global distribution.
* `prBoxP` — the PR box as a probabilistic empirical model.

## Main results

* `globalDist_implies_noSignaling` — a global distribution induces a no-signaling model.
* `prBoxP_noSignaling` — the PR box is no-signaling, with per-context-varying
  distributions (the non-vacuous witness; cf. its strongly contextual support `prBox`).

## References

`content/.../probability-theory`; Abramsky & Brandenburger 2011. Sibling:
`QuantumContextuality.MeasurementScenario`, `Probability.Measure`.

## Tags

empirical model, no-signaling, marginal, PR box, contextuality, probability
-/

namespace Obsmetrologia
namespace QuantumContextuality

variable {M O : Type}

/-! ## (A) Weighted distributions over local assignments -/

/-- A finite **distribution** over outcome assignments: a list of `(assignment, weight)`
pairs. The weight is a `Nat` count, as in `Probability.Measure`. -/
abbrev WDist (M O : Type) : Type := List ((M → O) × Nat)

/-- The **single-measurement marginal** `Σ` of a distribution: the total weight of the
assignments giving measurement `m` the outcome `o`. The atomic marginal that no-signaling
constrains. -/
def singleMarginal [BEq O] (L : WDist M O) (m : M) (o : O) : Nat :=
  (L.filter (fun e => e.1 m == o)).foldr (fun e acc => e.2 + acc) 0

/-! ## (B) Empirical models and no-signaling -/

/-- A possibilistic→probabilistic **empirical model**: a distribution over local assignments
per context. (The bare-support `Model` of `MeasurementScenario` is the possibilistic projection:
the set of positive-weight assignments.) -/
structure PModel (M O : Type) where
  /-- The scenario the model lives over. -/
  scenario : Scenario M
  /-- The distribution assigned to each context. -/
  dist : List M → WDist M O

/-- **No-signaling.** The marginal on a measurement shared by two contexts is the same read
through either: for `m` in both `C` and `C'`, `singleMarginal (dist C) m = singleMarginal
(dist C') m`. The marginal on a shared measurement is context-independent. -/
def NoSignaling [BEq O] (E : PModel M O) : Prop :=
  ∀ C, C ∈ E.scenario.contexts → ∀ C', C' ∈ E.scenario.contexts →
    ∀ m, m ∈ C → m ∈ C' → ∀ o : O,
      singleMarginal (E.dist C) m o = singleMarginal (E.dist C') m o

/-! ## (C) A global distribution induces a no-signaling model -/

/-- The model in which **every** context reads one and the same global distribution `G`. The
noncontextual case: all contexts marginalize a single global table. -/
def inducedModel (S : Scenario M) (G : WDist M O) : PModel M O :=
  ⟨S, fun _ => G⟩

/-- **A global distribution induces a no-signaling model.** When every context's distribution
is the same global `G`, the marginal on any shared measurement is `singleMarginal G m o` read
through either context — equal by construction. The probabilistic analogue of
`globalSection_restricts_compatible`. -/
theorem globalDist_implies_noSignaling [BEq O] (S : Scenario M) (G : WDist M O) :
    NoSignaling (inducedModel S G) := by
  intro C _ C' _ m _ _ o; rfl

/-! ## (D) The PR-box probabilistic witness

Each PR context carries the uniform distribution (weight `1` each) over its two PR-allowed
outcome pairs, with off-context measurements set to `false`. The four distributions are
*different lists* — not the restriction of one global table — yet the model is
no-signaling: every shared-measurement marginal is uniform `(1, 1)` on both sides. -/

/-- The assignment on the four-corner measurement carrier with the four named outcomes
(`a, a', b, b'`). -/
def mk (v0 v1 v2 v3 : Bool) : PRM → Bool :=
  fun m => match m with
    | (false, false) => v0
    | (false, true) => v1
    | (true, false) => v2
    | (true, true) => v3

/-- The PR distributions: each two-measurement context's uniform distribution over its two
PR-allowed outcome pairs (`g i ⊕ g j = primed i ∧ primed j`), off-context values `false`. -/
def prDistB (C : List PRM) : WDist PRM Bool :=
  if C = [(false, false), (true, false)] then [(mk false false false false, 1), (mk true false true false, 1)]
  else if C = [(false, false), (true, true)] then [(mk false false false false, 1), (mk true false false true, 1)]
  else if C = [(false, true), (true, false)] then [(mk false false false false, 1), (mk false true true false, 1)]
  else if C = [(false, true), (true, true)] then [(mk false false false true, 1), (mk false true false false, 1)]
  else []

/-- The **PR box as a probabilistic empirical model**. -/
def prBoxP : PModel PRM Bool := ⟨prScenario, prDistB⟩

/-- **The PR box is no-signaling.** Every PR context's distribution is uniform over its two
allowed pairs, so the marginal on any shared measurement is `(1, 1)` read through either
context — even though the four context distributions are different lists. This is
the non-vacuous witness: no-signaling holds without the model descending from a global
distribution (its support is the strongly contextual `prBox`, so no global distribution
exists — the Fine/Bell frontier). -/
theorem prBoxP_noSignaling : NoSignaling prBoxP := by unfold NoSignaling; decide

/-! ## (E) The CHSH/Tsirelson tier: classical 2, quantum 2√2, PR 4

The value layer of the Alice×Bob cover, on the internal Bishop reals. A deterministic
assignment satisfies at most three of the four PR parities (its CHSH score `2·sat − 4` is
at most `2` — the classical bound), while every single context is satisfiable (the PR box
scores `4`). The quantum value sits strictly between. Every level is context-count-scaled — classical
`|C|·(1/2)`, quantum `|C|·(1/√2)`, PR `|C|·1` — with the multiplicity folded over
`prContexts` itself, not written as a numeral; the strict inequalities hold in the
constructive order with explicit witnesses. -/

open Real.Internal

/-- The two outcomes of a Boolean measurement, as a carrier. -/
def boolOutcomes : List Bool := [false, true]

/-- The constant real `2` — the outcome count — to witness invertibility. -/
def twoRealQ : Real := Real.ofRat (Rat.ofNat boolOutcomes.length)

/-- `2` is positive, bounded below by `1`: the constant sequence needs no tail. -/
def twoWitnessQ : Real.PosWitness twoRealQ where
  j := 0
  N := 0
  bound := by
    intro n _
    show Rat.invNatP 0 ≤ Rat.ofNat 2
    show Rat.mk ⟨1, 1, by decide⟩ ≤ Rat.mk (PreRat.ofNat 2)
    rw [Rat.mk_le]
    show (1 : Int) * 1 ≤ 2 * 1
    omega

/-- `1/2`, built from `RReal.inv`. -/
def chshHalf : RReal := RReal.inv twoRealQ twoWitnessQ

/-- The field law `2 · (1/2) = 1`. -/
theorem two_mul_chshHalf : RReal.ofRat (Rat.ofNat 2) * chshHalf = RReal.one :=
  RReal.mul_inv twoRealQ twoWitnessQ

/-- The CHSH correlator of the quantum state: `1/√|O| = √|O|·(1/|O|)` over the two-element
outcome carrier, one per context. -/
def chshWeight : RReal := sqrtNat boolOutcomes.length * chshHalf

/-- The CHSH quantum value: one correlator per context of the PR scenario,
`Σ_{C ∈ prContexts} E_C`. -/
def chshQuantumValue : RReal := RReal.sumConst prContexts chshWeight

/-- The context fold unfolded: the PR scenario has four contexts. -/
theorem chshQuantumValue_unfold :
    chshQuantumValue = chshWeight + chshWeight + chshWeight + chshWeight := by
  show chshWeight + (chshWeight + (chshWeight + (chshWeight + RReal.zero)))
    = chshWeight + chshWeight + chshWeight + chshWeight
  rw [RReal.add_zero, ← RReal.add_assoc, ← RReal.add_assoc]

/-- `a · (−b) = −(a · b)` for the internal reals. -/
theorem RReal.mul_neg' (a b : RReal) : a * (-b) = -(a * b) := by
  have h : a * b + a * (-b) = RReal.zero := by
    rw [← RReal.left_distrib, RReal.add_right_neg, RReal.mul_zero]
  calc a * (-b) = RReal.zero + a * (-b) := (RReal.zero_add _).symm
    _ = (-(a * b) + (a * b)) + a * (-b) := by rw [RReal.add_left_neg]
    _ = -(a * b) + ((a * b) + a * (-b)) := RReal.add_assoc _ _ _
    _ = -(a * b) + RReal.zero := by rw [h]
    _ = -(a * b) := RReal.add_zero _

/-- Four copies of a real sum to four times it. -/
theorem four_fold_sum (w : RReal) :
    w + w + w + w = RReal.ofRat (Rat.ofNat 4) * w := by
  have h1 : RReal.ofRat (Rat.ofNat 4)
      = RReal.one + RReal.one + RReal.one + RReal.one := by
    show RReal.ofRat (Rat.ofNat 4)
      = RReal.ofRat Rat.one + RReal.ofRat Rat.one + RReal.ofRat Rat.one
        + RReal.ofRat Rat.one
    rw [← RReal.ofRat_add, ← RReal.ofRat_add, ← RReal.ofRat_add]
    rfl
  rw [h1, RReal.mul_comm, RReal.left_distrib, RReal.left_distrib, RReal.left_distrib,
    RReal.mul_one]

/-- `2 + 2 = 4` for the internal reals' rational constants. -/
theorem ofRat_two_add_two :
    RReal.ofRat (Rat.ofNat 2) + RReal.ofRat (Rat.ofNat 2) = RReal.ofRat (Rat.ofNat 4) := by
  rw [← RReal.ofRat_add]
  rfl

/-- **The CHSH quantum value is `2√2`**: the four-fold sum of `√2·(1/2)`. -/
theorem chshQuantumValue_eq_two_sqrt2 :
    chshQuantumValue = RReal.ofRat (Rat.ofNat 2) * sqrtNat 2 := by
  rw [chshQuantumValue_unfold, four_fold_sum]
  show RReal.ofRat (Rat.ofNat 4) * (sqrtNat 2 * chshHalf) = _
  have h4 : RReal.ofRat (Rat.ofNat 4) * chshHalf = RReal.ofRat (Rat.ofNat 2) := by
    rw [← ofRat_two_add_two, RReal.right_distrib, two_mul_chshHalf]
    show RReal.ofRat (Rat.ofNat 1) + RReal.ofRat (Rat.ofNat 1) = RReal.ofRat (Rat.ofNat 2)
    rw [← RReal.ofRat_add]
    congr 1
  rw [RReal.mul_comm (RReal.ofRat (Rat.ofNat 4)) (sqrtNat 2 * chshHalf), RReal.mul_assoc,
    RReal.mul_comm chshHalf (RReal.ofRat (Rat.ofNat 4)), h4, RReal.mul_comm]

/-- The integer heart of `1 < √2`: past the tail, the floor approximation of `√2·m`
clears `4m/3`. -/
theorem sqrt_two_lower {m s : Nat} (hm : 9 ≤ m)
    (h1 : s * s ≤ 2 * (m * m)) (h2 : 2 * (m * m) < (s + 1) * (s + 1)) :
    4 * m ≤ 3 * s := by
  rcases Nat.lt_or_ge (3 * s) (4 * m) with hlt | hge
  · exfalso
    have hexpR : (s + 1) * (s + 1) = s * s + 2 * s + 1 := by
      rw [Nat.mul_succ, Nat.succ_mul]; omega
    have hsq : (3 * s + 1) * (3 * s + 1) ≤ (4 * m) * (4 * m) :=
      Nat.mul_self_le_mul_self (by omega)
    have hW : (3 * s) * (3 * s) = 9 * (s * s) := by rw [Nat.mul_mul_mul_comm]
    have hU : (4 * m) * (4 * m) = 16 * (m * m) := by rw [Nat.mul_mul_mul_comm]
    have hexpT : (3 * s + 1) * (3 * s + 1) = (3 * s) * (3 * s) + 2 * (3 * s) + 1 := by
      rw [Nat.mul_succ, Nat.succ_mul]; omega
    have hV : (2 * m) * (2 * m) = 4 * (m * m) := by rw [Nat.mul_mul_mul_comm]
    have hs2 : s ≤ 2 * m := by
      refine le_of_mul_self_le_mul_self ?_
      omega
    have hmm : 9 * m ≤ m * m := Nat.mul_le_mul_right m hm
    omega
  · exact hge

/-- The integer heart of `√2 < 2`: the floor approximation never exceeds `3m/2`. -/
theorem sqrt_two_upper {m s : Nat} (h1 : s * s ≤ 2 * (m * m)) : 2 * s ≤ 3 * m := by
  refine le_of_mul_self_le_mul_self ?_
  have hW : (2 * s) * (2 * s) = 4 * (s * s) := by rw [Nat.mul_mul_mul_comm]
  have hU : (3 * m) * (3 * m) = 9 * (m * m) := by rw [Nat.mul_mul_mul_comm]
  omega

/-- **`1 < √2`** in the constructive order: excess at least `1/3` past tail index `8`. -/
theorem one_lt_sqrtNat_two : RReal.one < sqrtNat 2 := by
  show RReal.Pos (sqrtNat 2 + (-RReal.one))
  refine ⟨2, ?_⟩
  show Real.le (Real.ofRat (Rat.invNatP 2))
    (Real.add (sqrtReal 2) (Real.neg (Real.ofRat Rat.one)))
  intro k
  refine ⟨8, fun n hn => ?_⟩
  show Rat.invNatP 2 ≤ sqrtSeq 2 n + (-Rat.one) + Rat.invNatP k
  have hstep : sqrtSeq 2 n + (-Rat.one)
      ≤ sqrtSeq 2 n + (-Rat.one) + Rat.invNatP k :=
    Rat.le_add_nonneg _ (Rat.invNatP_nonneg k)
  refine Real.Internal.Rat.le_trans ?_ hstep
  show Rat.invNatP 2 ≤ sqrtSeq 2 n + (-Rat.one)
  have hspec := natSqrt_spec (2 * ((n + 1) * (n + 1)))
  have hkey : 4 * (n + 1) ≤ 3 * natSqrt (2 * ((n + 1) * (n + 1))) :=
    sqrt_two_lower (by omega) hspec.1 hspec.2
  show Rat.mk ⟨1, (2 : Int) + 1, by omega⟩
    ≤ Rat.mk (PreRat.add ⟨(natSqrt (2 * ((n + 1) * (n + 1))) : Int), (n : Int) + 1, by omega⟩
        ⟨-(1 : Int), 1, by decide⟩)
  rw [Rat.mk_le]
  show (1 : Int) * (((n : Int) + 1) * 1)
    ≤ ((natSqrt (2 * ((n + 1) * (n + 1))) : Int) * 1 + (-(1 : Int)) * ((n : Int) + 1))
      * ((2 : Int) + 1)
  omega

/-- **`√2 < 2`** in the constructive order: deficit at least `1/2`, no tail needed. -/
theorem sqrtNat_two_lt_two : sqrtNat 2 < RReal.ofRat (Rat.ofNat 2) := by
  show RReal.Pos (RReal.ofRat (Rat.ofNat 2) + (-sqrtNat 2))
  refine ⟨1, ?_⟩
  show Real.le (Real.ofRat (Rat.invNatP 1))
    (Real.add (Real.ofRat (Rat.ofNat 2)) (Real.neg (sqrtReal 2)))
  intro k
  refine ⟨0, fun n _ => ?_⟩
  show Rat.invNatP 1 ≤ Rat.ofNat 2 + (-(sqrtSeq 2 n)) + Rat.invNatP k
  have hstep : Rat.ofNat 2 + (-(sqrtSeq 2 n))
      ≤ Rat.ofNat 2 + (-(sqrtSeq 2 n)) + Rat.invNatP k :=
    Rat.le_add_nonneg _ (Rat.invNatP_nonneg k)
  refine Real.Internal.Rat.le_trans ?_ hstep
  show Rat.invNatP 1 ≤ Rat.ofNat 2 + (-(sqrtSeq 2 n))
  have hspec := natSqrt_spec (2 * ((n + 1) * (n + 1)))
  have hkey : 2 * natSqrt (2 * ((n + 1) * (n + 1))) ≤ 3 * (n + 1) :=
    sqrt_two_upper hspec.1
  show Rat.mk ⟨1, (1 : Int) + 1, by omega⟩
    ≤ Rat.mk (PreRat.add (PreRat.ofNat 2)
        (PreRat.neg ⟨(natSqrt (2 * ((n + 1) * (n + 1))) : Int), (n : Int) + 1, by omega⟩))
  rw [Rat.mk_le]
  show (1 : Int) * (1 * ((n : Int) + 1))
    ≤ ((2 : Int) * ((n : Int) + 1) + -((natSqrt (2 * ((n + 1) * (n + 1))) : Int)) * 1)
      * ((1 : Int) + 1)
  omega

/-- `2` is a positive real (with explicit witness). -/
theorem pos_ofRat_two : RReal.Pos (RReal.ofRat (Rat.ofNat 2)) := by
  refine ⟨0, ?_⟩
  show Real.le (Real.ofRat (Rat.invNatP 0)) (Real.ofRat (Rat.ofNat 2))
  intro k
  refine ⟨0, fun n _ => ?_⟩
  show Rat.invNatP 0 ≤ Rat.ofNat 2 + Rat.invNatP k
  have hstep : Rat.ofNat 2 ≤ Rat.ofNat 2 + Rat.invNatP k :=
    Rat.le_add_nonneg _ (Rat.invNatP_nonneg k)
  refine Real.Internal.Rat.le_trans ?_ hstep
  show Rat.mk ⟨1, 1, by decide⟩ ≤ Rat.mk (PreRat.ofNat 2)
  rw [Rat.mk_le]
  show (1 : Int) * 1 ≤ 2 * 1
  omega

/-- The classical bound is half a correlator per context: `|C|·(1/2) = 2`. -/
theorem contexts_mul_half :
    RReal.ofRat (Rat.ofNat prContexts.length) * chshHalf = RReal.ofRat (Rat.ofNat 2) := by
  show RReal.ofRat (Rat.ofNat 4) * chshHalf = RReal.ofRat (Rat.ofNat 2)
  rw [← ofRat_two_add_two, RReal.right_distrib, two_mul_chshHalf]
  show RReal.ofRat (Rat.ofNat 1) + RReal.ofRat (Rat.ofNat 1) = RReal.ofRat (Rat.ofNat 2)
  rw [← RReal.ofRat_add]
  congr 1

/-- **The classical level is strictly below the quantum value**: `|C|·(1/2) < |C|·(1/√2)`,
i.e. `2 < 2√2`. -/
theorem classical_lt_chshQuantumValue :
    RReal.ofRat (Rat.ofNat prContexts.length) * chshHalf < chshQuantumValue := by
  rw [contexts_mul_half, chshQuantumValue_eq_two_sqrt2]
  show RReal.Pos (RReal.ofRat (Rat.ofNat 2) * sqrtNat 2 + (-(RReal.ofRat (Rat.ofNat 2))))
  have halg : RReal.ofRat (Rat.ofNat 2) * sqrtNat 2 + (-(RReal.ofRat (Rat.ofNat 2)))
      = RReal.ofRat (Rat.ofNat 2) * (sqrtNat 2 + (-RReal.one)) := by
    rw [RReal.left_distrib, RReal.mul_neg', RReal.mul_one]
  rw [halg]
  exact RReal.mul_pos pos_ofRat_two one_lt_sqrtNat_two

/-- **The quantum value is strictly below the PR level**: `|C|·(1/√2) < |C|·1`, i.e.
`2√2 < 4`. -/
theorem chshQuantumValue_lt_pr :
    chshQuantumValue < RReal.ofRat (Rat.ofNat prContexts.length) := by
  show chshQuantumValue < RReal.ofRat (Rat.ofNat 4)
  rw [chshQuantumValue_eq_two_sqrt2]
  show RReal.Pos (RReal.ofRat (Rat.ofNat 4) + (-(RReal.ofRat (Rat.ofNat 2) * sqrtNat 2)))
  have halg : RReal.ofRat (Rat.ofNat 4) + (-(RReal.ofRat (Rat.ofNat 2) * sqrtNat 2))
      = RReal.ofRat (Rat.ofNat 2) * (RReal.ofRat (Rat.ofNat 2) + (-sqrtNat 2)) := by
    have h22 : RReal.ofRat (Rat.ofNat 2) * RReal.ofRat (Rat.ofNat 2)
        = RReal.ofRat (Rat.ofNat 4) := by
      have hone : RReal.ofRat (Rat.ofNat 2) = RReal.one + RReal.one := by
        show RReal.ofRat (Rat.ofNat 2)
          = RReal.ofRat (Rat.ofNat 1) + RReal.ofRat (Rat.ofNat 1)
        rw [← RReal.ofRat_add]
        congr 1
      calc RReal.ofRat (Rat.ofNat 2) * RReal.ofRat (Rat.ofNat 2)
          = (RReal.one + RReal.one) * RReal.ofRat (Rat.ofNat 2) := by rw [← hone]
        _ = RReal.one * RReal.ofRat (Rat.ofNat 2)
              + RReal.one * RReal.ofRat (Rat.ofNat 2) := RReal.right_distrib _ _ _
        _ = RReal.ofRat (Rat.ofNat 2) + RReal.ofRat (Rat.ofNat 2) := by
            rw [RReal.one_mul]
        _ = RReal.ofRat (Rat.ofNat 4) := ofRat_two_add_two
    rw [RReal.left_distrib, RReal.mul_neg', h22]
  rw [halg]
  exact RReal.mul_pos pos_ofRat_two sqrtNat_two_lt_two

/-- **A deterministic assignment satisfies at most three of the four PR parities** —
its CHSH score `2·sat − 4` is at most the classical bound `2`. All four at once would be
a global section, which `prBox_no_global` forbids. -/
theorem pr_parities_at_most_three (g : PRM → Bool) :
    prContexts.countP (fun C => prAllowedB C g) < prContexts.length := by
  show prContexts.countP (fun C => prAllowedB C g) < 4
  rcases Nat.lt_or_ge (prContexts.countP (fun C => prAllowedB C g)) 4 with h | h
  · omega
  · exfalso
    have hall : ∀ C ∈ prContexts, prAllowedB C g = true := by
      have hlen : prContexts.countP (fun C => prAllowedB C g) ≤ prContexts.length :=
        List.countP_le_length
      have hlen4 : prContexts.length = 4 := rfl
      refine List.countP_eq_length.mp ?_
      omega
    exact prBox_no_global ⟨g, fun C hC => hall C hC⟩

/-- **The CHSH/Tsirelson tier.** Classically at most three of the four PR parities hold
(score at most `2`); every single context is satisfiable (the PR box scores `4`); and the
quantum value is exactly `2√2`, strictly between: `2 < 2√2 < 4`. -/
theorem chsh_tsirelson_tier :
    (∀ g : PRM → Bool, prContexts.countP (fun C => prAllowedB C g) < prContexts.length)
    ∧ AllContextsInhabited prBox
    ∧ chshQuantumValue = RReal.ofRat (Rat.ofNat 2) * sqrtNat 2
    ∧ RReal.ofRat (Rat.ofNat prContexts.length) * chshHalf < chshQuantumValue
    ∧ chshQuantumValue < RReal.ofRat (Rat.ofNat prContexts.length) :=
  ⟨pr_parities_at_most_three, prBox_inhabited, chshQuantumValue_eq_two_sqrt2,
   classical_lt_chshQuantumValue, chshQuantumValue_lt_pr⟩

end QuantumContextuality
end Obsmetrologia
