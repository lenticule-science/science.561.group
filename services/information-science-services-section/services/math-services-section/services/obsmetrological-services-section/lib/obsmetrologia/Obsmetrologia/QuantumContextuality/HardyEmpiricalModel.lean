import Obsmetrologia.QuantumContextuality.HardyModel
import Obsmetrologia.QuantumContextuality.SupportContextuality

/-! # The Hardy model as a no-signaling empirical model

`QuantumContextuality.HardyModel` exhibits the Hardy phenomenon — logical contextuality without strong
contextuality — at the bare *possibilistic* level (`Model`). This module lifts it to the
*probabilistic* level (`QuantumContextuality.EmpiricalModel`): an explicit finite **no-signaling**
empirical model `hardyBoxP` (integer weights, à la `Probability.Measure`, no reals) whose
possibilistic support realizes the Hardy phenomenon. It is the Hardy analogue of
`QuantumContextuality.SupportContextuality`'s treatment of the PR box.

## The witness

`hardyBoxP` gives each Alice×Bob context (the cover `prScenario`) an integer distribution of
total weight `4`, chosen so that:

* every shared-measurement marginal is `(2, 2)` read through either context — the model is
  **no-signaling** (`hardyBoxP_noSignaling`), with per-context-varying lists;
* the support has a **global section** `(a,a',b,b') = (0,1,1,0)`
  (`hardyBoxP_support_hasGlobalSection`), so it is *not* strongly contextual; yet
* the local section `a' = 1, b' = 1` of `{a',b'}` lies in the support but extends to no global
  section (`hardyBoxP_support_witness_not_extends`) — the Hardy forced-consequence chain.

So a no-signaling probabilistic model carries the Hardy phenomenon: logical
contextuality with a global section yet no extension of one particular outcome.

## Main definitions

* `hardyDistB`, `hardyBoxP` — the integer no-signaling Hardy distributions and the empirical
  model over `prScenario`.

## Main results

* `hardyBoxP_noSignaling` — the Hardy empirical model is no-signaling.
* `hardyBoxP_support_hasGlobalSection`, `hardyBoxP_support_not_stronglyContextual` — its support
  has a global section, so it is not strongly contextual.
* `hardyBoxP_support_logicallyContextual` — its support is logically contextual.
* `hardyBoxP_support_logical_not_strong` — the Hardy phenomenon over a no-signaling
  distribution: logically contextual, with a global section, yet not strongly contextual.

## References

`content/.../probability-theory`; L. Hardy 1993; Abramsky & Brandenburger 2011. Siblings:
`QuantumContextuality.HardyModel`, `QuantumContextuality.SupportContextuality`, `QuantumContextuality.EmpiricalModel`.

## Tags

Hardy model, no-signaling, logical contextuality, empirical model, support, contextuality
-/

namespace Obsmetrologia
namespace QuantumContextuality

/-! ## (A) The Hardy no-signaling distributions -/

/-- The Hardy distributions: each Alice×Bob context's integer distribution (total weight `4`),
chosen so every shared-measurement marginal is `(2, 2)` (hence no-signaling) and the support
realizes the Hardy conditions (`{a,b}` excludes `(1,1)`, `{a,b'}` excludes `(0,1)`, `{a',b}`
excludes `(1,0)`, `{a',b'}` includes `(1,1)`). Off-context measurements are `false`. -/
def hardyDistB (C : List PRM) : WDist PRM Bool :=
  if C = [(false, false), (true, false)] then [(mk false false true false, 2), (mk true false false false, 2)]
  else if C = [(false, false), (true, true)] then [(mk false false false false, 2), (mk true false false true, 2)]
  else if C = [(false, true), (true, false)] then [(mk false false false false, 2), (mk false true true false, 2)]
  else if C = [(false, true), (true, true)] then [(mk false false false false, 1), (mk false false false true, 1),
                           (mk false true false false, 1), (mk false true false true, 1)]
  else []

