import RelationalHyperverse.FiberNuclearLanguage

-- Establishes: soundness

/-!
# Soundness: fiber-level soundness of Proposition₀

Corresponds to `math/soundness.md`.

The **soundness theorem** for Proposition₀ states that every reduction rule Ri is semantically
valid: the two sides of each rule denote equal elements under every interpretation.
This is the fiber-level soundness (`math/soundness.md` §thm-soundness).

The rules proven here are R1–R19':
- R1–R2: idempotency of Sat and Trans
- R3–R4: meet-preservation of Sat and Trans
- R5–R6: Sat(⊤) = ⊤, Trans(⊤) = ⊤
- R7: commutativity Sat(Trans(M)) = Trans(Sat(M))
- R8–R11: disjunction absorption rules
- R12–R13: cross-type disjunction absorption (Sat version)
- R12s–R13s: cross-type disjunction absorption (Trans symmetric version)
- R14–R17: meet-absorption rules (close R3/R8, R3/R9, R4/R10, R4/R11 critical pairs)
- R18–R18', R19–R19': cross-type meet-absorption (close R12/R3, R13/R4 critical pairs)

The universe-level soundness theorem (for the full relational universe R) is in
`math/soundness-universe.md` and requires the presheaf structure from `Reindexing.lean`.

## Open items
- `canonical_forms` — normalization theorem (see `Normalization.lean`)
-/

namespace Proposition

variable {V : Type*} {H : Type*} [HeytingAlgebra H]
variable (bn : BiNucleus H) (ρ : V → H)

-- ── Extensivity rules ────────────────────────────────────────────────────────

-- Sat extensivity: M ≤ Sat(M)
theorem sound_saturate_extensive (M : Proposition V) :
    interp bn ρ M ≤ interp bn ρ (Saturate M) := bn.σ.extensive _

-- Trans extensivity: M ≤ Trans(M)
theorem sound_transfer_extensive (M : Proposition V) :
    interp bn ρ M ≤ interp bn ρ (Transfer M) := bn.Δ.extensive _

-- ── Idempotency ──────────────────────────────────────────────────────────────

-- R1: Sat(Sat(M)) = Sat(M)
theorem sound_saturate_idempotent (M : Proposition V) :
    interp bn ρ (Saturate (Saturate M)) = interp bn ρ (Saturate M) := bn.σ.idempotent _

-- R2: Trans(Trans(M)) = Trans(M)
theorem sound_transfer_idempotent (M : Proposition V) :
    interp bn ρ (Transfer (Transfer M)) = interp bn ρ (Transfer M) := bn.Δ.idempotent _

-- ── Meet-preservation ────────────────────────────────────────────────────────

-- R3: Sat(M ∧ N) = Sat(M) ∧ Sat(N)
theorem sound_saturate_conj (M N : Proposition V) :
    interp bn ρ (Saturate (conj M N)) = interp bn ρ (conj (Saturate M) (Saturate N)) :=
  bn.σ.meet_pres _ _

-- R4: Trans(M ∧ N) = Trans(M) ∧ Trans(N)
theorem sound_transfer_conj (M N : Proposition V) :
    interp bn ρ (Transfer (conj M N)) = interp bn ρ (conj (Transfer M) (Transfer N)) :=
  bn.Δ.meet_pres _ _

-- ── Top-preservation ─────────────────────────────────────────────────────────

-- R5: Sat(⊤) = ⊤
theorem sound_saturate_top : interp bn ρ (Saturate top) = (⊤ : H) :=
  le_antisymm le_top (bn.σ.extensive ⊤)

-- R6: Trans(⊤) = ⊤
theorem sound_transfer_top : interp bn ρ (Transfer top) = (⊤ : H) :=
  le_antisymm le_top (bn.Δ.extensive ⊤)

-- ── Commutativity ────────────────────────────────────────────────────────────

-- R7: Sat(Trans(M)) = Trans(Sat(M))  (commutativity axiom of the BiNucleus)
theorem sound_saturate_ktr_comm (M : Proposition V) :
    interp bn ρ (Saturate (Transfer M)) = interp bn ρ (Transfer (Saturate M)) :=
  bn.commute _

-- ── Disjunction absorption rules ─────────────────────────────────────────────

-- R8: Sat(Sat(M) ∨ N) = Sat(M ∨ N)
theorem sound_saturate_absorb_disj (M N : Proposition V) :
    interp bn ρ (Saturate (disj (Saturate M) N)) = interp bn ρ (Saturate (disj M N)) :=
  bn.σ.absorb_join _ _

