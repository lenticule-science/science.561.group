import Obsmetrologia.CausalSets.Operator.BenincasaDowker
import Obsmetrologia.Calculus.Probability.Measure

/-!
# The sprinkling average of the Benincasa–Dowker operator

The Benincasa–Dowker operator on the unit field, grouped by interval abundance, is a
coefficient-weighted **layer occupation sum** `∑_k c(k) · N_k`, where `N_k = |L_k(x)|` counts the
strict-past events at abundance `k`. Its physical content is statistical: in causal-set gravity the
operator is read against a *random* Poisson sprinkling, and what fixes the coefficients is the
behaviour of the **sprinkling average** `⟨∑_k c_k N_k⟩`.

This module makes that average green, exp-free. Because the layer sum is linear in the occupation
profile, the expectation passes through it: `⟨∑_k c_k N_k⟩ = ∑_k c_k ⟨N_k⟩` — the coefficients act on
the *averaged* sprinkling (`bdLayerSum_expectation`). And the response of the layer sum to a monomial
mean-profile `N_k = k^j` is exactly the `j`-th BD moment (`bdLayerSum_eq_moment`): so the moment
conditions of `Lorentzian.BenincasaDowker` (`bdCoeff2_moments`) are precisely the statement that the
sprinkling average annihilates constant and affine mean-fields and first couples at second order
(`bdLayerSum_moment_response`). The continuum scaling of `⟨N_k⟩` to a Poisson profile (and the
resulting `⟨S⟩ → −¼∫R√g`) is the analytic frontier (see the corpus node); the discrete model — the
average and the moments that shape it — is here.

## Main definitions

* `expValZ` — the integer sprinkling expectation `E[f] = ∑_ω f(ω)` over a finite sample space.
* `bdLayerSum` — the layer-grouped BD value `∑_{k<n} c(k) · N(k)` on an occupation profile `N`.
* `occProfile` — the realized occupation profile `k ↦ |L_k(x)|` of a causal order.

## Main results

* `bdLayerSum_expectation` — the sprinkling average commutes with the layer sum:
  `⟨∑_k c_k N_k⟩ = ∑_k c_k ⟨N_k⟩`.
* `bdLayerSum_eq_moment` — the layer sum on the monomial profile `k^j` is the `j`-th BD moment.
* `bdLayerSum_moment_response` — the 2D coefficients' sprinkling response `(0, 0, 2)`.
* `diamond_bd2_layerSum` — the diamond's layer sum against the 2D stencil, `3`.

## References

`content/.../lorentzian-causal-settling/content/sprinkled-causal-set-settling` and
`.../causal-dalembertian`; the layer abundance of `CausalSets.Causal.Interval`, the coefficients and
moments of `Lorentzian.BenincasaDowker`, and the sample space of `Probability.Measure`.

## Tags

sprinkling average, Benincasa–Dowker, layer occupation, moment conditions, expectation
-/

namespace Obsmetrologia
namespace CausalSets.Continuum.Sprinkling

open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.CausalSets.Operator.BenincasaDowker
open Obsmetrologia.CausalSets.Dimension.OrderingFraction
open Obsmetrologia.Probability.Measure

/-! ## (A) The integer sprinkling expectation -/

/-- The **integer sprinkling expectation** `E[f] = ∑_{ω} f(ω)` of an `Int`-valued observable over a
finite sample space — the linear functional the expected operator passes through. -/
def expValZ {Ω : Type} (S : SampleSpace Ω) (f : Ω → Int) : Int :=
  S.outcomes.foldr (fun ω acc => f ω + acc) 0

/-- The expectation of the zero observable is `0`. -/
theorem expValZ_zero {Ω : Type} (S : SampleSpace Ω) : expValZ S (fun _ => 0) = 0 := by
  unfold expValZ
  induction S.outcomes with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

/-- **Expectation is additive.** `E[f + g] = E[f] + E[g]`. -/
theorem expValZ_add {Ω : Type} (S : SampleSpace Ω) (f g : Ω → Int) :
    expValZ S (fun ω => f ω + g ω) = expValZ S f + expValZ S g := by
  unfold expValZ
  induction S.outcomes with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

/-- **Expectation is homogeneous.** `E[c·f] = c·E[f]`. -/
theorem expValZ_smul {Ω : Type} (S : SampleSpace Ω) (c : Int) (f : Ω → Int) :
    expValZ S (fun ω => c * f ω) = c * expValZ S f := by
  unfold expValZ
  induction S.outcomes with
  | nil => exact (Int.mul_zero c).symm
  | cons a t ih => simp only [List.foldr_cons, ih]; rw [Int.mul_add]

