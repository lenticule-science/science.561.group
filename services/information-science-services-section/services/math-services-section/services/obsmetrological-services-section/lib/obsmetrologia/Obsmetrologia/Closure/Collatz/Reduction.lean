import Obsmetrologia.Closure.Collatz.ResidueGap

/-!
# Collatz reduction: from the gap and crossing to termination

This module assembles the conditional reduction the whole development targets:

  `ParentBarrierGap` + `EveryNonterminalHasCrossing` ⟹ accelerated Collatz termination.

The **coefficient crossing** of a seed `n` is the first prefix length `k` at which its
parity word turns contracting; that crossing word is exactly a first-passage word
(`firstCoeffCrossing_word_is_firstPassage`). The parent-barrier gap, sharpened in
`ResidueGap` to `ParentBarrierResidueGap`, forces every first-passage cylinder to
descend (handling the two terminal-adjacent cylinders `[E]` and `[O,E]` directly);
the crossing hypothesis supplies a crossing for every nonterminal seed. Together
they give universal descent below self, which the proven reduction
`reachesTerminal_of_all_fall_below` turns into termination.

The live arithmetic frontier alias is `parentBarrierGap_holds` (the semigroup/residue
gap, `SemigroupGap`). The no-stream/crossing statement is kept as a proposition and
as blueprint frontier, not as a second unconditional Lean `sorry`. This module records
the sharper one-lock accounting:
`CollatzFrontierInputs ↔ ParentBarrierGap ∧ ParentBarrierOneLockCollapse`. Thus the
green reduction can be read either as the original two-input route or as the parent
gap plus the named implication that the gap rules out positive infinite barrier
streams.

## Main definitions

* `FirstCoeffCrossing` — the first contracting prefix length of a seed.
* `EveryNonterminalHasCrossing` — every `n > 2` has such a crossing.
* `NoPositiveInfiniteBarrierStream` — no positive seed stays coefficient-noncontracting forever.
* `EveryNonterminalHasParentBarrierCylinder` — every `n > 2` realizes a finite
  parent-barrier first-passage cylinder.

## Main results

* `firstCoeffCrossing_word_is_firstPassage` — a crossing word is first-passage.
* `parentBarrierGap_implies_all_firstPassage_descent` — the gap descends every cylinder.
* `collatz_from_parentBarrierGap_and_crossing` — the conditional reduction.
* `collatz_from_parentBarrierResidueGap_and_crossing` — the residue-gap conditional reduction.
* `frontierInputs_iff_parentBarrierGap_and_oneLock` — the frontier package as
  gap plus named one-lock collapse.
* `everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream` — the finite
  parent-barrier cylinder extraction form of the no-stream gap.
* `collatz_from_parentBarrierGap_and_oneLock` — descent/termination from the
  gap plus the named one-lock collapse.
* `collatz_from_parentBarrierGap_and_oneLock` — termination from the arithmetic
  gap plus the named one-lock collapse.

## Tags

collatz, coefficient crossing, descent, reduction, termination
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## Parity-word prefixes -/

/-- A proper prefix of a parity word is the shorter parity word. -/
theorem parityWord_take : ∀ (n k j : Nat), j ≤ k →
    (parityWord n k).take j = parityWord n j := by
  intro n k j
  induction j generalizing n k with
  | zero => intro _; rfl
  | succ j ih =>
      intro h
      cases k with
      | zero => exact absurd h (by omega)
      | succ k =>
          rw [parityWord_succ, List.take_succ_cons, ih (step n) k (by omega), parityWord_succ]

/-- `parityWord n 1 = [branch n]`. -/
theorem parityWord_one (n : Nat) : parityWord n 1 = [branch n] := rfl
/-- `parityWord n 2 = [branch n, branch (step n)]`. -/
theorem parityWord_two (n : Nat) :
    parityWord n 2 = [branch n, branch (step n)] := rfl

/-! ## Coefficient crossing -/

/-- The first coefficient crossing: the parity word of length `k` contracts, every
shorter parity word does not. -/
def FirstCoeffCrossing (n k : Nat) : Prop :=
  CoeffContracting (parityWord n k) ∧ ∀ j, j < k → CoeffNoncontracting (parityWord n j)

/-- A first coefficient crossing word is a first-passage word. -/
theorem firstCoeffCrossing_word_is_firstPassage {n k : Nat}
    (h : FirstCoeffCrossing n k) : FirstPassageWord (parityWord n k) := by
  obtain ⟨hc, hnc⟩ := h
  refine ⟨hc, ?_⟩
  intro j hj
  rw [parityWord_length] at hj
  rw [parityWord_take n k j (Nat.le_of_lt hj)]
  exact hnc j hj

/-- Every nonterminal seed reaches a finite coefficient crossing. -/
def EveryNonterminalHasCrossing : Prop := ∀ n, 2 < n → ∃ k, FirstCoeffCrossing n k

/-- A seed has an infinite coefficient barrier stream when every finite prefix remains
coefficient-noncontracting. -/
def InfiniteBarrierStream (n : Nat) : Prop :=
  ∀ k, CoeffNoncontracting (parityWord n k)

/-- Constructive no-positive-infinite-barrier-stream form: every positive nonterminal
barrier stream has a finite contracting break. -/
def NoPositiveInfiniteBarrierStream : Prop :=
  ∀ n, 2 < n → ∃ k, CoeffContracting (parityWord n k)

