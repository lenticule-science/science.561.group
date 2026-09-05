import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Positing.Charge
import Obsmetrologia.Language.Predicating.Hyperdoctrine

/-!
# Positing.Morphism — the positing morphism, mechanized

Positing's action on a valuation has, until now, lived only in prose: one posit
at claim point `φ` with charge `q` moves a valuation `v` to `v ∨ₖ δ_{φ,q}`, where
`δ_{φ,q}` is the **point mass** — `q` at `φ`, knowledge-bottom `⊥ₖ` (= `absurd`,
told none, the evidence reading's initial cell — see
`docs/history/corner-naming-convention.md`) everywhere else. This module gives
that morphism its first mechanization: `delta`, `posit`, and the algebraic laws
one posit — and finite batches of posits — obey.

Everything is stated **pointwise** (`∀ ψ, … ψ = … ψ`, or with `ψ` a bound
argument), never as `Valuation` function equality, so no `funext` is needed
anywhere in this file.

## What is derived

* `delta` — the point-mass valuation at one claim point.
* `posit` — one knowledge-join update: `posit φ q v = v ∨ₖ δ_{φ,q}`, pointwise.
* `posit_kBot` — positing `⊥ₖ` (abstaining) is the identity on `v`.
* `posit_inflationary` — a posit never retracts knowledge: `v ψ ≤ₖ posit φ q v ψ`.
* `posit_posit_same` — two posits at the *same* cell merge by joining their
  charges: `posit φ q₂ (posit φ q₁ v) = posit φ (q₁ ∨ₖ q₂) v`, pointwise.
* `posit_comm` — two posits commute, *unconditionally* — the underlying fact is
  just associativity/commutativity of `∨ₖ` on `Charge`, so this holds whether or
  not the two posited cells coincide.
* `posit_monotone` — `posit φ q` is monotone in `v` for the pointwise `≤ₖ` order.
* `posit_idem` — positing the same charge at the same cell twice is the same as
  positing it once (from `posit_posit_same` + `Charge.joinK_idem`).
* The four Belnap speech-act classes named by their charge: `abstaining`
  (`⊥ₖ` = absurd, told none), `asserting` (`t` = potential, told true),
  `denying` (`f` = active, told false), `contesting` (`⊤ₖ` = stable, told
  both).
* `contest_absorbs` — contesting **at its own cell** absorbs any further posit
  there: `posit φ q (contesting φ v) φ = (contesting φ v) φ` (both sides equal
  `⊤ₖ`). This is stated *only* at `ψ = φ`; off that cell `contesting` does not
  touch `v`, so no cell-free absorption law holds and none is claimed here.
* `Claim.converse_eq_iff` — `converse ψ = φ ↔ ψ = converse φ`, from `converse`
  being an involution; the fact `delta`'s naturality under converse-reindexing
  turns on.
* `delta_converse` / `posit_converse_natural` — `delta` and `posit` are natural
  under reindexing along the converse generator (`Valuation.reindex` of
  `Hyperdoctrine`): reindexing a posited valuation by `converse` is the same as
  positing at the converse cell into the reindexed valuation.

## What remains open

The closure companion of this evidence-injection step — how a *sequence* of
posits settles to a fixed point under the modal closure — is `Language.Settling`
territory and is not addressed here. What this module does supply that settling's
merge relies on: `posit_posit_same`, `posit_comm`, and `posit_idem` together say
that any *finite batch* of posits collapses, order-independently, to the
knowledge-join of the individually posited charges at each cell — the algebraic
fact a CRDT-style merge needs, proved here only for two posits at a time (the
generating case; the finite-batch induction itself is not carried out in this
file). Naturality is proved only for the `converse` generator, not for the
projection generators `subjProj`/`objProj`/`specialize`, which are not
reindexing bijections and so do not satisfy the `Claim.converse_eq_iff`-style
involution premise this proof leans on.
-/

namespace Obsmetrologia
namespace Valuation

/-! ## The point-mass valuation and the posit update -/

