import Obsmetrologia.Closure.Ordinal
import Obsmetrologia.Closure.SettlingMonotonicityQuiescence
import Obsmetrologia.Closure.Operator
import Obsmetrologia.Closure.Modal
import Obsmetrologia.Language.Settling
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Calculus.Order.OrderInfra

/-!
# Transfinite closure flow

`OrdFlow := Ord → Valuation`, a valuation family indexed by the internal ordinal `Ord`
(`Closure/OrdinalCore.lean`), replacing `ClosureFlowDynamics`'s `Nat`-time orbit.
`Monotone` is `≤ₖ`-monotonicity along `Ord.Le`. `ContinuousAt w f` states that
`w (Ord.limit f)` is the `leK`-least upper bound of `{w (f n)}`. `tflowOf` is the
concrete flow built from the finite `Charge` orbit; `tflowOf_continuousAt_of_reaches`
proves it continuous at any fundamental sequence that reaches `M.settle seed`, via
`Order.upperBound_of_reached_isLUB`. `continuous_no_nsc_firing` shows a continuous flow
has no non-Scott-continuous firing at any limit.

Cites `content/…/settling/content/settling-continuity/settling-continuity.md`.
-/

namespace Obsmetrologia
namespace Valuation
namespace ModalFrame

open Charge

variable (M : ModalFrame)

/-! ## (1) The monotone transfinite family

`OrdFlow := Ord → Valuation` — a valuation family indexed by the **ordinal**,
not `Nat`. `Monotone` is `≤ₖ`-monotonicity along the ordinal order `Ord.Le`: as we
climb the ordinal, knowledge only grows (no retraction). -/

/-- A **transfinite closure flow**: a valuation family indexed by the internal ordinal
`Ord` (`Ordinal.lean`). This is the closure flow re-indexed over a real transfinite
ordinal, replacing `ClosureFlowDynamics`'s `Nat`-time orbit. -/
def OrdFlow := Ord → Valuation

/-- A transfinite flow is **`≤ₖ`-monotone** when it ascends along the ordinal order:
`a ≤ b` (in `Ord.Le`) implies `w a ≤ₖ w b`. The settling-monotonicity law of
`settling-monotonicity.md`, now over the real ordinal index.

`Ord.Le` admits limits below `zero` (e.g. the all-`zero` fundamental sequence), across
which no non-constant ascending flow can be `≤ₖ`-monotone. `Monotone` is stated for all
of `Ord.Le`; the witness `tflowOf` is proved monotone only on the `ω+1` settling chain
(`tflowOf_monotone_chain` / `tflowOf_chain_le_omega`), not on degenerate sequences. -/
def Monotone (w : OrdFlow) : Prop := ∀ {a b : Ord}, Ord.Le a b → leK (w a) (w b)

/-- `w (Ord.limit f)` is the `≤ₖ`-least upper bound of `{w (f n)}`. -/
def ContinuousAt (w : OrdFlow) (f : Nat → Ord) : Prop :=
  (∀ n, leK (w (f n)) (w (Ord.limit f)))
  ∧ (∀ u : Valuation, (∀ n, leK (w (f n)) u) → leK (w (Ord.limit f)) u)

/-- A transfinite flow is continuous when it is `ContinuousAt` every fundamental
sequence. -/
def Continuous (w : OrdFlow) : Prop := ∀ f, ContinuousAt w f

/-- `w` is smooth at the limit of `f` when it is continuous there. -/
def SmoothAt (w : OrdFlow) (f : Nat → Ord) : Prop := ContinuousAt w f

/-- A non-Scott-continuous (NSC) firing at the limit of `f`: `ContinuousAt` fails. -/
def NSCFiringAt (w : OrdFlow) (f : Nat → Ord) : Prop := ¬ ContinuousAt w f

theorem smooth_not_nsc (w : OrdFlow) (f : Nat → Ord) :
    SmoothAt w f → ¬ NSCFiringAt w f :=
  fun h hf => hf h

/-- A `Continuous` flow has no NSC firing at any limit. -/
theorem continuous_no_nsc_firing (w : OrdFlow) (hw : Continuous w) :
    ∀ f, ¬ NSCFiringAt w f :=
  fun f hf => hf (hw f)

theorem no_nsc_firing_of_smooth (w : OrdFlow) (f : Nat → Ord) (h : SmoothAt w f) :
    ¬ NSCFiringAt w f :=
  smooth_not_nsc w f h

/-- `toNat : Ord → Nat`. `ofNat n ↦ n`; a successor adds one; a limit node returns `0`
(`tflowOf` never reads `toNat` at a limit). -/
def toNat : Ord → Nat
  | Ord.zero => 0
  | Ord.succ o => toNat o + 1
  | Ord.limit _ => 0

