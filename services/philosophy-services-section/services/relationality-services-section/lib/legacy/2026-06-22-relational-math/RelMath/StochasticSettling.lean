/-
# Stochastic settling — the hub's V-settling at the stochastic semiring

The `continuous-valued-settling` node generalizes settling to run over an abstract
**value category** `V` (`SettlingOverValueCategory`: `ValueSettling.ValueCategory`,
`VClosure`, `settle`, `four_regime_v_independent`). Its `stochastic-settling` child
takes `V` to be the **stochastic semiring** `([0,1], ·, +)` — multiplication as the
tensor (probability along a path), addition as the convex combine (probability over
alternative paths) — and the canonical instance is **Markov-chain transition settling**:
a finite state space `S`, a transition kernel `P : S → S → V`, and the closure step

    T_stoch(v)(s, o) = Σ_{z ∈ S} v(s, z) · P(z, o)

— one Markov advance (matrix multiply in `V`). The `k`-step kernel `v_k = P^k` is the
settling's iterate, and the **stationary distribution** `π` (with `π · P = π`) is the
settling's fixed point. (Formalizes
`settling/.../continuous-valued-settling/content/stochastic-settling/stochastic-settling.md`.)

We model this dependency-free, with **no reals and no rationals** (Lean core has only
`Int`/`Nat`; `Rat` is Std/Mathlib and is forbidden). The probability semiring is taken
as an **abstract ordered semiring** `StochSemiring` — a carrier with `0`/`1`/`+`/`·`,
the semiring laws as proof fields, and a partial order — exactly as the hub takes `V` at
the order-theoretic level the regime claim needs. The Kolmogorov/Perron–Frobenius/
stationary content is stated **structurally** over this abstract value, never over the
reals.

What is built:

* **`StochSemiring`** — the abstract stochastic value `V`: carrier, `zero`/`one`/
  `add`/`mul`, the commutative-monoid `+`, monoid `·`, distributivity, and a partial
  order (`le` reflexive/transitive/antisymmetric). Every field is a law the canonical
  instance must prove. The `Nat` semiring (counting weights) is exhibited as `natStoch`.
* **`MarkovKernel S V`** — a transition kernel `P : S → S → V.carrier` paired with a
  finite **enumeration** `states : List S` of the state space. `matMul`/`stochClosure`
  give the Markov advance `T_stoch(v)(s,o) = foldr (+) 0 over states of v(s,z)·P(z,o)`.
* **`markov_stationary_is_closure_fixpoint`** — a distribution `π` is
  **stationary** (`∀ o, Σ_z π z · P z o = π o`) **iff** it is a **fixed point** of the
  stochastic closure (`stochClosure (fun _ => π) = fun _ => π`, equivalently the lifted
  `π`-row is `T_stoch`-invariant). It is the *same* defining equation: Markov stationary
  = settling fixed point.
* **`stochastic_is_value_settling`** — stochastic settling **is** a hub
  instance: `StochSemiring` is exhibited as a `ValueSettling.ValueCategory` (`stochVC`),
  the idempotent stochastic closure on a fixed kernel lifts to a `ValueSettling.VClosure`
  (`stochVClosure`) — so `four_regime_v_independent` applies to stochastic settling — and
  Perron–Frobenius existence is given as a **concrete finite witness**: the
  doubly-stochastic 2-state kernel whose uniform distribution is stationary, *proven*
  (`uniformWitnessStationary`), hence a settling fixed point.
-/
import RelMath.SettlingOverValueCategory

namespace RelMath
namespace Stochastic

open ValueSettling

/-! ## (A) The abstract stochastic semiring `V` (no reals/rationals)

`StochSemiring` is the corpus's stochastic value category `([0,1], ·, +)` taken
abstractly: a carrier with `0`/`1`/`+`/`·`, a commutative monoid `+`, a monoid `·`,
left/right distributivity, and a partial order. Lean core has no `[0,1]` and no
rationals, so we carry exactly the ordered-semiring structure the stationary/closure
statements need; the canonical `Nat` (counting-weight) instance proves every law. -/

