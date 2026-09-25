import Obsmetrologia.QuantumContextuality.ContextualObstruction

/-! # The Hardy model — logical contextuality without strong contextuality

The Abramsky–Brandenburger possibilistic hierarchy (`QuantumContextuality.ContextualObstruction`) has a
strict middle rung: a model can be **logically contextual** — some local section extends to
no global section — while still admitting *some* global section, hence **not** strongly
contextual. That gap is the **Hardy phenomenon**. The PR box (`QuantumContextuality.MeasurementScenario`)
sits on the strong rung above it and so witnesses logical contextuality only degenerately;
the Hardy model is the canonical inhabitant of the gap itself.

Over the same Alice×Bob cover as the PR box (`prScenario`, measurements on the four-corner
carrier `PRM`,
`b = 2`, `b' = 3`, outcomes `Bool`), the Hardy support encodes the four possibilistic Hardy
conditions:

* `{a',b'}` : the event `(a' = 1, b' = 1)` is **possible** (the support is unconstrained);
* `{a',b}`  : `a' = 1 ⟹ b = 1` (forbid `(1,0)`);
* `{a,b'}`  : `b' = 1 ⟹ a = 1` (forbid `(0,1)`);
* `{a,b}`   : `(a = 1, b = 1)` is **impossible** (forbid `(1,1)`).

The constant-`false` assignment lies in every support, so the model **has a global section**
(`hardyBox_hasGlobalSection`) and is not strongly contextual. Yet the witnessing local
section `a' = 1, b' = 1` of `{a',b'}` extends to none: `a' = 1` forces `b = 1`, `b' = 1`
forces `a = 1`, and then `(a = 1, b = 1)` is forbidden. So that one support element fails to
extend — logical contextuality.

## Main definitions

* `hardyAllowedB`, `hardyBox` — the Hardy support indicator and empirical model over
  `prScenario`.
* `hardyWitness` — the local section `a' = 1, b' = 1` (`0` elsewhere) that fails to extend.

## Main results

* `hardyBox_hasGlobalSection` — the constant-`false` assignment is a global section, so the
  Hardy model is `Noncontextual` and not `StronglyContextual`.
* `hardy_witness_not_extends` — the Hardy local section `a' = 1, b' = 1` extends to no global
  section (the Hardy chain of forced consequences contradicts).
* `hardyBox_logicallyContextual` — the Hardy model is logically contextual.
* `hardyBox_logical_not_strong` — the Hardy phenomenon: logically contextual, with a global
  section, yet not strongly contextual — the strict middle rung is inhabited.

## References

`content/.../sheaf`; L. Hardy, *Nonlocality for two particles without inequalities for almost
all entangled states* (1993); Abramsky & Brandenburger 2011 (§ logical contextuality).
Siblings: `QuantumContextuality.ContextualObstruction`, `QuantumContextuality.MeasurementScenario`.

## Tags

contextuality, logical contextuality, Hardy model, global section, extension, hierarchy
-/

namespace Obsmetrologia
namespace QuantumContextuality

/-! ## (A) The Hardy empirical model -/

