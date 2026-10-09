import Obsmetrologia.Calculus.Order.CompleteNucleus
import Obsmetrologia.Language.Positing.Quartet

/-!
# CompleteNuclearQuartet — commuting complete nuclei, generalized to arbitrary suprema (DERIVED, L0)

`NucleusAndCommutingNuclei` builds the finitary theory of two **commuting** nuclei
`j₁, j₂` on a Heyting algebra: the composite `π = j₁ ∘ j₂` is again a nucleus
(`CommutingNuclei.compNucleus`), and `Fix(π) = Fix(j₁) ∩ Fix(j₂)`
(`CommutingNuclei.fix_pi_iff`) — the joint-quiescent corner is exactly the joint
fixed point, the four sub-algebras `(A, Fix(j₁), Fix(j₂), A*)` forming an exhaustive
commuting square. `CompleteNucleus` lifted the single-nucleus half of that theory off
the Heyting-algebra machinery and onto `Order.CompleteLattice` directly. This module
lifts the **commuting pair** half the same way: two `CNucleus`es settling in either
order compose to a third `CNucleus`, with the same joint-fixed-point characterization
— and, unlike the finitary proof, this porting needs nothing beyond `infl`/`idem`/
`meet2`/`comm`, so it goes through near-mechanically.

1. `CommutingCNuclei` — a pair of `CNucleus`es on one `CompleteLattice`, tied by a
   commuting hinge `j₁ (j₂ a) = j₂ (j₁ a)`.
2. `compNucleus` — the composite `π = j₁ ∘ j₂` is itself a `CNucleus`. Ported from
   `CommutingNuclei.compNucleus` verbatim, substituting `meet2` for `meet`.
3. `fix_pi_iff` — `Fix(π) = Fix(j₁) ∩ Fix(j₂)`. Ported from `CommutingNuclei.fix_pi_iff`
   verbatim.
