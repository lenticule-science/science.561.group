/-
# Firing blowup — the local structure of the closure flow at a firing

This module formalizes the corpus node

* `…/settling/.../non-scott-continuous-firing-ordinal/firing-blowup/firing-blowup.md`

— the **blowup** `Bl_μ` of a firing `μ` in a settling. The corpus reads: a settling is
a trajectory `v : κ → Val(C)`; at a non-zero stage `μ` the **firing** compares the
*predecessor value* `v^{→μ}` (the value the trajectory approaches from below at `μ`)
with the *actual value* `v_μ`. The comparison is the canonical morphism
`ι_μ : v^{→μ} → v_μ`, a knowledge-order increment in **FOUR**, and the **blowup** is
that morphism viewed in the arrow category. A firing is **trivial** iff `ι_μ` is an
isomorphism (identity on every cell), i.e. `v_μ = v^{→μ}`; **non-trivial** iff some
cell genuinely increments. The **NSC firings** — the genuine Scott-continuity
violations — are exactly the non-trivial firings at *limit* ordinals; successor firings
can be non-trivial too (single-step closure increments).

We model the settling trajectory as the **Nat-indexed closure
orbit** `orbit M seed` from `SettlingMonotonicityQuiescence` (the canonical settling,
`orbit_monotone`-monotone in the knowledge order). At this resolution every ordinal is a
successor: firing `μ = step μ` has **predecessor** `orbit (μ-1)` (`pred μ`) and **actual**
`orbit μ`. The firing morphism `ι_μ` is the comparison `predecessor ↦ actual`, modelled
as the **pair** `(predecessor, actual)` together with the standing knowledge-increment
`predecessor ≤ₖ actual` (`orbit_le_succ`, the inflationary step). The blowup is the
**identity** (predecessor = actual) exactly at trivial firings. The limit-ordinal /
NSC sub-class is genuinely transfinite (the directed-colimit predecessor of the corpus's
limit case) and so is **documented in prose**, not modelled: the Nat orbit has no limit
stages. What we *do* prove is the local model the corpus asserts uniformly across firings
— trivial ⟺ identity blowup ⟺ local quiescence, and non-trivial ⟺ a strict ≤ₖ-jump — of
which NSC firings are a documented sub-class.
-/
import RelMath.SettlingMonotonicityQuiescence
import RelMath.ClosureOperatorFiber
import RelMath.Positing

namespace RelMath
namespace Blowup

open RelMath.Valuation
open RelMath.Valuation.ModalFrame

/-! ## The firing, its predecessor, and its actual value

A **firing** in the Nat-indexed orbit model is a non-zero step `μ = n + 1`; we index
firings by the predecessor step `n`, so firing `n` fires from stage `n` to stage `n + 1`.
The **predecessor** value `v^{→μ}` is the orbit at the prior stage `orbit M seed n`; the
**actual** value `v_μ` is the orbit at `orbit M seed (n + 1)` — one closure step on. -/

/-- The **predecessor** value of the firing at step `n`: the orbit value *just before*
the firing, `v^{→μ} = orbit n`. (Corpus: the value the trajectory approaches from below
at `μ`; for a successor firing this is the immediate predecessor `v_α`.) -/
def predecessor (M : ModalFrame) (seed : Valuation) (n : Nat) : Valuation :=
  orbit M seed n

/-- The **actual** value of the firing at step `n`: the orbit value *at* the firing,
`v_μ = orbit (n + 1) = cl (orbit n)`. (Corpus: `v_μ`, the result of applying the closure
rule at this stage.) -/
def actual (M : ModalFrame) (seed : Valuation) (n : Nat) : Valuation :=
  orbit M seed (n + 1)

/-- The actual value is the closure step on the predecessor — `v_μ = cl (v^{→μ})`. This
is the firing morphism's *engine*: the closure rule increment from stage `n` to stage
`n + 1`. -/
theorem actual_eq_closure (M : ModalFrame) (seed : Valuation) (n : Nat) :
    actual M seed n = M.closureOp (predecessor M seed n) := rfl

/-! ## The firing morphism `ι_μ` and its standing direction

The firing morphism `ι_μ : v^{→μ} → v_μ` is a knowledge-order increment in **FOUR**: in
the orbit model it is the inflationary closure step. We record its standing direction —
`predecessor ≤ₖ actual` — reusing `orbit_le_succ` (each step is ≤ₖ-inflationary). The
**blowup** itself is this morphism as the *pair* `(predecessor, actual)` carrying that
increment; a firing is trivial exactly when the pair is diagonal (`predecessor = actual`). -/

/-- **The firing morphism is a knowledge-order increment.** `v^{→μ} ≤ₖ v_μ` — the
predecessor sits ≤ₖ-below the actual value, because the firing is one inflationary
closure step (`orbit_le_succ`). This is the *direction* of `ι_μ` in **FOUR**: no
information is retracted across a firing. -/
theorem predecessor_le_actual (M : ModalFrame) (seed : Valuation) (n : Nat) :
    leK (predecessor M seed n) (actual M seed n) :=
  orbit_le_succ M seed n