/-- The **Hardy box as a probabilistic empirical model** over the Alice×Bob cover. -/
def hardyBoxP : PModel PRM Bool := ⟨prScenario, hardyDistB⟩

/-! ## (B) No-signaling -/

/-- **The Hardy empirical model is no-signaling.** Each context's distribution has total weight
`4` with every shared-measurement marginal `(2, 2)` on both sides — even though the four context
distributions are different lists. -/
theorem hardyBoxP_noSignaling : NoSignaling hardyBoxP := by unfold NoSignaling; decide

/-! ## (C) The support has a global section — not strongly contextual -/

/-- **The Hardy empirical model's support has a global section.** The assignment
`(a,a',b,b') = (0,1,1,0)` lies in the positive-weight support of every context, so the support
is realizable as a whole — not strongly contextual (unlike the PR box). -/
theorem hardyBoxP_support_hasGlobalSection : HasGlobalSection (toSupport hardyBoxP) := by
  refine ⟨mk false true true false, ?_⟩
  intro C hC
  simp only [toSupport, hardyBoxP, prScenario, prContexts, List.mem_cons,
    List.not_mem_nil, or_false] at hC
  rcases hC with rfl | rfl | rfl | rfl <;> · unfold toSupport; decide

/-- **The Hardy empirical model's support is not strongly contextual.** It has a global section,
which precludes the strong-contextuality conjunct `¬ HasGlobalSection`. -/
theorem hardyBoxP_support_not_stronglyContextual :
    ¬ StronglyContextual (toSupport hardyBoxP) := by
  rintro ⟨_, hns⟩
  exact hns hardyBoxP_support_hasGlobalSection

/-! ## (D) The support is logically contextual — the Hardy witness fails to extend -/

/-- The Hardy witness `a' = 1, b' = 1` lies in the support of `{a',b'}` of `hardyBoxP`. -/
theorem hardyBoxP_witness_support :
    (toSupport hardyBoxP).support [(false, true), (true, true)] hardyWitness := by unfold toSupport; decide

/-- **The Hardy witness extends to no global section of the support.** A global `h` agreeing
with the witness on `{a',b'}` has `h 1 = true`, `h 3 = true`; the support of `{a',b}` then
forces `h 2 = true`, the support of `{a,b'}` forces `h 0 = true`, and the support of `{a,b}`
(allowing only unequal Alice/Bob outcomes) forbids `h 0 = h 2 = true` — contradiction. -/
theorem hardyBoxP_witness_not_extends :
    ¬ Extends (toSupport hardyBoxP) [(false, true), (true, true)] hardyWitness := by
  rintro ⟨h, hglob, hagree⟩
  have e1 : h (false, true) = true := hagree (false, true) (by decide)
  have e3 : h (true, true) = true := hagree (true, true) (by decide)
  have c02 := hglob [(false, false), (true, false)] (by decide)
  have c12 := hglob [(false, true), (true, false)] (by decide)
  have c03 := hglob [(false, false), (true, true)] (by decide)
  simp only [toSupport, hardyBoxP, hardyDistB, List.all_cons, List.all_nil] at c02 c12 c03
  revert e1 e3 c02 c12 c03
  cases h (false, false) <;> cases h (false, true) <;> cases h (true, false) <;> cases h (true, true) <;> decide

/-- **The Hardy empirical model's support is logically contextual.** The witness `a' = 1,
b' = 1` lies in the support of `{a',b'}` yet extends to no global section. -/
theorem hardyBoxP_support_logicallyContextual : LogicallyContextual (toSupport hardyBoxP) :=
  ⟨[(false, true), (true, true)], by decide, hardyWitness, hardyBoxP_witness_support,
    hardyBoxP_witness_not_extends⟩

/-! ## (E) The Hardy phenomenon over a no-signaling distribution -/

