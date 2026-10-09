/-!
# OmegaJump — a closure that is not Scott-continuous

Over a finite carrier every closure commutes with directed joins
(`Closure.Scott.finite_scott_continuous`), so a non-Scott-continuous firing needs an infinite
carrier. This module gives the smallest one: the chain `ω + 2 = {0 < 1 < 2 < … < ω < ω+1}`,
with the closure that fixes every finite stage and `ω + 1` and sends `ω` to `ω + 1`.

The closure is inflationary, monotone and idempotent. The chain of finite stages is directed,
and its least upper bound is `ω`. The closure of that bound is `ω + 1`, while every finite
stage is fixed, so the least upper bound of the closed stages is still `ω`. The closure does
not commute with the join (`jump_not_scott`). This is the corpus's non-Scott-continuous firing
ordinal, at `μ = ω`, for an actual closure.

## Main results

* `Stage`, `Stage.le`: the chain `ω + 2` and its order.
* `jump` and `jump_inflationary`, `jump_monotone`, `jump_idempotent`: a closure.
* `omega_lub`: `ω` is the least upper bound of the finite stages.
* `jump_not_scott`: the closure of that bound is not the bound of the closures.
-/

namespace Obsmetrologia.Closure.OmegaJump

/-- The chain `ω + 2`: the finite stages, then `ω`, then `ω + 1`. -/
inductive Stage where
  | fin (n : Nat)
  | omega
  | omegaSucc
  deriving DecidableEq, Repr

namespace Stage

/-- The order of `ω + 2`. -/
def le : Stage → Stage → Prop
  | fin m, fin n => m ≤ n
  | fin _, omega => True
  | fin _, omegaSucc => True
  | omega, fin _ => False
  | omega, omega => True
  | omega, omegaSucc => True
  | omegaSucc, fin _ => False
  | omegaSucc, omega => False
  | omegaSucc, omegaSucc => True

theorem le_refl : ∀ x : Stage, le x x
  | fin n => Nat.le_refl n
  | omega => trivial
  | omegaSucc => trivial

theorem le_trans {x y z : Stage} (h1 : le x y) (h2 : le y z) : le x z := by
  cases x <;> cases y <;> cases z <;>
    first | exact trivial | exact Nat.le_trans h1 h2 | exact False.elim h1 | exact False.elim h2

end Stage

open Stage

/-- `u` bounds the finite stages. -/
def UpperBound (f : Nat → Stage) (u : Stage) : Prop := ∀ n, Stage.le (f n) u

/-- `u` is the least upper bound of the stages `f`. -/
def IsLUB (f : Nat → Stage) (u : Stage) : Prop :=
  UpperBound f u ∧ ∀ v, UpperBound f v → Stage.le u v

/-- The closure: `ω ↦ ω + 1`, every other stage fixed. -/
def jump : Stage → Stage
  | fin n => fin n
  | omega => omegaSucc
  | omegaSucc => omegaSucc

theorem jump_inflationary : ∀ x, Stage.le x (jump x)
  | fin n => Nat.le_refl n
  | omega => trivial
  | omegaSucc => trivial

theorem jump_monotone : ∀ {x y : Stage}, Stage.le x y → Stage.le (jump x) (jump y)
  | fin _, fin _, h => h
  | fin _, omega, _ => trivial
  | fin _, omegaSucc, _ => trivial
  | omega, omega, _ => trivial
  | omega, omegaSucc, _ => trivial
  | omegaSucc, omegaSucc, _ => trivial
  | omega, fin _, h => False.elim h
  | omegaSucc, fin _, h => False.elim h
  | omegaSucc, omega, h => False.elim h

theorem jump_idempotent : ∀ x, jump (jump x) = jump x
  | fin _ => rfl
  | omega => rfl
  | omegaSucc => rfl

/-- **`ω` is the least upper bound of the finite stages.** No finite stage bounds them all,
since `n + 1` escapes `n`. -/
theorem omega_lub : IsLUB fin omega := by
  refine ⟨fun _ => trivial, fun v hv => ?_⟩
  match v, hv with
  | omega, _ => exact trivial
  | omegaSucc, _ => exact trivial
  | fin n, hv => exact absurd (hv (n + 1)) (Nat.not_succ_le_self n)

/-- The closure fixes every finite stage, so the closed stages are the stages. -/
theorem jump_fin (n : Nat) : jump (fin n) = fin n := rfl

/-- **The closure is not Scott-continuous.** The least upper bound of the closed finite stages
is `ω`, but the closure of their least upper bound is `ω + 1`. -/
theorem jump_not_scott :
    IsLUB (fun n => jump (fin n)) omega ∧ jump omega = omegaSucc ∧ omega ≠ omegaSucc :=
  ⟨omega_lub, rfl, fun h => Stage.noConfusion h⟩

/-- The same failure, stated as the absence of commutation: no stage is at once the closure of
the join and the join of the closures. -/
theorem jump_not_commute (u : Stage) (h : IsLUB fin u) (h' : IsLUB (fun n => jump (fin n)) (jump u)) :
    False := by
  have hu : u = omega := by
    match u, h with
    | omega, _ => rfl
    | omegaSucc, h => exact False.elim (h.2 omega (fun _ => trivial))
    | fin n, h => exact absurd (h.1 (n + 1)) (Nat.not_succ_le_self n)
  subst hu
  exact False.elim (h'.2 omega (fun _ => trivial))

end Obsmetrologia.Closure.OmegaJump
