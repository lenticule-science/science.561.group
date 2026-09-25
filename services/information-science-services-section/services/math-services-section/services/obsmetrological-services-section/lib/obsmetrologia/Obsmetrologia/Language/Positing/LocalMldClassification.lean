import Obsmetrologia.Language.Positing.BigradedCohomology

/-!
# The MLD classification at the bilattice base — the converse, complete

The global aperiodic MLD classification (`thm:aperiodic-mld-classification`) asks whether equal
classifying invariant forces a settling-morphism. Its converse is open at the transfinite height. At
the **base** — a single bilattice charge, the FOUR — it is **complete**, converse included, and this
module proves it.

The local **settling-morphism** is the bilattice gauge: Belnap negation `~` (`Charge.negate`), the
over/under swap of the weave (`AperiodicOrder.Tiling.WeaveDraft.overUnder_swap_is_negate`) and the recto/verso
mirror of the bead (`AperiodicOrder.Tiling.PortGraph`). Two charges are **locally mutually-locally-derivable**
(`gaugeEquiv`) when the gauge relates them: `a = b` or `~a = b`. Its orbits are exactly
`{⊥}`, `{t, f}`, `{⊤}` — the hole, the two definite over/under readings (gauge-swapped `t ↔ f`), and
the held contradiction (the mis-crossing / Bose-condensed superjam).

The local **classifying invariant** is the pair `(told-nothing?, held-contradiction?)` —
`(c = ⊥ₖ, isInconsistency c)` — the knowledge-vacuity bit and the `⊤`-content bit, the two
gauge-fixed coordinates of the bilattice (negation fixes both poles `⊥`, `⊤` and only swaps the
definite pair). The classification (`local_mld_classification`):

  `gaugeEquiv a b  ↔  localClInv a = localClInv b`,

**both directions**. Forward is gauge-invariance of the two coordinates (the local Step 3); the
**converse** — equal invariant forces a gauge step — holds because the three invariant fibers are
exactly the three gauge orbits. This is the MLD classification, converse included, on the bilattice the
whole development sits over; the global node is the same classification raised through the knowledge and
truth towers, where the converse becomes the transfinite frontier.

## Main definitions

* `gaugeEquiv` — local mutual-local-derivability: related by the negation gauge.
* `localClInv` — the local classifying invariant `(told-nothing?, held-contradiction?)`.

## Main results

* `negate_involutive` — the gauge is an involution (`~~a = a`).
* `gaugeEquiv_refl` / `_symm` / `_trans` — `gaugeEquiv` is an equivalence relation.
* `local_mld_classification` — `gaugeEquiv a b ↔ localClInv a = localClInv b`, the converse included.

## References

`content/.../mutually-locally-derivable`; the bilattice base of `thm:aperiodic-mld-classification`.
Built on `Obsmetrologia.Positing.BigradedCohomology` (`Charge.isInconsistency`), realized on the weave/bead
carriers `Obsmetrologia.AperiodicOrder.Tiling.WeaveDraft` / `Obsmetrologia.AperiodicOrder.Tiling.PortGraph`.

## Tags

mutual local derivability, bilattice, FOUR, gauge, negation, classifying invariant, converse
-/

namespace Obsmetrologia
namespace Positing.LocalMld

open Obsmetrologia (Charge)

/-! ## (A) The local gauge and its invariant -/

/-- **Local mutual-local-derivability**: two charges related by the bilattice gauge — equal, or
swapped by Belnap negation `~` (the weave over/under flip, the bead recto/verso mirror). The local
settling-morphism between single bilattice values. -/
def gaugeEquiv (a b : Charge) : Prop := a = b ∨ Charge.negate a = b

/-- **The local classifying invariant**: the pair `(told-nothing?, held-contradiction?)` —
`(c = ⊥ₖ, isInconsistency c)`. The two gauge-fixed coordinates of the bilattice: knowledge-vacuity and
`⊤`-content. The hole is `(true, false)`, the held contradiction is `(false, true)`, the two definite
readings `t, f` are both `(false, false)`. -/
def localClInv (c : Charge) : Bool × Bool := (decide (c = Charge.kBot), Charge.isInconsistency c)

