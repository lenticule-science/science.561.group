/-
# Closure flow dynamics — the settling endofunctor as a discrete geometric flow

This module reads the settling closure orbit as a **discrete dynamical system**: the
spatiotemporal-knowledge-presheaf evolving in ordinal time under the settling
endofunctor `cl = ◇∘□`. It formalizes three conjoined corpus nodes living under the
*knowledge-least valuation* settling subtree:

* `…/settling/content/settling-bound/content/increment-sequence/increment-sequence.md`
  — an **increment sequence** `U = (u_τ)_{τ<λ}` of predication valuations is the input
  data driving a closure-driven spatiotemporal knowledge presheaf: each `u_τ` supplies
  the new evidence at settling step `τ`, joined into the previous state and re-closed.
  We model `U` as `u : Nat → Valuation` and build the driven flow `drive` with
  `drive (n+1) = cl (joinK (drive n) (u n))` — the corpus `F_U(E)_τ = Cl(E) ∨ₖ u_τ`.
* `…/settling/content/settling-continuity/settling-continuity.md` — a settling is
  **continuous** when the value at a limit ordinal is the directed knowledge-join
  (colimit) of the values below it; **Scott-continuous segments are the "smooth"
  parts of the flow**. At step level, a smooth step is a no-op (quiescent) step and a
  firing step is a non-trivial step.
* `…/settling/_archive/predication-categorical-archive-predication-closure-flow-singularity-formation.md`
  — *closure flow as geometric flow with firings as singularities*. The closure
  operator iterates over ordinal time producing a **trajectory** in the space of
  valuations; Scott-continuous segments are **smooth**; non-Scott-continuous firings
  are the **singular times**. We give the discrete dynamical-system reading the archive
  asks for as its sub-question (1) "state the closure flow as a discrete geometric
  flow": the flow ascends ≤ₖ-monotonically (the trajectory), its **singular (firing)
  times form an initial segment** terminating at the closure ordinal (a fixed point),
  and the increment-driven flow `F_U` is ≤ₖ-inflationary at every step.

## The dynamical-system dictionary (made explicit)

| flow language | settling structure |
| --- | --- |
| trajectory / orbit | `orbit M seed : Nat → Valuation`, `cl`-iteration from the seed |
| flow ascends | `orbit_monotone` : `m ≤ n → orbit m ≤ₖ orbit n` |
| smooth time | `SmoothStep seed n` : `orbit (n+1) = orbit n` (a no-op/Scott-continuous step) |
| singular (firing) time | `FiringStep seed n` : `orbit (n+1) ≠ orbit n` |
| fixed point (the flow stops) | `cl (orbit k) = orbit k` (= quiescence / closure algebra) |
| singular times = initial segment | `smooth_is_terminal` : once smooth, smooth forever |
| driven flow `F_U` | `drive M u seed : Nat → Valuation`, `cl (· ∨ₖ u_n)` |

So the closure flow is a monotone dynamical system whose firing (singular) times form
an initial segment ending at the closure ordinal, after which the trajectory is
constant at the least fixed point above the seed (`settle_least_quiescent`).
-/
import RelMath.SettlingMonotonicityQuiescence
import RelMath.ClosureOperatorFiber
import RelMath.ModalPairAdjunction
import RelMath.Settling
import RelMath.Positing

namespace RelMath
namespace Valuation
namespace ModalFrame

open Charge

variable (M : ModalFrame)

/-! ## (1) The flow = the orbit of `cl`; the trajectory ascends to a fixed point

The closure flow is the `cl`-orbit. We restate, in flow language, the two facts that
make it a well-posed ascent: the trajectory is ≤ₖ-monotone in flow-time (reuse
`orbit_monotone`), and the value at a fixed point is the **least fixed point** above
the seed (reuse `settle_least_quiescent`). Together: *the closure flow ascends
monotonically in the knowledge order to a fixed point.* -/