/-! ## (B) The layer-grouped Benincasa–Dowker value -/

/-- The **layer-grouped BD value** `∑_{k<n} c(k) · N(k)` of a coefficient sequence `c` against an
occupation profile `N` over the first `n` abundance layers. The BD operator on the unit field is
this on the realized occupation profile `k ↦ |L_k(x)|`. -/
def bdLayerSum (c N : Nat → Int) : Nat → Int
  | 0 => 0
  | n + 1 => bdLayerSum c N n + c n * N n

/-- **The layer sum is linear in the occupation profile.** `∑ c_k (N_k + M_k) = ∑ c_k N_k + ∑ c_k
M_k` — the additivity that lets the sprinkling expectation pass through. -/
theorem bdLayerSum_add (c N M : Nat → Int) (n : Nat) :
    bdLayerSum c (fun k => N k + M k) n = bdLayerSum c N n + bdLayerSum c M n := by
  induction n with
  | zero => rfl
  | succ m ih =>
    show bdLayerSum c (fun k => N k + M k) m + c m * (N m + M m)
       = (bdLayerSum c N m + c m * N m) + (bdLayerSum c M m + c m * M m)
    rw [ih, Int.mul_add]; omega

/-! ## (C) The sprinkling average -/

/-- **The sprinkling average commutes with the layer sum.** The expectation of the layer-grouped BD
value over an ensemble of sprinklings equals the layer sum on the *averaged* occupation profile:
`⟨∑_k c_k N_k(ω)⟩ = ∑_k c_k ⟨N_k⟩`. The BD coefficients act on the mean sprinkling — the discrete
content of "the operator is read against the Poisson average." Built from `□`'s linearity in the
profile (`bdLayerSum_add` projection) and the linearity of expectation. -/
theorem bdLayerSum_expectation {Ω : Type} (S : SampleSpace Ω) (c : Nat → Int)
    (N : Ω → Nat → Int) (n : Nat) :
    expValZ S (fun ω => bdLayerSum c (N ω) n)
    = bdLayerSum c (fun k => expValZ S (fun ω => N ω k)) n := by
  induction n with
  | zero => exact expValZ_zero S
  | succ m ih =>
    show expValZ S (fun ω => bdLayerSum c (N ω) m + c m * N ω m)
       = bdLayerSum c (fun k => expValZ S (fun ω => N ω k)) m
         + c m * expValZ S (fun ω => N ω m)
    rw [expValZ_add S (fun ω => bdLayerSum c (N ω) m) (fun ω => c m * N ω m), ih,
        expValZ_smul S (c m) (fun ω => N ω m)]

/-! ## (D) The moment bridge — why these coefficients

The response of the layer sum to a monomial mean-profile `N_k = k^j` is the `j`-th BD moment. So the
moment conditions are exactly the sprinkling-average response: which polynomial mean-fields the
operator annihilates, and at which order it first couples. -/

/-- A `seed`-shifted right fold of an additive accumulator splits off its seed. -/
theorem foldr_add_seed (L : List Nat) (t : Nat → Int) (s : Int) :
    L.foldr (fun k acc => t k + acc) s = L.foldr (fun k acc => t k + acc) 0 + s := by
  induction L with
  | nil => show s = 0 + s; omega
  | cons a tl ih => simp only [List.foldr_cons, ih]; omega

/-- The BD moment recurses by one layer: `m(n+1) = m(n) + n^deg · c(n)`. -/
theorem bdMoment_succ (c : Nat → Int) (n deg : Nat) :
    bdMoment c (n + 1) deg = bdMoment c n deg + Int.ofNat (n ^ deg) * c n := by
  unfold bdMoment
  rw [List.range_succ, List.foldr_append,
      foldr_add_seed (List.range n) (fun k => Int.ofNat (k ^ deg) * c k)
        (List.foldr (fun k acc => Int.ofNat (k ^ deg) * c k + acc) 0 [n])]
  show _ + (Int.ofNat (n ^ deg) * c n + 0) = _ + Int.ofNat (n ^ deg) * c n
  omega

