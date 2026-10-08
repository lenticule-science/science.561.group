import ObsmetrologiaEconomics.AttentionAllocation

/-! # The allocation solver — the two-handed knapsack

The attention allocation (`Attention.attention_allocation`) fixes the structure of
the demand side: feasibility, monotone consumption, residual antitone in captured
benefit. This module returns the optimum: a solver over the powerset of obstructions
that keeps the max-benefit feasible selection.

The solver is **handed**. A left fold (`solveL`, foldl — the earliest-settling
cascade) and a right fold (`solveR`, foldr — the latest-settling cascade) each
return an optimum, and the optimum *value* is the same either way
(`solveL_optimal`/`solveR_optimal`: both dominate every feasible sublist). But the
optimising *selection* is chirality-biased: on a benefit tie the two folds keep
opposite beads (`bias_witness`). The optimum is chirality-invariant; the choice is
not — the ledger's forward/backward asymmetry (the irreversible jump, `Valuation`
conflate) surfacing as which bead survives when value cannot decide.

## References
`AttentionAllocation` (the allocation structure); the fold-direction reading of the
settling cascade's arrow; `Valuation.ledger_noether` (conflate = time-reversal,
the source of the handedness).
-/

namespace Obsmetrologia
namespace Cohomology
namespace Attention

/-! ## The powerset -/

/-- The powerset of a list — every sublist, built by the head-in/head-out recursion. -/
def subs {α : Type} : List α → List (List α)
  | [] => [[]]
  | x :: xs => subs xs ++ (subs xs).map (x :: ·)

/-- **Every sublist is enumerated.** A `Sublist` of `l` is a member of `subs l`:
the powerset is complete, the search exhaustive. -/
theorem sublist_mem_subs {α : Type} {l l' : List α} (h : l'.Sublist l) : l' ∈ subs l := by
  induction h with
  | slnil => simp [subs]
  | cons a _ ih => simp only [subs, List.mem_append]; exact Or.inl ih
  | cons_cons a _ ih =>
    simp only [subs, List.mem_append, List.mem_map]
    exact Or.inr ⟨_, ih, rfl⟩