/-- **The Hardy phenomenon, probabilistically.** The no-signaling Hardy empirical model
(`hardyBoxP_noSignaling`) has a support that is logically contextual *and* has a global section
*and* is not strongly contextual — the strict middle rung realized by a no-signaling
distribution, the probabilistic completion of `HardyModel.hardyBox_logical_not_strong`. -/
theorem hardyBoxP_support_logical_not_strong :
    Noncontextual (toSupport hardyBoxP) ∧ LogicallyContextual (toSupport hardyBoxP) ∧
      ¬ StronglyContextual (toSupport hardyBoxP) :=
  ⟨hardyBoxP_support_hasGlobalSection, hardyBoxP_support_logicallyContextual,
    hardyBoxP_support_not_stronglyContextual⟩

/-! ## The Hardy value layer: the paradox probability is strictly positive

The possibilistic Hardy phenomenon above says the witness extends to no global section;
the value layer prices it: the maximal Hardy paradox probability is
`(5√5 − 11)/2 = (5/2)·(√5 − 11/5)`, and it is strictly positive in the constructive
order. The margin is `√5 − 11/5 ≥ 1/50` past tail index `61`, with integer heart
`111m ≤ 50·⌊√5·m⌋`. -/

open Real.Internal

/-- The rational `11/5`. -/
def elevenFifths : Real.Internal.Rat := Rat.mk ⟨11, 5, by omega⟩

/-- The **Hardy paradox probability**, `(5/2)·(√5 − 11/5) = (5√5 − 11)/2`. -/
def hardyValue : RReal :=
  RReal.ofRat (Rat.ofNat 5) * (sqrtNat 5 + (-(RReal.ofRat elevenFifths))) * chshHalf

/-- The integer heart of `11/5 < √5`: past the tail, the floor approximation of `√5·m`
clears `111m/50`. -/
theorem sqrt_five_margin {m s : Nat} (hm : 62 ≤ m)
    (h1 : s * s ≤ 5 * (m * m)) (h2 : 5 * (m * m) < (s + 1) * (s + 1)) :
    111 * m ≤ 50 * s := by
  rcases Nat.lt_or_ge (50 * s) (111 * m) with hlt | hge
  · exfalso
    have hexpR : (s + 1) * (s + 1) = s * s + 2 * s + 1 := by
      rw [Nat.mul_succ, Nat.succ_mul]; omega
    have hsq : (50 * s + 1) * (50 * s + 1) ≤ (111 * m) * (111 * m) :=
      Nat.mul_self_le_mul_self (by omega)
    have hW : (50 * s) * (50 * s) = 2500 * (s * s) := by rw [Nat.mul_mul_mul_comm]
    have hU : (111 * m) * (111 * m) = 12321 * (m * m) := by rw [Nat.mul_mul_mul_comm]
    have hexpT : (50 * s + 1) * (50 * s + 1)
        = (50 * s) * (50 * s) + 2 * (50 * s) + 1 := by
      rw [Nat.mul_succ, Nat.succ_mul]; omega
    have hV : (3 * m) * (3 * m) = 9 * (m * m) := by rw [Nat.mul_mul_mul_comm]
    have hs3 : s ≤ 3 * m := by
      refine le_of_mul_self_le_mul_self ?_
      omega
    have hmm : 62 * m ≤ m * m := Nat.mul_le_mul_right m hm
    omega
  · exact hge