/-- The **blowup** `Bl_μ(v)` of the firing at step `n`: the firing morphism
`v^{→μ} → v_μ` presented as the arrow-category object — the **pair** of its source and
target `(predecessor, actual)`. The morphism's standing direction `predecessor ≤ₖ actual`
is `predecessor_le_actual`; the blowup is the *identity* arrow exactly when the pair is
diagonal. (Corpus: `Bl_μ(v) := (v^{→μ} → v_μ) ∈ Arr(Val(C))`.) -/
def Blowup (M : ModalFrame) (seed : Valuation) (n : Nat) : Valuation × Valuation :=
  (predecessor M seed n, actual M seed n)

@[simp] theorem Blowup_fst (M : ModalFrame) (seed : Valuation) (n : Nat) :
    (Blowup M seed n).1 = predecessor M seed n := rfl

@[simp] theorem Blowup_snd (M : ModalFrame) (seed : Valuation) (n : Nat) :
    (Blowup M seed n).2 = actual M seed n := rfl

/-! ## Trivial firings — the no-op stages with identity blowup

`firing-blowup.md`: the firing `μ` is **trivial** iff `ι_μ` is an isomorphism, i.e.
`ι_μ(c)` is the identity on every cell, equivalently `v_μ = v^{→μ}`. We make
`TrivialFiring` mean exactly `actual = predecessor` (no change). The blowup pair is then
**diagonal** — its two components coincide — which is the identity arrow in the arrow
category. -/

/-- A firing is **trivial** when the closure step produces no change:
`v_μ = v^{→μ}` (`actual = predecessor`). The corpus's "no-op stage" — the firing's
morphism `ι_μ` is the identity on every cell. -/
def TrivialFiring (M : ModalFrame) (seed : Valuation) (n : Nat) : Prop :=
  actual M seed n = predecessor M seed n

/-- **A trivial firing's blowup is the identity (diagonal) pair** — its source and target
coincide, `Bl_μ = (v^{→μ}, v^{→μ})`. This is `ι_μ = id` in the arrow category. -/
theorem trivial_blowup_diagonal (M : ModalFrame) (seed : Valuation) (n : Nat)
    (h : TrivialFiring M seed n) :
    Blowup M seed n = (predecessor M seed n, predecessor M seed n) := by
  unfold Blowup
  rw [h]

/-- **At a trivial firing the orbit has reached quiescence locally** — the predecessor is
a closure fixed point (`cl (orbit n) = orbit n`), so the orbit is constant from step `n`
onward (`orbit_const_of_fixed`). A trivial firing is exactly a *settled* stage of the
closure dynamics (`Quiescent` at the predecessor). -/
theorem trivial_firing_quiescent (M : ModalFrame) (seed : Valuation) (n : Nat)
    (h : TrivialFiring M seed n) :
    Quiescent M (predecessor M seed n)
    ∧ ∀ k, orbit M seed (n + k) = orbit M seed n := by
  have hfix : M.closureOp (orbit M seed n) = orbit M seed n := h
  exact ⟨hfix, orbit_const_of_fixed M seed n hfix⟩

/-! ## `blowup_trivial_iff_identity`

A firing is trivial ⟺ its blowup is the identity, i.e. `predecessor = actual` ⟺ the
blowup comparison is diagonal; and (a fortiori) at a trivial firing the orbit has reached
quiescence locally. The `iff` is proven over the orbit by `leK_antisymm` together with the
standing `predecessor ≤ₖ actual`. -/

/-- **`blowup_trivial_iff_identity`.** A firing is **trivial** ⟺ its **blowup
is the identity**. The three equivalent readings of the corpus's "trivial ⟺ `ι_μ` is an
isomorphism", over the Nat orbit:

* `TrivialFiring` (`actual = predecessor`, the no-op stage);
* the blowup pair is **diagonal** (`Blowup = (predecessor, predecessor)` — the identity
  arrow in `Arr(Val(C))`);
* the predecessor is a closure **fixed point** (`cl (orbit n) = orbit n`, local
  quiescence).

All three coincide. The forward direction rewrites the actual value through the trivial
equation; the converse reads the diagonal pair's second component back. The fixed-point
form is `TrivialFiring` unfolded through `actual_eq_closure`. Tie to quiescence:
`trivial_firing_quiescent` shows a trivial firing is a settled stage. -/
theorem blowup_trivial_iff_identity (M : ModalFrame) (seed : Valuation) (n : Nat) :
    (TrivialFiring M seed n
      ↔ Blowup M seed n = (predecessor M seed n, predecessor M seed n))
    ∧ (TrivialFiring M seed n ↔ M.closureOp (orbit M seed n) = orbit M seed n) := by
  refine ⟨?_, Iff.rfl⟩
  constructor
  · intro h; exact trivial_blowup_diagonal M seed n h
  · intro h
    show actual M seed n = predecessor M seed n
    have h2 : (Blowup M seed n).2 = (predecessor M seed n, predecessor M seed n).2 :=
      congrArg Prod.snd h
    simpa using h2

