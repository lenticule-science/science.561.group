import Infomaterial.Relational.Spacetime.Causal.Interval

/-!
# The Möbius function of the causal order, and its past-layer coefficients

The causal order is a locally finite poset, so it carries the canonical **Möbius function** of its
incidence algebra: `μ(x,x) = 1` and `μ(x,y) = −∑_{x ≼ z ≺ y} μ(x,z)` for `x ≺ y`, the alternating
inclusion–exclusion that inverts summation over intervals (`∑_{x ≼ z ≼ y} μ(x,z) = [x = y]`).
Grouping `μ` by the past-layer abundance of the [order interval](Spacetime.Causal.Interval.lean) gives the
**layer coefficients** `c_k(x) = ∑_{z ∈ L_k(x)} μ(z,x)` — the weights the causal d'Alembertian
carries, read off the order's own incidence algebra rather than fitted to a manifold.

This module supplies the Möbius function (decidably, by fuel saturation over the finite event
list) and the layer coefficients, with the diamond witness exhibiting a concrete `μ`-profile and
its alternating layer coefficients.

## Main definitions

* `leqB` — the reflexive causal order `x ≼ y` of a strict `prec`.
* `mobius` — the incidence-algebra Möbius function `μ(x,y)`, saturated over the event list.
* `coeff` — the past-layer coefficient `c_k(x) = ∑_{z ∈ L_k(x)} μ(z,x)`.

## Main results

* `mobius_self` — `μ(x,x) = 1`.
* `mobius_zero_of_not_above` — `μ(x,y) = 0` off the order (`x ≠ y`, `x ⊀ y`).
* `diamond_mobius_profile` / `diamond_mobius_orthogonality` — the diamond's `μ`-values
  (`μ(0,3) = 1`, `μ(1,3) = μ(2,3) = −1`) and the interval inversion `∑_{z ≼ 3} μ(0,z) = 0`.
* `diamond_layer_coeffs` — the diamond's alternating layer coefficients `c_0(3) = −2`, `c_2(3) = 1`.

## References

`content/.../lorentzian-causal-settling/content/causal-dalembertian`; reads the order interval and
past layers of `Spacetime.Causal.Interval`.

## Tags

Möbius function, incidence algebra, causal order, layer coefficient, causal d'Alembertian
-/

namespace Infomaterial
namespace Relational.Spacetime.Incidence.Mobius

open Infomaterial.Relational.Spacetime.Causal.Interval

/-! ## (A) The reflexive causal order -/

/-- The **reflexive causal order** `x ≼ y` of a strict transitively-closed `prec`: `x = y` or
`x ≺ y`. -/
def leqB {E : Type} [DecidableEq E] (prec : E → E → Bool) (x y : E) : Bool :=
  decide (x = y) || prec x y

/-! ## (B) The incidence-algebra Möbius function -/

/-- The Möbius recursion at **fuel** `n`: `μ(x,x) = 1`, and for `x ≺ y` the inclusion–exclusion
`μ(x,y) = −∑_{z : x ≼ z ≺ y} μ(x,z)` summed over listed events `z` strictly below `y`. The fuel
bounds the recursion depth (every causal chain in a finite event list is shorter than its
length); `mobius` saturates it. -/
def mobAux {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E) :
    Nat → E → Int
  | 0, _ => 0
  | n + 1, y =>
      if x = y then 1
      else if prec x y = true then
        - ((es.filter (fun z => leqB prec x z && prec z y)).foldl
            (fun acc z => acc + mobAux es prec x n z) 0)
      else 0

/-- The **Möbius function** `μ(x,y)` of the causal order, saturating the fuel recursion at the
event-list length (a strict bound on any causal chain). -/
def mobius {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x y : E) : Int :=
  mobAux es prec x (es.length + 1) y

/-- **`μ(x,x) = 1`** — the incidence identity on the diagonal. -/
theorem mobius_self {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E) :
    mobius es prec x x = 1 := by
  simp [mobius, mobAux]

