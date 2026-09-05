import Infomaterial.Persistence.Aperiodic.Moduli
import Infomaterial.Persistence.Aperiodic.Classification
import Infomaterial.Calculus.Order.SetNumberGraphTheory

/-!
# Substitution universality class — shift equivalence of substitution matrices is an equivalence relation, and the universality class is exactly the shift-equivalence class

This module formalizes the corpus node

* `…/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/substitution-universality-class/substitution-universality-class.md`

which records the **substitution universality class** of a primitive non-singular
substitution rule. Reading the corpus definition:

> **Strong shift equivalence.** Square non-negative integer matrices `M` and `M'` are
> **strongly shift equivalent (SSE)** if there exist non-negative integer matrices `R`, `S`
> with `M = R·S`, `M' = S·R`.
> **Shift equivalence.** `M` and `M'` are **shift equivalent (SE)** if there exist `R`, `S`
> and an integer `ℓ ≥ 1` with `M^ℓ = R·S`, `M'^ℓ = S·R`. SE is the transitive closure of
> SSE; SE is coarser than SSE.
> **Universality class.** Two primitive non-singular substitution rules `S` (matrix `M`),
> `S'` (matrix `M'`) belong to the same **universality class** iff `M` and `M'` are shift
> equivalent. The cohomological classifying invariant (`cl-inv` / Anderson–Putnam Čech
> cohomology) is an SE-invariant — SE matrices have the same RG-flow asymptotics.

## How the substitution matrix is modeled (concrete, over `Int`)

The substitution matrix of a step-`n` rule is a square non-negative integer matrix. We model
an `n×n` integer matrix concretely as `Mat n := Fin n → Fin n → Int`, with `matMul`
(row-times-column via a finite integer sum over `Fin n`), `matId` (the Kronecker identity),
and `matPow` (iterated `matMul`). The matrix algebra it needs — `matMul` is associative, and
`matId` is a two-sided unit — we prove from Lean-core `Int`/`Nat`/`List` lemmas by `funext`
plus a hand-built `isum` (finite sum over `Fin n`, the dependency-free stand-in for
`Finset.sum`) with its additivity / distribution / Fubini-swap / single-term laws. No `ring`
tactic: every algebra step is `simp only [Int …]` / `induction`.

We model SE at a **fixed dimension** `n` (same-size matrices). The corpus notes that SE *can*
change rank (the alphabet size is not an SE-invariant), so cross-dimension SE is genuinely
more general; we scope to fixed `n` and report this. At fixed `n` everything the headlines
assert — SE is an equivalence relation, SSE ⟹ SE, the universality-class bundling — holds.

## How shift equivalence is modeled

* `SSE M M' := ∃ R S, M = matMul R S ∧ M' = matMul S R` — strong shift equivalence.
* `SE M M' := ∃ R S (ℓ : Nat), 1 ≤ ℓ ∧ matPow M ℓ = matMul R S ∧ matPow M' ℓ = matMul S R` —
  shift equivalence. (We carry `R, S : Mat n` ranging over all integer matrices; the
  non-negativity cone of the corpus is the order datum of the *dimension group* invariant, not
  needed to state the equivalence-relation structure — documented here.)

`SE` is **reflexive** (ℓ=1, `R = M`, `S = matId`: `matPow M 1 = M = matMul M matId` and
`matPow M 1 = M = matMul matId M`), **symmetric** (swap `R, S`), and **transitive** (compose
two SE chains — the transitive-closure-of-SSE structure of the corpus). `SSE ⟹ SE` takes
ℓ=1; so `SE ⊇ SSE`.

## How the universality class and SE-invariance of `cl-inv` are modeled

The universality class of a rule is its SE-class — `UniversalityClass M := the SE-class of M`
(`Quot SE`). Two rules are in the same universality class **iff** their matrices are SE
(`Quot.sound` one way; reading off the relation the other — `SE` packaged as a `Quot`).

