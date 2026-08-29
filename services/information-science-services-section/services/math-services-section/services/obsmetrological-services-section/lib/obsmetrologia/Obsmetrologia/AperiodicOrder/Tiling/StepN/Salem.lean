import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicMean

/-!
# Salem versus Pisot: the neutral boundary of aperiodic settling

Every result we have built on the metallic-mean family is **Pisot**: the companion matrix `[[n,1],[1,0]]`
has characteristic polynomial `x² − nx − 1` (non-reciprocal, constant `−1`), with the Perron root `μ > 1`
and its single conjugate `−1/μ ∈ (−1, 0)` **strictly inside the unit disk** — a *contracting* internal
direction. That contraction is exactly what gives pure-point diffraction, cut-and-project windows,
recognizability, and the sofic/Markov cleanliness of `SoficShift`. The corpus
(`substitution-universality-class`) records **Pisot / Salem type** as a binary similarity invariant of
the substitution matrix, but everything formalized so far is Pisot. This module opens the **Salem** side.

A **Salem number** is an algebraic integer `λ > 1` whose conjugates lie on-or-inside the unit circle
with **at least one on it**. Its minimal polynomial is **reciprocal** (palindromic, constant `+1`), so
roots pair `λ ↔ 1/λ`; the on-the-circle conjugates replace Pisot's contracting direction with a
**neutral rotation** — the singular-continuous, non-settling boundary (the aperiodic `⊤` regime).

The smallest-degree Salem case is degree four. We take `x⁴ − x³ − x² − x + 1`
(`charPolySalem = [1,−1,−1,−1,1]`). Reciprocity lets it be read through `y = x + 1/x`: dividing by `x²`,
`x² + x⁻² − (x + x⁻¹) − 1 = (y² − 2) − y − 1 = y² − y − 3`, the **trace resolvent** `salemTraceResolvent`. A root
`λ` is on the unit circle iff `y = λ + 1/λ = 2cos θ ∈ [−2, 2]`. So the Salem signature is detectable
**entirely in the reals**: the trace quadratic must change sign inside `(−2, 2)` (a unit-circle conjugate
pair) and also above `2` (the real Salem root `λ > 1`). No complex numbers are needed — the unit-circle
condition is read off integer evaluations of `salemTraceResolvent`.

## Main results
* `charPolySalem_reciprocal` / `charPolyMetallic_not_reciprocal` — the reciprocal (Salem) vs
  non-reciprocal (Pisot) algebraic signature.
* `salemTraceResolvent_unit_circle` — the trace resolvent changes sign in `(−2, 0) ⊂ (−2, 2)`: a conjugate pair
  on the unit circle (the *neutral* Salem direction).
* `salemTraceResolvent_real_root` — and changes sign in `(2, 3)`: the real Salem root `λ ≈ 1.72 > 1`.
* `salem_vs_pisot` — the contrast: Salem has a unit-circle (`(−2,2)`) trace-root, while the golden
  (Pisot) conjugate is real and strictly inside `(−1, 0)` — a contracting, not neutral, direction.

## References
Corpus `substitution-universality-class` (Pisot/Salem as SE invariant); the coloring-aperiodic-tiles
memo §5/§6 (metallic-mean Pisot tiles; singular-continuous order at the Salem boundary).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN

open AperiodicOrder.Tiling.Universality

/-- A coefficient list is **reciprocal** (palindromic): `p = reverse p`. The minimal polynomial of a
Salem number is reciprocal (roots pair `λ ↔ 1/λ`); a Pisot minimal polynomial generally is not. -/
def reciprocal (p : List Int) : Prop := p = p.reverse

/-- A coefficient list is **antireciprocal** (antipalindromic): `p` is the negated reverse of
itself. -/
def antireciprocal (p : List Int) : Prop := p = p.reverse.map (fun c => -c)