/-- **`μ(x,y) = 0` off the order** — when `x ≠ y` and `x ⊀ y`, the pair carries no incidence
weight. -/
theorem mobius_zero_of_not_above {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (x y : E) (hne : x ≠ y) (h : prec x y = false) :
    mobius es prec x y = 0 := by
  simp [mobius, mobAux, hne, h]

/-! ## (C) The past-layer coefficients -/

/-- The **past-layer coefficient** `c_k(x) = ∑_{z ∈ L_k(x)} μ(z,x)`: the Möbius weights of the
past events at interval abundance `k`, summed. These are the weights the causal d'Alembertian
carries on layer `k`. -/
def coeff {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E) (k : Nat) : Int :=
  (pastLayer es prec x k).foldl (fun acc z => acc + mobius es prec z x) 0

/-! ## (D) The diamond witness

The corpus diamond (`Lorentzian.Spacetime.Dimension.OrderingFraction.diamondPrec` over `fourEvents`) has Möbius profile at
top event `3`: the covering pairs `μ(1,3) = μ(2,3) = −1`, the doubly-bracketed `μ(0,3) = +1`. The
interval `[0,3]` inverts to zero (`∑_{z ≼ 3} μ(0,z) = 1 − 1 − 1 + 1 = 0`), and the past-layer
coefficients alternate: `c_0(3) = μ(1,3) + μ(2,3) = −2`, `c_2(3) = μ(0,3) = +1`. -/

open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

/-- **The diamond's Möbius profile at the top event.** `μ(0,3) = 1` (the rank-2 interval),
`μ(1,3) = μ(2,3) = −1` (the covering links). -/
theorem diamond_mobius_profile :
    mobius fourEvents diamondPrec 0 3 = 1
    ∧ mobius fourEvents diamondPrec 1 3 = -1
    ∧ mobius fourEvents diamondPrec 2 3 = -1 := by
  refine ⟨by decide, by decide, by decide⟩

/-- **Möbius inversion on the diamond interval `[0,3]`.** `∑_{z ≼ 3} μ(0,z) = μ(0,0) + μ(0,1) +
μ(0,2) + μ(0,3) = 1 − 1 − 1 + 1 = 0` — the incidence orthogonality `∑_{x ≼ z ≼ y} μ(x,z) = [x=y]`
at `(0,3)`, `x ≠ y`. -/
theorem diamond_mobius_orthogonality :
    mobius fourEvents diamondPrec 0 0 + mobius fourEvents diamondPrec 0 1
      + mobius fourEvents diamondPrec 0 2 + mobius fourEvents diamondPrec 0 3 = 0 := by
  decide

/-- **The diamond's alternating layer coefficients.** `c_0(3) = −2` (the two covering links, each
`μ = −1`) and `c_2(3) = 1` (the single rank-2 pair, `μ = +1`) — the layer profile `(2,0,1)` carried
with alternating Möbius signs. -/
theorem diamond_layer_coeffs :
    coeff fourEvents diamondPrec 3 0 = -2
    ∧ coeff fourEvents diamondPrec 3 2 = 1 := by
  refine ⟨by decide, by decide⟩

/-! ## (E) Orthogonality — the interval telescope

The defining property of the Möbius function is the inversion `∑_{x ≼ z ≼ y} μ(x,z) = [x = y]`.
Its algebraic core is the **telescope** below: for `x ≺ y` the apex value cancels the sum over the
proper down-interval. The full saturated inversion additionally requires that the recursion's
inner fuel (`n`) and the saturating fuel agree on the interval — `mobius_stable`, the obligation
that the value is constant once the fuel exceeds the interval's chain *height* (not its
cardinality: covering pairs have height `1` at cardinality `0`). The diamond witness
(`diamond_mobius_orthogonality`) is the saturated inversion on a concrete interval. -/

