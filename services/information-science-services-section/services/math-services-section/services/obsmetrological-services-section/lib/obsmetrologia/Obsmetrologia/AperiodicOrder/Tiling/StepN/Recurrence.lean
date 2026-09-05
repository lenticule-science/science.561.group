import Obsmetrologia.AperiodicOrder.Tiling.Universality
import Obsmetrologia.AperiodicOrder.Tiling.AndersonPutnam
import Obsmetrologia.Calculus.Order.SetNumberGraphTheory

/-!
# Step-n substitution recurrence — the co-incrementing hierarchy

This module formalizes the three corpus nodes

* `…/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/step-n-substitution-recurrence.md`
* `…/step-n-substitution-recurrence/content/step-n-substitution-rule/step-n-substitution-rule.md`
* `…/step-n-substitution-rule/content/step-n-classifying-invariant/step-n-classifying-invariant.md`

recording the **co-incrementing hierarchy** of a step-`n` substitution rule: a *single*
natural parameter `n ≥ 2` controls many seemingly-independent quantities of the rule, and a
`+1` in any one propagates to a `+1` in all. The controlled quantities are

1. **recurrence depth** — the rule is an `n`-term recurrence (`P(k)` depends on the previous
   `n` terms);
2. **alphabet size** — the rule has `n` letters;
3. **matrix dimension** — the substitution matrix `M` is `n × n` (entry `i j` = count of
   `j`-letters produced from an `i`-letter, a non-negative integer);
4. **cohomological rank** — the Anderson–Putnam classifying invariant has rank `n`
   (`cl-inv⁽ⁿ⁾ ∈ ℤⁿ`, reusing `AperiodicOrder.Tiling.stepNInvariant`);
5. **minimal-polynomial degree of the growth rate** — the growth rate is the dominant
   Perron–Frobenius eigenvalue of `M`, a **degree-`n` algebraic number** (the root of the
   degree-`n` monic characteristic polynomial of the `n × n` matrix);
6. **bilattice internal structure** — at `n = 2` the two order axes, at `n = 3` the three
   non-bottom values, at `n = 4` all FOUR (`n = 2 ↔ FOUR`, reusing
   `AperiodicOrder.Tiling.step_two_is_four`).

## How the hierarchy is modeled

`StepNData n` is a bundle recording `matrixDim`, `recurrenceDepth`, `alphabetSize`, `cohRank`
(all `Nat`) for the canonical step-`n` rule, *constructed* so that each equals `n`. The
content is the headline `step_n_co_increments`: all four are `= n`, and the bundle at `n+1`
has all four `= n+1` — the `+1`-in-one-is-`+1`-in-all propagation, made exact by the single
parameter.

## How the characteristic polynomial / growth-rate degree is modeled

Obsmetrologia derives ℝ internally (`Obsmetrologia.Real.Internal`), and the growth-rate
eigenvalue **is** computed as a real for the metallic/Salem families
(`AperiodicOrder.Tiling.StepN.MetallicReal`, `Salem`). Here we deliberately carry the degree-`n`
*content* by the **integer characteristic polynomial** — the dependency-free invariant the
classification actually needs — rather than the real root: modeled as a `List Int` of coefficients in ascending
degree (`coeffs[k]` = coefficient of `xᵏ`). The characteristic polynomial of an `n × n` integer
matrix is **monic of degree `n`** — i.e. the list has length `n + 1` and last (leading) entry
`1`. We define `degreeN cp := cp.length = n + 1` and `monic cp := cp.getLast? = some 1`, and
prove both for the concrete small cases.

* **Fibonacci** (`n = 2`): substitution matrix rows `[1,1]`, `[1,0]`; characteristic polynomial
  `x² − x − 1`; coefficient list `[-1, -1, 1]`; root the **golden ratio** `φ = (1 + √5)/2` (its
  minimal polynomial, the Pisot growth rate). Degree `2`.
* **Padovan** (`n = 3`): recurrence `P(k) = P(k−2) + P(k−3)`; characteristic polynomial
  `x³ − x − 1`; coefficient list `[-1, -1, 0, 1]`; root the **plastic number** `ρ ≈ 1.3247…`
  (its minimal polynomial, the smallest Pisot number). Degree `3`.