/-- The **point-mass valuation** at claim point `φ`: charge `q` there, `⊥ₖ`
(absurd, told none) everywhere else. -/
def delta (φ : Claim) (q : Charge) : Valuation :=
  fun ψ => if ψ = φ then q else Charge.kBot

/-- **Positing**, mechanized: one knowledge-join update of `v` by the point mass
`δ_{φ,q}` — `posit φ q v = v ∨ₖ δ_{φ,q}`. -/
def posit (φ : Claim) (q : Charge) (v : Valuation) : Valuation :=
  fun ψ => Charge.joinK (v ψ) (delta φ q ψ)

/-! ## Core algebraic laws, all pointwise -/

/-- Positing `⊥ₖ` (**abstaining**) is the identity: it adds no knowledge
anywhere. -/
theorem posit_kBot (φ : Claim) (v : Valuation) (ψ : Claim) :
    posit φ Charge.kBot v ψ = v ψ := by
  unfold posit delta
  by_cases h : ψ = φ
  · simp [h, Charge.joinK_comm, Charge.joinK_kBot]
  · simp [h, Charge.joinK_comm, Charge.joinK_kBot]

/-- A posit never retracts knowledge already held: `v ψ ≤ₖ posit φ q v ψ`. -/
theorem posit_inflationary (φ : Claim) (q : Charge) (v : Valuation) (ψ : Claim) :
    Charge.leK (v ψ) (posit φ q v ψ) = true :=
  Charge.leK_joinK_left (v ψ) (delta φ q ψ)

/-- Two posits **at the same cell** merge by joining their charges: the second
posit's data folds into the first's rather than overwriting it. -/
theorem posit_posit_same (φ : Claim) (q₁ q₂ : Charge) (v : Valuation) (ψ : Claim) :
    posit φ q₂ (posit φ q₁ v) ψ = posit φ (Charge.joinK q₁ q₂) v ψ := by
  unfold posit delta
  by_cases h : ψ = φ
  · simp only [if_pos h]
    generalize v ψ = x
    cases x <;> cases q₁ <;> cases q₂ <;> rfl
  · simp only [if_neg h]
    generalize v ψ = x
    cases x <;> rfl

/-- Two posits **commute** — unconditionally. This is pure `∨ₖ`
associativity/commutativity on `Charge`; the two posited cells need not be
distinct (nor even related) for this to hold. -/
theorem posit_comm (φ₁ φ₂ : Claim) (q₁ q₂ : Charge) (v : Valuation) (ψ : Claim) :
    posit φ₂ q₂ (posit φ₁ q₁ v) ψ = posit φ₁ q₁ (posit φ₂ q₂ v) ψ := by
  unfold posit
  generalize v ψ = x
  generalize delta φ₁ q₁ ψ = a
  generalize delta φ₂ q₂ ψ = b
  cases x <;> cases a <;> cases b <;> rfl

/-- `posit φ q` is monotone: it preserves the pointwise `≤ₖ` order on
valuations. -/
theorem posit_monotone (φ : Claim) (q : Charge) (v w : Valuation) (h : leK v w)
    (ψ : Claim) : Charge.leK (posit φ q v ψ) (posit φ q w ψ) = true := by
  unfold posit
  have hvw : Charge.leK (v ψ) (w ψ) = true := h ψ
  revert hvw
  generalize delta φ q ψ = d
  generalize v ψ = a
  generalize w ψ = b
  intro hab
  revert hab
  cases a <;> cases b <;> cases d <;> decide

/-- Positing the same charge at the same cell twice is the same as positing it
once. -/
theorem posit_idem (φ : Claim) (q : Charge) (v : Valuation) (ψ : Claim) :
    posit φ q (posit φ q v) ψ = posit φ q v ψ := by
  rw [posit_posit_same φ q q v ψ, Charge.joinK_idem]

/-! ## The four Belnap speech-act classes, named by their charge

Named under the evidence reading (`docs/history/corner-naming-convention.md`):
`absurd` = ⊥ₖ = told none, `potential` = t = told true, `active` = f = told
false, `stable` = ⊤ₖ = told both. -/