/-- `toNat (ofNat n) = n` — `toNat` inverts `ofNat` on the finite ordinals, so the flow
reads the right orbit stage at each finite ordinal. -/
theorem toNat_ofNat (n : Nat) : toNat (Ord.ofNat n) = n := by
  induction n with
  | zero => rfl
  | succ k ih => simp [Ord.ofNat, toNat, ih]

/-- The concrete **transfinite closure flow** from a seed valuation. At a finite
ordinal `o` it is the orbit stage `orbit M seed (toNat o)`; at a limit ordinal it is
the settled value `M.settle seed` (the `≤ₖ`-LUB the ascending orbit reaches). Defined
by structural recursion on `Ord`. -/
def tflowOf (seed : Valuation) : OrdFlow
  | Ord.zero => orbit M seed (toNat Ord.zero)
  | Ord.succ o => orbit M seed (toNat (Ord.succ o))
  | Ord.limit _ => M.settle seed

@[simp] theorem tflowOf_zero (seed : Valuation) :
    tflowOf M seed Ord.zero = orbit M seed 0 := rfl

@[simp] theorem tflowOf_succ (seed : Valuation) (o : Ord) :
    tflowOf M seed (Ord.succ o) = orbit M seed (toNat o + 1) := rfl

@[simp] theorem tflowOf_limit (seed : Valuation) (f : Nat → Ord) :
    tflowOf M seed (Ord.limit f) = M.settle seed := rfl

/-- The flow reads the orbit stage `n` at the finite ordinal `ofNat n`:
`tflowOf seed (ofNat n) = orbit M seed n`. -/
theorem tflowOf_ofNat (seed : Valuation) (n : Nat) :
    tflowOf M seed (Ord.ofNat n) = orbit M seed n := by
  cases n with
  | zero => rfl
  | succ k =>
    show orbit M seed (toNat (Ord.ofNat k) + 1) = orbit M seed (k + 1)
    rw [toNat_ofNat]

/-! ### Orbit-below-settled: every orbit stage sits `≤ₖ` the settled value

The settled value `M.settle seed = M.closureOp seed` is a fixed point, and the orbit
ascends toward it: each orbit stage is `≤ₖ`-below it. This is the upper-bound half of
the LUB at the limit. -/

/-- **Every orbit stage is `≤ₖ` the settled value.** `orbit M seed n ≤ₖ M.settle seed`.
The orbit ascends to the settled value (the least fixed point above the seed) and never
overshoots it. Proof by induction: stage `0` is the seed (`≤ₖ settle` by inflation),
and a closure step preserves `≤ₖ settle` (monotone + `settle` fixed). -/
theorem orbit_le_settle (seed : Valuation) (n : Nat) :
    leK (orbit M seed n) (M.settle seed) := by
  induction n with
  | zero =>
    show leK seed (M.settle seed)
    exact M.closureOp_infl seed
  | succ k ih =>
    rw [orbit_succ]
    have hmono := M.closureOp_mono ih
    rw [M.settle_fixed seed] at hmono
    exact hmono

/-- `orbit M seed 1 = M.settle seed` — the orbit reaches the settled value after a
single closure step (`settle = closureOp`, and one step is `closureOp seed`). -/
theorem orbit_one_eq_settle (seed : Valuation) :
    orbit M seed 1 = M.settle seed := rfl

/-! ### `tflowOf` is monotone over the real ordinal

The flow takes only two values: `seed` at `Ord.zero` and `M.settle seed` everywhere
else (every finite nonzero ordinal — since the orbit collapses to `settle seed` after
one closure step, by idempotence — and every limit). So along `Ord.Le` the value can
only ascend `seed ≤ₖ settle seed`. We prove monotonicity on the `ω+1`
settling chain. -/

/-- **Every value of `tflowOf` is `≤ₖ` the settled value.** -/
theorem tflowOf_le_settle (seed : Valuation) (o : Ord) :
    leK (tflowOf M seed o) (M.settle seed) := by
  cases o with
  | zero => exact orbit_le_settle M seed 0
  | succ o => exact orbit_le_settle M seed (toNat o + 1)
  | limit f => exact leK_refl _

/-- The seed sits `≤ₖ` below every value of `tflowOf`: `seed = orbit 0` is `≤ₖ` every
later orbit stage (`orbit_monotone`) and `≤ₖ` the settled value (`closureOp_infl`). -/
theorem seed_le_tflowOf (seed : Valuation) (o : Ord) :
    leK (orbit M seed 0) (tflowOf M seed o) := by
  cases o with
  | zero => exact leK_refl _
  | succ o => exact orbit_monotone M seed (Nat.zero_le _)
  | limit f =>
    show leK seed (M.settle seed)
    exact M.closureOp_infl seed

