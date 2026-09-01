import Infomaterial.Relational.Spacetime.Incidence.Mobius

/-!
# Proper time — the order-intrinsic Lorentzian distance (longest chain)

The honest geometry of a causal set is **intrinsic**, needing no embedding manifold: by Sorkin's
*order + number = geometry*, the causal order fixes the conformal/causal structure and the event count
fixes volume, and together they are the metric. This module builds the **timelike distance**: the
**longest chain** between two causally related events, the discrete *proper time* (geodesic distance).
By the Brightwell–Gregory theorem it converges, for a faithful sprinkling, to the continuum geodesic
proper time — so this is genuine Lorentzian geometry read off the bare order, not a relabeled
combinatorial integer and not the curvature-magnitude frontier.

Its signature property is the **reverse (Lorentzian) triangle inequality**: proper time is *maximized*
along geodesics, `τ(x,y) ≥ τ(x,z) + τ(z,y)` for `x ≼ z ≼ y` — the timelike opposite of the metric
triangle inequality, the hallmark of Lorentzian signature.

## Main definitions

* `longestChain` — the fuel-bounded longest `≺`-chain length from `x` to `y`.
* `properTime` — the saturated longest chain `longestChain (|events|)`, the discrete proper time.

## Main results

* `longestChain_step` — proper time grows by at least one tick per causal step (the green heart).
* `longestChain_fuel_stable` / `longestChain_saturated` — the longest chain stabilizes once the fuel
  reaches the apex rank, so fuel `|events|` already saturates `properTime` (a genuine fixpoint).
* `reverse_triangle_general` — **the reverse (Lorentzian) triangle inequality**, `τ(x,z) + τ(z,y) ≤
  τ(x,y)` for every finite causal order and all `x ≼ z ≼ y`, by iterating `longestChain_step`.
* `diamond_properTime` — the diamond's proper-time profile (`τ(0,3) = 2`, the covering links `1`).
* `diamond_reverse_triangle` / `diamond_reverse_triangle_general` — the reverse triangle inequality
  realized (with equality) on the diamond geodesic `0 ≺ 1 ≺ 3`, both by `decide` and via the
  general theorem.

## References

`content/.../lorentzian-causal-settling`; Brightwell–Gregory (1991), the longest-chain proper-time
convergence; Sorkin, *order + number = geometry*. The interval **volume** is `Spacetime.Causal.Interval.intervalCard`.

## Tags

proper time, longest chain, geodesic distance, Lorentzian, reverse triangle inequality, causal set
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Reachability

open Infomaterial.Relational.Spacetime.Incidence.Mobius
open Infomaterial.Relational.Spacetime.Causal.Interval
open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

variable {E : Type}

/-- The **longest `≺`-chain length** from `x` to `y`, fuel-bounded by `n`. `0` if `x = y` (no elapsed
time) or `x ⊀ y` (no timelike separation); otherwise `1 +` the best continuation through a successor
`z` with `x ≺ z ≼ y`. Saturated by `properTime`. -/
def longestChain [DecidableEq E] (es : List E) (prec : E → E → Bool) : Nat → E → E → Nat
  | 0, _, _ => 0
  | n + 1, x, y =>
    if x = y then 0
    else if prec x y then
      1 + (es.filter (fun z => prec x z && leqB prec z y)).foldr
        (fun z acc => max (longestChain es prec n z y) acc) 0
    else 0

/-- The **discrete proper time** `τ(x,y)`: the longest chain saturated at fuel `|events|` (no causal
chain in a finite event list is longer). The order-intrinsic Lorentzian geodesic distance. -/
def properTime [DecidableEq E] (es : List E) (prec : E → E → Bool) (x y : E) : Nat :=
  longestChain es prec es.length x y

/-! ## The per-step growth of proper time (the reverse-triangle heart)

The geometric core of the reverse triangle inequality: stepping forward along a single causal link adds
at least one tick of proper time. Iterating this along a chain is the full reverse triangle
(\cref red node); the single step is green. -/

/-- A right `max`-fold dominates each of its members. -/
theorem foldr_max_ge_mem (L : List E) (f : E → Nat) {z : E} (hz : z ∈ L) :
    f z ≤ L.foldr (fun w acc => max (f w) acc) 0 := by
  induction L with
  | nil => simp at hz
  | cons a t ih =>
    rcases List.mem_cons.mp hz with rfl | ht
    · exact Nat.le_max_left (f z) _
    · exact Nat.le_trans (ih ht) (Nat.le_max_right (f a) _)

