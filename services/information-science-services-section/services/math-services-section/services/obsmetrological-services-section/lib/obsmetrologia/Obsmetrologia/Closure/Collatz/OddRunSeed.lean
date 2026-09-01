import Obsmetrologia.Closure.Collatz.AffineTrace

/-!
# Collatz odd-run seeds

The seed `2^a - 1` realizes exactly `a` consecutive odd steps: its accelerated
orbit is `orbit (2^a - 1) a = 3^a - 1`, and its parity word over those `a` steps
is the bare run `O^a`. Since `3^a` is always odd, `3^a - 1` is always even, so
the step immediately following the run is unconditionally `E` — for *every*
`a`, not just barrier-crossing ones.

This is the foundational seed fact any construction of a canonical
(front-loaded `O^a E^b`) parent-barrier cylinder must start from. It is **not**
by itself the seed of a general canonical-barrier first-passage cylinder: for
`a ≥ 3` the run of trailing `E`s after `3^a - 1` (its 2-adic valuation) need
not reach the `b` prescribed by the barrier's crossing length, so `2^a - 1` is
only the correct cylinder seed when `a` happens to make the residue trivial
(`a = 1, 2`). The general seed needs the residue `σ` with `3^a·σ ≡ 2^a
(mod 2^{b+1})`, built the same way `ResidueGap` builds its residues from
`bezout`/`mod_inverse_exists` — that construction is the natural next step,
not attempted here.

## Main results

* `canonicalSeed_orbit` — `orbit (2^a - 1) a = 3^a - 1`.
* `canonicalSeed_parityWord` — the parity word of `2^a - 1` over `a` steps is `O^a`.
* `canonicalSeed_next_branch_eq_E` — the step right after the run is always `E`.

## Tags

collatz, odd run, parent barrier, canonical seed
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## The halving/tripling step on `2X - 1` -/

/-- Stepping an odd number of the form `2X - 1` triples and re-halves it. -/
theorem step_two_mul_sub_one {X : Nat} (hX : 0 < X) : step (2 * X - 1) = 3 * X - 1 := by
  have hn_odd : (2 * X - 1) % 2 ≠ 0 := by omega
  have hstep := step_odd_eq hn_odd
  omega

/-- A number of the form `2X - 1` (with `X` positive) is odd. -/
theorem branch_two_mul_sub_one {X : Nat} (hX : 0 < X) : branch (2 * X - 1) = Branch.O := by
  exact branch_odd (by omega)

/-! ## The general odd-run family `3^i · 2^c - 1` -/

/-- Running `c` odd steps from `3^i · 2^c - 1` lands on `3^(i+c) - 1`: each step
strips one factor of `2` and multiplies the surviving `3^i` by another `3`. -/
theorem orbit_three_pow_two_pow_sub_one :
    ∀ (c i : Nat), orbit (3 ^ i * 2 ^ c - 1) c = 3 ^ (i + c) - 1 := by
  intro c
  induction c with
  | zero => intro i; simp
  | succ c ih =>
    intro i
    have hposX : 0 < (3:Nat) ^ i * 2 ^ c :=
      Nat.mul_pos (Nat.pow_pos (by omega)) (Nat.pow_pos (by omega))
    have hval : (3:Nat) ^ i * 2 ^ (c + 1) = 2 * (3 ^ i * 2 ^ c) := by
      rw [Nat.pow_succ, ← Nat.mul_assoc, Nat.mul_comm (3 ^ i * 2 ^ c) 2]
    have hpow31 : (3:Nat) ^ (i + 1) * 2 ^ c = 3 * (3 ^ i * 2 ^ c) := by
      rw [Nat.pow_succ, Nat.mul_comm (3 ^ i) 3, Nat.mul_assoc]
    rw [hval, orbit_step, step_two_mul_sub_one hposX, ← hpow31, ih (i + 1)]
    congr 2
    omega

/-- The parity word of `3^i · 2^c - 1` over `c` steps is the bare odd run `O^c`:
every one of those `c` steps is odd. -/
theorem parityWord_three_pow_two_pow_sub_one :
    ∀ (c i : Nat), parityWord (3 ^ i * 2 ^ c - 1) c = List.replicate c Branch.O := by
  intro c
  induction c with
  | zero => intro i; rfl
  | succ c ih =>
    intro i
    have hposX : 0 < (3:Nat) ^ i * 2 ^ c :=
      Nat.mul_pos (Nat.pow_pos (by omega)) (Nat.pow_pos (by omega))
    have hval : (3:Nat) ^ i * 2 ^ (c + 1) = 2 * (3 ^ i * 2 ^ c) := by
      rw [Nat.pow_succ, ← Nat.mul_assoc, Nat.mul_comm (3 ^ i * 2 ^ c) 2]
    have hpow31 : (3:Nat) ^ (i + 1) * 2 ^ c = 3 * (3 ^ i * 2 ^ c) := by
      rw [Nat.pow_succ, Nat.mul_comm (3 ^ i) 3, Nat.mul_assoc]
    rw [hval, parityWord_succ, branch_two_mul_sub_one hposX, step_two_mul_sub_one hposX,
      ← hpow31, ih (i + 1), List.replicate_succ]

/-! ## The canonical odd-run seed `2^a - 1` -/

/-- The all-odd-run seed `2^a - 1` realizes `a` odd steps, landing on `3^a - 1`. -/
theorem canonicalSeed_orbit (a : Nat) : orbit (2 ^ a - 1) a = 3 ^ a - 1 := by
  have h := orbit_three_pow_two_pow_sub_one a 0
  simpa using h

/-- The parity word of `2^a - 1` over its first `a` steps is the bare run `O^a`. -/
theorem canonicalSeed_parityWord (a : Nat) :
    parityWord (2 ^ a - 1) a = List.replicate a Branch.O := by
  have h := parityWord_three_pow_two_pow_sub_one a 0
  simpa using h

/-- After its `a`-step odd run, `2^a - 1` always lands on an even number: the
next branch is unconditionally `E`, for every `a`. -/
theorem canonicalSeed_next_branch_eq_E (a : Nat) :
    branch (orbit (2 ^ a - 1) a) = Branch.E := by
  rw [canonicalSeed_orbit]
  apply branch_even
  have h3 : (3:Nat) ^ a % 2 = 1 := by
    induction a with
    | zero => rfl
    | succ n ih => rw [Nat.pow_succ]; omega
  omega

end Collatz
end Closure
end Obsmetrologia