-- R9: Sat(M ∨ Sat(N)) = Sat(M ∨ N)
theorem sound_saturate_absorb_disj' (M N : Proposition V) :
    interp bn ρ (Saturate (disj M (Saturate N))) = interp bn ρ (Saturate (disj M N)) :=
  bn.σ.absorb_join' _ _

-- R10: Trans(Trans(M) ∨ N) = Trans(M ∨ N)
theorem sound_transfer_absorb_disj (M N : Proposition V) :
    interp bn ρ (Transfer (disj (Transfer M) N)) = interp bn ρ (Transfer (disj M N)) :=
  bn.Δ.absorb_join _ _

-- R11: Trans(M ∨ Trans(N)) = Trans(M ∨ N)
theorem sound_transfer_absorb_disj' (M N : Proposition V) :
    interp bn ρ (Transfer (disj M (Transfer N))) = interp bn ρ (Transfer (disj M N)) :=
  bn.Δ.absorb_join' _ _

-- ── Cross-type disjunction absorption rules ──────────────────────────────────
-- These rules are not derivable from R1–R11. They use commutativity (R7) plus
-- same-type idempotency to collapse inner nuclei hidden behind the other nucleus.

-- R12: Sat(Trans(Sat(M)) ∨ N) = Sat(Trans(M) ∨ N)
-- Validity: σ(Δ(σ(a))∨b) = σ(σ(Δ(a))∨b) [commute] = σ(Δ(a)∨b) [absorb_join].
theorem sound_saturate_absorb_ktr_sat (M N : Proposition V) :
    interp bn ρ (Saturate (disj (Transfer (Saturate M)) N)) = interp bn ρ (Saturate (disj (Transfer M) N)) := by
  simp only [interp]
  conv_lhs =>
    rw [show bn.Δ.toFun (bn.σ.toFun (interp bn ρ M)) =
            bn.σ.toFun (bn.Δ.toFun (interp bn ρ M)) from (bn.commute _).symm]
  exact bn.σ.absorb_join _ _

-- R13: Sat(M ∨ Trans(Sat(N))) = Sat(M ∨ Trans(N))
theorem sound_saturate_absorb_ktr_sat' (M N : Proposition V) :
    interp bn ρ (Saturate (disj M (Transfer (Saturate N)))) = interp bn ρ (Saturate (disj M (Transfer N))) := by
  simp only [interp]
  conv_lhs =>
    rw [show bn.Δ.toFun (bn.σ.toFun (interp bn ρ N)) =
            bn.σ.toFun (bn.Δ.toFun (interp bn ρ N)) from (bn.commute _).symm]
  exact bn.σ.absorb_join' _ _

-- R12s (symmetric): Trans(Sat(Trans(M)) ∨ N) = Trans(Sat(M) ∨ N)
-- Validity: Δ(σ(Δ(a))∨b) = Δ(Δ(σ(a))∨b) [commute] = Δ(σ(a)∨b) [absorb_join].
theorem sound_transfer_absorb_sat_ktr (M N : Proposition V) :
    interp bn ρ (Transfer (disj (Saturate (Transfer M)) N)) = interp bn ρ (Transfer (disj (Saturate M) N)) := by
  simp only [interp]
  conv_lhs =>
    rw [show bn.σ.toFun (bn.Δ.toFun (interp bn ρ M)) =
            bn.Δ.toFun (bn.σ.toFun (interp bn ρ M)) from bn.commute _]
  exact bn.Δ.absorb_join _ _

-- R13s (symmetric): Trans(M ∨ Sat(Trans(N))) = Trans(M ∨ Sat(N))
theorem sound_transfer_absorb_sat_ktr' (M N : Proposition V) :
    interp bn ρ (Transfer (disj M (Saturate (Transfer N)))) = interp bn ρ (Transfer (disj M (Saturate N))) := by
  simp only [interp]
  conv_lhs =>
    rw [show bn.σ.toFun (bn.Δ.toFun (interp bn ρ N)) =
            bn.Δ.toFun (bn.σ.toFun (interp bn ρ N)) from bn.commute _]
  exact bn.Δ.absorb_join' _ _

-- ── Meet-absorption rules (close same-type critical pairs) ────────────────────

-- R14: Sat(Sat(M) ∧ Sat(N) ∨ P) = Sat(M ∧ N ∨ P)
-- Closes the R3/R8 critical pair.
theorem sound_saturate_absorb_conj_disj (M N P : Proposition V) :
    interp bn ρ (Saturate (disj (conj (Saturate M) (Saturate N)) P)) =
    interp bn ρ (Saturate (disj (conj M N) P)) :=
  bn.σ.absorb_join_meet _ _ _

