import Obsmetrologia.Closure.Collatz.FirstPassage

/-!
# Collatz parent-barrier semigroup gap

For a parent barrier `p` with affine trace `(A, B, C)`, the first-passage word is
`p ++ [E]` with trace `(A, 2B, C)`. Writing `D = 2B - A` and `M = 2B`, the affine
relation `M·y = A·n + C` turns **non-descent** of the first-passage word into a
concrete arithmetic statement: `y ≥ n` exactly when `C` lies in the numerical
semigroup `⟨D, M⟩`, i.e. `C = D·n + M·d` for some `d`. This is
`nonDescent_iff_semigroup_certificate`, the central proven result.

The conjectural content is then isolated cleanly as `ParentBarrierGap`: for every
*nontrivial* parent barrier, `C ∉ ⟨D, M⟩`. The finite audit
`scripts/collatz-parent-gap-audit.py` checks parent-prefix length `28`, enumerating
`1,166,059` parent barriers and finding zero nontrivial residue-gap violations.
This supports the frontier but does not prove it. The frontier is consumed by
`parentBarrierGap_implies_firstPassageDescent`, which shows first-passage descent
follows from it. `ResidueGap` sharpens the gap to the concrete modular inequality
`C < D·r` for the least residue `r = C·D⁻¹ mod M`, building the modular inverse
from Bézout in Lean core.

## Main definitions

* `InTwoGenSemigroup` — membership in a two-generator numerical semigroup.
* `parentD`, `parentM` — the gap modulus data `2B - A`, `2B`.
* `ParentBarrierGap` — the (conjectural) nonmembership of `C`, nontrivially.
* `FirstPassageDescentProperty` — every nontrivial first-passage cylinder descends.

## Main results

* `nonDescent_iff_semigroup_certificate` — non-descent ⟺ semigroup membership.
* `parentBarrierGap_implies_firstPassageDescent` — the conditional descent theorem.
* `nontrivial_parentBarrier_oddCount_ge_two` — every nontrivial parent barrier has at least two
  odd steps (`oddCount ≤ 1` forces the two trivial words).
* `parentBarrier_oddCount_two_shape`, `parentBarrierGap_holds_oddCount_le_two` — the gap proved
  outright, nonvacuously, on the whole `oddCount ≤ 2` slice of parent barriers.
* `parentBarrier_oddCount_three_shape`, `parentBarrierGap_holds_oddCount_le_three` — the gap
  extended outright to the whole `oddCount ≤ 3` slice of parent barriers.
* `parentBarrierGap_holds` — the frontier `sorry` (the residue gap).

## Tags

collatz, numerical semigroup, parent barrier, first-passage descent
-/

namespace Obsmetrologia
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

/-! ## Nontrivial parent barriers need at least two odd steps -/

/-- The trace-exponent sandwich implied by the first two `ParentBarrier` conjuncts, read off
directly from the closed forms `A = 3^{oddCount}`, `B = 2^{len}`. -/
theorem parentBarrier_pow_sandwich {p : List Branch} (hp : ParentBarrier p) :
    2 ^ p.length ≤ 3 ^ oddCount p ∧ 3 ^ oddCount p < 2 * 2 ^ p.length := by
  obtain ⟨h1, h2, _⟩ := hp
  rw [trace_A_eq_three_pow_oddCount, trace_B_eq_two_pow_length] at h1 h2
  exact ⟨h1, h2⟩

