import Infomaterial.Relational.Quantum.HardyModel
import Infomaterial.Relational.Quantum.SupportContextuality

/-! # The Hardy model as a no-signaling empirical model

`Quantum.HardyModel` exhibits the Hardy phenomenon — logical contextuality without strong
contextuality — at the bare *possibilistic* level (`Model`). This module lifts it to the
*probabilistic* level (`Quantum.EmpiricalModel`): an explicit finite **no-signaling**
empirical model `hardyBoxP` (integer weights, à la `Probability.Measure`, no reals) whose
possibilistic support realizes the Hardy phenomenon. It is the Hardy analogue of
`Quantum.SupportContextuality`'s treatment of the PR box.

## The witness

`hardyBoxP` gives each Alice×Bob context (the cover `prScenario`) an integer distribution of
total weight `4`, chosen so that:

* every shared-measurement marginal is `(2, 2)` read through either context — the model is
  **no-signaling** (`hardyBoxP_noSignaling`), with genuinely per-context-varying lists;
* the support has a **global section** `(a,a',b,b') = (0,1,1,0)`
  (`hardyBoxP_support_hasGlobalSection`), so it is *not* strongly contextual; yet
* the local section `a' = 1, b' = 1` of `{a',b'}` lies in the support but extends to no global
  section (`hardyBoxP_support_witness_not_extends`) — the Hardy forced-consequence chain.

So a genuinely no-signaling probabilistic model carries the Hardy phenomenon: logical
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
`Quantum.HardyModel`, `Quantum.SupportContextuality`, `Quantum.EmpiricalModel`.

## Tags

Hardy model, no-signaling, logical contextuality, empirical model, support, contextuality
-/

namespace Infomaterial
namespace Relational.Quantum

/-! ## (A) The Hardy no-signaling distributions -/

/-- The Hardy distributions: each Alice×Bob context's integer distribution (total weight `4`),
chosen so every shared-measurement marginal is `(2, 2)` (hence no-signaling) and the support
realizes the Hardy conditions (`{a,b}` excludes `(1,1)`, `{a,b'}` excludes `(0,1)`, `{a',b}`
excludes `(1,0)`, `{a',b'}` includes `(1,1)`). Off-context measurements are `false`. -/
def hardyDistB (C : List (Fin 4)) : WDist (Fin 4) Bool :=
  if C = [0, 2] then [(mk false false true false, 2), (mk true false false false, 2)]
  else if C = [0, 3] then [(mk false false false false, 2), (mk true false false true, 2)]
  else if C = [1, 2] then [(mk false false false false, 2), (mk false true true false, 2)]
  else if C = [1, 3] then [(mk false false false false, 1), (mk false false false true, 1),
                           (mk false true false false, 1), (mk false true false true, 1)]
  else []

/-- The **Hardy box as a probabilistic empirical model** over the Alice×Bob cover. -/
def hardyBoxP : PModel (Fin 4) Bool := ⟨prScenario, hardyDistB⟩

/-! ## (B) No-signaling -/

/-- **The Hardy empirical model is no-signaling.** Each context's distribution has total weight
`4` with every shared-measurement marginal `(2, 2)` on both sides — even though the four context
distributions are genuinely different lists. -/
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
    (toSupport hardyBoxP).support [1, 3] hardyWitness := by unfold toSupport; decide

/-- **The Hardy witness extends to no global section of the support.** A global `h` agreeing
with the witness on `{a',b'}` has `h 1 = true`, `h 3 = true`; the support of `{a',b}` then
forces `h 2 = true`, the support of `{a,b'}` forces `h 0 = true`, and the support of `{a,b}`
(allowing only unequal Alice/Bob outcomes) forbids `h 0 = h 2 = true` — contradiction. -/
theorem hardyBoxP_witness_not_extends :
    ¬ Extends (toSupport hardyBoxP) [1, 3] hardyWitness := by
  rintro ⟨h, hglob, hagree⟩
  have e1 : h 1 = true := hagree 1 (by decide)
  have e3 : h 3 = true := hagree 3 (by decide)
  have c02 := hglob [0, 2] (by decide)
  have c12 := hglob [1, 2] (by decide)
  have c03 := hglob [0, 3] (by decide)
  simp only [toSupport, hardyBoxP, hardyDistB, List.all_cons, List.all_nil] at c02 c12 c03
  revert e1 e3 c02 c12 c03
  cases h 0 <;> cases h 1 <;> cases h 2 <;> cases h 3 <;> decide

/-- **The Hardy empirical model's support is logically contextual.** The witness `a' = 1,
b' = 1` lies in the support of `{a',b'}` yet extends to no global section. -/
theorem hardyBoxP_support_logicallyContextual : LogicallyContextual (toSupport hardyBoxP) :=
  ⟨[1, 3], by decide, hardyWitness, hardyBoxP_witness_support, hardyBoxP_witness_not_extends⟩

/-! ## (E) The Hardy phenomenon over a no-signaling distribution -/

/-- **The Hardy phenomenon, probabilistically.** The no-signaling Hardy empirical model
(`hardyBoxP_noSignaling`) has a support that is logically contextual *and* has a global section
*and* is not strongly contextual — the strict middle rung realized by a genuinely no-signaling
distribution, the probabilistic completion of `HardyModel.hardyBox_logical_not_strong`. -/
theorem hardyBoxP_support_logical_not_strong :
    Noncontextual (toSupport hardyBoxP) ∧ LogicallyContextual (toSupport hardyBoxP) ∧
      ¬ StronglyContextual (toSupport hardyBoxP) :=
  ⟨hardyBoxP_support_hasGlobalSection, hardyBoxP_support_logicallyContextual,
    hardyBoxP_support_not_stronglyContextual⟩

end Relational.Quantum
end Infomaterial
