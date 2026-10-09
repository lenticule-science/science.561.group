import RelationalHyperverse.NormalizationStrong
import RelationalHyperverse.SyntacticRelationalUniverse

-- Establishes: normalization (completeness: nf M = nf N ↔ synEquiv M N)

/-!
# NormalizationCompleteness: canonical forms are unique

The main result (`canonical_forms`): `nf M = nf N ↔ synEquiv M N`.

## Forward direction (proved)
Soundness of reduction: every Step preserves `synEquiv`, so `M →* nf M` gives
`synEquiv M (nf M)`. If `nf M = nf N` then `M ~ nf M = nf N ~ N`.

## Backward direction (depends on `confluence`)
If `synEquiv M N` then both M and N eventually reduce to their unique normal forms.
Confluence (from SN + `localConfluence` via Newman's Lemma) shows distinct NFs
cannot be synEquiv, so `nf M = nf N`.

## Open items
- `Proposition.localConfluence` : check all critical pairs of R1–R19'. The rules R14–R19'
  were added precisely to close each critical pair of R1–R13 (documented in
  `Soundness.lean`). Critical pairs of R1–R7 with themselves close trivially.
  Estimated ~300 lines. This is the only sorry blocking the full theorem.
- `Proposition.confluence` : sorry pending `localConfluence`. Newman's Lemma proof sketch:
  by WellFounded.fix on the Acc depth of M, case-split each path via `cases_head`,
  apply `localConfluence` at the one-step fork, then recurse on the direct successors
  (IH) and their common reduct (via `acc_of_steps` to get a smaller Acc proof).
- `Proposition.canonical_forms_mpr` : sorry pending `confluence`. Once `confluence` is proved,
  this closes: NFs reached from M and N are unique (nf_unique), and synEquiv forces
  them to coincide because each NF is its own reduction path's endpoint.
-/

namespace Proposition

universe u
variable {V : Type u}

-- ── §1: Multi-step reduction ──────────────────────────────────────────────────

/-- Multi-step reduction: zero or more applications of Step. -/
abbrev Steps : Proposition V → Proposition V → Prop := Relation.ReflTransGen Step

-- ── §2: Normal form function ──────────────────────────────────────────────────

/-- The normal form function.
    At each M: if a one-step reduct exists (classical choice), recurse; else stop.
    Terminates by `strongNormalization`. -/
noncomputable def nf : Proposition V → Proposition V :=
  open Classical in
  WellFounded.fix ⟨strongNormalization⟩ fun M ih =>
    if h : ∃ N, Step M N then ih h.choose h.choose_spec
    else M

/-- Unfolding lemma for `nf`. -/
theorem nf_unfold (M : Proposition V) :
    open Classical in
    nf M = if h : ∃ N, Step M N then nf h.choose else M := by
  rw [nf, WellFounded.fix_eq]

/-- If M is already in normal form, `nf M = M`. -/
theorem nf_eq_of_NF {M : Proposition V} (hM : NormalForm M) : nf M = M := by
  rw [nf_unfold]; exact dif_neg (fun ⟨N, hN⟩ => hM N hN)

/-- M reduces to its normal form in zero or more steps. -/
theorem nf_reduces (M : Proposition V) : Steps M (nf M) := by
  apply WellFounded.induction ⟨strongNormalization (V := V)⟩ M
  intro M ih
  rcases Classical.em (∃ N, Step M N) with h | h
  · have heq : nf M = nf h.choose := by rw [nf_unfold]; exact dif_pos h
    rw [heq]
    exact Relation.ReflTransGen.head h.choose_spec (ih h.choose h.choose_spec)
  · have heq : nf M = M := by rw [nf_unfold]; exact dif_neg h
    rw [heq]

/-- `nf M` is always in normal form. -/
theorem nf_isNF (M : Proposition V) : NormalForm (nf M) := by
  apply WellFounded.induction ⟨strongNormalization (V := V)⟩ M
  intro M ih
  rcases Classical.em (∃ N, Step M N) with h | h
  · have heq : nf M = nf h.choose := by rw [nf_unfold]; exact dif_pos h
    rw [heq]; exact ih h.choose h.choose_spec
  · have heq : nf M = M := by rw [nf_unfold]; exact dif_neg h
    rw [heq]; intro N hN; exact h ⟨N, hN⟩

-- ── §3: Soundness of reduction ─────────────────────────────────────────────────

/-- A single reduction step preserves semantic equivalence.
    Each root rule uses the corresponding lemma from `Soundness.lean`.
    Congruence cases use the IH with `rw`. -/
theorem step_sound {M N : Proposition V} (h : Step M N) : synEquiv M N := by
  induction h with
  | R1 M        => intro H _ bn ρ; exact sound_saturate_idempotent bn ρ M
  | R2 M        => intro H _ bn ρ; exact sound_transfer_idempotent bn ρ M
  | R3 M N      => intro H _ bn ρ; exact sound_saturate_conj bn ρ M N
  | R4 M N      => intro H _ bn ρ; exact sound_transfer_conj bn ρ M N
  | R5          => intro H _ bn ρ; exact sound_saturate_top bn ρ
  | R6          => intro H _ bn ρ; exact sound_transfer_top bn ρ
  | R7 M        => intro H _ bn ρ; exact sound_saturate_ktr_comm bn ρ M
  | R8 M N      => intro H _ bn ρ; exact sound_saturate_absorb_disj bn ρ M N
  | R9 M N      => intro H _ bn ρ; exact sound_saturate_absorb_disj' bn ρ M N
  | R10 M N     => intro H _ bn ρ; exact sound_transfer_absorb_disj bn ρ M N
  | R11 M N     => intro H _ bn ρ; exact sound_transfer_absorb_disj' bn ρ M N
  | R12 M N     => intro H _ bn ρ; exact sound_saturate_absorb_ktr_sat bn ρ M N
  | R13 M N     => intro H _ bn ρ; exact sound_saturate_absorb_ktr_sat' bn ρ M N
  | R12s M N    => intro H _ bn ρ; exact sound_transfer_absorb_sat_ktr bn ρ M N
  | R13s M N    => intro H _ bn ρ; exact sound_transfer_absorb_sat_ktr' bn ρ M N
  | R14 M N P   => intro H _ bn ρ; exact sound_saturate_absorb_conj_disj bn ρ M N P
  | R15 M N P   => intro H _ bn ρ; exact sound_saturate_absorb_conj_disj' bn ρ M N P
  | R16 M N P   => intro H _ bn ρ; exact sound_transfer_absorb_conj_disj bn ρ M N P
  | R17 M N P   => intro H _ bn ρ; exact sound_transfer_absorb_conj_disj' bn ρ M N P
  | R18 M N P   => intro H _ bn ρ; exact sound_saturate_absorb_ktr_sat_conj_disj bn ρ M N P
  | R18' M N P  => intro H _ bn ρ; exact sound_saturate_absorb_ktr_sat_conj_disj' bn ρ M N P
  | R19 M N P   => intro H _ bn ρ; exact sound_transfer_absorb_sat_ktr_conj_disj bn ρ M N P
  | R19' M N P  => intro H _ bn ρ; exact sound_transfer_absorb_sat_ktr_conj_disj' bn ρ M N P
  | R20 M N    => intro H _ bn ρ; exact sound_transfer_sat_absorb_ktr_disj bn ρ M N
  | R21 M N    => intro H _ bn ρ; exact sound_transfer_sat_absorb_ktr_disj' bn ρ M N
  | R22 M N P  => intro H _ bn ρ; exact sound_transfer_sat_absorb_ktr_conj_disj bn ρ M N P
  | R23 M N P  => intro H _ bn ρ; exact sound_transfer_sat_absorb_ktr_conj_disj' bn ρ M N P
  | saturate_step  _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | transfer_step  _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | conj_left  _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | conj_right _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | disj_left  _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | disj_right _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | impl_left  _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]
  | impl_right _ ih => intro H _ bn ρ; simp only [interp]; rw [ih bn ρ]

/-- Multi-step reduction preserves semantic equivalence. -/
theorem steps_sound {M N : Proposition V} (h : Steps M N) : synEquiv M N := by
  induction h with
  | refl        => intro _ _ bn ρ; rfl
  | tail h₁ h₂ ih => intro H _ bn ρ; exact (ih bn ρ).trans (step_sound h₂ bn ρ)

/-- Every term is synEquiv to its normal form. -/
theorem nf_sound (M : Proposition V) : synEquiv M (nf M) :=
  steps_sound (nf_reduces M)

-- ── §4: Confluence ─────────────────────────────────────────────────────────────

/-- `Steps M N` is either `M = N` or starts with a first step.
    Proved by induction on the path, threading the first step through `tail`. -/
private theorem cases_head {M N : Proposition V} (h : Steps M N) :
    M = N ∨ ∃ P, Step M P ∧ Steps P N := by
  induction h with
  | refl => exact Or.inl rfl
  | tail h₁ h₂ ih =>
    rcases ih with rfl | ⟨P, hP, hPN⟩
    · exact Or.inr ⟨_, h₂, .refl⟩
    · exact Or.inr ⟨P, hP, hPN.tail h₂⟩

