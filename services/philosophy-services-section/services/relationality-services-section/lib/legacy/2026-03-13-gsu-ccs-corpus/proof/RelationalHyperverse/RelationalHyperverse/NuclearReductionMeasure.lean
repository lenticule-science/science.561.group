import RelationalHyperverse.FiberNuclearLanguage

-- Establishes: nuclear-reduction-measure

/-!
# NuclearReductionMeasure: the lexicographic termination measure W(M) for FiberNuclearLanguage

Corresponds to `math/nuclear-reduction-measure.md`.

The termination measure `W(M) = (nuclearW(M), ent(M))` for the FiberNuclearLanguage reduction system:

- **`nuclearW M`** (polynomial weight): `Saturate M` and `Transfer M` each get weight `2 * nuclearW M`;
  connectives are additive. This makes R3/R4 each strictly decrease `nuclearW` by 1:
  - R3: `nuclearW(Saturate(conj M N)) = 2*(nuclearW M + nuclearW N + 1)` > `nuclearW(conj(Saturate M)(Saturate N))`.
  - R4: analogous with `Transfer`.
  - R7: `nuclearW(Saturate(Transfer M)) = 4*nuclearW M = nuclearW(Transfer(Saturate M))` — preserves `nuclearW`;
    use `entanglement` as tiebreaker.
- **`entanglement M`** (Saturate-inside-Transfer nesting degree): strictly decreases under R7
  and all its congruence closures, exactly when `nuclearW` is preserved.