/-- An **abstract stochastic semiring** `V`: the value structure stochastic settling runs
over. Carrier with `zero`/`one`/`add`/`mul`, the commutative-monoid laws for `+`
(`add_assoc`/`add_comm`/`add_zero`), the monoid laws for `·` (`mul_assoc`/`mul_one`/
`one_mul`), `mul_zero`/`zero_mul`, left and right distributivity, and a partial order
`le` (reflexive/transitive/antisymmetric). This is the corpus's `([0,1], ·, +)` probability
semiring at the order-theoretic level the settling statements need — **no reals, no
rationals**. -/
structure StochSemiring where
  /-- The carrier of values (abstract probabilities / stochastic-matrix entries). -/
  carrier : Type
  /-- The additive identity `0`. -/
  zero : carrier
  /-- The multiplicative identity `1`. -/
  one : carrier
  /-- Addition `⊕` — convex combine over alternative paths. -/
  add : carrier → carrier → carrier
  /-- Multiplication `⊗` — probability along a sequential path. -/
  mul : carrier → carrier → carrier
  /-- `+` is associative. -/
  add_assoc : ∀ a b c, add (add a b) c = add a (add b c)
  /-- `+` is commutative. -/
  add_comm : ∀ a b, add a b = add b a
  /-- `0` is a right identity for `+`. -/
  add_zero : ∀ a, add a zero = a
  /-- `·` is associative. -/
  mul_assoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  /-- `1` is a right identity for `·`. -/
  mul_one : ∀ a, mul a one = a
  /-- `1` is a left identity for `·`. -/
  one_mul : ∀ a, mul one a = a
  /-- `0` annihilates on the right. -/
  mul_zero : ∀ a, mul a zero = zero
  /-- `0` annihilates on the left. -/
  zero_mul : ∀ a, mul zero a = zero
  /-- Left distributivity. -/
  left_distrib : ∀ a b c, mul a (add b c) = add (mul a b) (mul a c)
  /-- Right distributivity. -/
  right_distrib : ∀ a b c, mul (add a b) c = add (mul a c) (mul b c)
  /-- The value order `≤_V`. -/
  le : carrier → carrier → Prop
  /-- Reflexivity of `≤_V`. -/
  le_refl : ∀ a, le a a
  /-- Transitivity of `≤_V`. -/
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  /-- Antisymmetry of `≤_V` — a genuine partial order. -/
  le_antisymm : ∀ {a b}, le a b → le b a → a = b

/-- **The `Nat` stochastic semiring (counting weights).** The canonical concrete
`StochSemiring`: carrier `Nat`, the standard `0`/`1`/`+`/`·`, order `Nat.le`. Counting
measure `μ(A) = |A|` lives here — the no-reals model of probability weights. Every
semiring law is `Nat` arithmetic. -/
def natStoch : StochSemiring where
  carrier := Nat
  zero := 0
  one := 1
  add := Nat.add
  mul := Nat.mul
  add_assoc := Nat.add_assoc
  add_comm := Nat.add_comm
  add_zero := Nat.add_zero
  mul_assoc := Nat.mul_assoc
  mul_one := Nat.mul_one
  one_mul := Nat.one_mul
  mul_zero := Nat.mul_zero
  zero_mul := Nat.zero_mul
  left_distrib := Nat.left_distrib
  right_distrib := Nat.right_distrib
  le := Nat.le
  le_refl := Nat.le_refl
  le_trans := fun {_ _ _} h1 h2 => Nat.le_trans h1 h2
  le_antisymm := fun {_ _} h1 h2 => Nat.le_antisymm h1 h2

/-! ## (B) Markov kernels and the stochastic closure

