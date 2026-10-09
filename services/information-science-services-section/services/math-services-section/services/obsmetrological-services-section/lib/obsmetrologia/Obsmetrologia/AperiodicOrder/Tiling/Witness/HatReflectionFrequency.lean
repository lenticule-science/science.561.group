import Obsmetrologia.AperiodicOrder.Tiling.Witness.HatMetatile

/-!
# Reflected hats have frequency `1 : φ⁴` — an integer eigen-relation over `ℤ[φ]`

`Witness.HatMetatile` transcribes the hat monotile's metatile substitution into the integer matrix
`M = [[3,1,3,3],[1,0,0,0],[2,0,1,2],[2,0,1,3]]` and proves it primitive with Perron factor
`x² − 7x + 1`, the minimal polynomial of `φ⁴`. The frequency of each metatile in a hat tiling is
the left Perron eigenvector of `M`; the monotile paper reads off that one hat in every `H` is
reflected and none elsewhere, so the ratio of unreflected to reflected hats is `φ⁴ : 1`
(Smith–Myers–Kaplan–Goodman-Strauss, §2; Baake–Gähler–Sadun, §2).

That ratio is usually stated with a real eigenvector. This module states it with none: the
eigenvalue `φ⁴` and the eigenvector both live in the **golden integers** `ℤ[φ]`, pairs `⟨a, b⟩`
standing for `a + b·φ` under `φ² = φ + 1`, and every claim is a kernel `decide` over `Fin 4` and
integer pairs.

* `GoldenInt` is `ℤ[φ]` as pairs, with `add`, `mul`, `sub`, and the golden equation
  `φ·φ = φ + 1` (`GoldenInt.phi_mul_phi`); `φ⁴ = 2 + 3φ` (`GoldenInt.phi_pow_four`).
* `hatLeftVector = (1, 5 − 3φ, 6φ − 9, 6 − 3φ)` is a left eigenvector of `M` for `φ⁴`:
  `v·M = φ⁴·v` entrywise (`hat_left_eigen`).
* Weighted by hats per metatile `(4, 1, 2, 2)` the vector sums to `3 + 3φ = 3φ²`
  (`hat_total_weight`, `hat_total_weight_is_three_phi_sq`); weighted by reflected hats per metatile
  `(1, 0, 0, 0)` it sums to `1` (`hat_reflected_weight`); so the unreflected weight is exactly
  `φ⁴` times the reflected weight (`hat_reflection_frequency`).

`hat_reflection_frequency_witness` bundles the headline. The declarations depend on `propext` only.

## scope

This is the integer eigen-relation, not the Perron–Frobenius theorem: the module does not prove
that `hatLeftVector` is positive (`ℤ[φ]` carries no order in core) nor that it is the unique
Perron eigenvector up to scale, so it does not by itself say that `1 : φ⁴` is *the* frequency of
every hat tiling. That is the frontier node seated beside this one in the Blueprint. It does not
claim the hat aperiodic and transcribes no metatile geometry.

## References

* D. Smith, J. S. Myers, C. S. Kaplan, C. Goodman-Strauss, *An aperiodic monotile*,
  Combinatorial Theory 4(1) (2024) #6, arXiv:2303.10798 — §2 (an `H` metatile holds four hats,
  one reflected; `T` one; `P` and `F` two each).
* M. Baake, F. Gähler, L. Sadun, *Dynamics and topology of the Hat family of tilings*,
  arXiv:2305.05639 — §2 (the face substitution and its Perron data).
* Corpus: the 2026-06-26 memo on coloring aperiodic tiles and the quasicrystal frontier memo.

## Tags
hat monotile, reflected hats, golden integers, left eigenvector, Perron eigenvalue, frequency
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

open AperiodicOrder.Tiling.Universality
open AperiodicOrder.Tiling.StepN

/-- **The golden integers** `ℤ[φ]`: a pair `⟨a, b⟩` stands for `a + b·φ`, with `φ² = φ + 1`. -/
structure GoldenInt where
  /-- The integer part. -/
  a : Int
  /-- The coefficient of `φ`. -/
  b : Int
deriving DecidableEq, Repr

namespace GoldenInt

/-- Componentwise sum: `(a + bφ) + (c + dφ) = (a + c) + (b + d)φ`. -/
def add (x y : GoldenInt) : GoldenInt := ⟨x.a + y.a, x.b + y.b⟩

/-- Componentwise difference. -/
def sub (x y : GoldenInt) : GoldenInt := ⟨x.a - y.a, x.b - y.b⟩

/-- Product under `φ² = φ + 1`: `(a + bφ)(c + dφ) = (ac + bd) + (ad + bc + bd)φ`. -/
def mul (x y : GoldenInt) : GoldenInt :=
  ⟨x.a * y.a + x.b * y.b, x.a * y.b + x.b * y.a + x.b * y.b⟩

/-- An integer as a golden integer. -/
def ofInt (n : Int) : GoldenInt := ⟨n, 0⟩

/-- Zero. -/
def zero : GoldenInt := ⟨0, 0⟩

/-- `φ` itself, the pair `⟨0, 1⟩`. -/
def phi : GoldenInt := ⟨0, 1⟩

/-- `φ⁴ = 2 + 3φ`, the pair `⟨2, 3⟩` — the Fibonacci pair `(F₃, F₄)`. -/
def phiPowFour : GoldenInt := ⟨2, 3⟩