/-- **The Möbius recursion telescopes the proper interval.** For `x ≺ y`, the apex
`μ_{n+1}(x,y)` cancels the sum of `μ_n` over the proper down-interval `{z : x ≼ z ≺ y}` — their
total is `0`. This is `∑_{x ≼ z ≼ y} μ(x,z) = 0` (the `x ≠ y` case of orthogonality) read off the
definition at adjacent fuel levels. -/
theorem mobAux_interval_telescope {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (x y : E) (n : Nat) (hne : x ≠ y) (hxy : prec x y = true) :
    mobAux es prec x (n + 1) y
      + (es.filter (fun z => leqB prec x z && prec z y)).foldl
          (fun acc z => acc + mobAux es prec x n z) 0 = 0 := by
  simp [mobAux, hne, hxy]
  omega

/-! ## (F) Fuel stability and general orthogonality

The saturated `mobius` is correct because the fuel recursion stabilises once the fuel exceeds the
rank of the apex. The rank is supplied by a **topological index** `idx : E → Nat` with
`prec a b → idx a < idx b` — a global time coordinate, which every finite causal order carries.
Fuel stability then promotes the interval telescope (E) to the full Möbius inversion at any
adequate fuel. -/

/-- Folding `acc + f z` over a list is congruent in `f` on the list's members. -/
theorem foldl_add_congr {α : Type} (L : List α) (f g : α → Int) (c : Int)
    (h : ∀ z ∈ L, f z = g z) :
    L.foldl (fun acc z => acc + f z) c = L.foldl (fun acc z => acc + g z) c := by
  induction L generalizing c with
  | nil => rfl
  | cons a t ih =>
    simp only [List.foldl_cons]
    rw [h a (List.mem_cons_self ..)]
    exact ih (c + g a) (fun z hz => h z (List.mem_cons_of_mem a hz))

/-- **Fuel stability.** Given a topological index `idx` (`prec a b → idx a < idx b`), the Möbius
recursion is constant in fuel once the fuel exceeds the apex rank: `μ_m(x,y) = μ_{m+1}(x,y)` for
`idx y < m`. Strong induction on `idx y` — the recursion descends to `z ≺ y` with strictly smaller
index. -/
theorem mobAux_fuel_stable {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E)
    (idx : E → Nat) (htopo : ∀ a b, prec a b = true → idx a < idx b) :
    ∀ (y : E) (m : Nat), idx y < m → mobAux es prec x m y = mobAux es prec x (m + 1) y := by
  suffices H : ∀ N (y : E), idx y < N → ∀ (m : Nat), idx y < m →
      mobAux es prec x m y = mobAux es prec x (m + 1) y by
    intro y m hm; exact H (idx y + 1) y (Nat.lt_succ_self _) m hm
  intro N
  induction N with
  | zero => intro y hy; exact absurd hy (Nat.not_lt_zero _)
  | succ N ih =>
    intro y hyN m hm
    obtain ⟨m', rfl⟩ : ∃ m', m = m' + 1 := ⟨m - 1, by omega⟩
    by_cases hxy : x = y
    · simp [mobAux, hxy]
    · by_cases hp : prec x y = true
      · simp only [mobAux, if_neg hxy, if_pos hp]
        congr 1
        apply foldl_add_congr
        intro z hz
        have hzy : prec z y = true := by
          have h2 := (List.mem_filter.mp hz).2
          simp only [Bool.and_eq_true] at h2
          exact h2.2
        have hidx : idx z < idx y := htopo z y hzy
        exact ih z (by omega) m' (by omega)
      · have hp' : prec x y = false := by cases h : prec x y <;> simp_all
        simp [mobAux, hxy, hp']

/-- **Möbius inversion (general).** For `x ≺ y`, the apex Möbius value cancels the sum over the
proper down-interval `{z : x ≼ z ≺ y}` at any adequate fuel (`idx y < m`):
`μ(x,y) + ∑_{x ≼ z ≺ y} μ(x,z) = 0` — i.e. `∑_{x ≼ z ≼ y} μ(x,z) = 0`, the defining incidence
inversion. The telescope (E) gives this with a fuel mismatch; fuel stability erases it. -/
theorem mobAux_orthogonality {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (x : E) (idx : E → Nat) (htopo : ∀ a b, prec a b = true → idx a < idx b)
    (y : E) (m : Nat) (hxy : prec x y = true) (hm : idx y < m) :
    mobAux es prec x m y
      + (es.filter (fun z => leqB prec x z && prec z y)).foldl
          (fun acc z => acc + mobAux es prec x m z) 0 = 0 := by
  have hne : x ≠ y := fun h => by subst h; exact absurd (htopo x x hxy) (Nat.lt_irrefl _)
  obtain ⟨m', rfl⟩ : ∃ m', m = m' + 1 := ⟨m - 1, by omega⟩
  have hcongr :
      (es.filter (fun z => leqB prec x z && prec z y)).foldl
          (fun acc z => acc + mobAux es prec x m' z) 0
      = (es.filter (fun z => leqB prec x z && prec z y)).foldl
          (fun acc z => acc + mobAux es prec x (m' + 1) z) 0 := by
    apply foldl_add_congr
    intro z hz
    have hzy : prec z y = true := by
      have h2 := (List.mem_filter.mp hz).2
      simp only [Bool.and_eq_true] at h2
      exact h2.2
    have hidx : idx z < idx y := htopo z y hzy
    exact mobAux_fuel_stable es prec x idx htopo z m' (by omega)
  rw [← hcongr]
  exact mobAux_interval_telescope es prec x y m' hne hxy

/-- The diamond instantiates the general inversion: `Fin.val` is a topological index
(`diamondPrec a b → a.val < b.val`), so `mobAux_orthogonality` applies at the apex `3`. The
hypotheses are real, not vacuous. -/
theorem diamond_orthogonality_general :
    mobAux fourEvents diamondPrec 0 4 3
      + (fourEvents.filter (fun z => leqB diamondPrec 0 z && diamondPrec z 3)).foldl
          (fun acc z => acc + mobAux fourEvents diamondPrec 0 4 z) 0 = 0 :=
  mobAux_orthogonality fourEvents diamondPrec 0 (fun e => e.val) (by decide) 3 4 (by decide)
    (by decide)

/-! ## (G) Orthogonality on the saturated `mobius`

The default `mobius` saturates the fuel at `es.length + 1`. That fuel is adequate for the apex `y`
exactly when `idx y < es.length + 1` — the saturation bridge that lands the general inversion on
the canonical Möbius function. (Discharging this hypothesis unconditionally is the rank-bound
`idx y ≤ es.length`, a pigeonhole on chains of distinct listed events.) -/

/-- **Möbius inversion on `mobius`.** With a topological index `idx` whose apex value fits the
saturating fuel (`idx y < es.length + 1`), the canonical Möbius function satisfies the inversion
`μ(x,y) + ∑_{x ≼ z ≺ y} μ(x,z) = 0` for `x ≺ y`. -/
theorem mobius_orthogonality {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (x : E) (idx : E → Nat) (htopo : ∀ a b, prec a b = true → idx a < idx b)
    (y : E) (hxy : prec x y = true) (hbnd : idx y < es.length + 1) :
    mobius es prec x y
      + (es.filter (fun z => leqB prec x z && prec z y)).foldl
          (fun acc z => acc + mobius es prec x z) 0 = 0 := by
  simp only [mobius]
  exact mobAux_orthogonality es prec x idx htopo y (es.length + 1) hxy hbnd

/-- The diamond discharges the bridge: `idx 3 = 3 < 5 = |fourEvents| + 1`, so the inversion holds
on the saturated `mobius` at the apex. -/
theorem diamond_mobius_orthogonality_saturated :
    mobius fourEvents diamondPrec 0 3
      + (fourEvents.filter (fun z => leqB diamondPrec 0 z && diamondPrec z 3)).foldl
          (fun acc z => acc + mobius fourEvents diamondPrec 0 z) 0 = 0 :=
  mobius_orthogonality fourEvents diamondPrec 0 (fun e => e.val) (by decide) 3 (by decide)
    (by decide)

/-! ## (H) Discharging the bridge — the past count is a bounded topological index

The adequacy hypothesis is discharged from the causal order's own defining properties: for a
transitive, irreflexive order with listed predecessors, the **past count** `|{w : w ≺ z}|` is a
topological index (`a ≺ b → pastCount a < pastCount b`, since the past of `a` is a strict subset
of the past of `b`), and it is bounded by `es.length`. So `idx := pastCount` needs no supplied
witness — orthogonality holds on `mobius` for any genuine finite causal order. -/

/-- Filtering by a stronger predicate keeps no more elements. -/
theorem filter_le_imp {α : Type} (l : List α) (p q : α → Bool)
    (hpq : ∀ a, p a = true → q a = true) :
    (l.filter p).length ≤ (l.filter q).length := by
  induction l with
  | nil => simp
  | cons a t ih =>
    by_cases hpa : p a = true
    · have hqa : q a = true := hpq a hpa
      simp [hpa, hqa]; omega
    · simp only [Bool.not_eq_true] at hpa
      by_cases hqa : q a = true
      · simp [hpa, hqa]; omega
      · simp only [Bool.not_eq_true] at hqa
        simp [hpa, hqa]; exact ih

/-- A member satisfying `q` but not `p` makes the stronger filter strictly shorter. -/
theorem filter_lt_imp {α : Type} (l : List α) (p q : α → Bool)
    (hpq : ∀ a, p a = true → q a = true)
    (w : α) (hw : w ∈ l) (hqw : q w = true) (hpw : p w = false) :
    (l.filter p).length < (l.filter q).length := by
  induction l with
  | nil => simp at hw
  | cons a t ih =>
    by_cases hpa : p a = true
    · have hqa : q a = true := hpq a hpa
      have hwt : w ∈ t := by
        rcases List.mem_cons.mp hw with h | h
        · subst h; rw [hpa] at hpw; exact Bool.noConfusion hpw
        · exact h
      simp [hpa, hqa]; exact ih hwt
    · simp only [Bool.not_eq_true] at hpa
      by_cases hqa : q a = true
      · simp [hpa, hqa]
        have := filter_le_imp t p q hpq; omega
      · simp only [Bool.not_eq_true] at hqa
        have hwt : w ∈ t := by
          rcases List.mem_cons.mp hw with h | h
          · subst h; rw [hqa] at hqw; exact Bool.noConfusion hqw
          · exact h
        simp [hpa, hqa]; exact ih hwt

/-- **The past count is a topological index.** For a transitive, irreflexive order whose
predecessors are listed, `a ≺ b → pastCount a < pastCount b`: every predecessor of `a` precedes
`b` (transitivity), and `a` itself precedes `b` (witness) but not `a` (irreflexivity). -/
theorem pastCount_topo {E : Type} (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (a b : E) (hab : prec a b = true) :
    pastCount es prec a < pastCount es prec b :=
  filter_lt_imp es (fun w => prec w a) (fun w => prec w b)
    (fun w hw => htrans w a b hw hab) a (hmem a b hab) hab (hirr a)

/-- **Möbius inversion on `mobius`, unconditional.** For a genuine finite causal order
(transitive, irreflexive, predecessors listed), the canonical Möbius function satisfies the
inversion `μ(x,y) + ∑_{x ≼ z ≺ y} μ(x,z) = 0` for `x ≺ y` — no adequacy witness required, the past
count supplying the bounded topological index. -/
theorem mobius_orthogonality_causal {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (x y : E) (hxy : prec x y = true) :
    mobius es prec x y
      + (es.filter (fun z => leqB prec x z && prec z y)).foldl
          (fun acc z => acc + mobius es prec x z) 0 = 0 := by
  refine mobius_orthogonality es prec x (pastCount es prec)
    (fun a b hab => pastCount_topo es prec htrans hirr hmem a b hab) y hxy ?_
  have : pastCount es prec y ≤ es.length := List.length_filter_le _ _
  omega

/-! ## (I) Philip Hall — the Möbius function as alternating chain count

Philip Hall's theorem: the incidence Möbius function is the reduced Euler characteristic of the
order complex of the open interval — `μ(x,y) = ∑_k (−1)^k · #{k-step chains x ≺ ⋯ ≺ y}`. This is
the bridge between the incidence algebra (where `μ * ζ = δ` is `mobius_orthogonality_causal`) and
the cohomology of the order complex (`μ = ∑_n (−1)^n dim Hⁿ`): the same alternating count, read
combinatorially here and homologically there. The diamond witnesses it concretely. -/

/-- The number of **`k`-step chains** `x = z₀ ≺ z₁ ≺ ⋯ ≺ z_k = y`, counted over the event list: a
`(k+1)`-chain is a `k`-chain `x ⤳ w` extended by a final link `w ≺ y`. -/
def chainCount {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) :
    Nat → E → E → Nat
  | 0, x, y => if x = y then 1 else 0
  | k + 1, x, y =>
      (es.filter (fun z => prec z y)).foldl (fun acc z => acc + chainCount es prec k x z) 0

/-- The alternating sign `(−1)^k`, by recursion (so `altSign (k+1) = −altSign k` definitionally). -/
def altSign : Nat → Int
  | 0 => 1
  | k + 1 => -altSign k

/-- The **alternating chain sum up to degree `M-1`**, `∑_{k=0}^{M-1} (−1)^k · #{k-chains x ⤳ y}`,
by recursion on `M` (each step adds the next signed chain count). -/
def hallSumUpto {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x y : E) :
    Nat → Int
  | 0 => 0
  | M + 1 => hallSumUpto es prec x y M + altSign M * (chainCount es prec M x y : Int)

/-- The **alternating chain sum** `∑_{k=0}^{|es|} (−1)^k · #{k-chains x ⤳ y}` — the reduced Euler
characteristic of the order complex of `(x,y)`, Philip Hall's expression for `μ(x,y)`. The bound
`|es|+1` captures every chain (a chain has distinct events, so at most `|es|` steps). -/
def hallSum {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x y : E) : Int :=
  hallSumUpto es prec x y (es.length + 1)

/-- **Philip Hall on the diamond.** The chain census at the apex pair `(0,3)`: one `1`-chain
`0 ≺ 3`, two `2`-chains `0 ≺ 1 ≺ 3` and `0 ≺ 2 ≺ 3`, no `3`-chains. -/
theorem diamond_chainCount :
    chainCount fourEvents diamondPrec 1 0 3 = 1
    ∧ chainCount fourEvents diamondPrec 2 0 3 = 2
    ∧ chainCount fourEvents diamondPrec 3 0 3 = 0 := by
  refine ⟨by decide, by decide, by decide⟩

/-- **Philip Hall, verified on the diamond.** The alternating chain sum equals the Möbius value:
`−1·1 + 1·2 = 1 = μ(0,3)`. The incidence Möbius function *is* the Euler characteristic of the
order complex, here at the diamond's apex. -/
theorem diamond_philip_hall :
    hallSum fourEvents diamondPrec 0 3 = mobius fourEvents diamondPrec 0 3 := by
  decide

/-! ## (J) Toward general Philip Hall — foldl algebra and the shift recursion -/

/-- Folding `acc + (f y + g y)` splits into the sum of the two folds (general seed). -/
theorem foldl_add_split2 {α : Type} (L : List α) (f g : α → Int) (a b : Int) :
    L.foldl (fun acc y => acc + (f y + g y)) (a + b)
    = L.foldl (fun acc y => acc + f y) a + L.foldl (fun acc y => acc + g y) b := by
  induction L generalizing a b with
  | nil => rfl
  | cons c t ih =>
    simp only [List.foldl_cons]
    have e : a + b + (f c + g c) = (a + f c) + (b + g c) := by omega
    rw [e]
    exact ih (a + f c) (b + g c)

/-- The split at seed `0`. -/
theorem foldl_add_split2_0 {α : Type} (L : List α) (f g : α → Int) :
    L.foldl (fun acc y => acc + (f y + g y)) 0
    = L.foldl (fun acc y => acc + f y) 0 + L.foldl (fun acc y => acc + g y) 0 := by
  have h := foldl_add_split2 L f g 0 0; simpa using h

/-- A constant factor pulls out of a fold (general seed). -/
theorem foldl_const_mul {α : Type} (L : List α) (c : Int) (g : α → Int) (a : Int) :
    L.foldl (fun acc z => acc + c * g z) (c * a) = c * L.foldl (fun acc z => acc + g z) a := by
  induction L generalizing a with
  | nil => rfl
  | cons z t ih =>
    simp only [List.foldl_cons]
    have e : c * a + c * g z = c * (a + g z) := by rw [Int.mul_add]
    rw [e]
    exact ih (a + g z)

/-- The constant pull-out at seed `0`. -/
theorem foldl_const_mul0 {α : Type} (L : List α) (c : Int) (g : α → Int) :
    L.foldl (fun acc z => acc + c * g z) 0 = c * L.foldl (fun acc z => acc + g z) 0 := by
  have h := foldl_const_mul L c g 0; simpa using h

/-- A fold of zeros is zero. -/
theorem foldl_add_zero {α : Type} (L : List α) :
    L.foldl (fun acc (_ : α) => acc + (0 : Int)) 0 = 0 := by
  induction L with
  | nil => rfl
  | cons a t ih => simpa using ih

/-- The integer cast commutes with a fold sum. -/
theorem foldl_natCast {α : Type} (L : List α) (g : α → Nat) :
    ((L.foldl (fun acc z => acc + g z) 0 : Nat) : Int)
    = L.foldl (fun acc z => acc + (g z : Int)) 0 := by
  suffices h : ∀ (c : Nat),
      ((L.foldl (fun acc z => acc + g z) c : Nat) : Int)
        = L.foldl (fun acc z => acc + (g z : Int)) (c : Int) by
    have := h 0; simpa using this
  intro c
  induction L generalizing c with
  | nil => rfl
  | cons a t ih =>
    simp only [List.foldl_cons]
    rw [← Int.natCast_add]
    exact ih (c + g a)

/-- **Hall's shift recursion.** The alternating chain sum satisfies the Möbius recursion:
`hallSumUpto (M+1) x y = [x=y] − ∑_{z ≺ y} hallSumUpto M x z` — the `(k+1)`-chain split (a chain
is a shorter chain plus a final link) is exactly the incidence recursion of `μ`. -/
theorem hallSumUpto_recursion {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (x y : E) (M : Nat) :
    hallSumUpto es prec x y (M + 1)
    = (if x = y then (1 : Int) else 0)
      - (es.filter (fun z => prec z y)).foldl
          (fun acc z => acc + hallSumUpto es prec x z M) 0 := by
  induction M with
  | zero =>
    have hz : (es.filter (fun z => prec z y)).foldl
        (fun acc z => acc + hallSumUpto es prec x z 0) 0 = 0 := foldl_add_zero _
    rw [hz]
    by_cases h : x = y <;> simp [hallSumUpto, altSign, chainCount, h]
  | succ M ih =>
    have hsplit :
        (es.filter (fun z => prec z y)).foldl
            (fun acc z => acc + hallSumUpto es prec x z (M + 1)) 0
        = (es.filter (fun z => prec z y)).foldl
            (fun acc z => acc + hallSumUpto es prec x z M) 0
          + altSign M * (es.filter (fun z => prec z y)).foldl
              (fun acc z => acc + (chainCount es prec M x z : Int)) 0 := by
      rw [← foldl_const_mul0, ← foldl_add_split2_0]
      rfl
    have hcc : (chainCount es prec (M + 1) x y : Int)
        = (es.filter (fun z => prec z y)).foldl
            (fun acc z => acc + (chainCount es prec M x z : Int)) 0 :=
      foldl_natCast (es.filter (fun z => prec z y)) (fun z => chainCount es prec M x z)
    rw [show hallSumUpto es prec x y (M + 1 + 1)
        = hallSumUpto es prec x y (M + 1) + altSign (M + 1) * (chainCount es prec (M + 1) x y : Int)
        from rfl, ih, hcc, hsplit, show altSign (M + 1) = -altSign M from rfl, Int.neg_mul]
    by_cases h : x = y <;> simp only [h, if_true, if_false] <;> omega

/-- A `Nat` fold of terms all zero is zero. -/
theorem foldl_add_zero_of_all {α : Type} (L : List α) (g : α → Nat) (h : ∀ w ∈ L, g w = 0) :
    L.foldl (fun acc w => acc + g w) 0 = 0 := by
  induction L with
  | nil => rfl
  | cons a t ih =>
    simp only [List.foldl_cons]
    rw [h a (List.mem_cons_self ..)]
    simp only [Nat.add_zero]
    exact ih (fun w hw => h w (List.mem_cons_of_mem a hw))

/-- **Chains respect the order.** Off the order (`x ⋠ z`) there are no chains `x ⤳ z`: any chain's
final link `w ≺ z` from an `x`-reachable `w` would force `x ≼ w ≺ z`, i.e. `x ≼ z`. -/
theorem chainCount_zero_of_not_le {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true) (x : E) :
    ∀ (k : Nat) (z : E), leqB prec x z = false → chainCount es prec k x z = 0 := by
  intro k
  induction k with
  | zero =>
    intro z hz
    have hxz : ¬ x = z := by
      intro h; subst h; simp [leqB] at hz
    simp [chainCount, hxz]
  | succ k ih =>
    intro z hz
    show (es.filter (fun w => prec w z)).foldl
        (fun acc w => acc + chainCount es prec k x w) 0 = 0
    apply foldl_add_zero_of_all
    intro w hw
    have hwz : prec w z = true := (List.mem_filter.mp hw).2
    apply ih w
    cases hlw : leqB prec x w with
    | false => rfl
    | true =>
      exfalso
      have hlz : leqB prec x z = true := by
        unfold leqB at hlw ⊢
        rw [Bool.or_eq_true] at hlw
        rw [Bool.or_eq_true]
        rcases hlw with h1 | h1
        · right; rw [of_decide_eq_true h1]; exact hwz
        · right; exact htrans x w z h1 hwz
      rw [hlz] at hz; exact Bool.noConfusion hz

/-- The alternating chain sum vanishes off the order. -/
theorem hallSumUpto_zero_of_not_le {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true) (x z : E)
    (hz : leqB prec x z = false) :
    ∀ (M : Nat), hallSumUpto es prec x z M = 0 := by
  intro M
  induction M with
  | zero => rfl
  | succ M ih =>
    show hallSumUpto es prec x z M + altSign M * (chainCount es prec M x z : Int) = 0
    rw [ih, chainCount_zero_of_not_le es prec htrans x M z hz]
    simp

/-- Restricting the predecessor sum to the order interval drops only off-order terms, which `f`
sends to zero — so the sum is unchanged. -/
theorem foldl_drop_not_le {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x y : E)
    (f : E → Int) (hf : ∀ z, leqB prec x z = false → f z = 0) :
    (es.filter (fun z => prec z y)).foldl (fun acc z => acc + f z) 0
    = (es.filter (fun z => leqB prec x z && prec z y)).foldl (fun acc z => acc + f z) 0 := by
  suffices h : ∀ (l : List E) (c : Int),
      (l.filter (fun z => prec z y)).foldl (fun acc z => acc + f z) c
      = (l.filter (fun z => leqB prec x z && prec z y)).foldl (fun acc z => acc + f z) c by
    exact h es 0
  intro l
  induction l with
  | nil => intro c; rfl
  | cons a t ih =>
    intro c
    cases hpa : prec a y with
    | false => simp [hpa]; exact ih c
    | true =>
      cases hla : leqB prec x a with
      | true => simp [hpa, hla]; exact ih (c + f a)
      | false =>
        simp only [List.filter_cons, hpa, hla, Bool.false_and, if_true,
          List.foldl_cons]
        rw [hf a hla]
        simp only [Int.add_zero]
        exact ih c

/-- **Philip Hall's theorem.** For a genuine finite causal order, the incidence Möbius function is
the alternating chain count: `μ(x,y) = ∑_k (−1)^k · #{k-chains x ⤳ y}` — the reduced Euler
characteristic of the order complex of `(x,y)`. -/
theorem mobius_eq_hallSum {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (x y : E) :
    mobius es prec x y = hallSum es prec x y := by
  suffices key : ∀ N (y : E), pastCount es prec y < N → ∀ M, pastCount es prec y < M →
      mobius es prec x y = hallSumUpto es prec x y M by
    have hb : pastCount es prec y ≤ es.length := List.length_filter_le _ _
    exact key (pastCount es prec y + 1) y (Nat.lt_succ_self _) (es.length + 1) (by omega)
  intro N
  induction N with
  | zero => intro y hy; exact absurd hy (Nat.not_lt_zero _)
  | succ N ih =>
    intro y hyN M hM
    obtain ⟨M', rfl⟩ : ∃ M', M = M' + 1 := ⟨M - 1, by omega⟩
    rw [hallSumUpto_recursion,
      foldl_drop_not_le es prec x y (fun z => hallSumUpto es prec x z M')
        (fun z hz => hallSumUpto_zero_of_not_le es prec htrans x z hz M'),
      foldl_add_congr (es.filter (fun z => leqB prec x z && prec z y))
        (fun z => hallSumUpto es prec x z M') (fun z => mobius es prec x z) 0
        (fun z hz => by
          have hc := List.mem_filter.mp hz
          rw [Bool.and_eq_true] at hc
          have hpz : pastCount es prec z < pastCount es prec y :=
            pastCount_topo es prec htrans hirr hmem z y hc.2.2
          exact (ih z (by omega) M' (by omega)).symm)]
    by_cases hxy : x = y
    · subst hxy
      have hsum0 : (es.filter (fun z => leqB prec x z && prec z x)).foldl
          (fun acc z => acc + mobius es prec x z) 0 = 0 := by
        rw [foldl_add_congr _ _ (fun _ => 0) 0 (fun z hz => by
          exfalso
          have hc := List.mem_filter.mp hz
          rw [Bool.and_eq_true] at hc
          obtain ⟨hlz, hzx⟩ := hc.2
          unfold leqB at hlz; rw [Bool.or_eq_true] at hlz
          rcases hlz with h1 | h1
          · have heq : x = z := of_decide_eq_true h1
            rw [heq, hirr z] at hzx; exact Bool.noConfusion hzx
          · have : prec x x = true := htrans x z x h1 hzx
            rw [hirr x] at this; exact Bool.noConfusion this)]
        exact foldl_add_zero _
      rw [mobius_self, hsum0]; simp
    · by_cases hp : prec x y = true
      · have ho := mobius_orthogonality_causal es prec htrans hirr hmem x y hp
        rw [if_neg hxy]; omega
      · have hp' : prec x y = false := by cases h : prec x y; rfl; exact absurd h hp
        rw [mobius_zero_of_not_above es prec x y hxy hp', if_neg hxy]
        have hsum0 : (es.filter (fun z => leqB prec x z && prec z y)).foldl
            (fun acc z => acc + mobius es prec x z) 0 = 0 := by
          rw [foldl_add_congr _ _ (fun _ => 0) 0 (fun z hz => by
            exfalso
            have hc := List.mem_filter.mp hz
            rw [Bool.and_eq_true] at hc
            obtain ⟨hlz, hzy⟩ := hc.2
            unfold leqB at hlz; rw [Bool.or_eq_true] at hlz
            rcases hlz with h1 | h1
            · have heq : x = z := of_decide_eq_true h1
              rw [← heq] at hzy; rw [hzy] at hp'; exact Bool.noConfusion hp'
            · have : prec x y = true := htrans x z y h1 hzy
              rw [hp'] at this; exact Bool.noConfusion this)]
          exact foldl_add_zero _
        rw [hsum0]; simp

end Relational.Spacetime.Incidence.Mobius
end Infomaterial