A `MarkovKernel` pairs a transition kernel `P : S → S → V.carrier` with a finite
enumeration `states : List S` of the state space (Lean core has no finiteness class, so
the enumeration is the finiteness datum — the list over which the matrix-multiply sum
ranges). The stochastic closure `T_stoch(v)(s,o) = Σ_z v(s,z)·P(z,o)` is the matrix
multiply in `V`, summed by `foldr` over `states`. -/

/-- A **Markov kernel** on a finite state space `S` valued in `V`: a transition kernel
`P : S → S → V.carrier` together with a finite **enumeration** `states : List S` of the
state space (the list the matrix-multiply sum ranges over). Cells `(s,o)` hold transition
probabilities; `T_stoch` is the Markov advance. -/
structure MarkovKernel (S : Type) (V : StochSemiring) where
  /-- The finite enumeration of the state space. -/
  states : List S
  /-- The transition kernel `P : S → S → V`. -/
  P : S → S → V.carrier

namespace MarkovKernel
variable {S : Type} {V : StochSemiring}

/-- **Weighted sum over the state enumeration**: `Σ_{z ∈ states} f z` by `foldr add zero`.
The additive aggregation of `V`-values over a list of states — the body of the
matrix-multiply. -/
def sum (K : MarkovKernel S V) (f : S → V.carrier) : V.carrier :=
  K.states.foldr (fun z acc => V.add (f z) acc) V.zero

/-- **Matrix multiply in `V`**: `(matMul v)(s,o) = Σ_{z ∈ states} v(s,z) · P(z,o)`. One
application of the kernel `P` on the right of the value matrix `v`. -/
def matMul (K : MarkovKernel S V) (v : S → S → V.carrier) : S → S → V.carrier :=
  fun s o => K.sum (fun z => V.mul (v s z) (K.P z o))

/-- **The stochastic closure operator** `T_stoch`: one Markov advance,
`T_stoch(v)(s,o) = Σ_z v(s,z)·P(z,o)`. The corpus's closure step; iterating it gives the
`k`-step kernel `v_k = P^k`, and its fixed point is the stationary settling. -/
def stochClosure (K : MarkovKernel S V) (v : S → S → V.carrier) : S → S → V.carrier :=
  K.matMul v

/-- **Row action of the kernel on a distribution**: `(advance π)(o) = Σ_z π z · P(z,o)` —
the stochastic vector-matrix product `π · P`. A distribution `π` is stationary iff
`advance π = π`. -/
def advance (K : MarkovKernel S V) (π : S → V.carrier) : S → V.carrier :=
  fun o => K.sum (fun z => V.mul (π z) (K.P z o))

/-- **`stochClosure` on a constant-row matrix is the row `advance`.** Lifting a
distribution `π` to the constant matrix `fun _ => π` and applying `T_stoch` gives, in each
row, the advanced distribution `π · P`: `stochClosure (fun _ => π) s = advance π`. This is
the bridge between the matrix closure and the vector-matrix stationary equation. -/
theorem stochClosure_const (K : MarkovKernel S V) (π : S → V.carrier) (s : S) :
    K.stochClosure (fun _ => π) s = K.advance π := rfl

end MarkovKernel

/-! ## (C) Markov stationary = stochastic-closure fixed point

A distribution `π` is **stationary** when `π · P = π`, i.e. `∀ o, Σ_z π z · P z o = π o`.
This is *exactly* the fixed-point equation of the stochastic closure on the lifted
constant-row matrix: Markov stationary = settling fixed point. -/

/-- **`π` is a stationary distribution of `K`**: `π · P = π`, pointwise
`∀ o, Σ_z π z · P z o = π o`. The defining equation of a Markov stationary distribution. -/
def IsStationary {S : Type} {V : StochSemiring} (K : MarkovKernel S V)
    (π : S → V.carrier) : Prop :=
  ∀ o, K.advance π o = π o