-- R15: Sat(P ∨ Sat(M) ∧ Sat(N)) = Sat(P ∨ M ∧ N)
-- Closes the R3/R9 critical pair.
theorem sound_saturate_absorb_conj_disj' (M N P : Proposition V) :
    interp bn ρ (Saturate (disj P (conj (Saturate M) (Saturate N)))) =
    interp bn ρ (Saturate (disj P (conj M N))) := by
  simp only [interp]
  rw [← bn.σ.meet_pres]
  exact bn.σ.absorb_join' _ _

-- R16: Trans(Trans(M) ∧ Trans(N) ∨ P) = Trans(M ∧ N ∨ P)
-- Closes the R4/R10 critical pair.
theorem sound_transfer_absorb_conj_disj (M N P : Proposition V) :
    interp bn ρ (Transfer (disj (conj (Transfer M) (Transfer N)) P)) =
    interp bn ρ (Transfer (disj (conj M N) P)) :=
  bn.Δ.absorb_join_meet _ _ _

-- R17: Trans(P ∨ Trans(M) ∧ Trans(N)) = Trans(P ∨ M ∧ N)
-- Closes the R4/R11 critical pair.
theorem sound_transfer_absorb_conj_disj' (M N P : Proposition V) :
    interp bn ρ (Transfer (disj P (conj (Transfer M) (Transfer N)))) =
    interp bn ρ (Transfer (disj P (conj M N))) := by
  simp only [interp]
  rw [← bn.Δ.meet_pres]
  exact bn.Δ.absorb_join' _ _

-- ── Cross-type meet-absorption rules (close R12/R3 and R13/R4 critical pairs) ─

-- R18: Sat((Trans(Sat(M)) ∧ Trans(Sat(N))) ∨ P) = Sat((Trans(M) ∧ Trans(N)) ∨ P)
-- Validity: Δ(σ(a)) = σ(Δ(a)) [commute], so Δ(σ(a))∧Δ(σ(b)) = σ(Δ(a))∧σ(Δ(b))
--           = σ(Δ(a)∧Δ(b)) [meet-pres], then absorb_join closes the outer σ.
theorem sound_saturate_absorb_ktr_sat_conj_disj (M N P : Proposition V) :
    interp bn ρ (Saturate (disj (conj (Transfer (Saturate M)) (Transfer (Saturate N))) P)) =
    interp bn ρ (Saturate (disj (conj (Transfer M) (Transfer N)) P)) := by
  simp only [interp]
  rw [show bn.Δ.toFun (bn.σ.toFun (interp bn ρ M)) =
          bn.σ.toFun (bn.Δ.toFun (interp bn ρ M)) from (bn.commute _).symm,
      show bn.Δ.toFun (bn.σ.toFun (interp bn ρ N)) =
          bn.σ.toFun (bn.Δ.toFun (interp bn ρ N)) from (bn.commute _).symm,
      ← bn.σ.meet_pres]
  exact bn.σ.absorb_join _ _

-- R18': Sat(P ∨ (Trans(Sat(M)) ∧ Trans(Sat(N)))) = Sat(P ∨ (Trans(M) ∧ Trans(N)))
theorem sound_saturate_absorb_ktr_sat_conj_disj' (M N P : Proposition V) :
    interp bn ρ (Saturate (disj P (conj (Transfer (Saturate M)) (Transfer (Saturate N))))) =
    interp bn ρ (Saturate (disj P (conj (Transfer M) (Transfer N)))) := by
  simp only [interp]
  rw [show bn.Δ.toFun (bn.σ.toFun (interp bn ρ M)) =
          bn.σ.toFun (bn.Δ.toFun (interp bn ρ M)) from (bn.commute _).symm,
      show bn.Δ.toFun (bn.σ.toFun (interp bn ρ N)) =
          bn.σ.toFun (bn.Δ.toFun (interp bn ρ N)) from (bn.commute _).symm,
      ← bn.σ.meet_pres]
  exact bn.σ.absorb_join' _ _