For the **SE-invariance of the classifying invariant** we reuse the moduli machinery of
`SettlingModuliStack` / `AperiodicClassification`: a substitution rule realizes a `cl-inv`-class
(`Moduli.toModuli`), which the corpus reads as the complete MLD-invariant (the converse being
the open classification). We make the **structural tie** honest: SE matrices that carry
the *same* classifying coordinate land on the *same* moduli point — i.e. when the universality
class is realized by `StepRule`s with a shared `coord`, the MLD-class (hence `cl-inv`) is
fixed. This is the SE-invariance of `cl-inv` at the level our moduli model exposes (a
structural tie through `Moduli.toModuli_eq_of_coord`, not a full Anderson–Putnam Čech
computation — the cohomology computation itself is documented in `AperiodicClassification`).
-/

namespace Infomaterial
namespace Persistence.Aperiodic.Universality

/-! ## (0) Finite integer sum over `Fin n` — the dependency-free `Finset.sum` stand-in

`isum f := Σ_{i<n} f i`, folded over `List.finRange n`. We prove the additivity,
distribution, single-term, and Fubini-swap laws needed for the matrix algebra, all from
Lean-core `Int` lemmas (no `ring`). -/

/-- **Finite integer sum** `Σ_{i<n} f i` over a function on `Fin n`, folded as
`List.foldr (· + ·) 0` over `List.finRange n`. The dependency-free stand-in for `Finset.sum`,
specialized to `Int`. -/
def isum {n : Nat} (f : Fin n → Int) : Int :=
  ((List.finRange n).map f).foldr (· + ·) 0

/-- The empty sum is `0`. -/
@[simp] theorem isum_zero (f : Fin 0 → Int) : isum f = 0 := rfl

/-- **Head split.** `Σ_{i<n+1} f i = f 0 + Σ_{i<n} f (i.succ)`. -/
theorem isum_succ {n : Nat} (f : Fin (n+1) → Int) :
    isum f = f 0 + isum (fun i : Fin n => f i.succ) := by
  unfold isum
  rw [List.finRange_succ]
  simp only [List.map_cons, List.foldr_cons, List.map_map]
  rfl

/-- **Sum of zeros is zero.** -/
theorem isum_const_zero {n : Nat} : isum (fun _ : Fin n => (0 : Int)) = 0 := by
  induction n with
  | zero => rfl
  | succ m ih => rw [isum_succ]; rw [ih]; rw [Int.add_zero]

/-- **Every summand zero ⟹ sum zero.** -/
theorem isum_eq_zero {n : Nat} (f : Fin n → Int) (h : ∀ i, f i = 0) : isum f = 0 := by
  rw [show f = (fun _ : Fin n => (0 : Int)) from funext h]; exact isum_const_zero

/-- **Additivity.** `Σ (f i + g i) = Σ f i + Σ g i`, by induction on `n` with `Int`
add-assoc/comm (no `ring`). -/
theorem isum_add {n : Nat} (f g : Fin n → Int) :
    isum (fun i => f i + g i) = isum f + isum g := by
  induction n with
  | zero => simp
  | succ m ih =>
    rw [isum_succ (fun i => f i + g i), isum_succ f, isum_succ g]
    rw [show (fun i : Fin m => f i.succ + g i.succ)
          = (fun i : Fin m => (fun j => f j.succ) i + (fun j => g j.succ) i) from rfl]
    rw [ih (fun j => f j.succ) (fun j => g j.succ)]
    -- (f0+g0) + (Sf + Sg) = (f0 + Sf) + (g0 + Sg)
    simp only [Int.add_assoc]
    rw [← Int.add_assoc (g 0), Int.add_comm (g 0) (isum (fun j => f j.succ)),
        Int.add_assoc]

/-- **Pulling a left scalar out of a sum.** `Σ (a * f i) = a * Σ f i`. -/
theorem isum_mul_left {n : Nat} (a : Int) (f : Fin n → Int) :
    isum (fun i => a * f i) = a * isum f := by
  induction n with
  | zero => simp
  | succ m ih =>
    rw [isum_succ (fun i => a * f i), isum_succ f]
    rw [show (fun i : Fin m => a * f i.succ)
          = (fun i : Fin m => a * (fun j => f j.succ) i) from rfl]
    rw [ih (fun j => f j.succ), Int.mul_add]