/-- **The golden equation** `φ · φ = φ + 1`, by kernel computation on pairs. -/
theorem phi_mul_phi : mul phi phi = add phi (ofInt 1) := by decide

/-- `φ⁴ = 2 + 3φ`: the fourth power of `φ` in `ℤ[φ]` is `phiPowFour`. -/
theorem phi_pow_four : mul (mul phi phi) (mul phi phi) = phiPowFour := by decide

end GoldenInt

/-- **Weighted sum** `Σᵢ wᵢ·vᵢ` of a golden vector `v` by an integer weight vector `w`. -/
def goldenWeigh (w : Fin 4 → Int) (v : Fin 4 → GoldenInt) : GoldenInt :=
  (List.finRange 4).foldl
    (fun acc i => GoldenInt.add acc (GoldenInt.mul (v i) (GoldenInt.ofInt (w i)))) GoldenInt.zero

/-- **Row-vector product** `(v·M)ⱼ = Σᵢ vᵢ·Mᵢⱼ` of a golden vector by an integer matrix. -/
def goldenRowMul (v : Fin 4 → GoldenInt) (M : Mat 4) : Fin 4 → GoldenInt :=
  fun j => goldenWeigh (fun i => M i j) v

/-- **The golden left eigenvector of the hat metatile matrix**, on the alphabet `H, T, P, F`:
`v = (1, 5 − 3φ, 6φ − 9, 6 − 3φ)`, normalized so that its `H` entry is `1`. -/
def hatLeftVector : Fin 4 → GoldenInt
  | 0 => ⟨1, 0⟩
  | 1 => ⟨5, -3⟩
  | 2 => ⟨-9, 6⟩
  | 3 => ⟨6, -3⟩

/-- **The left eigen-relation** `v·M = φ⁴·v`: `hatLeftVector` is a left eigenvector of
`hatMetatileMatrix` for the eigenvalue `φ⁴ = 2 + 3φ`, entry by entry in `ℤ[φ]`. -/
theorem hat_left_eigen :
    ∀ j, goldenRowMul hatLeftVector hatMetatileMatrix j
      = GoldenInt.mul GoldenInt.phiPowFour (hatLeftVector j) := by
  decide

/-- **Hats per metatile** `(4, 1, 2, 2)`: an `H` holds four hats, a `T` one, a `P` two, an `F`
two (Smith–Myers–Kaplan–Goodman-Strauss, §2). -/
def hatsPerMetatile : Fin 4 → Int
  | 0 => 4
  | 1 => 1
  | 2 => 2
  | 3 => 2

/-- **Reflected hats per metatile** `(1, 0, 0, 0)`: the one reflected hat of every hat tiling sits
at the centre of an `H` metatile, and nowhere else. -/
def reflectedHatsPerMetatile : Fin 4 → Int
  | 0 => 1
  | 1 => 0
  | 2 => 0
  | 3 => 0

/-- **Total hat weight** of the eigenvector: `Σ hatsPerMetatile · v = 3 + 3φ`. -/
theorem hat_total_weight : goldenWeigh hatsPerMetatile hatLeftVector = ⟨3, 3⟩ := by decide

/-- The total hat weight is `3φ²`: `3 + 3φ = 3(φ + 1) = 3φ·φ`. -/
theorem hat_total_weight_is_three_phi_sq :
    goldenWeigh hatsPerMetatile hatLeftVector
      = GoldenInt.mul (GoldenInt.ofInt 3) (GoldenInt.mul GoldenInt.phi GoldenInt.phi) := by
  decide

/-- **Reflected hat weight** of the eigenvector: `Σ reflectedHatsPerMetatile · v = 1`. -/
theorem hat_reflected_weight : goldenWeigh reflectedHatsPerMetatile hatLeftVector = ⟨1, 0⟩ := by
  decide

/-- **Reflected hats have frequency `1 : φ⁴`**: the unreflected weight (total minus reflected) is
exactly `φ⁴` times the reflected weight, as an identity in `ℤ[φ]`. -/
theorem hat_reflection_frequency :
    GoldenInt.sub (goldenWeigh hatsPerMetatile hatLeftVector)
        (goldenWeigh reflectedHatsPerMetatile hatLeftVector)
      = GoldenInt.mul GoldenInt.phiPowFour (goldenWeigh reflectedHatsPerMetatile hatLeftVector) := by
  decide

/-- **The reflection-frequency witness, bundled**: the golden equation, the left eigen-relation
`v·M = φ⁴·v`, and the frequency identity `unreflected = φ⁴ · reflected`. -/
theorem hat_reflection_frequency_witness :
    GoldenInt.mul GoldenInt.phi GoldenInt.phi = GoldenInt.add GoldenInt.phi (GoldenInt.ofInt 1)
    ∧ (∀ j, goldenRowMul hatLeftVector hatMetatileMatrix j
        = GoldenInt.mul GoldenInt.phiPowFour (hatLeftVector j))
    ∧ GoldenInt.sub (goldenWeigh hatsPerMetatile hatLeftVector)
          (goldenWeigh reflectedHatsPerMetatile hatLeftVector)
        = GoldenInt.mul GoldenInt.phiPowFour (goldenWeigh reflectedHatsPerMetatile hatLeftVector) :=
  ⟨GoldenInt.phi_mul_phi, hat_left_eigen, hat_reflection_frequency⟩

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