/-- **Horner evaluation** of an ascending-degree integer coefficient list at an integer point. -/
def evalIntPoly : List Int → Int → Int
  | [], _ => 0
  | (c :: cs), x => c + x * evalIntPoly cs x

/-- The degree-4 **Salem polynomial** `x⁴ − x³ − x² − x + 1` (ascending coefficients) — the smallest
Salem case. Its Perron root `λ ≈ 1.7220` is a Salem number. -/
def charPolySalem : List Int := [1, -1, -1, -1, 1]

/-- The **trace resolvent** `y² − y − 3` of `charPolySalem` under `y = x + 1/x`. Its roots are the
trace values `λ + 1/λ` of the quartic's root pairs; `|y| ≤ 2` ⟺ the pair is on the unit circle. -/
def salemTraceResolvent : List Int := [-3, -1, 1]

/-- **The Salem polynomial is reciprocal** (palindromic) — the algebraic signature of a Salem number. -/
theorem charPolySalem_reciprocal : reciprocal charPolySalem := by
  unfold reciprocal charPolySalem; decide

/-- **The metallic (Pisot) polynomial is not reciprocal.** `[-1, -n, 1]` reversed is `[1, -n, -1]`, and
`-1 ≠ 1` — so no `λ ↔ 1/λ` pairing; the conjugate is a contracting interior point, not a unit. -/
theorem charPolyMetallic_not_reciprocal (n : Int) : ¬ reciprocal (charPolyMetallic n) := by
  intro h
  rw [reciprocal, charPolyMetallic,
    show ([-1, -n, 1] : List Int).reverse = [1, -n, -1] from rfl] at h
  injection h with h1
  exact absurd h1 (by decide)

/-- **The unit-circle (neutral) Salem direction.** The trace resolvent changes sign across `(−2, 0)`
(`q(−2) = 3 > 0`, `q(0) = −3 < 0`), so it has a root in `(−2, 2)`: a conjugate pair on the unit circle
`y = 2cos θ`. This neutral rotation is exactly what Pisot forbids. -/
theorem salemTraceResolvent_unit_circle :
    0 < evalIntPoly salemTraceResolvent (-2) ∧ evalIntPoly salemTraceResolvent 0 < 0 := by decide

/-- **The real Salem root `λ > 1`.** The trace resolvent changes sign across `(2, 3)`
(`q(2) = −1 < 0`, `q(3) = 3 > 0`), so it has a root `y > 2`, giving the real root `λ = (y + √(y²−4))/2 ≈
1.72 > 1` — the inflation factor. -/
theorem salemTraceResolvent_real_root :
    evalIntPoly salemTraceResolvent 2 < 0 ∧ 0 < evalIntPoly salemTraceResolvent 3 := by decide

/-- **Salem versus Pisot, side by side.** The Salem quartic is reciprocal with a trace-root inside
`(−2, 2)` — a **unit-circle** conjugate pair, the neutral non-settling direction. The golden (Pisot)
polynomial `x² − x − 1` is non-reciprocal and its conjugate is a **real** root strictly inside `(−1, 0)`
(`P(−1) = 1 > 0`, `P(0) = −1 < 0`) — strictly inside the unit disk, a contracting direction. The
unit-circle conjugate is the entire difference between the two regimes. -/
theorem salem_vs_pisot :
    reciprocal charPolySalem ∧ ¬ reciprocal (charPolyMetallic 1)
      ∧ (0 < evalIntPoly salemTraceResolvent (-2) ∧ evalIntPoly salemTraceResolvent 0 < 0)
      ∧ (0 < evalIntPoly (charPolyMetallic 1) (-1) ∧ evalIntPoly (charPolyMetallic 1) 0 < 0) :=
  ⟨charPolySalem_reciprocal, charPolyMetallic_not_reciprocal 1, salemTraceResolvent_unit_circle, by decide⟩

/-! ## The determinant signature: unimodular `+1` (Salem) versus `−1` (Pisot) -/