- All other rules (R1,R2,R5,R6,R8–R19') strictly decrease `nuclearW`.

The auxiliary `modalCount` and `transferCount` are components of an older linear measure
`totalMeasure` that proves partial SN for all non-R3/R4 rules.

## Main definitions
- `Proposition.modalCount M`     : total `Saturate`/`Transfer` occurrences
- `Proposition.transferCount M`  : `Transfer` occurrences (auxiliary)
- `Proposition.entanglementAux M sd` : entanglement with `sd` Saturate-ancestors from context
- `Proposition.entanglement M`   : e(M) = entanglementAux M 0
- `Proposition.nuclearW M`           : polynomial weight

## Main results
- `Proposition.entanglementAux_add_sd`  : `entanglementAux M (sd+k) = entanglementAux M sd + transferCount M * k`
  (linear dependence on Saturate-depth)
- `Proposition.entanglementAux_succ_sd` : `entanglementAux M (sd+1) = entanglementAux M sd + transferCount M`
  (one-step increment)
- `Proposition.entanglementAux_R7_root` : Saturate(Transfer M) has entanglementAux one more
  than Transfer(Saturate M) at every depth
- `Proposition.entanglement_R7`         : R7 strictly decreases entanglement
- `Proposition.nuclearW_pos`                : nuclearW M ≥ 1 for all M
-/

namespace Proposition

universe u

variable {V : Type u}

-- ── Weight component 1: modal count ──────────────────────────────────────────

/-- Total number of `Saturate` and `Transfer` occurrences in a term.
    Secondary component m(M) of W(M) = (e(M), m(M)).
    Every rule except R3/R4 strictly decreases modalCount. -/
def modalCount : Proposition V → ℕ
  | var _ | top | bot               => 0
  | conj M N | disj M N | impl M N  => modalCount M + modalCount N
  | Saturate M                           => modalCount M + 1
  | Transfer M                           => modalCount M + 1

-- ── Weight component 2: entanglement degree ───────────────────────────────────

/-- Number of `Transfer` occurrences. Auxiliary for entanglement lemmas. -/
def transferCount : Proposition V → ℕ
  | var _ | top | bot               => 0
  | conj M N | disj M N | impl M N  => transferCount M + transferCount N
  | Saturate M                           => transferCount M
  | Transfer M                           => transferCount M + 1

/-- Entanglement degree with Saturate-depth accumulator.

    `entanglementAux M sd` = sum over all Transfer-positions p in M of
    (sd + local-Saturate-depth-of-p-in-M).

    The `sd` parameter is the number of Saturate-headed ancestors from the surrounding
    context. A `Saturate` constructor increments `sd` for its argument. A `Transfer`
    constructor contributes the current `sd` to the total, then recurses with
    the same `sd` (Transfer does not count as a Saturate-ancestor). -/
def entanglementAux : Proposition V → ℕ → ℕ
  | var _, _ | top, _ | bot, _      => 0
  | conj M N, sd                    => entanglementAux M sd + entanglementAux N sd
  | disj M N, sd                    => entanglementAux M sd + entanglementAux N sd
  | impl M N, sd                    => entanglementAux M sd + entanglementAux N sd
  | Saturate M,    sd                    => entanglementAux M (sd + 1)
  | Transfer M,    sd                    => sd + entanglementAux M sd

/-- Entanglement degree e(M) = entanglementAux M 0.
    Primary component of W(M) = (e(M), m(M)).
    Strictly decreases under R7; weakly decreases under all other rules
    except R3/R4. -/
def entanglement (M : Proposition V) : ℕ := entanglementAux M 0

-- ── Computation simp lemmas ───────────────────────────────────────────────────

@[simp] theorem entanglementAux_saturate (M : Proposition V) (sd : ℕ) :
    entanglementAux (Saturate M) sd = entanglementAux M (sd + 1) := rfl

@[simp] theorem entanglementAux_transfer (M : Proposition V) (sd : ℕ) :
    entanglementAux (Transfer M) sd = sd + entanglementAux M sd := rfl

-- ── Linear dependence on Saturate-depth ────────────────────────────────────────────

/-- entanglementAux M (sd + k) = entanglementAux M sd + transferCount M * k.
    Each Transfer in M contributes k extra per unit of extra Saturate-depth. -/
theorem entanglementAux_add_sd (M : Proposition V) (sd k : ℕ) :
    entanglementAux M (sd + k) = entanglementAux M sd + transferCount M * k := by
  induction M generalizing sd with
  | var _ | top | bot => simp [entanglementAux, transferCount]
  | conj M N ihM ihN =>
    simp only [entanglementAux, transferCount]
    rw [ihM sd, ihN sd, Nat.add_mul]
    omega
  | disj M N ihM ihN =>
    simp only [entanglementAux, transferCount]
    rw [ihM sd, ihN sd, Nat.add_mul]
    omega
  | impl M N ihM ihN =>
    simp only [entanglementAux, transferCount]
    rw [ihM sd, ihN sd, Nat.add_mul]
    omega
  | Saturate M ih =>
    simp only [entanglementAux, transferCount]
    have heq : sd + k + 1 = sd + 1 + k := by omega
    rw [heq, ih (sd + 1)]
  | Transfer M ih =>
    simp only [entanglementAux, transferCount]
    rw [ih sd, Nat.add_mul, Nat.one_mul]
    omega

/-- Incrementing the Saturate-depth by 1 increases entanglement by transferCount M. -/
theorem entanglementAux_succ_sd (M : Proposition V) (sd : ℕ) :
    entanglementAux M (sd + 1) = entanglementAux M sd + transferCount M := by
  have h := entanglementAux_add_sd M sd 1
  simp only [Nat.mul_one] at h
  exact h

-- ── Key lemma: R7 decreases entanglement by exactly 1 ─────────────────────────

/-- R7 decreases entanglement by exactly 1 at any Saturate-depth.

    `math/nuclear-reduction-measure.md` (R7 case):
    "Each application strictly decreases the number of Saturate-inside-Transfer nestings."

    Proof:
      entanglementAux (Saturate (Transfer M)) sd
        = entanglementAux (Transfer M) (sd+1)    [Saturate rule]
        = (sd+1) + entanglementAux M (sd+1) [Transfer rule]
      entanglementAux (Transfer (Saturate M)) sd
        = sd + entanglementAux (Saturate M) sd   [Transfer rule]
        = sd + entanglementAux M (sd+1)     [Saturate rule]
      LHS − RHS = 1. -/
theorem entanglementAux_R7_root (M : Proposition V) (sd : ℕ) :
    entanglementAux (Saturate (Transfer M)) sd =
    entanglementAux (Transfer (Saturate M)) sd + 1 := by
  simp [entanglementAux]
  omega

/-- R7 strictly decreases entanglement. -/
theorem entanglement_R7 (M : Proposition V) :
    entanglement (Transfer (Saturate M)) < entanglement (Saturate (Transfer M)) := by
  unfold entanglement
  rw [entanglementAux_R7_root]
  omega

-- ── Congruence: constant entanglement difference lifts through contexts ────────

/-- A constant difference in entanglementAux lifts through `Saturate`. -/
theorem entanglementAux_sat_congr {M N : Proposition V} (k : ℕ)
    (h : ∀ sd, entanglementAux M sd = entanglementAux N sd + k) (sd : ℕ) :
    entanglementAux (Saturate M) sd = entanglementAux (Saturate N) sd + k :=
  by simp [entanglementAux, h (sd + 1)]

/-- A constant difference in entanglementAux lifts through `Transfer`. -/
theorem entanglementAux_ktr_congr {M N : Proposition V} (k : ℕ)
    (h : ∀ sd, entanglementAux M sd = entanglementAux N sd + k) (sd : ℕ) :
    entanglementAux (Transfer M) sd = entanglementAux (Transfer N) sd + k := by
  simp [entanglementAux, h sd]
  omega

-- ── Polynomial weight: Saturate/Transfer multiply by 2, connectives add ──────

/-- Polynomial weight for the lex termination measure W(M) = (nuclearW(M), entanglement(M)).

    `Saturate` and `Transfer` each multiply their argument weight by 2;
    `conj`/`disj`/`impl` add their children's weights plus 1.

    Key properties:
    - nuclearW(Saturate(conj M N)) = 2*(nuclearW M + nuclearW N + 1) = 2nuclearW M + 2nuclearW N + 2
    - nuclearW(conj(Saturate M)(Saturate N)) = 2nuclearW M + 2nuclearW N + 1
      → R3 strictly decreases nuclearW (by 1). ✓
    - nuclearW(Transfer(conj M N)) > nuclearW(conj(Transfer M)(Transfer N))
      → R4 strictly decreases nuclearW. ✓
    - nuclearW(Saturate(Transfer M)) = 4*nuclearW M = nuclearW(Transfer(Saturate M))
      → R7 preserves nuclearW; use `entanglement` as tiebreaker. -/
def nuclearW : Proposition V → ℕ
  | var _ | top | bot               => 1
  | conj M N | disj M N | impl M N  => nuclearW M + nuclearW N + 1
  | Saturate M                           => 2 * nuclearW M
  | Transfer M                           => 2 * nuclearW M

@[simp] theorem nuclearW_var (x : V) : nuclearW (var x) = 1 := rfl
@[simp] theorem nuclearW_top : nuclearW (top (V := V)) = 1 := rfl
@[simp] theorem nuclearW_bot : nuclearW (bot (V := V)) = 1 := rfl
@[simp] theorem nuclearW_conj (M N : Proposition V) : nuclearW (conj M N) = nuclearW M + nuclearW N + 1 := rfl
@[simp] theorem nuclearW_disj (M N : Proposition V) : nuclearW (disj M N) = nuclearW M + nuclearW N + 1 := rfl
@[simp] theorem nuclearW_impl (M N : Proposition V) : nuclearW (impl M N) = nuclearW M + nuclearW N + 1 := rfl
@[simp] theorem nuclearW_sat (M : Proposition V) : nuclearW (Saturate M) = 2 * nuclearW M := rfl
@[simp] theorem nuclearW_ktr (M : Proposition V) : nuclearW (Transfer M) = 2 * nuclearW M := rfl

/-- nuclearW is always at least 1. -/
theorem nuclearW_pos (M : Proposition V) : 1 ≤ nuclearW M := by
  induction M with
  | var _ | top | bot => simp [nuclearW]
  | conj M N ihM ihN | disj M N ihM ihN | impl M N ihM ihN =>
      simp only [nuclearW_conj, nuclearW_disj, nuclearW_impl]; omega
  | Saturate M ih | Transfer M ih => simp only [nuclearW_sat, nuclearW_ktr]; omega

end Proposition
