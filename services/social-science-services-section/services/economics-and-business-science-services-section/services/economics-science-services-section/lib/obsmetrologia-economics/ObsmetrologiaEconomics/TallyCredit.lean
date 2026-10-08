/-!
# TallyCredit — the median ring, the 2x clip, the derived line and the exposure limit

A member's credit line in a pooling protocol is derived from the tally of matched draws: a ring of the
sizes of the last (at most 16) counted matched draws, the number of counted pairs in the window (at most
16), and a staleness flag. This module states what the derivation computes and what it provably keeps.

* **`median`** sorts the ring and takes the floor-average of the two middle entries (an odd ring has one
  middle, counted twice, so the formula is one formula). The empty ring has median `0`.
  `median_mem_or_between` and `median_le_max` bound it by the ring's own entries.
* **`clip size currentMedian minDraw := min size (2 * max currentMedian minDraw)`**: no entry enters the
  ring above twice the larger of the current median and the minimum draw.
* **`deriveLine count ring stale := if stale then 0 else count * median ring`**; the factor is `0` exactly
  when stale (`factor_zero_iff_stale`).
* **`limit line cap := min line cap`** and `exposure_le_limit`: an admitted draw keeps
  `amount + open ≤ limit`.

## What replaced the false claims

* *Monotonicity of the median under append is false*: the review's counterexample `[1, 100, 1000] ++ [1]`
  lowers the median from `100` to `50` (`median_append_not_monotone`, by `decide`). What is true is
  `append_ge_median_never_lowers`: appending `s ≥ median ring` never lowers the median.