/-- The `2 × 2` determinant. -/
def det2 (M : Mat 2) : Int := M 0 0 * M 1 1 - M 0 1 * M 1 0

/-- The `4 × 4` determinant by Laplace expansion along row `0`. -/
def det4 (M : Mat 4) : Int :=
    M 0 0 * (M 1 1 * (M 2 2 * M 3 3 - M 2 3 * M 3 2)
            - M 1 2 * (M 2 1 * M 3 3 - M 2 3 * M 3 1)
            + M 1 3 * (M 2 1 * M 3 2 - M 2 2 * M 3 1))
  - M 0 1 * (M 1 0 * (M 2 2 * M 3 3 - M 2 3 * M 3 2)
            - M 1 2 * (M 2 0 * M 3 3 - M 2 3 * M 3 0)
            + M 1 3 * (M 2 0 * M 3 2 - M 2 2 * M 3 0))
  + M 0 2 * (M 1 0 * (M 2 1 * M 3 3 - M 2 3 * M 3 1)
            - M 1 1 * (M 2 0 * M 3 3 - M 2 3 * M 3 0)
            + M 1 3 * (M 2 0 * M 3 1 - M 2 1 * M 3 0))
  - M 0 3 * (M 1 0 * (M 2 1 * M 3 2 - M 2 2 * M 3 1)
            - M 1 1 * (M 2 0 * M 3 2 - M 2 2 * M 3 0)
            + M 1 2 * (M 2 0 * M 3 1 - M 2 1 * M 3 0))

/-- **The Pisot determinant is `−1`.** The metallic substitution matrix `[[n,1],[1,0]]` has
`det = n·0 − 1·1 = −1` — unimodular, but the *non-reciprocal* sign: the conjugate is a contracting
interior point `−1/μ`, the product of the two real eigenvalues being `−1`. -/
theorem det2_metallicMatrix (n : Int) : det2 (metallicMatrix n) = -1 := by
  simp [det2, metallicMatrix]

/-- The **companion matrix of `charPolySalem`** `x⁴ − x³ − x² − x + 1` (bottom-companion form): the
sub-diagonal carries `1`s and the last column carries `[−c₀, −c₁, −c₂, −c₃] = [−1, 1, 1, 1]`. -/
def salemCompanion : Mat 4 := fun i j =>
  if j = 3 then (if i = 0 then -1 else 1)
  else if i.val = j.val + 1 then 1 else 0

/-- **The Salem determinant is `+1`.** The reciprocal quartic's companion matrix is unimodular with the
*positive* sign — the product of all four roots is `+1` (`= c₀`, the reciprocal `λ↔1/λ` pairing forcing
the constant term up to a unit). This `+1` versus the metallic `−1` is the determinant face of the
Salem/Pisot split. -/
theorem det4_salemCompanion : det4 salemCompanion = 1 := by decide

/-- **The determinant signature of the Salem/Pisot split.** Salem's companion is unimodular `+1`
(reciprocal, the roots multiply to a unit with all conjugates on-or-inside the circle); the metallic
(Pisot) matrix is unimodular `−1`. Same magnitude (both algebraic units), opposite sign — the
arithmetic projection of "conjugate on the circle" versus "conjugate contracting inside the disk." -/
theorem det_salem_vs_pisot : det4 salemCompanion = 1 ∧ det2 (metallicMatrix 1) = -1 :=
  ⟨det4_salemCompanion, det2_metallicMatrix 1⟩

/-- **Cayley–Hamilton for the Salem companion.** The companion matrix satisfies its own characteristic
polynomial `x⁴ − x³ − x² − x + 1 = 0`, i.e. `M⁴ = M³ + M² + M − I` (entrywise). This is the matrix
form of the Salem recurrence: the inflation acts on the tile-count vector by exactly this degree-4
relation, the reciprocal (palindromic) projection of the metallic `M² = nM + I`. Verified by computation
over `Fin 4`. -/
theorem salemCompanion_cayley_hamilton :
    ∀ i k : Fin 4, matPow salemCompanion 4 i k
      = matPow salemCompanion 3 i k + matPow salemCompanion 2 i k + salemCompanion i k
          - matId i k := by decide