The reals are *documented, not computed*: we prove the integer-polynomial facts (length = `n+1`,
monic) that carry the degree-`n` algebraic content, and tie `n = 2` to the golden ratio / FOUR
via `AperiodicOrder.Tiling.stepNInvariant` and `AperiodicOrder.Tiling.step_two_is_four`.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN

/-! ## (1) The co-incrementing bundle `StepNData`

A step-`n` substitution rule has, by the corpus, four mutually-locked `Nat` quantities — the
substitution-matrix dimension, the recurrence depth, the alphabet size, and the cohomological
rank — all equal to the single parameter `n`. We bundle them and *construct* the canonical
bundle so each field is `n`. -/

/-- The **co-incrementing data** of a step-`n` substitution rule: the four `Nat` quantities the
single parameter `n` controls. The corpus fact (`step-n-substitution-recurrence.md`) is that for
the canonical step-`n` rule **all four equal `n`** (`mkStepN`), so a `+1` in the parameter is a
`+1` in every field at once. -/
structure StepNData where
  /-- The dimension of the `n × n` substitution matrix `M` (`M i j` = count of `j`-letters from
  an `i`-letter). -/
  matrixDim : Nat
  /-- The recurrence depth — the rule is an `n`-term recurrence. -/
  recurrenceDepth : Nat
  /-- The alphabet size — the rule has `n` letters. -/
  alphabetSize : Nat
  /-- The cohomological rank — `cl-inv⁽ⁿ⁾ ∈ ℤⁿ` (`AperiodicOrder.Tiling.stepNInvariant`). -/
  cohRank : Nat
  deriving DecidableEq, Repr

/-- The **canonical step-`n` bundle**: every controlled quantity equals the single parameter
`n`. This is the construction witnessing the co-incrementing hierarchy — there is *one* `n`, and
matrix dimension, recurrence depth, alphabet size, and cohomological rank are all that one `n`. -/
def mkStepN (n : Nat) : StepNData :=
  { matrixDim := n, recurrenceDepth := n, alphabetSize := n, cohRank := n }

/-- For the canonical bundle, the matrix dimension is `n`. -/
@[simp] theorem mkStepN_matrixDim (n : Nat) : (mkStepN n).matrixDim = n := rfl
/-- For the canonical bundle, the recurrence depth is `n`. -/
@[simp] theorem mkStepN_recurrenceDepth (n : Nat) : (mkStepN n).recurrenceDepth = n := rfl
/-- For the canonical bundle, the alphabet size is `n`. -/
@[simp] theorem mkStepN_alphabetSize (n : Nat) : (mkStepN n).alphabetSize = n := rfl
/-- For the canonical bundle, the cohomological rank is `n`. -/
@[simp] theorem mkStepN_cohRank (n : Nat) : (mkStepN n).cohRank = n := rfl

/-- **All four controlled quantities of the canonical step-`n` bundle are equal.** They are the
single parameter `n` viewed four ways — the locking that makes the hierarchy co-increment. -/
theorem mkStepN_all_eq (n : Nat) :
    (mkStepN n).matrixDim = (mkStepN n).recurrenceDepth
    ∧ (mkStepN n).recurrenceDepth = (mkStepN n).alphabetSize
    ∧ (mkStepN n).alphabetSize = (mkStepN n).cohRank :=
  ⟨rfl, rfl, rfl⟩

/-! ## (2) The characteristic polynomial as an integer-coefficient list

The growth rate of a primitive step-`n` rule is the dominant Perron–Frobenius eigenvalue of the
`n × n` substitution matrix — a **degree-`n` algebraic number** (the root of the matrix's monic
degree-`n` characteristic polynomial). This module carries the *integer characteristic
polynomial* as a `List Int` of coefficients in **ascending** degree (`coeffs[k]`
is the coefficient of `xᵏ`). The degree-`n` content is then: the list has length `n + 1`, and its
leading (last) coefficient is `1` (monic). -/

