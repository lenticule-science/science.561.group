import RelationalHyperverse.Soundness

-- Establishes: normalization (Step relation; confluence deferred to NormalizationStrong)

/-!
# Normalization: the Proposition₀ one-step reduction relation

Corresponds to `math/normalization.md`.

Defines the oriented one-step reduction relation `Proposition.Step` for the 19' rules of
`math/normalization.md §reduction-system`, with congruence closure (reduction in
any subterm context).

Every root rule is sound: the two sides have equal denotations in every BiNucleus
(proved in `Soundness.lean`). The orientation is toward canonical form.

## Main definitions
- `Proposition.Step` : one-step reduction R1–R19' with congruence closure

## Open items
- `Proposition.NormalForm` : predicate for irreducible terms
- `Proposition.canonical_forms` : every term reduces to a unique normal form
  (follows from SN + confluence; both in `NormalizationStrong.lean`)
-/

namespace Proposition

universe u

/-- One-step reduction relation for Proposition₀.

    Rules R1–R19' from `math/normalization.md §reduction-system`, oriented for
    termination. Congruence constructors allow reduction in any subterm context.

    Rule references: soundness witnesses are the corresponding lemmas in `Soundness.lean`.
    - R1/R2: idempotency (`sound_saturate_idempotent`, `sound_transfer_idempotent`)
    - R3/R4: meet-preservation, oriented outward (`sound_saturate_conj`, `sound_transfer_conj`)
    - R5/R6: top-preservation (`sound_saturate_top`, `sound_transfer_top`)
    - R7: commutativity to canonical Trans-outer nesting (`sound_saturate_ktr_comm`)
    - R8–R11: disjunction absorption (`sound_saturate_absorb_disj` etc.)
    - R12–R13s: cross-type disjunction absorption
    - R14–R17: same-type meet-absorption
    - R18–R19': cross-type meet-absorption

    R3/R4 are the only rules that increase modal count. Their termination is
    established by the multiset path ordering; see `NormalizationStrong.lean`. -/
