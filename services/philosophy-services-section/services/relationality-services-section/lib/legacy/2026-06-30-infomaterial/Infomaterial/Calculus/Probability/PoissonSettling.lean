import Infomaterial.Calculus.Probability.Stochastic
import Infomaterial.Calculus.Order.NumberTheoryCombinatorics
import Infomaterial.Calculus.Probability.Measure
import Infomaterial.Calculus.Real.Internal

/-!
# Poisson as a birth–death settling fixed point

In this corpus probability **is settling**: `Probability.Stochastic` builds the stochastic
semiring over an abstract ordered carrier and proves `markov_stationary_is_closure_fixpoint` — a
stationary distribution *is* a settling fixed point. So the Poisson distribution is not an
exp-series analytic object here; it is the **stationary distribution of the birth–death chain**
(birth rate `λ`, death rate `n` at state `n`), the canonical settling whose fixed point has the
Poisson shape `π(n) ∝ λⁿ/n!`.

A reversible chain's stationary distribution is fixed by **detailed balance**
`λ·π(n) = (n+1)·π(n+1)`. Cleared of denominators this is a pure `Nat` identity — `no exp, no
division` — so the Poisson shape is reachable entirely within the corpus's discrete settling
machinery. The `e^{−λ}` normalization is only `π(0)`, and settling values are unnormalized
(climbing from the seed `⊥`), so it never enters the fixed-point characterization.

## Main results

* `poisson_detailed_balance` — the cleared birth–death detailed-balance identity for the Poisson
  weights `λⁿ/n!`: `λ·λⁿ·(n+1)! = (n+1)·λⁿ⁺¹·n!`. The exp-free, division-free statement that the
  Poisson shape is the birth–death stationary distribution, i.e. (via
  `markov_stationary_is_closure_fixpoint`) the settling fixed point.

## References

`content/.../sprinkled-causal-set-settling`; the probability-as-settling bridge of
`Probability.Stochastic`.

## Tags

Poisson distribution, birth–death chain, detailed balance, stationary distribution, settling
fixed point
-/

namespace Infomaterial
namespace Probability.PoissonSettling

open Infomaterial.Probability.Stochastic

/-! ## Detailed balance ⟹ stationary (the reversibility bridge, carrier-free)

`markov_stationary_is_closure_fixpoint` says a stationary distribution *is* a settling fixed point.
The reversible-chain route to stationarity is **detailed balance**: if `π(z)·P(z,o) = π(o)·P(o,z)`
and the rows sum to `1`, then `π` is stationary. This holds over *any* `StochSemiring` —
carrier-independent — so it carries the Poisson detailed balance straight to a settling fixed point. -/

/-- A weighted sum is congruent in its summand. -/
theorem sum_congr {S : Type} {V : StochSemiring} (K : MarkovKernel S V) (f g : S → V.carrier)
    (h : ∀ z, f z = g z) : K.sum f = K.sum g := by
  unfold MarkovKernel.sum
  induction K.states with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, h a, ih]

/-- A constant factor distributes over a weighted sum. -/
theorem mul_sum {S : Type} {V : StochSemiring} (K : MarkovKernel S V) (c : V.carrier)
    (f : S → V.carrier) : V.mul c (K.sum f) = K.sum (fun z => V.mul c (f z)) := by
  unfold MarkovKernel.sum
  induction K.states with
  | nil => exact V.mul_zero c
  | cons a t ih => simp only [List.foldr_cons]; rw [V.left_distrib, ih]