/-- A right `max`-fold is monotone in its summand: `f ≤ g` pointwise on `L` gives `⨆f ≤ ⨆g`. The
engine of both the per-step bound and fuel-monotonicity (more search budget never shortens the longest
chain). -/
theorem foldr_max_mono (L : List E) (f g : E → Nat) (h : ∀ w ∈ L, f w ≤ g w) :
    L.foldr (fun w acc => max (f w) acc) 0 ≤ L.foldr (fun w acc => max (g w) acc) 0 := by
  induction L with
  | nil => exact Nat.le_refl 0
  | cons a t ih =>
    simp only [List.foldr_cons]
    refine Nat.max_le.mpr ⟨?_, ?_⟩
    · exact Nat.le_trans (h a (List.mem_cons_self ..)) (Nat.le_max_left _ _)
    · exact Nat.le_trans (ih (fun w hw => h w (List.mem_cons_of_mem a hw))) (Nat.le_max_right _ _)

/-- **Proper time grows by at least one tick per causal step.** If `x ≺ y` and `z` is a successor of
`x` lying causally before `y` (`x ≺ z ≼ y`, with `z` an event), then the longest chain from `x` to `y`
dominates one step plus the longest chain from `z` to `y`:
`1 + longestChain n z y ≤ longestChain (n+1) x y`. The single-step monotonicity the reverse triangle
inequality iterates: each link toward the future adds a tick. -/
theorem longestChain_step [DecidableEq E] (es : List E) (prec : E → E → Bool) (n : Nat) (x y z : E)
    (hne : x ≠ y) (hxy : prec x y = true)
    (hz : z ∈ es) (hxz : prec x z = true) (hzy : leqB prec z y = true) :
    1 + longestChain es prec n z y ≤ longestChain es prec (n + 1) x y := by
  show 1 + longestChain es prec n z y ≤
      (if x = y then 0
       else if prec x y then
         1 + (es.filter (fun w => prec x w && leqB prec w y)).foldr
           (fun w acc => max (longestChain es prec n w y) acc) 0
       else 0)
  rw [if_neg hne, if_pos hxy]
  apply Nat.add_le_add_left
  exact foldr_max_ge_mem (es.filter (fun w => prec x w && leqB prec w y))
    (fun w => longestChain es prec n w y)
    (List.mem_filter.mpr ⟨hz, by simp [hxz, hzy]⟩)

/-! ## Fuel saturation and the general reverse triangle inequality

`longestChain` **stabilizes** once the fuel reaches the order-rank of the apex, so the saturated
`properTime` is a genuine fixpoint of the longest-chain recursion. Iterating the per-step bound
`longestChain_step` along a longest first segment then lifts the diamond's `diamond_reverse_triangle`
to the **general reverse (Lorentzian) triangle inequality** `τ(x,z) + τ(z,y) ≤ τ(x,y)` for every
finite causal order and all `x ≼ z ≼ y` — proper time maximized along geodesics, no longer a single
witness. The pigeonhole that bounds the recursion depth is the topological past count of
`CausalMobius` (`pastCount_topo`, bounded by `es.length`). -/

/-- `longestChain` at zero fuel is zero. -/
theorem longestChain_zero [DecidableEq E] (es : List E) (prec : E → E → Bool) (x y : E) :
    longestChain es prec 0 x y = 0 := rfl

/-- The longest chain from an event to itself is zero — no elapsed proper time on the diagonal. -/
theorem longestChain_self [DecidableEq E] (es : List E) (prec : E → E → Bool) (n : Nat) (x : E) :
    longestChain es prec n x x = 0 := by
  cases n with
  | zero => rfl
  | succ n => simp [longestChain]

/-- The successor-fuel unfolding on the order: for `x ≺ y`, the longest chain is one tick plus the
best continuation through a successor `x ≺ z ≼ y`. -/
theorem longestChain_succ_pos [DecidableEq E] (es : List E) (prec : E → E → Bool) (n : Nat)
    (x y : E) (hne : x ≠ y) (hxy : prec x y = true) :
    longestChain es prec (n + 1) x y
      = 1 + (es.filter (fun z => prec x z && leqB prec z y)).foldr
          (fun z acc => max (longestChain es prec n z y) acc) 0 := by
  show (if x = y then 0
        else if prec x y then
          1 + (es.filter (fun z => prec x z && leqB prec z y)).foldr
            (fun z acc => max (longestChain es prec n z y) acc) 0
        else 0) = _
  rw [if_neg hne, if_pos hxy]