/-! ## (B) The gauge is an involution, hence an equivalence relation -/

/-- **The gauge is an involution**: `~~a = a`. The over/under flip undoes itself. -/
theorem negate_involutive (a : Charge) : Charge.negate (Charge.negate a) = a := by
  cases a <;> rfl

/-- `gaugeEquiv` is reflexive (the identity gauge step). -/
theorem gaugeEquiv_refl (a : Charge) : gaugeEquiv a a := Or.inl rfl

/-- `gaugeEquiv` is symmetric (the gauge inverts — negation is its own inverse). -/
theorem gaugeEquiv_symm {a b : Charge} (h : gaugeEquiv a b) : gaugeEquiv b a := by
  rcases h with h | h
  · exact Or.inl h.symm
  · exact Or.inr (by rw [← h, negate_involutive])

/-- `gaugeEquiv` is transitive (gauge steps compose; two negations cancel). -/
theorem gaugeEquiv_trans {a b c : Charge} (hab : gaugeEquiv a b) (hbc : gaugeEquiv b c) :
    gaugeEquiv a c := by
  rcases hab with hab | hab <;> rcases hbc with hbc | hbc
  · exact Or.inl (hab.trans hbc)
  · exact Or.inr (by rw [hab]; exact hbc)
  · exact Or.inr (by rw [hbc] at hab; exact hab)
  · refine Or.inl ?_
    rw [← hbc, ← hab, negate_involutive]

/-! ## (C) The classification — the converse included -/

/-- **The local MLD classification.** `gaugeEquiv a b ↔ localClInv a = localClInv b`: two charges are
locally mutually-locally-derivable **iff** they share the classifying invariant `(told-nothing?,
held-contradiction?)`. Forward is gauge-invariance of the two coordinates (the local Step 3); the
**converse** — equal invariant forces a gauge step — holds because the invariant's three fibers
`{⊥}`, `{t, f}`, `{⊤}` are exactly the three gauge orbits. The MLD classification, converse included,
at the bilattice base. Proved by exhaustion over the FOUR. -/
theorem local_mld_classification (a b : Charge) :
    gaugeEquiv a b ↔ localClInv a = localClInv b := by
  simp only [gaugeEquiv, localClInv]
  cases a <;> cases b <;> decide

/-! ## (D) The headline -/

/-- **The bilattice base of the MLD classification.** The local settling-morphism is the negation gauge
`~` (the weave over/under swap, the bead mirror); local mutual-local-derivability `gaugeEquiv` is an
**equivalence relation** (the gauge groupoid: identity, the self-inverse flip, composition), and it
**coincides with equality of the local classifying invariant** `(told-nothing?, held-contradiction?)`
— **both directions, the converse included** — because the invariant's three fibers are exactly the
three gauge orbits `{⊥}`, `{t, f}`, `{⊤}`. This is `thm:aperiodic-mld-classification` discharged at the
base of the bilattice towers; the global node is the same statement raised through the knowledge `≤ₖ`
and truth `≤ₜ` towers, where the converse becomes the transfinite frontier. -/
theorem bilattice_base_mld :
    (∀ a : Charge, gaugeEquiv a a)
    ∧ (∀ a b : Charge, gaugeEquiv a b → gaugeEquiv b a)
    ∧ (∀ a b c : Charge, gaugeEquiv a b → gaugeEquiv b c → gaugeEquiv a c)
    ∧ (∀ a b : Charge, gaugeEquiv a b ↔ localClInv a = localClInv b) :=
  ⟨gaugeEquiv_refl,
   fun _ _ h => gaugeEquiv_symm h,
   fun _ _ _ h h' => gaugeEquiv_trans h h',
   local_mld_classification⟩

end Positing.LocalMld
end Obsmetrologia