/-- **Detailed balance ⟹ stationary.** For a reversible kernel — `π(z)·P(z,o) = π(o)·P(o,z)` for
all `z,o` — with rows summing to `1`, the distribution `π` is stationary (`π·P = π`), hence a
settling fixed point (`markov_stationary_is_closure_fixpoint`). The probability-side proof of the
Poisson stationary distribution, over any `StochSemiring`. -/
theorem detailed_balance_implies_stationary {S : Type} {V : StochSemiring} (K : MarkovKernel S V)
    (π : S → V.carrier)
    (hrev : ∀ z o, V.mul (π z) (K.P z o) = V.mul (π o) (K.P o z))
    (hrow : ∀ o, K.sum (fun z => K.P o z) = V.one) :
    IsStationary K π := by
  intro o
  show K.sum (fun z => V.mul (π z) (K.P z o)) = π o
  rw [sum_congr K (fun z => V.mul (π z) (K.P z o)) (fun z => V.mul (π o) (K.P o z))
      (fun z => hrev z o)]
  rw [← mul_sum K (π o) (fun z => K.P o z), hrow o, V.mul_one]

/-- **Poisson detailed balance (cleared).** The Poisson weights `π(n) = λⁿ/n!` satisfy the
birth–death detailed-balance equation `λ·π(n) = (n+1)·π(n+1)` — written here cleared of the `n!`
denominators as a pure `Nat` identity:
`λ · λⁿ · (n+1)! = (n+1) · λⁿ⁺¹ · n!`.
Both sides are `λⁿ⁺¹ · (n+1) · n!`, using `(n+1)! = (n+1)·n!` and `λⁿ⁺¹ = λ·λⁿ`. This is the
exp-free, division-free statement that the Poisson shape is the birth–death chain's stationary
distribution — the settling fixed point of `Probability.Stochastic`. -/
theorem poisson_detailed_balance (lam n : Nat) :
    lam * lam ^ n * NumberTheory.factorial (n + 1)
    = (n + 1) * lam ^ (n + 1) * NumberTheory.factorial n := by
  rw [NumberTheory.factorial_succ, Nat.pow_succ]
  ac_rfl

/-! ## The sprinkling expectation — `E[·]` as the counting valuation

`measure_is_valuation` reads the counting measure as a settling valuation. Lifting it from events
to `Nat`-valued random variables gives the **expectation** `E[f] = ∑_{ω} f(ω)`, the linear
functional the expected operator `⟨□φ⟩` passes through: linearity sends `⟨∑ g⟩` to `∑ ⟨g⟩`, pulling
the deterministic Möbius/field weights out of the sprinkling average, and `E[1_A] = measure A` ties
it back to the valuation. -/

open Infomaterial.Probability.Measure

/-- The **counting expectation** of a `Nat`-valued random variable `f` over a finite sample space:
`E[f] = ∑_{ω ∈ outcomes} f(ω)`. -/
def expVal {Ω : Type} (S : SampleSpace Ω) (f : Ω → Nat) : Nat :=
  S.outcomes.foldr (fun ω acc => f ω + acc) 0

/-- **Expectation is additive.** `E[f + g] = E[f] + E[g]`. -/
theorem expVal_add {Ω : Type} (S : SampleSpace Ω) (f g : Ω → Nat) :
    expVal S (fun ω => f ω + g ω) = expVal S f + expVal S g := by
  unfold expVal
  induction S.outcomes with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

/-- **Expectation is homogeneous.** `E[c·f] = c·E[f]`. -/
theorem expVal_smul {Ω : Type} (S : SampleSpace Ω) (c : Nat) (f : Ω → Nat) :
    expVal S (fun ω => c * f ω) = c * expVal S f := by
  unfold expVal
  induction S.outcomes with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; rw [Nat.mul_add]

/-- **Expectation of an indicator is its measure.** `E[1_A] = μ(A)` — the bridge identifying the
expectation functional with the counting valuation of `measure_is_valuation`. -/
theorem expVal_indicator {Ω : Type} (S : SampleSpace Ω) (A : Event Ω) :
    expVal S (fun ω => if A ω = true then 1 else 0) = S.measure A := by
  unfold expVal SampleSpace.measure
  induction S.outcomes with
  | nil => rfl
  | cons a t ih => rw [SampleSpace.measure_go_cons]; simp only [List.foldr_cons, ih]

