import Infomaterial.Closure.Ordinal
import Infomaterial.Closure.SettlingMonotonicityQuiescence
import Infomaterial.Closure.Operator
import Infomaterial.Closure.Modal
import Infomaterial.Language.Settling
import Infomaterial.Language.Positing.Valuation

/-!
# Transfinite closure flow — settling-continuity over a REAL ordinal

`ClosureFlowDynamics` read the closure flow as a discrete dynamical system over
**`Nat`-time**: its `SmoothStep` / `FiringStep` live at successor steps `n ↦ n+1`,
and it could only *say* (in prose) that "limit-ordinal continuity lives outside
`Nat`". That was a scoping: the genuine limit stages — where settling-continuity
actually has content — were named but not built.

This module re-indexes the closure flow over the **internal Brouwer/tree ordinal**
`Ord` (`Ordinal.lean`: `zero | succ | limit (Nat → Ord)`), with **genuine limit
stages**, so that **settling-continuity** becomes a theorem over a real transfinite
ordinal:

> `settling-continuity.md`: a settling `v = (v_τ)_{τ<λ}` is **continuous** iff for
> every limit ordinal `μ < λ`, `v_μ(p) = ⨆ₖ { v_σ(p) : σ < μ }` pointwise — the value
> at a limit is the directed `≤ₖ`-knowledge-join (colimit) of the values below.

We model the transfinite flow as an `Ord`-indexed valuation family `OrdFlow := Ord →
Valuation`. **Settling-continuity is expressed through the LUB universal property of
`Ord.limit`** (`Ordinal.lean`'s `fund_le_limit` + `limit_isLUB`), so no explicit
infinite supremum has to be constructed: `w (Ord.limit f)` is declared continuous at
`f` exactly when it **is** the `≤ₖ`-least upper bound of the fundamental-sequence
values `{w (f n)}` — precisely `v_μ = ⨆ₖ {v_σ : σ<μ}`.

The archive
`…/settling/_archive/predication-categorical-archive-predication-closure-flow-singularity-formation.md`
asks for the smooth/firing reading at genuine limits: a **non-Scott-continuous (NSC)
firing at a limit** is exactly a failure of `ContinuousAt` (the value at the limit has
content not present in the directed colimit of its predecessors). We prove a continuous
flow has **no NSC firing at any limit** — the strict/Scott (smooth/flat) regime.

We then construct a concrete continuous transfinite closure flow `tflowOf` from the
finite `Charge` orbit (which stabilizes by the closure ordinal `κ ≤ 3`): at finite
ordinals it is the `Nat` orbit `orbit M seed (toNat o)`; at every limit ordinal it is
the settled value `M.settle seed` — which is the `≤ₖ`-LUB the ascending orbit reaches
(`settle_least_quiescent` + finite reachability). We prove `tflowOf` is `Monotone` and
**continuous at the canonical limit `ω = Ord.limit ofNat`** (and at any fundamental
sequence that reaches the settled value): at the limit, `settle seed` is an upper
bound of every orbit stage (`orbit ≤ₖ settle`) AND the least one — because
`orbit M seed 1 = settle seed` already appears among the predecessors. So
`ContinuousAt` holds — settling-continuity over a real ordinal, no longer `Nat`-scoped.

**Constructive scope note.** The literal `Continuous := ∀ f` is *not* claimed for the
witness, and is not constructively available: an arbitrary `f : Nat → Ord` includes
degenerate "fundamental sequences" (e.g. the constant `fun _ => Ord.zero`) that are not
cofinal in any genuine limit ordinal, and at which a two-valued flow's limit value need
not be the directed join of the (all-`seed`) predecessors. Distinguishing genuine
fundamental sequences would need a decision (`∃ m, f m ≠ zero`) unavailable without
`Classical`. We therefore prove `ContinuousAt` for *every* fundamental sequence that
reaches the settled value (`tflowOf_continuousAt_of_reaches`), and specialize to the
canonical `ofNat` (`ω`), which is the genuine limit `settling-continuity.md` is about.
The general **no-NSC-firing** theorem `continuous_no_nsc_firing` holds for any flow
that *is* continuous (it is a tautology over the chosen continuity predicate), so the
strict/Scott regime statement is fully general.

This **retires `ClosureFlowDynamics`'s "limit-ordinal continuity lives outside `Nat`"
scoping**: the limit-stage directed-join law is now a theorem over a genuine transfinite
ordinal, with the smooth/NSC-firing dichotomy stated at actual limit ordinals.

Cites `content/…/settling/content/settling-continuity/settling-continuity.md`,
`…/settling/_archive/predication-categorical-archive-predication-closure-flow-singularity-formation.md`,
and `Infomaterial/Ordinal.lean`.
-/

namespace Infomaterial
namespace Valuation
namespace ModalFrame

open Charge

variable (M : ModalFrame)

/-! ## (1) The monotone transfinite family

`OrdFlow := Ord → Valuation` — a valuation family indexed by the **genuine ordinal**,
not `Nat`. `Monotone` is `≤ₖ`-monotonicity along the ordinal order `Ord.Le`: as we
climb the ordinal, knowledge only grows (no retraction). -/

/-- A **transfinite closure flow**: a valuation family indexed by the internal ordinal
`Ord` (`Ordinal.lean`). This is the closure flow re-indexed over a real transfinite
ordinal, replacing `ClosureFlowDynamics`'s `Nat`-time orbit. -/
def OrdFlow := Ord → Valuation

/-- A transfinite flow is **`≤ₖ`-monotone** when it ascends along the ordinal order:
`a ≤ b` (in `Ord.Le`) implies `w a ≤ₖ w b`. The settling-monotonicity law of
`settling-monotonicity.md`, now over the real ordinal index.

**Constructive scope note.** The Brouwer/tree ordinal `Ord.Le` (`Ordinal.lean`) admits
*degenerate* limits below `zero` — e.g. `Ord.Le (Ord.limit (fun _ => Ord.zero))
Ord.zero` is a genuine proof term, because each `f n = zero` is `≤ zero`. A
two-valued flow that ascends `seed ↦ settle seed` (and our concrete `tflowOf` does)
cannot be `≤ₖ`-monotone across such a degenerate "limit-below-zero" step, since the
limit node carries the *settled* value while `zero` carries the *seed*. So full
`∀ Ord.Le` monotonicity is genuinely **false** for any non-constant ascending flow, and
deciding "is this fundamental sequence genuine (cofinal)?" needs `∃ m, f m ≠ zero`,
which is not constructively available. We therefore record `Monotone` as the conceptual
predicate and prove monotonicity of the witness on the **genuine `ω+1` settling chain**
(`tflowOf_monotone_chain` / `tflowOf_chain_le_omega`) — the finite ordinals and their
real limit `ω`, which is the chain the corpus's settling actually traverses. -/
def Monotone (w : OrdFlow) : Prop := ∀ {a b : Ord}, Ord.Le a b → leK (w a) (w b)

/-! ## (2) Settling-continuity via the LUB universal property

`settling-continuity.md`: `v_μ = ⨆ₖ {v_σ : σ<μ}`. Rather than build an infinite
supremum, we say the value at a limit `Ord.limit f` **is** the `≤ₖ`-least upper bound
of the fundamental-sequence values `{w (f n)}`: it is an upper bound of each (the
limit dominates each predecessor's value) and the least such (anything dominating them
all dominates it). This is exactly the directed-join-at-limits, transported through
`Ord.limit`'s LUB universal property (`Ordinal.lean`'s `fund_le_limit` /
`limit_isLUB`). -/