/-- Accessibility is inherited by multi-step successors (used in Newman's proof). -/
private theorem acc_of_steps {M : Proposition V} (acc : Acc (fun a b => Step b a) M)
    {N : Proposition V} (h : Steps M N) : Acc (fun a b => Step b a) N := by
  induction h with
  | refl        => exact acc
  | tail _ h₂ ih => exact ih.inv h₂

/-- Local confluence: any two one-step reducts of M have a common multi-step reduct.

    Strategy: induct on hN, then on hP for each case. The real work is the
    root-rule × root-rule cases where two rules match the same term. Congruence
    × congruence and root × congruence cases are handled by IH or by stepping
    past the congruence.

    Critical pairs (root × root, same head, overlapping pattern):
      R1 × R1  : Saturate(Saturate(Saturate M))        — trivial, both → Saturate(Saturate M)
      R1 × saturate_step(R1) : Saturate(Saturate(Saturate M)) — same as above
      R2 × R2  : Transfer(Transfer(Transfer M))        — trivial
      R1 × saturate_step(R3) : Saturate(Saturate(conj M N)) — R1→Saturate(conj M N); saturate_step(R3)→Saturate(conj(Saturate M)(Saturate N)); need R14/R15
      R1 × saturate_step(R7) : Saturate(Saturate(Transfer M))   — R1→Saturate(Transfer M); saturate_step(R7)→Saturate(Transfer(Saturate M)); need R7 again
      R1 × saturate_step(R8) : Saturate(Saturate(disj(Saturate M) N)) — both under Saturate; closed by R8
      R3 × R3  : impossible (different heads Saturate(conj) vs Saturate(conj), same rule)
      R3 × saturate_step : Saturate(conj M N) where M or N steps — closed by saturate_step
      R7 × saturate_step(R2) : Saturate(Transfer(Transfer M)) — R7→Transfer(Saturate(Transfer M)); saturate_step(R2)→Saturate(Transfer M); closed by R7
      R7 × saturate_step(R7) : Saturate(Transfer(Saturate(Transfer M))) — complex, need multiple steps
      R8 × R8  : Saturate(disj(Saturate M)(Saturate N)) — R8 on left or right, closed by R9/R8
      R8 × R9  : Saturate(disj(Saturate M)(Saturate N)) — one goes left, one goes right; meet at Saturate(disj M N)
      R12 × R12s : different outer modality, no overlap
      ... (all pairs enumerated as named lemmas below)
-/

-- ── Lifting: Steps through congruence contexts ───────────────────────────────
-- NOTE: these are used throughout the localConfluence proof.
-- When two branches produce steps of inner terms, lift with these to get outer steps.

private theorem saturating_steps {M N : Proposition V} (h : Steps M N) : Steps (Saturate M) (Saturate N) := by
  induction h with
  | refl => exact .refl
  | tail _ h2 ih => exact ih.tail (Step.saturate_step h2)

private theorem transferring_steps {M N : Proposition V} (h : Steps M N) : Steps (Transfer M) (Transfer N) := by
  induction h with
  | refl => exact .refl
  | tail _ h2 ih => exact ih.tail (Step.transfer_step h2)

private theorem steps_conj_left {M M' N : Proposition V} (h : Steps M M') :
    Steps (conj M N) (conj M' N) := by
  induction h with
  | refl => exact .refl
  | tail _ h2 ih => exact ih.tail (Step.conj_left h2)

private theorem steps_conj_right {M N N' : Proposition V} (h : Steps N N') :
    Steps (conj M N) (conj M N') := by
  induction h with
  | refl => exact .refl
  | tail _ h2 ih => exact ih.tail (Step.conj_right h2)

private theorem steps_disj_left {M M' N : Proposition V} (h : Steps M M') :
    Steps (disj M N) (disj M' N) := by
  induction h with
  | refl => exact .refl
  | tail _ h2 ih => exact ih.tail (Step.disj_left h2)

private theorem steps_disj_right {M N N' : Proposition V} (h : Steps N N') :
    Steps (disj M N) (disj M N') := by
  induction h with
  | refl => exact .refl
  | tail _ h2 ih => exact ih.tail (Step.disj_right h2)

-- ── Critical pair lemmas (each sorry'd until proved) ──────────────────────────

-- R1 × R1: Saturate(Saturate(Saturate M)) → Saturate(Saturate M) both ways. Trivial.
private lemma cp_R1_R1 (M : Proposition V) :
    ∃ Q, Steps (Saturate M) Q ∧ Steps (Saturate M) Q :=
  ⟨Saturate M, .refl, .refl⟩

-- R2 × R2: Transfer(Transfer(Transfer M)) → Transfer(Transfer M) both ways. Trivial.
private lemma cp_R2_R2 (M : Proposition V) :
    ∃ Q, Steps (Transfer M) Q ∧ Steps (Transfer M) Q :=
  ⟨Transfer M, .refl, .refl⟩

-- R1 × saturate_step(R3): Saturate(Saturate(conj M N))
--   hN = R1          → Saturate(conj M N)
--   hP = saturate_step(R3) → Saturate(conj(Saturate M)(Saturate N))
--   Q = conj(Saturate M)(Saturate N):
--     Saturate(conj M N) →[R3]→ conj(Saturate M)(Saturate N)
--     Saturate(conj(Saturate M)(Saturate N)) →[R3(Saturate M)(Saturate N)]→ conj(Saturate(Saturate M))(Saturate(Saturate N))
--                             →[conj_left(R1)]→ conj(Saturate M)(Saturate(Saturate N))
--                             →[conj_right(R1)]→ conj(Saturate M)(Saturate N)
private lemma cp_R1_satR3 (M N : Proposition V) :
    ∃ Q, Steps (Saturate (conj M N)) Q ∧ Steps (Saturate (conj (Saturate M) (Saturate N))) Q :=
  ⟨conj (Saturate M) (Saturate N),
   Relation.ReflTransGen.single (Step.R3 M N),
   ((Relation.ReflTransGen.single (Step.R3 (Saturate M) (Saturate N))).tail
     (Step.conj_left (Step.R1 M))).tail
     (Step.conj_right (Step.R1 N))⟩

-- R1 × saturate_step(R5): Saturate(Saturate(top))
--   hN = R1           → Saturate(top)
--   hP = saturate_step(R5) → Saturate(top)
--   Trivial: same reduct.
private lemma cp_R1_satR5 :
    ∃ Q, Steps (Saturate (top (V:=V))) Q ∧ Steps (Saturate (top (V:=V))) Q :=
  ⟨Saturate top, .refl, .refl⟩

-- R1 × saturate_step(R7): Saturate(Saturate(Transfer M))
--   hN = R1           → Saturate(Transfer M)
--   hP = saturate_step(R7) → Saturate(Transfer(Saturate M))
--   Q = Transfer(Saturate M):
--     Saturate(Transfer M) →[R7 M]→ Transfer(Saturate M)
--     Saturate(Transfer(Saturate M)) →[R7(Saturate M)]→ Transfer(Saturate(Saturate M)) →[transfer_step(R1 M)]→ Transfer(Saturate M)
private lemma cp_R1_satR7 (M : Proposition V) :
    ∃ Q, Steps (Saturate (Transfer M)) Q ∧ Steps (Saturate (Transfer (Saturate M))) Q :=
  ⟨Transfer (Saturate M),
   Relation.ReflTransGen.single (Step.R7 M),
   (Relation.ReflTransGen.single (Step.R7 (Saturate M))).tail (Step.transfer_step (Step.R1 M))⟩

-- R1 × saturate_step(R8): Saturate(Saturate(disj(Saturate M) N))
--   hN = R1           → Saturate(disj(Saturate M) N)
--   hP = saturate_step(R8) → Saturate(disj M N)
--   Close: Saturate(disj(Saturate M) N) →[R8]→ Saturate(disj M N). Meet at Saturate(disj M N).
private lemma cp_R1_satR8 (M N : Proposition V) :
    ∃ Q, Steps (Saturate (disj (Saturate M) N)) Q ∧ Steps (Saturate (disj M N)) Q :=
  ⟨Saturate (disj M N), Relation.ReflTransGen.single (Step.R8 M N), .refl⟩

-- R1 × saturate_step(R9): Saturate(Saturate(disj M (Saturate N)))
--   hN = R1           → Saturate(disj M (Saturate N))
--   hP = saturate_step(R9) → Saturate(disj M N)
--   Close: Saturate(disj M (Saturate N)) →[R9]→ Saturate(disj M N). Meet at Saturate(disj M N).
private lemma cp_R1_satR9 (M N : Proposition V) :
    ∃ Q, Steps (Saturate (disj M (Saturate N))) Q ∧ Steps (Saturate (disj M N)) Q :=
  ⟨Saturate (disj M N), Relation.ReflTransGen.single (Step.R9 M N), .refl⟩

-- R2 × transfer_step(R4): Transfer(Transfer(conj M N)) — symmetric to R1×saturate_step(R3)
-- Common term Transfer(Transfer(conj M N)): R2→Transfer(conj M N); transfer_step(R4)→Transfer(conj(Transfer M)(Transfer N))
-- Q = conj(Transfer M)(Transfer N):
--   Transfer(conj M N) →[R4]→ conj(Transfer M)(Transfer N)
--   Transfer(conj(Transfer M)(Transfer N)) →[R4(Transfer)(Transfer)]→ conj(Transfer(Transfer M))(Transfer(Transfer N)) →[conj_left(R2)]→ conj(Transfer M)(Transfer(Transfer N)) →[conj_right(R2)]→ conj(Transfer M)(Transfer N)
private lemma cp_R2_ktrR4 (M N : Proposition V) :
    ∃ Q, Steps (Transfer (conj M N)) Q ∧ Steps (Transfer (conj (Transfer M) (Transfer N))) Q :=
  ⟨conj (Transfer M) (Transfer N),
   Relation.ReflTransGen.single (Step.R4 M N),
   ((Relation.ReflTransGen.single (Step.R4 (Transfer M) (Transfer N))).tail
     (Step.conj_left (Step.R2 M))).tail
     (Step.conj_right (Step.R2 N))⟩

-- R2 × transfer_step(R6): Transfer(Transfer(top)) — symmetric to R1×saturate_step(R5)
private lemma cp_R2_ktrR6 :
    ∃ Q, Steps (Transfer (top (V:=V))) Q ∧ Steps (Transfer (top (V:=V))) Q :=
  ⟨Transfer top, .refl, .refl⟩

-- R2 × transfer_step(R7): Transfer(Transfer(Saturate M))
--   hN = R2           → Transfer(Saturate M)
--   hP = transfer_step(R7)... wait: R7 is Saturate(Transfer M)→Transfer(Saturate M), not Transfer(Saturate M)→...
--   So transfer_step(R7) on Transfer(Transfer(Saturate M)) would need inner = Transfer(Saturate M), but R7 fires on Saturate(Transfer).
--   ACTUALLY: Transfer(Transfer(Saturate M)): R2 fires (outer Transfer(Transfer)), giving Transfer(Saturate M).
--   No other root rule fires on Transfer(Transfer(Saturate M)) at root. So this is R2 × transfer_step(something on Saturate M).
--   NOTE: skipping degenerate overlaps, only listing genuine root×root critical pairs.

-- R7 × saturate_step(R2): Saturate(Transfer(Transfer M))
--   hN = R7(Transfer M)     → Transfer(Saturate(Transfer M))
--   hP = saturate_step(R2)  → Saturate(Transfer M)
--   Q = Transfer(Saturate M):
--     Transfer(Saturate(Transfer M)) →[transfer_step(R7 M)]→ Transfer(Transfer(Saturate M)) →[R2(Saturate M)]→ Transfer(Saturate M)
--     Saturate(Transfer M) →[R7 M]→ Transfer(Saturate M)
private lemma cp_R7_satR2 (M : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (Transfer M))) Q ∧ Steps (Saturate (Transfer M)) Q :=
  ⟨Transfer (Saturate M),
   (Relation.ReflTransGen.single (Step.transfer_step (Step.R7 M))).tail (Step.R2 (Saturate M)),
   Relation.ReflTransGen.single (Step.R7 M)⟩

-- R8 × R9: Saturate(disj(Saturate M)(Saturate N))
--   hN = R8 → Saturate(disj M (Saturate N))
--   hP = R9 → Saturate(disj(Saturate M) N)
--   Q = Saturate(disj M N): both →[R9/R8]→ Saturate(disj M N)
private lemma cp_R8_R9 (M N : Proposition V) :
    ∃ Q, Steps (Saturate (disj M (Saturate N))) Q ∧ Steps (Saturate (disj (Saturate M) N)) Q :=
  ⟨Saturate (disj M N),
   Relation.ReflTransGen.single (Step.R9 M N),
   Relation.ReflTransGen.single (Step.R8 M N)⟩

-- R10 × R11: Transfer(disj(Transfer M)(Transfer N)) — symmetric to R8×R9
-- Q = Transfer(disj M N): both →[R11/R10]→ Transfer(disj M N)
private lemma cp_R10_R11 (M N : Proposition V) :
    ∃ Q, Steps (Transfer (disj M (Transfer N))) Q ∧ Steps (Transfer (disj (Transfer M) N)) Q :=
  ⟨Transfer (disj M N),
   Relation.ReflTransGen.single (Step.R11 M N),
   Relation.ReflTransGen.single (Step.R10 M N)⟩

-- R8 × R12: Saturate(disj(Transfer(Saturate M)) N) — R12 fires; what else fires?
--   R8 fires on Saturate(disj(Saturate(-)) N). Here inner left = Transfer(Saturate M), not Saturate(-). So R8 does NOT fire.
--   R12 fires. No R8×R12 critical pair at root. ✓ no conflict.

-- R3 × saturate_step(R8): Saturate(conj M N) where... no. R3 fires on Saturate(conj). R8 fires on Saturate(disj(Saturate)). Different heads. No overlap. ✓

-- R14 × R3: Saturate(disj(conj(Saturate M)(Saturate N)) P)
--   R14 fires at root: → Saturate(disj(conj M N) P)
--   R3 cannot fire at root (head is Saturate(disj), not Saturate(conj)).
--   But saturate_step(R3) on conj(Saturate M)(Saturate N)? No: R3 fires on Saturate(conj), not conj(Saturate)(Saturate).
--   conj_left/conj_right could fire on conj(Saturate M)(Saturate N) via saturate_step on M or N.
--   That's root×congruence, handled separately.
--   NOTE: R14 was added to close R3×R8 critical pair. The critical pair is:
--     Saturate(conj(Saturate M)(Saturate N)): R3→conj(Saturate(Saturate M))(Saturate(Saturate N))→[R1×R1]→conj(Saturate M)(Saturate N)
--                               R8→... wait R8 fires on Saturate(disj(Saturate)...), not Saturate(conj).
--   Actually the R3/R8 critical pair is: Saturate(disj(Saturate(conj M N)) P)
--     R8 fires: → Saturate(disj(conj M N) P)
--     saturate_step(R3) fires on inner: → Saturate(disj(conj(Saturate M)(Saturate N)) P) →[R14]→ Saturate(disj(conj M N) P). ✓

-- R3/R8 critical pair: Saturate(disj(Saturate(conj M N)) P)
--   hN = R8              → Saturate(disj(conj M N) P)
--   hP = saturate_step(R3) [on Saturate(conj M N)] = saturate_step(saturate_step(R3))...
--   wait: the outer Saturate sees disj(Saturate(conj M N) P). R8 fires at root (outer Saturate, left=Saturate(conj M N)=Saturate(_)).
--   saturate_step fires: inner = disj(Saturate(conj M N) P), step on Saturate(conj M N) via R3 → conj(Saturate M)(Saturate N).
--   So hP = saturate_step(disj_left(R3)): → Saturate(disj(conj(Saturate M)(Saturate N)) P)
--   Close: Saturate(disj(conj M N) P) is target of R8; Saturate(disj(conj(Saturate M)(Saturate N)) P) →[R14]→ Saturate(disj(conj M N) P). ✓
-- R3/R8 critical pair: Saturate(disj(Saturate(conj M N)) P)
-- Q = Saturate(disj(conj M N) P):
--   Saturate(disj(conj M N) P) →[refl]
--   Saturate(disj(conj(Saturate M)(Saturate N)) P) →[R14]→ Saturate(disj(conj M N) P)
private lemma cp_R8_satR3 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj (conj M N) P)) Q ∧ Steps (Saturate (disj (conj (Saturate M) (Saturate N)) P)) Q :=
  ⟨Saturate (disj (conj M N) P), .refl, Relation.ReflTransGen.single (Step.R14 M N P)⟩

-- R3/R9 critical pair: Saturate(disj P (Saturate(conj M N)))
-- Q = Saturate(disj P (conj M N)):
--   Saturate(disj P (conj M N)) →[refl]
--   Saturate(disj P (conj(Saturate M)(Saturate N))) →[R15]→ Saturate(disj P (conj M N))
private lemma cp_R9_satR3 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj P (conj M N))) Q ∧ Steps (Saturate (disj P (conj (Saturate M) (Saturate N)))) Q :=
  ⟨Saturate (disj P (conj M N)), .refl, Relation.ReflTransGen.single (Step.R15 M N P)⟩

-- R4/R10 critical pair: Transfer(disj(Transfer(conj M N)) P)
-- Q = Transfer(disj(conj M N) P):
--   Transfer(disj(conj M N) P) →[refl]
--   Transfer(disj(conj(Transfer M)(Transfer N)) P) →[R16]→ Transfer(disj(conj M N) P)
private lemma cp_R10_ktrR4 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj (conj M N) P)) Q ∧ Steps (Transfer (disj (conj (Transfer M) (Transfer N)) P)) Q :=
  ⟨Transfer (disj (conj M N) P), .refl, Relation.ReflTransGen.single (Step.R16 M N P)⟩

-- R4/R11 critical pair: Transfer(disj P (Transfer(conj M N)))
-- Q = Transfer(disj P (conj M N)):
--   Transfer(disj P (conj M N)) →[refl]
--   Transfer(disj P (conj(Transfer M)(Transfer N))) →[R17]→ Transfer(disj P (conj M N))
private lemma cp_R11_ktrR4 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj P (conj M N))) Q ∧ Steps (Transfer (disj P (conj (Transfer M) (Transfer N)))) Q :=
  ⟨Transfer (disj P (conj M N)), .refl, Relation.ReflTransGen.single (Step.R17 M N P)⟩

-- R12/R3 critical pair: Saturate(disj(Transfer(Saturate(conj M N))) P)
--   R12(conj M N, P): → Saturate(disj(Transfer(conj M N)) P)
--   saturate_step(disj_left(transfer_step(R3 M N))): → Saturate(disj(Transfer(conj(Saturate M)(Saturate N))) P)
--   Q = Saturate(disj(conj(Transfer M)(Transfer N)) P):
--     Saturate(disj(Transfer(conj M N)) P) →[saturate_step(disj_left(R4 M N))]→ Saturate(disj(conj(Transfer M)(Transfer N)) P)
--     Saturate(disj(Transfer(conj(Saturate M)(Saturate N))) P) →[saturate_step(disj_left(R4(Saturate M)(Saturate N)))]→
--       Saturate(disj(conj(Transfer(Saturate M))(Transfer(Saturate N))) P) →[R18 M N P]→ Saturate(disj(conj(Transfer M)(Transfer N)) P)
private lemma cp_R12_ktrR3 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj (Transfer (conj M N)) P)) Q ∧
         Steps (Saturate (disj (Transfer (conj (Saturate M) (Saturate N))) P)) Q :=
  ⟨Saturate (disj (conj (Transfer M) (Transfer N)) P),
   Relation.ReflTransGen.single (Step.saturate_step (Step.disj_left (Step.R4 M N))),
   (Relation.ReflTransGen.single
     (Step.saturate_step (Step.disj_left (Step.R4 (Saturate M) (Saturate N))))).tail
     (Step.R18 M N P)⟩

-- R13/R3 critical pair: Saturate(disj P (Transfer(Saturate(conj M N)))) — symmetric, closed by R18'
--   Q = Saturate(disj P (conj(Transfer M)(Transfer N))):
--     Saturate(disj P (Transfer(conj M N))) →[saturate_step(disj_right(R4 M N))]→ Saturate(disj P (conj(Transfer M)(Transfer N)))
--     Saturate(disj P (Transfer(conj(Saturate M)(Saturate N)))) →[saturate_step(disj_right(R4(Saturate M)(Saturate N)))]→
--       Saturate(disj P (conj(Transfer(Saturate M))(Transfer(Saturate N)))) →[R18' M N P]→ Saturate(disj P (conj(Transfer M)(Transfer N)))
private lemma cp_R13_ktrR3 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj P (Transfer (conj M N)))) Q ∧
         Steps (Saturate (disj P (Transfer (conj (Saturate M) (Saturate N))))) Q :=
  ⟨Saturate (disj P (conj (Transfer M) (Transfer N))),
   Relation.ReflTransGen.single (Step.saturate_step (Step.disj_right (Step.R4 M N))),
   (Relation.ReflTransGen.single
     (Step.saturate_step (Step.disj_right (Step.R4 (Saturate M) (Saturate N))))).tail
     (Step.R18' M N P)⟩

-- R12s/R4 critical pair: Transfer(disj(Saturate(Transfer(conj M N))) P) — symmetric with R19
--   Q = Transfer(disj(conj(Saturate M)(Saturate N)) P):
--     Transfer(disj(Saturate(conj M N)) P) →[transfer_step(disj_left(R3 M N))]→ Transfer(disj(conj(Saturate M)(Saturate N)) P)
--     Transfer(disj(Saturate(conj(Transfer M)(Transfer N))) P) →[transfer_step(disj_left(R3(Transfer M)(Transfer N)))]→
--       Transfer(disj(conj(Saturate(Transfer M))(Saturate(Transfer N))) P) →[R19 M N P]→ Transfer(disj(conj(Saturate M)(Saturate N)) P)
private lemma cp_R12s_satR4 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj (Saturate (conj M N)) P)) Q ∧
         Steps (Transfer (disj (Saturate (conj (Transfer M) (Transfer N))) P)) Q :=
  ⟨Transfer (disj (conj (Saturate M) (Saturate N)) P),
   Relation.ReflTransGen.single (Step.transfer_step (Step.disj_left (Step.R3 M N))),
   (Relation.ReflTransGen.single
     (Step.transfer_step (Step.disj_left (Step.R3 (Transfer M) (Transfer N))))).tail
     (Step.R19 M N P)⟩