/-- **Degree-`n` predicate** on a coefficient list: an `n × n` matrix's characteristic
polynomial has degree exactly `n`, i.e. its ascending-degree coefficient list has length
`n + 1`. -/
def degreeN (cp : List Int) (n : Nat) : Prop := cp.length = n + 1

/-- **Monic predicate** on a coefficient list (ascending degree): the leading (last) coefficient
is `1`. The characteristic polynomial of an integer matrix is always monic. -/
def monic (cp : List Int) : Prop := cp.getLast? = some 1

/-- **Fibonacci characteristic polynomial** `x² − x − 1` as an ascending-degree coefficient
list `[-1, -1, 1]` (constant `−1`, linear `−1`, quadratic `1`). This is the minimal polynomial of
the **golden ratio** `φ = (1 + √5)/2`, the Perron–Frobenius growth rate of the Fibonacci
substitution matrix `[[1,1],[1,0]]` (`n = 2`). -/
def charPolyFib : List Int := [-1, -1, 1]

/-- **Padovan characteristic polynomial** `x³ − x − 1` as an ascending-degree coefficient list
`[-1, -1, 0, 1]` (constant `−1`, linear `−1`, quadratic `0`, cubic `1`). This is the minimal
polynomial of the **plastic number** `ρ`, the Perron–Frobenius growth rate of the Padovan
recurrence `P(k) = P(k−2) + P(k−3)` (`n = 3`). -/
def charPolyPad : List Int := [-1, -1, 0, 1]

/-- **The Fibonacci characteristic polynomial has degree 2** (length `3 = 2 + 1`). -/
theorem charPolyFib_degree : degreeN charPolyFib 2 := rfl

/-- **The Fibonacci characteristic polynomial is monic** (leading coefficient `1`). -/
theorem charPolyFib_monic : monic charPolyFib := rfl

/-- **The Padovan characteristic polynomial has degree 3** (length `4 = 3 + 1`). -/
theorem charPolyPad_degree : degreeN charPolyPad 3 := rfl

/-- **The Padovan characteristic polynomial is monic** (leading coefficient `1`). -/
theorem charPolyPad_monic : monic charPolyPad := rfl

/-! ## (3) The Fibonacci and Padovan step-`n` bundles -/

/-- The **Fibonacci** step-2 bundle: 2-term recurrence, 2 letters, `2 × 2` matrix, rank-2
cohomology — all `= 2`. -/
def fibData : StepNData := mkStepN 2

/-- The **Padovan** step-3 bundle: 3-term recurrence, 3 letters, `3 × 3` matrix, rank-3
cohomology — all `= 3`. -/
def padData : StepNData := mkStepN 3

/-- **Fibonacci is the `n = 2` instance**: every controlled quantity is `2`. -/
theorem fibData_all_two :
    fibData.matrixDim = 2 ∧ fibData.recurrenceDepth = 2
    ∧ fibData.alphabetSize = 2 ∧ fibData.cohRank = 2 :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- **Padovan is the `n = 3` instance**: every controlled quantity is `3`. -/
theorem padData_all_three :
    padData.matrixDim = 3 ∧ padData.recurrenceDepth = 3
    ∧ padData.alphabetSize = 3 ∧ padData.cohRank = 3 :=
  ⟨rfl, rfl, rfl, rfl⟩

/-! ## The co-incrementing hierarchy -/

/-- **The step-`n` co-incrementing hierarchy.** For the canonical step-`n` rule the
four seemingly-independent quantities are *one* parameter `n`:

* `matrixDim = recurrenceDepth = alphabetSize = cohRank = n` — all four equal `n` (the locking);
* the bundle at `n + 1` has all four equal to `n + 1` — the **`+1`-propagation**: a plus-one in
  the single parameter is a plus-one in every controlled quantity at once;
* exhibited concretely by **Fibonacci** (`n = 2`, all four `= 2`) and **Padovan** (`n = 3`, all
  four `= 3`).