/-- A positive infinite barrier stream, named with the finite cylinder it must avoid:
it never realizes a parent-barrier first-passage cylinder `p ++ [E]`. The avoidance
field is redundant once `InfiniteBarrierStream` is present, but it names the exact
finite obstruction at the remaining no-stream frontier. -/
def CylinderAvoidingBarrierStream (n : Nat) : Prop :=
  2 < n ∧
    InfiniteBarrierStream n ∧
      ∀ p : List Branch, ParentBarrier p →
        parityWord n ((p ++ [Branch.E]).length) ≠ p ++ [Branch.E]

/-- Every nonterminal seed realizes a finite parent-barrier first-passage
cylinder: for some parent barrier `p`, the seed's parity word reaches exactly
`p ++ [E]`. This is the finite-cylinder extraction form of the no-stream
frontier. -/
def EveryNonterminalHasParentBarrierCylinder : Prop :=
  ∀ n, 2 < n →
    ∃ p : List Branch,
      ParentBarrier p ∧
        parityWord n ((p ++ [Branch.E]).length) = p ++ [Branch.E]

/-- **Well-ordering for a decidable predicate** (derived here): a witness yields a
least witness, with everything below it failing. By structural recursion on the witness. -/
theorem exists_least : ∀ (m : Nat) (P : Nat → Prop), DecidablePred P → P m →
    ∃ k, P k ∧ ∀ j, j < k → ¬ P j
  | 0, _, _, hP => ⟨0, hP, fun j hj => absurd hj (Nat.not_lt_zero j)⟩
  | m + 1, P, hdec, hP => by
    haveI : DecidablePred P := hdec
    by_cases h0 : P 0
    · exact ⟨0, h0, fun j hj => absurd hj (Nat.not_lt_zero j)⟩
    · obtain ⟨k, hk, hkmin⟩ := exists_least m (fun i => P (i + 1)) (fun i => hdec (i + 1)) hP
      refine ⟨k + 1, hk, ?_⟩
      intro j hj
      cases j with
      | zero => exact h0
      | succ i => exact hkmin i (by omega)

/-- A *first* coefficient crossing exists as soon as *any* contracting prefix does: the least
contracting length is automatically a first crossing (all shorter prefixes noncontracting). -/
theorem firstCoeffCrossing_of_contracting {n : Nat}
    (h : ∃ k, CoeffContracting (parityWord n k)) : ∃ k, FirstCoeffCrossing n k := by
  obtain ⟨m, hm⟩ := h
  obtain ⟨k, hk, hkmin⟩ :=
    exists_least m (fun k => CoeffContracting (parityWord n k)) (fun k => Nat.decLt _ _) hm
  refine ⟨k, hk, ?_⟩
  intro j hj
  have hjnc := hkmin j hj
  unfold CoeffContracting at hjnc
  unfold CoeffNoncontracting
  omega

/-- The sharp form of the crossing hypothesis: every nonterminal seed has *some* contracting
parity prefix (`A < B`, i.e. `3^{oddCount} < 2^{len}`). -/
def EveryNonterminalContracts : Prop :=
  ∀ n, 2 < n → ∃ k, CoeffContracting (parityWord n k)

/-- The sharp contracting form implies the crossing hypothesis — so the open hole reduces to
"every `n > 2` eventually contracts," dropping the first/all-prior-noncontracting bookkeeping. -/
theorem everyNonterminalContracts_implies_crossing
    (h : EveryNonterminalContracts) : EveryNonterminalHasCrossing :=
  fun n hn => firstCoeffCrossing_of_contracting (h n hn)

/-- The crossing hypothesis forgets to the bare eventual-contracting form. -/
theorem everyNonterminalHasCrossing_implies_contracts
    (h : EveryNonterminalHasCrossing) : EveryNonterminalContracts := by
  intro n hn
  obtain ⟨k, hk⟩ := h n hn
  exact ⟨k, hk.1⟩

/-- The crossing hypothesis is exactly bare eventual coefficient contraction:
the least-contracting-prefix bookkeeping carries no extra mathematical content. -/
theorem everyNonterminalContracts_iff_crossing :
    EveryNonterminalContracts ↔ EveryNonterminalHasCrossing := by
  exact ⟨everyNonterminalContracts_implies_crossing,
    everyNonterminalHasCrossing_implies_contracts⟩

/-- A seed that reaches a first crossing cannot carry an infinite barrier stream. -/
theorem not_infiniteBarrierStream_of_crossing {n : Nat}
    (h : ∃ k, FirstCoeffCrossing n k) : ¬ InfiniteBarrierStream n := by
  rintro hbar
  obtain ⟨k, hc, _hmin⟩ := h
  have hnc := hbar k
  unfold CoeffContracting at hc
  unfold CoeffNoncontracting at hnc
  omega

/-- If a seed has no first crossing, every finite prefix remains a barrier. -/
theorem infiniteBarrierStream_of_not_crossing {n : Nat}
    (h : ¬ ∃ k, FirstCoeffCrossing n k) : InfiniteBarrierStream n := by
  intro k
  rcases Nat.lt_or_ge (traceOfWord (parityWord n k)).A
      (traceOfWord (parityWord n k)).B with hc | hnc
  · exact absurd (firstCoeffCrossing_of_contracting ⟨k, hc⟩) h
  · exact hnc