/-- **Abstaining** at `φ`: posit the knowledge-bottom charge — told none. A
no-op by `posit_kBot`. -/
def abstaining (φ : Claim) (v : Valuation) : Valuation := posit φ Charge.kBot v

/-- **Asserting** `φ`: posit the truth-top charge `t` — told true only. -/
def asserting (φ : Claim) (v : Valuation) : Valuation := posit φ Charge.tTop v

/-- **Denying** `φ`: posit the truth-bottom charge `f` — told false only. -/
def denying (φ : Claim) (v : Valuation) : Valuation := posit φ Charge.tBot v

/-- **Contesting** `φ`: posit the knowledge-top charge `⊤ₖ` — told both. -/
def contesting (φ : Claim) (v : Valuation) : Valuation := posit φ Charge.kTop v

/-- Joining knowledge-top into any charge yields knowledge-top: `∨ₖ` absorbs
into `⊤ₖ`. A local helper for `contest_absorbs`. -/
private theorem joinK_kTop (a : Charge) : Charge.joinK a Charge.kTop = Charge.kTop := by
  cases a <;> rfl

/-- **Contesting absorbs, at its own cell.** Once `φ` has been contested, any
further posit *at `φ`* leaves it at `⊤ₖ` (told both) — contesting is the
≤ₖ-absorbing point no posit can move past. Stated only at `ψ = φ`: off that
cell `contesting φ v` is untouched (`= v ψ`), so no cell-free version of this
law holds, and none is claimed. -/
theorem contest_absorbs (φ : Claim) (q : Charge) (v : Valuation) :
    posit φ q (contesting φ v) φ = (contesting φ v) φ := by
  show Charge.joinK ((contesting φ v) φ) (delta φ q φ) = (contesting φ v) φ
  have hd : delta φ Charge.kTop φ = Charge.kTop := by
    unfold delta; rw [if_pos rfl]
  have hc : (contesting φ v) φ = Charge.kTop := by
    show Charge.joinK (v φ) (delta φ Charge.kTop φ) = Charge.kTop
    rw [hd]; exact joinK_kTop (v φ)
  rw [hc, Charge.joinK_comm, joinK_kTop]

/-! ## Naturality under converse-reindexing -/

end Valuation

namespace Claim

/-- `converse` is an involution, so hitting `φ` after converse-ing `ψ` is the
same condition as `ψ` itself being the converse of `φ`. The fact `delta`'s
naturality under `converse`-reindexing turns on. -/
theorem converse_eq_iff (φ ψ : Claim) : converse ψ = φ ↔ ψ = converse φ := by
  constructor
  · intro h; rw [← h, converse_converse]
  · intro h; rw [h, converse_converse]

end Claim

namespace Valuation

/-- `delta` is natural under converse-reindexing: hitting `δ_{φ,q}` after
converse-ing the query point equals hitting `δ_{converse φ, q}` at the
unconverted point. -/
theorem delta_converse (φ : Claim) (q : Charge) (ψ : Claim) :
    delta φ q (Claim.converse ψ) = delta (Claim.converse φ) q ψ := by
  unfold delta
  by_cases h : Claim.converse ψ = φ
  · rw [if_pos h, if_pos ((Claim.converse_eq_iff φ ψ).mp h)]
  · rw [if_neg h, if_neg (fun hh => h ((Claim.converse_eq_iff φ ψ).mpr hh))]

/-- **`posit` is natural under converse-reindexing.** Reindexing a posited
valuation along `converse` is the same as positing at the converse cell into
the already-reindexed valuation — the converse generator commutes with
positing. -/
theorem posit_converse_natural (φ : Claim) (q : Charge) (v : Valuation) (ψ : Claim) :
    Valuation.reindex Claim.converse (posit φ q v) ψ
      = posit (Claim.converse φ) q (Valuation.reindex Claim.converse v) ψ := by
  show posit φ q v (Claim.converse ψ) = posit (Claim.converse φ) q
      (fun χ => v (Claim.converse χ)) ψ
  unfold posit
  rw [delta_converse]

end Valuation
end Obsmetrologia
