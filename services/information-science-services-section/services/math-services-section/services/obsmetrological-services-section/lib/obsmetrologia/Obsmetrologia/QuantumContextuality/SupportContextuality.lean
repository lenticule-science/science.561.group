import Obsmetrologia.QuantumContextuality.EmpiricalModel

/-! # The support of a probabilistic model, and the weld to strong contextuality

This module welds the two quantum layers: it takes a probabilistic empirical model
(`QuantumContextuality.EmpiricalModel`) to its **possibilistic support** — the bare-support `Model` of
`QuantumContextuality.MeasurementScenario` — and proves that the no-signaling PR-box distribution's
support is **strongly contextual**. That closes the chain

  no-signaling distribution → its support → strong contextuality → (no global distribution),

with the last arrow following at once: a global distribution would have a global section in
its support, which strong contextuality forbids. So `prBoxP` admits **no** global
distribution — the support side proved here already forces it. The standalone Fine's-theorem
form (a finite linear-programming argument on `Probability.RealStochasticInterval`) is the
natural next step.

## Why not a Čech `H¹` obstruction

The tempting move is to exhibit a nonzero single-section Čech `H¹` (cf.
`Cohomology.SettlingCohomologyH1`). That would be **vacuous**: `Cohomology.h1_vanishes` proves
single-valued sections always glue (the settling sheaf is flasque), so any single-section
cocycle is a coboundary and `H¹ = 0` identically. cohomological contextuality
(Abramsky–Mansfield–Barbosa) lives in the relative cohomology of the ℤ-linear sheaf of
sections and is a separate, research-grade target — left as a frontier red node, *not*
overclaimed here. The finite obstruction is the support-level one this module proves.

## Main definitions

* `toSupport` — the possibilistic support `Model` of a probabilistic `PModel`: the
  positive-weight local assignments per context.

## Main results

* `prBoxP_toSupport_inhabited`, `prBoxP_toSupport_no_global` — the PR-box distribution's
  support is nonempty over every context yet has no global section.
* `prBoxP_support_strongly_contextual` — the no-signaling PR-box distribution's support is
  strongly contextual: the weld of `EmpiricalModel` to `MeasurementScenario`.

## References

`content/.../probability-theory`; Abramsky–Brandenburger 2011, Abramsky–Mansfield–Barbosa
2012 (the cohomological frontier). Siblings: `QuantumContextuality.EmpiricalModel`,
`QuantumContextuality.MeasurementScenario`.

## Tags

empirical model, support, strong contextuality, PR box, no-signaling, sheaf
-/

namespace Obsmetrologia
namespace QuantumContextuality

variable {M O : Type}

/-! ## (A) The possibilistic support of a probabilistic model -/

/-- The **possibilistic support** of a probabilistic model: the bare-support `Model` whose
support over a context is the set of assignments matching some positive-weight local
assignment of the distribution. The forgetful map probabilistic → possibilistic. -/
def toSupport [BEq O] (E : PModel M O) : Model M O where
  scenario := E.scenario
  support := fun C g =>
    (E.dist C).any (fun e => decide (0 < e.2) && C.all (fun m => e.1 m == g m)) = true

/-! ## (B) The PR-box distribution's support is strongly contextual -/

/-- **Every PR context's support is nonempty.** Each context's distribution has a
positive-weight entry, whose own assignment lies in the support. -/
theorem prBoxP_toSupport_inhabited : AllContextsInhabited (toSupport prBoxP) := by
  intro C hC
  simp only [toSupport, prBoxP, prScenario, prContexts, List.mem_cons,
    List.not_mem_nil, or_false] at hC
  rcases hC with rfl | rfl | rfl | rfl
  · exact ⟨mk false false false false, by unfold toSupport; decide⟩
  · exact ⟨mk false false false false, by unfold toSupport; decide⟩
  · exact ⟨mk false false false false, by unfold toSupport; decide⟩
  · exact ⟨mk false false false true, by unfold toSupport; decide⟩

/-- **The PR-box distribution's support has no global section.** A global assignment in the
support of all four contexts would satisfy `g a = g b`, `g a = g b'`, `g a' = g b`, and
`g a' ≠ g b'` (each context's two allowed pairs pin the relevant parity), an impossibility. -/
theorem prBoxP_toSupport_no_global : ¬ HasGlobalSection (toSupport prBoxP) := by
  rintro ⟨g, hg⟩
  have h0 := hg [(false, false), (true, false)] (by decide)
  have h1 := hg [(false, false), (true, true)] (by decide)
  have h2 := hg [(false, true), (true, false)] (by decide)
  have h3 := hg [(false, true), (true, true)] (by decide)
  simp only [toSupport, prBoxP, prDistB, List.all_cons, List.all_nil] at h0 h1 h2 h3
  revert h0 h1 h2 h3
  cases g (false, false) <;> cases g (false, true) <;> cases g (true, false) <;> cases g (true, true) <;> decide

/-- **The no-signaling PR-box distribution's support is strongly contextual.** This is the
weld of the probabilistic layer (`EmpiricalModel`, where `prBoxP_noSignaling` holds) to the
possibilistic contextuality layer (`MeasurementScenario`): the support of a 
no-signaling distribution is strongly contextual, so the distribution admits no global section
— and hence (Fine/Bell, the frontier) no global distribution. -/
theorem prBoxP_support_strongly_contextual : StronglyContextual (toSupport prBoxP) :=
  ⟨prBoxP_toSupport_inhabited, prBoxP_toSupport_no_global⟩

end QuantumContextuality
end Obsmetrologia