/-- **`11/5 < √5`** in the constructive order: excess at least `1/50` past tail `61`. -/
theorem elevenFifths_lt_sqrtNat_five :
    RReal.ofRat elevenFifths < sqrtNat 5 := by
  show RReal.Pos (sqrtNat 5 + (-(RReal.ofRat elevenFifths)))
  refine ⟨49, ?_⟩
  show Real.le (Real.ofRat (Rat.invNatP 49))
    (Real.add (sqrtReal 5) (Real.neg (Real.ofRat elevenFifths)))
  intro k
  refine ⟨61, fun n hn => ?_⟩
  show Rat.invNatP 49 ≤ sqrtSeq 5 n + (-elevenFifths) + Rat.invNatP k
  have hstep : sqrtSeq 5 n + (-elevenFifths)
      ≤ sqrtSeq 5 n + (-elevenFifths) + Rat.invNatP k :=
    Rat.le_add_nonneg _ (Rat.invNatP_nonneg k)
  refine Real.Internal.Rat.le_trans ?_ hstep
  show Rat.invNatP 49 ≤ sqrtSeq 5 n + (-elevenFifths)
  have hspec := natSqrt_spec (5 * ((n + 1) * (n + 1)))
  have hkey : 111 * (n + 1) ≤ 50 * natSqrt (5 * ((n + 1) * (n + 1))) :=
    sqrt_five_margin (by omega) hspec.1 hspec.2
  show Rat.mk ⟨1, (49 : Int) + 1, by omega⟩
    ≤ Rat.mk (PreRat.add ⟨(natSqrt (5 * ((n + 1) * (n + 1))) : Int), (n : Int) + 1, by omega⟩
        (PreRat.neg ⟨11, 5, by omega⟩))
  rw [Rat.mk_le]
  show (1 : Int) * (((n : Int) + 1) * 5)
    ≤ ((natSqrt (5 * ((n + 1) * (n + 1))) : Int) * 5 + (-(11 : Int)) * ((n : Int) + 1))
      * ((49 : Int) + 1)
  omega

/-- `5` is a positive real. -/
theorem pos_ofRat_five : RReal.Pos (RReal.ofRat (Rat.ofNat 5)) := by
  refine ⟨0, ?_⟩
  show Real.le (Real.ofRat (Rat.invNatP 0)) (Real.ofRat (Rat.ofNat 5))
  intro k
  refine ⟨0, fun n _ => ?_⟩
  show Rat.invNatP 0 ≤ Rat.ofNat 5 + Rat.invNatP k
  have hstep : Rat.ofNat 5 ≤ Rat.ofNat 5 + Rat.invNatP k :=
    Rat.le_add_nonneg _ (Rat.invNatP_nonneg k)
  refine Real.Internal.Rat.le_trans ?_ hstep
  show Rat.mk ⟨1, 1, by decide⟩ ≤ Rat.mk (PreRat.ofNat 5)
  rw [Rat.mk_le]
  show (1 : Int) * 1 ≤ 5 * 1
  omega

/-- `1/2` is a positive real: the reciprocal's terms are constantly `1/2`. -/
theorem pos_chshHalf : RReal.Pos chshHalf := by
  refine ⟨1, ?_⟩
  show Real.le (Real.ofRat (Rat.invNatP 1)) (Real.inv twoRealQ twoWitnessQ)
  intro k
  refine ⟨0, fun n _ => ?_⟩
  show Rat.invNatP 1
    ≤ Real.Internal.Rat.inv (Rat.ofNat 2) + Rat.invNatP k
  have hstep : Real.Internal.Rat.inv (Rat.ofNat 2)
      ≤ Real.Internal.Rat.inv (Rat.ofNat 2) + Rat.invNatP k :=
    Rat.le_add_nonneg _ (Rat.invNatP_nonneg k)
  refine Real.Internal.Rat.le_trans ?_ hstep
  show Rat.invNatP 1 ≤ Real.Internal.Rat.inv (Rat.ofNat 2)
  decide

/-- **The Hardy paradox probability is strictly positive**: `0 < (5√5 − 11)/2`. The
event the possibilistic layer proves unextendable nevertheless carries strictly
positive weight. -/
theorem hardyValue_pos : RReal.Pos hardyValue :=
  RReal.mul_pos
    (RReal.mul_pos pos_ofRat_five elevenFifths_lt_sqrtNat_five)
    pos_chshHalf

end QuantumContextuality
end Obsmetrologia