-- R19: Trans((Sat(Trans(M)) ∧ Sat(Trans(N))) ∨ P) = Trans((Sat(M) ∧ Sat(N)) ∨ P)
-- Validity: σ(Δ(a)) = Δ(σ(a)) [commute], so σ(Δ(a))∧σ(Δ(b)) = Δ(σ(a))∧Δ(σ(b))
--           = Δ(σ(a)∧σ(b)) [meet-pres], then absorb_join closes the outer Δ.
theorem sound_transfer_absorb_sat_ktr_conj_disj (M N P : Proposition V) :
    interp bn ρ (Transfer (disj (conj (Saturate (Transfer M)) (Saturate (Transfer N))) P)) =
    interp bn ρ (Transfer (disj (conj (Saturate M) (Saturate N)) P)) := by
  simp only [interp]
  rw [bn.commute (interp bn ρ M), bn.commute (interp bn ρ N), ← bn.Δ.meet_pres]
  exact bn.Δ.absorb_join _ _

-- R19': Trans(P ∨ (Sat(Trans(M)) ∧ Sat(Trans(N)))) = Trans(P ∨ (Sat(M) ∧ Sat(N)))
theorem sound_transfer_absorb_sat_ktr_conj_disj' (M N P : Proposition V) :
    interp bn ρ (Transfer (disj P (conj (Saturate (Transfer M)) (Saturate (Transfer N))))) =
    interp bn ρ (Transfer (disj P (conj (Saturate M) (Saturate N)))) := by
  simp only [interp]
  rw [bn.commute (interp bn ρ M), bn.commute (interp bn ρ N), ← bn.Δ.meet_pres]
  exact bn.Δ.absorb_join' _ _

-- ── R7-interaction absorption rules ─────────────────────────────────────────
-- These close the critical pairs of R7 with R10/R11/R16/R17.
-- Key identity: Δ(σ(Δ(a) ⊔ b)) = Δ(σ(a ⊔ b)).
-- Proof: Δ(a)⊔b ≤ Δ(a⊔b) [monotone+extensive], so σ(Δ(a)⊔b) ≤ σ(Δ(a⊔b)) = Δ(σ(a⊔b))
-- [commute], giving Δ(σ(Δ(a)⊔b)) ≤ Δ(Δ(σ(a⊔b))) = Δ(σ(a⊔b)) [idempotent].
-- The reverse: a⊔b ≤ Δ(a)⊔b [extensive on a] → σ(a⊔b) ≤ σ(Δ(a)⊔b) → Δ(σ(a⊔b)) ≤ Δ(σ(Δ(a)⊔b)).

-- R20: Trans(Sat(Trans(M) ∨ N)) = Trans(Sat(M ∨ N))
theorem sound_transfer_sat_absorb_ktr_disj (M N : Proposition V) :
    interp bn ρ (Transfer (Saturate (disj (Transfer M) N))) = interp bn ρ (Transfer (Saturate (disj M N))) := by
  simp only [interp]
  apply le_antisymm
  · -- Δ(σ(Δ(a)⊔b)) ≤ Δ(σ(a⊔b))
    calc bn.Δ.toFun (bn.σ.toFun (bn.Δ.toFun (interp bn ρ M) ⊔ interp bn ρ N))
        ≤ bn.Δ.toFun (bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ interp bn ρ N))) := by
          apply bn.Δ.monotone
          calc bn.σ.toFun (bn.Δ.toFun (interp bn ρ M) ⊔ interp bn ρ N)
              ≤ bn.σ.toFun (bn.Δ.toFun (interp bn ρ M ⊔ interp bn ρ N)) :=
                bn.σ.monotone (sup_le (bn.Δ.monotone le_sup_left)
                                      (le_trans le_sup_right (bn.Δ.extensive _)))
            _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ interp bn ρ N)) := bn.commute _
      _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ interp bn ρ N)) := bn.Δ.idempotent _
  · -- Δ(σ(a⊔b)) ≤ Δ(σ(Δ(a)⊔b))
    apply bn.Δ.monotone; apply bn.σ.monotone
    exact sup_le (le_trans (bn.Δ.extensive _) le_sup_left) le_sup_right

-- R21: Trans(Sat(M ∨ Trans(N))) = Trans(Sat(M ∨ N))
theorem sound_transfer_sat_absorb_ktr_disj' (M N : Proposition V) :
    interp bn ρ (Transfer (Saturate (disj M (Transfer N)))) = interp bn ρ (Transfer (Saturate (disj M N))) := by
  simp only [interp]
  apply le_antisymm
  · calc bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ bn.Δ.toFun (interp bn ρ N)))
        ≤ bn.Δ.toFun (bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ interp bn ρ N))) := by
          apply bn.Δ.monotone
          calc bn.σ.toFun (interp bn ρ M ⊔ bn.Δ.toFun (interp bn ρ N))
              ≤ bn.σ.toFun (bn.Δ.toFun (interp bn ρ M ⊔ interp bn ρ N)) :=
                bn.σ.monotone (sup_le (le_trans le_sup_left (bn.Δ.extensive _))
                                      (bn.Δ.monotone le_sup_right))
            _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ interp bn ρ N)) := bn.commute _
      _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊔ interp bn ρ N)) := bn.Δ.idempotent _
  · apply bn.Δ.monotone; apply bn.σ.monotone
    exact sup_le le_sup_left (le_trans (bn.Δ.extensive _) le_sup_right)