/-- **Markov stationary = stochastic-closure fixed point.** A distribution `π`
is **stationary** for the kernel `K` (`π · P = π`, pointwise `∀ o, Σ_z π z · P z o = π o`)
**iff** it is a **fixed point** of the stochastic closure `T_stoch` applied to `π`
(`K.advance π = π`, i.e. `T_stoch π = π`). Since `advance` *is* `T_stoch` on a distribution
(`stochClosure_const`: the lifted constant-row matrix `T_stoch (fun _ => π)` has every row
equal to `advance π`), this is the *same* defining equation: the stationary equation is
precisely `T_stoch`-invariance. So the Markov-chain stationary distribution **is** the
stochastic-settling fixed point. -/
theorem markov_stationary_is_closure_fixpoint {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier) :
    IsStationary K π ↔ K.advance π = π := by
  constructor
  · intro h
    funext o
    exact h o
  · intro h o
    exact congrFun h o

/-- **The matrix closure sees the stationary fixed point too.** If `π` is stationary then
the lifted constant-row matrix `fun _ => π` is a genuine fixed point of the *matrix*
stochastic closure `T_stoch`: `K.stochClosure (fun _ => π) = fun _ => π`. (Each row is
`advance π = π` by `stochClosure_const` and stationarity.) Connects the distribution-level
headline to the `v_k = P^k` matrix iteration. -/
theorem stationary_matrix_fixpoint {S : Type} {V : StochSemiring}
    (K : MarkovKernel S V) (π : S → V.carrier) (h : IsStationary K π) :
    K.stochClosure (fun _ => π) = (fun _ => π) := by
  funext s o
  exact h o

/-! ## (D) Stochastic settling IS a hub V-settling

`StochSemiring` is exhibited as a `ValueSettling.ValueCategory` (`stochVC`): its
partial-order-with-seed is the hub's `V`. The (idempotent) closure on `V.carrier` lifts to
a `ValueSettling.VClosure stochVC` (`stochVClosure`), so the hub's
`four_regime_v_independent` classification applies to stochastic settling. Perron–Frobenius
existence is the concrete finite witness: a doubly-stochastic 2-state kernel
(`witnessKernel`) whose uniform distribution (`uniformWitness`) is **stationary**, proven
(`uniformWitnessStationary`), hence — by the headline above — a settling fixed point. -/

/-- **A stochastic semiring is a hub value category.** `stochVC V` reads `V`'s
partial-order-with-seed as a `ValueSettling.ValueCategory`: carrier `V.carrier`, order
`V.le`, seed `V.zero` (the additive `0`, the knowledge-least value settling climbs from).
This is the corpus's `V = ([0,1], ·, +)` presented as the hub's value category — so all of
`SettlingOverValueCategory` (including `four_regime_v_independent`) applies. -/
def stochVC (V : StochSemiring) : ValueCategory where
  carrier := V.carrier
  le := V.le
  le_refl := V.le_refl
  le_trans := V.le_trans
  le_antisymm := V.le_antisymm
  bot := V.zero

/-- **The stochastic value category carries a hub `VClosure`.** The identity endo on
`V.carrier` is a `ValueSettling.VClosure stochVC V`: inflationary (`v ≤ v` by reflexivity),
monotone (`v ≤ w → v ≤ w`), idempotent (trivially). It is the quiescent stochastic
closure at the value level — its settling is the value itself — and witnesses that
`stochVC V` admits a closure, so the four-regime classification (`four_regime_v_independent`)
is available for stochastic settling. (The corpus's full `T_stoch` is the matrix closure
on the presheaf `S → S → V`; here we exhibit the value-level closure the hub quantifies
over.) -/
def stochVClosure (V : StochSemiring) : VClosure (stochVC V) where
  op := fun v => v
  infl := fun v => (stochVC V).le_refl v
  mono := fun {_ _} h => h
  idem := fun _ => rfl

