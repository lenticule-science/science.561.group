import Obsmetrologia.Language.Positing.Morphism
import Obsmetrologia.Language.Positing.Valuation

/-!
# Predicating.CellPartition — the predication cell's four-corner partition, derived

The verso scaffolding admits a gap directly. `potential-predication-cell.md` states
the design constraint: *"The cell schema forbids a value field — admitting one would
make cell-identity valuation-dependent and collapse the fibration."* Its three
siblings — `absurd-predication-cell.md`, `active-predication-cell.md`, and
`stable-predication-cell.md` — each then admit the resulting hole: *"What 'committed'
means for the triple's own partition, beyond the charge coordinate, remains
underived — this node is scaffolding, not settled derivation."*

Read together those two admissions **are** the derivation, once stated instead of
apologized for. The predication cell `φ = (s, p, o)` genuinely carries no value
coordinate — the schema is right to forbid one. So "which of the four corners `φ`
is in" cannot be a property of `φ` alone; it can only be a property of `φ`
**relative to a valuation** `v : Valuation`. That relative reading is not a weaker
substitute for the scaffolding's four-corner partition — it is the only reading the
schema (correctly) leaves room for, and it is already sitting fully worked out one
module over, as `Charge := Articulating.Corner` under a `Valuation := Claim →
Charge`. `Valuation.phase` names that identity under the partition's own vocabulary:
a claim's **phase** under `v` is the charge `v` assigns it, no more and no less.

This module does not add new mathematical content to `Positing.Morphism` /
`Positing.Valuation` — every proof here is a direct corollary of theorems already
there (`posit_inflationary`, `posit_kBot`, `Charge.joinK_kBot`) or of `Corner`'s
finite exhaustiveness (`Articulating.Corner.nodup_all`). What it adds is the
**partition-shaped statement** of those facts: exhaustiveness, disjointness, the
born-absurd starting point, and the stability of the stable corner — the four
things the scaffolding nodes gestured at without stating.

## Main definitions

* `Valuation.phase` — the phase of a claim under a valuation: `v φ`, named under the
  cell-partition vocabulary.

## Main results

* `Valuation.phase_cases` — every `(v, φ)` lands in one of the four named phases
  (exhaustiveness, by case analysis on `Corner`).
* `Articulating.Corner.pairwise_ne` — the four corners are pairwise distinct
  (disjointness); packages the `≠`-facts `Articulating.Corner.nodup_all` already
  witnesses collectively as a `List.Nodup`.
