import ObsmetrologiaPhysicalScience.QuantumContextuality.MeasurementScenario

/-! # The Mermin–Peres magic square — state-independent contextuality

The Popescu–Rohrlich box (`QuantumContextuality.MeasurementScenario`) and the Hardy model
(`QuantumContextuality.HardyModel`) are *state-dependent*: a particular outcome support, read as a
particular prepared state, is contextual. The **Mermin–Peres magic square** is strictly
weirder — it is **state-independent**: *no* assignment of definite outcomes to the nine
observables can respect the row/column constraints, whatever state is prepared. It is the
sharpest finite "all-versus-nothing" paradox and the engine of quantum pseudo-telepathy (the
magic-square game classical players cannot win with certainty but quantum players always can).

## The square

Nine measurements sit in a 3×3 grid (cell `r,c` is index `3r + c`, so `Fin 9`). The six
**lines** — three rows and three columns — are the contexts (each a triple of co-measurable
observables). In the physical realization each observable is a `±1`-valued Pauli product;
every row and every column multiplies to `+I` **except one column, which multiplies to `−I`**.

Encoding `±1` additively as `Bool` (`false = +1`, `true = −1`, product = `xor`), the line
constraint becomes a **parity**: the `xor` of a line's outcomes equals `false` for five lines
and `true` for the one odd line `{2,5,8}`. So `msAllowedB` allows exactly the assignments
meeting each line's prescribed parity.

## Why there is no global section (the parity double-count)

Every cell lies in exactly one row and one column, so it appears in exactly **two** of the six
lines. The `xor` of all declared required line-sums therefore counts each cell twice and vanishes
(`g m ^^ g m = false`). But the prescribed parities `xor` to `true` (`msParity_total_odd`:
five `false` and one `true`). A global assignment would force `false = true` — impossible. So
the support is **strongly contextual** with no reference to any state.

## Main definitions

* `lineXor`, `msParity`, `msAllowedB`, `magicSquare` — the line parity, the prescription
  (odd on `{2,5,8}`), the support indicator, and the empirical model over the six lines.

## Main results

* `msParity_total_odd` — the six prescribed parities `xor` to `true`: the root of the
  obstruction.
* `magicSquare_inhabited` — every line has a nonempty support (each is separately satisfiable).
* `magicSquare_no_global` — no global assignment meets all declared required line parities (the double-count
  contradiction).
* `magicSquare_strongly_contextual` — the magic square is strongly contextual,
  **state-independently**.

## Implementation notes

This is the combinatorial `ℤ/2` all-versus-nothing skeleton of the magic square — the
contextuality content. The operator realization (the Pauli observables, their commutation, the
Hilbert space) is the not-built analytic layer; a parity model is *not* an operator algebra.
The double-count is the Abramsky–Barbosa–Kishida–Lal–Mansfield all-versus-nothing / `ℤ/2`
obstruction, the natural input to the cohomological-contextuality frontier.

## References

`content/.../sheaf`; Mermin 1990, Peres 1990; Abramsky–Brandenburger 2011; Abramsky, Barbosa,
Kishida, Lal, Mansfield, *Contextuality, Cohomology and Paradox* (2015). Siblings:
`QuantumContextuality.MeasurementScenario`, `QuantumContextuality.HardyModel`.

## Tags

contextuality, magic square, state-independent, all-versus-nothing, parity, Kochen–Specker
-/

namespace Obsmetrologia
namespace QuantumContextuality

/-! ## (A) The magic-square empirical model -/

/-- The `xor` of an assignment over the cells of a line (its additive `±1` product). -/
def lineXor (g : Fin 9 → Bool) (C : List (Fin 9)) : Bool :=
  C.foldr (fun m acc => g m ^^ acc) false