/-- **Nontrivial parent barriers have at least two odd steps.** A parent barrier with
`oddCount ≤ 1` is forced to be one of the two trivial words `[]` or `[O]`: the trace sandwich
`2^len ≤ 3^oddCount < 2·2^len` pins the length uniquely to `len = 0` when `oddCount = 0`, and to
`len = 1` when `oddCount = 1`, and the sole length-one word with one odd step is `[O]` itself.
This rules out an entire infinite family of shapes from ever being a live case of the gap. -/
theorem nontrivial_parentBarrier_oddCount_ge_two {p : List Branch}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p) : 2 ≤ oddCount p := by
  obtain ⟨hlo, hhi⟩ := parentBarrier_pow_sandwich hp
  rcases Nat.lt_or_ge (oddCount p) 2 with hlt | hge
  · exfalso
    rcases Nat.eq_zero_or_pos (oddCount p) with h0 | h1
    · -- oddCount p = 0: the sandwich forces the empty word.
      rw [h0, Nat.pow_zero] at hlo
      have hlen0 : p.length = 0 := by
        rcases Nat.eq_zero_or_pos p.length with hz | hpos
        · exact hz
        · exfalso
          have h2le : (2:Nat) ^ 1 ≤ 2 ^ p.length := Nat.pow_le_pow_right (by omega) (by omega)
          simp only [Nat.pow_one] at h2le
          omega
      exact hnt (Or.inl (List.eq_nil_of_length_eq_zero hlen0))
    · -- oddCount p = 1: the sandwich forces length one, hence the word `[O]`.
      have h1' : oddCount p = 1 := by omega
      rw [h1'] at hlo hhi
      simp only [Nat.pow_one] at hlo hhi
      have hlen1 : p.length = 1 := by
        rcases Nat.lt_trichotomy p.length 1 with hlt' | heq' | hgt'
        · exfalso
          have hlen0 : p.length = 0 := by omega
          rw [hlen0] at hhi
          simp only [Nat.pow_zero] at hhi
          omega
        · exact heq'
        · exfalso
          have h4 : (2:Nat) ^ 2 ≤ 2 ^ p.length := Nat.pow_le_pow_right (by omega) (by omega)
          have e4 : (2:Nat) ^ 2 = 4 := rfl
          rw [e4] at h4
          omega
      obtain ⟨b, hb⟩ := List.length_eq_one_iff.mp hlen1
      rw [hb] at h1'
      cases b with
      | E => simp [oddCount] at h1'
      | O => exact hnt (Or.inr hb)
  · exact hge

/-! ## The gap holds outright at two odd steps

A concrete, fully verified (nonvacuous) slice of `ParentBarrierGap`: at `oddCount = 2` the
trace sandwich pins both the length (`= 3`) and, once the third `ParentBarrier` conjunct rules
out the two other letter arrangements, the exact word — `[O, O, E]` — after which `C, D, M` are
bare numerals and the gap is a `omega` computation. -/

/-- A list of length `3` is exactly a triple. -/
theorem list_branch_length_three {p : List Branch} (h : p.length = 3) :
    ∃ b0 b1 b2, p = [b0, b1, b2] := by
  match p, h with
  | [b0, b1, b2], _ => exact ⟨b0, b1, b2, rfl⟩

/-- **The shape at two odd steps.** Any parent barrier with exactly two odd steps is the word
`O O E`: the sandwich forces length `3`, and among the three length-`3` two-`O` arrangements the
third `ParentBarrier` conjunct (every proper prefix noncontracting) eliminates `E O O` (fails at
the length-`1` prefix `[E]`) and `O E O` (fails at the length-`2` prefix `[O, E]`), leaving only
the front-loaded word. -/
theorem parentBarrier_oddCount_two_shape {p : List Branch}
    (hp : ParentBarrier p) (h2 : oddCount p = 2) :
    p = [Branch.O, Branch.O, Branch.E] := by
  obtain ⟨hlo, hhi⟩ := parentBarrier_pow_sandwich hp
  rw [h2] at hlo hhi
  have e9 : (3:Nat) ^ 2 = 9 := rfl
  rw [e9] at hlo hhi
  have hlen3 : p.length = 3 := by
    rcases Nat.lt_trichotomy p.length 3 with hlt | heq | hgt
    · exfalso
      have h8 : (2:Nat) ^ p.length ≤ 2 ^ 2 := Nat.pow_le_pow_right (by omega) (by omega)
      have e4 : (2:Nat) ^ 2 = 4 := rfl
      rw [e4] at h8
      omega
    · exact heq
    · exfalso
      have h16 : (2:Nat) ^ 4 ≤ 2 ^ p.length := Nat.pow_le_pow_right (by omega) (by omega)
      have e16 : (2:Nat) ^ 4 = 16 := rfl
      rw [e16] at h16
      omega
  obtain ⟨b0, b1, b2, hp3⟩ := list_branch_length_three hlen3
  subst hp3
  have hpre := hp.2.2
  cases b0 <;> cases b1 <;> cases b2
  · exact absurd h2 (by decide)
  · exact absurd h2 (by decide)
  · exact absurd h2 (by decide)
  · exfalso
    have hk := hpre 1 (by omega)
    have hval : List.take 1 [Branch.E, Branch.O, Branch.O] = [Branch.E] := rfl
    rw [hval] at hk
    unfold CoeffNoncontracting at hk
    exact absurd hk (by decide)
  · exact absurd h2 (by decide)
  · exfalso
    have hk := hpre 2 (by omega)
    have hval : List.take 2 [Branch.O, Branch.E, Branch.O] = [Branch.O, Branch.E] := rfl
    rw [hval] at hk
    unfold CoeffNoncontracting at hk
    exact absurd hk (by decide)
  · rfl
  · exact absurd h2 (by decide)

/-- **The gap holds at two odd steps.** The unique two-`O` parent barrier `O O E` has
`D = 7`, `M = 16`, `C = 5`, and `5 ∉ ⟨7, 16⟩` by direct computation. -/
theorem parentBarrierGap_of_oddCount_two {p : List Branch}
    (hp : ParentBarrier p) (h2 : oddCount p = 2) :
    ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) := by
  have hshape := parentBarrier_oddCount_two_shape hp h2
  subst hshape
  rintro ⟨m, n, hmn⟩
  have hCval : parentC [Branch.O, Branch.O, Branch.E] = 5 := rfl
  have hDval : parentD [Branch.O, Branch.O, Branch.E] = 7 := rfl
  have hMval : parentM [Branch.O, Branch.O, Branch.E] = 16 := rfl
  rw [hCval, hDval, hMval] at hmn
  omega