/-- **Every member of the powerset is a sublist.** The converse of
`sublist_mem_subs`: membership in `subs l` and being a `Sublist` of `l` coincide. -/
theorem mem_subs_sublist {α : Type} : ∀ {l l' : List α}, l' ∈ subs l → l'.Sublist l
  | [], l', h => by
    simp only [subs, List.mem_singleton] at h
    subst h; exact List.Sublist.refl _
  | x :: xs, l', h => by
    simp only [subs, List.mem_append, List.mem_map] at h
    rcases h with h | ⟨t, ht, rfl⟩
    · exact (mem_subs_sublist h).cons x
    · exact (mem_subs_sublist ht).cons_cons x

/-! ## The comparator and its domination -/

/-- Keep the better of two candidates: `b` when it is feasible and strictly beats `a`
in benefit, else `a`. -/
def better (B : Nat) (a b : List Obstruction) : List Obstruction :=
  if totalCost b ≤ B ∧ totalBenefit a < totalBenefit b then b else a

/-- The comparator never lowers benefit. -/
theorem better_ge_a (B : Nat) (a b : List Obstruction) :
    totalBenefit a ≤ totalBenefit (better B a b) := by
  unfold better; split
  · rename_i h; exact Nat.le_of_lt h.2
  · exact Nat.le_refl _

/-- The comparator dominates a feasible right argument. -/
theorem better_ge_b (B : Nat) (a b : List Obstruction) (hb : totalCost b ≤ B) :
    totalBenefit b ≤ totalBenefit (better B a b) := by
  unfold better; split
  · exact Nat.le_refl _
  · rename_i h; rw [not_and] at h; exact Nat.le_of_not_lt (h hb)

/-- The comparator preserves feasibility of a feasible left argument. -/
theorem better_feasible (B : Nat) (a b : List Obstruction) (ha : totalCost a ≤ B) :
    totalCost (better B a b) ≤ B := by
  unfold better; split
  · rename_i h; exact h.1
  · exact ha

/-! ## The left solver — foldl, the earliest-settling cascade -/

/-- The **left solver**: fold the comparator over the powerset from the empty seed,
head-first — the earliest-settling cascade. -/
def solveL (B : Nat) (U : List Obstruction) : List Obstruction := (subs U).foldl (better B) []

/-- A foldl of `better` keeps its accumulator feasible. -/
theorem foldl_better_feasible (B : Nat) : ∀ (L : List (List Obstruction)) (acc : List Obstruction),
    totalCost acc ≤ B → totalCost (L.foldl (better B) acc) ≤ B
  | [], _, h => h
  | a :: l, acc, h =>
    foldl_better_feasible B l (better B acc a) (better_feasible B acc a h)

/-- A foldl accumulator only grows in benefit. -/
theorem foldl_better_ge_acc (B : Nat) : ∀ (L : List (List Obstruction)) (acc : List Obstruction),
    totalBenefit acc ≤ totalBenefit (L.foldl (better B) acc)
  | [], _ => Nat.le_refl _
  | a :: l, acc => Nat.le_trans (better_ge_a B acc a) (foldl_better_ge_acc B l (better B acc a))

/-- A foldl of `better` dominates every feasible element of the list. -/
theorem foldl_better_dom (B : Nat) : ∀ (L : List (List Obstruction)) (acc : List Obstruction)
    (T : List Obstruction), T ∈ L → totalCost T ≤ B →
    totalBenefit T ≤ totalBenefit (L.foldl (better B) acc)
  | [], _, T, hT, _ => absurd hT List.not_mem_nil
  | a :: l, acc, T, hT, hTf => by
    rcases List.mem_cons.mp hT with rfl | hmem
    · exact Nat.le_trans (better_ge_b B acc T hTf) (foldl_better_ge_acc B l (better B acc T))
    · exact foldl_better_dom B l (better B acc a) T hmem hTf

/-- **The left solver is feasible.** -/
theorem solveL_feasible (B : Nat) (U : List Obstruction) : totalCost (solveL B U) ≤ B :=
  foldl_better_feasible B (subs U) [] (Nat.zero_le _)

/-- **The left solver is optimal.** Its benefit dominates every feasible sublist of
`U`: the exhaustive powerset (`sublist_mem_subs`) plus foldl domination
(`foldl_better_dom`). -/
theorem solveL_optimal (B : Nat) (U : List Obstruction) (T : List Obstruction)
    (hsub : T.Sublist U) (hTf : totalCost T ≤ B) :
    totalBenefit T ≤ totalBenefit (solveL B U) :=
  foldl_better_dom B (subs U) [] T (sublist_mem_subs hsub) hTf

/-! ## The right solver — foldr, the latest-settling cascade -/

/-- The **right solver**: fold the comparator over the powerset from the tail —
the latest-settling cascade, the opposite hand. -/
def solveR (B : Nat) (U : List Obstruction) : List Obstruction :=
  (subs U).foldr (fun x acc => better B acc x) []

/-- A foldr of `better` keeps its result feasible. -/
theorem foldr_better_feasible (B : Nat) : ∀ (L : List (List Obstruction)),
    totalCost (L.foldr (fun x acc => better B acc x) []) ≤ B
  | [] => Nat.zero_le _
  | a :: l => better_feasible B _ a (foldr_better_feasible B l)

/-- A foldr of `better` dominates every feasible element of the list. -/
theorem foldr_better_dom (B : Nat) : ∀ (L : List (List Obstruction)) (T : List Obstruction),
    T ∈ L → totalCost T ≤ B →
    totalBenefit T ≤ totalBenefit (L.foldr (fun x acc => better B acc x) [])
  | [], T, hT, _ => absurd hT List.not_mem_nil
  | a :: l, T, hT, hTf => by
    rcases List.mem_cons.mp hT with rfl | hmem
    · exact better_ge_b B _ T hTf
    · exact Nat.le_trans (foldr_better_dom B l T hmem hTf) (better_ge_a B _ a)

/-- **The right solver is feasible.** -/
theorem solveR_feasible (B : Nat) (U : List Obstruction) : totalCost (solveR B U) ≤ B :=
  foldr_better_feasible B (subs U)

/-- **The right solver is optimal.** Same optimum value as the left, reached from the
other hand. -/
theorem solveR_optimal (B : Nat) (U : List Obstruction) (T : List Obstruction)
    (hsub : T.Sublist U) (hTf : totalCost T ≤ B) :
    totalBenefit T ≤ totalBenefit (solveR B U) :=
  foldr_better_dom B (subs U) T (sublist_mem_subs hsub) hTf

/-! ## Each hand is a sublist -/

/-- A foldl of `better` returns the seed or a member of the list. -/
theorem foldl_better_seed_or_mem (B : Nat) :
    ∀ (L : List (List Obstruction)) (acc : List Obstruction),
    L.foldl (better B) acc = acc ∨ L.foldl (better B) acc ∈ L
  | [], _ => Or.inl rfl
  | a :: l, acc => by
    rcases foldl_better_seed_or_mem B l (better B acc a) with h | h
    · rw [List.foldl_cons, h]
      unfold better
      split
      · exact Or.inr List.mem_cons_self
      · exact Or.inl rfl
    · exact Or.inr (by rw [List.foldl_cons]; exact List.mem_cons_of_mem a h)

/-- A foldr of `better` returns the seed or a member of the list. -/
theorem foldr_better_seed_or_mem (B : Nat) :
    ∀ (L : List (List Obstruction)),
    L.foldr (fun x acc => better B acc x) [] = []
    ∨ L.foldr (fun x acc => better B acc x) [] ∈ L
  | [] => Or.inl rfl
  | a :: l => by
    rw [List.foldr_cons]
    unfold better
    split
    · exact Or.inr List.mem_cons_self
    · rcases foldr_better_seed_or_mem B l with h | h
      · exact Or.inl h
      · exact Or.inr (List.mem_cons_of_mem a h)

/-- **The left solver returns a sublist of `U`.** Its output is the empty seed or a
member of the powerset, both sublists of `U`. -/
theorem solveL_sublist (B : Nat) (U : List Obstruction) : (solveL B U).Sublist U := by
  rcases foldl_better_seed_or_mem B (subs U) [] with h | h
  · rw [solveL, h]; exact List.nil_sublist U
  · exact mem_subs_sublist h

/-- **The right solver returns a sublist of `U`.** -/
theorem solveR_sublist (B : Nat) (U : List Obstruction) : (solveR B U).Sublist U := by
  rcases foldr_better_seed_or_mem B (subs U) with h | h
  · rw [solveR, h]; exact List.nil_sublist U
  · exact mem_subs_sublist h

/-! ## Chirality — the optimum value is invariant, the selection is biased -/

/-- **The two hands agree in value.** Both solvers dominate every feasible sublist,
so on any `U` they achieve the same optimum benefit: each is `≤` the other by the
other's optimality applied to it (both outputs are feasible sublists of `U`,
`solveL_sublist`/`solveR_sublist`). No hypotheses — the hands always tie in value. -/
theorem solvers_agree_value (B : Nat) (U : List Obstruction) :
    totalBenefit (solveL B U) = totalBenefit (solveR B U) :=
  Nat.le_antisymm
    (solveR_optimal B U (solveL B U) (solveL_sublist B U) (solveL_feasible B U))
    (solveL_optimal B U (solveR B U) (solveR_sublist B U) (solveR_feasible B U))

