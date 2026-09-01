import Mathlib.Order.Heyting.Basic
import RelationalHyperverse.FiberAlgebras

-- Establishes: proposition

/-!
# Proposition: elements of the fiber Heyting algebra

Corresponds to `math/proposition.md`.

A **proposition** is an element of the fiber Heyting algebra H at a history t:

    a : H,   where [BiNucleus H].

Propositions are the fundamental semantic objects of the entire development.
Every structure — nuclei (σ, Δ), restriction maps, the fixed fiber H*, the
sheaf topos R — ultimately exists to characterize how propositions behave and
what makes them stable.

## The four named stability kinds

The nuclear structure (σ, Δ) partitions propositions into four named kinds:

- **Saturation-stable** (σ-fixed): `σ(a) = a`.
  The past (history of the history) has nothing more to add.

- **Transfer-stable** (Δ-fixed): `Δ(a) = a`.
  Every one-step extension already contains it.

- **Doubly-stable** (both): `a ∈ H*`.
  Both the past and the future have stabilized. These are the observable propositions.

- **Unstable**: moved by σ or Δ (or both).
  Still accumulating information.

## Main definitions
- `SatStable bn a`    : saturation-stable — σ(a) = a
- `TransStable bn a`  : transfer-stable   — Δ(a) = a
- `DoublyStable bn a` : doubly-stable     — a ∈ H* = Fix(σ) ∩ Fix(Δ)
- `Unstable bn a`     : unstable          — ¬SatStable or ¬TransStable

## Main results (all sorry-free)
- `doublyStable_iff`       : DoublyStable ↔ SatStable ∧ TransStable
- `satStable_of_sat`       : σ(a) is always saturation-stable (reflection)
- `transStable_of_ktr`     : Δ(a) is always transfer-stable (reflection)
- `doublyStable_pi`        : π(a) = σ(Δ(a)) is always doubly-stable
- `satStable_top`          : ⊤ is saturation-stable
- `transStable_top`        : ⊤ is transfer-stable
- `doublyStable_top`       : ⊤ is doubly-stable
- `doublyStable_inf_closed`: if a, b doubly-stable then a ⊓ b doubly-stable
- `doublyStable_himp_closed`: if a, b doubly-stable then a ⇨ b doubly-stable
-/

-- ── §1: The four stability kinds ─────────────────────────────────────────────

variable {H : Type*} [Lattice H] (bn : BiNucleus H)

/-- A saturation-stable proposition: fixed by σ.
    "The past has nothing more to add." -/
def SatStable (a : H) : Prop := bn.σ.toFun a = a

/-- A transfer-stable proposition: fixed by Δ.
    "Every one-step extension already contains it." -/
def TransStable (a : H) : Prop := bn.Δ.toFun a = a

/-- A doubly-stable proposition: fixed by both σ and Δ, i.e., a member of H*.
    "Both the past and the future have stabilized around it." -/
def DoublyStable (a : H) : Prop := a ∈ bn.fixedFiber

/-- An unstable proposition: moved strictly upward by σ or Δ.
    "Has not yet reached its saturation or transfer value." -/
def Unstable (a : H) : Prop := ¬ SatStable bn a ∨ ¬ TransStable bn a

-- ── §2: Characterization lemmas ──────────────────────────────────────────────

/-- Saturation-stable is definitionally: σ(a) = a. -/
theorem satStable_iff {a : H} : SatStable bn a ↔ bn.σ.toFun a = a :=
  Iff.rfl

/-- Transfer-stable is definitionally: Δ(a) = a. -/
theorem transStable_iff {a : H} : TransStable bn a ↔ bn.Δ.toFun a = a :=
  Iff.rfl

/-- Doubly-stable is saturation-stable AND transfer-stable. -/
theorem doublyStable_iff {a : H} :
    DoublyStable bn a ↔ SatStable bn a ∧ TransStable bn a := by
  constructor
  · intro ⟨hσ, hΔ⟩
    exact ⟨bn.σ.mem_fixedPoints.mp hσ, bn.Δ.mem_fixedPoints.mp hΔ⟩
  · intro ⟨hs, ht⟩
    exact ⟨bn.σ.mem_fixedPoints.mpr hs, bn.Δ.mem_fixedPoints.mpr ht⟩

/-- Doubly-stable implies saturation-stable. -/
theorem DoublyStable.satStable {a : H} (h : DoublyStable bn a) : SatStable bn a :=
  ((doublyStable_iff bn).mp h).1

/-- Doubly-stable implies transfer-stable. -/
theorem DoublyStable.transStable {a : H} (h : DoublyStable bn a) : TransStable bn a :=
  ((doublyStable_iff bn).mp h).2

/-- Doubly-stable propositions are not unstable. -/
theorem not_unstable_of_doublyStable {a : H} (h : DoublyStable bn a) : ¬ Unstable bn a := by
  simp only [Unstable, not_or, not_not]
  exact ⟨h.satStable bn, h.transStable bn⟩

-- ── §3: Reflection — applying a nucleus yields a stable proposition ──────────

