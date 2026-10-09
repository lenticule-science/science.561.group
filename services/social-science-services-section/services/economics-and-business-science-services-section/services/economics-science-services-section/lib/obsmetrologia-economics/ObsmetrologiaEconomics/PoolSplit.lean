/-!
# PoolSplit — exact pro-rata splitting and balance conservation for a pooling ledger

A pooling protocol turns a cycle's yield `T` into buckets by integer weights `ws`
(the house's 20/30/50 is `[2, 3, 5]`; basis points are `[2000, 3000, 5000]`), and
moves balances between accounts. On a ledger of `Nat` balances the two facts a
contract must keep are:

* **Split exhaustiveness.** Every bucket is the floor of its exact pro-rata share, and the
  division dust (the total less the sum of the floors) goes to the first bucket, so the
  buckets sum to `T` exactly (`split_sum`). The dust is below the number of buckets
  (`dust_lt_length`) and each non-first bucket is within one unit of exact pro-rata
  (`share_floor_spec`). A zero total weight gives every unit of `T` to the first bucket,
  by `n / 0 = 0` here; a contract that divides must special-case it.
* **Balance conservation.** A transfer of `x` from account `i` to account `j`, with the
  debit within the balance, leaves the sum of all balances unchanged (`transfer_conserves`).
  A cycle settlement leaves the principal unchanged and distributes the yield exactly
  (`cycle_conserves`).

Everything is over `Nat` (unbounded). A fixed-width realization (`uint256`) agrees with these
declarations on every input where `T * w` does not overflow; with a full-precision
multiply-divide it agrees on all inputs. The remainder rule (dust to the first bucket) is
a choice of this module; the largest-remainder rule is a different function and is not
specified here.
-/

namespace Obsmetrologia
namespace Economics
namespace PoolSplit

/-- The sum of a list of weights or balances. -/
def wsum : List Nat → Nat
  | [] => 0
  | a :: l => a + wsum l

@[simp] theorem wsum_nil : wsum [] = 0 := rfl
@[simp] theorem wsum_cons (a : Nat) (l : List Nat) : wsum (a :: l) = a + wsum l := rfl

/-! ## The split -/

/-- The floor of each bucket's exact pro-rata share of `T` under weights `ws`. -/
def shares (T : Nat) (ws : List Nat) : List Nat :=
  ws.map (fun w => T * w / wsum ws)

/-- The division dust: what the floors leave of `T`. -/
def dust (T : Nat) (ws : List Nat) : Nat := T - wsum (shares T ws)

/-- **The split.** Each bucket is its floor share; the dust goes to the first bucket. -/
def split (T : Nat) (ws : List Nat) : List Nat :=
  match shares T ws with
  | [] => []
  | s :: rest => (s + dust T ws) :: rest

theorem shares_length (T : Nat) (ws : List Nat) : (shares T ws).length = ws.length := by
  simp [shares]

theorem split_length (T : Nat) (ws : List Nat) : (split T ws).length = ws.length := by
  unfold split
  have h := shares_length T ws
  cases hs : shares T ws with
  | nil => rw [hs] at h; simp at h; simp [h]
  | cons s rest => rw [hs] at h; simp at h ⊢; omega

/-- The floors times the divisor never exceed the sum they floor. -/
theorem wsum_div_mul_le (W : Nat) : ∀ l : List Nat, wsum (l.map (· / W)) * W ≤ wsum l
  | [] => by simp
  | a :: l => by
    have ih := wsum_div_mul_le W l
    have h := Nat.div_mul_le_self a W
    simp only [List.map_cons, wsum_cons, Nat.add_mul]
    omega

/-- Each floor loses less than one divisor: the length of the list pays for the loss. -/
theorem wsum_loss (W : Nat) (hW : 0 < W) : ∀ l : List Nat,
    wsum l + l.length ≤ wsum (l.map (· / W)) * W + l.length * W
  | [] => by simp
  | a :: l => by
    have ih := wsum_loss W hW l
    have h1 := Nat.div_add_mod a W
    have h2 := Nat.mod_lt a hW
    rw [Nat.mul_comm W (a / W)] at h1
    simp only [List.map_cons, wsum_cons, Nat.add_mul, List.length_cons, Nat.succ_mul]
    omega

theorem wsum_map_mul (T : Nat) : ∀ ws : List Nat, wsum (ws.map (fun w => T * w)) = T * wsum ws
  | [] => by simp
  | a :: l => by
    simp only [List.map_cons, wsum_cons, Nat.mul_add]
    rw [wsum_map_mul T l]

theorem wsum_map_zero (f : Nat → Nat) (h : ∀ a, f a = 0) : ∀ l : List Nat, wsum (l.map f) = 0
  | [] => rfl
  | a :: l => by simp only [List.map_cons, wsum_cons, h a, wsum_map_zero f h l]

/-- The map `(T * ·) / W` composed as the list map of `shares`. -/
theorem shares_eq_map_div (T : Nat) (ws : List Nat) :
    shares T ws = (ws.map (fun w => T * w)).map (· / wsum ws) := by
  simp [shares, List.map_map, Function.comp_def]

/-- **The floors never exceed the total.** -/
theorem sum_shares_le (T : Nat) (ws : List Nat) : wsum (shares T ws) ≤ T := by
  by_cases hW : wsum ws = 0
  · have : wsum (shares T ws) = 0 := by
      unfold shares
      exact wsum_map_zero _ (fun a => by rw [hW, Nat.div_zero]) ws
    omega
  · have hpos : 0 < wsum ws := Nat.pos_of_ne_zero hW
    have h := wsum_div_mul_le (wsum ws) (ws.map (fun w => T * w))
    rw [wsum_map_mul, ← shares_eq_map_div] at h
    exact Nat.le_of_mul_le_mul_right h hpos

/-- **The buckets sum to the total, exactly.** -/
theorem split_sum (T : Nat) (ws : List Nat) (hne : ws ≠ []) : wsum (split T ws) = T := by
  have hle := sum_shares_le T ws
  cases ws with
  | nil => exact absurd rfl hne
  | cons w ws =>
    unfold split
    unfold shares at *
    simp only [List.map_cons, wsum_cons] at hle ⊢
    unfold dust
    unfold shares
    simp only [List.map_cons, wsum_cons] at *
    omega

/-- **The dust is below the bucket count** (positive total weight). -/
theorem dust_lt_length (T : Nat) (ws : List Nat) (hW : 0 < wsum ws) (hne : ws ≠ []) :
    dust T ws < ws.length := by
  have hloss := wsum_loss (wsum ws) hW (ws.map (fun w => T * w))
  rw [wsum_map_mul, ← shares_eq_map_div, List.length_map] at hloss
  have hle := sum_shares_le T ws
  have hlen : 0 < ws.length := by
    cases ws with
    | nil => exact absurd rfl hne
    | cons _ _ => exact Nat.succ_pos _
  unfold dust
  have hsplit : T = wsum (shares T ws) + (T - wsum (shares T ws)) := by omega
  generalize hd : T - wsum (shares T ws) = d at hsplit
  generalize hS : wsum (shares T ws) = S at hsplit hloss hle hd
  have hmul : T * wsum ws = S * wsum ws + d * wsum ws := by
    rw [hsplit, Nat.add_mul]
  have key : d * wsum ws < ws.length * wsum ws := by omega
  by_cases h : d < ws.length
  · exact h
  · have h' : ws.length ≤ d := Nat.le_of_not_lt h
    have := Nat.mul_le_mul_right (wsum ws) h'
    omega

/-- **Each bucket's floor is the exact floor of its share.** `s * W ≤ T * w < (s + 1) * W`. -/
theorem share_floor_spec (T w W : Nat) (hW : 0 < W) :
    (T * w / W) * W ≤ T * w ∧ T * w < (T * w / W + 1) * W := by
  refine ⟨Nat.div_mul_le_self _ _, ?_⟩
  have h1 := Nat.div_add_mod (T * w) W
  have h2 := Nat.mod_lt (T * w) hW
  rw [Nat.mul_comm W (T * w / W)] at h1
  rw [Nat.add_mul, Nat.one_mul]
  omega

/-- A bucket with zero weight has a zero floor share. -/
theorem share_zero_weight (T W : Nat) : T * 0 / W = 0 := by simp

/-- **Shares are monotone in the weight.** -/
theorem share_mono (T W : Nat) {w w' : Nat} (h : w ≤ w') : T * w / W ≤ T * w' / W :=
  Nat.div_le_div_right (Nat.mul_le_mul_left T h)

/-- The split's first bucket is its floor share plus the dust; the rest are floor shares. -/
theorem split_cons (T w : Nat) (ws : List Nat) :
    split T (w :: ws)
      = (T * w / wsum (w :: ws) + dust T (w :: ws))
        :: ws.map (fun v => T * v / wsum (w :: ws)) := by
  simp [split, shares]

/-- **No bucket exceeds the total.** -/
theorem split_le (T : Nat) (ws : List Nat) (hne : ws ≠ []) : ∀ b ∈ split T ws, b ≤ T := by
  intro b hb
  have hsum := split_sum T ws hne
  have : b ≤ wsum (split T ws) := by
    generalize split T ws = l at hb ⊢
    induction l with
    | nil => simp at hb
    | cons a l ih =>
      simp only [wsum_cons]
      rcases List.mem_cons.mp hb with h | h
      · omega
      · have := ih h; omega
  omega

/-! ## The ledger -/

/-- Add `x` to the balance at index `i`. -/
def credit : Nat → Nat → List Nat → List Nat
  | _, _, [] => []
  | 0, x, a :: l => (a + x) :: l
  | k + 1, x, a :: l => a :: credit k x l

/-- Subtract `x` from the balance at index `i` (truncated; the guard is the caller's). -/
def debit : Nat → Nat → List Nat → List Nat
  | _, _, [] => []
  | 0, x, a :: l => (a - x) :: l
  | k + 1, x, a :: l => a :: debit k x l

/-- Move `x` from account `i` to account `j`. -/
def transfer (i j x : Nat) (l : List Nat) : List Nat := credit j x (debit i x l)

theorem credit_length (x : Nat) : ∀ (i : Nat) (l : List Nat), (credit i x l).length = l.length
  | _, [] => by simp [credit]
  | 0, _ :: _ => by simp [credit]
  | k + 1, _ :: l => by simp [credit, credit_length x k l]

theorem debit_length (x : Nat) : ∀ (i : Nat) (l : List Nat), (debit i x l).length = l.length
  | _, [] => by simp [debit]
  | 0, _ :: _ => by simp [debit]
  | k + 1, _ :: l => by simp [debit, debit_length x k l]

theorem credit_sum (x : Nat) : ∀ (i : Nat) (l : List Nat), i < l.length →
    wsum (credit i x l) = wsum l + x
  | _, [], h => by simp at h
  | 0, a :: l, _ => by simp [credit]; omega
  | k + 1, a :: l, h => by
    have ih := credit_sum x k l (by simpa using h)
    simp [credit]; omega

theorem debit_sum (x : Nat) : ∀ (i : Nat) (l : List Nat), i < l.length → x ≤ l.getD i 0 →
    wsum (debit i x l) + x = wsum l
  | _, [], h, _ => by simp at h
  | 0, a :: l, _, hx => by simp [debit] at hx ⊢; omega
  | k + 1, a :: l, h, hx => by
    have ih := debit_sum x k l (by simpa using h) (by simpa using hx)
    simp [debit]; omega

/-- **Transfers conserve the sum of balances.** The debit is within the balance and both
accounts exist. -/
theorem transfer_conserves (i j x : Nat) (l : List Nat) (hi : i < l.length) (hj : j < l.length)
    (hx : x ≤ l.getD i 0) : wsum (transfer i j x l) = wsum l := by
  unfold transfer
  have h1 := debit_sum x i l hi hx
  have hj' : j < (debit i x l).length := by rw [debit_length]; exact hj
  have h2 := credit_sum x j (debit i x l) hj'
  omega

/-! ## The cycle -/

/-- A cycle settlement: the principal is untouched; the yield is split into buckets. -/
def settleCycle (principal yield : Nat) (ws : List Nat) : Nat × List Nat :=
  (principal, split yield ws)

/-- **A cycle settlement conserves value.** Principal plus yield before is principal plus
the buckets after, and the principal itself is unchanged. -/
theorem cycle_conserves (principal yield : Nat) (ws : List Nat) (hne : ws ≠ []) :
    (settleCycle principal yield ws).1 = principal
    ∧ principal + yield = (settleCycle principal yield ws).1 + wsum (settleCycle principal yield ws).2 := by
  refine ⟨rfl, ?_⟩
  show principal + yield = principal + wsum (split yield ws)
  rw [split_sum yield ws hne]

/-! ## The house split, as a check -/

theorem house_split_1000 : split 1000 [2, 3, 5] = [200, 300, 500] := by decide
theorem house_split_7 : split 7 [2, 3, 5] = [2, 2, 3] := by decide
theorem zero_weight_split : split 9 [0, 0] = [9, 0] := by decide

end PoolSplit
end Economics
end Obsmetrologia