/-- The crossing hypothesis is exactly the constructive absence of positive infinite
barrier streams. -/
theorem everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream :
    EveryNonterminalHasCrossing ↔ NoPositiveInfiniteBarrierStream := by
  constructor
  · intro h n hn
    obtain ⟨k, hk⟩ := h n hn
    exact ⟨k, hk.1⟩
  · intro h n hn
    exact firstCoeffCrossing_of_contracting (h n hn)

/-- Bare eventual coefficient contraction is exactly the absence of positive infinite
coefficient-barrier streams. This is the sharp dynamical form of the second frontier. -/
theorem everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream :
    EveryNonterminalContracts ↔ NoPositiveInfiniteBarrierStream := by
  constructor
  · intro h
    exact everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mp
      (everyNonterminalContracts_implies_crossing h)
  · intro h
    exact everyNonterminalHasCrossing_implies_contracts
      (everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr h)

/-- The crossing/no-stream frontier is exactly finite parent-barrier cylinder
extraction: every nonterminal seed has a first contracting prefix iff every
nonterminal seed realizes some `p ++ [E]` with `p` a parent barrier. -/
theorem everyNonterminalHasParentBarrierCylinder_iff_crossing :
    EveryNonterminalHasParentBarrierCylinder ↔ EveryNonterminalHasCrossing := by
  constructor
  · intro hcyl n hn
    obtain ⟨p, hp, hword⟩ := hcyl n hn
    refine ⟨(p ++ [Branch.E]).length, ?_⟩
    have hfp : FirstPassageWord (p ++ [Branch.E]) :=
      (firstPassage_append_E_iff_parentBarrier p).mpr hp
    constructor
    · rw [hword]
      exact hfp.1
    · intro j hj
      have htake :=
        parityWord_take n ((p ++ [Branch.E]).length) j (Nat.le_of_lt hj)
      rw [hword] at htake
      rw [← htake]
      exact hfp.2 j hj
  · intro hcross n hn
    obtain ⟨k, hk⟩ := hcross n hn
    have hkpos : 0 < k := by
      cases k with
      | zero =>
          have hc := hk.1
          unfold CoeffContracting at hc
          simp [identityTrace] at hc
      | succ k => omega
    have hfp : FirstPassageWord (parityWord n k) :=
      firstCoeffCrossing_word_is_firstPassage hk
    have hne : parityWord n k ≠ [] := by
      intro hnil
      have hk0 : k = 0 := by
        rw [← parityWord_length n k, hnil]
        rfl
      omega
    obtain ⟨p, hpword⟩ := firstPassage_last_E hfp hne
    refine ⟨p, ?_, ?_⟩
    · exact (firstPassage_append_E_iff_parentBarrier p).mp
        (by simpa [hpword] using hfp)
    · have hlen : (p ++ [Branch.E]).length = k := by
        rw [← hpword, parityWord_length]
      rw [hlen]
      exact hpword

/-- The finite parent-barrier-cylinder extraction form is exactly the
constructive absence of positive infinite barrier streams. -/
theorem everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream :
    EveryNonterminalHasParentBarrierCylinder ↔ NoPositiveInfiniteBarrierStream :=
  everyNonterminalHasParentBarrierCylinder_iff_crossing.trans
    everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream

/-! ## A finite, kernel-checked audit of the crossing/no-stream frontier

`EveryNonterminalHasCrossing` / `EveryNonterminalContracts` / `NoPositiveInfiniteBarrierStream`
are open (the second live Collatz frontier, alongside `parentBarrierGap_holds`): unlike that
arithmetic gap, this frontier currently carries no Lean-checked finite evidence at all. The
theorem below is a genuine bounded instance, decided by the Lean kernel itself (`decide`, never
`native_decide`) rather than by an external script: every seed `n` with `2 < n < auditBound`
realizes a coefficient-contracting prefix of length below `auditSearchDepth`. It is the direct
formal analogue of a finite computational sweep (as in `scripts/collatz-parent-gap-audit.py` for
the parent-gap frontier), except the witness is a Lean term the kernel itself checks rather than
a Python printout: the corpus's first Lean-internal finite-audit witness for this frontier. It
does **not** close `EveryNonterminalContracts` (an unbounded claim over all `n`) — it is finite,
concrete evidence for a bounded range, exactly mirroring the epistemic status of a computational
audit, just checked by `decide` instead of trusted externally. -/

/-- Coefficient contraction is decidable: `CoeffContracting w` unfolds to the trace's
`A < B` comparison, decidable by `Nat.decLt`. -/
instance decCoeffContracting : DecidablePred CoeffContracting := fun w =>
  inferInstanceAs (Decidable ((traceOfWord w).A < (traceOfWord w).B))

/-- The audit range: seeds `n` with `2 < n < auditBound` are covered by the finite sweep
below. Chosen concrete and small enough to stay fast for the Lean kernel to `decide`. -/
def auditBound : Nat := 500

/-- The audit search depth: every covered seed's crossing is found within a prefix shorter
than `auditSearchDepth`. The slowest crossing in the audited range is `n = 27`, whose first
contracting prefix has length `59`; `62` gives working room while staying kernel-fast. -/
def auditSearchDepth : Nat := 62