4. `commutingCNuclei_pair` — the four-corner packaging, for free: instantiating
   `Quartet`'s carrier-agnostic `CommutingPair C.carrier` at `f := j₁.j, g := j₂.j`
   (mirroring `commutatingPair`'s instantiation at the finitary nuclei) hands us the
   corner operators, their exhaustiveness (`Articulating.Corner.card_eq_four`), and
   the coherence 2-cell (`CommutingPair.square`) as already-proved generic facts — no
   re-proof needed here.
5. `LatticeQuartet`/`latticeQuartet` — the capstone: the four sub-lattices `(C,
   Fix(j₁), Fix(j₂), Fix(π))` packaged together, each already a complete lattice by
   `CompleteNucleus`'s `CNucleus.fix_isCompleteLattice` (item 7 there) — again no new
   proof, only packaging. The two containments completing `fix_pi_iff`'s
   characterization — `Fix(π) → Fix(j₁)` and `Fix(π) → Fix(j₂)` — are recorded as
   `fix_j1_of_fix_comp`/`fix_j2_of_fix_comp`.

No free data: every definition here derives from `CompleteNucleus`'s `CNucleus` and
`Quartet`'s `CommutingPair`, and every theorem is a real proof — no axioms, no
`sorry`.
-/

namespace Obsmetrologia
namespace Order

/-! ## Item 1 — commuting complete nuclei -/

/-- A **commuting pair of complete nuclei** on one `CompleteLattice`: two `CNucleus`es
whose settling maps commute. Read `j1, j2` exactly as in `CommutingNuclei` — the
past-facing and future-facing closures of an aperiodic settling, `(σ, Δ)` — now
settling over arbitrary suprema rather than a finite Heyting carrier. -/
structure CommutingCNuclei (C : CompleteLattice) where
  /-- The first settling map. -/
  j1 : CNucleus C
  /-- The second settling map. -/
  j2 : CNucleus C
  /-- The hinge: `j₁ ∘ j₂ = j₂ ∘ j₁`. -/
  comm : ∀ a, j1.j (j2.j a) = j2.j (j1.j a)

namespace CommutingCNuclei
variable {C : CompleteLattice} (P : CommutingCNuclei C)

/-- The joint closure `π = j₁ ∘ j₂` — the doubly-settled corner's operator. -/
def pi (a : C.carrier) : C.carrier := P.j1.j (P.j2.j a)

/-! ## Item 2 — the composite is a complete nucleus -/

/-- **Commuting complete nuclei compose to a complete nucleus.** Ported from
`CommutingNuclei.compNucleus`: the proof uses only `infl`/`idem`/`meet2`/`comm`, so it
transports verbatim from the Heyting-algebra setting, `meet` replaced by `meet2`. -/
def compNucleus : CNucleus C where
  j := P.pi
  infl a := C.le_trans (P.j2.infl a) (P.j1.infl (P.j2.j a))
  idem a := by
    calc P.pi (P.pi a)
        = P.j1.j (P.j2.j (P.j1.j (P.j2.j a))) := rfl
      _ = P.j1.j (P.j1.j (P.j2.j (P.j2.j a))) := by rw [← P.comm (P.j2.j a)]
      _ = P.j1.j (P.j1.j (P.j2.j a)) := by rw [P.j2.idem]
      _ = P.j1.j (P.j2.j a) := P.j1.idem _
      _ = P.pi a := rfl
  meet2 a b := by
    show P.j1.j (P.j2.j (C.meet2 a b))
        = C.meet2 (P.j1.j (P.j2.j a)) (P.j1.j (P.j2.j b))
    rw [P.j2.meet2, P.j1.meet2]

/-! ## Item 3 — the joint fixed point -/

/-- **`Fix(π) = Fix(j₁) ∩ Fix(j₂)`.** The joint-settled corner is exactly the joint
fixed point; commutativity is the hinge. Ported from `CommutingNuclei.fix_pi_iff`
verbatim. -/
theorem fix_pi_iff (a : C.carrier) :
    P.compNucleus.Fix a ↔ (P.j1.Fix a ∧ P.j2.Fix a) := by
  constructor
  · intro h
    have hu : P.j1.j (P.j2.j a) = a := h
    have hge : C.le a (P.j2.j a) := P.j2.infl a
    have hle : C.le (P.j2.j a) a := by
      have h' := P.j1.infl (P.j2.j a); rw [hu] at h'; exact h'
    have hj2 : P.j2.j a = a := C.le_antisymm hle hge
    rw [hj2] at hu; exact ⟨hu, hj2⟩
  · intro ⟨h1, h2⟩
    show P.j1.j (P.j2.j a) = a
    rw [h2, h1]

/-! ## Item 4 — the four-corner packaging, for free -/

/-- **The commuting pair, as `Quartet`'s carrier-agnostic `CommutingPair`.** `Quartet`
already proved, once and for all, that any `f g : C → C` with `f ∘ g = g ∘ f` carries
a `Articulating.Corner`-indexed family of corner operators (`CommutingPair.cornerOp`),
that those four corners exhaust the type (`Articulating.Corner.card_eq_four`, a fact
about `Corner` alone, needing no instantiation), and the recurring coherence 2-cell
(`CommutingPair.square`). Instantiating it here at `f := j₁.j, g := j₂.j` — exactly
mirroring `commutatingPair`'s instantiation at the finitary `CommutingNuclei` — hands
all three back for `CommutingCNuclei` with no re-proof: `P.commutingCNuclei_pair.cornerOp`,
`P.commutingCNuclei_pair.square`, and `Articulating.Corner.card_eq_four` are already
the theorems this item needs. -/
def commutingCNuclei_pair : CommutingPair C.carrier where
  f := P.j1.j
  g := P.j2.j
  comm := P.comm

/-! ## Item 5 — the quartet of settled sub-lattices -/

/-- The **nesting** half of `fix_pi_iff`, isolated: a jointly-settled point is
`j₁`-settled. -/
theorem fix_j1_of_fix_comp {a : C.carrier} (h : P.compNucleus.Fix a) : P.j1.Fix a :=
  ((P.fix_pi_iff a).mp h).1

/-- The **nesting** half of `fix_pi_iff`, isolated: a jointly-settled point is
`j₂`-settled. -/
theorem fix_j2_of_fix_comp {a : C.carrier} (h : P.compNucleus.Fix a) : P.j2.Fix a :=
  ((P.fix_pi_iff a).mp h).2

end CommutingCNuclei

/-- **The quartet of settled sub-lattices**: the ambient `C` together with the
settled points of `j₁`, of `j₂`, and of their composite `π` — each already a
`CompleteLattice` by `CompleteNucleus`'s `CNucleus.fix_isCompleteLattice`. Mirrors the
finitary quartet's four sub-algebras `(A, Fix(j₁), Fix(j₂), A*)`, one level up: these
are the four corners not as predicates on one carrier, but as complete lattices in
their own right. -/
structure LatticeQuartet where
  /-- The free carrier, unsettled by either closure. -/
  ambient : CompleteLattice
  /-- The `j₁`-settled sub-lattice. -/
  fixJ1 : CompleteLattice
  /-- The `j₂`-settled sub-lattice. -/
  fixJ2 : CompleteLattice
  /-- The jointly-settled sub-lattice, `Fix(π)`. -/
  fixComp : CompleteLattice

/-- **The capstone.** No new proof: each field is `CompleteNucleus`'s
`fix_isCompleteLattice`, applied to `j₁`, `j₂`, and the composite `π` in turn — the
packaging is the theorem. -/
def latticeQuartet {C : CompleteLattice} (P : CommutingCNuclei C) : LatticeQuartet where
  ambient := C
  fixJ1 := P.j1.fix_isCompleteLattice
  fixJ2 := P.j2.fix_isCompleteLattice
  fixComp := P.compNucleus.fix_isCompleteLattice

end Order
end Obsmetrologia