/-- σ(a) is always saturation-stable: σ(σ(a)) = σ(a). -/
theorem satStable_of_sat (a : H) : SatStable bn (bn.σ.toFun a) :=
  bn.σ.idempotent a

/-- Δ(a) is always transfer-stable: Δ(Δ(a)) = Δ(a). -/
theorem transStable_of_ktr (a : H) : TransStable bn (bn.Δ.toFun a) :=
  bn.Δ.idempotent a

/-- π(a) = σ(Δ(a)) is always doubly-stable: π(a) ∈ H*. -/
theorem doublyStable_pi (a : H) : DoublyStable bn (bn.pi a) :=
  bn.pi_mem_fixedFiber a

-- Note: σ-stability is NOT preserved by Δ in general — that would require commute.
-- π(a) ∈ H* (doublyStable_pi above) is the correct joint statement.

-- ── §4: Stability is closed under ⊓ ──────────────────────────────────────────

/-- Saturation-stable propositions are closed under ⊓. -/
theorem satStable_inf_closed {a b : H}
    (ha : SatStable bn a) (hb : SatStable bn b) : SatStable bn (a ⊓ b) := by
  unfold SatStable at *
  rw [bn.σ.meet_pres, ha, hb]

/-- Transfer-stable propositions are closed under ⊓. -/
theorem transStable_inf_closed {a b : H}
    (ha : TransStable bn a) (hb : TransStable bn b) : TransStable bn (a ⊓ b) := by
  unfold TransStable at *
  rw [bn.Δ.meet_pres, ha, hb]

/-- Doubly-stable propositions are closed under ⊓. -/
theorem doublyStable_inf_closed {a b : H}
    (ha : DoublyStable bn a) (hb : DoublyStable bn b) : DoublyStable bn (a ⊓ b) :=
  bn.fixedFiber_inf_closed ha hb

-- ── §5: Top is doubly-stable ─────────────────────────────────────────────────
-- These require a top element; we use [HeytingAlgebra H].

section WithTop

variable {H' : Type*} [HeytingAlgebra H'] (bn' : BiNucleus H')

/-- ⊤ is saturation-stable: σ(⊤) = ⊤.
    By extensivity σ(⊤) ≥ ⊤, but ⊤ is the greatest element, so σ(⊤) = ⊤. -/
theorem satStable_top : SatStable bn' (⊤ : H') :=
  le_antisymm le_top (bn'.σ.extensive ⊤)

/-- ⊤ is transfer-stable: Δ(⊤) = ⊤. -/
theorem transStable_top : TransStable bn' (⊤ : H') :=
  le_antisymm le_top (bn'.Δ.extensive ⊤)

/-- ⊤ is doubly-stable: ⊤ ∈ H*. -/
theorem doublyStable_top : DoublyStable bn' (⊤ : H') :=
  (doublyStable_iff bn').mpr ⟨satStable_top bn', transStable_top bn'⟩

/-- Doubly-stable propositions are closed under Heyting implication ⇨.
    Proof: Fix(j) is closed under ⇨ for any nucleus j (from HaNucl). -/
theorem doublyStable_himp_closed {a b : H'}
    (ha : DoublyStable bn' a) (hb : DoublyStable bn' b) : DoublyStable bn' (a ⇨ b) :=
  ⟨bn'.σ.mem_fixedPoints.mpr
     (bn'.σ.himp_fixed_of_fixed
       (bn'.σ.mem_fixedPoints.mp ha.1)
       (bn'.σ.mem_fixedPoints.mp hb.1)),
   bn'.Δ.mem_fixedPoints.mpr
     (bn'.Δ.himp_fixed_of_fixed
       (bn'.Δ.mem_fixedPoints.mp ha.2)
       (bn'.Δ.mem_fixedPoints.mp hb.2))⟩

end WithTop

-- ── §6: Extensivity — every proposition is below its saturation and transfer ──

/-- Every proposition lies below its saturation: a ≤ σ(a). -/
theorem le_sat (a : H) : a ≤ bn.σ.toFun a :=
  bn.σ.extensive a

/-- Every proposition lies below its transfer: a ≤ Δ(a). -/
theorem le_ktr (a : H) : a ≤ bn.Δ.toFun a :=
  bn.Δ.extensive a

/-- Every proposition lies below its doubly-stable envelope: a ≤ π(a). -/
theorem le_pi (a : H) : a ≤ bn.pi a :=
  bn.pi_extensive a

/-- Saturation is the least saturation-stable proposition above a:
    if b is saturation-stable and a ≤ b, then σ(a) ≤ b. -/
theorem sat_le_of_satStable_of_le {a b : H}
    (hb : SatStable bn b) (hab : a ≤ b) : bn.σ.toFun a ≤ b :=
  bn.σ.le_fixed_of_le hab (bn.σ.mem_fixedPoints.mpr hb)

/-- Transfer is the least transfer-stable proposition above a. -/
theorem ktr_le_of_transStable_of_le {a b : H}
    (hb : TransStable bn b) (hab : a ≤ b) : bn.Δ.toFun a ≤ b :=
  bn.Δ.le_fixed_of_le hab (bn.Δ.mem_fixedPoints.mpr hb)