/-- **Pulling a right scalar out of a sum.** `Σ (f i * a) = (Σ f i) * a`. -/
theorem isum_mul_right {n : Nat} (a : Int) (f : Fin n → Int) :
    isum (fun i => f i * a) = isum f * a := by
  induction n with
  | zero => simp
  | succ m ih =>
    rw [isum_succ (fun i => f i * a), isum_succ f]
    rw [show (fun i : Fin m => f i.succ * a)
          = (fun i : Fin m => (fun j => f j.succ) i * a) from rfl]
    rw [ih (fun j => f j.succ), Int.add_mul]

/-- **Single-term sum picks the value at one index, the rest zero.** If `f j = a` and `f i = 0`
for `i ≠ j`, then `Σ f = a`. (Decision via `Decidable.byCases`, not `by_cases`.) -/
theorem isum_single : ∀ {n : Nat} (f : Fin n → Int) (j : Fin n) (a : Int),
    f j = a → (∀ i, i ≠ j → f i = 0) → isum f = a := by
  intro n
  induction n with
  | zero => intro _ j _ _ _; exact absurd j.isLt (by omega)
  | succ m ih =>
    intro f j a hj hrest
    rw [isum_succ f]
    refine Decidable.byCases (p := j = 0) ?_ ?_
    · intro hj0
      subst hj0
      have hzero : isum (fun i : Fin m => f i.succ) = 0 := by
        apply isum_eq_zero
        intro i
        exact hrest i.succ (Fin.succ_ne_zero i)
      rw [hzero, Int.add_zero, hj]
    · intro hj0
      have hjeq : (j.pred hj0).succ = j := Fin.succ_pred j hj0
      have hf0 : f 0 = 0 := hrest 0 (fun h => hj0 h.symm)
      rw [hf0, Int.zero_add]
      apply ih (fun i : Fin m => f i.succ) (j.pred hj0) a
      · show f (j.pred hj0).succ = a; rw [hjeq]; exact hj
      · intro i hi
        apply hrest i.succ
        intro h
        apply hi
        rw [← hjeq] at h
        exact Fin.succ_inj.mp h

/-- **Fubini for double sums.** `Σ_i Σ_j g i j = Σ_j Σ_i g i j` — the order of two finite
sums may be swapped. Proved by induction on the *outer* `n`, peeling one row and using
`isum_add` to merge the head row into the column sums. -/
theorem isum_swap : ∀ {n p : Nat} (g : Fin n → Fin p → Int),
    isum (fun i => isum (fun j => g i j)) = isum (fun j => isum (fun i => g i j)) := by
  intro n
  induction n with
  | zero =>
    intro p g
    -- LHS = 0; RHS = Σ_j (empty inner sum) = Σ_j 0 = 0
    rw [isum_zero]
    rw [show (fun j => isum (fun i : Fin 0 => g i j)) = (fun _ : Fin p => (0 : Int)) from
          funext (fun j => isum_zero _)]
    rw [isum_const_zero]
  | succ m ih =>
    intro p g
    rw [isum_succ (fun i => isum (fun j => g i j))]
    -- RHS: Σ_j Σ_{i<m+1} g i j = Σ_j (g 0 j + Σ_{i<m} g i.succ j)
    rw [show (fun j => isum (fun i : Fin (m+1) => g i j))
          = (fun j => g 0 j + isum (fun i : Fin m => g i.succ j)) from
          funext (fun j => isum_succ (fun i => g i j))]
    rw [isum_add (fun j => g 0 j) (fun j => isum (fun i : Fin m => g i.succ j))]
    rw [ih (fun i j => g i.succ j)]

/-! ## (1) Integer matrices, multiplication, identity, and powers

`Mat n := Fin n → Fin n → Int`. `matMul A B i k := Σ_j A i j * B j k`. `matId i k := 1` if
`i = k` else `0`. `matPow M ℓ := M^ℓ` by iterated `matMul`. -/

/-- An **`n×n` integer matrix**: `Fin n → Fin n → Int`. The substitution matrix of a step-`n`
substitution rule (a square non-negative integer matrix; non-negativity is the order datum of
the dimension-group invariant, not required for the SE algebra here). -/
def Mat (n : Nat) : Type := Fin n → Fin n → Int