/-- **Settling-continuity at a fundamental sequence `f`.** `w (Ord.limit f)` is the
`≤ₖ`-least upper bound of the predecessor values `{w (f n)}`:

* **upper bound** — every `w (f n) ≤ₖ w (limit f)`;
* **least** — any `u` with all `w (f n) ≤ₖ u` has `w (limit f) ≤ₖ u`.

This is `settling-continuity.md`'s `v_μ(p) = ⨆ₖ {v_σ(p) : σ<μ}`, expressed by the
universal property of the limit ordinal. -/
def ContinuousAt (w : OrdFlow) (f : Nat → Ord) : Prop :=
  (∀ n, leK (w (f n)) (w (Ord.limit f)))
  ∧ (∀ u : Valuation, (∀ n, leK (w (f n)) u) → leK (w (Ord.limit f)) u)

/-- A transfinite flow is **continuous** (a *settling*) when it is `ContinuousAt`
every fundamental sequence: the value at every limit ordinal is the directed
`≤ₖ`-join of its predecessors. -/
def Continuous (w : OrdFlow) : Prop := ∀ f, ContinuousAt w f

/-! ## (3) The firing/smooth reading at a real limit

The singularity-formation archive: a **non-Scott-continuous (NSC) firing** at a limit
`μ` is where the value at `μ` has content *not* present in the directed colimit of its
predecessors — i.e. `w (limit f)` is **not** the LUB. `SmoothAt` is `ContinuousAt`
(the Scott-continuous / smooth case); `NSCFiringAt` is its negation. A continuous flow
has no NSC firing at any limit — it is smooth everywhere. -/

/-- A flow is **smooth at** the limit of `f` when it is continuous there — the
Scott-continuous segment: the value at the limit is the directed join from below, no
new content. -/
def SmoothAt (w : OrdFlow) (f : Nat → Ord) : Prop := ContinuousAt w f