/-- Two equal-benefit unit-cost beads. -/
def bead1 : Obstruction := ⟨1, 5⟩
/-- The second bead — equal benefit, distinct cost, so the two selections are distinct
lists; at budget two neither pair is feasible, forcing a single-bead choice. -/
def bead2 : Obstruction := ⟨2, 5⟩

/-- **The bead bias.** Two equal-benefit beads whose costs forbid taking both: at
budget two the two hands keep opposite beads — the left fold keeps the second, the
right fold keeps the first. The optimum value is chirality-invariant
(`solvers_agree_value`), but the optimising selection is chirality-biased — which
bead survives when value cannot decide is decided by the fold's direction, the
ledger's forward/backward asymmetry. -/
theorem bias_witness :
    solveL 2 [bead1, bead2] = [bead2] ∧ solveR 2 [bead1, bead2] = [bead1]
    ∧ totalBenefit (solveL 2 [bead1, bead2]) = totalBenefit (solveR 2 [bead1, bead2]) := by
  refine ⟨by decide, by decide, by decide⟩

/-! ## The exact divergence — bias lives precisely in the optimal tie-set -/

/-- **A feasible optimum.** A selection that is a sublist of `U`, feasible, and whose
benefit equals the left solver's (equivalently the right's, by
`solvers_agree_value`) — a member of the optimal tie-set. -/
def IsOptimum (B : Nat) (U T : List Obstruction) : Prop :=
  T.Sublist U ∧ totalCost T ≤ B ∧ totalBenefit T = totalBenefit (solveL B U)