/-- **The layer sum on a monomial profile is the BD moment.** `∑_{k<n} c(k) · k^deg = m_deg`. The
sprinkling average against a polynomial mean-occupation `N_k = k^deg` *is* the `deg`-th moment, so
the moment conditions characterize the operator's response to polynomial mean-fields. -/
theorem bdLayerSum_eq_moment (c : Nat → Int) (deg n : Nat) :
    bdLayerSum c (fun k => Int.ofNat (k ^ deg)) n = bdMoment c n deg := by
  induction n with
  | zero => rfl
  | succ m ih =>
    rw [bdMoment_succ]
    show bdLayerSum c (fun k => Int.ofNat (k ^ deg)) m + c m * Int.ofNat (m ^ deg)
       = bdMoment c m deg + Int.ofNat (m ^ deg) * c m
    rw [ih, Int.mul_comm]

/-- **The 2D coefficients' sprinkling response `(0, 0, 2)`.** Against a constant mean-profile
(`k^0`) and an affine one (`k^1`) the layer-grouped BD operator averages to `0`; against a quadratic
one (`k^2`) it averages to `2`. This is `bdCoeff2_moments` read through the sprinkling average: the
coefficients `(1,−2,1)` are *forced* by killing the constant and affine modes of the mean sprinkling
and coupling at second order — to curvature. -/
theorem bdLayerSum_moment_response :
    bdLayerSum bdCoeff2 (fun k => Int.ofNat (k ^ 0)) 3 = 0
    ∧ bdLayerSum bdCoeff2 (fun k => Int.ofNat (k ^ 1)) 3 = 0
    ∧ bdLayerSum bdCoeff2 (fun k => Int.ofNat (k ^ 2)) 3 = 2 := by
  rw [bdLayerSum_eq_moment, bdLayerSum_eq_moment, bdLayerSum_eq_moment]
  exact bdCoeff2_moments

/-! ## (E) The diamond as a concrete sprinkling -/

/-- The **realized occupation profile** of a causal order at `x`: `k ↦ |L_k(x)|`, the strict-past
events at abundance `k`, as an integer profile. The BD operator on the unit field is `bdLayerSum` on
this. -/
def occProfile {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E) :
    Nat → Int := fun k => Int.ofNat (layerCount es prec x k)

/-- The diamond's occupation profile at the apex `3`: `(2, 0, 1)` — two covering links, none at
abundance `1`, one at abundance `2`. -/
theorem diamond_occProfile :
    occProfile fourEvents diamondPrec 3 0 = 2
    ∧ occProfile fourEvents diamondPrec 3 1 = 0
    ∧ occProfile fourEvents diamondPrec 3 2 = 1 := by
  refine ⟨by decide, by decide, by decide⟩

/-- **The diamond's layer sum against the 2D stencil is `3`** — `1·2 + (−2)·0 + 1·1`. A concrete BD
value on a realized occupation profile. -/
theorem diamond_bd2_layerSum :
    bdLayerSum bdCoeff2 (occProfile fourEvents diamondPrec 3) 3 = 3 := by decide

/-- The diamond's layer sum against its own layer-constancy coefficients `cDiamond` is `−1`. -/
theorem diamond_cDiamond_layerSum :
    bdLayerSum cDiamond (occProfile fourEvents diamondPrec 3) 3 = -1 := by decide

/-- A two-point **sprinkling ensemble**: the diamond's apex profile, and the empty profile. -/
def pairSpace : SampleSpace (Fin 2) := { outcomes := [0, 1] }

/-- The ensemble's per-sprinkling occupation profiles. -/
def pairProfiles : Fin 2 → Nat → Int
  | 0 => occProfile fourEvents diamondPrec 3
  | 1 => fun _ => 0

/-- **The sprinkling average, concretely.** Over the two-point ensemble, the expected layer-grouped
BD value equals the layer sum on the averaged occupation profile — `bdLayerSum_expectation` at a
concrete sprinkling. -/
theorem pair_sprinkling_average :
    expValZ pairSpace (fun ω => bdLayerSum bdCoeff2 (pairProfiles ω) 3)
    = bdLayerSum bdCoeff2 (fun k => expValZ pairSpace (fun ω => pairProfiles ω k)) 3 :=
  bdLayerSum_expectation pairSpace bdCoeff2 pairProfiles 3

/-- Both sides of the concrete sprinkling average evaluate to `3`: the empty sprinkling contributes
nothing, so the average is the diamond's own value. -/
theorem pair_sprinkling_average_value :
    expValZ pairSpace (fun ω => bdLayerSum bdCoeff2 (pairProfiles ω) 3) = 3 := by decide

end CausalSets.Continuum.Sprinkling
end Obsmetrologia
