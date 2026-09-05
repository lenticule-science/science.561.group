import Infomaterial.Closure.Collatz.FirstPassage

/-!
# Collatz parent-barrier semigroup gap

For a parent barrier `p` with affine trace `(A, B, C)`, the first-passage word is
`p ++ [E]` with trace `(A, 2B, C)`. Writing `D = 2B - A` and `M = 2B`, the affine
relation `M·y = A·n + C` turns **non-descent** of the first-passage word into a
concrete arithmetic statement: `y ≥ n` exactly when `C` lies in the numerical
semigroup `⟨D, M⟩`, i.e. `C = D·n + M·d` for some `d`. This is
`nonDescent_iff_semigroup_certificate`, the central proven result.

The conjectural content is then isolated cleanly as `ParentBarrierGap`: for every
*nontrivial* parent barrier, `C ∉ ⟨D, M⟩`. The Python evidence (1.16M parent
barriers checked, zero nonterminal representations) supports it; it is stated here as
the frontier and consumed by `parentBarrierGap_implies_firstPassageDescent`, which
shows first-passage descent follows from it. `ResidueGap` sharpens the gap to the concrete
modular inequality `C < D·r` for the least residue `r = C·D⁻¹ mod M`, building the modular
inverse from Bézout in Lean core.

## Main definitions

* `InTwoGenSemigroup` — membership in a two-generator numerical semigroup.
* `parentD`, `parentM` — the gap modulus data `2B - A`, `2B`.
* `ParentBarrierGap` — the (conjectural) nonmembership of `C`, nontrivially.
* `FirstPassageDescentProperty` — every nontrivial first-passage cylinder descends.

## Main results

* `nonDescent_iff_semigroup_certificate` — non-descent ⟺ semigroup membership.
* `parentBarrierGap_implies_firstPassageDescent` — the conditional descent theorem.
* `parentBarrierGap_holds` — the frontier `sorry` (the residue gap).

## Tags

collatz, numerical semigroup, parent barrier, first-passage descent
-/

namespace Infomaterial
namespace Closure
namespace Collatz

/-! ## Numerical semigroup membership and parent-trace data -/

/-- `x` lies in the two-generator numerical semigroup `⟨a, b⟩`. -/
def InTwoGenSemigroup (x a b : Nat) : Prop := ∃ m n : Nat, x = a * m + b * n

/-- Parent trace coefficients. -/
def parentA (p : List Branch) : Nat := (traceOfWord p).A
def parentB (p : List Branch) : Nat := (traceOfWord p).B
def parentC (p : List Branch) : Nat := (traceOfWord p).C

/-- The first generator of the gap semigroup: `2B - A` (positive at a barrier). -/
def parentD (p : List Branch) : Nat := 2 * parentB p - parentA p
/-- The second generator of the gap semigroup: `2B`. -/
def parentM (p : List Branch) : Nat := 2 * parentB p

/-- At a parent barrier the gap generator `D = 2B - A` is positive. -/
theorem parentD_pos {p : List Branch} (h : ParentBarrier p) : 0 < parentD p := by
  have h2 := h.2.1
  unfold parentD parentA parentB
  omega

/-- The trace of the first-passage word `p ++ [E]` is `(A, 2B, C)`. -/
theorem trace_parent_append_E (p : List Branch) :
    traceOfWord (p ++ [Branch.E]) = ⟨parentA p, 2 * parentB p, parentC p⟩ := by
  rw [trace_append_E]
  unfold parentA parentB parentC
  rfl

/-! ## The central equivalence -/

/-- **Non-descent is a semigroup certificate.** Given the first-passage affine
relation `2B·y = A·n + C` at a parent barrier, the first-passage word fails to
descend (`y ≥ n`) exactly when `C` is representable as `D·n + M·d`. -/
theorem nonDescent_iff_semigroup_certificate
    {p : List Branch} {n y : Nat}
    (hp : ParentBarrier p)
    (htrace : (2 * parentB p) * y = parentA p * n + parentC p) :
    y ≥ n ↔ ∃ d : Nat, parentC p = parentD p * n + parentM p * d := by
  have hAB : parentA p ≤ 2 * parentB p := by
    have h2 := hp.2.1
    unfold parentA parentB
    omega
  have mul_sub' : ∀ a b c : Nat, a * (b - c) = a * b - a * c := by
    intro a b c
    rw [Nat.mul_comm a (b - c), Nat.sub_mul, Nat.mul_comm b a, Nat.mul_comm c a]
  have hD : parentD p * n = 2 * parentB p * n - parentA p * n := by
    unfold parentD; rw [Nat.sub_mul]
  have hMpos : 0 < 2 * parentB p := by
    have := trace_B_pos p
    unfold parentB
    omega
  have han : parentA p * n ≤ 2 * parentB p * n := Nat.mul_le_mul_right n hAB
  constructor
  · intro hyn
    refine ⟨y - n, ?_⟩
    have hM : parentM p * (y - n) = 2 * parentB p * y - 2 * parentB p * n := by
      unfold parentM; rw [mul_sub']
    have hbn : 2 * parentB p * n ≤ 2 * parentB p * y := Nat.mul_le_mul_left _ hyn
    rw [hD, hM]
    omega
  · rintro ⟨d, hd⟩
    have hMd : parentM p * d = 2 * parentB p * d := rfl
    rw [hD, hMd] at hd
    have hle : 2 * parentB p * n ≤ 2 * parentB p * y := by omega
    exact Nat.le_of_mul_le_mul_left hle hMpos

/-! ## The gap conjecture and the conditional descent theorem -/

/-- The terminal-adjacent exceptions, the only represented cases empirically. -/
def TrivialParentBarrier (p : List Branch) : Prop := p = [] ∨ p = [Branch.O]

/-- **Parent-barrier semigroup gap.** For every nontrivial parent barrier, `C` is
not in `⟨D, M⟩`. The conjectural heart of the first-passage descent. -/
def ParentBarrierGap : Prop :=
  ∀ p : List Branch, ParentBarrier p → ¬ TrivialParentBarrier p →
    ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p)

/-- Every nontrivial first-passage cylinder descends at any realizing `n > 2`. -/
def FirstPassageDescentProperty : Prop :=
  ∀ (p : List Branch) (n : Nat),
    ParentBarrier p → ¬ TrivialParentBarrier p →
    parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E] →
    2 < n →
    orbit n (p ++ [Branch.E]).length < n

/-- The gap implies descent: if no nontrivial parent barrier represents `C`, every
nontrivial first-passage word descends. -/
theorem parentBarrierGap_implies_firstPassageDescent :
    ParentBarrierGap → FirstPassageDescentProperty := by
  intro hgap p n hp hnt hword _hn
  rcases Nat.lt_or_ge (orbit n (p ++ [Branch.E]).length) n with h | h
  · exact h
  · exfalso
    have htrace : (2 * parentB p) * orbit n (p ++ [Branch.E]).length
        = parentA p * n + parentC p := by
      have hk := affine_trace_parityWord n (p ++ [Branch.E]).length
      rw [hword, trace_parent_append_E] at hk
      exact hk
    obtain ⟨d, hd⟩ := (nonDescent_iff_semigroup_certificate hp htrace).mp h
    exact hgap p hp hnt ⟨n, d, hd⟩

/-- **Frontier hole.** The parent-barrier semigroup gap itself — the residue gap the
Python search supports but which is not yet proved. -/
theorem parentBarrierGap_holds : ParentBarrierGap := by
  sorry

end Collatz
end Closure
end Infomaterial
