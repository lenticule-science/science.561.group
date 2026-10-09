import ObsmetrologiaPhysicalScience.CausalSets.Causal.Interval
import ObsmetrologiaPhysicalScience.CausalSets.Dimension.OrderingFraction

/-!
# The discrete time section — a global time function from the causal past count

Hawking's theorem: a spacetime is **stably causal** iff it admits a **global time function**, a real
map strictly increasing along every future-directed causal curve. This module builds the discrete
refinement on a causal set: the **past count** `t(x) = |{z : z ≺ x}|` is a strictly monotone,
`ℕ`-valued time function. It is strictly monotone because `x ≺ y` makes the causal past of `x` a
*proper* subset of that of `y` — transitivity gives `past(x) ⊆ past(y)`, and irreflexivity with
`x ∈ past(y) ∖ past(x)` makes the inclusion strict, so the counts strictly increase
(`timeSection_strict_mono`).

The **regime** reading: this section lands in `ℕ` — the ordinals below `ω` — so a *finite* causal set
(the strict regime, `κ ≤ 3`) always carries a sub-`ω` ordinal time section. This is the green half of
"an ordinal time section exists iff the settling is non-aperiodic": non-aperiodicity (here finiteness,
`κ < ω₁`) supplies the bounded-ordinal section; the aperiodic regime (`κ ≥ ω₁`) is exactly where the
section must climb past every countable ordinal. The full biconditional is the corpus's refinement of
Hawking stable causality (see the node); the existence direction is here, green.

## Main definitions

* `timeSection` — the global time function `t(x) = pastCount(x)`, the causal-past cardinality.

## Main results

* `filter_length_lt_of_implies` — a filtered count strictly grows under a predicate implication with a
  strict witness; the counting engine of monotonicity.
* `timeSection_strict_mono` — `x ≺ y ⟹ t(x) < t(y)` for a transitive irreflexive order: the global
  time function strictly increases along the causal order.
* `diamond_timeSection` / `diamond_timeSection_mono` — the diamond's section `(0,1,1,3)`, strictly
  increasing along all five causal relations.

## References

`content/.../lorentzian-causal-settling/content/time-section`; the past count of
`CausalSets.Causal.Interval`, the diamond of `CausalSets.Dimension.OrderingFraction`.

## Tags

time function, stable causality, causal set, global time, regime, Hawking
-/

namespace Obsmetrologia
namespace CausalSets.Causal.RegimeSection

open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.CausalSets.Dimension.OrderingFraction

variable {E : Type}

/-! ## (A) Strict monotonicity of a filtered count under predicate implication -/

/-- A filtered count is monotone under a predicate implication: if `p z → q z` on every element, then
`|filter p l| ≤ |filter q l|`. -/
theorem filter_length_le_of_implies (l : List E) (p q : E → Bool)
    (himp : ∀ z ∈ l, p z = true → q z = true) :
    (l.filter p).length ≤ (l.filter q).length := by
  induction l with
  | nil => exact Nat.le_refl 0
  | cons a t ih =>
    have htl : ∀ z ∈ t, p z = true → q z = true := fun z hz => himp z (List.mem_cons_of_mem a hz)
    have ihl := ih htl
    cases hpa : p a with
    | true =>
      have hqa : q a = true := himp a (List.mem_cons_self ..) hpa
      rw [List.filter_cons_of_pos hpa, List.filter_cons_of_pos hqa]
      simp only [List.length_cons]; omega
    | false =>
      rw [List.filter_cons_of_neg (by rw [hpa]; decide)]
      cases hqa : q a with
      | true => rw [List.filter_cons_of_pos hqa]; simp only [List.length_cons]; omega
      | false => rw [List.filter_cons_of_neg (by rw [hqa]; decide)]; exact ihl

