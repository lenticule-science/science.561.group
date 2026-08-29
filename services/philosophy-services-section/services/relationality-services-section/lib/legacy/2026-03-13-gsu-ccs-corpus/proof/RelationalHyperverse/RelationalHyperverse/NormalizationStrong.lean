import RelationalHyperverse.Normalization
import RelationalHyperverse.NuclearReductionMeasure

-- Establishes: strong-normalization

/-!
# NormalizationStrong: strong normalization of Proposition₀

Corresponds to `math/strong-normalization.md`.

## Termination measure

The combined lex measure `(nuclearW M, entanglement M)` proves full SN:

- **`nuclearW M`** (polynomial weight): `Saturate M` and `Transfer M` each get weight `2 * nuclearW M`;
  connectives are additive. This makes R3/R4 each strictly decrease `nuclearW` by 1:
  - R3: `nuclearW(Saturate(conj M N)) = 2*(nuclearW M + nuclearW N + 1)` > `nuclearW(conj(Saturate M)(Saturate N))`.
  - R4: analogous with `Transfer`.
- **`entanglement M`** (Saturate-inside-Transfer nesting degree): strictly decreases under R7
  and all its congruence closures, exactly when `nuclearW` is preserved.
- All other rules (R1,R2,R5,R6,R8–R19') strictly decrease `nuclearW`.

Earlier: an auxiliary measure `totalMeasure = modalCount + entanglement + transferCount`
is also proved to decrease under `StepNonR3R4`, as a standalone partial-SN result.

## Main definitions
- `Proposition.modalCount M` : total `Saturate`/`Transfer` occurrences
- `Proposition.transferCount M` : `Transfer` occurrences (auxiliary)
- `Proposition.entanglementAux M sd` : entanglement with `sd` Saturate-ancestors from context
- `Proposition.entanglement M` : e(M) = entanglementAux M 0
- `Proposition.nuclearW M` : polynomial weight (private)

## Main results (all sorry-free)
- `Proposition.entanglement_R7` : entanglement strictly decreases under R7
- `Proposition.strongNormalization_non_R3R4` : partial SN for all non-R3/R4 rules
- `Proposition.strongNormalization` : full SN via `(nuclearW, entanglement)` lex measure
-/

namespace Proposition

universe u

variable {V : Type u}

-- (measure definitions: modalCount, transferCount, entanglement, nuclearW — see NuclearReductionMeasure.lean)

-- ── Modal count decreases for rules other than R3/R4 ─────────────────────────

/-- R1 decreases modal count. -/
theorem modalCount_R1 (M : Proposition V) :
    modalCount (Saturate M) < modalCount (Saturate (Saturate M)) := by
  simp [modalCount]

/-- R2 decreases modal count. -/
theorem modalCount_R2 (M : Proposition V) :
    modalCount (Transfer M) < modalCount (Transfer (Transfer M)) := by
  simp [modalCount]

theorem modalCount_R5 : (0 : ℕ) < modalCount (Saturate (top (V := V))) := by
  simp [modalCount]

theorem modalCount_R6 : (0 : ℕ) < modalCount (Transfer (top (V := V))) := by
  simp [modalCount]

/-- R8 decreases modal count. -/
theorem modalCount_R8 (M N : Proposition V) :
    modalCount (Saturate (disj M N)) < modalCount (Saturate (disj (Saturate M) N)) := by
  simp [modalCount]

/-- R9 decreases modal count. -/
theorem modalCount_R9 (M N : Proposition V) :
    modalCount (Saturate (disj M N)) < modalCount (Saturate (disj M (Saturate N))) := by
  simp [modalCount]

/-- R10 decreases modal count. -/
theorem modalCount_R10 (M N : Proposition V) :
    modalCount (Transfer (disj M N)) < modalCount (Transfer (disj (Transfer M) N)) := by
  simp [modalCount]

/-- R11 decreases modal count. -/
theorem modalCount_R11 (M N : Proposition V) :
    modalCount (Transfer (disj M N)) < modalCount (Transfer (disj M (Transfer N))) := by
  simp [modalCount]

/-- R12 decreases modal count. -/
theorem modalCount_R12 (M N : Proposition V) :
    modalCount (Saturate (disj (Transfer M) N)) < modalCount (Saturate (disj (Transfer (Saturate M)) N)) := by
  simp [modalCount]

/-- R13 decreases modal count. -/
theorem modalCount_R13 (M N : Proposition V) :
    modalCount (Saturate (disj M (Transfer N))) < modalCount (Saturate (disj M (Transfer (Saturate N)))) := by
  simp [modalCount]

/-- R12s decreases modal count. -/
theorem modalCount_R12s (M N : Proposition V) :
    modalCount (Transfer (disj (Saturate M) N)) < modalCount (Transfer (disj (Saturate (Transfer M)) N)) := by
  simp [modalCount]

/-- R13s decreases modal count. -/
theorem modalCount_R13s (M N : Proposition V) :
    modalCount (Transfer (disj M (Saturate N))) < modalCount (Transfer (disj M (Saturate (Transfer N)))) := by
  simp [modalCount]

/-- R14 decreases modal count by 2. -/
theorem modalCount_R14 (M N P : Proposition V) :
    modalCount (Saturate (disj (conj M N) P)) < modalCount (Saturate (disj (conj (Saturate M) (Saturate N)) P)) := by
  simp [modalCount]; omega

/-- R15 decreases modal count by 2. -/
theorem modalCount_R15 (M N P : Proposition V) :
    modalCount (Saturate (disj P (conj M N))) < modalCount (Saturate (disj P (conj (Saturate M) (Saturate N)))) := by
  simp [modalCount]; omega

/-- R16 decreases modal count by 2. -/
theorem modalCount_R16 (M N P : Proposition V) :
    modalCount (Transfer (disj (conj M N) P)) < modalCount (Transfer (disj (conj (Transfer M) (Transfer N)) P)) := by
  simp [modalCount]; omega

/-- R17 decreases modal count by 2. -/
theorem modalCount_R17 (M N P : Proposition V) :
    modalCount (Transfer (disj P (conj M N))) < modalCount (Transfer (disj P (conj (Transfer M) (Transfer N)))) := by
  simp [modalCount]; omega

/-- R18 decreases modal count by 2. -/
theorem modalCount_R18 (M N P : Proposition V) :
    modalCount (Saturate (disj (conj (Transfer M) (Transfer N)) P)) <
    modalCount (Saturate (disj (conj (Transfer (Saturate M)) (Transfer (Saturate N))) P)) := by
  simp [modalCount]; omega

/-- R18' decreases modal count by 2. -/
theorem modalCount_R18' (M N P : Proposition V) :
    modalCount (Saturate (disj P (conj (Transfer M) (Transfer N)))) <
    modalCount (Saturate (disj P (conj (Transfer (Saturate M)) (Transfer (Saturate N))))) := by
  simp [modalCount]; omega

/-- R19 decreases modal count by 2. -/
theorem modalCount_R19 (M N P : Proposition V) :
    modalCount (Transfer (disj (conj (Saturate M) (Saturate N)) P)) <
    modalCount (Transfer (disj (conj (Saturate (Transfer M)) (Saturate (Transfer N))) P)) := by
  simp [modalCount]; omega

/-- R19' decreases modal count by 2. -/
theorem modalCount_R19' (M N P : Proposition V) :
    modalCount (Transfer (disj P (conj (Saturate M) (Saturate N)))) <
    modalCount (Transfer (disj P (conj (Saturate (Transfer M)) (Saturate (Transfer N))))) := by
  simp [modalCount]; omega

-- ── transferCount behavior under R3/R4 ────────────────────────────────────────────

/-- transferCount is preserved under R3: Saturate does not add to transferCount. -/
theorem ktrCount_R3 (M N : Proposition V) :
    transferCount (Saturate (conj M N)) = transferCount (conj (Saturate M) (Saturate N)) := by
  simp [transferCount]

/-- R4 increases transferCount by 1: Transfer(conj M N) → conj(Transfer M)(Transfer N)
    adds one Transfer occurrence on each side. -/
theorem ktrCount_R4 (M N : Proposition V) :
    transferCount (conj (Transfer M) (Transfer N)) = transferCount (Transfer (conj M N)) + 1 := by
  simp [transferCount]; omega

/-- Key monotonicity fact: if transferCount M = transferCount N, then entanglementAux
    preserves the difference at every Saturate-depth.
    (Uses entanglementAux_add_sd: entanglementAux M sd = entanglementAux M 0 + transferCount M * sd.)
    This is the key property enabling (e, m) to be context-monotone for non-R4 steps. -/
theorem entanglementAux_ktrCount_eq {M N : Proposition V} (sd : ℕ)
    (hk : transferCount M = transferCount N)
    (he0 : entanglementAux M 0 ≥ entanglementAux N 0) :
    entanglementAux M sd ≥ entanglementAux N sd := by
  have hM := entanglementAux_add_sd M 0 sd
  have hN := entanglementAux_add_sd N 0 sd
  simp only [Nat.zero_add] at hM hN
  rw [hM, hN, hk]
  exact Nat.add_le_add_right he0 _

-- ── Partial SN: all rules except R3/R4 ───────────────────────────────────────

/-- The reduction relation with R3 and R4 removed entirely (including from congruence
    closures). Every `StepNonR3R4` step is provably terminating. -/
inductive StepNonR3R4 {V : Type u} : Proposition V → Proposition V → Prop where
  | R1  (M : Proposition V)               : StepNonR3R4 (Saturate (Saturate M))  (Saturate M)
  | R2  (M : Proposition V)               : StepNonR3R4 (Transfer (Transfer M))  (Transfer M)
  | R5                             : StepNonR3R4 (Saturate top)      (top (V := V))
  | R6                             : StepNonR3R4 (Transfer top)      (top (V := V))
  | R7  (M : Proposition V)               : StepNonR3R4 (Saturate (Transfer M))  (Transfer (Saturate M))
  | R8  (M N : Proposition V)             : StepNonR3R4 (Saturate (disj (Saturate M)       N))  (Saturate (disj M N))
  | R9  (M N : Proposition V)             : StepNonR3R4 (Saturate (disj M       (Saturate N)))  (Saturate (disj M N))
  | R10 (M N : Proposition V)             : StepNonR3R4 (Transfer (disj (Transfer M)       N))  (Transfer (disj M N))
  | R11 (M N : Proposition V)             : StepNonR3R4 (Transfer (disj M       (Transfer N)))  (Transfer (disj M N))
  | R12  (M N : Proposition V)            : StepNonR3R4 (Saturate (disj (Transfer (Saturate M)) N))  (Saturate (disj (Transfer M) N))
  | R13  (M N : Proposition V)            : StepNonR3R4 (Saturate (disj M (Transfer (Saturate N))))  (Saturate (disj M (Transfer N)))
  | R12s (M N : Proposition V)            : StepNonR3R4 (Transfer (disj (Saturate (Transfer M)) N))  (Transfer (disj (Saturate M) N))
  | R13s (M N : Proposition V)            : StepNonR3R4 (Transfer (disj M (Saturate (Transfer N))))  (Transfer (disj M (Saturate N)))
  | R14  (M N P : Proposition V)          : StepNonR3R4 (Saturate (disj (conj (Saturate M) (Saturate N)) P))
                                                 (Saturate (disj (conj M N) P))
  | R15  (M N P : Proposition V)          : StepNonR3R4 (Saturate (disj P (conj (Saturate M) (Saturate N))))
                                                 (Saturate (disj P (conj M N)))
  | R16  (M N P : Proposition V)          : StepNonR3R4 (Transfer (disj (conj (Transfer M) (Transfer N)) P))
                                                 (Transfer (disj (conj M N) P))
  | R17  (M N P : Proposition V)          : StepNonR3R4 (Transfer (disj P (conj (Transfer M) (Transfer N))))
                                                 (Transfer (disj P (conj M N)))
  | R18  (M N P : Proposition V)          : StepNonR3R4 (Saturate (disj (conj (Transfer (Saturate M)) (Transfer (Saturate N))) P))
                                                 (Saturate (disj (conj (Transfer M) (Transfer N)) P))
  | R18' (M N P : Proposition V)          : StepNonR3R4 (Saturate (disj P (conj (Transfer (Saturate M)) (Transfer (Saturate N)))))
                                                 (Saturate (disj P (conj (Transfer M) (Transfer N))))
  | R19  (M N P : Proposition V)          : StepNonR3R4 (Transfer (disj (conj (Saturate (Transfer M)) (Saturate (Transfer N))) P))
                                                 (Transfer (disj (conj (Saturate M) (Saturate N)) P))
  | R19' (M N P : Proposition V)          : StepNonR3R4 (Transfer (disj P (conj (Saturate (Transfer M)) (Saturate (Transfer N)))))
                                                 (Transfer (disj P (conj (Saturate M) (Saturate N))))
  | saturate_step   {M N : Proposition V} : StepNonR3R4 M N → StepNonR3R4 (Saturate M)    (Saturate N)
  | transfer_step   {M N : Proposition V} : StepNonR3R4 M N → StepNonR3R4 (Transfer M)    (Transfer N)
  | conj_left  {M M' N : Proposition V} : StepNonR3R4 M M' → StepNonR3R4 (conj M N)  (conj M' N)
  | conj_right {M N N' : Proposition V} : StepNonR3R4 N N' → StepNonR3R4 (conj M N)  (conj M N')
  | disj_left  {M M' N : Proposition V} : StepNonR3R4 M M' → StepNonR3R4 (disj M N)  (disj M' N)
  | disj_right {M N N' : Proposition V} : StepNonR3R4 N N' → StepNonR3R4 (disj M N)  (disj M N')
  | impl_left  {M M' N : Proposition V} : StepNonR3R4 M M' → StepNonR3R4 (impl M N)  (impl M' N)
  | impl_right {M N N' : Proposition V} : StepNonR3R4 N N' → StepNonR3R4 (impl M N)  (impl M N')

/-- transferCount is non-increasing under all non-R3/R4 steps.
    (R3 excludes Saturate/Transfer-conj creation; R2/R6/R10-R13s/R18-R19' actively decrease transferCount.) -/
theorem ktrCount_non_R3R4_le {M N : Proposition V} (h : StepNonR3R4 M N) : transferCount N ≤ transferCount M := by
  induction h with
  | R1 M       => simp [transferCount]
  | R2 M       => simp [transferCount]
  | R5         => simp [transferCount]
  | R6         => simp [transferCount]
  | R7 M       => simp [transferCount]
  | R8  M N    => simp [transferCount]
  | R9  M N    => simp [transferCount]
  | R10 M N    => simp [transferCount]
  | R11 M N    => simp [transferCount]
  | R12  M N   => simp [transferCount]
  | R13  M N   => simp [transferCount]
  | R12s M N   => simp [transferCount]
  | R13s M N   => simp [transferCount]
  | R14  M N P => simp [transferCount]
  | R15  M N P => simp [transferCount]
  | R16  M N P => simp [transferCount]; omega
  | R17  M N P => simp [transferCount]; omega
  | R18  M N P => simp [transferCount]
  | R18' M N P => simp [transferCount]
  | R19  M N P => simp [transferCount]; omega
  | R19' M N P => simp [transferCount]; omega
  | saturate_step   _ ih => simp [transferCount]; exact ih
  | transfer_step   _ ih => simp [transferCount]; omega
  | conj_left  _ ih => simp [transferCount]; omega
  | conj_right _ ih => simp [transferCount]; omega
  | disj_left  _ ih => simp [transferCount]; omega
  | disj_right _ ih => simp [transferCount]; omega
  | impl_left  _ ih => simp [transferCount]; omega
  | impl_right _ ih => simp [transferCount]; omega

/-- Combined termination measure for non-R3/R4 steps.
    `totalMeasure M = modalCount M + entanglement M + transferCount M`.

    Key structural equations:
    - `totalMeasure(Saturate X) = totalMeasure X + 1 + transferCount X`
      (Saturate adds 1 to modalCount, adds transferCount X to entanglement, keeps transferCount)
    - `totalMeasure(Transfer X) = totalMeasure X + 2`
      (Transfer adds 1 to modalCount, 0 to entanglement, 1 to transferCount)
    - `totalMeasure(conj/disj/impl X Y) = totalMeasure X + totalMeasure Y`
    - `totalMeasure(var/top/bot) = 0` -/
private def totalMeasure (M : Proposition V) : ℕ := modalCount M + entanglement M + transferCount M

private theorem totalMeasure_sat (M : Proposition V) :
    totalMeasure (Saturate M) = totalMeasure M + 1 + transferCount M := by
  simp [totalMeasure, modalCount, entanglement, entanglementAux_succ_sd, transferCount]
  omega

private theorem totalMeasure_ktr (M : Proposition V) :
    totalMeasure (Transfer M) = totalMeasure M + 2 := by
  simp [totalMeasure, modalCount, entanglement, entanglementAux, transferCount]; omega

private theorem totalMeasure_bin (M N : Proposition V)
    (f : Proposition V → Proposition V → Proposition V)
    (hm : ∀ X Y, modalCount (f X Y) = modalCount X + modalCount Y)
    (he : ∀ X Y, entanglement (f X Y) = entanglement X + entanglement Y)
    (hk : ∀ X Y, transferCount (f X Y) = transferCount X + transferCount Y) :
    totalMeasure (f M N) = totalMeasure M + totalMeasure N := by
  simp [totalMeasure, hm, he, hk]; omega

private theorem totalMeasure_conj (M N : Proposition V) :
    totalMeasure (conj M N) = totalMeasure M + totalMeasure N :=
  totalMeasure_bin M N conj (by simp [modalCount]) (by simp [entanglement, entanglementAux])
    (by simp [transferCount])

private theorem totalMeasure_disj (M N : Proposition V) :
    totalMeasure (disj M N) = totalMeasure M + totalMeasure N :=
  totalMeasure_bin M N disj (by simp [modalCount]) (by simp [entanglement, entanglementAux])
    (by simp [transferCount])

private theorem totalMeasure_impl (M N : Proposition V) :
    totalMeasure (impl M N) = totalMeasure M + totalMeasure N :=
  totalMeasure_bin M N impl (by simp [modalCount]) (by simp [entanglement, entanglementAux])
    (by simp [transferCount])

/-- Every non-R3/R4 step strictly decreases `totalMeasure`. -/
theorem totalMeasure_decrease_non_R3R4 {M N : Proposition V} (h : StepNonR3R4 M N) :
    totalMeasure N < totalMeasure M := by
  induction h with
  | R1 M       => simp only [totalMeasure_sat]; simp only [transferCount]; omega
  | R2 M       => simp [totalMeasure_ktr]
  | R5         => simp [totalMeasure, modalCount, entanglement, entanglementAux, transferCount]
  | R6         => simp [totalMeasure, modalCount, entanglement, entanglementAux, transferCount]
  | R7 M       =>
    simp only [totalMeasure_sat, totalMeasure_ktr]; simp only [transferCount]; omega
  | R8  M N    =>
    simp only [totalMeasure_sat, totalMeasure_disj]
    simp only [transferCount]; omega
  | R9  M N    =>
    simp only [totalMeasure_sat, totalMeasure_disj]
    simp only [transferCount]; omega
  | R10 M N    =>
    simp only [totalMeasure_ktr, totalMeasure_disj]; omega
  | R11 M N    =>
    simp only [totalMeasure_ktr, totalMeasure_disj]; omega
  | R12  M N   =>
    simp only [totalMeasure_sat, totalMeasure_disj, totalMeasure_ktr]
    simp only [transferCount]; omega
  | R13  M N   =>
    simp only [totalMeasure_sat, totalMeasure_disj, totalMeasure_ktr]
    simp only [transferCount]; omega
  | R12s M N   =>
    simp only [totalMeasure_ktr, totalMeasure_disj, totalMeasure_sat]
    simp only [transferCount]; omega
  | R13s M N   =>
    simp only [totalMeasure_ktr, totalMeasure_disj, totalMeasure_sat]
    simp only [transferCount]; omega
  | R14  M N P =>
    simp only [totalMeasure_sat, totalMeasure_disj, totalMeasure_conj]
    simp only [transferCount]; omega
  | R15  M N P =>
    simp only [totalMeasure_sat, totalMeasure_disj, totalMeasure_conj]
    simp only [transferCount]; omega
  | R16  M N P =>
    simp only [totalMeasure_ktr, totalMeasure_disj, totalMeasure_conj]
    have := totalMeasure_ktr M; have := totalMeasure_ktr N; omega
  | R17  M N P =>
    simp only [totalMeasure_ktr, totalMeasure_disj, totalMeasure_conj]
    have := totalMeasure_ktr M; have := totalMeasure_ktr N; omega
  | R18  M N P =>
    -- Saturate(disj(conj(Transfer(Saturate M))(Transfer(Saturate N))) P) → Saturate(disj(conj(Transfer M)(Transfer N)) P)
    -- transferCount same; modalCount drops by 2; entanglement drops by transferCount M + transferCount N
    simp only [totalMeasure_sat, totalMeasure_disj, totalMeasure_conj, totalMeasure_ktr]
    simp only [transferCount]
    have := entanglementAux_succ_sd M 1  -- entanglementAux M 2 = entanglementAux M 1 + transferCount M
    have := entanglementAux_succ_sd N 1  -- entanglementAux N 2 = entanglementAux N 1 + transferCount N
    omega
  | R18' M N P =>
    simp only [totalMeasure_sat, totalMeasure_disj, totalMeasure_conj, totalMeasure_ktr]
    simp only [transferCount]
    have := entanglementAux_succ_sd M 1
    have := entanglementAux_succ_sd N 1
    omega
  | R19  M N P =>
    simp only [totalMeasure_ktr, totalMeasure_disj, totalMeasure_conj, totalMeasure_sat]
    have hkM : transferCount (Transfer M) = transferCount M + 1 := by simp [transferCount]
    have hkN : transferCount (Transfer N) = transferCount N + 1 := by simp [transferCount]
    omega
  | R19' M N P =>
    simp only [totalMeasure_ktr, totalMeasure_disj, totalMeasure_conj, totalMeasure_sat]
    have hkM : transferCount (Transfer M) = transferCount M + 1 := by simp [transferCount]
    have hkN : transferCount (Transfer N) = transferCount N + 1 := by simp [transferCount]
    omega
  | saturate_step h ih =>
    have hk := ktrCount_non_R3R4_le h
    rw [totalMeasure_sat, totalMeasure_sat]
    omega
  | transfer_step _ ih => rw [totalMeasure_ktr, totalMeasure_ktr]; omega
  | conj_left  _ ih => rw [totalMeasure_conj, totalMeasure_conj]; omega
  | conj_right _ ih => rw [totalMeasure_conj, totalMeasure_conj]; omega
  | disj_left  _ ih => rw [totalMeasure_disj, totalMeasure_disj]; omega
  | disj_right _ ih => rw [totalMeasure_disj, totalMeasure_disj]; omega
  | impl_left  _ ih => rw [totalMeasure_impl, totalMeasure_impl]; omega
  | impl_right _ ih => rw [totalMeasure_impl, totalMeasure_impl]; omega

/-- Partial strong normalization: every Proposition₀ reduction sequence using only rules other
    than R3/R4 terminates. Proved by the measure `totalMeasure = modalCount + entanglement
    + transferCount`, which strictly decreases under all non-R3/R4 steps.
    Auxiliary: proceed by induction on a ℕ bound on totalMeasure. -/
private theorem strongNormalization_non_R3R4_aux :
    ∀ (n : ℕ) (M : Proposition V), totalMeasure M ≤ n → Acc (fun a b => StepNonR3R4 b a) M := by
  intro n
  induction n with
  | zero =>
    intro M hM
    apply Acc.intro
    intro N hN
    exact absurd (totalMeasure_decrease_non_R3R4 hN) (by omega)
  | succ n ih =>
    intro M hM
    apply Acc.intro
    intro N hN
    exact ih N (by exact Nat.le_of_lt_succ (Nat.lt_of_lt_of_le
      (totalMeasure_decrease_non_R3R4 hN) hM))

theorem strongNormalization_non_R3R4 (M : Proposition V) : Acc (fun a b => StepNonR3R4 b a) M :=
  strongNormalization_non_R3R4_aux (totalMeasure M) M le_rfl

-- ── Full strong normalization via lex measure (nuclearW, entanglement) ────────────
-- (nuclearW and entanglement definitions: see NuclearReductionMeasure.lean)

-- ── nuclearW-equal steps cannot increase transferCount ────────────────────────────────

/-- If a reduction step leaves nuclearW unchanged, then transferCount cannot increase.
    Used in the `saturate_step` congruence case of `nuclearW_step_lex` to bound
    the entanglement through a Saturate constructor. -/
private theorem nuclearW_eq_ktrCount_le {M N : Proposition V} (h : Step M N)
    (heq : nuclearW M = nuclearW N) : transferCount N ≤ transferCount M := by
  induction h with
  | R1 M       => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R2 M       => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R3 M N     => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R4 M N     => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R5         => simp [nuclearW] at heq
  | R6         => simp [nuclearW] at heq
  | R7 M       => simp [transferCount]
  | R8  M N    => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R9  M N    => simp [nuclearW] at heq; have := nuclearW_pos N; omega
  | R10 M N    => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R11 M N    => simp [nuclearW] at heq; have := nuclearW_pos N; omega
  | R12  M N   => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R13  M N   => simp [nuclearW] at heq; have := nuclearW_pos N; omega
  | R12s M N   => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R13s M N   => simp [nuclearW] at heq; have := nuclearW_pos N; omega
  | R14  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R15  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R16  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R17  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R18  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R18' M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R19  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R19' M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R20  M N   => simp [nuclearW] at heq; have := nuclearW_pos M; omega
  | R21  M N   => simp [nuclearW] at heq; have := nuclearW_pos N; omega
  | R22  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R23  M N P => simp [nuclearW] at heq; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | saturate_step _ ih =>
    simp only [nuclearW_sat] at heq
    simp only [transferCount]; exact ih (by omega)
  | transfer_step _ ih =>
    simp only [nuclearW_ktr] at heq
    simp only [transferCount]; have := ih (by omega); omega
  | conj_left  _ ih =>
    simp only [nuclearW_conj] at heq; simp [transferCount]; have := ih (by omega); omega
  | conj_right _ ih =>
    simp only [nuclearW_conj] at heq; simp [transferCount]; have := ih (by omega); omega
  | disj_left  _ ih =>
    simp only [nuclearW_disj] at heq; simp [transferCount]; have := ih (by omega); omega
  | disj_right _ ih =>
    simp only [nuclearW_disj] at heq; simp [transferCount]; have := ih (by omega); omega
  | impl_left  _ ih =>
    simp only [nuclearW_impl] at heq; simp [transferCount]; have := ih (by omega); omega
  | impl_right _ ih =>
    simp only [nuclearW_impl] at heq; simp [transferCount]; have := ih (by omega); omega

-- ── Combined lex measure strictly decreases under every step ──────────────────

/-- Every reduction step strictly decreases either `nuclearW` or (when nuclearW is preserved
    by R7) the entanglement degree.

    Combined lex measure `(nuclearW M, entanglement M)`:
    - R3/R4: nuclearW strictly decreases (by 1).
    - R7 (and congruence of R7): nuclearW preserved; entanglement decreases.
    - All other rules (R1,R2,R5,R6,R8–R19'): nuclearW strictly decreases. -/
private theorem nuclearW_step_lex {M N : Proposition V} (h : Step M N) :
    nuclearW N < nuclearW M ∨ (nuclearW N = nuclearW M ∧ entanglement N < entanglement M) := by
  induction h with
  | R1 M       => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R2 M       => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R3 M N     => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R4 M N     => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R5         => left; simp [nuclearW]
  | R6         => left; simp [nuclearW]
  | R7 M       => right; exact ⟨by simp [nuclearW], entanglement_R7 M⟩
  | R8  M N    => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R9  M N    => left; simp [nuclearW]; have := nuclearW_pos N; omega
  | R10 M N    => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R11 M N    => left; simp [nuclearW]; have := nuclearW_pos N; omega
  | R12  M N   => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R13  M N   => left; simp [nuclearW]; have := nuclearW_pos N; omega
  | R12s M N   => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R13s M N   => left; simp [nuclearW]; have := nuclearW_pos N; omega
  | R14  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R15  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R16  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R17  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R18  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R18' M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R19  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R19' M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R20  M N   => left; simp [nuclearW]; have := nuclearW_pos M; omega
  | R21  M N   => left; simp [nuclearW]; have := nuclearW_pos N; omega
  | R22  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | R23  M N P => left; simp [nuclearW]; have := nuclearW_pos M; have := nuclearW_pos N; omega
  | saturate_step hstep ih =>
    rename_i M' N'
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_sat]; omega
    · right
      refine ⟨by simp only [nuclearW_sat]; omega, ?_⟩
      -- ent(Saturate M') = ea(M', 1) = ea(M', 0) + transferCount M'  (entanglementAux_succ_sd)
      -- ent(Saturate N') = ea(N', 0) + transferCount N'
      -- ea(N', 0) < ea(M', 0) (hentlt); transferCount N' ≤ transferCount M' (nuclearW_eq_ktrCount_le)
      simp only [entanglement, entanglementAux_saturate, Nat.zero_add]
      have hM := entanglementAux_succ_sd M' 0
      have hN := entanglementAux_succ_sd N' 0
      simp only [Nat.zero_add] at hM hN
      have hkc : transferCount N' ≤ transferCount M' := nuclearW_eq_ktrCount_le hstep hweq.symm
      unfold entanglement at hentlt
      omega
  | transfer_step _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_ktr]; omega
    · right
      refine ⟨by simp only [nuclearW_ktr]; omega, ?_⟩
      -- ent(Transfer X) = entanglementAux X 0 = entanglement X (Transfer is transparent)
      simp only [entanglement, entanglementAux_transfer, Nat.zero_add]
      unfold entanglement at hentlt; omega
  | conj_left _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_conj]; omega
    · right
      refine ⟨by simp only [nuclearW_conj]; omega, ?_⟩
      simp only [entanglement, entanglementAux]
      unfold entanglement at hentlt; omega
  | conj_right _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_conj]; omega
    · right
      refine ⟨by simp only [nuclearW_conj]; omega, ?_⟩
      simp only [entanglement, entanglementAux]
      unfold entanglement at hentlt; omega
  | disj_left _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_disj]; omega
    · right
      refine ⟨by simp only [nuclearW_disj]; omega, ?_⟩
      simp only [entanglement, entanglementAux]
      unfold entanglement at hentlt; omega
  | disj_right _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_disj]; omega
    · right
      refine ⟨by simp only [nuclearW_disj]; omega, ?_⟩
      simp only [entanglement, entanglementAux]
      unfold entanglement at hentlt; omega
  | impl_left _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_impl]; omega
    · right
      refine ⟨by simp only [nuclearW_impl]; omega, ?_⟩
      simp only [entanglement, entanglementAux]
      unfold entanglement at hentlt; omega
  | impl_right _ ih =>
    rcases ih with hwlt | ⟨hweq, hentlt⟩
    · left; simp only [nuclearW_impl]; omega
    · right
      refine ⟨by simp only [nuclearW_impl]; omega, ?_⟩
      simp only [entanglement, entanglementAux]
      unfold entanglement at hentlt; omega

-- ── Strong normalization by double ℕ-induction on the lex bound ───────────────

private theorem strongNormalization_lex_aux :
    ∀ (w e : ℕ) (M : Proposition V), nuclearW M ≤ w → entanglement M ≤ e
    → Acc (fun a b => Step b a) M := by
  intro w
  induction w with
  | zero =>
    intro e M hw _
    exact absurd hw (by have := nuclearW_pos M; omega)
  | succ w' ihw =>
    intro e
    induction e with
    | zero =>
      intro M hw he
      apply Acc.intro
      intro N hN
      rcases nuclearW_step_lex hN with hwlt | ⟨_, hentlt⟩
      · exact ihw (entanglement N) N (by omega) le_rfl
      · exact absurd hentlt (by omega)
    | succ e' ihe =>
      intro M hw he
      apply Acc.intro
      intro N hN
      rcases nuclearW_step_lex hN with hwlt | ⟨hweq, hentlt⟩
      · exact ihw (entanglement N) N (by omega) le_rfl
      · exact ihe N (by omega) (by omega)

/-- Strong Normalization: every Proposition₀ reduction sequence terminates.

    Proved via the lexicographic measure `(nuclearW M, entanglement M)`:
    - `nuclearW` assigns weight `2 * nuclearW M` to `Saturate M` and `Transfer M`, additive weight to
      connectives. This makes R3/R4 strictly decrease `nuclearW` (by 1 each).
    - `entanglement` (Saturate-inside-Transfer nesting degree) strictly decreases under R7
      and all its congruence closures, exactly when `nuclearW` is preserved.
    - All other rules (R1,R2,R5,R6,R8–R19') strictly decrease `nuclearW`.

    The lex pair `(nuclearW M, entanglement M)` is a well-founded termination measure
    for the full Step relation R1–R19' with congruence closure. -/
theorem strongNormalization (M : Proposition V) : Acc (fun a b => Step b a) M :=
  strongNormalization_lex_aux (nuclearW M) (entanglement M) M le_rfl le_rfl

end Proposition