inductive Step {V : Type u} : Proposition V → Proposition V → Prop where
  -- ── Idempotency ──────────────────────────────────────────────────────────
  /-- R1: Sat(Sat(M)) → Sat(M). -/
  | R1 (M : Proposition V) : Step (Saturate (Saturate M)) (Saturate M)
  /-- R2: Trans(Trans(M)) → Trans(M). -/
  | R2 (M : Proposition V) : Step (Transfer (Transfer M)) (Transfer M)
  -- ── Meet-preservation (distribute outward) ────────────────────────────────
  /-- R3: Sat(M ∧ N) → Sat(M) ∧ Sat(N).
      Increases modal count by 1; termination via MPO. -/
  | R3 (M N : Proposition V) : Step (Saturate (conj M N)) (conj (Saturate M) (Saturate N))
  /-- R4: Trans(M ∧ N) → Trans(M) ∧ Trans(N).
      Increases modal count by 1; termination via MPO. -/
  | R4 (M N : Proposition V) : Step (Transfer (conj M N)) (conj (Transfer M) (Transfer N))
  -- ── Top-preservation ─────────────────────────────────────────────────────
  /-- R5: Sat(⊤) → ⊤. -/
  | R5 : Step (Saturate top) top
  /-- R6: Trans(⊤) → ⊤. -/
  | R6 : Step (Transfer top) top
  -- ── Commutativity ────────────────────────────────────────────────────────
  /-- R7: Sat(Trans(M)) → Trans(Sat(M)). Canonical nesting: Trans outer.
      Decreases entanglement degree by exactly 1; see `NormalizationStrong.lean`. -/
  | R7 (M : Proposition V) : Step (Saturate (Transfer M)) (Transfer (Saturate M))
  -- ── Disjunction absorption ───────────────────────────────────────────────
  /-- R8: Sat(Sat(M) ∨ N) → Sat(M ∨ N). -/
  | R8  (M N : Proposition V) : Step (Saturate (disj (Saturate M) N)) (Saturate (disj M N))
  /-- R9: Sat(M ∨ Sat(N)) → Sat(M ∨ N). -/
  | R9  (M N : Proposition V) : Step (Saturate (disj M (Saturate N))) (Saturate (disj M N))
  /-- R10: Trans(Trans(M) ∨ N) → Trans(M ∨ N). -/
  | R10 (M N : Proposition V) : Step (Transfer (disj (Transfer M) N)) (Transfer (disj M N))
  /-- R11: Trans(M ∨ Trans(N)) → Trans(M ∨ N). -/
  | R11 (M N : Proposition V) : Step (Transfer (disj M (Transfer N))) (Transfer (disj M N))
  -- ── Cross-type disjunction absorption ────────────────────────────────────
  /-- R12: Sat(Trans(Sat(M)) ∨ N) → Sat(Trans(M) ∨ N). -/
  | R12  (M N : Proposition V) : Step (Saturate (disj (Transfer (Saturate M)) N)) (Saturate (disj (Transfer M) N))
  /-- R13: Sat(M ∨ Trans(Sat(N))) → Sat(M ∨ Trans(N)). -/
  | R13  (M N : Proposition V) : Step (Saturate (disj M (Transfer (Saturate N)))) (Saturate (disj M (Transfer N)))
  /-- R12s: Trans(Sat(Trans(M)) ∨ N) → Trans(Sat(M) ∨ N). -/
  | R12s (M N : Proposition V) : Step (Transfer (disj (Saturate (Transfer M)) N)) (Transfer (disj (Saturate M) N))
  /-- R13s: Trans(M ∨ Sat(Trans(N))) → Trans(M ∨ Sat(N)). -/
  | R13s (M N : Proposition V) : Step (Transfer (disj M (Saturate (Transfer N)))) (Transfer (disj M (Saturate N)))
  -- ── Same-type meet-absorption ─────────────────────────────────────────────
  /-- R14: Sat((Sat(M) ∧ Sat(N)) ∨ P) → Sat((M ∧ N) ∨ P). -/
  | R14  (M N P : Proposition V) :
      Step (Saturate (disj (conj (Saturate M) (Saturate N)) P)) (Saturate (disj (conj M N) P))
  /-- R15: Sat(P ∨ (Sat(M) ∧ Sat(N))) → Sat(P ∨ (M ∧ N)). -/
  | R15  (M N P : Proposition V) :
      Step (Saturate (disj P (conj (Saturate M) (Saturate N)))) (Saturate (disj P (conj M N)))
  /-- R16: Trans((Trans(M) ∧ Trans(N)) ∨ P) → Trans((M ∧ N) ∨ P). -/
  | R16  (M N P : Proposition V) :
      Step (Transfer (disj (conj (Transfer M) (Transfer N)) P)) (Transfer (disj (conj M N) P))
  /-- R17: Trans(P ∨ (Trans(M) ∧ Trans(N))) → Trans(P ∨ (M ∧ N)). -/
  | R17  (M N P : Proposition V) :
      Step (Transfer (disj P (conj (Transfer M) (Transfer N)))) (Transfer (disj P (conj M N)))
  -- ── Cross-type meet-absorption ─────────────────────────────────────────────
  /-- R18: Sat((Trans(Sat(M)) ∧ Trans(Sat(N))) ∨ P) → Sat((Trans(M) ∧ Trans(N)) ∨ P). -/
  | R18  (M N P : Proposition V) :
      Step (Saturate (disj (conj (Transfer (Saturate M)) (Transfer (Saturate N))) P))
           (Saturate (disj (conj (Transfer M) (Transfer N)) P))
  /-- R18': Sat(P ∨ (Trans(Sat(M)) ∧ Trans(Sat(N)))) → Sat(P ∨ (Trans(M) ∧ Trans(N))). -/
  | R18' (M N P : Proposition V) :
      Step (Saturate (disj P (conj (Transfer (Saturate M)) (Transfer (Saturate N)))))
           (Saturate (disj P (conj (Transfer M) (Transfer N))))
  /-- R19: Trans((Sat(Trans(M)) ∧ Sat(Trans(N))) ∨ P) → Trans((Sat(M) ∧ Sat(N)) ∨ P). -/
  | R19  (M N P : Proposition V) :
      Step (Transfer (disj (conj (Saturate (Transfer M)) (Saturate (Transfer N))) P))
           (Transfer (disj (conj (Saturate M) (Saturate N)) P))
  /-- R19': Trans(P ∨ (Sat(Trans(M)) ∧ Sat(Trans(N)))) → Trans(P ∨ (Sat(M) ∧ Sat(N))). -/
  | R19' (M N P : Proposition V) :
      Step (Transfer (disj P (conj (Saturate (Transfer M)) (Saturate (Transfer N)))))
           (Transfer (disj P (conj (Saturate M) (Saturate N))))
  -- ── R7-interaction absorption rules ─────────────────────────────────────
  -- These close the critical pairs of R7 with R10/R11/R16/R17.
  -- After R7 fires on Saturate(Transfer(disj(Transfer M) N)), the result Transfer(Saturate(disj(Transfer M) N))
  -- has no existing rule; these rules absorb the inner Trans in the disjunct.
  /-- R20: Trans(Sat(Trans(M) ∨ N)) → Trans(Sat(M ∨ N)).
      Closes the R7/R10 critical pair. Valid: Δ(σ(Δ(M) ∨ N)) = Δ(σ(M ∨ N)). -/
  | R20  (M N : Proposition V) :
      Step (Transfer (Saturate (disj (Transfer M) N))) (Transfer (Saturate (disj M N)))
  /-- R21: Trans(Sat(M ∨ Trans(N))) → Trans(Sat(M ∨ N)).
      Closes the R7/R11 critical pair. Valid: Δ(σ(M ∨ Δ(N))) = Δ(σ(M ∨ N)). -/
  | R21  (M N : Proposition V) :
      Step (Transfer (Saturate (disj M (Transfer N)))) (Transfer (Saturate (disj M N)))
  /-- R22: Trans(Sat((Trans(M) ∧ Trans(N)) ∨ P)) → Trans(Sat((M ∧ N) ∨ P)).
      Closes the R7/R16 critical pair. Valid: Δ(σ(Δ(M)∧Δ(N) ∨ P)) = Δ(σ(M∧N ∨ P)). -/
  | R22  (M N P : Proposition V) :
      Step (Transfer (Saturate (disj (conj (Transfer M) (Transfer N)) P)))
           (Transfer (Saturate (disj (conj M N) P)))
  /-- R23: Trans(Sat(P ∨ (Trans(M) ∧ Trans(N)))) → Trans(Sat(P ∨ (M ∧ N))).
      Closes the R7/R17 critical pair. Valid: Δ(σ(P ∨ Δ(M)∧Δ(N))) = Δ(σ(P ∨ M∧N)). -/
  | R23  (M N P : Proposition V) :
      Step (Transfer (Saturate (disj P (conj (Transfer M) (Transfer N)))))
           (Transfer (Saturate (disj P (conj M N))))
  -- ── Congruence closure ────────────────────────────────────────────────────
  | saturate_step   {M N : Proposition V} : Step M N → Step (Saturate M)    (Saturate N)
  | transfer_step   {M N : Proposition V} : Step M N → Step (Transfer M)    (Transfer N)
  | conj_left  {M M' N : Proposition V} : Step M M' → Step (conj M N)  (conj M' N)
  | conj_right {M N N' : Proposition V} : Step N N' → Step (conj M N)  (conj M N')
  | disj_left  {M M' N : Proposition V} : Step M M' → Step (disj M N)  (disj M' N)
  | disj_right {M N N' : Proposition V} : Step N N' → Step (disj M N)  (disj M N')
  | impl_left  {M M' N : Proposition V} : Step M M' → Step (impl M N)  (impl M' N)
  | impl_right {M N N' : Proposition V} : Step N N' → Step (impl M N)  (impl M N')

/-- A term is in normal form if no reduction rule applies. -/
def NormalForm {V : Type u} (M : Proposition V) : Prop := ∀ N, ¬ Step M N

end Proposition
