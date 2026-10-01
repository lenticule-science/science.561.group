import ObsmetrologiaPhysicalScience.CausalSets.Operator.DAlembertian

/-!
# The Benincasa–Dowker operator and the layer-constancy law

The Benincasa–Dowker d'Alembertian weights each strict past event of `x` by a constant *per
interval-abundance layer*: `□_BD φ(x) = ∑_{y ≺ x} c(|I(y,x)|) · φ(y)`, with the coefficient sequence
`c : ℕ → ℤ`. The exact [incidence d'Alembertian](CausalSets.Operator.DAlembertian.lean) instead weights by the
Möbius value `μ(y,x)`. The corpus node's "the coefficients are the Möbius inversion" is *not* an
unconditional identity — the diagonal (`y=x`, abundance `0`, `μ=+1`) and covering pairs (abundance
`0`, `μ=−1`) share an abundance yet differ in `μ`. The law is the **layer-constancy
equivalence**: the two operators agree on the strict past exactly when `μ(y,x)` depends only on the
abundance `|I(y,x)|`. We abstract over that law and exhibit the diamond as a carrier.

## Main definitions

* `dalembertianBD` — the layer-grouped BD operator (coefficient of interval abundance).
* `dalembertianStrict` — the incidence operator over the strict past (Möbius weights).

## Main results

* `dalembertianStrict_eq_BD` — under layer-constancy `μ(y,x) = c(|I(y,x)|)`, incidence = BD.
* `cDiamond` / `diamond_layer_constant` / `diamond_strict_eq_BD` — the diamond's apex is a carrier:
  `c = (0 ↦ −1, 2 ↦ +1)`, so the incidence and BD operators coincide there.

## References

`content/.../lorentzian-causal-settling/content/causal-dalembertian`; the operator of
`CausalSets.Operator.DAlembertian` and the abundance of `CausalSets.Causal.Interval`.

## Tags

Benincasa–Dowker, layer coefficients, Möbius, layer constancy, discrete d'Alembertian
-/

namespace Obsmetrologia
namespace CausalSets.Operator.BenincasaDowker

open Obsmetrologia.CausalSets.Incidence.Mobius
open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.CausalSets.Operator.DAlembertian
open Obsmetrologia.CausalSets.Dimension.OrderingFraction
open Obsmetrologia.Real.Internal

variable {E : Type}

/-- The **layer-grouped Benincasa–Dowker operator** over the strict past: each past event weighted
by a coefficient of its interval abundance, `∑_{y ≺ x} c(|I(y,x)|) · φ(y)`. -/
def dalembertianBD [DecidableEq E] (es : List E) (prec : E → E → Bool) (c : Nat → Int)
    (φ : E → RReal) (x : E) : RReal :=
  (es.filter (fun y => prec y x)).foldl
    (fun acc y => acc + ofIntR (c (intervalCard es prec y x)) * φ y) RReal.zero

/-- The **incidence d'Alembertian over the strict past**: each past event weighted by its Möbius
value, `∑_{y ≺ x} μ(y,x) · φ(y)`. -/
def dalembertianStrict [DecidableEq E] (es : List E) (prec : E → E → Bool)
    (φ : E → RReal) (x : E) : RReal :=
  (es.filter (fun y => prec y x)).foldl
    (fun acc y => acc + ofIntR (mobius es prec y x) * φ y) RReal.zero

/-- **BD coefficients = Möbius weights, under layer-constancy.** When the Möbius weight of every
strict past pair depends only on its interval abundance — `μ(y,x) = c(|I(y,x)|)` — the incidence
operator *is* the Benincasa–Dowker layer-grouped operator. The form of the identity: the
exact equivalence under the layer-constancy law (not the false unconditional claim). -/
theorem dalembertianStrict_eq_BD [DecidableEq E] (es : List E) (prec : E → E → Bool) (c : Nat → Int)
    (φ : E → RReal) (x : E)
    (hlc : ∀ y, prec y x = true → mobius es prec y x = c (intervalCard es prec y x)) :
    dalembertianStrict es prec φ x = dalembertianBD es prec c φ x := by
  unfold dalembertianStrict dalembertianBD
  apply foldl_add_congrR
  intro y hy
  have hyx : prec y x = true := (List.mem_filter.mp hy).2
  rw [hlc y hyx]

/-- The diamond's layer-coefficient sequence: covering links (abundance `0`) carry `μ = −1`, the
bracketed link (abundance `2`) carries `μ = +1`. -/
def cDiamond : Nat → Int := fun k => if k = 0 then -1 else if k = 2 then 1 else 0

/-- **The diamond's apex is a layer-constancy carrier.** Every strict past pair `(y,3)` has
`μ(y,3) = cDiamond(|I(y,3)|)`: `μ(1,3) = μ(2,3) = −1` at abundance `0`, `μ(0,3) = +1` at abundance
`2`. -/
theorem diamond_layer_constant :
    ∀ y, diamondPrec y 3 = true →
      mobius fourEvents diamondPrec y 3 = cDiamond (intervalCard fourEvents diamondPrec y 3) := by
  intro y
  match y with
  | 0 => decide
  | 1 => decide
  | 2 => decide
  | 3 => decide

/-- **The incidence and Benincasa–Dowker operators coincide at the diamond's apex** — the
layer-constancy law holds there, so for every field `□ φ(3) = □_BD φ(3)`. -/
theorem diamond_strict_eq_BD (φ : Fin 4 → RReal) :
    dalembertianStrict fourEvents diamondPrec φ 3
    = dalembertianBD fourEvents diamondPrec cDiamond φ 3 :=
  dalembertianStrict_eq_BD fourEvents diamondPrec cDiamond φ 3 diamond_layer_constant

/-! ## The universal 2D Benincasa–Dowker coefficients

What fixes the BD coefficient sequence is not Minkowski calibration but the **moment conditions**:
the layer-grouped operator is a discrete *second-order* d'Alembertian iff its coefficients annihilate
constant (`0`th moment) and affine (`1`st moment) fields and pick up curvature at second order (`2`nd
moment nonzero). The unique 2D solution is the second-difference stencil `(1, −2, 1)`. -/

/-- The **2D Benincasa–Dowker layer coefficients** `(1, −2, 1)` — the second-difference stencil. -/
def bdCoeff2 : Nat → Int := fun k =>
  match k with
  | 0 => 1
  | 1 => -2
  | 2 => 1
  | _ => 0

/-- The `deg`-th **moment** of a coefficient sequence over the support `{0,…,n−1}`:
`∑_{k<n} k^deg·c(k)`. The moments are the continuum-limit consistency conditions of the layer-grouped
operator. -/
def bdMoment (c : Nat → Int) (n deg : Nat) : Int :=
  (List.range n).foldr (fun k acc => Int.ofNat (k ^ deg) * c k + acc) 0

/-- **The 2D BD coefficients satisfy the second-order moment conditions.** The `0`th and `1`st
moments vanish — the operator annihilates constant and affine fields — and the `2`nd moment is `2 ≠
0` — it couples at second order, to curvature. These are the discrete conditions that make the
layer-grouped operator a second-order d'Alembertian, fixing `(1, −2, 1)` as the 2D Benincasa–Dowker
sequence. -/
theorem bdCoeff2_moments :
    bdMoment bdCoeff2 3 0 = 0 ∧ bdMoment bdCoeff2 3 1 = 0 ∧ bdMoment bdCoeff2 3 2 = 2 := by
  refine ⟨by decide, by decide, by decide⟩

/-! ## The 4D Benincasa–Dowker coefficients

In four dimensions the BD operator uses four layers `L₀…L₃` with coefficients `(1, −9, 16, −8)`.
Their determination is *not* the plain `k^j` moment story of 2D: the 4D conditions are weighted by
the dimension-dependent interval abundances (the analytic sector). What survives as the
dimension-independent, discrete condition is the **zeroth moment** `∑_k c_k = 0` — the leading
abundance cancellation, shared by every BD dimension. -/

/-- The **4D Benincasa–Dowker layer coefficients** `(1, −9, 16, −8)` on layers `L₀…L₃`. -/
def bdCoeff4 : Nat → Int := fun k =>
  match k with
  | 0 => 1
  | 1 => -9
  | 2 => 16
  | 3 => -8
  | _ => 0

/-- **`Σ c_k = 0` is the universal (dimension-independent) BD condition** — the leading abundance
cancellation, satisfied by both the 2D `(1,−2,1)` and 4D `(1,−9,16,−8)` coefficients. -/
theorem bd_sum_zero :
    bdMoment bdCoeff2 3 0 = 0 ∧ bdMoment bdCoeff4 4 0 = 0 := by
  refine ⟨by decide, by decide⟩

/-- **The 4D coefficients break the plain-moment pattern.** Unlike 2D, the higher plain `k^j` moments
of `(1,−9,16,−8)` do **not** vanish — `m₁ = −1`, `m₂ = −17` — because the 4D conditions are
abundance-weighted, not plain-power. Only `m₀ = 0` is shared. The dimension enters here; the
abundance-weighted determination is the analytic frontier. -/
theorem bdCoeff4_plain_moments :
    bdMoment bdCoeff4 4 1 = -1 ∧ bdMoment bdCoeff4 4 2 = -17 := by
  refine ⟨by decide, by decide⟩

/-! ## Moment admissibility — the coefficients are determined, not chosen

The second-order moment conditions are not a fit but a **linear system**: a coefficient sequence is
admissible exactly when its `0`th and `1`st moments vanish and its `2`nd is nonzero, and over the
support `{0,1,2}` that system has a *unique* solution — `(1, −2, 1)`. The BD coefficients are forced
by the requirement that the layer-grouped operator be second-order. -/

/-- A coefficient sequence is **second-order moment-admissible** over support `{0,…,n−1}` when its
`0`th and `1`st moments vanish (annihilates constant and affine modes) and its `2`nd moment is
nonzero (couples at second order). -/
def MomentAdmissible (c : Nat → Int) (n : Nat) : Prop :=
  bdMoment c n 0 = 0 ∧ bdMoment c n 1 = 0 ∧ bdMoment c n 2 ≠ 0

/-- The 2D coefficients are second-order moment-admissible. -/
theorem bdCoeff2_admissible : MomentAdmissible bdCoeff2 3 := by
  refine ⟨by decide, by decide, by decide⟩

/-- **The 2D BD coefficients are the unique admissible stencil over `{0,1,2}` with `2`nd moment `2`.**
The three moment conditions — `0`th `c₀+c₁+c₂`, `1`st `c₁+2c₂`, `2`nd `c₁+4c₂` (the values of
`∑ c`, `∑ k·c`, `∑ k²·c` over `{0,1,2}`) — form a linear system that forces `(c₀,c₁,c₂) = (1,−2,1)`.
The coefficients are *determined* by second-order consistency, not chosen. -/
theorem bdCoeff2_unique (c0 c1 c2 : Int)
    (h0 : c0 + c1 + c2 = 0) (h1 : c1 + 2 * c2 = 0) (h2 : c1 + 4 * c2 = 2) :
    c0 = 1 ∧ c1 = -2 ∧ c2 = 1 := by
  refine ⟨?_, ?_, ?_⟩ <;> omega

end CausalSets.Operator.BenincasaDowker
end Obsmetrologia