/-! ## Closing the gate — a concrete Poisson birth–death settling fixed point over the rationals

The remaining piece needed a value carrier with division (a stochastic kernel's rows sum to `1`).
The corpus's own derived field `Real.Internal.Rat` is that carrier — axiom-clean by construction,
part of the derivation chain (not external core `Rat`). Instantiating `StochSemiring` at it and
building a genuine *fractional* reversible birth–death kernel, the Poisson-shaped stationary
distribution is a settling fixed point — no longer gated. -/

/-- A corpus rational `n/d`. -/
def q (n d : Int) (h : 0 < d := by decide) : Real.Internal.Rat := Real.Internal.Rat.mk ⟨n, d, h⟩

/-- **The rational stochastic semiring** over the corpus's derived field `Real.Internal.Rat` — the
field-valued value category carrying genuine (fractional) transition probabilities. -/
def ratStoch : StochSemiring where
  carrier := Real.Internal.Rat
  zero := 0
  one := 1
  add := (· + ·)
  mul := (· * ·)
  add_assoc := Real.Internal.Rat.add_assoc
  add_comm := Real.Internal.Rat.add_comm
  add_zero := Real.Internal.Rat.add_zero
  mul_assoc := Real.Internal.Rat.mul_assoc
  mul_one := Real.Internal.Rat.mul_one
  one_mul := Real.Internal.Rat.one_mul
  mul_zero := Real.Internal.Rat.mul_zero
  zero_mul := Real.Internal.Rat.zero_mul
  left_distrib := Real.Internal.Rat.left_distrib
  right_distrib := Real.Internal.Rat.right_distrib
  le := (· ≤ ·)
  le_refl := Real.Internal.Rat.le_refl
  le_trans := fun {_ _ _} h1 h2 => Real.Internal.Rat.le_trans h1 h2
  le_antisymm := fun {_ _} h1 h2 => Real.Internal.Rat.le_antisymm h1 h2

/-- **A fractional reversible birth–death kernel on `{0,1}`** (birth `λ=2`, death `1`), over the
rational semiring. Transition matrix `[[1/2, 1/2], [1/4, 3/4]]` — a genuine stochastic matrix
(rows sum to `1`), not a permutation. -/
def poissonKernel : MarkovKernel (Fin 2) ratStoch where
  states := [0, 1]
  P := fun z o =>
    match z, o with
    | 0, 0 => q 1 2
    | 0, 1 => q 1 2
    | 1, 0 => q 1 4
    | 1, 1 => q 3 4

/-- **The Poisson-shaped stationary distribution** `π = (1/3, 2/3)` — ratio `π₁/π₀ = 2 = λ`, the
birth–death balance `λ·π(0) = 1·π(1)`. -/
def poissonPi : Fin 2 → Real.Internal.Rat := fun z =>
  match z with
  | 0 => q 1 3
  | 1 => q 2 3

/-- **The gate, closed.** The Poisson-shaped distribution is a stationary distribution of the
fractional birth–death kernel — `π · P = π` — hence (by `markov_stationary_is_closure_fixpoint`) a
**settling fixed point**. A concrete Poisson settling object over the corpus's own rational field;
each row balance reduces, via `mk_eq`, to a decidable integer cross-multiplication. -/
theorem poissonKernel_stationary : IsStationary poissonKernel poissonPi := by
  intro o
  match o with
  | 0 => exact Real.Internal.Rat.mk_eq.mpr (by unfold Real.Internal.PreRat.equiv; decide)
  | 1 => exact Real.Internal.Rat.mk_eq.mpr (by unfold Real.Internal.PreRat.equiv; decide)

/-- The Poisson stationary distribution **is** a stochastic-closure (settling) fixed point. -/
theorem poissonKernel_settling_fixpoint : poissonKernel.advance poissonPi = poissonPi :=
  (markov_stationary_is_closure_fixpoint poissonKernel poissonPi).1 poissonKernel_stationary

end Probability.PoissonSettling
end Infomaterial