/-- **Both hands are optima.** Each solver output is a feasible optimal sublist —
each is in the optimal tie-set. -/
theorem solveL_isOptimum (B : Nat) (U : List Obstruction) : IsOptimum B U (solveL B U) :=
  ⟨solveL_sublist B U, solveL_feasible B U, rfl⟩

theorem solveR_isOptimum (B : Nat) (U : List Obstruction) : IsOptimum B U (solveR B U) :=
  ⟨solveR_sublist B U, solveR_feasible B U, (solvers_agree_value B U).symm⟩

/-- **The hands agree exactly when the optimum is unique.** If the optimal tie-set is
a singleton — every feasible optimal selection equals the left solver's output — then
the two hands return the identical selection: no bias. The bias is *precisely* the
degeneracy of the optimum; a non-degenerate optimum is chirality-free. -/
theorem hands_agree_of_unique_optimum (B : Nat) (U : List Obstruction)
    (huniq : ∀ T, IsOptimum B U T → T = solveL B U) :
    solveL B U = solveR B U :=
  (huniq (solveR B U) (solveR_isOptimum B U)).symm

/-- **Divergence forces a second optimum.** Contrapositive: if the two hands return
different selections, the optimal tie-set has at least two elements — the left and
right outputs are distinct feasible optima. Bias exists only where the optimum is
achieved more than once. -/
theorem divergence_forces_degenerate_optimum (B : Nat) (U : List Obstruction)
    (hne : solveL B U ≠ solveR B U) :
    IsOptimum B U (solveL B U) ∧ IsOptimum B U (solveR B U)
    ∧ solveL B U ≠ solveR B U :=
  ⟨solveL_isOptimum B U, solveR_isOptimum B U, hne⟩

/-- **The tie-set is exactly the optima — witnessed degenerate.** On the two-bead
scenario both `[bead1]` and `[bead2]` are optima, distinct, so the tie-set is not a
singleton: this is exactly the configuration in which the hands diverge
(`bias_witness`). Bias occurs exactly where the optimum is achieved by more than
one selection. -/
theorem bias_degenerate_witness :
    IsOptimum 2 [bead1, bead2] [bead1] ∧ IsOptimum 2 [bead1, bead2] [bead2]
    ∧ ([bead1] : List Obstruction) ≠ [bead2]
    ∧ solveL 2 [bead1, bead2] ≠ solveR 2 [bead1, bead2] := by
  refine ⟨⟨?_, by decide, by decide⟩, ⟨?_, by decide, by decide⟩, by decide, by decide⟩
  · exact (List.nil_sublist [bead2]).cons_cons bead1
  · exact (List.Sublist.refl [bead2]).cons bead1

/-! ## The tie-set entropy — degeneracy as Landauer bits of choice

The tie-set is the set of feasible optimal selections; its cardinality is the
degeneracy of the optimum, and its base-two logarithm is the **choice entropy** —
the bits the fold direction must supply to pick one. This is the Landauer bit of the
allocation: a unique optimum is zero-entropy and chirality-free
(`choiceBits_zero_iff_effectively_unique`, the parallel of
`Landauer.landauer_zero_iff_reversible`), and the two-bead scenario has degeneracy
two, one bit of choice (`witness_one_choice_bit`) — the single bit the ledger's arrow
erases when it breaks the tie. -/

/-- The **tie-set**: the feasible sublists achieving the optimum benefit — the optima
the solver could return, the degenerate ground states of the allocation. -/
def tieSet (B : Nat) (U : List Obstruction) : List (List Obstruction) :=
  (subs U).filter (fun T =>
    decide (totalCost T ≤ B) && decide (totalBenefit T = totalBenefit (solveL B U)))

/-- The **degeneracy** of the optimum: the number of feasible optimal selections. -/
def degeneracy (B : Nat) (U : List Obstruction) : Nat := (tieSet B U).length