* `Valuation.phase_knowledgeLeast` — **born absurd**: the knowledge-least valuation
  (positing's seed) has phase `absurd` at every claim, with no exception.
* `Valuation.phase_posit_le` — positing never lowers a claim's phase: `phase v φ ≤ₖ
  phase (posit φ' q v) φ`, restating `posit_inflationary` under the partition name.
* `Valuation.phase_posit_knowledgeLeast` — from the born-absurd seed, a single posit
  of charge `q` at `φ` puts `φ`'s phase at exactly `q`.
* `Valuation.phase_asserting_knowledgeLeast` / `phase_denying_knowledgeLeast` /
  `phase_contesting_knowledgeLeast` / `phase_abstaining_knowledgeLeast` — the four
  speech-acts named by the corner they reach from the seed: asserting reaches
  potential (t), denying reaches active (f), contesting reaches stable (⊤ₖ),
  abstaining leaves absurd (⊥ₖ, a no-op).
* `Charge.joinK_kTop_left` — knowledge-join absorbs into `⊤ₖ` from the left (the
  mirror of `Positing.Morphism`'s file-private `joinK_kTop`, needed here in public
  form).
* `Valuation.phase_stable_absorbs` — **stability of stable**: once a claim's phase is
  `stable` (`⊤ₖ`), any further posit at that claim leaves it there. Together with
  `phase_knowledgeLeast` this makes precise the scaffolding prose's own line —
  `stable-predication-cell.md`'s *"only ever reached, never born into"* — as two
  theorems: no valuation is ever born there, and no posit ever leaves it.

## What this does not do

It does not derive a *cell-intrinsic* corner (one property of `φ` alone) — the
schema forbids that, and no theorem here claims it. Nor does it touch the still-open
measured-vs-seeded question `ArticulationMeasure.lean` and
`docs/history/corner-naming-convention.md` leave open: whether a cell's own
articulation status and an independently posited valuation charge at the same claim
should ever be required to agree. `phase` reads a valuation; it does not manufacture
one.
-/

namespace Obsmetrologia

/-! ## Disjointness: the four corners are pairwise distinct -/

namespace Articulating.Corner

/-- **Disjointness.** The four corners are pairwise distinct. Packages, as the six
raw `≠`-facts a phase case-split actually consumes, exactly what `nodup_all`
(`all.Nodup`, `all := [absurd, potential, active, stable]`) already witnesses
collectively — no new fact, only its shape. -/
theorem pairwise_ne :
    absurd ≠ potential ∧ absurd ≠ active ∧ absurd ≠ stable ∧
    potential ≠ active ∧ potential ≠ stable ∧
    active ≠ stable := by
  decide

end Articulating.Corner

/-! ## `phase` — the partition read off a valuation -/

namespace Valuation

/-- The **phase** of a claim `φ` under a valuation `v`: the charge `v` assigns it.
Definitionally just `v φ` — the identity the scaffolding's own vocabulary was
missing a name for. `Charge` and `Articulating.Corner` are the same four-point type
(`Charge := Articulating.Corner`), so a claim's phase under `v` already **is** one
of the four cell-partition corners, met here under the partition's own name: the
value-coordinate the predication-cell schema (rightly) forbids intrinsically is
exactly the coordinate a valuation supplies extrinsically. -/
def phase (v : Valuation) (φ : Claim) : Articulating.Corner := v φ

@[simp] theorem phase_eq (v : Valuation) (φ : Claim) : phase v φ = v φ := rfl

/-- **Exhaustiveness.** Every `(v, φ)` lands in one of the four named phases — a
finite case split on `Corner`, the same argument `card_eq_four`/`corner_surjective`
run for the articulation cell, transported here to the valuation-relative
reading. -/
theorem phase_cases (v : Valuation) (φ : Claim) :
    phase v φ = Articulating.Corner.absurd ∨ phase v φ = Articulating.Corner.potential ∨
    phase v φ = Articulating.Corner.active ∨ phase v φ = Articulating.Corner.stable := by
  unfold phase; cases v φ <;> simp

/-! ## Born absurd -/

/-- **Born absurd.** The knowledge-least valuation — positing's own seed
(`Valuation.knowledgeLeast`) — has phase `absurd` at *every* claim, with no
exception: nothing is ever born anywhere else in the partition. -/
theorem phase_knowledgeLeast (φ : Claim) :
    phase Valuation.knowledgeLeast φ = Articulating.Corner.absurd := rfl

/-! ## Positing only ever raises phase -/

/-- **Positing raises phase.** A posit anywhere never lowers `φ`'s phase in the
knowledge order — the partition-named restatement of `posit_inflationary`. -/
theorem phase_posit_le (φ' : Claim) (q : Charge) (v : Valuation) (φ : Claim) :
    Charge.leK (phase v φ) (phase (Valuation.posit φ' q v) φ) = true :=
  Valuation.posit_inflationary φ' q v φ

/-! ## Reaching each corner from the seed -/

/-- **Reaching a corner.** From the born-absurd seed, a single posit of charge `q`
at `φ` puts `φ`'s phase at exactly `q` — the point-mass update lands exactly where
aimed, by the `⊥ₖ`-unit law for `∨ₖ`. -/
theorem phase_posit_knowledgeLeast (φ : Claim) (q : Charge) :
    phase (Valuation.posit φ q Valuation.knowledgeLeast) φ = q := by
  show Charge.joinK (Valuation.knowledgeLeast φ) (Valuation.delta φ q φ) = q
  have h1 : Valuation.knowledgeLeast φ = Charge.kBot := rfl
  have h2 : Valuation.delta φ q φ = q := by
    unfold Valuation.delta; rw [if_pos rfl]
  rw [h1, h2, Charge.joinK_kBot]

/-- **Asserting** `φ` from the seed reaches **potential** (`t`, told true). -/
theorem phase_asserting_knowledgeLeast (φ : Claim) :
    phase (Valuation.asserting φ Valuation.knowledgeLeast) φ = Articulating.Corner.potential :=
  phase_posit_knowledgeLeast φ Charge.tTop

/-- **Denying** `φ` from the seed reaches **active** (`f`, told false). -/
theorem phase_denying_knowledgeLeast (φ : Claim) :
    phase (Valuation.denying φ Valuation.knowledgeLeast) φ = Articulating.Corner.active :=
  phase_posit_knowledgeLeast φ Charge.tBot

/-- **Contesting** `φ` from the seed reaches **stable** (`⊤ₖ`, told both). -/
theorem phase_contesting_knowledgeLeast (φ : Claim) :
    phase (Valuation.contesting φ Valuation.knowledgeLeast) φ = Articulating.Corner.stable :=
  phase_posit_knowledgeLeast φ Charge.kTop

/-- **Abstaining** at `φ` from the seed leaves it at **absurd** (`⊥ₖ`, told none) —
a no-op, since `⊥ₖ` is the join's identity. -/
theorem phase_abstaining_knowledgeLeast (φ : Claim) :
    phase (Valuation.abstaining φ Valuation.knowledgeLeast) φ = Articulating.Corner.absurd :=
  phase_posit_knowledgeLeast φ Charge.kBot

end Valuation

/-! ## Stability of stable -/

/-- Knowledge-join absorbs into `⊤ₖ` from the **left**: `⊤ₖ ∨ₖ a = ⊤ₖ` for any
charge `a`. The mirror (by `Charge.joinK_comm`) of `Positing.Morphism`'s
file-private `joinK_kTop` (`a ∨ₖ ⊤ₖ = ⊤ₖ`), restated here in public form since this
module needs the left-absorption shape and that lemma is not exported. -/
theorem Charge.joinK_kTop_left (a : Charge) : Charge.joinK Charge.kTop a = Charge.kTop := by
  cases a <;> rfl

namespace Valuation

/-- **Stability of stable.** Once a claim's phase under `v` is `stable` (`⊤ₖ`, told
both), any further posit *at that claim* leaves it there — `⊤ₖ` is `∨ₖ`-absorbing.
Together with `phase_knowledgeLeast` (no valuation is ever *born* here) this makes
precise `stable-predication-cell.md`'s own phrase, *"only ever reached, never born
into"*: born-absurd rules out the second half, and this theorem rules out ever
leaving once reached. -/
theorem phase_stable_absorbs (φ : Claim) (q : Charge) (v : Valuation)
    (h : phase v φ = Articulating.Corner.stable) :
    phase (Valuation.posit φ q v) φ = Articulating.Corner.stable := by
  show Charge.joinK (v φ) (Valuation.delta φ q φ) = Articulating.Corner.stable
  have hv : v φ = Charge.kTop := h
  rw [hv, Charge.joinK_kTop_left]
  rfl

end Valuation
end Obsmetrologia
