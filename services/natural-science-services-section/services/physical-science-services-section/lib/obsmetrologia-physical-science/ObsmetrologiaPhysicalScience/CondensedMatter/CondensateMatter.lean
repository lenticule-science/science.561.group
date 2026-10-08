import Obsmetrologia.AperiodicOrder.Tiling.PortGraph

/-!
# Condensate matter: from the lenticule to a jammed material

A lenticule is the Bose condensate of the relational hull --- the site where the thread-relation
stops moving and is *held* as a $\top$ (`PortGraph`). This module takes the next rung: **matter is
an assembly of condensates that jams**. A material is a finite collection of lenticules, each with
its thread-occupation; its **matter content** is the density of Bose-condensed ($\top$) sites --- the
load-bearing, jammed lenticules (the beadwork survey's "superjamming"). An assembly with no
condensed site is massless: floppy, consistent, no held contradiction.

Green here:
* `condensate_inconsistency_iff` --- a lenticule is condensed ($\top$) iff over-occupied ($\ge 2$).
* `rigid_iff_overoccupied` --- a material carries matter (positive rigidity) iff some lenticule is
  over-occupied: the superjamming threshold, matter appearing exactly where a condensate holds $\top$.
* `floppy_of_all_le_one` --- an assembly whose lenticules are each empty or singly threaded is
  massless (rigidity zero), the consistent regime.

The complementary aspect --- load-bearing *topology*, where rigidity is the cycle rank $\check H^1$ of
the contact network (`CoordinationCohomology`: floppy iff a forest, rigid iff cyclic) --- is the next
rung; the residue is the percolation map from condensate density to that cycle structure.

## References
Corpus aperiodic-settling line; `dev/.../2026-06-26-survey-of-beadwork-mathematics.md` §IV.D (beaded
metamaterials, superjamming), §IX (mechanics, jamming).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

/-- A **material**: a finite assembly of lenticules, each recorded by its thread-occupation count. -/
abbrev Material := List Nat

/-- A lenticule is **condensed** ($\top$) exactly when over-occupied --- the thread passes it twice
or more. The local matter quantum: occupation $0$ is empty ($\bot$), $1$ is a definite single
thread, $\ge 2$ is the held $\top$. -/
theorem condensate_inconsistency_iff (k : Nat) :
    (condensate k).isInconsistency = true ↔ 2 ≤ k := by
  rcases k with _ | _ | n
  · constructor
    · intro h; rw [empty_consistent] at h; exact absurd h (by decide)
    · intro h; exact absurd h (by decide)
  · constructor
    · intro h; rw [single_consistent] at h; exact absurd h (by decide)
    · intro h; exact absurd h (by decide)
  · exact ⟨fun _ => by omega, fun _ => over_occupation_inconsistency n⟩

/-- The **rigidity** (matter content) of a material: the number of Bose-condensed ($\top$)
lenticules --- the load-bearing, jammed sites. -/
def rigidity (m : Material) : Nat := m.countP (fun k => (condensate k).isInconsistency)

/-- **A material is matter (load-bearing) iff some lenticule is condensed.** Rigidity is positive
iff at least one lenticule is over-occupied ($\ge 2$ threads): the superjamming threshold --- matter
appears exactly where a condensate holds $\top$. -/
theorem rigid_iff_overoccupied (m : Material) :
    0 < rigidity m ↔ ∃ k ∈ m, 2 ≤ k := by
  rw [rigidity, List.countP_pos_iff]
  constructor
  · rintro ⟨a, ha, hp⟩; exact ⟨a, ha, (condensate_inconsistency_iff a).mp hp⟩
  · rintro ⟨k, hk, h2⟩; exact ⟨k, hk, (condensate_inconsistency_iff k).mpr h2⟩

/-! ## Mass is monotone in entrenched failure

Mass is the count of held-$\top$ — entrenched failure. Driving one more lenticule into the condensed
regime adds exactly one mass quantum; a floppy site adds none; and adding material never sheds mass.
The more failure an assembly entrenches, the more massive it is. -/

/-- **The rest-mass quantum.** Entrenching one failure — a condensed, over-occupied lenticule — adds
exactly one unit of mass. The held-$\top$ is the discrete matter quantum. -/
theorem mass_quantum_condensed (k : Nat) (m : Material) (h : 2 ≤ k) :
    rigidity (k :: m) = rigidity m + 1 := by
  simp only [rigidity]
  rw [List.countP_cons, if_pos ((condensate_inconsistency_iff k).mpr h)]

/-- **A floppy lenticule adds no mass.** An empty or singly-threaded site entrenches no failure, so
it is massless — it leaves the assembly's mass unchanged. -/
theorem mass_quantum_floppy (k : Nat) (m : Material) (h : k ≤ 1) :
    rigidity (k :: m) = rigidity m := by
  simp only [rigidity]
  rw [List.countP_cons, if_neg (by simp only [condensate_inconsistency_iff]; omega), Nat.add_zero]

/-- **A floppy assembly carries no matter.** If every lenticule is empty or singly threaded, the
material is massless --- rigidity zero, the consistent (truth-only) regime, no held $\top$. -/
theorem floppy_of_all_le_one (m : Material) (h : ∀ k ∈ m, k ≤ 1) : rigidity m = 0 := by
  -- Direct induction via `mass_quantum_floppy`, not `List.countP_eq_zero`: that core lemma's
  -- own (`Iff`-shaped) proof is `Classical.choice`-tainted, and citing it would import that
  -- taint into this declaration for no constructive reason — `rigidity` is already built from
  -- `List.countP`, which `mass_quantum_floppy` above handles cleanly by cons-induction.
  induction m with
  | nil => rfl
  | cons k m' ih =>
      have hk : k ≤ 1 := h k List.mem_cons_self
      have hm' : ∀ j ∈ m', j ≤ 1 := fun j hj => h j (List.mem_cons_of_mem k hj)
      rw [mass_quantum_floppy k m' hk]
      exact ih hm'

/-- **Entrenching a failure strictly increases mass.** Each held-$\top$ site driven in makes the
bead strictly more massive — more entrenched failure, more matter. -/
theorem mass_strict_of_entrench (k : Nat) (m : Material) (h : 2 ≤ k) :
    rigidity m < rigidity (k :: m) := by
  rw [mass_quantum_condensed k m h]; omega

/-- **Mass never sheds under added material.** If `m₁` is a sub-assembly of `m₂` (every lenticule of
`m₁` is one of `m₂`), then `m₁` is no more massive than `m₂`: adding lenticules can only entrench
more failure, never less. The monotonicity of mass in the matter it holds. -/
theorem mass_mono_sublist {m₁ m₂ : Material} (h : m₁.Sublist m₂) :
    rigidity m₁ ≤ rigidity m₂ := by
  simp only [rigidity]; exact h.countP_le

end AperiodicOrder.Tiling
end Obsmetrologia
