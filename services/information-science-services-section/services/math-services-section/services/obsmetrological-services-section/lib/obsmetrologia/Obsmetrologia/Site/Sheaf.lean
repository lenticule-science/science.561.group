import Obsmetrologia.Language.Predicating.Quantifying

/-!
# Sheaf & settling cohomology — H¹ = 0 at the finite regime

Settling packages its fixed point as a **sheaf** `{base, section}`: the
value-saturated base of cells together with the globally agreeing **section** — the
settled reading at each cell. Its cohomology:

* **H⁰** — the global section realized; a count of the *designated* (settled-true)
  cells, the fixed point settling reaches.
* **H¹** — the obstruction to gluing local sections into one global section.

In the finite / strict regime the cascade ends and **H¹ = 0**: the residue drains
to zero, gluing succeeds with no obstruction. The corpus gives the concrete handle:
H¹ = 0 is exactly **CRDT / CALM convergence** — *deltas integrate without
coordination* — because the knowledge-join merge is order-independent (a bounded
join-semilattice). This module derives precisely that, plus sheaf **separation**
(a section is determined by its restrictions to a cover).
-/

namespace Obsmetrologia

/-- The settling sheaf: its global section is a reading at every cell of the base —
H⁰ realized, the settled valuation read as one coherent whole. -/
structure Sheaf where
  section_ : Valuation

namespace Sheaf

/-- A cell is **designated** when its settled reading is truth-top `t` (supported,
no counter-evidence). H⁰ is the extent of the designated cells. -/
def designated (S : Sheaf) (φ : PredicationCell) : Prop := S.section_ φ = Reading.tTop

end Sheaf

/-! ## The section merge is a CRDT (bounded join-semilattice) -/

namespace Valuation

theorem joinK_comm' (v w : Valuation) : joinK v w = joinK w v := by
  funext φ; exact Reading.joinK_comm (v φ) (w φ)
theorem joinK_idem' (v : Valuation) : joinK v v = v := by
  funext φ; exact Reading.joinK_idem (v φ)
theorem joinK_assoc' (v w u : Valuation) : joinK (joinK v w) u = joinK v (joinK w u) := by
  funext φ; exact Reading.joinK_assoc (v φ) (w φ) (u φ)

/-- Each section sits below the merge — the merge is an upper bound. -/
theorem le_joinK_left (v w : Valuation) : leK v (joinK v w) :=
  fun φ => Reading.le_joinK_left (v φ) (w φ)
theorem le_joinK_right (v w : Valuation) : leK w (joinK v w) :=
  fun φ => Reading.le_joinK_right (v φ) (w φ)

/-- **Gluing = least upper bound.** The merge of two sections is the *least* section
above both: local settlements glue to a unique global section, no obstruction. -/
theorem section_lub (v w u : Valuation) (hv : leK v u) (hw : leK w u) : leK (joinK v w) u :=
  fun φ => Reading.joinK_le (v φ) (w φ) (u φ) (hv φ) (hw φ)

end Valuation

/-! ## H¹ = 0 — CRDT/CALM convergence (order-independent merge) -/

namespace Reading

/-- **Vanishing H¹ (CRDT/CALM form).** The knowledge-join of a list of deltas
depends only on the *set* of deltas — not their order or multiplicity: lists with
the same membership merge to the same reading. Deltas integrate without
coordination. This is exactly H¹ = 0 in the finite regime. -/
theorem joinList_congr (l l' : List Reading) (h : ∀ a, a ∈ l ↔ a ∈ l') :
    joinList l = joinList l' := by
  apply kle_antisymm
  · exact joinList_le _ l (fun a ha => le_joinList a l' ((h a).1 ha))
  · exact joinList_le _ l' (fun a ha => le_joinList a l ((h a).2 ha))

/-- Merging a delta already absorbed changes nothing — idempotent integration: the
list `a :: l` and `l` have the same element set when `a ∈ l`. -/
theorem joinList_cons_mem (a : Reading) (l : List Reading) (ha : a ∈ l) :
    joinList (a :: l) = joinList l :=
  joinList_congr (a :: l) l (fun b => by
    constructor
    · intro hb
      rcases List.mem_cons.1 hb with rfl | hb'
      · exact ha
      · exact hb'
    · intro hb; exact List.mem_cons.2 (Or.inr hb))

end Reading

/-! ## Separation — a section is determined by a cover -/

namespace Sheaf

/-- A cover of the base: patches whose union is every cell. -/
structure Cover where
  patches : List (PredicationCell → Bool)
  covers : ∀ φ, ∃ p, p ∈ patches ∧ p φ = true

/-- Two sections agree on a patch when they coincide wherever the patch holds. -/
def agreeOn (p : PredicationCell → Bool) (v w : Valuation) : Prop :=
  ∀ φ, p φ = true → v φ = w φ

/-- **Sheaf separation.** A section is determined by its restrictions to a cover:
two sections that agree on every patch are equal. (The injectivity half of the
sheaf condition — no hidden global degrees of freedom.) -/
theorem separated (c : Cover) (v w : Valuation)
    (h : ∀ p, p ∈ c.patches → agreeOn p v w) : v = w := by
  funext φ
  obtain ⟨p, hp, hpφ⟩ := c.covers φ
  exact h p hp φ hpφ

end Sheaf

end Obsmetrologia