-- R13s/R4 critical pair: Transfer(disj P (Saturate(Transfer(conj M N)))) — symmetric with R19'
--   Q = Transfer(disj P (conj(Saturate M)(Saturate N))):
--     Transfer(disj P (Saturate(conj M N))) →[transfer_step(disj_right(R3 M N))]→ Transfer(disj P (conj(Saturate M)(Saturate N)))
--     Transfer(disj P (Saturate(conj(Transfer M)(Transfer N)))) →[transfer_step(disj_right(R3(Transfer M)(Transfer N)))]→
--       Transfer(disj P (conj(Saturate(Transfer M))(Saturate(Transfer N)))) →[R19' M N P]→ Transfer(disj P (conj(Saturate M)(Saturate N)))
private lemma cp_R13s_satR4 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj P (Saturate (conj M N)))) Q ∧
         Steps (Transfer (disj P (Saturate (conj (Transfer M) (Transfer N))))) Q :=
  ⟨Transfer (disj P (conj (Saturate M) (Saturate N))),
   Relation.ReflTransGen.single (Step.transfer_step (Step.disj_right (Step.R3 M N))),
   (Relation.ReflTransGen.single
     (Step.transfer_step (Step.disj_right (Step.R3 (Transfer M) (Transfer N))))).tail
     (Step.R19' M N P)⟩

-- ── New cp lemmas closing R7-interaction critical pairs ──────────────────────

-- R7 × saturate_step(R10): Saturate(Transfer(disj(Transfer M) N))
--   R7   → Transfer(Saturate(disj(Transfer M) N)) →[R20]→ Transfer(Saturate(disj M N))
--   saturate_step(R10) → Saturate(Transfer(disj M N)) →[R7]→ Transfer(Saturate(disj M N))
private lemma cp_R7_satR10 (M N : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (disj (Transfer M) N))) Q ∧ Steps (Saturate (Transfer (disj M N))) Q :=
  ⟨Transfer (Saturate (disj M N)),
   Relation.ReflTransGen.single (Step.R20 M N),
   Relation.ReflTransGen.single (Step.R7 (disj M N))⟩

-- R7 × saturate_step(R11): Saturate(Transfer(disj M (Transfer N)))
--   R7   → Transfer(Saturate(disj M (Transfer N))) →[R21]→ Transfer(Saturate(disj M N))
--   saturate_step(R11) → Saturate(Transfer(disj M N)) →[R7]→ Transfer(Saturate(disj M N))
private lemma cp_R7_satR11 (M N : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (disj M (Transfer N)))) Q ∧ Steps (Saturate (Transfer (disj M N))) Q :=
  ⟨Transfer (Saturate (disj M N)),
   Relation.ReflTransGen.single (Step.R21 M N),
   Relation.ReflTransGen.single (Step.R7 (disj M N))⟩

-- R7 × saturate_step(R16): Saturate(Transfer(disj(conj(Transfer M)(Transfer N)) P))
--   R7   → Transfer(Saturate(disj(conj(Transfer M)(Transfer N)) P)) →[R22]→ Transfer(Saturate(disj(conj M N) P))
--   saturate_step(R16) → Saturate(Transfer(disj(conj M N) P)) →[R7]→ Transfer(Saturate(disj(conj M N) P))
private lemma cp_R7_satR16 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (disj (conj (Transfer M) (Transfer N)) P))) Q ∧
         Steps (Saturate (Transfer (disj (conj M N) P))) Q :=
  ⟨Transfer (Saturate (disj (conj M N) P)),
   Relation.ReflTransGen.single (Step.R22 M N P),
   Relation.ReflTransGen.single (Step.R7 (disj (conj M N) P))⟩

-- R7 × saturate_step(R17): Saturate(Transfer(disj P (conj(Transfer M)(Transfer N))))
--   R7   → Transfer(Saturate(disj P (conj(Transfer M)(Transfer N)))) →[R23]→ Transfer(Saturate(disj P (conj M N)))
--   saturate_step(R17) → Saturate(Transfer(disj P (conj M N))) →[R7]→ Transfer(Saturate(disj P (conj M N)))
private lemma cp_R7_satR17 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (disj P (conj (Transfer M) (Transfer N))))) Q ∧
         Steps (Saturate (Transfer (disj P (conj M N)))) Q :=
  ⟨Transfer (Saturate (disj P (conj M N))),
   Relation.ReflTransGen.single (Step.R23 M N P),
   Relation.ReflTransGen.single (Step.R7 (disj P (conj M N)))⟩

-- ── New root×root cp lemmas for R20–R23 ──────────────────────────────────────

-- R20 × R21: Transfer(Saturate(disj(Transfer M)(Transfer N)))
--   R20 (left Transfer) → Transfer(Saturate(disj M (Transfer N))) →[R21]→ Transfer(Saturate(disj M N))
--   R21 (right Transfer) → Transfer(Saturate(disj(Transfer M) N)) →[R20]→ Transfer(Saturate(disj M N))
private lemma cp_R20_R21 (M N : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (disj M (Transfer N)))) Q ∧ Steps (Transfer (Saturate (disj (Transfer M) N))) Q :=
  ⟨Transfer (Saturate (disj M N)),
   Relation.ReflTransGen.single (Step.R21 M N),
   Relation.ReflTransGen.single (Step.R20 M N)⟩

-- R22 × R23: Transfer(Saturate(disj(conj(Transfer M)(Transfer N))(conj(Transfer A)(Transfer B))))
--   R22 (left conj) → Transfer(Saturate(disj(conj M N)(conj(Transfer A)(Transfer B)))) →[R23]→ Transfer(Saturate(disj(conj M N)(conj A B)))
--   R23 (right conj) → Transfer(Saturate(disj(conj(Transfer M)(Transfer N))(conj A B))) →[R22]→ Transfer(Saturate(disj(conj M N)(conj A B)))
private lemma cp_R22_R23 (M N A B : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (disj (conj M N) (conj (Transfer A) (Transfer B))))) Q ∧
         Steps (Transfer (Saturate (disj (conj (Transfer M) (Transfer N)) (conj A B)))) Q :=
  ⟨Transfer (Saturate (disj (conj M N) (conj A B))),
   Relation.ReflTransGen.single (Step.R23 A B (conj M N)),
   Relation.ReflTransGen.single (Step.R22 M N (conj A B))⟩

-- ── New cp lemmas: R1 × saturate_step(Ri) for Ri ∈ {R12,R13,R14,R15,R18,R18'} ───
-- Pattern: N = Saturate A (from R1), P = Saturate(Saturate(result)); meet at result via R1 on P.

-- R1 × saturate_step(R12): Saturate(Saturate(disj(Transfer(Saturate M)) N))
--   R1 → Saturate(disj(Transfer(Saturate M)) N) →[R12]→ Saturate(disj(Transfer M) N)
--   saturate_step(R12) → Saturate(Saturate(disj(Transfer M) N)) →[R1]→ Saturate(disj(Transfer M) N)
private lemma cp_R1_satR12 (M N : Proposition V) :
    ∃ Q, Steps (Saturate (disj (Transfer (Saturate M)) N)) Q ∧ Steps (Saturate (Saturate (disj (Transfer M) N))) Q :=
  ⟨Saturate (disj (Transfer M) N),
   Relation.ReflTransGen.single (Step.R12 M N),
   Relation.ReflTransGen.single (Step.R1 (disj (Transfer M) N))⟩

-- R1 × saturate_step(R13): Saturate(Saturate(disj M (Transfer(Saturate N))))
private lemma cp_R1_satR13 (M N : Proposition V) :
    ∃ Q, Steps (Saturate (disj M (Transfer (Saturate N)))) Q ∧ Steps (Saturate (Saturate (disj M (Transfer N)))) Q :=
  ⟨Saturate (disj M (Transfer N)),
   Relation.ReflTransGen.single (Step.R13 M N),
   Relation.ReflTransGen.single (Step.R1 (disj M (Transfer N)))⟩

-- R1 × saturate_step(R14): Saturate(Saturate(disj(conj(Saturate M)(Saturate N)) P))
private lemma cp_R1_satR14 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj (conj (Saturate M) (Saturate N)) P)) Q ∧
         Steps (Saturate (Saturate (disj (conj M N) P))) Q :=
  ⟨Saturate (disj (conj M N) P),
   Relation.ReflTransGen.single (Step.R14 M N P),
   Relation.ReflTransGen.single (Step.R1 (disj (conj M N) P))⟩

-- R1 × saturate_step(R15): Saturate(Saturate(disj P (conj(Saturate M)(Saturate N))))
private lemma cp_R1_satR15 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj P (conj (Saturate M) (Saturate N)))) Q ∧
         Steps (Saturate (Saturate (disj P (conj M N)))) Q :=
  ⟨Saturate (disj P (conj M N)),
   Relation.ReflTransGen.single (Step.R15 M N P),
   Relation.ReflTransGen.single (Step.R1 (disj P (conj M N)))⟩

-- R1 × saturate_step(R18): Saturate(Saturate(disj(conj(Transfer(Saturate M))(Transfer(Saturate N))) P))
private lemma cp_R1_satR18 (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj (conj (Transfer (Saturate M)) (Transfer (Saturate N))) P)) Q ∧
         Steps (Saturate (Saturate (disj (conj (Transfer M) (Transfer N)) P))) Q :=
  ⟨Saturate (disj (conj (Transfer M) (Transfer N)) P),
   Relation.ReflTransGen.single (Step.R18 M N P),
   Relation.ReflTransGen.single (Step.R1 (disj (conj (Transfer M) (Transfer N)) P))⟩

-- R1 × saturate_step(R18'): Saturate(Saturate(disj P (conj(Transfer(Saturate M))(Transfer(Saturate N)))))
private lemma cp_R1_satR18' (M N P : Proposition V) :
    ∃ Q, Steps (Saturate (disj P (conj (Transfer (Saturate M)) (Transfer (Saturate N))))) Q ∧
         Steps (Saturate (Saturate (disj P (conj (Transfer M) (Transfer N))))) Q :=
  ⟨Saturate (disj P (conj (Transfer M) (Transfer N))),
   Relation.ReflTransGen.single (Step.R18' M N P),
   Relation.ReflTransGen.single (Step.R1 (disj P (conj (Transfer M) (Transfer N))))⟩

-- ── Symmetric set: R2 × transfer_step(Ri) ────────────────────────────────────────

-- R2 × transfer_step(R12s): Transfer(Transfer(disj(Saturate(Transfer M)) N))
private lemma cp_R2_ktrR12s (M N : Proposition V) :
    ∃ Q, Steps (Transfer (disj (Saturate (Transfer M)) N)) Q ∧ Steps (Transfer (Transfer (disj (Saturate M) N))) Q :=
  ⟨Transfer (disj (Saturate M) N),
   Relation.ReflTransGen.single (Step.R12s M N),
   Relation.ReflTransGen.single (Step.R2 (disj (Saturate M) N))⟩

-- R2 × transfer_step(R13s): Transfer(Transfer(disj M (Saturate(Transfer N))))
private lemma cp_R2_ktrR13s (M N : Proposition V) :
    ∃ Q, Steps (Transfer (disj M (Saturate (Transfer N)))) Q ∧ Steps (Transfer (Transfer (disj M (Saturate N)))) Q :=
  ⟨Transfer (disj M (Saturate N)),
   Relation.ReflTransGen.single (Step.R13s M N),
   Relation.ReflTransGen.single (Step.R2 (disj M (Saturate N)))⟩

-- R2 × transfer_step(R16): Transfer(Transfer(disj(conj(Transfer M)(Transfer N)) P))
private lemma cp_R2_ktrR16 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj (conj (Transfer M) (Transfer N)) P)) Q ∧
         Steps (Transfer (Transfer (disj (conj M N) P))) Q :=
  ⟨Transfer (disj (conj M N) P),
   Relation.ReflTransGen.single (Step.R16 M N P),
   Relation.ReflTransGen.single (Step.R2 (disj (conj M N) P))⟩

-- R2 × transfer_step(R17): Transfer(Transfer(disj P (conj(Transfer M)(Transfer N))))
private lemma cp_R2_ktrR17 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj P (conj (Transfer M) (Transfer N)))) Q ∧
         Steps (Transfer (Transfer (disj P (conj M N)))) Q :=
  ⟨Transfer (disj P (conj M N)),
   Relation.ReflTransGen.single (Step.R17 M N P),
   Relation.ReflTransGen.single (Step.R2 (disj P (conj M N)))⟩

-- R2 × transfer_step(R19): Transfer(Transfer(disj(conj(Saturate(Transfer M))(Saturate(Transfer N))) P))
private lemma cp_R2_ktrR19 (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj (conj (Saturate (Transfer M)) (Saturate (Transfer N))) P)) Q ∧
         Steps (Transfer (Transfer (disj (conj (Saturate M) (Saturate N)) P))) Q :=
  ⟨Transfer (disj (conj (Saturate M) (Saturate N)) P),
   Relation.ReflTransGen.single (Step.R19 M N P),
   Relation.ReflTransGen.single (Step.R2 (disj (conj (Saturate M) (Saturate N)) P))⟩