/-! ## Non-trivial firings — the jumps, and the NSC sub-class

`firing-blowup.md`: a firing is **non-trivial** iff `ι_μ` is not an isomorphism — at least
one cell genuinely increments, encoding the bilattice "jump". Since the firing morphism
always points up the knowledge order (`predecessor_le_actual`), non-triviality is exactly
the failure of the reverse inequality: `predecessor ≤ₖ actual` always, and the firing is
non-trivial iff `actual ≠ predecessor`, i.e. the increment is **strict** (`≤ₖ` holds but
`=` fails). The blowup is then **non-identity**. NSC firings are the non-trivial firings
at *limit* ordinals (documented; the Nat orbit has only successor stages). -/

/-- A firing is **non-trivial** when the closure step genuinely changes the value:
`v_μ ≠ v^{→μ}` (`actual ≠ predecessor`). At least one cell acquires new value — the
bilattice "jump". -/
def NonTrivialFiring (M : ModalFrame) (seed : Valuation) (n : Nat) : Prop :=
  actual M seed n ≠ predecessor M seed n

/-- **Non-trivial is the negation of trivial** — the two firing classes partition the
firings. -/
theorem nonTrivial_iff_not_trivial (M : ModalFrame) (seed : Valuation) (n : Nat) :
    NonTrivialFiring M seed n ↔ ¬ TrivialFiring M seed n :=
  Iff.rfl

/-- **A non-trivial firing's blowup is non-identity** — its source and target differ, so
the blowup pair is *not* diagonal. Contrapositive of `blowup_trivial_iff_identity`'s first
component. -/
theorem nonTrivial_blowup_nonIdentity (M : ModalFrame) (seed : Valuation) (n : Nat)
    (h : NonTrivialFiring M seed n) :
    Blowup M seed n ≠ (predecessor M seed n, predecessor M seed n) := by
  intro hbl
  apply h
  have h2 : (Blowup M seed n).2 = (predecessor M seed n, predecessor M seed n).2 :=
    congrArg Prod.snd hbl
  simpa using h2

/-! ## `nontrivial_firing_is_jump`

A non-trivial firing has `predecessor <ₖ actual` (a *strict* ≤ₖ-increase — the bilattice
"jump"): the inequality `predecessor ≤ₖ actual` always holds (`orbit_le_succ`, the
inflationary step), and the firing is non-trivial exactly when it is strict (the converse
inequality fails, equivalently `actual ≠ predecessor`). The blowup is non-identity exactly
there. NSC firings (at limit ordinals) are a documented sub-class of non-trivial firings. -/

/-- **`nontrivial_firing_is_jump`.** A **non-trivial** firing is a strict
knowledge-order **jump**: `predecessor ≤ₖ actual` always (the inflationary firing step,
`predecessor_le_actual`), and the firing is non-trivial **⟺** the increase is *strict* —
the reverse inequality `actual ≤ₖ predecessor` fails, equivalently `actual ≠ predecessor`
— **⟺** the blowup is non-identity. The bundle records:

* **(a) standing direction** — `predecessor ≤ₖ actual` (always; `orbit_le_succ`);
* **(b) strict ⟺ non-trivial** — `¬ (actual ≤ₖ predecessor) ↔ NonTrivialFiring` (with
  `predecessor ≤ₖ actual` from (a), `actual ≤ₖ predecessor` would force equality by
  `leK_antisymm`, so the reverse inequality fails exactly when the values differ);
* **(c) blowup non-identity** — a non-trivial firing's blowup is not the diagonal pair.

Tie — **NSC firings are a sub-class of non-trivial firings.** The corpus's
non-Scott-continuous firings are precisely the non-trivial firings at *limit* ordinals;
successor firings (all firings in this Nat orbit) can also be non-trivial, capturing
single-step closure increments. So `{NSC firings} ⊆ {non-trivial firings}`, with the
limit-vs-successor distinction the discriminant: this orbit model realizes only the
successor firings, and any non-trivial one is a genuine jump of the kind (b) describes;
the limit/NSC firings are the transfinite directed-colimit case, documented but not
modelled by the Nat orbit. -/
theorem nontrivial_firing_is_jump (M : ModalFrame) (seed : Valuation) (n : Nat) :
    leK (predecessor M seed n) (actual M seed n)
    ∧ (¬ leK (actual M seed n) (predecessor M seed n) ↔ NonTrivialFiring M seed n)
    ∧ (NonTrivialFiring M seed n →
        Blowup M seed n ≠ (predecessor M seed n, predecessor M seed n)) := by
  refine ⟨predecessor_le_actual M seed n, ?_, nonTrivial_blowup_nonIdentity M seed n⟩
  constructor
  · -- ¬ (actual ≤ₖ predecessor) → actual ≠ predecessor
    intro hnle heq
    exact hnle (by rw [heq]; exact leK_refl _)
  · -- non-trivial → ¬ (actual ≤ₖ predecessor): antisymmetry would force equality
    intro hne hle
    exact hne (leK_antisymm hle (predecessor_le_actual M seed n))

end Blowup
end RelMath