/-- A right `max`-fold is congruent in its summand: pointwise equality on `L` gives equal folds. -/
theorem foldr_max_congr (L : List E) (f g : E → Nat) (h : ∀ w ∈ L, f w = g w) :
    L.foldr (fun w acc => max (f w) acc) 0 = L.foldr (fun w acc => max (g w) acc) 0 := by
  induction L with
  | nil => rfl
  | cons a t ih =>
    simp only [List.foldr_cons]
    rw [h a (List.mem_cons_self ..), ih (fun w hw => h w (List.mem_cons_of_mem a hw))]

/-- A right `max`-fold plus a constant stays under a bound when every member (plus the constant)
does and the constant alone does — the empty fold. The shape that bounds `⨆ + (1 + C)` by
`τ(x,y)`. -/
theorem foldr_max_add_le (L : List E) (f : E → Nat) (c B : Nat)
    (h0 : c ≤ B) (hf : ∀ w ∈ L, f w + c ≤ B) :
    L.foldr (fun w acc => max (f w) acc) 0 + c ≤ B := by
  induction L with
  | nil => simpa using h0
  | cons a t ih =>
    simp only [List.foldr_cons]
    have h1 : f a + c ≤ B := hf a (List.mem_cons_self ..)
    have h2 : t.foldr (fun w acc => max (f w) acc) 0 + c ≤ B :=
      ih (fun w hw => hf w (List.mem_cons_of_mem a hw))
    rcases Nat.le_total (f a) (t.foldr (fun w acc => max (f w) acc) 0) with hle | hle
    · rw [Nat.max_eq_right hle]; exact h2
    · rw [Nat.max_eq_left hle]; exact h1