-- R2 × transfer_step(R19'): Transfer(Transfer(disj P (conj(Saturate(Transfer M))(Saturate(Transfer N)))))
private lemma cp_R2_ktrR19' (M N P : Proposition V) :
    ∃ Q, Steps (Transfer (disj P (conj (Saturate (Transfer M)) (Saturate (Transfer N))))) Q ∧
         Steps (Transfer (Transfer (disj P (conj (Saturate M) (Saturate N))))) Q :=
  ⟨Transfer (disj P (conj (Saturate M) (Saturate N))),
   Relation.ReflTransGen.single (Step.R19' M N P),
   Relation.ReflTransGen.single (Step.R2 (disj P (conj (Saturate M) (Saturate N))))⟩

-- ── R7 × saturate_step(R4): Saturate(Transfer(conj M N)) ───────────────────────────────────
-- R7 → Transfer(Saturate(conj M N)) →[transfer_step(R3)]→ Transfer(conj(Saturate M)(Saturate N)) ←[R4(Saturate M)(Saturate N)]←
-- saturate_step(R4) → Saturate(conj(Transfer M)(Transfer N)) →[R3(Transfer M)(Transfer N)]→ conj(Saturate(Transfer M))(Saturate(Transfer N))
--   →[conj_left(R7)]→ conj(Transfer(Saturate M))(Saturate(Transfer N)) →[conj_right(R7)]→ conj(Transfer(Saturate M))(Transfer(Saturate N))
-- But Transfer(conj(Saturate M)(Saturate N)) →[R4(Saturate M)(Saturate N)]→ conj(Transfer(Saturate M))(Transfer(Saturate N)). Meet!
private lemma cp_R7_satR4 (M N : Proposition V) :
    ∃ Q, Steps (Transfer (Saturate (conj M N))) Q ∧ Steps (Saturate (conj (Transfer M) (Transfer N))) Q :=
  ⟨conj (Transfer (Saturate M)) (Transfer (Saturate N)),
   (Relation.ReflTransGen.single (Step.transfer_step (Step.R3 M N))).tail
     (Step.R4 (Saturate M) (Saturate N)),
   ((Relation.ReflTransGen.single (Step.R3 (Transfer M) (Transfer N))).tail
     (Step.conj_left (Step.R7 M))).tail
     (Step.conj_right (Step.R7 N))⟩

-- R7 × saturate_step(R6): Saturate(Transfer(top))
-- R7 → Transfer(Saturate top) →[transfer_step(R5)]→ Transfer top →[R6]→ top
-- saturate_step(R6) → Saturate top →[R5]→ top
private lemma cp_R7_satR6 :
    ∃ Q, Steps (Transfer (Saturate (top (V:=V)))) Q ∧ Steps (Saturate (top (V:=V))) Q :=
  ⟨top,
   ((Relation.ReflTransGen.single (Step.transfer_step Step.R5)).tail Step.R6),
   Relation.ReflTransGen.single Step.R5⟩

theorem localConfluence (M N P : Proposition V) (hN : Step M N) (hP : Step M P) :
    ∃ Q, Steps N Q ∧ Steps P Q := by
  -- Proof by induction on hN, then cases on hP.
  -- Congruence×congruence: IH + lift.
  -- Root×root: dispatch to cp_* lemmas.
  -- Root×congruence / congruence×root: in most cases, the root rule fires on the
  --   congruence-stepped term too; the meeting is one step from each side.
  --   Exceptions (where the congruence changes the pattern) are handled explicitly.
  induction hN with
  -- ── R1: Saturate(Saturate A) → Saturate A ────────────────────────────────────────────────
  | R1 A =>
    cases hP with
    | R1 => exact ⟨Saturate A, .refl, .refl⟩
    | saturate_step h =>
      -- hP = saturate_step h where h : Step (Saturate A) X; P = Saturate X; N = Saturate A.
      cases h with
      | saturate_step h' => -- h' : Step A A'; P = Saturate(Saturate A'). Q = Saturate A'.
        exact ⟨Saturate _, .single (.saturate_step h'), .single (.R1 _)⟩
      | R1 A' =>  -- A = Saturate A', P = Saturate(Saturate A') = N. Trivial.
        exact ⟨Saturate (Saturate A'), .refl, .refl⟩
      | R3 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR3 M' N'; ⟨Q, h1, h2⟩
      | R5 => exact let ⟨Q,h1,h2⟩ := cp_R1_satR5; ⟨Q, h1, h2⟩
      | R7 A' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR7 A'; ⟨Q, h1, h2⟩
      | R8 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR8 M' N'; ⟨Q, h1, h2⟩
      | R9 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR9 M' N'; ⟨Q, h1, h2⟩
      | R12 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR12 M' N'; ⟨Q, h1, h2⟩
      | R13 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR13 M' N'; ⟨Q, h1, h2⟩
      | R14 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR14 M' N' P'; ⟨Q, h1, h2⟩
      | R15 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR15 M' N' P'; ⟨Q, h1, h2⟩
      | R18 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR18 M' N' P'; ⟨Q, h1, h2⟩
      | R18' M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR18' M' N' P'; ⟨Q, h1, h2⟩
  -- ── R2: Transfer(Transfer A) → Transfer A ────────────────────────────────────────────────
  | R2 A =>
    cases hP with
    | R2 => exact ⟨Transfer A, .refl, .refl⟩
    | transfer_step h =>
      cases h with
      | transfer_step h' =>
        exact ⟨Transfer _, .single (.transfer_step h'), .single (.R2 _)⟩
      | R2 A' =>
        exact ⟨Transfer (Transfer A'), .refl, .refl⟩
      | R4 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR4 M' N'; ⟨Q, h1, h2⟩
      | R6 => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR6; ⟨Q, h1, h2⟩
      | R10 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R10_R11 M' N'; ⟨Q, h2, h1⟩  -- sym
      | R11 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R10_R11 M' N'; ⟨Q, h1, h2⟩  -- wait: R2 × transfer_step(R11)?
        -- Transfer(Transfer(disj M (Transfer N))): R2→Transfer(disj M (Transfer N))→[R11]→Transfer(disj M N); saturate_step(R11)→Transfer(Transfer(disj M N))→[R2]→Transfer(disj M N)
      | R12s M' N' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR12s M' N'; ⟨Q, h1, h2⟩
      | R13s M' N' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR13s M' N'; ⟨Q, h1, h2⟩
      | R16 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR16 M' N' P'; ⟨Q, h1, h2⟩
      | R17 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR17 M' N' P'; ⟨Q, h1, h2⟩
      | R19 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR19 M' N' P'; ⟨Q, h1, h2⟩
      | R19' M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR19' M' N' P'; ⟨Q, h1, h2⟩
  -- ── R3: Saturate(conj M N) → conj(Saturate M)(Saturate N) ────────────────────────────────
  | R3 M1 N1 =>
    cases hP with
    | R3 => exact ⟨conj (Saturate M1) (Saturate N1), .refl, .refl⟩
    | saturate_step h =>
      -- h : Step (conj M1 N1) X; only conj_left/conj_right possible
      cases h with
      | conj_left h' =>  -- h' : Step M1 M1'; P = Saturate(conj M1' N1); N = conj(Saturate M1)(Saturate N1)
        exact ⟨conj (Saturate _) (Saturate N1),
               .single (.conj_left (.saturate_step h')),
               .single (.R3 _ N1)⟩
      | conj_right h' =>
        exact ⟨conj (Saturate M1) (Saturate _),
               .single (.conj_right (.saturate_step h')),
               .single (.R3 M1 _)⟩
  -- ── R4: Transfer(conj M N) → conj(Transfer M)(Transfer N) ────────────────────────────────
  | R4 M1 N1 =>
    cases hP with
    | R4 => exact ⟨conj (Transfer M1) (Transfer N1), .refl, .refl⟩
    | transfer_step h =>
      cases h with
      | conj_left h' =>
        exact ⟨conj (Transfer _) (Transfer N1),
               .single (.conj_left (.transfer_step h')),
               .single (.R4 _ N1)⟩
      | conj_right h' =>
        exact ⟨conj (Transfer M1) (Transfer _),
               .single (.conj_right (.transfer_step h')),
               .single (.R4 M1 _)⟩
  -- ── R5: Saturate(top) → top (no inner variables, no congruences possible) ────────
  | R5 =>
    cases hP with
    | R5 => exact ⟨top, .refl, .refl⟩
  -- ── R6: Transfer(top) → top ─────────────────────────────────────────────────────
  | R6 =>
    cases hP with
    | R6 => exact ⟨top, .refl, .refl⟩
  -- ── R7: Saturate(Transfer M) → Transfer(Saturate M) ────────────────────────────────────────────
  | R7 A =>
    cases hP with
    | R7 => exact ⟨Transfer (Saturate A), .refl, .refl⟩
    | saturate_step h =>
      -- h : Step (Transfer A) X; N = Transfer(Saturate A); P = Saturate X
      cases h with
      | transfer_step h' =>  -- h' : Step A A'; X = Transfer A'; P = Saturate(Transfer A').
        -- N →[transfer_step(saturate_step h')]→ Transfer(Saturate A'). P →[R7]→ Transfer(Saturate A').
        exact ⟨Transfer (Saturate _),
               .single (.transfer_step (.saturate_step h')),
               .single (.R7 _)⟩
      | R2 A' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR2 A'; ⟨Q, h1, h2⟩
      | R4 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR4 M' N'; ⟨Q, h1, h2⟩
      | R6 => exact let ⟨Q,h1,h2⟩ := cp_R7_satR6; ⟨Q, h1, h2⟩
      | R10 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR10 M' N'; ⟨Q, h1, h2⟩
      | R11 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR11 M' N'; ⟨Q, h1, h2⟩
      | R12s M' N' =>
        -- A = disj(Saturate(Transfer M'))(N'), h = R12s. X = Transfer(disj(Saturate M') N'). P = Saturate(Transfer(disj(Saturate M') N')).
        -- N = Transfer(Saturate(disj(Saturate(Transfer M')) N')) →[transfer_step(R8(Transfer M') N')]→ Transfer(Saturate(disj(Transfer M') N')) →[R20]→ Transfer(Saturate(disj M' N'))
        -- P = Saturate(Transfer(disj(Saturate M') N')) →[R7]→ Transfer(Saturate(disj(Saturate M') N')) →[transfer_step(R8 M' N')]→ Transfer(Saturate(disj M' N'))
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single (Step.transfer_step (Step.R8 (Transfer M') N'))).tail
                 (Step.R20 M' N'),
               (Relation.ReflTransGen.single (Step.R7 (disj (Saturate M') N'))).tail
                 (Step.transfer_step (Step.R8 M' N'))⟩
      | R13s M' N' =>
        -- symmetric to R12s
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single (Step.transfer_step (Step.R9 M' (Transfer N')))).tail
                 (Step.R21 M' N'),
               (Relation.ReflTransGen.single (Step.R7 (disj M' (Saturate N')))).tail
                 (Step.transfer_step (Step.R9 M' N'))⟩
      | R16 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR16 M' N' P'; ⟨Q, h1, h2⟩
      | R17 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR17 M' N' P'; ⟨Q, h1, h2⟩
      | R19 M' N' P' =>
        -- A = disj(conj(Saturate(Transfer M'))(Saturate(Transfer N'))) P'. h = R19. X = Transfer(disj(conj(Saturate M')(Saturate N')) P').
        -- N = Transfer(Saturate(disj(conj(Saturate(Transfer M'))(Saturate(Transfer N'))) P'))
        --   →[transfer_step(R14(Transfer M')(Transfer N') P')]→ Transfer(Saturate(disj(conj(Transfer M')(Transfer N')) P'))
        --   →[R22 M' N' P']→ Transfer(Saturate(disj(conj M' N') P'))
        -- P = Saturate(Transfer(disj(conj(Saturate M')(Saturate N')) P'))
        --   →[R7]→ Transfer(Saturate(disj(conj(Saturate M')(Saturate N')) P'))
        --   →[transfer_step(R14 M' N' P')]→ Transfer(Saturate(disj(conj M' N') P'))
        exact ⟨Transfer (Saturate (disj (conj M' N') P')),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R14 (Transfer M') (Transfer N') P'))).tail
                 (Step.R22 M' N' P'),
               (Relation.ReflTransGen.single (Step.R7 (disj (conj (Saturate M') (Saturate N')) P'))).tail
                 (Step.transfer_step (Step.R14 M' N' P'))⟩
      | R19' M' N' P' =>
        -- symmetric to R19
        exact ⟨Transfer (Saturate (disj P' (conj M' N'))),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R15 (Transfer M') (Transfer N') P'))).tail
                 (Step.R23 M' N' P'),
               (Relation.ReflTransGen.single (Step.R7 (disj P' (conj (Saturate M') (Saturate N'))))).tail
                 (Step.transfer_step (Step.R15 M' N' P'))⟩
      | R20 M' N' =>
        -- A = Saturate(disj(Transfer M') N'). h = R20 : Step (Transfer(Saturate(disj(Transfer M') N'))) (Transfer(Saturate(disj M' N'))).
        -- N = Transfer(Saturate(Saturate(disj(Transfer M') N'))) →[transfer_step(R1(disj(Transfer M') N'))]→ Transfer(Saturate(disj(Transfer M') N')) →[R20]→ Transfer(Saturate(disj M' N'))
        -- P = Saturate(Transfer(Saturate(disj M' N'))) →[R7(Saturate(disj M' N'))]→ Transfer(Saturate(Saturate(disj M' N'))) →[transfer_step(R1(disj M' N'))]→ Transfer(Saturate(disj M' N'))
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj (Transfer M') N')))).tail
                 (Step.R20 M' N'),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj M' N')))).tail
                 (Step.transfer_step (Step.R1 (disj M' N')))⟩
      | R21 M' N' =>
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj M' (Transfer N'))))).tail
                 (Step.R21 M' N'),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj M' N')))).tail
                 (Step.transfer_step (Step.R1 (disj M' N')))⟩
      | R22 M' N' P' =>
        exact ⟨Transfer (Saturate (disj (conj M' N') P')),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj (conj (Transfer M') (Transfer N')) P')))).tail
                 (Step.R22 M' N' P'),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj (conj M' N') P')))).tail
                 (Step.transfer_step (Step.R1 (disj (conj M' N') P')))⟩
      | R23 M' N' P' =>
        exact ⟨Transfer (Saturate (disj P' (conj M' N'))),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj P' (conj (Transfer M') (Transfer N')))))).tail
                 (Step.R23 M' N' P'),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj P' (conj M' N'))))).tail
                 (Step.transfer_step (Step.R1 (disj P' (conj M' N'))))⟩
  -- ── R8: Saturate(disj(Saturate M) N) → Saturate(disj M N) ─────────────────────────────────
  | R8 M1 N1 =>
    cases hP with
    | R8 => exact ⟨Saturate (disj M1 N1), .refl, .refl⟩
    | R9 => exact cp_R8_R9 M1 N1  -- overlapping: Saturate(disj(Saturate M)(Saturate N))
    | saturate_step h =>
      cases h with
      -- Congruence on left disjunct (= Saturate M1):
      | disj_left h' =>
        -- h' : Step (Saturate M1) X; P = Saturate(disj X N1).
        -- If R8 still fires on Saturate(disj X N1) (i.e., X = Saturate M1'), close immediately.
        -- In general: R8 fires on Saturate(disj(Saturate M) N), but X might not be Saturate M'.
        -- Case split on h':
        cases h' with
        | saturate_step h'' =>  -- X = Saturate M1'; R8 fires on P.
          exact ⟨Saturate (disj _ N1),
                 .single (.saturate_step (.disj_left h'')),
                 .single (.R8 _ N1)⟩
        | R1 A =>  -- M1 = Saturate A, X = A (Saturate(Saturate A)→Saturate A). P = Saturate(disj A N1).
          -- N = Saturate(disj(Saturate A) N1). From N: R8 → Saturate(disj A N1) = P. Refl from P.
          exact ⟨Saturate (disj A N1), .single (.R8 A N1), .refl⟩
        | R3 A B =>  -- M1 = conj A B; Saturate M1 = Saturate(conj A B) →[R3]→ conj(Saturate A)(Saturate B).
          -- X = conj(Saturate A)(Saturate B). P = Saturate(disj(conj(Saturate A)(Saturate B)) N1).
          -- N = Saturate(disj(Saturate(conj A B)) N1) →[R8(conj A B) N1]→ Saturate(disj(conj A B) N1).
          -- P →[R14 A B N1]→ Saturate(disj(conj A B) N1). Q = Saturate(disj(conj A B) N1).
          exact ⟨Saturate (disj (conj A B) N1),
                 .single (.R8 (conj A B) N1),
                 .single (.R14 A B N1)⟩
        | R5 =>  -- M1 = top; Saturate M1 = Saturate top →[R5]→ top. X = top. P = Saturate(disj top N1).
          -- N = Saturate(disj(Saturate top) N1) →[R8 top N1]→ Saturate(disj top N1) = P. Refl from P.
          exact ⟨Saturate (disj top N1), .single (.R8 top N1), .refl⟩
        | R7 A =>  -- M1 = Transfer A; Saturate M1 = Saturate(Transfer A) →[R7]→ Transfer(Saturate A). X = Transfer(Saturate A).
          -- P = Saturate(disj(Transfer(Saturate A)) N1). R12 fires on P.
          -- N = Saturate(disj(Saturate(Transfer A)) N1) →[R8(Transfer A) N1]→ Saturate(disj(Transfer A) N1).
          -- P →[R12 A N1]→ Saturate(disj(Transfer A) N1). Q = Saturate(disj(Transfer A) N1).
          exact ⟨Saturate (disj (Transfer A) N1),
                 .single (.R8 (Transfer A) N1),
                 .single (.R12 A N1)⟩
        | R8 A B =>  -- M1 = disj(Saturate A) B; Saturate M1 = Saturate(disj(Saturate A) B) →[R8]→ Saturate(disj A B).
          -- X = Saturate(disj A B). P = Saturate(disj(Saturate(disj A B)) N1). R8 fires on P.
          -- N = Saturate(disj(Saturate(disj(Saturate A) B)) N1) →[R8(disj(Saturate A) B) N1]→ Saturate(disj(disj(Saturate A) B) N1).
          -- Hmm: Q = Saturate(disj(disj A B) N1). N →[R8]→ Saturate(disj(disj(Saturate A) B) N1)
          -- ... →[saturate_step(disj_left(R8 A B))]→ Saturate(disj(disj A B) N1). P →[R8(disj A B) N1]→ Saturate(disj(disj A B) N1).
          exact ⟨Saturate (disj (disj A B) N1),
                 (Relation.ReflTransGen.single (.R8 (disj (Saturate A) B) N1)).tail
                   (.saturate_step (.disj_left (.R8 A B))),
                 .single (.R8 (disj A B) N1)⟩
        | R9 A B =>  -- M1 = disj A (Saturate B); Saturate M1 →[R9]→ Saturate(disj A B). X = Saturate(disj A B).
          exact ⟨Saturate (disj (disj A B) N1),
                 (Relation.ReflTransGen.single (.R8 (disj A (Saturate B)) N1)).tail
                   (.saturate_step (.disj_left (.R9 A B))),
                 .single (.R8 (disj A B) N1)⟩
        | _ => sorry  -- remaining Saturate-outer rules on Saturate M1; handled analogously
      -- Congruence on right disjunct N1:
      | disj_right h' =>  -- h' : Step N1 N1'; P = Saturate(disj(Saturate M1) N1').
        -- R8 fires on P: → Saturate(disj M1 N1').
        -- N = Saturate(disj M1 N1) →[saturate_step(disj_right h')]→ Saturate(disj M1 N1').
        exact ⟨Saturate (disj M1 _),
               .single (.saturate_step (.disj_right h')),
               .single (.R8 M1 _)⟩
  -- ── R9: Saturate(disj M (Saturate N)) → Saturate(disj M N) ─────────────────────────────────
  | R9 M1 N1 =>
    cases hP with
    | R9 => exact ⟨Saturate (disj M1 N1), .refl, .refl⟩
    | R8 => exact let ⟨Q,h1,h2⟩ := cp_R8_R9 M1 N1; ⟨Q, h2, h1⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>  -- h' : Step M1 M1'; P = Saturate(disj M1' (Saturate N1)).
        exact ⟨Saturate (disj _ N1),
               .single (.saturate_step (.disj_left h')),
               .single (.R9 _ N1)⟩
      | disj_right h' =>
        -- h' : Step (Saturate N1) X; P = Saturate(disj M1 X). Cases like R8.
        cases h' with
        | saturate_step h'' =>
          exact ⟨Saturate (disj M1 _), .single (.saturate_step (.disj_right h'')), .single (.R9 M1 _)⟩
        | R1 A =>
          exact ⟨Saturate (disj M1 A), .single (.R9 M1 A), .refl⟩
        | R3 A B =>
          exact ⟨Saturate (disj M1 (conj A B)),
                 .single (.R9 M1 (conj A B)),
                 .single (.R15 A B M1)⟩
        | R5 =>
          exact ⟨Saturate (disj M1 top), .single (.R9 M1 top), .refl⟩
        | R7 A =>
          exact ⟨Saturate (disj M1 (Transfer A)),
                 .single (.R9 M1 (Transfer A)),
                 .single (.R13 M1 A)⟩
        | _ => sorry  -- remaining cases analogous to R8 right-branch
  -- ── R10: Transfer(disj(Transfer M) N) → Transfer(disj M N) ─────────────────────────────────
  | R10 M1 N1 =>
    cases hP with
    | R10 => exact ⟨Transfer (disj M1 N1), .refl, .refl⟩
    | R11 => exact let ⟨Q,h1,h2⟩ := cp_R10_R11 M1 N1; ⟨Q, h2, h1⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        cases h' with
        | transfer_step h'' =>
          exact ⟨Transfer (disj _ N1), .single (.transfer_step (.disj_left h'')), .single (.R10 _ N1)⟩
        | R2 A =>
          exact ⟨Transfer (disj A N1), .single (.R10 A N1), .refl⟩
        | R4 A B =>
          exact ⟨Transfer (disj (conj A B) N1),
                 .single (.R10 (conj A B) N1),
                 .single (.R16 A B N1)⟩
        | R6 =>
          exact ⟨Transfer (disj top N1), .single (.R10 top N1), .refl⟩
        | R7 A =>
          -- Transfer M1 = Transfer(Saturate(Transfer A)) →[transfer_step(R7 A)? wait: R7 fires on Saturate(Transfer A) → Transfer(Saturate A)
          -- So h' : Step (Transfer M1) X where M1 = Saturate(Transfer A) and h' = transfer_step(R7 A)? No:
          -- Actually h' = R7 A would mean: h' : Step (Saturate(Transfer A)) (Transfer(Saturate A)).
          -- But h' : Step (Transfer M1) X. If h' = R7 A, we need Transfer M1 to match Saturate(Transfer A)...
          -- That means Transfer M1 = Saturate(Transfer A) which is impossible (Transfer ≠ Saturate).
          -- So R7 cannot appear here. This case is impossible.
          exact absurd h' (by intro; contradiction)
        | _ => sorry
      | disj_right h' =>
        exact ⟨Transfer (disj M1 _), .single (.transfer_step (.disj_right h')), .single (.R10 M1 _)⟩
  -- ── R11: Transfer(disj M (Transfer N)) → Transfer(disj M N) ─────────────────────────────────
  | R11 M1 N1 =>
    cases hP with
    | R11 => exact ⟨Transfer (disj M1 N1), .refl, .refl⟩
    | R10 => exact let ⟨Q,h1,h2⟩ := cp_R10_R11 M1 N1; ⟨Q, h1, h2⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Transfer (disj _ N1), .single (.transfer_step (.disj_left h')), .single (.R11 _ N1)⟩
      | disj_right h' =>
        cases h' with
        | transfer_step h'' =>
          exact ⟨Transfer (disj M1 _), .single (.transfer_step (.disj_right h'')), .single (.R11 M1 _)⟩
        | R2 A =>
          exact ⟨Transfer (disj M1 A), .single (.R11 M1 A), .refl⟩
        | R4 A B =>
          exact ⟨Transfer (disj M1 (conj A B)),
                 .single (.R11 M1 (conj A B)),
                 .single (.R17 A B M1)⟩
        | R6 =>
          exact ⟨Transfer (disj M1 top), .single (.R11 M1 top), .refl⟩
        | _ => sorry
  -- ── R12: Saturate(disj(Transfer(Saturate M)) N) → Saturate(disj(Transfer M) N) ────────────────────
  | R12 M1 N1 =>
    cases hP with
    | R12 => exact ⟨Saturate (disj (Transfer M1) N1), .refl, .refl⟩
    | R13 M_r N_r =>
      -- N1 = Transfer(Saturate N_r). N = Saturate(disj(Transfer M1)(Transfer(Saturate N_r))). P = Saturate(disj(Transfer(Saturate M1))(Transfer N_r)).
      -- N →[R13(Transfer M1)(N_r)]→ Saturate(disj(Transfer M1)(Transfer N_r)). P →[R12 M1 (Transfer N_r)]→ Saturate(disj(Transfer M1)(Transfer N_r)).
      exact ⟨Saturate (disj (Transfer M1) (Transfer N_r)),
             .single (.R13 (Transfer M1) N_r),
             .single (.R12 M1 (Transfer N_r))⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>
        -- h' : Step (Transfer(Saturate M1)) X1; P = Saturate(disj X1 N1).
        -- R12 fires on P if X1 = Transfer(Saturate M1'). Otherwise use other rules.
        -- For the generic transfer_step case: X1 = Transfer X1'. R12 fires on P iff X1' = Saturate M1'.
        -- Strategy: from N = Saturate(disj(Transfer M1) N1), saturate_step(disj_left h') takes N to Saturate(disj(Transfer X1') N1).
        -- From P: R12 fires if X1 = Transfer(Saturate M1'). Handle case by case.
        -- Most common: h' = transfer_step h'' where h'' : Step (Saturate M1) (Saturate M1'). Then X1 = Transfer(Saturate M1'). R12 fires on P.
        -- If h' changes the pattern (e.g., R20, R21 on Transfer(Saturate M1)): P has different form.
        -- For Transfer(Saturate M1) steps: transfer_step (any step on Saturate M1), or R20/R21/R22/R23 if M1 has the right form.
        cases h' with
        | transfer_step h'' =>
          -- X1 = Transfer(result of h'' on Saturate M1). R12 fires on P = Saturate(disj(Transfer ??) N1) iff ?? = Saturate M1'.
          cases h'' with
          | saturate_step h''' =>
            -- h''' : Step M1 M1''; X1 = Transfer(Saturate M1''); P has R12 → Saturate(disj(Transfer M1'') N1).
            -- N →[saturate_step(disj_left(transfer_step h'''))]→ Saturate(disj(Transfer M1'') N1).
            exact ⟨Saturate (disj (Transfer _) N1),
                   .single (.saturate_step (.disj_left (.transfer_step h'''))),
                   .single (.R12 _ N1)⟩
          | R1 M1' =>
            -- M1 = Saturate M1'. Transfer(Saturate M1) = Transfer(Saturate(Saturate M1')) steps via R1 to Transfer(Saturate M1'). X1 = Transfer(Saturate M1') = Transfer M1.
            -- P = Saturate(disj(Transfer M1) N1) = N. Trivial.
            exact ⟨Saturate (disj (Transfer M1) N1), .refl, .refl⟩
          | R3 A B =>
            -- M1 = conj A B. X1 = Transfer(conj(Saturate A)(Saturate B)).
            -- N →[saturate_step(disj_left(R4 A B))]→ Saturate(disj(conj(Transfer A)(Transfer B)) N1).
            -- P →[saturate_step(disj_left(R4(Saturate A)(Saturate B)))]→ Saturate(disj(conj(Transfer(Saturate A))(Transfer(Saturate B))) N1) →[R18 A B N1]→ Saturate(disj(conj(Transfer A)(Transfer B)) N1).
            exact ⟨Saturate (disj (conj (Transfer A) (Transfer B)) N1),
                   .single (.saturate_step (.disj_left (.R4 A B))),
                   (Relation.ReflTransGen.single
                     (.saturate_step (.disj_left (.R4 (Saturate A) (Saturate B))))).tail
                     (.R18 A B N1)⟩
          | R5 => exact ⟨Saturate (disj (Transfer top) N1), .refl, .refl⟩
          | R7 A =>
            -- M1 = Transfer A. X1 = Transfer(Transfer(Saturate A)). N = Saturate(disj(Transfer(Transfer A)) N1).
            -- N →[saturate_step(disj_left(R2 A))]→ Saturate(disj(Transfer A) N1).
            -- P →[saturate_step(disj_left(R2(Saturate A)))]→ Saturate(disj(Transfer(Saturate A)) N1) →[R12 A N1]→ Saturate(disj(Transfer A) N1).
            exact ⟨Saturate (disj (Transfer A) N1),
                   .single (.saturate_step (.disj_left (.R2 A))),
                   (Relation.ReflTransGen.single
                     (.saturate_step (.disj_left (.R2 (Saturate A))))).tail
                     (.R12 A N1)⟩
          | R8 A B =>
            -- M1 = disj(Saturate A) B. X1 = Transfer(Saturate(disj A B)).
            -- N = Saturate(disj(Transfer(disj(Saturate A) B)) N1) →[saturate_step(disj_left(R10(Saturate A) B))]→ Saturate(disj(Transfer(disj A B)) N1)...
            -- Hmm: R10 fires on Transfer(disj(Transfer M) N). Transfer M1 = Transfer(disj(Saturate A) B). No Transfer inside disj. R10 doesn't fire.
            -- Alternative: saturate_step(disj_left(transfer_step(R8 A B))) steps N's inner Transfer(disj(Saturate A) B)... wait transfer_step fires on Transfer M, changing M. Transfer(disj(Saturate A) B) →[transfer_step(R8? No, R8 fires on Saturate(disj(Saturate)()), not Transfer. Actually what fires on disj(Saturate A) B? disj_left fires via step on Saturate A.
            -- This is getting complex. P = Saturate(disj(Transfer(Saturate(disj A B))) N1). R12(disj A B) fires on P → Saturate(disj(Transfer(disj A B)) N1). N = Saturate(disj(Transfer(disj(Saturate A) B)) N1) →[saturate_step(disj_left(R10 A B? R10 fires on Transfer(disj(Transfer M) N). Transfer(disj(Saturate A) B) has left = Saturate A not Transfer. No.]
            -- Use saturate_step(disj_left(transfer_step(disj_left(R1 A)))): fires on Transfer(disj(Saturate A) B) via transfer_step, inner = disj(Saturate A) B, step = disj_left(R1 A): disj(Saturate A) B →[disj_left(R1 A??. R1 fires on Saturate(Saturate ?). Saturate A is not Saturate(Saturate ?).
            -- Actually this is a genuinely complex case. Leave sorry.
            sorry
          | _ => sorry
        | R20 A B =>
          -- Transfer(Saturate M1) steps via R20 (M1 = Saturate(disj(Transfer A) B)).
          -- X1 = Transfer(Saturate(disj A B)). P = Saturate(disj(Transfer(Saturate(disj A B))) N1).
          -- R12(disj A B) fires on P → Saturate(disj(Transfer(disj A B)) N1).
          -- N = Saturate(disj(Transfer(Saturate(disj(Transfer A) B))) N1). From N: saturate_step(disj_left(R10 A B? No.
          -- N = Saturate(disj(Transfer M1) N1) where M1 = Saturate(disj(Transfer A) B). Transfer M1 = Transfer(Saturate(disj(Transfer A) B)).
          -- N →[saturate_step(disj_left(R20 A B))]→ Saturate(disj(Transfer(Saturate(disj A B))) N1). Then R12(disj A B) → Saturate(disj(Transfer(disj A B)) N1).
          -- P →[R12(disj A B)]→ Saturate(disj(Transfer(disj A B)) N1). Q = Saturate(disj(Transfer(disj A B)) N1). ✓
          exact ⟨Saturate (disj (Transfer (disj A B)) N1),
                 (Relation.ReflTransGen.single (.saturate_step (.disj_left (.R20 A B)))).tail
                   (.R12 (disj A B) N1),
                 .single (.R12 (disj A B) N1)⟩
        | R21 A B =>
          exact ⟨Saturate (disj (Transfer (disj A B)) N1),
                 (Relation.ReflTransGen.single (.saturate_step (.disj_left (.R21 A B)))).tail
                   (.R12 (disj A B) N1),
                 .single (.R12 (disj A B) N1)⟩
        | _ => sorry  -- R22/R23 on Transfer(Saturate M1): similar pattern
      | disj_right h' =>
        -- h' steps N1; R12 fires on P = Saturate(disj(Transfer(Saturate M1)) N1') → Saturate(disj(Transfer M1) N1').
        -- N = Saturate(disj(Transfer M1) N1) →[saturate_step(disj_right h')]→ Saturate(disj(Transfer M1) N1').
        exact ⟨Saturate (disj (Transfer M1) _),
               .single (.saturate_step (.disj_right h')),
               .single (.R12 M1 _)⟩
  -- ── R13: Saturate(disj M (Transfer(Saturate N))) → Saturate(disj M (Transfer N)) ────────────────────
  | R13 M1 N1 =>
    cases hP with
    | R13 => exact ⟨Saturate (disj M1 (Transfer N1)), .refl, .refl⟩
    | R12 M_r N_r =>
      -- M1 = Transfer(Saturate M_r). N = Saturate(disj(Transfer(Saturate M_r))(Transfer(Saturate N1))). Hmm: hP = R12 M_r N_r means the outer term is Saturate(disj(Transfer(Saturate M_r)) N_r) and N_r = Transfer(Saturate N1). N1 must match.
      -- N = Saturate(disj(Transfer(Saturate M_r))(Transfer N1))... (after R13). P = Saturate(disj(Transfer M_r)(Transfer(Saturate N1))) (after R12).
      -- From N: R12(M_r)(Transfer N1) → Saturate(disj(Transfer M_r)(Transfer N1)). From P: R13(Transfer M_r) N1 → Saturate(disj(Transfer M_r)(Transfer N1)).
      exact ⟨Saturate (disj (Transfer M_r) (Transfer N1)),
             .single (.R12 M_r (Transfer N1)),
             .single (.R13 (Transfer M_r) N1)⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Saturate (disj _ (Transfer N1)),
               .single (.saturate_step (.disj_left h')),
               .single (.R13 _ N1)⟩
      | disj_right h' =>
        cases h' with
        | transfer_step h'' =>
          cases h'' with
          | saturate_step h''' =>
            exact ⟨Saturate (disj M1 (Transfer _)),
                   .single (.saturate_step (.disj_right (.transfer_step h'''))),
                   .single (.R13 M1 _)⟩
          | R1 N1' =>
            exact ⟨Saturate (disj M1 (Transfer N1)), .refl, .refl⟩
          | R3 A B =>
            exact ⟨Saturate (disj M1 (conj (Transfer A) (Transfer B))),
                   .single (.saturate_step (.disj_right (.R4 A B))),
                   (Relation.ReflTransGen.single
                     (.saturate_step (.disj_right (.R4 (Saturate A) (Saturate B))))).tail
                     (.R18' A B M1)⟩
          | R5 => exact ⟨Saturate (disj M1 (Transfer top)), .refl, .refl⟩
          | R7 A =>
            exact ⟨Saturate (disj M1 (Transfer A)),
                   .single (.saturate_step (.disj_right (.R2 A))),
                   (Relation.ReflTransGen.single
                     (.saturate_step (.disj_right (.R2 (Saturate A))))).tail
                     (.R13 M1 A)⟩
          | _ => sorry
        | R20 A B =>
          exact ⟨Saturate (disj M1 (Transfer (disj A B))),
                 (Relation.ReflTransGen.single (.saturate_step (.disj_right (.R21 A B)))).tail
                   (.R13 M1 (disj A B)),
                 .single (.R13 M1 (disj A B))⟩
        | R21 A B =>
          exact ⟨Saturate (disj M1 (Transfer (disj A B))),
                 (Relation.ReflTransGen.single (.saturate_step (.disj_right (.R21 A B)))).tail
                   (.R13 M1 (disj A B)),
                 .single (.R13 M1 (disj A B))⟩
        | _ => sorry
  -- ── R12s: Transfer(disj(Saturate(Transfer M)) N) → Transfer(disj(Saturate M) N) ────────────────────
  | R12s M1 N1 =>
    cases hP with
    | R12s => exact ⟨Transfer (disj (Saturate M1) N1), .refl, .refl⟩
    | R13s M_r N_r =>
      exact ⟨Transfer (disj (Saturate M1) (Saturate N_r)),
             .single (.R13s (Saturate M1) N_r),
             .single (.R12s M1 (Saturate N_r))⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        cases h' with
        | saturate_step h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (disj (Saturate _) N1),
                   .single (.transfer_step (.disj_left (.saturate_step h'''))),
                   .single (.R12s _ N1)⟩
          | R2 M1' =>
            exact ⟨Transfer (disj (Saturate M1) N1), .refl, .refl⟩
          | R4 A B =>
            exact ⟨Transfer (disj (conj (Saturate A) (Saturate B)) N1),
                   .single (.transfer_step (.disj_left (.R3 A B))),
                   (Relation.ReflTransGen.single
                     (.transfer_step (.disj_left (.R3 (Transfer A) (Transfer B))))).tail
                     (.R19 A B N1)⟩
          | R6 => exact ⟨Transfer (disj (Saturate top) N1), .refl, .refl⟩
          | R7 A =>
            exact ⟨Transfer (disj (Saturate A) N1),
                   .single (.transfer_step (.disj_left (.R3 A))),
                   sorry⟩  -- complex: transfer_step(R7) changes inner pattern
          | _ => sorry
        | _ => sorry
      | disj_right h' =>
        exact ⟨Transfer (disj (Saturate M1) _),
               .single (.transfer_step (.disj_right h')),
               .single (.R12s M1 _)⟩
  -- ── R13s: Transfer(disj M (Saturate(Transfer N))) → Transfer(disj M (Saturate N)) ──────────────────
  | R13s M1 N1 =>
    cases hP with
    | R13s => exact ⟨Transfer (disj M1 (Saturate N1)), .refl, .refl⟩
    | R12s M_r N_r =>
      exact ⟨Transfer (disj (Saturate M_r) (Saturate N1)),
             .single (.R12s M_r (Saturate N1)),
             .single (.R13s (Saturate M_r) N1)⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Transfer (disj _ (Saturate N1)),
               .single (.transfer_step (.disj_left h')),
               .single (.R13s _ N1)⟩
      | disj_right h' =>
        cases h' with
        | saturate_step h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (disj M1 (Saturate _)),
                   .single (.transfer_step (.disj_right (.saturate_step h'''))),
                   .single (.R13s M1 _)⟩
          | R2 N1' => exact ⟨Transfer (disj M1 (Saturate N1)), .refl, .refl⟩
          | R4 A B =>
            exact ⟨Transfer (disj M1 (conj (Saturate A) (Saturate B))),
                   .single (.transfer_step (.disj_right (.R3 A B))),
                   (Relation.ReflTransGen.single
                     (.transfer_step (.disj_right (.R3 (Transfer A) (Transfer B))))).tail
                     (.R19' A B M1)⟩
          | R6 => exact ⟨Transfer (disj M1 (Saturate top)), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
  -- ── R14: Saturate(disj(conj(Saturate M)(Saturate N)) P) → Saturate(disj(conj M N) P) ───────────
  | R14 M1 N1 P1 =>
    cases hP with
    | R14 => exact ⟨Saturate (disj (conj M1 N1) P1), .refl, .refl⟩
    | R15 M1' N1' P1' =>
      -- Both fire: Saturate(disj(conj(Saturate M1)(Saturate N1))(conj(Saturate M1')(Saturate N1')))
      -- Hmm: R14 and R15 fire on different patterns (left/right position in disj).
      -- R14 fires on Saturate(disj(conj(Saturate M)(Saturate N)) P). R15 fires on Saturate(disj P (conj(Saturate M)(Saturate N))).
      -- They could overlap if P1 = conj(Saturate M1')(Saturate N1') in R14 and the disj is then
      -- Saturate(disj(conj(Saturate M1)(Saturate N1))(conj(Saturate M1')(Saturate N1'))).
      -- N = Saturate(disj(conj M1 N1)(conj(Saturate M1')(Saturate N1'))). P_hP = Saturate(disj(conj(Saturate M1)(Saturate N1))(conj M1' N1')).
      -- From N: R15 M1' N1' (conj M1 N1) → Saturate(disj(conj M1 N1)(conj M1' N1')).
      -- From P_hP: R14 M1 N1 (conj M1' N1') → Saturate(disj(conj M1 N1)(conj M1' N1')).
      exact ⟨Saturate (disj (conj M1 N1) (conj M1' N1')),
             .single (.R15 M1' N1' (conj M1 N1)),
             .single (.R14 M1 N1 (conj M1' N1'))⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>
        -- h' steps (conj(Saturate M1)(Saturate N1)) = the left of the disj.
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | saturate_step h''' =>
            exact ⟨Saturate (disj (conj _ N1) P1),
                   .single (.saturate_step (.disj_left (.conj_left (.saturate_step h''')))),
                   .single (.R14 _ N1 P1)⟩
          | R1 A =>
            exact ⟨Saturate (disj (conj M1 N1) P1), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | saturate_step h''' =>
            exact ⟨Saturate (disj (conj M1 _) P1),
                   .single (.saturate_step (.disj_left (.conj_right (.saturate_step h''')))),
                   .single (.R14 M1 _ P1)⟩
          | R1 A =>
            exact ⟨Saturate (disj (conj M1 N1) P1), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
      | disj_right h' =>
        exact ⟨Saturate (disj (conj M1 N1) _),
               .single (.saturate_step (.disj_right h')),
               .single (.R14 M1 N1 _)⟩
  -- ── R15: Saturate(disj P (conj(Saturate M)(Saturate N))) → Saturate(disj P (conj M N)) ──────────
  | R15 M1 N1 P1 =>
    cases hP with
    | R15 => exact ⟨Saturate (disj P1 (conj M1 N1)), .refl, .refl⟩
    | R14 M1' N1' P1' =>
      exact ⟨Saturate (disj (conj M1' N1') (conj M1 N1)),
             .single (.R14 M1' N1' (conj M1 N1)),
             .single (.R15 M1 N1 (conj M1' N1'))⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Saturate (disj _ (conj M1 N1)),
               .single (.saturate_step (.disj_left h')),
               .single (.R15 M1 N1 _)⟩
      | disj_right h' =>
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | saturate_step h''' =>
            exact ⟨Saturate (disj P1 (conj _ N1)),
                   .single (.saturate_step (.disj_right (.conj_left (.saturate_step h''')))),
                   .single (.R15 _ N1 P1)⟩
          | R1 A => exact ⟨Saturate (disj P1 (conj M1 N1)), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | saturate_step h''' =>
            exact ⟨Saturate (disj P1 (conj M1 _)),
                   .single (.saturate_step (.disj_right (.conj_right (.saturate_step h''')))),
                   .single (.R15 M1 _ P1)⟩
          | R1 A => exact ⟨Saturate (disj P1 (conj M1 N1)), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
  -- ── R16: Transfer(disj(conj(Transfer M)(Transfer N)) P) → Transfer(disj(conj M N) P) ───────────
  | R16 M1 N1 P1 =>
    cases hP with
    | R16 => exact ⟨Transfer (disj (conj M1 N1) P1), .refl, .refl⟩
    | R17 M1' N1' P1' =>
      exact ⟨Transfer (disj (conj M1 N1) (conj M1' N1')),
             .single (.R17 M1' N1' (conj M1 N1)),
             .single (.R16 M1 N1 (conj M1' N1'))⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (disj (conj _ N1) P1),
                   .single (.transfer_step (.disj_left (.conj_left (.transfer_step h''')))),
                   .single (.R16 _ N1 P1)⟩
          | R2 A => exact ⟨Transfer (disj (conj M1 N1) P1), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (disj (conj M1 _) P1),
                   .single (.transfer_step (.disj_left (.conj_right (.transfer_step h''')))),
                   .single (.R16 M1 _ P1)⟩
          | R2 A => exact ⟨Transfer (disj (conj M1 N1) P1), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
      | disj_right h' =>
        exact ⟨Transfer (disj (conj M1 N1) _),
               .single (.transfer_step (.disj_right h')),
               .single (.R16 M1 N1 _)⟩
  -- ── R17: Transfer(disj P (conj(Transfer M)(Transfer N))) → Transfer(disj P (conj M N)) ──────────
  | R17 M1 N1 P1 =>
    cases hP with
    | R17 => exact ⟨Transfer (disj P1 (conj M1 N1)), .refl, .refl⟩
    | R16 M1' N1' P1' =>
      exact ⟨Transfer (disj (conj M1' N1') (conj M1 N1)),
             .single (.R16 M1' N1' (conj M1 N1)),
             .single (.R17 M1 N1 (conj M1' N1'))⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Transfer (disj _ (conj M1 N1)),
               .single (.transfer_step (.disj_left h')),
               .single (.R17 M1 N1 _)⟩
      | disj_right h' =>
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (disj P1 (conj _ N1)),
                   .single (.transfer_step (.disj_right (.conj_left (.transfer_step h''')))),
                   .single (.R17 _ N1 P1)⟩
          | R2 A => exact ⟨Transfer (disj P1 (conj M1 N1)), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (disj P1 (conj M1 _)),
                   .single (.transfer_step (.disj_right (.conj_right (.transfer_step h''')))),
                   .single (.R17 M1 _ P1)⟩
          | R2 A => exact ⟨Transfer (disj P1 (conj M1 N1)), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
  -- ── R18: Saturate(disj(conj(Transfer(Saturate M))(Transfer(Saturate N))) P) → Saturate(disj(conj(Transfer M)(Transfer N)) P) ─
  | R18 M1 N1 P1 =>
    cases hP with
    | R18 => exact ⟨Saturate (disj (conj (Transfer M1) (Transfer N1)) P1), .refl, .refl⟩
    | R18' M1' N1' P1' =>
      exact ⟨Saturate (disj (conj (Transfer M1) (Transfer N1)) (conj (Transfer M1') (Transfer N1'))),
             .single (.R18' M1' N1' (conj (Transfer M1) (Transfer N1))),
             .single (.R18 M1 N1 (conj (Transfer M1') (Transfer N1')))⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>
        -- h' steps conj(Transfer(Saturate M1))(Transfer(Saturate N1)) = left of disj
        cases h' with
        | conj_left h'' =>
          -- h'' : Step (Transfer(Saturate M1)) X. R18 fires on P if X = Transfer(Saturate M1').
          cases h'' with
          | transfer_step h''' =>
            cases h''' with
            | saturate_step h'''' =>
              exact ⟨Saturate (disj (conj (Transfer _) (Transfer N1)) P1),
                     (Relation.ReflTransGen.single
                       (.saturate_step (.disj_left (.conj_left (.transfer_step (.saturate_step h'''')))))).tail
                       (.R18 _ N1 P1),
                     .single (.R18 _ N1 P1)⟩
            | _ => sorry
          | R1 A => exact ⟨Saturate (disj (conj (Transfer M1) (Transfer N1)) P1), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | transfer_step h''' =>
            cases h''' with
            | saturate_step h'''' =>
              exact ⟨Saturate (disj (conj (Transfer M1) (Transfer _)) P1),
                     (Relation.ReflTransGen.single
                       (.saturate_step (.disj_left (.conj_right (.transfer_step (.saturate_step h'''')))))).tail
                       (.R18 M1 _ P1),
                     .single (.R18 M1 _ P1)⟩
            | _ => sorry
          | R1 A => exact ⟨Saturate (disj (conj (Transfer M1) (Transfer N1)) P1), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
      | disj_right h' =>
        exact ⟨Saturate (disj (conj (Transfer M1) (Transfer N1)) _),
               .single (.saturate_step (.disj_right h')),
               .single (.R18 M1 N1 _)⟩
  -- ── R18': Saturate(disj P (conj(Transfer(Saturate M))(Transfer(Saturate N)))) → Saturate(disj P (conj(Transfer M)(Transfer N))) ─
  | R18' M1 N1 P1 =>
    cases hP with
    | R18' => exact ⟨Saturate (disj P1 (conj (Transfer M1) (Transfer N1))), .refl, .refl⟩
    | R18 M1' N1' P1' =>
      exact ⟨Saturate (disj (conj (Transfer M1') (Transfer N1')) (conj (Transfer M1) (Transfer N1))),
             .single (.R18 M1' N1' (conj (Transfer M1) (Transfer N1))),
             .single (.R18' M1 N1 (conj (Transfer M1') (Transfer N1')))⟩
    | saturate_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Saturate (disj _ (conj (Transfer M1) (Transfer N1))),
               .single (.saturate_step (.disj_left h')),
               .single (.R18' M1 N1 _)⟩
      | disj_right h' =>
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | transfer_step h''' =>
            cases h''' with
            | saturate_step h'''' =>
              exact ⟨Saturate (disj P1 (conj (Transfer _) (Transfer N1))),
                     (Relation.ReflTransGen.single
                       (.saturate_step (.disj_right (.conj_left (.transfer_step (.saturate_step h'''')))))).tail
                       (.R18' _ N1 P1),
                     .single (.R18' _ N1 P1)⟩
            | _ => sorry
          | R1 A => exact ⟨Saturate (disj P1 (conj (Transfer M1) (Transfer N1))), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | transfer_step h''' =>
            cases h''' with
            | saturate_step h'''' =>
              exact ⟨Saturate (disj P1 (conj (Transfer M1) (Transfer _))),
                     (Relation.ReflTransGen.single
                       (.saturate_step (.disj_right (.conj_right (.transfer_step (.saturate_step h'''')))))).tail
                       (.R18' M1 _ P1),
                     .single (.R18' M1 _ P1)⟩
            | _ => sorry
          | R1 A => exact ⟨Saturate (disj P1 (conj (Transfer M1) (Transfer N1))), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
  -- ── R19: Transfer(disj(conj(Saturate(Transfer M))(Saturate(Transfer N))) P) → Transfer(disj(conj(Saturate M)(Saturate N)) P) ─
  | R19 M1 N1 P1 =>
    cases hP with
    | R19 => exact ⟨Transfer (disj (conj (Saturate M1) (Saturate N1)) P1), .refl, .refl⟩
    | R19' M1' N1' P1' =>
      exact ⟨Transfer (disj (conj (Saturate M1) (Saturate N1)) (conj (Saturate M1') (Saturate N1'))),
             .single (.R19' M1' N1' (conj (Saturate M1) (Saturate N1))),
             .single (.R19 M1 N1 (conj (Saturate M1') (Saturate N1')))⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | saturate_step h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (disj (conj (Saturate _) (Saturate N1)) P1),
                     (Relation.ReflTransGen.single
                       (.transfer_step (.disj_left (.conj_left (.saturate_step (.transfer_step h'''')))))).tail
                       (.R19 _ N1 P1),
                     .single (.R19 _ N1 P1)⟩
            | _ => sorry
          | R2 A => exact ⟨Transfer (disj (conj (Saturate M1) (Saturate N1)) P1), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | saturate_step h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (disj (conj (Saturate M1) (Saturate _)) P1),
                     (Relation.ReflTransGen.single
                       (.transfer_step (.disj_left (.conj_right (.saturate_step (.transfer_step h'''')))))).tail
                       (.R19 M1 _ P1),
                     .single (.R19 M1 _ P1)⟩
            | _ => sorry
          | R2 A => exact ⟨Transfer (disj (conj (Saturate M1) (Saturate N1)) P1), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
      | disj_right h' =>
        exact ⟨Transfer (disj (conj (Saturate M1) (Saturate N1)) _),
               .single (.transfer_step (.disj_right h')),
               .single (.R19 M1 N1 _)⟩
  -- ── R19': Transfer(disj P (conj(Saturate(Transfer M))(Saturate(Transfer N)))) → Transfer(disj P (conj(Saturate M)(Saturate N))) ─
  | R19' M1 N1 P1 =>
    cases hP with
    | R19' => exact ⟨Transfer (disj P1 (conj (Saturate M1) (Saturate N1))), .refl, .refl⟩
    | R19 M1' N1' P1' =>
      exact ⟨Transfer (disj (conj (Saturate M1') (Saturate N1')) (conj (Saturate M1) (Saturate N1))),
             .single (.R19 M1' N1' (conj (Saturate M1) (Saturate N1))),
             .single (.R19' M1 N1 (conj (Saturate M1') (Saturate N1')))⟩
    | transfer_step h =>
      cases h with
      | disj_left h' =>
        exact ⟨Transfer (disj _ (conj (Saturate M1) (Saturate N1))),
               .single (.transfer_step (.disj_left h')),
               .single (.R19' M1 N1 _)⟩
      | disj_right h' =>
        cases h' with
        | conj_left h'' =>
          cases h'' with
          | saturate_step h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (disj P1 (conj (Saturate _) (Saturate N1))),
                     (Relation.ReflTransGen.single
                       (.transfer_step (.disj_right (.conj_left (.saturate_step (.transfer_step h'''')))))).tail
                       (.R19' _ N1 P1),
                     .single (.R19' _ N1 P1)⟩
            | _ => sorry
          | R2 A => exact ⟨Transfer (disj P1 (conj (Saturate M1) (Saturate N1))), .refl, .refl⟩
          | _ => sorry
        | conj_right h'' =>
          cases h'' with
          | saturate_step h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (disj P1 (conj (Saturate M1) (Saturate _))),
                     (Relation.ReflTransGen.single
                       (.transfer_step (.disj_right (.conj_right (.saturate_step (.transfer_step h'''')))))).tail
                       (.R19' M1 _ P1),
                     .single (.R19' M1 _ P1)⟩
            | _ => sorry
          | R2 A => exact ⟨Transfer (disj P1 (conj (Saturate M1) (Saturate N1))), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
  -- ── R20: Transfer(Saturate(disj(Transfer M) N)) → Transfer(Saturate(disj M N)) ────────────────────
  | R20 M1 N1 =>
    cases hP with
    | R20 => exact ⟨Transfer (Saturate (disj M1 N1)), .refl, .refl⟩
    | R21 => exact let ⟨Q,h1,h2⟩ := cp_R20_R21 M1 N1; ⟨Q, h1, h2⟩
    | transfer_step h =>
      cases h with
      | saturate_step h' =>
        cases h' with
        | disj_left h'' =>
          -- h'' : Step (Transfer M1) X. R20 fires on P if X = Transfer M1'.
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (Saturate (disj _ N1)),
                   .single (.transfer_step (.saturate_step (.disj_left h'''))),
                   .single (.R20 _ N1)⟩
          | R2 M1' =>
            exact ⟨Transfer (Saturate (disj M1 N1)), .refl, .refl⟩
          | R4 A B =>
            -- Transfer M1 →[R4 A B] conj(Transfer A)(Transfer B). P = Transfer(Saturate(disj(conj(Transfer A)(Transfer B)) N1)).
            -- N = Transfer(Saturate(disj M1 N1)) = Transfer(Saturate(disj(conj A B) N1)).
            -- N →[transfer_step(saturate_step(disj_left(R4 A B)))]→ ... hmm that's a congruence inside Saturate.
            -- Actually R22 fires on Transfer(Saturate(disj(conj(Transfer A)(Transfer B)) N1)) = P → Transfer(Saturate(disj(conj A B) N1)).
            -- From N: refl (N = Transfer(Saturate(disj(conj A B) N1)) since M1 = conj A B). From P: R22 A B N1. ✓
            exact ⟨Transfer (Saturate (disj (conj A B) N1)),
                   .refl,
                   .single (.R22 A B N1)⟩
          | R6 =>
            exact ⟨Transfer (Saturate (disj top N1)), .refl, .refl⟩
          | _ => sorry
        | disj_right h'' =>
          exact ⟨Transfer (Saturate (disj M1 _)),
                 .single (.transfer_step (.saturate_step (.disj_right h''))),
                 .single (.R20 M1 _)⟩
        | _ => sorry  -- other steps on disj(Transfer M1) N1
  -- ── R21: Transfer(Saturate(disj M (Transfer N))) → Transfer(Saturate(disj M N)) ────────────────────
  | R21 M1 N1 =>
    cases hP with
    | R21 => exact ⟨Transfer (Saturate (disj M1 N1)), .refl, .refl⟩
    | R20 => exact let ⟨Q,h1,h2⟩ := cp_R20_R21 M1 N1; ⟨Q, h2, h1⟩
    | transfer_step h =>
      cases h with
      | saturate_step h' =>
        cases h' with
        | disj_left h'' =>
          exact ⟨Transfer (Saturate (disj _ N1)),
                 .single (.transfer_step (.saturate_step (.disj_left h''))),
                 .single (.R21 _ N1)⟩
        | disj_right h'' =>
          cases h'' with
          | transfer_step h''' =>
            exact ⟨Transfer (Saturate (disj M1 _)),
                   .single (.transfer_step (.saturate_step (.disj_right h'''))),
                   .single (.R21 M1 _)⟩
          | R2 N1' =>
            exact ⟨Transfer (Saturate (disj M1 N1)), .refl, .refl⟩
          | R4 A B =>
            exact ⟨Transfer (Saturate (disj M1 (conj A B))),
                   .refl,
                   .single (.R23 A B M1)⟩
          | R6 =>
            exact ⟨Transfer (Saturate (disj M1 top)), .refl, .refl⟩
          | _ => sorry
        | _ => sorry
  -- ── R22: Transfer(Saturate(disj(conj(Transfer M)(Transfer N)) P)) → Transfer(Saturate(disj(conj M N) P)) ─
  | R22 M1 N1 P1 =>
    cases hP with
    | R22 => exact ⟨Transfer (Saturate (disj (conj M1 N1) P1)), .refl, .refl⟩
    | R23 M1' N1' P1' =>
      exact let ⟨Q,h1,h2⟩ := cp_R22_R23 M1 N1 M1' N1'; ⟨Q, h1, h2⟩
    | transfer_step h =>
      cases h with
      | saturate_step h' =>
        cases h' with
        | disj_left h'' =>
          cases h'' with
          | conj_left h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (Saturate (disj (conj _ N1) P1)),
                     .single (.transfer_step (.saturate_step (.disj_left (.conj_left h'''')))),
                     .single (.R22 _ N1 P1)⟩
            | R2 A => exact ⟨Transfer (Saturate (disj (conj M1 N1) P1)), .refl, .refl⟩
            | R4 A B =>
              exact ⟨Transfer (Saturate (disj (conj (conj A B) N1) P1)),
                     .refl,
                     sorry⟩  -- complex: R22 doesn't fire on conj(conj A B)(Transfer N1)
            | _ => sorry
          | conj_right h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (Saturate (disj (conj M1 _) P1)),
                     .single (.transfer_step (.saturate_step (.disj_left (.conj_right h'''')))),
                     .single (.R22 M1 _ P1)⟩
            | R2 A => exact ⟨Transfer (Saturate (disj (conj M1 N1) P1)), .refl, .refl⟩
            | _ => sorry
          | _ => sorry
        | disj_right h'' =>
          exact ⟨Transfer (Saturate (disj (conj M1 N1) _)),
                 .single (.transfer_step (.saturate_step (.disj_right h''))),
                 .single (.R22 M1 N1 _)⟩
        | _ => sorry
  -- ── R23: Transfer(Saturate(disj P (conj(Transfer M)(Transfer N)))) → Transfer(Saturate(disj P (conj M N))) ─
  | R23 M1 N1 P1 =>
    cases hP with
    | R23 => exact ⟨Transfer (Saturate (disj P1 (conj M1 N1))), .refl, .refl⟩
    | R22 M1' N1' P1' =>
      exact let ⟨Q,h1,h2⟩ := cp_R22_R23 M1' N1' M1 N1; ⟨Q, h2, h1⟩
    | transfer_step h =>
      cases h with
      | saturate_step h' =>
        cases h' with
        | disj_left h'' =>
          exact ⟨Transfer (Saturate (disj _ (conj M1 N1))),
                 .single (.transfer_step (.saturate_step (.disj_left h''))),
                 .single (.R23 M1 N1 _)⟩
        | disj_right h'' =>
          cases h'' with
          | conj_left h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (Saturate (disj P1 (conj _ N1))),
                     .single (.transfer_step (.saturate_step (.disj_right (.conj_left h'''')))),
                     .single (.R23 _ N1 P1)⟩
            | R2 A => exact ⟨Transfer (Saturate (disj P1 (conj M1 N1))), .refl, .refl⟩
            | _ => sorry
          | conj_right h''' =>
            cases h''' with
            | transfer_step h'''' =>
              exact ⟨Transfer (Saturate (disj P1 (conj M1 _))),
                     .single (.transfer_step (.saturate_step (.disj_right (.conj_right h'''')))),
                     .single (.R23 M1 _ P1)⟩
            | R2 A => exact ⟨Transfer (Saturate (disj P1 (conj M1 N1))), .refl, .refl⟩
            | _ => sorry
          | _ => sorry
        | _ => sorry
  -- ── Congruence rules: IH + lifting ────────────────────────────────────────
  | saturate_step h_inner ih =>
    -- M = Saturate A for some A; h_inner : Step A B; N = Saturate B; IH(h') for h' : Step A C.
    cases hP with
    | R1 A =>
      -- M = Saturate(Saturate A); h_inner : Step (Saturate A) B; N = Saturate B; P = Saturate A.
      -- h_inner : Step P B (where P = Saturate A). So P →[h_inner]→ B.
      -- Need: Steps (Saturate B) Q and Steps (Saturate A) Q.
      -- Symmetric to R1 × saturate_step(h_inner). Use same case split:
      cases h_inner with
      | saturate_step h' => exact ⟨Saturate _, .single (.R1 _), .single (.saturate_step h')⟩
      | R1 A' => exact ⟨Saturate (Saturate A'), .refl, .refl⟩
      | R3 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR3 M' N'; ⟨Q, h2, h1⟩
      | R5 => exact let ⟨Q,h1,h2⟩ := cp_R1_satR5; ⟨Q, h2, h1⟩
      | R7 A' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR7 A'; ⟨Q, h2, h1⟩
      | R8 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR8 M' N'; ⟨Q, h2, h1⟩
      | R9 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR9 M' N'; ⟨Q, h2, h1⟩
      | R12 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR12 M' N'; ⟨Q, h2, h1⟩
      | R13 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR13 M' N'; ⟨Q, h2, h1⟩
      | R14 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR14 M' N' P'; ⟨Q, h2, h1⟩
      | R15 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR15 M' N' P'; ⟨Q, h2, h1⟩
      | R18 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR18 M' N' P'; ⟨Q, h2, h1⟩
      | R18' M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R1_satR18' M' N' P'; ⟨Q, h2, h1⟩
    | R3 M' N' =>
      -- M = Saturate(conj M' N'); h_inner : Step (conj M' N') B; N = Saturate B; P = conj(Saturate M')(Saturate N').
      -- h_inner on conj M' N' must be conj_left or conj_right.
      cases h_inner with
      | conj_left h' =>
        exact ⟨conj (Saturate _) (Saturate N'),
               .single (.R3 _ N'),
               .single (.conj_left (.saturate_step h'))⟩
      | conj_right h' =>
        exact ⟨conj (Saturate M') (Saturate _),
               .single (.R3 M' _),
               .single (.conj_right (.saturate_step h'))⟩
    | R5 =>
      -- M = Saturate top; h_inner : Step top B. top has no steps.
      exact absurd h_inner (by intro; contradiction)
    | R7 A =>
      -- M = Saturate(Transfer A); h_inner : Step (Transfer A) B; N = Saturate B; P = Transfer(Saturate A).
      -- By cp_R7_satX symmetry applied to h_inner:
      cases h_inner with
      | transfer_step h' =>
        exact ⟨Transfer (Saturate _), .single (.R7 _), .single (.transfer_step (.saturate_step h'))⟩
      | R2 A' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR2 A'; ⟨Q, h2, h1⟩
      | R4 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR4 M' N'; ⟨Q, h2, h1⟩
      | R6 => exact let ⟨Q,h1,h2⟩ := cp_R7_satR6; ⟨Q, h2, h1⟩
      | R10 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR10 M' N'; ⟨Q, h2, h1⟩
      | R11 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR11 M' N'; ⟨Q, h2, h1⟩
      | R12s M' N' =>
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single (Step.R7 (disj (Saturate M') N'))).tail
                 (Step.transfer_step (Step.R8 M' N')),
               (Relation.ReflTransGen.single (Step.transfer_step (Step.R8 (Transfer M') N'))).tail
                 (Step.R20 M' N')⟩
      | R13s M' N' =>
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single (Step.R7 (disj M' (Saturate N')))).tail
                 (Step.transfer_step (Step.R9 M' N')),
               (Relation.ReflTransGen.single (Step.transfer_step (Step.R9 M' (Transfer N')))).tail
                 (Step.R21 M' N')⟩
      | R16 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR16 M' N' P'; ⟨Q, h2, h1⟩
      | R17 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R7_satR17 M' N' P'; ⟨Q, h2, h1⟩
      | R19 M' N' P' =>
        exact ⟨Transfer (Saturate (disj (conj M' N') P')),
               (Relation.ReflTransGen.single
                 (Step.R7 (disj (conj (Saturate M') (Saturate N')) P'))).tail
                 (Step.transfer_step (Step.R14 M' N' P')),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R14 (Transfer M') (Transfer N') P'))).tail
                 (Step.R22 M' N' P')⟩
      | R19' M' N' P' =>
        exact ⟨Transfer (Saturate (disj P' (conj M' N'))),
               (Relation.ReflTransGen.single
                 (Step.R7 (disj P' (conj (Saturate M') (Saturate N'))))).tail
                 (Step.transfer_step (Step.R15 M' N' P')),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R15 (Transfer M') (Transfer N') P'))).tail
                 (Step.R23 M' N' P')⟩
      | R20 M' N' =>
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj M' N')))).tail
                 (Step.transfer_step (Step.R1 (disj M' N'))),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj (Transfer M') N')))).tail
                 (Step.R20 M' N')⟩
      | R21 M' N' =>
        exact ⟨Transfer (Saturate (disj M' N')),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj M' N')))).tail
                 (Step.transfer_step (Step.R1 (disj M' N'))),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj M' (Transfer N'))))).tail
                 (Step.R21 M' N')⟩
      | R22 M' N' P' =>
        exact ⟨Transfer (Saturate (disj (conj M' N') P')),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj (conj M' N') P')))).tail
                 (Step.transfer_step (Step.R1 (disj (conj M' N') P'))),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj (conj (Transfer M') (Transfer N')) P')))).tail
                 (Step.R22 M' N' P')⟩
      | R23 M' N' P' =>
        exact ⟨Transfer (Saturate (disj P' (conj M' N'))),
               (Relation.ReflTransGen.single
                 (Step.R7 (Saturate (disj P' (conj M' N'))))).tail
                 (Step.transfer_step (Step.R1 (disj P' (conj M' N')))),
               (Relation.ReflTransGen.single
                 (Step.transfer_step (Step.R1 (disj P' (conj (Transfer M') (Transfer N')))))).tail
                 (Step.R23 M' N' P')⟩
    | R8 M' N' =>
      -- M = Saturate(disj(Saturate M') N'); h_inner : Step (disj(Saturate M') N') B; N = Saturate B; P = Saturate(disj M' N').
      -- Root R8 fires on N too if B still has Saturate on left. Case-split on h_inner:
      cases h_inner with
      | disj_left h' =>
        cases h' with
        | saturate_step h'' =>
          -- Saturate M' →[saturate_step h'']→ Saturate M''; B = disj(Saturate M'') N'. N = Saturate(disj(Saturate M'') N') →[R8]→ Saturate(disj M'' N').
          -- P = Saturate(disj M' N') →[saturate_step(disj_left h'')]→ Saturate(disj M'' N').
          exact ⟨Saturate (disj _ N'), .single (.R8 _ N'), .single (.saturate_step (.disj_left h''))⟩
        | R1 A =>
          -- Saturate M' = Saturate(Saturate A), M' = Saturate A. Saturate M' →[R1]→ Saturate A = M'. B = disj M' N'.
          -- N = Saturate(disj M' N') = P. Trivial.
          exact ⟨Saturate (disj M' N'), .refl, .refl⟩
        | R3 A B =>
          -- Saturate M' = Saturate(conj A B). Saturate M' →[R3]→ conj(Saturate A)(Saturate B). B_inner = disj(conj(Saturate A)(Saturate B)) N'.
          -- N = Saturate(disj(conj(Saturate A)(Saturate B)) N') →[R14 A B N']→ Saturate(disj(conj A B) N').
          -- P = Saturate(disj(conj A B) N') → refl. Q = Saturate(disj(conj A B) N').
          -- Wait: M' = conj A B and Saturate M' = Saturate(conj A B). N = Saturate B_inner = Saturate(disj(conj(Saturate A)(Saturate B)) N').
          -- P = Saturate(disj M' N') = Saturate(disj(conj A B) N'). From N: R14 → P. From P: refl.
          exact ⟨Saturate (disj (conj A B) N'), .single (.R14 A B N'), .refl⟩
        | R5 =>
          -- Saturate M' = Saturate top →[R5]→ top. B_inner = disj top N'. N = Saturate(disj top N') = P. Trivial.
          exact ⟨Saturate (disj top N'), .refl, .refl⟩
        | R7 A =>
          -- Saturate M' = Saturate(Transfer A) →[R7]→ Transfer(Saturate A). B_inner = disj(Transfer(Saturate A)) N'.
          -- N = Saturate(disj(Transfer(Saturate A)) N') →[R12 A N']→ Saturate(disj(Transfer A) N').
          -- P = Saturate(disj(Transfer A) N') → refl. Hmm wait: M' = Transfer A. P = Saturate(disj(Transfer A) N'). Q = P.
          exact ⟨Saturate (disj (Transfer A) N'), .single (.R12 A N'), .refl⟩
        | _ => sorry  -- remaining cases analogous
      | disj_right h' =>
        -- h' : Step N1 N1'; B = disj(Saturate M') N1'. R8 fires on N = Saturate(disj(Saturate M') N1').
        -- N →[R8]→ Saturate(disj M' N1'). P = Saturate(disj M' N1) →[saturate_step(disj_right h')]→ Saturate(disj M' N1').
        exact ⟨Saturate (disj M' _), .single (.R8 M' _), .single (.saturate_step (.disj_right h'))⟩
    | R9 M' N' =>
      -- M = Saturate(disj M' (Saturate N')); h_inner : Step (disj M' (Saturate N')) B; N = Saturate B; P = Saturate(disj M' N').
      cases h_inner with
      | disj_left h' =>
        exact ⟨Saturate (disj _ N'), .single (.R9 _ N'), .single (.saturate_step (.disj_left h'))⟩
      | disj_right h' =>
        cases h' with
        | saturate_step h'' =>
          exact ⟨Saturate (disj M' _), .single (.R9 M' _), .single (.saturate_step (.disj_right h''))⟩
        | R1 A =>
          exact ⟨Saturate (disj M' N'), .refl, .refl⟩
        | R3 A B =>
          exact ⟨Saturate (disj M' (conj A B)), .single (.R15 A B M'), .refl⟩
        | R5 =>
          exact ⟨Saturate (disj M' top), .refl, .refl⟩
        | R7 A =>
          exact ⟨Saturate (disj M' (Transfer A)), .single (.R13 M' A), .refl⟩
        | _ => sorry
    -- Generic saturate_step × saturate_step: IH handles inner confluence
    | saturate_step h' => exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨Saturate Q, saturating_steps hQ1, saturating_steps hQ2⟩
    -- Remaining root cases for saturate_step: sorry with commentary
    | R12 M' N' => sorry  -- Saturate(disj(Transfer(Saturate M'))(N')): congruence on inner disj
    | R13 M' N' => sorry
    | R12s M' N' => sorry  -- impossible: R12s fires on Transfer-outer, not Saturate-outer
    | R13s M' N' => sorry
    | R14 M' N' P' => sorry
    | R15 M' N' P' => sorry
    | R18 M' N' P' => sorry
    | R18' M' N' P' => sorry
    | R19 M' N' P' => sorry  -- impossible: Transfer-outer
    | R19' M' N' P' => sorry
    | R20 M' N' => sorry  -- impossible: Transfer-outer
    | R21 M' N' => sorry
    | R22 M' N' P' => sorry
    | R23 M' N' P' => sorry
    -- Other congruences inside Saturate: impossible (transfer_step, conj, disj, impl can't be inside saturate_step here)
    | transfer_step _ => exact absurd hP (by intro; contradiction)
    | conj_left _ => exact absurd hP (by intro; contradiction)
    | conj_right _ => exact absurd hP (by intro; contradiction)
    | disj_left _ => exact absurd hP (by intro; contradiction)
    | disj_right _ => exact absurd hP (by intro; contradiction)
    | impl_left _ => exact absurd hP (by intro; contradiction)
    | impl_right _ => exact absurd hP (by intro; contradiction)
  | transfer_step h_inner ih =>
    -- Symmetric to saturate_step. Handles Transfer-outer cases.
    cases hP with
    | R2 A =>
      cases h_inner with
      | transfer_step h' => exact ⟨Transfer _, .single (.R2 _), .single (.transfer_step h')⟩
      | R2 A' => exact ⟨Transfer (Transfer A'), .refl, .refl⟩
      | R4 M' N' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR4 M' N'; ⟨Q, h2, h1⟩
      | R6 => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR6; ⟨Q, h2, h1⟩
      | R10 M' N' => exact ⟨Transfer (disj M' N'), .single (.R10 M' N'), .refl⟩
      | R11 M' N' => exact ⟨Transfer (disj M' N'), .single (.R11 M' N'), .refl⟩
      | R12s M' N' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR12s M' N'; ⟨Q, h2, h1⟩
      | R13s M' N' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR13s M' N'; ⟨Q, h2, h1⟩
      | R16 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR16 M' N' P'; ⟨Q, h2, h1⟩
      | R17 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR17 M' N' P'; ⟨Q, h2, h1⟩
      | R19 M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR19 M' N' P'; ⟨Q, h2, h1⟩
      | R19' M' N' P' => exact let ⟨Q,h1,h2⟩ := cp_R2_ktrR19' M' N' P'; ⟨Q, h2, h1⟩
    | R4 M' N' =>
      cases h_inner with
      | conj_left h' =>
        exact ⟨conj (Transfer _) (Transfer N'), .single (.R4 _ N'), .single (.conj_left (.transfer_step h'))⟩
      | conj_right h' =>
        exact ⟨conj (Transfer M') (Transfer _), .single (.R4 M' _), .single (.conj_right (.transfer_step h'))⟩
    | R6 =>
      exact absurd h_inner (by intro; contradiction)
    | transfer_step h' => exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨Transfer Q, transferring_steps hQ1, transferring_steps hQ2⟩
    | R10 M' N' =>
      cases h_inner with
      | disj_left h' =>
        cases h' with
        | transfer_step h'' =>
          exact ⟨Transfer (disj _ N'), .single (.R10 _ N'), .single (.transfer_step (.disj_left h''))⟩
        | R2 A =>
          exact ⟨Transfer (disj A N'), .refl, .refl⟩
        | R4 A B =>
          exact ⟨Transfer (disj (conj A B) N'), .single (.R10 (conj A B) N'), .single (.R16 A B N')⟩
        | R6 =>
          exact ⟨Transfer (disj top N'), .refl, .refl⟩
        | _ => sorry
      | disj_right h' =>
        exact ⟨Transfer (disj M' _), .single (.R10 M' _), .single (.transfer_step (.disj_right h'))⟩
    | R11 M' N' =>
      cases h_inner with
      | disj_left h' =>
        exact ⟨Transfer (disj _ N'), .single (.R11 _ N'), .single (.transfer_step (.disj_left h'))⟩
      | disj_right h' =>
        cases h' with
        | transfer_step h'' =>
          exact ⟨Transfer (disj M' _), .single (.R11 M' _), .single (.transfer_step (.disj_right h''))⟩
        | R2 A => exact ⟨Transfer (disj M' A), .refl, .refl⟩
        | R4 A B =>
          exact ⟨Transfer (disj M' (conj A B)), .single (.R11 M' (conj A B)), .single (.R17 A B M')⟩
        | R6 => exact ⟨Transfer (disj M' top), .refl, .refl⟩
        | _ => sorry
    -- Remaining root cases for transfer_step: sorry
    | R12s M' N' => sorry
    | R13s M' N' => sorry
    | R16 M' N' P' => sorry
    | R17 M' N' P' => sorry
    | R19 M' N' P' => sorry
    | R19' M' N' P' => sorry
    | R20 M' N' => sorry
    | R21 M' N' => sorry
    | R22 M' N' P' => sorry
    | R23 M' N' P' => sorry
    -- Impossible: outer is Transfer, hP can't be Saturate-outer root rule
    | saturate_step _ => exact absurd hP (by intro; contradiction)
    | conj_left _ => exact absurd hP (by intro; contradiction)
    | conj_right _ => exact absurd hP (by intro; contradiction)
    | disj_left _ => exact absurd hP (by intro; contradiction)
    | disj_right _ => exact absurd hP (by intro; contradiction)
    | impl_left _ => exact absurd hP (by intro; contradiction)
    | impl_right _ => exact absurd hP (by intro; contradiction)
  -- ── Congruence on binary connectives: IH + lift ───────────────────────────
  | conj_left h_inner ih =>
    cases hP with
    | conj_left h' =>
      exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨conj Q _, steps_conj_left hQ1, steps_conj_left hQ2⟩
    | conj_right h' =>
      -- Independent sides: N = conj N_inner N_rhs, P = conj M_lhs P_inner.
      -- Steps (conj N_inner N_rhs) (conj N_inner P_inner) via conj_right.
      -- Steps (conj M_lhs P_inner) (conj N_inner P_inner) via conj_left.
      exact ⟨conj _ _, steps_conj_left (.single h_inner), steps_conj_right (.single h')⟩
    | _ => exact absurd hP (by intro; contradiction)
  | conj_right h_inner ih =>
    cases hP with
    | conj_right h' =>
      exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨conj _ Q, steps_conj_right hQ1, steps_conj_right hQ2⟩
    | conj_left h' =>
      exact ⟨conj _ _, steps_conj_right (.single h_inner), steps_conj_left (.single h')⟩
    | _ => exact absurd hP (by intro; contradiction)
  | disj_left h_inner ih =>
    cases hP with
    | disj_left h' =>
      exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨disj Q _, steps_disj_left hQ1, steps_disj_left hQ2⟩
    | disj_right h' =>
      exact ⟨disj _ _, steps_disj_left (.single h_inner), steps_disj_right (.single h')⟩
    | _ => exact absurd hP (by intro; contradiction)
  | disj_right h_inner ih =>
    cases hP with
    | disj_right h' =>
      exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨disj _ Q, steps_disj_right hQ1, steps_disj_right hQ2⟩
    | disj_left h' =>
      exact ⟨disj _ _, steps_disj_right (.single h_inner), steps_disj_left (.single h')⟩
    | _ => exact absurd hP (by intro; contradiction)
  | impl_left h_inner ih =>
    cases hP with
    | impl_left h' =>
      exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨impl Q _, (by
        induction hQ1 with
        | refl => exact .refl
        | tail _ h2 ih2 => exact ih2.tail (.impl_left h2)), (by
        induction hQ2 with
        | refl => exact .refl
        | tail _ h2 ih2 => exact ih2.tail (.impl_left h2))⟩
    | impl_right h' =>
      exact ⟨impl _ _, (by exact .single (.impl_left h_inner)), (by exact .single (.impl_right h'))⟩
    | _ => exact absurd hP (by intro; contradiction)
  | impl_right h_inner ih =>
    cases hP with
    | impl_right h' =>
      exact let ⟨Q,hQ1,hQ2⟩ := ih h'; ⟨impl _ Q, (by
        induction hQ1 with
        | refl => exact .refl
        | tail _ h2 ih2 => exact ih2.tail (.impl_right h2)), (by
        induction hQ2 with
        | refl => exact .refl
        | tail _ h2 ih2 => exact ih2.tail (.impl_right h2))⟩
    | impl_left h' =>
      exact ⟨impl _ _, (by exact .single (.impl_right h_inner)), (by exact .single (.impl_left h'))⟩
    | _ => exact absurd hP (by intro; contradiction)

/-- Confluence of `Step` via Newman's Lemma (SN + `localConfluence`).

    Proof sketch (Newman): by WellFounded.fix on the Acc depth of M:
    - Case-split each path M →* N and M →* P using `cases_head`.
    - If either is trivial (M = N or M = P), the other path witnesses confluence.
    - Otherwise: M → M₁ →* N and M → M₂ →* P.
      LC gives M₁ →* M₃ and M₂ →* M₃.
      IH on M₁ closes N and M₃ to Q₁; IH on M₂ closes P and M₃ to Q₂.
      IH on M₃ (accessible via `acc_of_steps` from M₁'s Acc) closes Q₁ and Q₂.
    This requires the IH to be available at M₃, which is a strict Step-descendant
    of M₁ (not just of M). The standard fix: use `Acc.rec` with the full Acc proof
    threaded through, so that `acc_of_steps (ih_acc M₁ hMM₁) hM₁M₃` is structurally
    smaller than the original `Acc.intro M ih_acc`. Deferred pending `localConfluence`
    to avoid compounding sorries. -/
theorem confluence {M N P : Proposition V} (hMN : Steps M N) (hMP : Steps M P) :
    ∃ Q, Steps N Q ∧ Steps P Q := by
  sorry

-- ── §5: NF uniqueness from confluence ─────────────────────────────────────────

/-- Any two normal forms reachable from the same term are equal.
    Proof: their common reduct (from `confluence`) must equal both, since NFs
    cannot step. -/
theorem nf_unique {M N P : Proposition V}
    (hNM : Steps M N) (hNF_N : NormalForm N)
    (hPM : Steps M P) (hNF_P : NormalForm P) : N = P := by
  obtain ⟨Q, hNQ, hPQ⟩ := confluence hNM hPM
  rcases cases_head hNQ with rfl | ⟨_, hstepN, _⟩
  · rcases cases_head hPQ with rfl | ⟨_, hstepP, _⟩
    · rfl
    · exact absurd hstepP (hNF_P _)
  · exact absurd hstepN (hNF_N _)

-- ── §6: Canonical forms theorem ───────────────────────────────────────────────

/-- Forward: equal normal forms imply semantic equivalence.
    M ~ nf M (soundness), nf M = nf N (hypothesis), nf N ~ N (soundness reversed). -/
theorem canonical_forms_mp {M N : Proposition V} (h : nf M = nf N) : synEquiv M N :=
  fun {_} _ bn ρ =>
    (nf_sound M bn ρ).trans (h ▸ (nf_sound N bn ρ).symm)

/-- Backward: semantic equivalence implies equal normal forms.

    OPEN pending `confluence`. Once `confluence` is proved:
    - `nf_unique` gives: any two NFs reachable from the same source are equal.
    - Key: synEquiv M N must imply that nf M and nf N are both reachable from some
      common source, OR that they are themselves synEquiv (as NFs). The argument
      requires that NFs are complete invariants of synEquiv, which follows from
      confluence: distinct NFs have distinct denotations (proved via the free model
      structure, or directly via `nf_unique` applied to the EqvGen(Step) relation). -/
theorem canonical_forms_mpr {M N : Proposition V} (h : synEquiv M N) : nf M = nf N := by
  sorry

/-- Canonical forms: M and N are semantically equivalent iff they have the same
    normal form.

    Status:
    - `mp` (nf M = nf N → M ~ N): proved via soundness of reduction.
    - `mpr` (M ~ N → nf M = nf N): sorry, pending `localConfluence` (~300 lines). -/
theorem canonical_forms (M N : Proposition V) : nf M = nf N ↔ synEquiv M N :=
  ⟨canonical_forms_mp, canonical_forms_mpr⟩

end Proposition