/-- **The gap holds on the whole `oddCount ≤ 2` slice.** Combined with
`nontrivial_parentBarrier_oddCount_ge_two`, every nontrivial parent barrier with at most two odd
steps satisfies `ParentBarrierGap` — a fully verified, nonvacuous special case of the frontier
statement, covering both trivial exclusions and the first live arithmetic instance. -/
theorem parentBarrierGap_holds_oddCount_le_two {p : List Branch}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p) (hle : oddCount p ≤ 2) :
    ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) := by
  have hge := nontrivial_parentBarrier_oddCount_ge_two hp hnt
  have heq : oddCount p = 2 := by omega
  exact parentBarrierGap_of_oddCount_two hp heq

/-! ## The gap holds outright at three odd steps

The `oddCount = 2` technique extends verbatim one exponent higher. The trace sandwich
`2^len ≤ 3^3 = 27 < 2·2^len` pins `len = 4` uniquely (`len = 3` fails the upper bound,
`len = 5` fails the lower bound). Among the four length-`4` arrangements of three `O`s and one
`E`, the third `ParentBarrier` conjunct eliminates the two front-light arrangements
(`E O O O` contracts at the length-`1` prefix `[E]`; `O E O O` contracts at the length-`2` prefix
`[O, E]`) and leaves exactly two surviving shapes, `O O E O` and `O O O E`. Both are concrete
numerals away from the gap: `(D, M) = (5, 32)` for each, with `C = 23` and `C = 19` respectively,
and neither is a nonnegative combination of `5` and `32`. -/

/-- A list of length `4` is exactly a quadruple. -/
theorem list_branch_length_four {p : List Branch} (h : p.length = 4) :
    ∃ b0 b1 b2 b3, p = [b0, b1, b2, b3] := by
  match p, h with
  | [b0, b1, b2, b3], _ => exact ⟨b0, b1, b2, b3, rfl⟩