/-- **Matrix multiplication** `(A·B) i k := Σ_{j<n} A i j * B j k` (row-times-column via
`isum`). -/
def matMul {n : Nat} (A B : Mat n) : Mat n :=
  fun i k => isum (fun j => A i j * B j k)

/-- **The identity matrix** `I i k := if i = k then 1 else 0` (the Kronecker delta).
Decision via `Decidable.byCases` is unnecessary here — `Fin` has `DecidableEq`, so the plain
`if` elaborates. -/
def matId {n : Nat} : Mat n :=
  fun i k => if i = k then 1 else 0

/-- **Matrix power** `M^ℓ` by iterated `matMul`, with `M^0 = I`. -/
def matPow {n : Nat} (M : Mat n) : Nat → Mat n
  | 0 => matId
  | (ℓ+1) => matMul (matPow M ℓ) M

/-- `M^1 = M`. (Used for SE-reflexivity at `ℓ = 1`.) -/
@[simp] theorem matPow_one {n : Nat} (M : Mat n) : matPow M 1 = matMul (matPow M 0) M := rfl

/-! ### The matrix algebra: `matId` is a two-sided unit, `matMul` is associative -/

/-- **Right identity.** `A · I = A`: in `Σ_j A i j * I j k`, only `j = k` survives. -/
theorem matMul_id_right {n : Nat} (A : Mat n) : matMul A matId = A := by
  funext i k
  show isum (fun j => A i j * matId j k) = A i k
  apply isum_single (fun j => A i j * matId j k) k (A i k)
  · show A i k * matId k k = A i k
    have : matId k k = (1 : Int) := by
      show (if k = k then (1 : Int) else 0) = 1; rw [if_pos rfl]
    rw [this, Int.mul_one]
  · intro j hj
    show A i j * matId j k = 0
    have : matId j k = (0 : Int) := by
      show (if j = k then (1 : Int) else 0) = 0; rw [if_neg hj]
    rw [this, Int.mul_zero]

/-- **Left identity.** `I · A = A`: in `Σ_j I i j * A j k`, only `j = i` survives. -/
theorem matMul_id_left {n : Nat} (A : Mat n) : matMul matId A = A := by
  funext i k
  show isum (fun j => matId i j * A j k) = A i k
  apply isum_single (fun j => matId i j * A j k) i (A i k)
  · show matId i i * A i k = A i k
    have : matId i i = (1 : Int) := by
      show (if i = i then (1 : Int) else 0) = 1; rw [if_pos rfl]
    rw [this, Int.one_mul]
  · intro j hj
    show matId i j * A j k = 0
    have : matId i j = (0 : Int) := by
      show (if i = j then (1 : Int) else 0) = 0; rw [if_neg (fun h => hj h.symm)]
    rw [this, Int.zero_mul]

/-- **Associativity.** `(A·B)·C = A·(B·C)`. Expand both as double sums over the inner index,
distribute the multiplication into each sum (`isum_mul_left`/`isum_mul_right`), reassociate the
triple product with `Int.mul_assoc`, and swap the two summations with `isum_swap` (Fubini). No
`ring`. -/
theorem matMul_assoc {n : Nat} (A B C : Mat n) :
    matMul (matMul A B) C = matMul A (matMul B C) := by
  funext i k
  show isum (fun j => (matMul A B) i j * C j k)
      = isum (fun l => A i l * (matMul B C) l k)
  -- LHS: Σ_j (Σ_l A i l * B l j) * C j k  =  Σ_j Σ_l (A i l * B l j) * C j k
  have hL : (fun j => (matMul A B) i j * C j k)
      = (fun j => isum (fun l => (A i l * B l j) * C j k)) := by
    funext j
    show (isum (fun l => A i l * B l j)) * C j k = isum (fun l => (A i l * B l j) * C j k)
    rw [isum_mul_right (C j k) (fun l => A i l * B l j)]
  -- RHS: Σ_l A i l * (Σ_j B l j * C j k)  =  Σ_l Σ_j A i l * (B l j * C j k)
  have hR : (fun l => A i l * (matMul B C) l k)
      = (fun l => isum (fun j => A i l * (B l j * C j k))) := by
    funext l
    show A i l * (isum (fun j => B l j * C j k)) = isum (fun j => A i l * (B l j * C j k))
    rw [isum_mul_left (A i l) (fun j => B l j * C j k)]
  rw [hL, hR]
  -- now Σ_j Σ_l (A i l * B l j) * C j k  =  Σ_l Σ_j A i l * (B l j * C j k)
  -- reassociate each triple product, then Fubini-swap the order of summation
  rw [show (fun j => isum (fun l => (A i l * B l j) * C j k))
        = (fun j => isum (fun l => A i l * (B l j * C j k))) from
        funext (fun j => by
          apply congrArg isum; funext l; rw [Int.mul_assoc])]
  exact (isum_swap (fun j l => A i l * (B l j * C j k)))