set_option maxRecDepth 4000 in
/-- The bounded, decidable core of the audit: every `n` below `auditBound` and above `2` has
*some* contracting prefix of length below `auditSearchDepth`. Kernel-checked by `decide` — a
finite computation the Lean kernel itself performs and certifies, with no external trust and
no `sorry`/`axiom`/`native_decide` involved. -/
theorem everyNonterminalContracts_below_bounded :
    ∀ n, n < auditBound → 2 < n →
      ∃ k, k < auditSearchDepth ∧ CoeffContracting (parityWord n k) := by
  decide

/-- The finite-audit witness, stated in the exact shape of the open frontier hypotheses
`EveryNonterminalContracts` / `NoPositiveInfiniteBarrierStream` (`∃ k, CoeffContracting
(parityWord n k)`, no depth bound in the statement): every seed `n` with `2 < n < auditBound`
realizes a finite coefficient crossing. This is exactly `EveryNonterminalContracts` restricted
to the finite range `n < auditBound`, proved by the Lean kernel rather than asserted; it is the
frontier's first Lean-internal finite-audit witness, playing for the crossing/no-stream
frontier the role `scripts/collatz-parent-gap-audit.py` plays (externally) for the parent-gap
frontier. -/
theorem everyNonterminalContracts_below (n : Nat) (hn : 2 < n) (hN : n < auditBound) :
    ∃ k, CoeffContracting (parityWord n k) := by
  obtain ⟨k, _, hk⟩ := everyNonterminalContracts_below_bounded n hN hn
  exact ⟨k, hk⟩

/-- An infinite coefficient-barrier stream cannot already realize a
parent-barrier first-passage cylinder: such a cylinder is contracting at its
last letter. -/
theorem infiniteBarrierStream_excludes_parentBarrierCylinder {n : Nat}
    (hbar : InfiniteBarrierStream n) {p : List Branch}
    (hp : ParentBarrier p)
    (hword : parityWord n ((p ++ [Branch.E]).length) = p ++ [Branch.E]) :
    False := by
  have hfp : FirstPassageWord (p ++ [Branch.E]) :=
    (firstPassage_append_E_iff_parentBarrier p).mpr hp
  have hcontract := hfp.1
  have hnon := hbar ((p ++ [Branch.E]).length)
  rw [hword] at hnon
  unfold CoeffContracting at hcontract
  unfold CoeffNoncontracting at hnon
  omega

/-- Every positive infinite barrier stream is automatically cylinder-avoiding:
realizing a parent-barrier cylinder would give a finite contracting prefix. -/
theorem cylinderAvoidingBarrierStream_of_infinite {n : Nat}
    (hn : 2 < n) (hbar : InfiniteBarrierStream n) :
    CylinderAvoidingBarrierStream n := by
  refine ⟨hn, hbar, ?_⟩
  intro p hp hword
  exact infiniteBarrierStream_excludes_parentBarrierCylinder hbar hp hword

/-- Cylinder-avoiding barrier streams are exactly positive infinite barrier streams.
The cylinder-avoidance clause is a proved consequence, not an additional hypothesis. -/
theorem cylinderAvoidingBarrierStream_iff_positive_infiniteBarrierStream (n : Nat) :
    CylinderAvoidingBarrierStream n ↔ 2 < n ∧ InfiniteBarrierStream n := by
  constructor
  · intro h
    exact ⟨h.1, h.2.1⟩
  · intro h
    exact cylinderAvoidingBarrierStream_of_infinite h.1 h.2

/-- The same pointwise frontier written with an explicit negated parent-cylinder
existential. -/
theorem cylinderAvoidingBarrierStream_iff_infinite_and_no_parentCylinder (n : Nat) :
    CylinderAvoidingBarrierStream n ↔
      2 < n ∧ InfiniteBarrierStream n ∧
        ¬ ∃ p : List Branch,
          ParentBarrier p ∧
            parityWord n ((p ++ [Branch.E]).length) = p ++ [Branch.E] := by
  constructor
  · intro h
    refine ⟨h.1, h.2.1, ?_⟩
    rintro ⟨p, hp, hword⟩
    exact h.2.2 p hp hword
  · intro h
    refine ⟨h.1, h.2.1, ?_⟩
    intro p hp hword
    exact h.2.2 ⟨p, hp, hword⟩

/-- A cylinder-avoiding stream is a pointwise refutation of the no-positive-stream
frontier. -/
theorem cylinderAvoidingBarrierStream_excludes_noPositiveInfiniteBarrierStream {n : Nat}
    (havoid : CylinderAvoidingBarrierStream n) :
    ¬ NoPositiveInfiniteBarrierStream := by
  intro hno
  obtain ⟨k, hk⟩ := hno n havoid.1
  have hnon := havoid.2.1 k
  unfold CoeffContracting at hk
  unfold CoeffNoncontracting at hnon
  omega

/-- The no-positive-stream frontier excludes all cylinder-avoiding streams. -/
theorem noPositiveInfiniteBarrierStream_excludes_cylinderAvoiding :
    NoPositiveInfiniteBarrierStream → ¬ ∃ n, CylinderAvoidingBarrierStream n := by
  intro hno
  rintro ⟨n, havoid⟩
  exact cylinderAvoidingBarrierStream_excludes_noPositiveInfiniteBarrierStream havoid hno