/-- A filtered count **strictly** grows under a predicate implication when some element satisfies `q`
but not `p`: `|filter p l| < |filter q l|`. The strict witness `w` is counted by `q` and missed by
`p`. -/
theorem filter_length_lt_of_implies (l : List E) (p q : E → Bool)
    (himp : ∀ z ∈ l, p z = true → q z = true)
    (w : E) (hw : w ∈ l) (hqw : q w = true) (hpw : p w = false) :
    (l.filter p).length < (l.filter q).length := by
  induction l with
  | nil => simp at hw
  | cons a t ih =>
    have htl : ∀ z ∈ t, p z = true → q z = true := fun z hz => himp z (List.mem_cons_of_mem a hz)
    rcases List.mem_cons.mp hw with rfl | hwt
    · rw [List.filter_cons_of_neg (by rw [hpw]; decide), List.filter_cons_of_pos hqw]
      simp only [List.length_cons]
      have hle := filter_length_le_of_implies t p q htl
      omega
    · cases hpa : p a with
      | true =>
        have hqa : q a = true := himp a (List.mem_cons_self ..) hpa
        rw [List.filter_cons_of_pos hpa, List.filter_cons_of_pos hqa]
        simp only [List.length_cons]
        have := ih htl hwt
        omega
      | false =>
        rw [List.filter_cons_of_neg (by rw [hpa]; decide)]
        cases hqa : q a with
        | true =>
          rw [List.filter_cons_of_pos hqa]
          simp only [List.length_cons]
          have hle := filter_length_le_of_implies t p q htl
          omega
        | false =>
          rw [List.filter_cons_of_neg (by rw [hqa]; decide)]
          exact ih htl hwt

/-! ## (B) The global time function -/

/-- The **discrete time section** `t(x) = |past(x)|`: the cardinality of the causal past of `x`. The
discrete global time function of Hawking stable causality. -/
def timeSection (es : List E) (prec : E → E → Bool) (x : E) : Nat := pastCount es prec x

/-- **The time section strictly increases along the causal order.** For a transitive irreflexive
order, `x ≺ y ⟹ t(x) < t(y)`: the past of `x` is a proper subset of the past of `y` — transitivity
embeds it, and `x` itself lies in `past(y) ∖ past(x)` (irreflexivity), so the count strictly grows.
This is the discrete global time function of stable causality. -/
theorem timeSection_strict_mono (es : List E) (prec : E → E → Bool)
    (htrans : ∀ a b c, prec a b = true → prec b c = true → prec a c = true)
    (hirr : ∀ a, prec a a = false)
    (x y : E) (hx : x ∈ es) (hxy : prec x y = true) :
    timeSection es prec x < timeSection es prec y := by
  unfold timeSection pastCount
  exact filter_length_lt_of_implies es (fun z => prec z x) (fun z => prec z y)
    (fun z _ hzx => htrans z x y hzx hxy) x hx hxy (hirr x)

/-! ## (C) The diamond — a concrete global time function

The diamond `0≺1, 0≺2, 0≺3, 1≺3, 2≺3` has past counts `(0,1,1,3)`: the minimal event at time `0`, the
two spacelike middles at time `1` (tied, as a time function may be on incomparable events), the
maximal event at time `3`. It increases strictly along every one of the five causal relations. -/

/-- **The diamond's time section** `(0, 1, 1, 3)` — the causal-past count at each event. -/
theorem diamond_timeSection :
    timeSection fourEvents diamondPrec 0 = 0
    ∧ timeSection fourEvents diamondPrec 1 = 1
    ∧ timeSection fourEvents diamondPrec 2 = 1
    ∧ timeSection fourEvents diamondPrec 3 = 3 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

/-- **The time section increases strictly along every causal relation of the diamond** — a concrete
discrete global time function. The two spacelike events `1, 2` share time `1`; every `≺` strictly
increases time. -/
theorem diamond_timeSection_mono :
    timeSection fourEvents diamondPrec 0 < timeSection fourEvents diamondPrec 1
    ∧ timeSection fourEvents diamondPrec 0 < timeSection fourEvents diamondPrec 2
    ∧ timeSection fourEvents diamondPrec 0 < timeSection fourEvents diamondPrec 3
    ∧ timeSection fourEvents diamondPrec 1 < timeSection fourEvents diamondPrec 3
    ∧ timeSection fourEvents diamondPrec 2 < timeSection fourEvents diamondPrec 3 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide⟩

end CausalSets.Causal.RegimeSection
end Obsmetrologia
