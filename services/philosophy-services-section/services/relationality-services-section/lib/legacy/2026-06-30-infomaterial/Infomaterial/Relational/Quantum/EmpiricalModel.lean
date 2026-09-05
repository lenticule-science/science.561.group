import Infomaterial.Relational.Quantum.MeasurementScenario

/-! # Empirical models and no-signaling

The probabilistic refinement of `Quantum.MeasurementScenario`: a context now carries not a
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
carries the uniform distribution over its two PR-allowed outcome pairs — **genuinely
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
* `prBoxP_noSignaling` — the PR box is no-signaling, with genuinely per-context-varying
  distributions (the non-vacuous witness; cf. its strongly contextual support `prBox`).

## References

`content/.../probability-theory`; Abramsky & Brandenburger 2011. Sibling:
`Quantum.MeasurementScenario`, `Probability.Measure`.

## Tags

empirical model, no-signaling, marginal, PR box, contextuality, probability
-/

namespace Infomaterial
namespace Relational.Quantum

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
*genuinely different lists* — not the restriction of one global table — yet the model is
no-signaling: every shared-measurement marginal is uniform `(1, 1)` on both sides. -/

/-- The assignment on `Fin 4` with the four named outcomes (`a, a', b, b'`). -/
def mk (v0 v1 v2 v3 : Bool) : Fin 4 → Bool :=
  fun k => if k = 0 then v0 else if k = 1 then v1 else if k = 2 then v2 else v3

/-- The PR distributions: each two-measurement context's uniform distribution over its two
PR-allowed outcome pairs (`g i ⊕ g j = primed i ∧ primed j`), off-context values `false`. -/
def prDistB (C : List (Fin 4)) : WDist (Fin 4) Bool :=
  if C = [0, 2] then [(mk false false false false, 1), (mk true false true false, 1)]
  else if C = [0, 3] then [(mk false false false false, 1), (mk true false false true, 1)]
  else if C = [1, 2] then [(mk false false false false, 1), (mk false true true false, 1)]
  else if C = [1, 3] then [(mk false false false true, 1), (mk false true false false, 1)]
  else []

/-- The **PR box as a probabilistic empirical model**. -/
def prBoxP : PModel (Fin 4) Bool := ⟨prScenario, prDistB⟩

/-- **The PR box is no-signaling.** Every PR context's distribution is uniform over its two
allowed pairs, so the marginal on any shared measurement is `(1, 1)` read through either
context — even though the four context distributions are genuinely different lists. This is
the non-vacuous witness: no-signaling holds without the model descending from a global
distribution (its support is the strongly contextual `prBox`, so no global distribution
exists — the Fine/Bell frontier). -/
theorem prBoxP_noSignaling : NoSignaling prBoxP := by unfold NoSignaling; decide

end Relational.Quantum
end Infomaterial