/-- **Fuel stabilization.** With a topological index `idx` (`prec a b → idx a < idx b`), the longest
chain is constant in fuel once the fuel reaches the apex rank `idx y - idx x`:
`longestChain m x y = longestChain (m+1) x y` for `idx y - idx x ≤ m`. Strong induction on the rank;
the recursion ascends `x ≺ z` to strictly larger index, hence strictly smaller rank toward `y`. -/
theorem longestChain_fuel_stable [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (idx : E → Nat) (htopo : ∀ a b, prec a b = true → idx a < idx b) (y : E) :
    ∀ (x : E) (m : Nat), idx y - idx x ≤ m →
      longestChain es prec m x y = longestChain es prec (m + 1) x y := by
  suffices H : ∀ N (x : E), idx y - idx x < N → ∀ m, idx y - idx x ≤ m →
      longestChain es prec m x y = longestChain es prec (m + 1) x y by
    intro x m hm; exact H (idx y - idx x + 1) x (Nat.lt_succ_self _) m hm
  intro N
  induction N with
  | zero => intro x hx; exact absurd hx (Nat.not_lt_zero _)
  | succ N ih =>
    intro x hxN m hm
    by_cases hxy : x = y
    · subst hxy
      cases m with
      | zero => simp [longestChain]
      | succ m' => simp [longestChain]
    · by_cases hp : prec x y = true
      · have hlt : idx x < idx y := htopo x y hp
        obtain ⟨m', rfl⟩ : ∃ m', m = m' + 1 := ⟨m - 1, by omega⟩
        rw [longestChain_succ_pos es prec m' x y hxy hp,
            longestChain_succ_pos es prec (m' + 1) x y hxy hp]
        congr 1
        apply foldr_max_congr
        intro z hz
        have hmf := List.mem_filter.mp hz
        rw [Bool.and_eq_true] at hmf
        obtain ⟨_, hxz, hzy⟩ := hmf
        have hxlt : idx x < idx z := htopo x z hxz
        by_cases hzeqy : z = y
        · subst hzeqy; rw [longestChain_self, longestChain_self]
        · have hzprec : prec z y = true := by
            unfold leqB at hzy; rw [Bool.or_eq_true] at hzy
            rcases hzy with h | h
            · exact absurd (of_decide_eq_true h) hzeqy
            · exact h
          have hzlt : idx z < idx y := htopo z y hzprec
          exact ih z (by omega) m' (by omega)
      · have hp' : prec x y = false := by cases h : prec x y <;> simp_all
        cases m with
        | zero => simp [longestChain, hxy, hp']
        | succ m' => simp [longestChain, hxy, hp']

/-- **`properTime` is fuel-saturated at `|es|`.** For a genuine finite causal order, fuel
`es.length` already realizes the longest chain: `longestChain (es.length + 1) x y =
longestChain es.length x y`. The past count is a topological index bounded by `es.length`, so the
rank `idx y - idx x ≤ es.length` falls under `longestChain_fuel_stable`. -/
theorem longestChain_saturated [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (x y : E) :
    longestChain es prec (es.length + 1) x y = longestChain es prec es.length x y := by
  have hbnd : pastCount es prec y ≤ es.length := List.length_filter_le _ _
  exact (longestChain_fuel_stable es prec (pastCount es prec)
    (fun a b hab => pastCount_topo es prec htrans hirr hmem a b hab) y x es.length (by omega)).symm

/-- The reflexive causal order is transitive: `x ≼ z ≼ y → x ≼ y`. -/
theorem leqB_trans [DecidableEq E] (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (x z y : E) (hxz : leqB prec x z = true) (hzy : leqB prec z y = true) :
    leqB prec x y = true := by
  by_cases hxe : x = z
  · rwa [hxe]
  · by_cases hze : z = y
    · rwa [← hze]
    · have hpxz : prec x z = true := by
        unfold leqB at hxz; rw [Bool.or_eq_true] at hxz
        rcases hxz with h | h
        · exact absurd (of_decide_eq_true h) hxe
        · exact h
      have hpzy : prec z y = true := by
        unfold leqB at hzy; rw [Bool.or_eq_true] at hzy
        rcases hzy with h | h
        · exact absurd (of_decide_eq_true h) hze
        · exact h
      unfold leqB; rw [Bool.or_eq_true]; exact Or.inr (htrans x z y hpxz hpzy)

/-- **A strict causal step costs a tick of saturated proper time.** For `x ≺ z ≼ y`,
`1 + τ(z,y) ≤ τ(x,y)`: the per-step bound `longestChain_step` at the saturating fuel `|es|`, the
fuel bump absorbed by `longestChain_saturated`. -/
theorem properTime_lt_step [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (x z y : E) (hxz : prec x z = true) (hzy : leqB prec z y = true) :
    1 + longestChain es prec es.length z y ≤ longestChain es prec es.length x y := by
  by_cases hze : z = y
  · subst hze
    rw [longestChain_self]
    have hxne : x ≠ z := fun h => by rw [h, hirr z] at hxz; exact Bool.noConfusion hxz
    have hpos : 0 < es.length := List.length_pos_of_mem (hmem x z hxz)
    obtain ⟨L', hL'⟩ : ∃ L', es.length = L' + 1 := ⟨es.length - 1, by omega⟩
    rw [hL', longestChain_succ_pos es prec L' x z hxne hxz]
    omega
  · have hpzy : prec z y = true := by
      unfold leqB at hzy; rw [Bool.or_eq_true] at hzy
      rcases hzy with h | h
      · exact absurd (of_decide_eq_true h) hze
      · exact h
    have hzes : z ∈ es := hmem z y hpzy
    have hxy : prec x y = true := htrans x z y hxz hpzy
    have hxne : x ≠ y := fun h => by rw [h, hirr y] at hxy; exact Bool.noConfusion hxy
    have hstep := longestChain_step es prec es.length x y z hxne hxy hzes hxz hzy
    rwa [longestChain_saturated es prec htrans hirr hmem x y] at hstep

/-- **The reverse triangle inequality, iterated (fuel form).** For a genuine finite causal order and
all `x ≼ z ≼ y`, `longestChain n x z + τ(z,y) ≤ τ(x,y)` at every fuel `n`: the longest first segment,
however long, composes with the saturated second segment under the saturated whole. Induction on
`n`, prepending `properTime_lt_step` along each successor of `x`. -/
theorem longestChain_concat [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (z y : E) (hzy : leqB prec z y = true) :
    ∀ (n : Nat) (x : E), leqB prec x z = true →
      longestChain es prec n x z + longestChain es prec es.length z y
        ≤ longestChain es prec es.length x y := by
  intro n
  induction n with
  | zero =>
    intro x hxz
    rw [longestChain_zero, Nat.zero_add]
    by_cases hxe : x = z
    · subst hxe; exact Nat.le_refl _
    · have hpxz : prec x z = true := by
        unfold leqB at hxz; rw [Bool.or_eq_true] at hxz
        rcases hxz with h | h
        · exact absurd (of_decide_eq_true h) hxe
        · exact h
      have hstep := properTime_lt_step es prec htrans hirr hmem x z y hpxz hzy
      omega
  | succ n ih =>
    intro x hxz
    by_cases hxe : x = z
    · subst hxe
      have hself : longestChain es prec (n + 1) x x = 0 := longestChain_self es prec (n + 1) x
      omega
    · have hpxz : prec x z = true := by
        unfold leqB at hxz; rw [Bool.or_eq_true] at hxz
        rcases hxz with h | h
        · exact absurd (of_decide_eq_true h) hxe
        · exact h
      rw [longestChain_succ_pos es prec n x z hxe hpxz]
      have key : (es.filter (fun w => prec x w && leqB prec w z)).foldr
            (fun w acc => max (longestChain es prec n w z) acc) 0
            + (1 + longestChain es prec es.length z y)
          ≤ longestChain es prec es.length x y := by
        apply foldr_max_add_le (f := fun w => longestChain es prec n w z)
        · exact properTime_lt_step es prec htrans hirr hmem x z y hpxz hzy
        · intro w hw
          have hmf := List.mem_filter.mp hw
          rw [Bool.and_eq_true] at hmf
          obtain ⟨hwes, hxw, hwz⟩ := hmf
          have hih := ih w hwz
          have hwy : leqB prec w y = true := leqB_trans prec htrans w z y hwz hzy
          have hstep := properTime_lt_step es prec htrans hirr hmem x w y hxw hwy
          omega
      omega

/-- **The reverse (Lorentzian) triangle inequality, general.** For every finite causal order
(transitive, irreflexive, predecessors listed) and all `x ≼ z ≼ y`,
`τ(x,z) + τ(z,y) ≤ τ(x,y)` — proper time is *maximized* along geodesics, the timelike opposite of
the metric triangle inequality. The single-step case is `longestChain_step`; this is its iteration
along a longest `x → z` chain, saturated by `longestChain_saturated`. The diamond witness is
`diamond_reverse_triangle`. -/
theorem reverse_triangle_general [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ z, prec z z = false)
    (hmem : ∀ a b, prec a b = true → a ∈ es)
    (x z y : E) (hxz : leqB prec x z = true) (hzy : leqB prec z y = true) :
    properTime es prec x z + properTime es prec z y ≤ properTime es prec x y := by
  simpa only [properTime] using
    longestChain_concat es prec htrans hirr hmem z y hzy es.length x hxz

/-! ## The diamond — concrete proper times

The diamond `0≺1, 0≺2, 0≺3, 1≺3, 2≺3` has proper times: `τ(0,1)=τ(0,2)=1` (covering links),
`τ(1,3)=τ(2,3)=1`, and `τ(0,3)=2` — the apex pair is two links away along either geodesic
`0≺1≺3` or `0≺2≺3`. The spacelike middle pair `1,2` has `τ=0` (no timelike separation). -/

/-- **The diamond's proper-time profile.** `τ(0,3) = 2` (the timelike geodesic length), the four
covering links `= 1`, and `τ(0,0) = 0`. -/
theorem diamond_properTime :
    properTime fourEvents diamondPrec 0 3 = 2
    ∧ properTime fourEvents diamondPrec 0 1 = 1
    ∧ properTime fourEvents diamondPrec 1 3 = 1
    ∧ properTime fourEvents diamondPrec 0 0 = 0 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

/-- **The spacelike middle pair has zero proper time.** `τ(1,2) = 0`: `1` and `2` are spacelike
separated (neither precedes the other), so there is no timelike distance between them. -/
theorem diamond_spacelike_zero :
    properTime fourEvents diamondPrec 1 2 = 0 := by decide

/-- **The reverse (Lorentzian) triangle inequality, realized on the diamond.**
`τ(0,3) ≥ τ(0,1) + τ(1,3)` — here `2 ≥ 1 + 1`, with **equality** because `0 ≺ 1 ≺ 3` is a geodesic
(longest) chain. Proper time is maximized along geodesics: the timelike opposite of the metric
triangle inequality, the signature of Lorentzian geometry. -/
theorem diamond_reverse_triangle :
    properTime fourEvents diamondPrec 0 1 + properTime fourEvents diamondPrec 1 3
      ≤ properTime fourEvents diamondPrec 0 3 := by decide

/-- The diamond instantiates the **general** reverse triangle inequality: `diamondPrec` is a genuine
finite causal order (transitive, irreflexive, predecessors listed — all `decide`), so
`reverse_triangle_general` applies at the geodesic `0 ≼ 1 ≼ 3`. The hypotheses are real, not
vacuous: the general theorem, not just `decide`, yields `τ(0,1) + τ(1,3) ≤ τ(0,3)`. -/
theorem diamond_reverse_triangle_general :
    properTime fourEvents diamondPrec 0 1 + properTime fourEvents diamondPrec 1 3
      ≤ properTime fourEvents diamondPrec 0 3 :=
  reverse_triangle_general fourEvents diamondPrec (by decide) (by decide) (by decide) 0 1 3
    (by decide) (by decide)

end Relational.Spacetime.Causal.Reachability
end Infomaterial