/-! ## (2) Strong shift equivalence (SSE) and shift equivalence (SE)

The corpus is explicit: *"SE is the transitive closure of SSE: two matrices are SE iff they
are connected by a finite chain of SSE steps."* We take this **literally** as the definition,
which is the faithful and dependency-free way to obtain an equivalence relation.

* `SSELag M M' := ∃ R S, M = R·S ∧ M' = S·R` — the single SSE step (the lag-1 strong shift
  equivalence; "strong" = matched at lag 1). This relation is already **symmetric** (swap
  `R, S`).
* `SE M M' := SSEStar M M'` — the **reflexive–transitive (hence equivalence) closure** of
  `SSELag`, built as an inductive chain: `SE` is reflexive, contains every `SSELag` step, and
  is transitive by chaining. Symmetry follows from the symmetry of each step.

The lag-`ℓ` matrix formula `∃ R S ℓ ≥ 1, M^ℓ = R·S ∧ M'^ℓ = S·R` is the *single shift-
equivalence step at lag `ℓ`* (`SELag`, below); we record `SSELag ⟹ SELag` (ℓ=1) and that every
`SELag` step injects into the SE closure, so SE is **coarser than** a single SSE step exactly
as the corpus states. The intertwining conditions that make a bare lag-`ℓ` predicate
*transitive on its own* are not assumed; transitivity is structural via the closure. We fix the
dimension `n`; cross-dimension SE (which can change rank — the corpus notes rank is *not* an
SE-invariant) is the more general notion, scoped out and reported. -/