/-- Absence of cylinder-avoiding streams is exactly double-negated finite
coefficient contraction at every positive seed. Turning this into
`NoPositiveInfiniteBarrierStream` is the remaining witness-producing step. -/
theorem no_cylinderAvoidingBarrierStream_iff_not_not_contractingPrefix :
    (¬ ∃ n, CylinderAvoidingBarrierStream n) ↔
      ∀ n, 2 < n → ¬¬ ∃ k, CoeffContracting (parityWord n k) := by
  constructor
  · intro havoid n hn hnot
    have hbar : InfiniteBarrierStream n := by
      intro k
      have hk : ¬ CoeffContracting (parityWord n k) := by
        intro hcontract
        exact hnot ⟨k, hcontract⟩
      unfold CoeffContracting at hk
      unfold CoeffNoncontracting
      omega
    exact havoid ⟨n, cylinderAvoidingBarrierStream_of_infinite hn hbar⟩
  · intro hnn
    rintro ⟨n, havoid⟩
    exact hnn n havoid.1 (fun hcontract => by
      obtain ⟨k, hk⟩ := hcontract
      have hnon := havoid.2.1 k
      unfold CoeffContracting at hk
      unfold CoeffNoncontracting at hnon
      omega)

/-- Finite parent-barrier cylinder extraction excludes cylinder-avoiding barrier
streams. -/
theorem everyNonterminalHasParentBarrierCylinder_excludes_cylinderAvoiding :
    EveryNonterminalHasParentBarrierCylinder → ¬ ∃ n, CylinderAvoidingBarrierStream n :=
  noPositiveInfiniteBarrierStream_excludes_cylinderAvoiding ∘
    everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream.mp

/-- **The purl: a descending step is a contracting step.** Because the offset `C ≥ 0`, the
surplus `A·n + C − B·n` can only be negative when the coefficient has already crossed (`A < B`).
So descent forces the crossing — the crossing is the back-side of the same stitch. -/
theorem contracting_of_descent {n k : Nat} (hlt : orbit n k < n) :
    CoeffContracting (parityWord n k) := by
  rw [descent_iff_coeff] at hlt
  unfold CoeffContracting
  rcases Nat.lt_or_ge (traceOfWord (parityWord n k)).A (traceOfWord (parityWord n k)).B with h | h
  · exact h
  · exfalso; have := Nat.mul_le_mul_right n h; omega

/-- Hence universal descent below self contains the crossing hypothesis. This is the
backward direction only: it explains why crossing is automatic after descent is known,
not how to obtain the first-passage word needed by the forward gap reduction. -/
theorem everyNonterminalContracts_of_allFallBelow
    (h : ∀ n, 2 < n → FallsBelowSelf n) : EveryNonterminalContracts := by
  intro n hn
  obtain ⟨k, hk⟩ := h n hn
  exact ⟨k, contracting_of_descent hk⟩

/-! ## Descent of the terminal-adjacent cylinders -/

/-- The cylinder `[E]` descends for `n > 2`: an even seed halves. -/
theorem firstPassage_E_descends {n : Nat}
    (hword : parityWord n ([Branch.E].length) = [Branch.E]) (hn : 2 < n) :
    orbit n ([Branch.E].length) < n := by
  change parityWord n 1 = [Branch.E] at hword
  change step n < n
  rw [parityWord_one] at hword
  injection hword with hb _
  have hev : n % 2 = 0 := by
    rcases (by omega : n % 2 = 0 ∨ n % 2 = 1) with h | h
    · exact h
    · rw [branch_odd (by omega)] at hb; exact absurd hb (by decide)
  unfold step; rw [if_pos hev]; omega

/-- The cylinder `[O,E]` descends for `n > 2`: `4·T²(n) = 3n+1 < 4n`. -/
theorem firstPassage_OE_descends {n : Nat}
    (hword : parityWord n ([Branch.O, Branch.E].length) = [Branch.O, Branch.E])
    (hn : 2 < n) :
    orbit n ([Branch.O, Branch.E].length) < n := by
  change parityWord n 2 = [Branch.O, Branch.E] at hword
  change step (step n) < n
  rw [parityWord_two] at hword
  injection hword with hb1 htl
  injection htl with hb2 _
  have hodd : n % 2 ≠ 0 := by
    rcases (by omega : n % 2 = 0 ∨ n % 2 = 1) with h | h
    · rw [branch_even h] at hb1; exact absurd hb1 (by decide)
    · omega
  have hev : step n % 2 = 0 := by
    rcases (by omega : step n % 2 = 0 ∨ step n % 2 = 1) with h | h
    · exact h
    · rw [branch_odd (by omega)] at hb2; exact absurd hb2 (by decide)
  have e1 : 2 * step n = 3 * n + 1 := step_odd_eq hodd
  have e2 : 2 * step (step n) = step n := step_even_eq hev
  omega

/-! ## The full first-passage descent -/

/-- Under the gap, every first-passage cylinder descends at any realizing `n > 2`. -/
theorem parentBarrierGap_implies_all_firstPassage_descent (hgap : ParentBarrierGap)
    (w : List Branch) (n : Nat) (hfp : FirstPassageWord w)
    (hword : parityWord n w.length = w) (hn : 2 < n) :
    orbit n w.length < n := by
  have hne : w ≠ [] := by
    intro h; subst h
    have hc := hfp.1; unfold CoeffContracting at hc; simp [trace_empty, identityTrace] at hc
  obtain ⟨p, rfl⟩ := firstPassage_last_E hfp hne
  by_cases htriv : p = [] ∨ p = [Branch.O]
  · rcases htriv with rfl | rfl
    · exact firstPassage_E_descends hword hn
    · exact firstPassage_OE_descends hword hn
  · have hpb : ParentBarrier p := (firstPassage_append_E_iff_parentBarrier p).mp hfp
    exact parentBarrierGap_implies_firstPassageDescent hgap p n hpb htriv hword hn