/-- The Hardy support indicator on an Alice×Bob context `[i, j]`, keyed off the primedness of
each measurement. Each context forbids exactly one outcome pair, encoding the Hardy
possibilistic conditions; `{a',b'}` (both primed) is unconstrained. -/
def hardyAllowedB (C : List PRM) (g : PRM → Bool) : Bool :=
  match C with
  | [i, j] =>
      match primed i, primed j with
      | false, false => !(g i && g j)        -- {a,b}  : forbid a = 1 ∧ b = 1
      | false, true  => !(!(g i) && g j)     -- {a,b'} : forbid a = 0 ∧ b' = 1  (b'=1 ⟹ a=1)
      | true,  false => !(g i && !(g j))     -- {a',b} : forbid a' = 1 ∧ b = 0  (a'=1 ⟹ b=1)
      | true,  true  => true                 -- {a',b'}: unconstrained ((a',b')=(1,1) possible)
  | _ => false

/-- The **Hardy empirical model** over the Alice×Bob cover `prScenario`. -/
def hardyBox : Model PRM Bool where
  scenario := prScenario
  support := fun C g => hardyAllowedB C g = true

/-! ## (B) The Hardy model has a global section -/

/-- **The Hardy model has a global section: the constant-`false` assignment.** Each context's
single forbidden pair involves at least one outcome `= 1`, so all-`false` is allowed
everywhere — the Hardy table is possibilistically realizable as a whole, unlike the PR box. -/
theorem hardyBox_hasGlobalSection : HasGlobalSection hardyBox := by
  refine ⟨fun _ => false, ?_⟩
  intro C hC
  simp only [hardyBox, prScenario, prContexts, List.mem_cons,
    List.not_mem_nil, or_false] at hC
  rcases hC with rfl | rfl | rfl | rfl <;>
    · show hardyAllowedB _ _ = true; decide

/-- The Hardy model is **noncontextual** in the weak sense of having a global section. -/
theorem hardyBox_noncontextual : Noncontextual hardyBox := hardyBox_hasGlobalSection

/-- **The Hardy model is not strongly contextual.** Having a global section
(`hardyBox_hasGlobalSection`) precludes the strong-contextuality conjunct `¬ HasGlobalSection`. -/
theorem hardyBox_not_stronglyContextual : ¬ StronglyContextual hardyBox := by
  rintro ⟨_, hns⟩
  exact hns hardyBox_hasGlobalSection

/-! ## (C) The Hardy local section that fails to extend -/

/-- The Hardy local section `a' = 1, b' = 1` (and `0` on the unprimed measurements). It lies
in the support of `{a',b'}` (which is unconstrained) but extends to no global section. -/
def hardyWitness : PRM → Bool := fun m => m.2

/-- The Hardy witness lies in the support of context `{a',b'}`. -/
theorem hardy_witness_support : hardyBox.support [(false, true), (true, true)] hardyWitness := by
  show hardyAllowedB [(false, true), (true, true)] hardyWitness = true; decide

/-- **The Hardy witness extends to no global section.** A global `h` agreeing with the witness
on `{a',b'}` has `h 1 = true` (`a' = 1`) and `h 3 = true` (`b' = 1`). Then context `{a',b}`
forces `h 2 = true` (`a' = 1 ⟹ b = 1`), context `{a,b'}` forces `h 0 = true`
(`b' = 1 ⟹ a = 1`), and context `{a,b}` forbids `h 0 = true ∧ h 2 = true` — contradiction.
This is the Hardy chain of forced consequences. -/
theorem hardy_witness_not_extends : ¬ Extends hardyBox [(false, true), (true, true)] hardyWitness := by
  rintro ⟨h, hglob, hagree⟩
  have e1 : h (false, true) = true := hagree (false, true) (by decide)
  have e3 : h (true, true) = true := hagree (true, true) (by decide)
  have c02 := hglob [(false, false), (true, false)] (by decide)
  have c12 := hglob [(false, true), (true, false)] (by decide)
  have c03 := hglob [(false, false), (true, true)] (by decide)
  simp only [hardyBox, hardyAllowedB, primed] at c02 c12 c03
  rw [e1] at c12
  rw [e3] at c03
  revert c02 c12 c03
  cases h (false, false) <;> cases h (true, false) <;> decide

/-! ## (D) The Hardy phenomenon: the strict middle rung is inhabited -/

/-- **The Hardy model is logically contextual.** The witness `a' = 1, b' = 1` lies in the
support of `{a',b'}` yet extends to no global section. -/
theorem hardyBox_logicallyContextual : LogicallyContextual hardyBox :=
  ⟨[(false, true), (true, true)], by decide, hardyWitness, hardy_witness_support, hardy_witness_not_extends⟩

/-- **The Hardy phenomenon — the strict middle rung is inhabited.** The Hardy model is
logically contextual *and* noncontextual (it has a global section) *and* not strongly
contextual: a model can fail to extend a particular local section while still admitting some
global section. This is exactly the gap between `MeasurementScenario.Noncontextual`
(has *some* global section) and `PossibilisticallyNoncontextual` (every section extends) that
`ContextualObstruction` names, now realized by a concrete finite witness. -/
theorem hardyBox_logical_not_strong :
    Noncontextual hardyBox ∧ LogicallyContextual hardyBox ∧ ¬ StronglyContextual hardyBox :=
  ⟨hardyBox_noncontextual, hardyBox_logicallyContextual, hardyBox_not_stronglyContextual⟩

end QuantumContextuality
end Obsmetrologia