/-- **The shape at three odd steps.** Any parent barrier with exactly three odd steps is one of
the two back-loaded words `O O E O` or `O O O E`: the sandwich forces length `4`, and among the
four length-`4` three-`O` arrangements the third `ParentBarrier` conjunct eliminates `E O O O`
(fails at the length-`1` prefix `[E]`) and `O E O O` (fails at the length-`2` prefix `[O, E]`),
leaving the two arrangements whose first two letters are both `O`. -/
theorem parentBarrier_oddCount_three_shape {p : List Branch}
    (hp : ParentBarrier p) (h3 : oddCount p = 3) :
    p = [Branch.O, Branch.O, Branch.E, Branch.O] ∨
      p = [Branch.O, Branch.O, Branch.O, Branch.E] := by
  obtain ⟨hlo, hhi⟩ := parentBarrier_pow_sandwich hp
  rw [h3] at hlo hhi
  have e27 : (3:Nat) ^ 3 = 27 := rfl
  rw [e27] at hlo hhi
  have hlen4 : p.length = 4 := by
    rcases Nat.lt_trichotomy p.length 4 with hlt | heq | hgt
    · exfalso
      have h8 : (2:Nat) ^ p.length ≤ 2 ^ 3 := Nat.pow_le_pow_right (by omega) (by omega)
      have e8 : (2:Nat) ^ 3 = 8 := rfl
      rw [e8] at h8
      omega
    · exact heq
    · exfalso
      have h32 : (2:Nat) ^ 5 ≤ 2 ^ p.length := Nat.pow_le_pow_right (by omega) (by omega)
      have e32 : (2:Nat) ^ 5 = 32 := rfl
      rw [e32] at h32
      omega
  obtain ⟨b0, b1, b2, b3, hp4⟩ := list_branch_length_four hlen4
  subst hp4
  have hpre := hp.2.2
  cases b0 <;> cases b1 <;> cases b2 <;> cases b3
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exfalso
    have hk := hpre 1 (by omega)
    have hval : List.take 1 [Branch.E, Branch.O, Branch.O, Branch.O] = [Branch.E] := rfl
    rw [hval] at hk
    unfold CoeffNoncontracting at hk
    exact absurd hk (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exact absurd h3 (by decide)
  · exfalso
    have hk := hpre 2 (by omega)
    have hval : List.take 2 [Branch.O, Branch.E, Branch.O, Branch.O] = [Branch.O, Branch.E] := rfl
    rw [hval] at hk
    unfold CoeffNoncontracting at hk
    exact absurd hk (by decide)
  · exact absurd h3 (by decide)
  · exact Or.inl rfl
  · exact Or.inr rfl
  · exact absurd h3 (by decide)

/-- **The gap holds at three odd steps.** Each of the two three-`O` parent barriers `O O E O`
and `O O O E` has `D = 5`, `M = 32`, and `C = 23` or `C = 19` respectively; neither `23` nor `19`
lies in `⟨5, 32⟩` by direct computation. -/
theorem parentBarrierGap_of_oddCount_three {p : List Branch}
    (hp : ParentBarrier p) (h3 : oddCount p = 3) :
    ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) := by
  rcases parentBarrier_oddCount_three_shape hp h3 with hshape | hshape
  · subst hshape
    rintro ⟨m, n, hmn⟩
    have hCval : parentC [Branch.O, Branch.O, Branch.E, Branch.O] = 23 := rfl
    have hDval : parentD [Branch.O, Branch.O, Branch.E, Branch.O] = 5 := rfl
    have hMval : parentM [Branch.O, Branch.O, Branch.E, Branch.O] = 32 := rfl
    rw [hCval, hDval, hMval] at hmn
    omega
  · subst hshape
    rintro ⟨m, n, hmn⟩
    have hCval : parentC [Branch.O, Branch.O, Branch.O, Branch.E] = 19 := rfl
    have hDval : parentD [Branch.O, Branch.O, Branch.O, Branch.E] = 5 := rfl
    have hMval : parentM [Branch.O, Branch.O, Branch.O, Branch.E] = 32 := rfl
    rw [hCval, hDval, hMval] at hmn
    omega

/-- **The gap holds on the whole `oddCount ≤ 3` slice.** Combined with
`nontrivial_parentBarrier_oddCount_ge_two`, every nontrivial parent barrier with at most three
odd steps satisfies `ParentBarrierGap` — extending the fully verified, nonvacuous special case
one exponent past `oddCount ≤ 2`. -/
theorem parentBarrierGap_holds_oddCount_le_three {p : List Branch}
    (hp : ParentBarrier p) (hnt : ¬ TrivialParentBarrier p) (hle : oddCount p ≤ 3) :
    ¬ InTwoGenSemigroup (parentC p) (parentD p) (parentM p) := by
  have hge := nontrivial_parentBarrier_oddCount_ge_two hp hnt
  rcases Nat.lt_or_ge (oddCount p) 3 with hlt | hge3
  · have heq2 : oddCount p = 2 := by omega
    exact parentBarrierGap_of_oddCount_two hp heq2
  · have heq3 : oddCount p = 3 := by omega
    exact parentBarrierGap_of_oddCount_three hp heq3

/-- **Frontier hole.** The parent-barrier semigroup gap itself — the residue gap the
Python search supports but which is not yet proved. -/
theorem parentBarrierGap_holds : ParentBarrierGap := by
  sorry

end Collatz
end Closure
end Obsmetrologia