/-- `M.settle seed ≤ₖ tflowOf seed (succ o)` — every nonzero-finite value equals the
settled value, reached from `orbit 1 = settle seed` ascending. -/
theorem settle_le_tflowOf_succ (seed : Valuation) (o : Ord) :
    leK (M.settle seed) (tflowOf M seed (Ord.succ o)) := by
  have h1 : leK (orbit M seed 1) (orbit M seed (toNat o + 1)) :=
    orbit_monotone M seed (Nat.succ_le_succ (Nat.zero_le _))
  rw [orbit_one_eq_settle M seed] at h1
  exact h1

/-- **`tflowOf` is `≤ₖ`-monotone along the finite ordinal chain.** For finite
ordinals `ofNat m ≤ ofNat n` (i.e. `m ≤ n`), `tflowOf seed (ofNat m) ≤ₖ tflowOf seed
(ofNat n)` — the predecessor values are the orbit stages `orbit m`, `orbit n`, and the
orbit ascends in the knowledge order (`orbit_monotone`). This is the settling
chain `0 < 1 < 2 < …` over the real ordinal. -/
theorem tflowOf_monotone_chain (seed : Valuation) {m n : Nat} (h : m ≤ n) :
    leK (tflowOf M seed (Ord.ofNat m)) (tflowOf M seed (Ord.ofNat n)) := by
  rw [tflowOf_ofNat M seed m, tflowOf_ofNat M seed n]
  exact orbit_monotone M seed h

theorem tflowOf_chain_le_omega (seed : Valuation) (n : Nat) :
    leK (tflowOf M seed (Ord.ofNat n)) (tflowOf M seed (Ord.limit Ord.ofNat)) := by
  rw [tflowOf_ofNat M seed n, tflowOf_limit]
  exact orbit_le_settle M seed n

/-- `tflowOf` is continuous at any fundamental sequence that reaches the settled value,
via `Order.upperBound_of_reached_isLUB`. -/
theorem tflowOf_continuousAt_of_reaches (seed : Valuation) (f : Nat → Ord)
    (hreach : ∃ m, leK (M.settle seed) (tflowOf M seed (f m))) :
    ContinuousAt (tflowOf M seed) f := by
  obtain ⟨m, hm⟩ := hreach
  exact Order.upperBound_of_reached_isLUB leK (@leK_trans) (fun n => tflowOf M seed (f n))
    (M.settle seed) m (fun n => tflowOf_le_settle M seed (f n)) hm

/-- A fundamental sequence for `tflowOf` whose predecessors have already reached the
settled value. -/
def SettlingLimitSequence (seed : Valuation) (f : Nat → Ord) : Prop :=
  ∃ m, leK (M.settle seed) (tflowOf M seed (f m))
theorem tflowOf_continuousAt_settlingLimit (seed : Valuation) (f : Nat → Ord)
    (hf : SettlingLimitSequence M seed f) :
    ContinuousAt (tflowOf M seed) f :=
  tflowOf_continuousAt_of_reaches M seed f hf

/-- **No NSC firing at any settling limit sequence.** A limit presentation whose
predecessors reach the settled value is smooth: it has no non-Scott-continuous firing,
so the transfinite closure flow has no limit-stage blowup there. -/
theorem tflowOf_no_nsc_firing_settlingLimit (seed : Valuation) (f : Nat → Ord)
    (hf : SettlingLimitSequence M seed f) :
    ¬ NSCFiringAt (tflowOf M seed) f :=
  no_nsc_firing_of_smooth (tflowOf M seed) f
    (tflowOf_continuousAt_settlingLimit M seed f hf)

/-- **Settling-continuity at the canonical limit `ω`.** `tflowOf` is
continuous at the canonical fundamental sequence `ofNat` — i.e. at `ω = Ord.limit
ofNat`. The predecessor values are exactly the orbit stages `orbit M seed n`
(`tflowOf_ofNat`), and the value at `ω` is `settle seed = orbit M seed 1`, which is the
`≤ₖ`-LUB of the ascending orbit: an upper bound of every stage (`orbit_le_settle`) and
the least one (it appears at index `1`). This is `settling-continuity.md`'s
`v_μ = ⨆ₖ {v_σ : σ<μ}` over a transfinite ordinal. -/
theorem tflowOf_continuousAt_omega (seed : Valuation) :
    ContinuousAt (tflowOf M seed) Ord.ofNat := by
  apply tflowOf_continuousAt_of_reaches
  refine ⟨1, ?_⟩
  rw [tflowOf_ofNat M seed 1, orbit_one_eq_settle M seed]
  exact leK_refl _