-- R22: Trans(Sat((Trans(M) ∧ Trans(N)) ∨ P)) = Trans(Sat((M ∧ N) ∨ P))
-- Valid: Δ(M)∧Δ(N) = Δ(M∧N) [meet-pres], then apply R20 identity with a := M∧N.
theorem sound_transfer_sat_absorb_ktr_conj_disj (M N P : Proposition V) :
    interp bn ρ (Transfer (Saturate (disj (conj (Transfer M) (Transfer N)) P))) =
    interp bn ρ (Transfer (Saturate (disj (conj M N) P))) := by
  simp only [interp]
  rw [← bn.Δ.meet_pres (interp bn ρ M) (interp bn ρ N)]
  -- Goal: Δ(σ(Δ(m⊓n)⊔p)) = Δ(σ(m⊓n⊔p)) — the R20 identity at H level
  apply le_antisymm
  · calc bn.Δ.toFun (bn.σ.toFun (bn.Δ.toFun (interp bn ρ M ⊓ interp bn ρ N) ⊔ interp bn ρ P))
        ≤ bn.Δ.toFun (bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊓ interp bn ρ N ⊔ interp bn ρ P))) := by
          apply bn.Δ.monotone
          calc bn.σ.toFun (bn.Δ.toFun (interp bn ρ M ⊓ interp bn ρ N) ⊔ interp bn ρ P)
              ≤ bn.σ.toFun (bn.Δ.toFun (interp bn ρ M ⊓ interp bn ρ N ⊔ interp bn ρ P)) :=
                bn.σ.monotone (sup_le (bn.Δ.monotone le_sup_left)
                                      (le_trans le_sup_right (bn.Δ.extensive _)))
            _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊓ interp bn ρ N ⊔ interp bn ρ P)) :=
                bn.commute _
      _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ M ⊓ interp bn ρ N ⊔ interp bn ρ P)) :=
          bn.Δ.idempotent _
  · apply bn.Δ.monotone; apply bn.σ.monotone
    exact sup_le (le_trans (bn.Δ.extensive _) le_sup_left) le_sup_right

-- R23: Trans(Sat(P ∨ (Trans(M) ∧ Trans(N)))) = Trans(Sat(P ∨ (M ∧ N)))
theorem sound_transfer_sat_absorb_ktr_conj_disj' (M N P : Proposition V) :
    interp bn ρ (Transfer (Saturate (disj P (conj (Transfer M) (Transfer N))))) =
    interp bn ρ (Transfer (Saturate (disj P (conj M N)))) := by
  simp only [interp]
  rw [← bn.Δ.meet_pres (interp bn ρ M) (interp bn ρ N)]
  apply le_antisymm
  · calc bn.Δ.toFun (bn.σ.toFun (interp bn ρ P ⊔ bn.Δ.toFun (interp bn ρ M ⊓ interp bn ρ N)))
        ≤ bn.Δ.toFun (bn.Δ.toFun (bn.σ.toFun (interp bn ρ P ⊔ interp bn ρ M ⊓ interp bn ρ N))) := by
          apply bn.Δ.monotone
          calc bn.σ.toFun (interp bn ρ P ⊔ bn.Δ.toFun (interp bn ρ M ⊓ interp bn ρ N))
              ≤ bn.σ.toFun (bn.Δ.toFun (interp bn ρ P ⊔ interp bn ρ M ⊓ interp bn ρ N)) :=
                bn.σ.monotone (sup_le (le_trans le_sup_left (bn.Δ.extensive _))
                                      (bn.Δ.monotone le_sup_right))
            _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ P ⊔ interp bn ρ M ⊓ interp bn ρ N)) :=
                bn.commute _
      _ = bn.Δ.toFun (bn.σ.toFun (interp bn ρ P ⊔ interp bn ρ M ⊓ interp bn ρ N)) :=
          bn.Δ.idempotent _
  · apply bn.Δ.monotone; apply bn.σ.monotone
    exact sup_le le_sup_left (le_trans (bn.Δ.extensive _) le_sup_right)

end Proposition