* *"The median at most doubles per nine counted pairs" is false as written.* With the ring a full 16-entry
  FIFO (oldest dropped on each append) and every entry within `2 * L` of the start
  (`L := max (median ring) minDraw`), `line_growth_bounded` proves the true bound
  `median ≤ 4 * L` after nine clipped appends, and `ratchet_triple_example` shows `3 * L` is reached
  (`L = 100`, final median `300`), so `2 * L` is not a theorem. For a ring that is not yet full the bound
  fails faster (`cold_start_doubles_in_two`: a one-entry ring doubles in two appends;
  `cold_start_nine_greedy_exceeds_double`). The protocol-level rate limit therefore has to come from the
  other bounds (one counted pair per member per day, the exposure cap, the sponsor's pledge), not from a
  per-window doubling of the median.

## `uint256` realization

`median` adds two ring entries before halving. With entries below `2^255` the sum fits `uint256`; a
realizer that must accept entries up to `2^256 - 1` computes `a / 2 + b / 2 + (a % 2 + b % 2) / 2`, which is
equal to `(a + b) / 2` (checked by the vectors on `2^256 - 1`). `count * median` is at most `16 * 2^256`, so a
realizer needs entries below `2^252` for `deriveLine` to fit (`deriveLine_lt_two_pow_256`), or a checked
multiply. The sort is any stable-or-unstable sort: the median is a function of the multiset
(`median_perm`).
-/

namespace Obsmetrologia
namespace Economics
namespace TallyCredit

/-! ## Sorting (insertion sort, structural, so `decide` reduces it) -/

/-- Insert into a list sorted ascending. -/
def ins (x : Nat) : List Nat → List Nat
  | [] => [x]
  | a :: l => if x ≤ a then x :: a :: l else a :: ins x l

/-- Insertion sort, ascending. -/
def isort : List Nat → List Nat
  | [] => []
  | a :: l => ins a (isort l)

theorem ins_perm (x : Nat) (l : List Nat) : (ins x l).Perm (x :: l) := by
  induction l with
  | nil => exact List.Perm.refl _
  | cons a l ih =>
    unfold ins
    by_cases h : x ≤ a
    · simp [h]
    · simp only [h, if_false]
      exact ((ih.cons a).trans (List.Perm.swap x a l))

theorem isort_perm (l : List Nat) : (isort l).Perm l := by
  induction l with
  | nil => exact List.Perm.refl _
  | cons a l ih => exact (ins_perm a (isort l)).trans (ih.cons a)

theorem ins_sorted (x : Nat) (l : List Nat) (h : l.Pairwise (· ≤ ·)) : (ins x l).Pairwise (· ≤ ·) := by
  induction l with
  | nil => simp [ins]
  | cons a l ih =>
    unfold ins
    rw [List.pairwise_cons] at h
    by_cases hx : x ≤ a
    · simp only [hx, if_true]
      rw [List.pairwise_cons, List.pairwise_cons]
      refine ⟨?_, ?_, h.2⟩
      · intro b hb
        rcases List.mem_cons.mp hb with rfl | hb
        · exact hx
        · exact Nat.le_trans hx (h.1 b hb)
      · exact h.1
    · simp only [hx, if_false]
      rw [List.pairwise_cons]
      refine ⟨?_, ih h.2⟩
      intro b hb
      have := (ins_perm x l).mem_iff.mp hb
      rcases List.mem_cons.mp this with rfl | hb
      · omega
      · exact h.1 b hb

theorem isort_sorted (l : List Nat) : (isort l).Pairwise (· ≤ ·) := by
  induction l with
  | nil => simp [isort]
  | cons a l ih => exact ins_sorted a _ ih

theorem mem_isort {l : List Nat} {x : Nat} : x ∈ isort l ↔ x ∈ l := (isort_perm l).mem_iff

theorem isort_length (l : List Nat) : (isort l).length = l.length := (isort_perm l).length_eq

/-! ## The median -/

/-- The median of a sorted list: the floor-average of its two middle entries (one entry twice if odd). -/
def medianSorted (s : List Nat) : Nat :=
  match s.length with
  | 0 => 0
  | n + 1 => (s.getD (n / 2) 0 + s.getD ((n + 1) / 2) 0) / 2

/-- **The median.** Sort; odd length the middle entry; even length `(a + b) / 2` of the two middles. -/
def median (l : List Nat) : Nat := medianSorted (isort l)

theorem median_nil : median [] = 0 := rfl

theorem median_eq {l : List Nat} {n : Nat} (h : l.length = n + 1) :
    median l = ((isort l).getD (n / 2) 0 + (isort l).getD ((n + 1) / 2) 0) / 2 := by
  unfold median medianSorted
  have : (isort l).length = n + 1 := by rw [isort_length]; exact h
  rw [this]

/-- The median is a function of the multiset of entries. -/
theorem median_perm {l l' : List Nat} (h : l.Perm l') : median l = median l' := by
  have h1 : (isort l).Perm (isort l') := (isort_perm l).trans (h.trans (isort_perm l').symm)
  have h2 : isort l = isort l' :=
    List.Perm.eq_of_pairwise (fun _ _ _ _ a b => Nat.le_antisymm a b) (isort_sorted l) (isort_sorted l') h1
  unfold median; rw [h2]

theorem getD_lt (s : List Nat) {i : Nat} (h : i < s.length) : s.getD i 0 = s[i] := by
  simp [List.getD, h]

/-- In a sorted list, later entries are no smaller. -/
theorem sorted_getD_le {s : List Nat} (h : s.Pairwise (· ≤ ·)) {i j : Nat} (hij : i ≤ j) (hj : j < s.length) :
    s.getD i 0 ≤ s.getD j 0 := by
  have hi : i < s.length := Nat.lt_of_le_of_lt hij hj
  rw [getD_lt _ hi, getD_lt _ hj]
  rcases Nat.eq_or_lt_of_le hij with rfl | hlt
  · exact Nat.le_refl _
  · exact List.pairwise_iff_getElem.mp h i j hi hj hlt

/-- A list on which a predicate never holds has count `0` (`List.countP_eq_zero` leans on `Classical.choice`). -/
theorem countP_zero_of_forall {p : Nat → Bool} : ∀ t : List Nat, (∀ b ∈ t, p b = false) → t.countP p = 0
  | [], _ => rfl
  | b :: t, h =>
    have hb : ¬ p b = true := fun e => Bool.noConfusion (e.symm.trans (h b List.mem_cons_self))
    (List.countP_cons_of_neg hb).trans (countP_zero_of_forall t (fun c hc => h c (List.mem_cons_of_mem _ hc)))

/-- **The counting key.** In a sorted list, the entry at `i` is below `m` exactly when fewer than
`i + 1` entries are, i.e. when `i` is within the count of entries below `m`. -/
theorem sorted_lt_iff {s : List Nat} (h : s.Pairwise (· ≤ ·)) (m : Nat) {i : Nat} (hi : i < s.length) :
    s.getD i 0 < m ↔ i < s.countP (fun a => decide (a < m)) := by
  induction s generalizing i with
  | nil => exact absurd hi (Nat.not_lt_zero _)
  | cons a t ih =>
    rw [List.pairwise_cons] at h
    have hlen : (a :: t).length = t.length + 1 := rfl
    by_cases ham : a < m
    · have hc : (a :: t).countP (fun b => decide (b < m)) = t.countP (fun b => decide (b < m)) + 1 :=
        List.countP_cons_of_pos (decide_eq_true ham)
      rw [hc]
      cases i with
      | zero => rw [List.getD_cons_zero]; exact ⟨fun _ => Nat.succ_pos _, fun _ => ham⟩
      | succ i =>
        have hi' : i < t.length := by omega
        have := ih h.2 hi'
        rw [List.getD_cons_succ, this]
        exact ⟨fun h' => Nat.succ_lt_succ h', fun h' => Nat.lt_of_succ_lt_succ h'⟩
    · have hz : t.countP (fun b => decide (b < m)) = 0 :=
        countP_zero_of_forall t (fun b hb =>
          decide_eq_false (Nat.not_lt.mpr (Nat.le_trans (Nat.not_lt.mp ham) (h.1 b hb))))
      have hc : (a :: t).countP (fun b => decide (b < m)) = 0 := by
        exact (List.countP_cons_of_neg (p := fun b => decide (b < m)) (l := t) (fun hh => ham (of_decide_eq_true hh))).trans hz
      rw [hc]
      cases i with
      | zero => rw [List.getD_cons_zero]; exact ⟨fun h' => absurd h' ham, fun h' => absurd h' (Nat.lt_irrefl 0)⟩
      | succ i =>
        have hi' : i < t.length := by omega
        have : a ≤ t.getD i 0 := by
          rw [getD_lt _ hi']
          exact h.1 _ (List.getElem_mem hi')
        rw [List.getD_cons_succ]
        exact ⟨fun h' => absurd (Nat.lt_of_le_of_lt this h') ham, fun h' => absurd h' (Nat.not_lt_zero _)⟩

theorem le_iff_count {s : List Nat} (h : s.Pairwise (· ≤ ·)) (m : Nat) {i : Nat} (hi : i < s.length) :
    m ≤ s.getD i 0 ↔ s.countP (fun a => decide (a < m)) ≤ i := by
  have := sorted_lt_iff h m hi
  exact Nat.not_lt.symm.trans ((not_congr this).trans Nat.not_lt)

theorem le_bound_iff_count {s : List Nat} (h : s.Pairwise (· ≤ ·)) (B : Nat) {i : Nat} (hi : i < s.length) :
    s.getD i 0 ≤ B ↔ i < s.countP (fun a => decide (a < B + 1)) := by
  have := sorted_lt_iff h (B + 1) hi
  exact Nat.lt_succ_iff.symm.trans this

theorem getD_isort_mem {l : List Nat} {i : Nat} (hi : i < l.length) : (isort l).getD i 0 ∈ l := by
  have hi' : i < (isort l).length := by rw [isort_length]; exact hi
  rw [getD_lt _ hi']
  exact mem_isort.mp (List.getElem_mem hi')

/-! ## Median bounds -/

/-- **Median is below every upper bound of the ring.** -/
theorem median_le_max {l : List Nat} {M : Nat} (h : ∀ e ∈ l, e ≤ M) : median l ≤ M := by
  cases hl : l.length with
  | zero => rw [List.length_eq_zero_iff.mp hl]; exact Nat.zero_le _
  | succ n =>
    rw [median_eq hl]
    have h1 := h _ (getD_isort_mem (i := n / 2) (by omega))
    have h2 := h _ (getD_isort_mem (i := (n + 1) / 2) (by omega))
    omega

/-- **Median is above every lower bound of a nonempty ring.** -/
theorem le_median_of_forall_ge {l : List Nat} {m : Nat} (hne : l ≠ []) (h : ∀ e ∈ l, m ≤ e) : m ≤ median l := by
  cases hl : l.length with
  | zero => exact absurd (List.length_eq_zero_iff.mp hl) hne
  | succ n =>
    rw [median_eq hl]
    have h1 := h _ (getD_isort_mem (i := n / 2) (by omega))
    have h2 := h _ (getD_isort_mem (i := (n + 1) / 2) (by omega))
    omega

/-- **The median is an entry, or lies strictly between two entries.** -/
theorem median_mem_or_between {l : List Nat} (hne : l ≠ []) :
    median l ∈ l ∨ ∃ a ∈ l, ∃ b ∈ l, a < median l ∧ median l < b := by
  cases hl : l.length with
  | zero => exact absurd (List.length_eq_zero_iff.mp hl) hne
  | succ n =>
    rw [median_eq hl]
    have hs : (isort l).Pairwise (· ≤ ·) := isort_sorted l
    have hlen : (isort l).length = n + 1 := by rw [isort_length]; exact hl
    have hab := sorted_getD_le hs (i := n / 2) (j := (n + 1) / 2) (by omega) (by omega)
    have ha := getD_isort_mem (l := l) (i := n / 2) (by omega)
    have hb := getD_isort_mem (l := l) (i := (n + 1) / 2) (by omega)
    generalize (isort l).getD (n / 2) 0 = a at *
    generalize (isort l).getD ((n + 1) / 2) 0 = b at *
    by_cases h1 : (a + b) / 2 = a
    · left; rw [h1]; exact ha
    by_cases h2 : (a + b) / 2 = b
    · left; rw [h2]; exact hb
    right
    exact ⟨a, ha, b, hb, by omega, by omega⟩

/-! ## Append never lowers the median when the entry is at least the median -/

theorem median_ge_of_count {l : List Nat} {m : Nat} (hne : l ≠ [])
    (hc : l.countP (fun a => decide (a < m)) ≤ (l.length - 1) / 2) : m ≤ median l := by
  cases hl : l.length with
  | zero => exact absurd (List.length_eq_zero_iff.mp hl) hne
  | succ n =>
    rw [median_eq hl]
    have hs := isort_sorted l
    have hlen : (isort l).length = n + 1 := by rw [isort_length]; exact hl
    have hcnt : (isort l).countP (fun a => decide (a < m)) = l.countP (fun a => decide (a < m)) :=
      (isort_perm l).countP_eq _
    have h1 := (le_iff_count hs m (i := n / 2) (by omega)).mpr (by rw [hcnt]; simp [hl] at hc; omega)
    have h2 := (le_iff_count hs m (i := (n + 1) / 2) (by omega)).mpr (by rw [hcnt]; simp [hl] at hc; omega)
    omega

/-- **Appending an entry at least the median never lowers the median.** This replaces the false
monotonicity of the median under arbitrary appends (`median_append_not_monotone`). -/
theorem append_ge_median_never_lowers (ring : List Nat) (s : Nat) (h : s ≥ median ring) :
    median (ring ++ [s]) ≥ median ring := by
  cases hl : ring.length with
  | zero => rw [List.length_eq_zero_iff.mp hl]; simp [median_nil]
  | succ n =>
    have hsorted := isort_sorted ring
    have hlen : (isort ring).length = n + 1 := by rw [isort_length]; exact hl
    -- the upper middle of the ring is at least the median
    have hup : median ring ≤ (isort ring).getD ((n + 1) / 2) 0 := by
      rw [median_eq hl]
      have := sorted_getD_le hsorted (i := n / 2) (j := (n + 1) / 2) (by omega) (by omega)
      omega
    have hcount : ring.countP (fun a => decide (a < median ring)) ≤ (n + 1) / 2 := by
      have := (le_iff_count hsorted (median ring) (i := (n + 1) / 2) (by omega)).mp hup
      rwa [(isort_perm ring).countP_eq] at this
    apply median_ge_of_count (m := median ring) (by simp)
    rw [List.countP_append]
    simp only [List.length_append, hl, List.length_singleton]
    have : decide (s < median ring) = false := by simp; omega
    simp [this]
    omega

/-- The review's counterexample: appending a small entry lowers the median (`100` to `50`). -/
theorem median_append_not_monotone : median ([1, 100, 1000] ++ [1]) < median [1, 100, 1000] := by decide

theorem median_house_cases :
    median [] = 0 ∧ median [7] = 7 ∧ median [3, 1, 2] = 2 ∧ median [4, 1] = 2 ∧ median [1, 2] = 1
    ∧ median [1, 2, 3, 4] = 2 := by decide

/-! ## The clip, the factor, the line, the limit -/

/-- **The clip.** An entry enters the ring at most twice the larger of the current median and the
minimum draw. -/
def clip (size currentMedian minDraw : Nat) : Nat := min size (2 * max currentMedian minDraw)

theorem clip_le_size (size m d : Nat) : clip size m d ≤ size := Nat.min_le_left _ _
theorem clip_le_bound (size m d : Nat) : clip size m d ≤ 2 * max m d := Nat.min_le_right _ _
theorem clip_of_le {size m d : Nat} (h : size ≤ 2 * max m d) : clip size m d = size := Nat.min_eq_left h
theorem clip_idem (size m d : Nat) : clip (clip size m d) m d = clip size m d :=
  clip_of_le (clip_le_bound size m d)

/-- The factor: zero exactly when the line is stale. -/
def factor (stale : Bool) : Nat := if stale then 0 else 1

theorem factor_zero_iff_stale (stale : Bool) : factor stale = 0 ↔ stale = true := by
  cases stale <;> simp [factor]

/-- **The derived line.** Stale lines are zero; otherwise counted pairs times the ring median. -/
def deriveLine (count : Nat) (ring : List Nat) (stale : Bool) : Nat :=
  if stale then 0 else count * median ring

theorem deriveLine_eq (count : Nat) (ring : List Nat) (stale : Bool) :
    deriveLine count ring stale = count * median ring * factor stale := by
  cases stale <;> simp [deriveLine, factor]

theorem deriveLine_stale (count : Nat) (ring : List Nat) : deriveLine count ring true = 0 := rfl

/-- With a positive count and median, the line is zero exactly when stale. -/
theorem deriveLine_zero_iff_stale (count : Nat) (ring : List Nat) (stale : Bool)
    (hc : 0 < count) (hm : 0 < median ring) : deriveLine count ring stale = 0 ↔ stale = true := by
  cases stale
  · simp only [deriveLine, Bool.false_eq_true, if_false, iff_false]
    exact Nat.pos_iff_ne_zero.mp (Nat.mul_pos hc hm)
  · simp [deriveLine]

/-- **The line is bounded by sixteen times the ring's largest entry.** The hypotheses
`count ≤ 16` and `ring.length ≤ 16` are the protocol's bounds on counted pairs and the ring. -/
theorem deriveLine_le (count : Nat) (ring : List Nat) (stale : Bool) (hc : count ≤ 16)
    (_hr : ring.length ≤ 16) {M : Nat} (hM : ∀ e ∈ ring, e ≤ M) : deriveLine count ring stale ≤ 16 * M := by
  have hmed := median_le_max hM
  cases stale
  · simp only [deriveLine, Bool.false_eq_true, if_false]
    exact Nat.mul_le_mul hc hmed
  · simp [deriveLine]

/-- A realizer needs ring entries below `2^252` for the line to fit `uint256`. -/
theorem deriveLine_lt_two_pow_256 (count : Nat) (ring : List Nat) (stale : Bool) (hc : count ≤ 16)
    (hr : ring.length ≤ 16) (hM : ∀ e ∈ ring, e < 2 ^ 252) : deriveLine count ring stale < 2 ^ 256 := by
  have h := deriveLine_le count ring stale hc hr (M := 2 ^ 252 - 1) (fun e he => by have := hM e he; omega)
  have : 16 * (2 ^ 252 - 1) < 2 ^ 256 := by
    have : (2:Nat) ^ 256 = 16 * 2 ^ 252 := by
      decide
    have : 0 < 2 ^ 252 := Nat.two_pow_pos 252
    omega
  omega

/-- The limit: the line, capped. -/
def limit (line cap : Nat) : Nat := min line cap

theorem limit_le_line (line cap : Nat) : limit line cap ≤ line := Nat.min_le_left _ _
theorem limit_le_cap (line cap : Nat) : limit line cap ≤ cap := Nat.min_le_right _ _

/-- Admission: a draw is admitted when it fits the limit alongside the member's open exposure. -/
def admitted (amount openExposure lim : Nat) : Bool := decide (amount + openExposure ≤ lim)

/-- **An admitted draw keeps exposure within the limit.** -/
theorem exposure_le_limit {amount openExposure lim : Nat} (h : admitted amount openExposure lim = true) :
    amount + openExposure ≤ lim := by
  simpa [admitted] using h

theorem exposure_le_line {amount openExposure line cap : Nat}
    (h : admitted amount openExposure (limit line cap) = true) : amount + openExposure ≤ line :=
  Nat.le_trans (exposure_le_limit h) (limit_le_line line cap)

theorem exposure_le_cap {amount openExposure line cap : Nat}
    (h : admitted amount openExposure (limit line cap) = true) : amount + openExposure ≤ cap :=
  Nat.le_trans (exposure_le_limit h) (limit_le_cap line cap)

/-! ## The ratchet: nine clipped appends to a full ring -/

/-- A full FIFO ring takes one entry: the oldest leaves, the new one is last. -/
def push (r : List Nat) (x : Nat) : List Nat := r.tail ++ [x]

/-- The ring after a sequence of entries. -/
def run (r : List Nat) (xs : List Nat) : List Nat := xs.foldl push r

/-- Every entry of `xs` is clipped, at the time it enters, against the median then and `minDraw`. -/
def clipped (minDraw : Nat) : List Nat → List Nat → Bool
  | _, [] => true
  | r, x :: xs => decide (x ≤ 2 * max (median r) minDraw) && clipped minDraw (push r x) xs

theorem run_nil (r : List Nat) : run r [] = r := rfl
theorem run_cons (r : List Nat) (x : Nat) (xs : List Nat) : run r (x :: xs) = run (push r x) xs := rfl

theorem push_length {r : List Nat} (h : r.length = 16) (x : Nat) : (push r x).length = 16 := by
  simp [push, h]

theorem run_eq (xs : List Nat) : ∀ (r : List Nat), r.length = 16 → xs.length ≤ 16 →
    run r xs = r.drop xs.length ++ xs := by
  induction xs with
  | nil => intro r _ _; simp [run_nil]
  | cons x xs ih =>
    intro r hr hxs
    rw [run_cons, ih (push r x) (push_length hr x) (by simp at hxs; omega)]
    have h1 : r.tail = r.drop 1 := (List.drop_one).symm
    have h2 : xs.length ≤ (r.drop 1).length := by simp [hr]; simp at hxs; omega
    simp only [push, h1, List.length_cons]
    rw [List.drop_append_of_le_length h2, List.drop_drop]
    simp [Nat.add_comm]

theorem clipped_nth (minDraw : Nat) : ∀ (xs r : List Nat), clipped minDraw r xs = true →
    ∀ (j : Nat) (hj : j < xs.length), xs[j] ≤ 2 * max (median (run r (xs.take j))) minDraw := by
  intro xs
  induction xs with
  | nil => intro r _ j hj; simp at hj
  | cons x xs ih =>
    intro r h j hj
    simp only [clipped, Bool.and_eq_true, decide_eq_true_eq] at h
    cases j with
    | zero => simpa [run_nil] using h.1
    | succ j =>
      have := ih (push r x) h.2 j (by simpa using hj)
      simpa [run_cons] using this

/-- If a full ring has nine entries at most `B`, its median is at most `B`. -/
theorem median_le_of_count {r : List Nat} (hr : r.length = 16) {B : Nat}
    (hc : 9 ≤ r.countP (fun a => decide (a < B + 1))) : median r ≤ B := by
  rw [median_eq (n := 15) hr]
  show ((isort r).getD 7 0 + (isort r).getD 8 0) / 2 ≤ B
  have hs := isort_sorted r
  have hlen : (isort r).length = 16 := by rw [isort_length]; exact hr
  have h7 := sorted_getD_le hs (i := 7) (j := 8) (by omega) (by omega)
  have h8 := (le_bound_iff_count hs B (i := 8) (by omega)).mpr
    (by rw [(isort_perm r).countP_eq]; omega)
  omega

/-- **The ratchet is bounded.** A full 16-entry FIFO ring, every entry at most `2 * L` where
`L := max (median ring) minDraw`, then nine clipped appends: the median is at most `4 * L`.
The bound `2 * L` is false (`ratchet_triple_example` reaches `3 * L`). -/
theorem line_growth_bounded (minDraw : Nat) (ring xs : List Nat) (hring : ring.length = 16)
    (hxs : xs.length = 9)
    (hclip : ∀ e ∈ ring, e ≤ 2 * max (median ring) minDraw)
    (hc : clipped minDraw ring xs = true) :
    median (run ring xs) ≤ 4 * max (median ring) minDraw := by
  obtain ⟨L, hL⟩ : ∃ L, L = max (median ring) minDraw := ⟨_, rfl⟩
  rw [← hL] at hclip ⊢
  have hx0 : xs[0]'(by omega) ≤ 2 * L := by
    have h0 := clipped_nth minDraw xs ring hc 0 (by omega)
    rw [List.take_zero, run_nil, ← hL] at h0
    exact h0
  -- the median stays within 2L through the first eight appends
  have hmed : ∀ j, j ≤ 8 → median (run ring (xs.take j)) ≤ 2 * L := by
    intro j hj
    have hlenj : (xs.take j).length = j := by rw [List.length_take]; omega
    rw [run_eq (xs.take j) ring hring (by omega), hlenj]
    rcases Nat.eq_zero_or_pos j with rfl | hjpos
    · simp only [List.drop_zero, List.take_zero, List.append_nil]
      exact median_le_max hclip
    · apply median_le_of_count (by rw [List.length_append, List.length_drop, hring, hlenj]; omega)
      rw [List.countP_append]
      have hd : (ring.drop j).countP (fun a => decide (a < 2 * L + 1)) = (ring.drop j).length := by
        rw [List.countP_eq_length]
        intro e he
        have := hclip e (List.mem_of_mem_drop he)
        exact decide_eq_true (by omega)
      have ht : 0 < (xs.take j).countP (fun a => decide (a < 2 * L + 1)) := by
        rw [List.countP_pos_iff]
        refine ⟨xs[0]'(by omega), ?_, decide_eq_true (by omega)⟩
        exact List.mem_take_iff_getElem.mpr ⟨0, by first | omega | (rw [List.length_take]; omega), rfl⟩
      rw [hd, List.length_drop, hring]; omega
  -- so every entry appended is at most 4L
  have hxle : ∀ e ∈ xs, e ≤ 4 * L := by
    intro e he
    obtain ⟨j, hj, rfl⟩ := List.getElem_of_mem he
    have h := clipped_nth minDraw xs ring hc j hj
    have hm := hmed j (by omega)
    have hd : minDraw ≤ L := by rw [hL]; exact Nat.le_max_right _ _
    have hmx : max (median (run ring (xs.take j))) minDraw ≤ 2 * L := by
      exact Nat.max_le.mpr ⟨hm, by omega⟩
    omega
  rw [run_eq xs ring hring (by omega), hxs]
  apply median_le_max
  intro e he
  rcases List.mem_append.mp he with he | he
  · have := hclip e (List.mem_of_mem_drop he); omega
  · exact hxle e he

/-- A full ring of eight small entries and eight at `200`: its median is `100`, so `L = 100`
(with `minDraw = 1`), and every entry is within `2 * L`. -/
def tripleRing : List Nat := List.replicate 8 1 ++ List.replicate 8 200

/-- The greedy adversary: `200`, then `400` eight times. Each entry is clipped. -/
def tripleAppends : List Nat := 200 :: List.replicate 8 400

theorem ratchet_triple_clipped : clipped 1 tripleRing tripleAppends = true := by decide

theorem ratchet_triple_median_start : median tripleRing = 100 := by decide

/-- **The `2 * L` claim is false.** Nine clipped appends take a median of `100` (with every entry within
`2 * L`) to `300`. -/
theorem ratchet_triple_example : median (run tripleRing tripleAppends) = 300 := by decide

theorem ratchet_not_double :
    2 * max (median tripleRing) 1 < median (run tripleRing tripleAppends) := by decide

/-! ## A ring that is not yet full ratchets faster -/

/-- Appending to a ring below its capacity (nothing leaves). -/
def grow (r : List Nat) (minDraw : Nat) : Nat → List Nat
  | 0 => r
  | k + 1 => grow (r ++ [2 * max (median r) minDraw]) minDraw k

theorem cold_start_doubles_in_two :
    median ([100] ++ [200] ++ [200]) = 2 * median [100] := by decide

theorem cold_start_nine_greedy_exceeds_double :
    2 * median [100] < median (grow [100] 1 9) := by decide

end TallyCredit
end Economics
end Obsmetrologia