/-- The **choice entropy** in bits: `log₂` of the degeneracy — the bits the fold
direction supplies to select one optimum, the Landauer cost of breaking the tie. -/
def choiceBits (B : Nat) (U : List Obstruction) : Nat := Nat.log2 (degeneracy B U)

/-- The left solver is a feasible optimum, hence in the tie-set. -/
theorem solveL_mem_tieSet (B : Nat) (U : List Obstruction) : solveL B U ∈ tieSet B U := by
  unfold tieSet
  rw [List.mem_filter, Bool.and_eq_true]
  exact ⟨sublist_mem_subs (solveL_sublist B U),
    decide_eq_true (solveL_feasible B U), decide_eq_true rfl⟩

/-- The right solver is a feasible optimum too, in the tie-set by `solvers_agree_value`. -/
theorem solveR_mem_tieSet (B : Nat) (U : List Obstruction) : solveR B U ∈ tieSet B U := by
  unfold tieSet
  rw [List.mem_filter, Bool.and_eq_true]
  exact ⟨sublist_mem_subs (solveR_sublist B U),
    decide_eq_true (solveR_feasible B U), decide_eq_true (solvers_agree_value B U).symm⟩

/-- **The degeneracy is at least one.** The tie-set is nonempty — the optimum is
achieved, at least by the left solver. -/
theorem degeneracy_pos (B : Nat) (U : List Obstruction) : 1 ≤ degeneracy B U :=
  List.length_pos_of_mem (solveL_mem_tieSet B U)

/-- `log₂` vanishes exactly at `≤ 1`. -/
theorem log2_eq_zero_iff (g : Nat) : Nat.log2 g = 0 ↔ g ≤ 1 := by
  rw [Nat.log2_def]
  split
  · rename_i h; exact ⟨fun heq => by omega, fun hle => by omega⟩
  · rename_i h; exact ⟨fun _ => by omega, fun _ => rfl⟩

/-- **Degeneracy one makes the hands agree.** A non-degenerate optimum (tie-set a
singleton) forces both hands to the unique element: no bias. -/
theorem hands_agree_of_degeneracy_one (B : Nat) (U : List Obstruction)
    (h : degeneracy B U = 1) : solveL B U = solveR B U := by
  obtain ⟨x, hx⟩ := List.length_eq_one_iff.mp h
  have hL := solveL_mem_tieSet B U
  have hR := solveR_mem_tieSet B U
  rw [hx, List.mem_singleton] at hL hR
  rw [hL, hR]

/-- **The choice entropy vanishes iff the optimum is effectively unique.** Since the
degeneracy is at least one (`degeneracy_pos`), `choiceBits = 0` exactly when the
degeneracy is one — the tie-set a singleton, the optimum uniquely achieved, the hands
in agreement (`hands_agree_of_degeneracy_one`). This is the allocation's Landauer law,
the parallel of `Landauer.landauer_zero_iff_reversible` (`landauerBits = 0` iff the
nerve is a forest): zero choice-bits iff the selection is reversible — value alone
decides, no bit erased. -/
theorem choiceBits_zero_iff_effectively_unique (B : Nat) (U : List Obstruction) :
    choiceBits B U = 0 ↔ degeneracy B U = 1 := by
  unfold choiceBits
  rw [log2_eq_zero_iff]
  have hpos := degeneracy_pos B U
  constructor
  · intro hle; exact Nat.le_antisymm hle hpos
  · intro heq; exact Nat.le_of_eq heq

/-- **The two-bead scenario carries one choice bit.** Its tie-set is the two
single-bead optima, degeneracy two, so `choiceBits = log₂ 2 = 1`: exactly one bit of
choice entropy — the single bit the fold direction erases when it breaks the tie
(`bias_witness`). The same Landauer bit the settling cohomology prices per nerve
cycle, here per doubling of the optimum's degeneracy. -/
theorem witness_one_choice_bit :
    degeneracy 2 [bead1, bead2] = 2 ∧ choiceBits 2 [bead1, bead2] = 1 := by
  refine ⟨by decide, ?_⟩
  unfold choiceBits
  rw [show degeneracy 2 [bead1, bead2] = 2 from by decide]
  decide

end Attention
end Cohomology
end Obsmetrologia