/-! ### The `charPolyCycle` coefficient receipts -/

/-- The Salem quartic is not antireciprocal. -/
theorem charPolySalem_not_antireciprocal : ¬ antireciprocal charPolySalem := by
  unfold antireciprocal charPolySalem; decide

theorem evalIntPoly_replicate_zero_append_one :
    ∀ k : Nat, evalIntPoly (List.replicate k 0 ++ [1]) 1 = 1
  | 0 => rfl
  | k + 1 => by
      show (0 : Int) + 1 * evalIntPoly (List.replicate k 0 ++ [1]) 1 = 1
      rw [evalIntPoly_replicate_zero_append_one k]
      decide

/-- `charPolyCycle N` evaluates to `0` at `1`. -/
theorem evalIntPoly_charPolyCycle_one :
    ∀ N : Nat, evalIntPoly (charPolyCycle N) 1 = 0
  | 0 => by decide
  | k + 1 => by
      show (-1 : Int) + 1 * evalIntPoly (List.replicate k 0 ++ [1]) 1 = 0
      rw [evalIntPoly_replicate_zero_append_one k]
      decide

theorem replicate_zero_append_cons :
    ∀ (k : Nat) (acc : List Int),
      List.replicate k (0 : Int) ++ (0 :: acc) = 0 :: (List.replicate k 0 ++ acc)
  | 0, _ => rfl
  | k + 1, acc => congrArg (0 :: ·) (replicate_zero_append_cons k acc)

theorem reverseAux_replicate_zero_append_one :
    ∀ (k : Nat) (acc : List Int),
      (List.replicate k (0 : Int) ++ [1]).reverseAux acc
        = 1 :: (List.replicate k 0 ++ acc)
  | 0, _ => rfl
  | k + 1, acc => by
      show (List.replicate k (0 : Int) ++ [1]).reverseAux (0 :: acc)
        = 1 :: (List.replicate (k + 1) 0 ++ acc)
      rw [reverseAux_replicate_zero_append_one k (0 :: acc),
        replicate_zero_append_cons k acc]
      rfl

theorem map_neg_replicate_zero_append :
    ∀ (k : Nat) (a : Int),
      (List.replicate k (0 : Int) ++ [a]).map (fun c => -c)
        = List.replicate k 0 ++ [-a]
  | 0, _ => rfl
  | k + 1, a => congrArg (0 :: ·) (map_neg_replicate_zero_append k a)

/-- `charPolyCycle (k + 1)` is antireciprocal. -/
theorem charPolyCycle_antireciprocal (k : Nat) :
    antireciprocal (charPolyCycle (k + 1)) := by
  show (-1 : Int) :: (List.replicate k 0 ++ [1])
    = ((List.replicate k (0 : Int) ++ [1]).reverseAux [-1]).map (fun c => -c)
  rw [reverseAux_replicate_zero_append_one k [-1]]
  show (-1 : Int) :: (List.replicate k 0 ++ [1])
    = (-1 : Int) :: ((List.replicate k (0 : Int) ++ [-1]).map (fun c => -c))
  rw [map_neg_replicate_zero_append k (-1)]
  rfl

/-- `charPolyCycle (k + 1)` is not reciprocal. -/
theorem charPolyCycle_not_reciprocal (k : Nat) :
    ¬ reciprocal (charPolyCycle (k + 1)) := by
  intro h
  have hrev : (-1 : Int) :: (List.replicate k 0 ++ [1])
      = 1 :: (List.replicate k 0 ++ [-1]) := by
    have h2 := h
    rw [reciprocal] at h2
    exact h2.trans (reverseAux_replicate_zero_append_one k [-1])
  injection hrev with h1 _
  exact absurd h1 (by decide)

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