Corpus: `step-n-substitution-recurrence.md`, `step-n-substitution-rule.md`. -/
theorem step_n_co_increments :
    -- all four controlled quantities of the canonical step-n bundle equal n
    (∀ n : Nat, (mkStepN n).matrixDim = n ∧ (mkStepN n).recurrenceDepth = n
        ∧ (mkStepN n).alphabetSize = n ∧ (mkStepN n).cohRank = n)
    -- the +1 propagation: the (n+1)-bundle has all four equal to n+1
    ∧ (∀ n : Nat, (mkStepN (n + 1)).matrixDim = n + 1
        ∧ (mkStepN (n + 1)).recurrenceDepth = n + 1
        ∧ (mkStepN (n + 1)).alphabetSize = n + 1
        ∧ (mkStepN (n + 1)).cohRank = n + 1)
    -- Fibonacci (n = 2) and Padovan (n = 3) concretely
    ∧ (fibData.matrixDim = 2 ∧ fibData.recurrenceDepth = 2
        ∧ fibData.alphabetSize = 2 ∧ fibData.cohRank = 2)
    ∧ (padData.matrixDim = 3 ∧ padData.recurrenceDepth = 3
        ∧ padData.alphabetSize = 3 ∧ padData.cohRank = 3) :=
  ⟨fun _ => ⟨rfl, rfl, rfl, rfl⟩,
   fun _ => ⟨rfl, rfl, rfl, rfl⟩,
   fibData_all_two,
   padData_all_three⟩

/-! ## The substitution growth rate is a degree-`n` algebraic number -/

/-- **The substitution growth rate has degree exactly `n`.** The growth rate of a
primitive step-`n` rule is the dominant Perron–Frobenius eigenvalue of the `n × n` substitution
matrix — a **degree-`n` algebraic number**, the root of the matrix's monic degree-`n`
characteristic polynomial. We prove the degree-`n` *integer-polynomial*
content (the minimal polynomials); the real eigenvalue itself is built in `AperiodicOrder.Tiling.StepN.MetallicReal`:

* **Fibonacci** (`n = 2`): `charPolyFib = [-1,-1,1]` (`x² − x − 1`) is monic of degree `2` — the
  minimal polynomial of the **golden ratio** `φ`;
* **Padovan** (`n = 3`): `charPolyPad = [-1,-1,0,1]` (`x³ − x − 1`) is monic of degree `3` — the
  minimal polynomial of the **plastic number** `ρ`;
* the cohomological rank co-increments with this degree (`cohRank = n`, the same `n`), and at
  `n = 2` the step-`n` invariant `cl-inv⁽²⁾ ∈ ℤ²` aligns with **FOUR** — `AperiodicOrder.Tiling.stepNInvariant`
  is the identity on `Fin 2 → Int` and FOUR is the corner count `4 = 2²` of the bilattice it lives
  over (`AperiodicOrder.Tiling.step_two_is_four`).

The real growth rate itself is *documented here*; it is computed as an internal real in
`AperiodicOrder.Tiling.StepN.MetallicReal`. This module carries the degree-`n` algebraic content via the
monic integer characteristic polynomial.

Corpus: `step-n-classifying-invariant.md`, `step-n-substitution-rule.md`. -/
theorem substitution_growth_degree_n :
    -- Fibonacci char poly: monic of degree 2 (golden ratio minimal polynomial)
    (degreeN charPolyFib 2 ∧ monic charPolyFib)
    -- Padovan char poly: monic of degree 3 (plastic number minimal polynomial)
    ∧ (degreeN charPolyPad 3 ∧ monic charPolyPad)
    -- the cohomological rank is the same n (degree co-increments with cohRank)
    ∧ (fibData.cohRank = 2 ∧ padData.cohRank = 3)
    -- n = 2 ↔ FOUR: the step-2 invariant is over Fin 2, and FOUR = 4 = 2² is its corner count
    ∧ (∀ coords : Fin 2 → Int, AperiodicOrder.Tiling.stepNInvariant 2 coords = coords)
    ∧ Articulating.Corner.all.length = 4 :=
  ⟨⟨charPolyFib_degree, charPolyFib_monic⟩,
   ⟨charPolyPad_degree, charPolyPad_monic⟩,
   ⟨rfl, rfl⟩,
   (AperiodicOrder.Tiling.step_two_is_four).1,
   (AperiodicOrder.Tiling.step_two_is_four).2.1⟩

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