/-- **The closure flow ascends.** The trajectory `orbit M seed` is ≤ₖ-monotone in
flow-time: for `m ≤ n`, `orbit m ≤ₖ orbit n`. No information is retracted along the
flow; the knowledge order only grows. (Flow restatement of `orbit_monotone`.) -/
theorem flow_ascends (seed : Valuation) {m n : Nat} (h : m ≤ n) :
    leK (orbit M seed m) (orbit M seed n) :=
  orbit_monotone M seed h

/-- **The flow fixed-point value is the least fixed point above the seed.** If the
trajectory has reached a quiescent valuation `x` (`cl x = x`) lying ≤ₖ-above the seed,
then the settled value `cl seed` sits ≤ₖ-below it: the flow lands on the *least* fixed
point above the seed, not merely *a* fixed point. (Flow restatement of
`settle_least_quiescent`, with `settle = cl`.) -/
theorem flow_lands_on_lfp (seed x : Valuation)
    (hsx : leK seed x) (hx : Quiescent M x) : leK (M.settle seed) x :=
  settle_least_quiescent M seed x hsx hx

/-- **The closure flow ascends monotonically to a fixed point (bundled).** The orbit
is ≤ₖ-monotone in flow-time, and any quiescent valuation above the seed dominates the
settled value — so the trajectory ascends to the *least* fixed point above the seed. -/
theorem flow_is_monotone_ascent_to_lfp (seed : Valuation) :
    (∀ {m n : Nat}, m ≤ n → leK (orbit M seed m) (orbit M seed n))
    ∧ (∀ x, leK seed x → Quiescent M x → leK (M.settle seed) x) :=
  ⟨fun h => orbit_monotone M seed h, fun x => settle_least_quiescent M seed x⟩

/-! ## (2) Smooth vs singular (firing) times

`settling-continuity.md` / the singularity-formation archive: Scott-continuous
segments are **smooth**, non-Scott-continuous firings are **singular times**. At the
discrete-step level, a step is *smooth* when it is a no-op (`orbit (n+1) = orbit n`,
the value is already settled / the colimit is approached from below with no new
content) and a *firing/singular* step when it changes the valuation. The central
dynamical fact: **once the flow stops firing it stays settled** — the singular times
form an initial segment terminating at the closure ordinal. -/

/-- A **smooth step** of the flow at flow-time `n`: the step is a no-op,
`orbit (n+1) = orbit n`. (A Scott-continuous / settled step — no new content.) -/
def SmoothStep (seed : Valuation) (n : Nat) : Prop :=
  orbit M seed (n + 1) = orbit M seed n

/-- A **firing step** (singular time) of the flow at flow-time `n`: the step is
non-trivial, `orbit (n+1) ≠ orbit n`. (A non-Scott-continuous firing — the trajectory
develops a singularity.) -/
def FiringStep (seed : Valuation) (n : Nat) : Prop :=
  orbit M seed (n + 1) ≠ orbit M seed n

/-- A **firing step is exactly the negation of a smooth step** at the same time: a
flow-time is singular iff it is not smooth (definitional — `FiringStep` is `¬
SmoothStep`). So every flow-time is smooth or firing, and never both: smoothness
*excludes* firing. (The reverse collapse `¬ FiringStep → SmoothStep` would need the
excluded middle on valuation equality, which is not constructively available; we record
the constructive direction `SmoothStep → ¬ FiringStep` separately.) -/
theorem firing_iff_not_smooth (seed : Valuation) (n : Nat) :
    FiringStep M seed n ↔ ¬ SmoothStep M seed n := Iff.rfl

/-- **Smooth excludes firing.** A smooth step is never a firing step at the same time
(the constructive half of the smooth/singular dichotomy). -/
theorem smooth_not_firing (seed : Valuation) (n : Nat) :
    SmoothStep M seed n → ¬ FiringStep M seed n :=
  fun h hf => hf h

/-- A smooth step is a **fixed point** of the closure: `orbit (n+1) = cl (orbit n)`, so
`SmoothStep n` says `cl (orbit n) = orbit n`. (Flow restatement: a no-op step is
quiescence at `orbit n`.) -/
theorem smoothStep_iff_fixed (seed : Valuation) (n : Nat) :
    SmoothStep M seed n ↔ M.closureOp (orbit M seed n) = orbit M seed n := by
  unfold SmoothStep
  rw [orbit_succ]