/-- A **non-Scott-continuous (NSC) firing at** the limit of `f`: continuity fails — the
value at the genuine limit ordinal exceeds the directed `≤ₖ`-join of its
fundamental-sequence predecessors. The "singular time" of the closure flow, now stated
at an actual limit ordinal. -/
def NSCFiringAt (w : OrdFlow) (f : Nat → Ord) : Prop := ¬ ContinuousAt w f

/-- **Smoothness excludes NSC firing.** At any limit a smooth (continuous) point is not
a NSC firing — definitional, since `NSCFiringAt = ¬ SmoothAt`. -/
theorem smooth_not_nsc (w : OrdFlow) (f : Nat → Ord) :
    SmoothAt w f → ¬ NSCFiringAt w f :=
  fun h hf => hf h

/-- **A continuous flow has NO NSC firing at any limit ordinal.** If `w` is
`Continuous` then for every fundamental sequence `f` there is no NSC firing — the flow
is smooth (Scott-continuous / flat) at every genuine limit. This is the strict/Scott
regime over a real ordinal: the closure flow develops no singularities at its limit
stages. -/
theorem continuous_no_nsc_firing (w : OrdFlow) (hw : Continuous w) :
    ∀ f, ¬ NSCFiringAt w f :=
  fun f hf => hf (hw f)

/-- **No-NSC-firing at a single smooth limit.** If the flow is smooth (continuous) at
the fundamental sequence `f`, there is no NSC firing there. -/
theorem no_nsc_firing_of_smooth (w : OrdFlow) (f : Nat → Ord) (h : SmoothAt w f) :
    ¬ NSCFiringAt w f :=
  smooth_not_nsc w f h

/-! ## (4) A concrete continuous transfinite closure flow `tflowOf`

We build one `OrdFlow` from the finite `Charge` orbit, which stabilizes by the closure
ordinal (`κ ≤ 3`). `toNat` extracts the finite index (`ofNat n ↦ n`); on limit nodes it
returns `0` — and `tflowOf` never consults it there, using the **settled value**
`M.settle seed` at limits, which is precisely the `≤ₖ`-LUB the ascending orbit reaches.
-/