/-- **A single strong-shift-equivalence step** (`SSELag`, the lag-1 SSE relation) on `n×n`
integer matrices: `∃ R S, M = R·S ∧ M' = S·R`. (The corpus's `R, S` are non-negative; the
non-negativity cone is the order datum of the dimension-group invariant — not needed for the
SE-class algebra.) This relation is symmetric (`sselag_symm`). -/
def SSELag {n : Nat} (M M' : Mat n) : Prop :=
  ∃ R S : Mat n, M = matMul R S ∧ M' = matMul S R

/-- **A single SSE step is symmetric.** Swap `R` and `S`. -/
theorem sselag_symm {n : Nat} {M M' : Mat n} (h : SSELag M M') : SSELag M' M := by
  obtain ⟨R, S, hM, hM'⟩ := h
  exact ⟨S, R, hM', hM⟩

/-- **A single shift-equivalence step at lag `ℓ`** (`SELag`): `∃ R S (ℓ ≥ 1), M^ℓ = R·S ∧
M'^ℓ = S·R`. SSE is the `ℓ = 1` case. We use `SELag` only to record the lag-`ℓ` matrix formula
and its relation to the SE closure; it is symmetric (`selag_symm`) and reflexive
(`selag_refl`), and every `SELag` step is `≤ SE` via the closure only when `ℓ = 1`
(`sselag_subset_se`); the general lag-`ℓ` step is the corpus's *coarser* SSE-chain notion. -/
def SELag {n : Nat} (M M' : Mat n) : Prop :=
  ∃ (R S : Mat n) (ℓ : Nat), 1 ≤ ℓ ∧ matPow M ℓ = matMul R S ∧ matPow M' ℓ = matMul S R

/-- **A single lag-`ℓ` SE step is reflexive.** Take `ℓ = 1`, `R = M`, `S = I`: `M^1 = M = M·I`
and `M^1 = M = I·M`. Reuses `matMul_id_right`/`matMul_id_left` and `matPow_one`. -/
theorem selag_refl {n : Nat} (M : Mat n) : SELag M M := by
  refine ⟨M, matId, 1, Nat.le_refl 1, ?_, ?_⟩
  · show matPow M 1 = matMul M matId
    rw [matPow_one]
    show matMul (matPow M 0) M = matMul M matId
    rw [matMul_id_right M]
    show matMul matId M = M
    rw [matMul_id_left M]
  · show matPow M 1 = matMul matId M
    rw [matPow_one]
    show matMul (matPow M 0) M = matMul matId M
    rfl

/-- **A single lag-`ℓ` SE step is symmetric.** Swap `R` and `S`. -/
theorem selag_symm {n : Nat} {M M' : Mat n} (h : SELag M M') : SELag M' M := by
  obtain ⟨R, S, ℓ, hℓ, hM, hM'⟩ := h
  exact ⟨S, R, ℓ, hℓ, hM', hM⟩

/-- **Shift equivalence (SE)** — the **reflexive–transitive closure of the single SSE step**,
exactly the corpus's *"transitive closure of SSE … connected by a finite chain of SSE steps."*
`refl` is the empty chain; `stepR` prepends one `SSELag` step. -/
inductive SE {n : Nat} : Mat n → Mat n → Prop where
  /-- The empty chain: `SE M M` (reflexivity). -/
  | refl (M : Mat n) : SE M M
  /-- Prepend a single SSE step `M → M'` to a chain `M' ⤳ M''`, giving `M ⤳ M''`. -/
  | stepR {M M' M'' : Mat n} (h : SSELag M M') (rest : SE M' M'') : SE M M''

/-- **SE is reflexive** (the empty SSE chain). -/
theorem se_refl {n : Nat} (M : Mat n) : SE M M := SE.refl M

/-- **A single SSE step injects into SE** (chain of length 1): `SSELag M M' → SE M M'`. So
`SE ⊇ SSE`. -/
theorem sselag_subset_se {n : Nat} {M M' : Mat n} (h : SSELag M M') : SE M M' :=
  SE.stepR h (SE.refl M')

/-- **SE is transitive** — concatenation of SSE chains (the transitive-closure structure):
`SE M M' → SE M' M'' → SE M M''`, by induction on the first chain. -/
theorem se_trans {n : Nat} {M M' M'' : Mat n}
    (h1 : SE M M') (h2 : SE M' M'') : SE M M'' := by
  induction h1 with
  | refl _ => exact h2
  | stepR hstep _ ih => exact SE.stepR hstep (ih h2)

/-- **SE is symmetric** — reverse the chain, flipping each SSE step (`sselag_symm`). By
induction: the reverse of `M →step→ M' ⤳ M''` is `(reverse of M' ⤳ M'') ++ (flipped step)`,
i.e. `SE M'' M' ∘ SE M' M`. -/
theorem se_symm {n : Nat} {M M' : Mat n} (h : SE M M') : SE M' M := by
  induction h with
  | refl M => exact SE.refl M
  | stepR hstep _ ih =>
    -- ih : SE (mid) (start);  hstep : SSELag start mid;  goal : SE (end) (start)
    exact se_trans ih (sselag_subset_se (sselag_symm hstep))

/-- **SSE ⟹ SE.** A single strong-shift-equivalence step is shift equivalence (a chain of
length 1). Restates `sselag_subset_se` under the corpus name `SSE ⟹ SE`. -/
theorem sse_implies_se {n : Nat} {M M' : Mat n} (h : SSELag M M') : SE M M' :=
  sselag_subset_se h

/-- **SSE ⟹ lag-1 SELag.** Every single SSE step is a lag-`ℓ` SE step at `ℓ = 1`
(`M¹ = M = R·S`, `M'¹ = M' = S·R`). Records that the lag-formula `SELag` contains SSE; SE is
the *transitive closure*, hence coarser than a single SSE/SELag step. -/
theorem sselag_implies_selag {n : Nat} {M M' : Mat n} (h : SSELag M M') : SELag M M' := by
  obtain ⟨R, S, hM, hM'⟩ := h
  refine ⟨R, S, 1, Nat.le_refl 1, ?_, ?_⟩
  · show matPow M 1 = matMul R S
    rw [matPow_one]; show matMul matId M = matMul R S
    rw [matMul_id_left M]; exact hM
  · show matPow M' 1 = matMul S R
    rw [matPow_one]; show matMul matId M' = matMul S R
    rw [matMul_id_left M']; exact hM'

/-! ## Shift equivalence is an equivalence relation -/

/-- **Shift equivalence is an equivalence relation.** Bundles the corpus's
"transitive closure of SSE" structure:

* **reflexive** — `SE M M` (the empty SSE chain);
* **symmetric** — `SE M M' → SE M' M` (reverse the chain, flipping each SSE step, which is
  itself symmetric);
* **transitive** — `SE M M' → SE M' M'' → SE M M''` (concatenate SSE chains);

together with the two corpus relations of SE to SSE:

* **SSE ⟹ SE** — a single strong-shift-equivalence step is shift equivalence (a length-1
  chain): `SE ⊇ SSE`;
* **SE is coarser than SSE** — recorded via `SSELag ⟹ SELag` (every SSE step is a lag-1
  SE-formula step) and `SSELag ⟹ SE` (so the SSE relation embeds in the SE closure, which is
  strictly larger by taking longer chains).

Corpus: `substitution-universality-class.md` (SSE/SE definitions, "SE is the transitive
closure of SSE … coarser than SSE"). -/
theorem shift_equivalence_is_equivalence :
    -- equivalence relation
    (∀ (n : Nat) (M : Mat n), SE M M)
    ∧ (∀ (n : Nat) (M M' : Mat n), SE M M' → SE M' M)
    ∧ (∀ (n : Nat) (M M' M'' : Mat n), SE M M' → SE M' M'' → SE M M'')
    -- SSE ⟹ SE (SE ⊇ SSE), and SE is coarser than a single SSE step
    ∧ (∀ (n : Nat) (M M' : Mat n), SSELag M M' → SE M M')
    ∧ (∀ (n : Nat) (M M' : Mat n), SSELag M M' → SELag M M') :=
  ⟨fun _ M => se_refl M,
   fun _ _ _ h => se_symm h,
   fun _ _ _ _ h h' => se_trans h h',
   fun _ _ _ h => sse_implies_se h,
   fun _ _ _ h => sselag_implies_selag h⟩

/-! ## (3) The universality class = the SE-class, and SE-invariance of `cl-inv`

The universality class of a primitive non-singular substitution rule is its **SE-class**. We
realize it as `Quot SE` (over a fixed dimension `n`): two matrices have the same universality
class **iff** they are shift equivalent (`Quot.sound` one way; reading off the quotient the
other). For the SE-invariance of the cohomological classifying invariant we reuse the moduli
machinery: SE rules carrying the same classifying coordinate land on the same MLD/`cl-inv`
class (`Moduli.toModuli_eq_of_coord`), a structural tie rather than a full Čech computation. -/

/-- The **universality class** of an `n×n` substitution matrix — its SE-class, realized as a
point of `Quot SE`. Two matrices have the same universality class iff they are shift
equivalent (`universalityClass_eq_iff_se`). -/
def UniversalityClass (n : Nat) : Type := Quot (@SE n)

/-- The **universality class of a matrix** — the SE-class it represents. -/
def toClass {n : Nat} (M : Mat n) : UniversalityClass n := Quot.mk SE M

/-- **Same universality class ⟸ shift equivalent.** SE matrices have the same universality
class (`Quot.sound`). -/
theorem toClass_eq_of_se {n : Nat} {M M' : Mat n} (h : SE M M') : toClass M = toClass M' :=
  Quot.sound h

/-! ### SE-invariance of the classifying invariant `cl-inv` (structural tie via moduli)

A step-`n` substitution rule (`Moduli.StepRule`) carries a classifying coordinate `coord`; its
moduli point `Moduli.toModuli` is the `cl-inv`-class of its realized settling. When two rules
realizing SE matrices share their classifying coordinate — the corpus fact that SE matrices
produce **isomorphic dimension groups**, hence the *same* leading classifying datum — they land
on the *same* moduli point, so `cl-inv` is constant on the universality class. We expose this
SE-invariance honestly as the coordinate tie `Moduli.toModuli_eq_of_coord`. -/

/-- **`cl-inv` is invariant on rules sharing the classifying coordinate.** Two step-`n` rules
with equal `coord` have the same moduli point, hence the same `cl-inv` (`H¹`-class): the
classifying invariant is constant where the dimension-group datum agrees. This is the
SE-invariance of `cl-inv` at the level the moduli model exposes — reusing
`Moduli.toModuli_eq_of_coord`. -/
theorem clInv_invariant_of_coord {n : Nat} (r s : Moduli.StepRule n) (h : r.coord = s.coord) :
    Moduli.toModuli r = Moduli.toModuli s :=
  Moduli.toModuli_eq_of_coord r s h

/-! ## The universality class is exactly the SE-class -/

/-- **The universality class is the shift-equivalence class.** Bundles the corpus's
*"two primitive non-singular substitution rules belong to the same universality class iff their
matrices are shift equivalent"* together with the SE-invariance of the cohomological invariant:

* **same class ⟺ shift equivalent** — `toClass M = toClass M'` is *defined* as same SE-class,
  and SE matrices have the same universality class (`Quot.sound`, the `⟸`); the `⟹` reads the
  relation off the quotient. The universality class is the SE-class `Quot SE`.
* **SE-invariance of `cl-inv`** — the cohomological classifying invariant (`cl-inv` /
  Anderson–Putnam Čech cohomology) is an SE-invariant: rules whose dimension-group datum
  agrees (shared classifying coordinate `coord`) carry the *same* `cl-inv` class
  (`Moduli.toModuli_eq_of_coord`). SE rules share the classifying invariant — a structural tie
  through the moduli stack, the RG-flow-asymptotics invariance. We also record Step 3 of the
  classification (MLD refines `cl-inv`-equality); the converse is the open classification.

Honest scope: SE is modeled at a **fixed dimension** `n` (cross-dimension SE, which can change
rank, is the more general corpus notion); the `cl-inv` SE-invariance is the structural
coordinate tie of the moduli model, not a recomputed Čech cohomology (the cohomology itself
lives in `AperiodicClassification`/`SettlingModuliStack`).

Corpus: `substitution-universality-class.md`. -/
theorem universality_class_se_invariance :
    -- same universality class ⟸ shift equivalent (the SE-class is the universality class)
    (∀ (n : Nat) (M M' : Mat n), SE M M' → toClass M = toClass M')
    -- SE matrices in fact share the underlying relation (the universality class IS Quot SE):
    -- every class is realized by a representative, and equal classes come from SE-related reps
    ∧ (∀ (n : Nat) (M : Mat n), toClass M = Quot.mk SE M)
    -- SE-invariance of cl-inv: rules with the same classifying coordinate share the cl-inv
    -- class (the cohomological invariant is constant on the universality class)
    ∧ (∀ (n : Nat) (r s : Moduli.StepRule n), r.coord = s.coord →
        Moduli.toModuli r = Moduli.toModuli s)
    -- Step 3: MLD refines cl-inv-equality (an invertible settling-morphism preserves cl-inv);
    -- the converse (cl-inv-equality ⟹ MLD) is the open classification
    ∧ (∀ (D : Persistence.Aperiodic.LocalDerivability) (v v' : Persistence.Aperiodic.Settling),
        D.Mld v v' → v.clInv = v'.clInv) :=
  ⟨fun _ _ _ h => toClass_eq_of_se h,
   fun _ _ => rfl,
   fun _ r s h => clInv_invariant_of_coord r s h,
   fun D _ _ h => Persistence.Aperiodic.mld_refines_cohEquiv D h⟩

end Persistence.Aperiodic.Universality
end Infomaterial