/-- The six lines of the square: three rows then three columns. The contexts of the scenario. -/
def msLines : List (List (Fin 9)) :=
  [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

/-- The prescribed parity of each line: `true` (the `−I` line) on the odd column `{2,5,8}`,
`false` (the `+I` lines) on the other five. -/
def msParity (C : List (Fin 9)) : Bool := if C = [2, 5, 8] then true else false

/-- The magic-square support indicator: a line allows exactly the assignments whose `xor` over
its cells matches the line's prescribed parity. -/
def msAllowedB (C : List (Fin 9)) (g : Fin 9 → Bool) : Bool := lineXor g C == msParity C

/-- The magic-square scenario: the cover by the six lines. -/
def msScenario : Scenario (Fin 9) := ⟨msLines⟩

/-- The **Mermin–Peres magic square** as a possibilistic empirical model. -/
def magicSquare : Model (Fin 9) Bool where
  scenario := msScenario
  support := fun C g => msAllowedB C g = true

/-! ## (B) The parity obstruction -/

/-- **The prescribed parities are odd.** The `xor` of the six line parities is `true` — five
lines are `+I` (`false`) and exactly one, the column `{2,5,8}`, is `−I` (`true`). This odd
total is the root of the obstruction. -/
theorem msParity_total_odd :
    (msParity [0, 1, 2] ^^ msParity [3, 4, 5] ^^ msParity [6, 7, 8] ^^
      msParity [0, 3, 6] ^^ msParity [1, 4, 7] ^^ msParity [2, 5, 8]) = true := by decide

/-! ## (C) Every line is separately satisfiable -/

/-- **Every line has a nonempty support.** Each of the six lines admits an allowed assignment:
the five even lines by the constant `false`, the odd column `{2,5,8}` by the assignment
`true` on cell `2`. Local consistency holds — contextuality is purely global. -/
theorem magicSquare_inhabited : AllContextsInhabited magicSquare := by
  intro C hC
  simp only [magicSquare, msScenario, msLines, List.mem_cons,
    List.not_mem_nil, or_false] at hC
  rcases hC with rfl | rfl | rfl | rfl | rfl | rfl
  · exact ⟨fun _ => false, by show msAllowedB _ _ = true; decide⟩
  · exact ⟨fun _ => false, by show msAllowedB _ _ = true; decide⟩
  · exact ⟨fun _ => false, by show msAllowedB _ _ = true; decide⟩
  · exact ⟨fun _ => false, by show msAllowedB _ _ = true; decide⟩
  · exact ⟨fun _ => false, by show msAllowedB _ _ = true; decide⟩
  · exact ⟨fun k => k == 2, by show msAllowedB _ _ = true; decide⟩

/-! ## (D) No global section -/

/-- **The magic square has no global section.** A global `g : Fin 9 → Bool` meeting all declared required
line parities would, by the double-count (each cell in exactly two lines), make the `xor` of
the six line-sums both `false` (cells cancel pairwise) and `true` (`msParity_total_odd`) —
impossible. Proven by Boolean exhaustion over the nine cells. -/
theorem magicSquare_no_global : ¬ HasGlobalSection magicSquare := by
  rintro ⟨g, hg⟩
  have h0 := hg [0, 1, 2] (by decide)
  have h1 := hg [3, 4, 5] (by decide)
  have h2 := hg [6, 7, 8] (by decide)
  have h3 := hg [0, 3, 6] (by decide)
  have h4 := hg [1, 4, 7] (by decide)
  have h5 := hg [2, 5, 8] (by decide)
  simp only [magicSquare, msAllowedB, lineXor, List.foldr_cons, List.foldr_nil] at h0 h1 h2 h3 h4 h5
  revert h0 h1 h2 h3 h4 h5
  cases g 0 <;> cases g 1 <;> cases g 2 <;> cases g 3 <;> cases g 4 <;>
    cases g 5 <;> cases g 6 <;> cases g 7 <;> cases g 8 <;> decide

/-! ## (E) State-independent strong contextuality -/

/-- **The magic square is strongly contextual — state-independently.** Every line has a
nonempty support yet no global assignment realizes all declared required. Unlike the PR box and the Hardy
model, no special outcome support (no prepared state) is needed: the obstruction is a parity
identity in the constraints themselves. This is the sharpest finite all-versus-nothing
contextuality witness. -/
theorem magicSquare_strongly_contextual : StronglyContextual magicSquare :=
  ⟨magicSquare_inhabited, magicSquare_no_global⟩

end QuantumContextuality
end Obsmetrologia