/-! ## The conditional reduction -/

/-- Universal descent below self follows from the gap and the crossing hypothesis. -/
theorem allFallBelow_of_gap_and_crossing
    (hgap : ParentBarrierGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 2 < n → FallsBelowSelf n := by
  intro n hn
  obtain ⟨k, hk⟩ := hcross n hn
  have hfp : FirstPassageWord (parityWord n k) := firstCoeffCrossing_word_is_firstPassage hk
  have hword : parityWord n (parityWord n k).length = parityWord n k := by
    rw [parityWord_length]
  refine ⟨k, ?_⟩
  have hdesc := parentBarrierGap_implies_all_firstPassage_descent hgap
    (parityWord n k) n hfp hword hn
  rwa [parityWord_length] at hdesc

/-- **Conditional reduction.** The parent-barrier gap and the coefficient-crossing
hypothesis imply accelerated Collatz termination. -/
theorem collatz_from_parentBarrierGap_and_crossing
    (hgap : ParentBarrierGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 0 < n → ReachesTerminal n :=
  reachesTerminal_of_all_fall_below (allFallBelow_of_gap_and_crossing hgap hcross)

/-! ## The residue-gap conditional reduction -/

/-- Universal descent below self follows from the residue inequality and the crossing
hypothesis. -/
theorem allFallBelow_of_residueGap_and_crossing
    (hres : ParentBarrierResidueGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_gap_and_crossing
    (parentBarrierResidueGap_implies_parentBarrierGap hres) hcross

/-- The residue inequality and crossing hypothesis imply accelerated Collatz termination. -/
theorem collatz_from_parentBarrierResidueGap_and_crossing
    (hres : ParentBarrierResidueGap) (hcross : EveryNonterminalHasCrossing) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierGap_and_crossing
    (parentBarrierResidueGap_implies_parentBarrierGap hres) hcross

/-- Universal descent below self follows from the residue inequality and the absence
of positive infinite barrier streams. -/
theorem allFallBelow_of_residueGap_and_noPositiveInfiniteBarrierStream
    (hres : ParentBarrierResidueGap) (hbar : NoPositiveInfiniteBarrierStream) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_residueGap_and_crossing hres
    (everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr hbar)

/-- The residue inequality and absence of positive infinite barrier streams imply
accelerated Collatz termination. -/
theorem collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream
    (hres : ParentBarrierResidueGap) (hbar : NoPositiveInfiniteBarrierStream) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_crossing hres
    (everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr hbar)

/-! ## The exact remaining obstruction after the residue gap -/

/-- Accelerated termination forces the no-positive-infinite-barrier-stream condition:
if every positive seed reaches the terminal cycle, then every `n > 2` has a finite
contracting prefix. -/
theorem noPositiveInfiniteBarrierStream_of_acceleratedCollatz
    (hterm : ∀ n, 0 < n → ReachesTerminal n) : NoPositiveInfiniteBarrierStream := by
  intro n hn
  obtain ⟨k, hk⟩ := hterm n (by omega)
  have hlt : orbit n k < n := by
    rcases hk with h1 | h2 <;> omega
  exact ⟨k, contracting_of_descent hlt⟩

/-- Once the parent-barrier residue inequality is supplied, accelerated Collatz is
equivalent to the absence of positive infinite barrier streams. Thus the residue gap
removes the semigroup obstruction, but the infinite-barrier obstruction remains an
exact separate frontier. -/
theorem acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_residueGap
    (hres : ParentBarrierResidueGap) :
    (∀ n, 0 < n → ReachesTerminal n) ↔ NoPositiveInfiniteBarrierStream := by
  constructor
  · exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
  · exact collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream hres

/-! ## Packaged frontier inputs -/

/-- The two-frontier package for the current Collatz reduction: the modular
parent-barrier residue inequality, and the absence of positive infinite coefficient
barrier streams. -/
structure CollatzFrontierInputs : Prop where
  /-- The arithmetic frontier: for every nontrivial parent barrier, the residue
  satisfies the modular inequality `C < D·r`. -/
  residueGap : ParentBarrierResidueGap
  /-- The dynamical frontier: no positive nonterminal seed carries an infinite
  coefficient-noncontracting barrier stream. -/
  noPositiveInfiniteBarrierStream : NoPositiveInfiniteBarrierStream

/-- The packaged frontier inputs exclude cylinder-avoiding barrier streams. -/
theorem frontierInputs_excludes_cylinderAvoidingBarrierStream
    (h : CollatzFrontierInputs) : ¬ ∃ n, CylinderAvoidingBarrierStream n :=
  noPositiveInfiniteBarrierStream_excludes_cylinderAvoiding
    h.noPositiveInfiniteBarrierStream

/-- The packaged frontier inputs give universal descent below self. -/
theorem allFallBelow_of_frontierInputs (h : CollatzFrontierInputs) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_residueGap_and_noPositiveInfiniteBarrierStream h.residueGap
    h.noPositiveInfiniteBarrierStream

/-- The packaged frontier inputs imply accelerated Collatz termination. -/
theorem collatz_from_frontierInputs (h : CollatzFrontierInputs) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream h.residueGap
    h.noPositiveInfiniteBarrierStream

/-- Exactness of the packaged frontier: giving the residue gap and the no-stream
frontier is equivalent to giving the residue gap and accelerated Collatz termination.
The forward direction is the green reduction; the reverse direction uses the fact
that termination itself forces no positive infinite barrier stream. -/
theorem frontierInputs_iff_residueGap_and_acceleratedCollatz :
    CollatzFrontierInputs ↔
      ParentBarrierResidueGap ∧ (∀ n, 0 < n → ReachesTerminal n) := by
  constructor
  · intro h
    exact ⟨h.residueGap, collatz_from_frontierInputs h⟩
  · rintro ⟨hres, hterm⟩
    exact ⟨hres, noPositiveInfiniteBarrierStream_of_acceleratedCollatz hterm⟩

/-- If the modular residue gap itself rules out positive infinite barrier streams,
then the two-frontier package collapses to the single modular residue gap.
Conversely, any such collapse gives the no-stream consequence. This is the precise
frontier-package form of the desired one-hole reduction. -/
theorem frontierInputs_iff_residueGap_of_residueGap_implies_noStream :
    (ParentBarrierResidueGap → NoPositiveInfiniteBarrierStream) ↔
      (CollatzFrontierInputs ↔ ParentBarrierResidueGap) := by
  constructor
  · intro hbar
    constructor
    · intro h
      exact h.residueGap
    · intro hres
      exact ⟨hres, hbar hres⟩
  · intro hcollapse hres
    exact (hcollapse.mpr hres).noPositiveInfiniteBarrierStream

/-- The same frontier-package collapse stated at the original semigroup face:
the two-frontier package collapses to `ParentBarrierGap` exactly when
that semigroup gap rules out positive infinite barrier streams. -/
theorem frontierInputs_iff_parentBarrierGap_of_parentBarrierGap_implies_noStream :
    (ParentBarrierGap → NoPositiveInfiniteBarrierStream) ↔
      (CollatzFrontierInputs ↔ ParentBarrierGap) := by
  constructor
  · intro hbar
    constructor
    · intro h
      exact parentBarrierResidueGap_implies_parentBarrierGap h.residueGap
    · intro hgap
      exact ⟨parentBarrierGap_implies_parentBarrierResidueGap hgap, hbar hgap⟩
  · intro hcollapse hgap
    exact (hcollapse.mpr hgap).noPositiveInfiniteBarrierStream

/-- The named one-lock collapse proposition: the original parent-barrier semigroup
gap rules out positive infinite barrier streams. If this proposition is proved,
then the two-frontier package is equivalent to the single semigroup gap
`ParentBarrierGap`; via `ResidueGap`, this is the modular inequality
`C < D·r`. -/
def ParentBarrierOneLockCollapse : Prop :=
  ParentBarrierGap → NoPositiveInfiniteBarrierStream

/-- The named one-lock collapse proposition is exactly the package-level collapse
of `CollatzFrontierInputs` to the original parent-barrier semigroup gap. -/
theorem parentBarrierOneLockCollapse_iff_frontierInputs_parentBarrierGap :
    ParentBarrierOneLockCollapse ↔ (CollatzFrontierInputs ↔ ParentBarrierGap) :=
  frontierInputs_iff_parentBarrierGap_of_parentBarrierGap_implies_noStream

/-- The named one-lock collapse proposition is equivalently the corresponding
package-level collapse to the modular residue gap `C < D·r`. -/
theorem parentBarrierOneLockCollapse_iff_frontierInputs_residueGap :
    ParentBarrierOneLockCollapse ↔ (CollatzFrontierInputs ↔ ParentBarrierResidueGap) := by
  rw [parentBarrierOneLockCollapse_iff_frontierInputs_parentBarrierGap]
  constructor
  · intro hcollapse
    constructor
    · intro h
      exact h.residueGap
    · intro hres
      exact hcollapse.mpr (parentBarrierResidueGap_implies_parentBarrierGap hres)
  · intro hcollapse
    constructor
    · intro h
      exact parentBarrierResidueGap_implies_parentBarrierGap h.residueGap
    · intro hgap
      exact hcollapse.mpr (parentBarrierGap_implies_parentBarrierResidueGap hgap)

/-- The two-frontier package is exactly the parent-barrier gap together
with the named one-lock implication. -/
theorem frontierInputs_iff_parentBarrierGap_and_oneLock :
    CollatzFrontierInputs ↔ ParentBarrierGap ∧ ParentBarrierOneLockCollapse := by
  constructor
  · intro h
    exact ⟨parentBarrierResidueGap_implies_parentBarrierGap h.residueGap,
      fun _ => h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨hgap, hlock⟩
    exact ⟨parentBarrierGap_implies_parentBarrierResidueGap hgap, hlock hgap⟩

/-- The two-frontier package is equivalently the residue gap together
with the named one-lock implication. -/
theorem frontierInputs_iff_residueGap_and_oneLock :
    CollatzFrontierInputs ↔ ParentBarrierResidueGap ∧ ParentBarrierOneLockCollapse := by
  constructor
  · intro h
    exact ⟨h.residueGap, fun _ => h.noPositiveInfiniteBarrierStream⟩
  · rintro ⟨hres, hlock⟩
    exact ⟨hres, hlock (parentBarrierResidueGap_implies_parentBarrierGap hres)⟩

/-- The semigroup gap plus the named one-lock collapse gives the no-stream input. -/
theorem noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    NoPositiveInfiniteBarrierStream :=
  hlock hgap

/-- The semigroup gap plus the named one-lock collapse gives the crossing input. -/
theorem everyNonterminalHasCrossing_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    EveryNonterminalHasCrossing :=
  everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr
    (noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock hgap hlock)

/-- The semigroup gap plus the named one-lock collapse gives bare eventual contraction. -/
theorem everyNonterminalContracts_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    EveryNonterminalContracts :=
  everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
    (noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock hgap hlock)

/-- The semigroup gap plus the named one-lock collapse gives universal descent below self. -/
theorem allFallBelow_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_gap_and_crossing hgap
    (everyNonterminalHasCrossing_of_parentBarrierGap_and_oneLock hgap hlock)

/-- The semigroup gap plus the named one-lock collapse gives accelerated termination. -/
theorem collatz_from_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierGap_and_crossing hgap
    (everyNonterminalHasCrossing_of_parentBarrierGap_and_oneLock hgap hlock)

/-- The residue gap plus the named one-lock collapse gives the no-stream input. -/
theorem noPositiveInfiniteBarrierStream_of_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse) :
    NoPositiveInfiniteBarrierStream :=
  noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock
    (parentBarrierResidueGap_implies_parentBarrierGap hres) hlock

/-- The residue gap plus the named one-lock collapse gives universal descent below self. -/
theorem allFallBelow_of_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ n, 2 < n → FallsBelowSelf n :=
  allFallBelow_of_residueGap_and_noPositiveInfiniteBarrierStream hres
    (noPositiveInfiniteBarrierStream_of_residueGap_and_oneLock hres hlock)

/-- The residue gap plus the named one-lock collapse gives accelerated termination. -/
theorem collatz_from_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ n, 0 < n → ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream hres
    (noPositiveInfiniteBarrierStream_of_residueGap_and_oneLock hres hlock)

/-- A one-frontier reduction to the modular residue gap alone is equivalent to
deriving the no-positive-infinite-barrier-stream condition from that same residue
gap. This is the formal obstruction to claiming that the residue inequality by
itself solves the current Collatz frontier. -/
theorem residueGap_alone_solves_collatz_iff_residueGap_implies_noStream :
    (ParentBarrierResidueGap → ∀ n, 0 < n → ReachesTerminal n) ↔
      (ParentBarrierResidueGap → NoPositiveInfiniteBarrierStream) := by
  constructor
  · intro hterm hres
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz (hterm hres)
  · intro hbar hres
    exact collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream
      hres (hbar hres)

/-- A one-frontier reduction to the original parent-barrier semigroup gap alone is
equivalent to deriving the no-positive-infinite-barrier-stream condition from that
same semigroup gap. -/
theorem parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_noStream :
    (ParentBarrierGap → ∀ n, 0 < n → ReachesTerminal n) ↔
      (ParentBarrierGap → NoPositiveInfiniteBarrierStream) := by
  constructor
  · intro hterm hgap
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz (hterm hgap)
  · intro hbar hgap
    exact collatz_from_parentBarrierGap_and_crossing hgap
      (everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr
        (hbar hgap))

/-- The named one-lock collapse proposition is exactly the statement that
`ParentBarrierGap` alone implies accelerated Collatz termination. -/
theorem parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_collatz :
    ParentBarrierOneLockCollapse ↔
      (ParentBarrierGap → ∀ n, 0 < n → ReachesTerminal n) :=
  (parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_noStream).symm

/-- A one-frontier reduction to the modular residue gap alone is equivalently a proof
that the same residue gap forces bare eventual coefficient contraction for every
nonterminal seed. This is the form targeted by residue-tree or inverse-thread attacks. -/
theorem residueGap_alone_solves_collatz_iff_residueGap_implies_everyNonterminalContracts :
    (ParentBarrierResidueGap → ∀ n, 0 < n → ReachesTerminal n) ↔
      (ParentBarrierResidueGap → EveryNonterminalContracts) := by
  constructor
  · intro hterm hres
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
      (noPositiveInfiniteBarrierStream_of_acceleratedCollatz (hterm hres))
  · intro hcontracts hres
    exact collatz_from_parentBarrierResidueGap_and_crossing hres
      (everyNonterminalContracts_implies_crossing (hcontracts hres))

/-- Equivalently, a one-frontier reduction to the original semigroup gap alone is
a proof that the same semigroup gap forces bare eventual coefficient contraction. -/
theorem parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_everyNonterminalContracts :
    (ParentBarrierGap → ∀ n, 0 < n → ReachesTerminal n) ↔
      (ParentBarrierGap → EveryNonterminalContracts) := by
  constructor
  · intro hterm hgap
    exact everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream.mpr
      (noPositiveInfiniteBarrierStream_of_acceleratedCollatz (hterm hgap))
  · intro hcontracts hgap
    exact collatz_from_parentBarrierGap_and_crossing hgap
      (everyNonterminalContracts_implies_crossing (hcontracts hgap))

end Collatz
end Closure
end Obsmetrologia