/-- **Smoothness is terminal — singular times form an initial segment.** Once the flow
is smooth at flow-time `k`, every later step is smooth: `orbit (k + n) = orbit k` for
all `n`, so each later step `orbit (k+n+1) = orbit (k+n)`. The flow, once it stops
firing, stays settled; the firing (singular) times all lie strictly before `k` — an
**initial segment of flow-time terminating at the closure ordinal**. (Reuses
`orbit_const_of_fixed` via `smoothStep_iff_fixed`.) -/
theorem smooth_is_terminal (seed : Valuation) (k : Nat) (h : SmoothStep M seed k) :
    ∀ n, SmoothStep M seed (k + n) := by
  have hfix : M.closureOp (orbit M seed k) = orbit M seed k :=
    (smoothStep_iff_fixed M seed k).1 h
  intro n
  have hconst := orbit_const_of_fixed M seed k hfix
  show orbit M seed (k + n + 1) = orbit M seed (k + n)
  have e1 : orbit M seed (k + n + 1) = orbit M seed k := by
    have := hconst (n + 1); rwa [← Nat.add_assoc] at this
  have e2 : orbit M seed (k + n) = orbit M seed k := hconst n
  rw [e1, e2]

/-- **The settled flow never fires.** At the settled value `cl seed` (a fixed point),
every step is smooth: `settle seed` is a flow with no singular times — it is a fixed
point of the dynamical system. -/
theorem settled_no_firing (seed : Valuation) (n : Nat) :
    SmoothStep M (M.settle seed) n := by
  have hfix : M.closureOp (orbit M (M.settle seed) 0) = orbit M (M.settle seed) 0 := by
    show M.closureOp (M.settle seed) = M.settle seed
    exact M.settle_fixed seed
  have h0 : SmoothStep M (M.settle seed) 0 := (smoothStep_iff_fixed M (M.settle seed) 0).2 hfix
  have := smooth_is_terminal M (M.settle seed) 0 h0 n
  rwa [Nat.zero_add] at this

/-! ## (3) The increment-sequence-driven flow — the `F_U` formula

`increment-sequence.md`: the increment sequence `U = (u_τ)` supplies the new evidence
at each settling step, joined into the previous state and re-closed. The corpus driven
flow is `F_U(E)_τ = Cl(E) ∨ₖ u_τ`, i.e.

  `drive (n+1) = cl (joinK (drive n) (u n))`.

We model `U` as `u : Nat → Valuation` and prove the flow is ≤ₖ-inflationary at every
step, and that with the **empty increment** `u ≡ ⊥` it reduces to the plain closure
orbit (so the driven flow genuinely *extends* the closure flow of §1). -/

/-- The **increment-driven flow** `F_U`. From a seed, each step joins the next
increment `u n` and re-closes: `drive 0 = seed`, `drive (n+1) = cl (drive n ∨ₖ u n)`.
This is the corpus `F_U(E)_τ = Cl(E) ∨ₖ u_τ` realized over flow-time `Nat`. -/
def drive (u : Nat → Valuation) (seed : Valuation) : Nat → Valuation
  | 0 => seed
  | n + 1 => M.closureOp (joinK (drive u seed n) (u n))

@[simp] theorem drive_zero (u : Nat → Valuation) (seed : Valuation) :
    drive M u seed 0 = seed := rfl

@[simp] theorem drive_succ (u : Nat → Valuation) (seed : Valuation) (n : Nat) :
    drive M u seed (n + 1) = M.closureOp (joinK (drive M u seed n) (u n)) := rfl