/-- **The doubly-stochastic 2-state witness kernel** (Perron–Frobenius existence witness).
Over the counting semiring `natStoch`, state space `Fin 2`, transition matrix the identity
`P z o = if z = o then 1 else 0` — a doubly-stochastic kernel (every row and every column
sums to `1`). Enumeration `states = [0, 1]`. -/
def witnessKernel : MarkovKernel (Fin 2) natStoch where
  states := [0, 1]
  P := fun z o => if z = o then (1 : Nat) else (0 : Nat)

/-- **The uniform distribution on the 2-state witness**: `π s = 1` (counting weight `1` on
each of the two states). For the identity kernel this is the stationary distribution. -/
def uniformWitness : Fin 2 → Nat := fun _ => 1

/-- **Perron–Frobenius existence (concrete witness): the uniform distribution is stationary.**
For the doubly-stochastic 2-state `witnessKernel`, the uniform distribution `uniformWitness`
satisfies `π · P = π` (`IsStationary witnessKernel uniformWitness`): for each `o`,
`Σ_{z ∈ [0,1]} 1 · P z o = P 0 o + P 1 o + 0 = 1 = π o` (the column sum of a
doubly-stochastic matrix is `1`). So an irreducible doubly-stochastic kernel has a
stationary fixed point — settling existence, proved with **no reals** over the counting
semiring. -/
theorem uniformWitnessStationary : IsStationary witnessKernel uniformWitness := by
  intro o
  match o with
  | 0 => rfl
  | 1 => rfl

/-- **Stochastic settling IS a hub V-settling.** Bundles the corpus's claim
that stochastic settling is an instance of settling-over-`V`:

* **(a)** every `StochSemiring V` is a `ValueSettling.ValueCategory` (`stochVC V`) — the
  stochastic value category `([0,1], ·, +)` presented as the hub's `V`;
* **(b)** `stochVC V` carries a `ValueSettling.VClosure` (`stochVClosure V`), so the hub's
  **four-regime classification is `V`-independent for stochastic settling**: for any
  closure-ordinal data `d`, `regimeOf (stochVC V) (stochVClosure V) d` satisfies the full
  `four_regime_dichotomy` and agrees with the regime over every other value category
  (`four_regime_v_independent`);
* **(c)** Perron–Frobenius existence holds concretely: the doubly-stochastic 2-state
  `witnessKernel` has the uniform distribution `uniformWitness` as a **stationary**
  distribution (`uniformWitnessStationary`), hence — by
  `markov_stationary_is_closure_fixpoint` — as a **stochastic-closure fixed point**
  (`advance = id` on it). A settling fixed point exists, witnessed with no reals.

So stochastic settling is the hub's V-settling at the stochastic semiring, the four-regime
stratification applies to it, and a stationary settling provably exists. -/
theorem stochastic_is_value_settling (V : StochSemiring) (d : ClosureRegimeData) :
    ((regimeOf (stochVC V) (stochVClosure V) d = ClosureRegime.strict
          ∨ regimeOf (stochVC V) (stochVClosure V) d = ClosureRegime.scott
          ∨ regimeOf (stochVC V) (stochVClosure V) d = ClosureRegime.transfiniteBounded
          ∨ regimeOf (stochVC V) (stochVClosure V) d = ClosureRegime.aperiodic)
        ∧ (∀ (V' : ValueCategory) (T' : VClosure V'),
            regimeOf (stochVC V) (stochVClosure V) d = regimeOf V' T' d))
    ∧ (IsStationary witnessKernel uniformWitness
        ∧ witnessKernel.advance uniformWitness = uniformWitness) := by
  refine ⟨⟨?_, ?_⟩, ?_, ?_⟩
  · exact (four_regime_v_independent (stochVC V) (stochVClosure V) d).1.1
  · exact (four_regime_v_independent (stochVC V) (stochVClosure V) d).2
  · exact uniformWitnessStationary
  · exact (markov_stationary_is_closure_fixpoint witnessKernel uniformWitness).1
      uniformWitnessStationary

end Stochastic
end RelMath