/-- **No NSC firing at the canonical limit `ω`.** Since `tflowOf` is continuous
(smooth) at `ofNat`, there is no non-Scott-continuous firing at the limit
ordinal `ω` — the closure flow is smooth there (strict/Scott regime). -/
theorem tflowOf_no_nsc_firing_omega (seed : Valuation) :
    ¬ NSCFiringAt (tflowOf M seed) Ord.ofNat :=
  no_nsc_firing_of_smooth (tflowOf M seed) Ord.ofNat (tflowOf_continuousAt_omega M seed)

/-- **Global regularity for the settling closure flow.** At every settling limit
sequence, the transfinite closure flow is continuous and has no NSC firing; in
particular, the canonical limit `ω` has no NSC firing. This is the discrete
no-blowup theorem the finite closure orbit satisfies: every limit
presentation whose predecessors have actually settled satisfies the directed
`≤ₖ`-join law. -/
theorem transfinite_closure_flow_no_blowup (seed : Valuation) :
    (∀ f, SettlingLimitSequence M seed f → ContinuousAt (tflowOf M seed) f)
    ∧ (∀ f, SettlingLimitSequence M seed f → ¬ NSCFiringAt (tflowOf M seed) f)
    ∧ ¬ NSCFiringAt (tflowOf M seed) Ord.ofNat :=
  ⟨tflowOf_continuousAt_settlingLimit M seed,
   tflowOf_no_nsc_firing_settlingLimit M seed,
   tflowOf_no_nsc_firing_omega M seed⟩

/-! ## (5) The transfinite settling-continuity theorem -/

/-- **Transfinite settling-continuity over a real ordinal.** The concrete
closure flow `tflowOf M seed` is a `Ord`-indexed closure flow that bundles the
three facts retiring `ClosureFlowDynamics`'s `Nat`-only scoping:

* **(a) monotone along the `ω+1` settling chain** — `tflowOf` is `≤ₖ`-monotone
  along the real chain `0 < 1 < 2 < … < ω` over the ordinal: `m ≤ n →
  tflowOf (ofNat m) ≤ₖ tflowOf (ofNat n)` (`tflowOf_monotone_chain`) and every finite
  stage is `≤ₖ` the value at the limit `ω` (`tflowOf_chain_le_omega`). Climbing
  the transfinite chain only adds knowledge. (Full `∀ Ord.Le` monotonicity is *not*
  claimed — see the `Monotone` scope note: the Brouwer ordinal admits degenerate limits
  below `zero` at which no non-constant ascending flow is monotone.)
* **(b) settling-continuous at a limit** — at the canonical limit ordinal
  `ω = Ord.limit ofNat`, the value `tflowOf seed (limit ofNat) = M.settle seed` **is the
  `≤ₖ`-least upper bound** of its fundamental-sequence predecessors `{orbit M seed n}`:
  an upper bound of each (`∀ n, orbit n ≤ₖ settle`) and the least (`∀ u, (∀ n, orbit n
  ≤ₖ u) → settle ≤ₖ u`). This is `settling-continuity.md`'s `v_μ = ⨆ₖ {v_σ : σ<μ}` over
  a **real** transfinite ordinal — no longer `Nat`-scoped (`tflowOf_continuousAt_omega`).
* **(c) no NSC firing at the limit** — being smooth (continuous) at `ω`, the flow has
  **no non-Scott-continuous firing** at that limit (`tflowOf_no_nsc_firing_omega`):
  the strict/Scott (flat) regime. Generally, any `Continuous` flow has no NSC firing at
  any limit (`continuous_no_nsc_firing`).

This realizes settling-continuity at an **actual limit ordinal**, retiring
`ClosureFlowDynamics`'s "limit-ordinal continuity lives outside `Nat`" scoping: the
directed-join-at-limit law is now a theorem over the internal transfinite ordinal `Ord`.sound`. -/
theorem transfinite_settling_continuity (seed : Valuation) :
    ((∀ {m n : Nat}, m ≤ n →
        leK (tflowOf M seed (Ord.ofNat m)) (tflowOf M seed (Ord.ofNat n)))
      ∧ (∀ n, leK (tflowOf M seed (Ord.ofNat n)) (tflowOf M seed (Ord.limit Ord.ofNat))))
    ∧ ((∀ n, leK (tflowOf M seed (Ord.ofNat n)) (tflowOf M seed (Ord.limit Ord.ofNat)))
        ∧ (∀ u : Valuation,
            (∀ n, leK (tflowOf M seed (Ord.ofNat n)) u)
            → leK (tflowOf M seed (Ord.limit Ord.ofNat)) u))
    ∧ ¬ NSCFiringAt (tflowOf M seed) Ord.ofNat :=
  ⟨⟨fun h => tflowOf_monotone_chain M seed h, tflowOf_chain_le_omega M seed⟩,
   tflowOf_continuousAt_omega M seed,
   tflowOf_no_nsc_firing_omega M seed⟩

end ModalFrame
end Valuation
end Obsmetrologia