/-- **The driven flow is ≤ₖ-inflationary at every step.** `drive n ≤ₖ drive (n+1)`:
the previous state sits ≤ₖ-below its join with the new increment (`le_joinK_left`),
and the closure is inflationary (`closureOp_infl`); chaining gives the ascent. So
`F_U` never retracts knowledge — each settling step only adds evidence. -/
theorem drive_le_succ (u : Nat → Valuation) (seed : Valuation) (n : Nat) :
    leK (drive M u seed n) (drive M u seed (n + 1)) := by
  rw [drive_succ]
  have hjoin : leK (drive M u seed n) (joinK (drive M u seed n) (u n)) :=
    le_joinK_left _ _
  have hinfl : leK (joinK (drive M u seed n) (u n))
      (M.closureOp (joinK (drive M u seed n) (u n))) :=
    M.closureOp_infl _
  exact leK_trans hjoin hinfl

/-- **The driven flow ascends.** `m ≤ n → drive m ≤ₖ drive n`: the step-inflationary
law `drive_le_succ` chained transitively. `F_U` is a ≤ₖ-monotone dynamical system. -/
theorem drive_monotone (u : Nat → Valuation) (seed : Valuation) {m n : Nat} (h : m ≤ n) :
    leK (drive M u seed m) (drive M u seed n) := by
  induction n with
  | zero =>
    have : m = 0 := Nat.le_zero.1 h
    subst this; exact leK_refl _
  | succ k ih =>
    rcases Nat.lt_or_ge m (k + 1) with hlt | hge
    · exact leK_trans (ih (Nat.le_of_lt_succ hlt)) (drive_le_succ M u seed k)
    · have : m = k + 1 := Nat.le_antisymm h hge
      subst this; exact leK_refl _

/-- **The empty increment recovers the plain closure orbit.** With `u ≡ ⊥` (the empty
increment `fun _ _ => Charge.kBot`), `drive` is exactly the closure `orbit` of §1:
`drive ⊥ seed n = orbit seed n`. So the increment-driven flow `F_U` genuinely extends
the closure flow — the closure flow is `F_U` with no new evidence. (Uses
`joinK_kBot`: joining the empty increment is the identity on the running state.) -/
theorem drive_empty_eq_orbit (seed : Valuation) (n : Nat) :
    drive M (fun _ _ => Charge.kBot) seed n = orbit M seed n := by
  induction n with
  | zero => rfl
  | succ k ih =>
    rw [drive_succ, orbit_succ, ih]
    have hjoin : joinK (orbit M seed k) (fun _ => Charge.kBot) = orbit M seed k := by
      funext φ
      show Charge.joinK (orbit M seed k φ) Charge.kBot = orbit M seed k φ
      cases orbit M seed k φ <;> rfl
    rw [hjoin]

/-! ## (4) Headline — the closure flow is a monotone dynamical system

We bundle the dynamical-system reading: the increment-driven flow is step-inflationary
(§3) and the underlying closure flow singular (firing) times form an initial segment
that, once exhausted (a smooth step at `k`), keep the flow smooth forever (§2). This is
the discrete geometric-flow restatement the singularity-formation archive asks for. -/

/-- **The closure flow is a monotone dynamical system.** Bundling:

* **inflationary step** — the increment-driven flow `F_U` ascends at every step:
  `drive n ≤ₖ drive (n+1)` for any increment sequence `u` (§3, `drive_le_succ`); in
  particular the closure flow (`u ≡ ⊥`) does, since `drive ⊥ = orbit`;
* **smooth-tail termination** — once the closure flow is smooth at flow-time `k`
  (a no-op step), it is smooth at every later time `k + n` (§2,
  `smooth_is_terminal`): the singular (firing) times form an initial segment
  terminating at the closure ordinal, after which the trajectory is constant at the
  least fixed point above the seed.

Together this realizes the singularity-formation archive sub-question (1): the
closure operator iteration *is* a discrete geometric flow — a ≤ₖ-monotone dynamical
system on valuations whose singular times are an initial segment. -/
theorem closure_flow_is_monotone_dynamical_system
    (u : Nat → Valuation) (seed : Valuation) :
    (∀ n, leK (drive M u seed n) (drive M u seed (n + 1)))
    ∧ (∀ k, SmoothStep M seed k → ∀ n, SmoothStep M seed (k + n)) :=
  ⟨fun n => drive_le_succ M u seed n,
   fun k hk n => smooth_is_terminal M seed k hk n⟩

end ModalFrame
end Valuation
end RelMath