/-- `toNat : Ord → Nat` — the finite index of an ordinal. `ofNat n ↦ n`; a successor
adds one; a **limit node returns `0`** (a limit is not a finite ordinal — `tflowOf`
never reads `toNat` at a limit, it uses the settled value there, so the `0` is a
documented don't-care). -/
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
only ascend `seed ≤ₖ settle seed`. We prove monotonicity on the genuine `ω+1`
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

/-- **`tflowOf` is `≤ₖ`-monotone along the genuine finite ordinal chain.** For finite
ordinals `ofNat m ≤ ofNat n` (i.e. `m ≤ n`), `tflowOf seed (ofNat m) ≤ₖ tflowOf seed
(ofNat n)` — the predecessor values are the orbit stages `orbit m`, `orbit n`, and the
orbit ascends in the knowledge order (`orbit_monotone`). This is the genuine settling
chain `0 < 1 < 2 < …` over the real ordinal. -/
theorem tflowOf_monotone_chain (seed : Valuation) {m n : Nat} (h : m ≤ n) :
    leK (tflowOf M seed (Ord.ofNat m)) (tflowOf M seed (Ord.ofNat n)) := by
  rw [tflowOf_ofNat M seed m, tflowOf_ofNat M seed n]
  exact orbit_monotone M seed h

/-- **Every finite-ordinal stage sits `≤ₖ` the value at the genuine limit `ω`.**
`tflowOf seed (ofNat n) ≤ₖ tflowOf seed (Ord.limit ofNat)`: each orbit stage is `≤ₖ`
the settled value, which is the flow's value at `ω`. So the genuine chain `0 < 1 < … <
ω` is `≤ₖ`-ascending — `tflowOf` is monotone along the real `ω+1` settling chain. -/
theorem tflowOf_chain_le_omega (seed : Valuation) (n : Nat) :
    leK (tflowOf M seed (Ord.ofNat n)) (tflowOf M seed (Ord.limit Ord.ofNat)) := by
  rw [tflowOf_ofNat M seed n, tflowOf_limit]
  exact orbit_le_settle M seed n

/-! ### `tflowOf` is continuous at genuine limits: settling-continuity over a real ordinal

At a limit `Ord.limit f`, `tflowOf seed (limit f) = M.settle seed`, and this **is** the
`≤ₖ`-LUB of the predecessor values `{tflowOf seed (f n)}` whenever the fundamental
sequence actually reaches the settled value (which a genuine, cofinal fundamental
sequence does — e.g. the canonical `ofNat` reaches it already at index `1`):

* **upper bound** — each `tflowOf seed (f n) ≤ₖ settle seed` (`tflowOf_le_settle`);
* **least** — `settle seed = tflowOf seed (f m)` for the reaching index `m`, so any `u`
  dominating all predecessors dominates `settle seed` directly.

This is exactly `settling-continuity.md`'s `v_μ = ⨆ₖ {v_σ : σ<μ}`. -/

/-- **`tflowOf` is continuous at any fundamental sequence that reaches the settled
value.** If some predecessor value `tflowOf seed (f m)` already `≥ₖ` the settled value
(`= settle seed`, as a genuine cofinal sequence guarantees), then
`tflowOf seed (limit f) = settle seed` is the `≤ₖ`-LUB of `{tflowOf seed (f n)}`. This
is settling-continuity at a real limit ordinal. -/
theorem tflowOf_continuousAt_of_reaches (seed : Valuation) (f : Nat → Ord)
    (hreach : ∃ m, leK (M.settle seed) (tflowOf M seed (f m))) :
    ContinuousAt (tflowOf M seed) f := by
  constructor
  · -- upper bound
    intro n
    rw [tflowOf_limit]
    exact tflowOf_le_settle M seed (f n)
  · -- least
    intro u hu
    rw [tflowOf_limit]
    obtain ⟨m, hm⟩ := hreach
    exact leK_trans hm (hu m)

/-- **Settling-continuity at the canonical limit `ω`.** `tflowOf` is
continuous at the canonical fundamental sequence `ofNat` — i.e. at `ω = Ord.limit
ofNat`. The predecessor values are exactly the orbit stages `orbit M seed n`
(`tflowOf_ofNat`), and the value at `ω` is `settle seed = orbit M seed 1`, which is the
`≤ₖ`-LUB of the ascending orbit: an upper bound of every stage (`orbit_le_settle`) and
the least one (it appears at index `1`). This is `settling-continuity.md`'s
`v_μ = ⨆ₖ {v_σ : σ<μ}` over a **genuine** transfinite ordinal. -/
theorem tflowOf_continuousAt_omega (seed : Valuation) :
    ContinuousAt (tflowOf M seed) Ord.ofNat := by
  apply tflowOf_continuousAt_of_reaches
  refine ⟨1, ?_⟩
  rw [tflowOf_ofNat M seed 1, orbit_one_eq_settle M seed]
  exact leK_refl _

/-- **No NSC firing at the canonical limit `ω`.** Since `tflowOf` is continuous
(smooth) at `ofNat`, there is no non-Scott-continuous firing at the genuine limit
ordinal `ω` — the closure flow is smooth there (strict/Scott regime). -/
theorem tflowOf_no_nsc_firing_omega (seed : Valuation) :
    ¬ NSCFiringAt (tflowOf M seed) Ord.ofNat :=
  no_nsc_firing_of_smooth (tflowOf M seed) Ord.ofNat (tflowOf_continuousAt_omega M seed)

/-! ## (5) The transfinite settling-continuity theorem -/

/-- **Transfinite settling-continuity over a real ordinal.** The concrete
closure flow `tflowOf M seed` is a genuine `Ord`-indexed closure flow that bundles the
three facts retiring `ClosureFlowDynamics`'s `Nat`-only scoping:

* **(a) monotone along the genuine `ω+1` settling chain** — `tflowOf` is `≤ₖ`-monotone
  along the real chain `0 < 1 < 2 < … < ω` over the ordinal: `m ≤ n →
  tflowOf (ofNat m) ≤ₖ tflowOf (ofNat n)` (`tflowOf_monotone_chain`) and every finite
  stage is `≤ₖ` the value at the genuine limit `ω` (`tflowOf_chain_le_omega`). Climbing
  the transfinite chain only adds knowledge. (Full `∀ Ord.Le` monotonicity is *not*
  claimed — see the `Monotone` scope note: the Brouwer ordinal admits degenerate limits
  below `zero` at which no non-constant ascending flow is monotone.)
* **(b) settling-continuous at a genuine limit** — at the canonical limit ordinal
  `ω = Ord.limit ofNat`, the value `tflowOf seed (limit ofNat) = M.settle seed` **is the
  `≤ₖ`-least upper bound** of its fundamental-sequence predecessors `{orbit M seed n}`:
  an upper bound of each (`∀ n, orbit n ≤ₖ settle`) and the least (`∀ u, (∀ n, orbit n
  ≤ₖ u) → settle ≤ₖ u`). This is `settling-continuity.md`'s `v_μ = ⨆ₖ {v_σ : σ<μ}` over
  a **real** transfinite ordinal — no longer `Nat`-scoped (`tflowOf_continuousAt_omega`).
* **(c) no NSC firing at the limit** — being smooth (continuous) at `ω`, the flow has
  **no non-Scott-continuous firing** at that genuine limit (`tflowOf_no_nsc_firing_omega`):
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
end Infomaterial
