/-
# Settling monotonicity, quiescence, and cosettling

This module formalizes three conjoined corpus nodes about the settling dynamics on
predication valuations, all under the *knowledge-least valuation* settling subtree:

* `…/settling/content/settling-monotonicity/settling-monotonicity.md` — a
  settle-indexed family `v = (v_σ)` is **≤ₖ-monotone**: `σ ≤ τ ⟹ v_σ(p) ≤ₖ v_τ(p)`.
  No information is retracted; conflicts accumulate to ⊤ₖ rather than trivializing.
  The canonical such family is the **closure orbit** of the modal settling operator
  `cl = □◇` (`ModalPairAdjunction.closureOp`): `orbit M seed n` iterates `cl` from
  the seed. We prove it ≤ₖ-monotone in `n` — each step inflationary + monotone.
* `…/settling/content/settling-quiescence/settling-quiescence.md` — a settling `v`
  is **quiescent at τ\*** iff `∀ τ ≥ τ*, v τ = v τ*`. For a closure orbit this is
  reaching the fixed point. The **headline** `settling_quiescent_is_algebra` is the
  Eilenberg–Moore reading: *quiescence ⟺ being a closure algebra*, i.e. a valuation
  is settled/quiescent iff it is a fixed point `cl v = v`; and the orbit is quiescent
  from step `k` iff `orbit k` is a fixed point. The settled valuation `settle seed`
  is quiescent (a fixed point, reusing `settle_fixed`) and the **least** such above
  the seed (reusing `settle_least`).
* `…/settling/content/cosettling/cosettling.md` — the **cosettling** `T⁻¹(w)` of a
  closure-stable `w` (`cl w = w`) is the set of one-step pre-images `{v : cl v = w}`.
  The **headline** `cosettling_join_subsemilattice` bundles the corpus's three
  structural facts: **Containment** (`Preimage w v → v ≤ₖ w`, by inflation),
  **Maximum** (`w ∈ T⁻¹(w)`, and `w` is the ≤ₖ-greatest pre-image), and **Closure
  under join** (`Preimage w v → Preimage w v' → Preimage w (v ∨ₖ v')`, pointwise
  `joinK`, via monotonicity + inflation + antisymmetry). Together: `T⁻¹(w)` is a
  finite join-subsemilattice with top of `[⊥, w]`. The corpus's further facts — *no
  minimum in general* and *not closed under meet* — are documented in prose (they are
  genuinely regime/example-dependent and not provable from the closure laws alone).
-/
import RelMath.ClosureOrdinalRegime
import RelMath.ClosureOperatorFiber
import RelMath.ModalPairAdjunction

namespace RelMath
namespace Valuation
namespace ModalFrame

open Charge

/-! ## Pointwise join helpers on the valuation knowledge order

The settle-indexed family lives in the pointwise knowledge order `leK`. We need two
elementary facts about the pointwise `joinK` to run the cosettling proof: it is an
upper bound of each side, and it is the least upper bound. Both lift the `Charge`
lattice laws (`le_joinK_left/right`, `joinK_le`) fiberwise. (Frame-independent.) -/

/-- `v ≤ₖ v ∨ₖ v'` — the pointwise join dominates its left argument. -/
theorem le_joinK_left (v v' : Valuation) : leK v (joinK v v') :=
  fun φ => Charge.le_joinK_left (v φ) (v' φ)

/-- `v' ≤ₖ v ∨ₖ v'` — the pointwise join dominates its right argument. -/
theorem le_joinK_right (v v' : Valuation) : leK v' (joinK v v') :=
  fun φ => Charge.le_joinK_right (v φ) (v' φ)

/-- `v ∨ₖ v'` is the **least** upper bound: if both sides sit below `w` then so does
the join. -/
theorem joinK_le {v v' w : Valuation} (h : leK v w) (h' : leK v' w) :
    leK (joinK v v') w :=
  fun φ => Charge.joinK_le (v φ) (v' φ) (w φ) (h φ) (h' φ)

variable (M : ModalFrame)

/-! ## (1) Settling monotonicity — the closure orbit is ≤ₖ-monotone

`settling-monotonicity.md`: a settle-indexed family `(v_σ)` over a settling bound is
≤ₖ-monotone in the settle index. The canonical such family is the **closure orbit**
of the modal settling operator `cl = □◇`. We define the orbit by `Nat.rec` and prove
it ≤ₖ-monotone in the step index: every step is inflationary (`closureOp_infl`), so
`orbit n ≤ₖ orbit (n+1)`, and transitivity gives `m ≤ n → orbit m ≤ₖ orbit n`. -/

/-- The **closure orbit** of the modal settling operator `cl = □◇` from a seed: the
settle-indexed family `orbit M seed n = clⁿ(seed)`. This is the canonical settling
whose monotonicity `settling-monotonicity.md` asserts. -/
def orbit (seed : Valuation) : Nat → Valuation
  | 0 => seed
  | n + 1 => M.closureOp (orbit seed n)

@[simp] theorem orbit_zero (seed : Valuation) : orbit M seed 0 = seed := rfl

@[simp] theorem orbit_succ (seed : Valuation) (n : Nat) :
    orbit M seed (n + 1) = M.closureOp (orbit M seed n) := rfl

/-- **One settling step ascends.** `orbit n ≤ₖ orbit (n+1)`: each closure step is
inflationary, so no information is retracted across a settling step. -/
theorem orbit_le_succ (seed : Valuation) (n : Nat) :
    leK (orbit M seed n) (orbit M seed (n + 1)) :=
  M.closureOp_infl (orbit M seed n)

/-- **Settling monotonicity (the closure orbit is ≤ₖ-monotone).** For `m ≤ n`, the
earlier valuation sits ≤ₖ-below the later one — `orbit m ≤ₖ orbit n`. Values grow in
the knowledge order over settle-time: no retraction; conflicts accumulate to ⊤ₖ. This
is `settling-monotonicity.md` for the canonical settling family. -/
theorem orbit_monotone (seed : Valuation) {m n : Nat} (h : m ≤ n) :
    leK (orbit M seed m) (orbit M seed n) := by
  induction n with
  | zero =>
    have : m = 0 := Nat.le_zero.1 h
    subst this; exact leK_refl _
  | succ k ih =>
    rcases Nat.lt_or_ge m (k + 1) with hlt | hge
    · exact leK_trans (ih (Nat.le_of_lt_succ hlt)) (orbit_le_succ M seed k)
    · have : m = k + 1 := Nat.le_antisymm h hge
      subst this; exact leK_refl _

/-! ## (2) Settling quiescence = closure algebra (Eilenberg–Moore)

`settling-quiescence.md`: `v` is quiescent at `τ*` iff `∀ τ ≥ τ*, v τ = v τ*`. For a
closure orbit this is reaching the fixed point. The Eilenberg–Moore reading: a
**closure algebra** for the modal closure is precisely a fixed point `cl v = v`
(`settle = fixed = algebra`). We make `Quiescent` mean exactly this, prove the orbit
becomes constant past `k` iff `orbit k` is a fixed point, and tie the settled
valuation to `settle_fixed` / `settle_least`. -/

/-- A valuation is **quiescent** (a closure *algebra* / Eilenberg–Moore object) when
the modal closure fixes it: `cl v = v`. The settled valuations are exactly these. -/
def Quiescent (v : Valuation) : Prop := M.closureOp v = v

/-- **Quiescence is being a fixed point** — definitional unfolding, recorded as the
algebra equation `cl v = v`. -/
theorem quiescent_iff_fixed (v : Valuation) : Quiescent M v ↔ M.closureOp v = v :=
  Iff.rfl

/-- If `orbit k` is a fixed point of `cl`, the orbit is **constant** from step `k`:
`orbit (k + n) = orbit k` for all `n`. (Forward direction of quiescence.) -/
theorem orbit_const_of_fixed (seed : Valuation) (k : Nat)
    (h : M.closureOp (orbit M seed k) = orbit M seed k) :
    ∀ n, orbit M seed (k + n) = orbit M seed k := by
  intro n
  induction n with
  | zero => rfl
  | succ m ih =>
    show M.closureOp (orbit M seed (k + m)) = orbit M seed k
    rw [ih, h]

/-- **Quiescence ⟺ closure algebra.** Two equivalent readings of the
corpus's quiescence at `τ*` for a closure orbit, both saying *settled = fixed =
Eilenberg–Moore algebra*:

* **simple form** — a valuation is quiescent iff it is a closure algebra
  (`Quiescent v ↔ cl v = v`);
* **orbit form** — the orbit is constant from step `k` (`∀ n, orbit (k+n) = orbit k`)
  iff `orbit k` is a fixed point (`cl (orbit k) = orbit k`).

The forward orbit direction is `orbit_const_of_fixed`; the converse reads off the
`n = 1` instance and `orbit_succ`. This is `settling-quiescence.md` identified with
the Eilenberg–Moore closure algebras. -/
theorem settling_quiescent_is_algebra (seed : Valuation) (k : Nat) :
    (∀ v : Valuation, Quiescent M v ↔ M.closureOp v = v)
    ∧ ((∀ n, orbit M seed (k + n) = orbit M seed k)
        ↔ M.closureOp (orbit M seed k) = orbit M seed k) := by
  refine ⟨fun v => Iff.rfl, ?_⟩
  constructor
  · intro h
    have h1 : orbit M seed (k + 1) = orbit M seed k := h 1
    rw [orbit_succ] at h1; exact h1
  · intro h n; exact orbit_const_of_fixed M seed k h n

/-- **The settled valuation is quiescent** — `settle seed` is a closure algebra /
fixed point, reusing `settle_fixed`. (Quiescence holds at the settled value.) -/
theorem settle_quiescent (seed : Valuation) : Quiescent M (M.settle seed) :=
  M.settle_fixed seed

/-- **The settled valuation is the least quiescent valuation above the seed.** Any
quiescent (= fixed) valuation `x ≥ₖ seed` lies above `settle seed` — reusing
`settle_least`. So `settle seed` is the *least* algebra above the seed. -/
theorem settle_least_quiescent (seed x : Valuation)
    (hsx : leK seed x) (hx : Quiescent M x) : leK (M.settle seed) x :=
  M.settle_least seed x hsx hx

/-! ## (3) Cosettling `T⁻¹(w)` — a finite join-subsemilattice with top

`cosettling.md`: for closure-stable `w` (`cl w = w`), the cosettling is the set of
one-step pre-images `T⁻¹(w) = {v : cl v = w}`. We prove the corpus's three structural
facts: Containment, Maximum, Closure under join — bundling them as "a finite
join-subsemilattice with top of `[⊥, w]`". -/

/-- The **cosettling** predicate: `v` is a one-step pre-image of `w` under the modal
closure, `cl v = w`. `T⁻¹(w) = {v : Preimage w v}`. -/
def Preimage (w v : Valuation) : Prop := M.closureOp v = w

/-- **Containment.** Every pre-image sits ≤ₖ-below `w`: `cl v = w` and `v ≤ₖ cl v`
(inflation) give `v ≤ₖ w`. So `T⁻¹(w) ⊆ [⊥, w]`. -/
theorem preimage_le (w v : Valuation) (h : Preimage M w v) : leK v w := by
  have := M.closureOp_infl v
  rw [h] at this; exact this

/-- **Maximum.** A closure-stable `w` (`cl w = w`) is itself a pre-image — `w ∈
T⁻¹(w)` — and it is the ≤ₖ-**greatest** pre-image (every pre-image is ≤ₖ `w` by
Containment). -/
theorem preimage_self_max (w : Valuation) (hw : M.closureOp w = w) :
    Preimage M w w ∧ ∀ v, Preimage M w v → leK v w :=
  ⟨hw, fun v hv => preimage_le M w v hv⟩

/-- **Closure under join.** If `v` and `v'` are pre-images of a closure-stable `w`,
so is their pointwise knowledge-join `v ∨ₖ v'`: `cl (v ∨ₖ v') = w`. Proof by
antisymmetry — `cl(v∨v') ≤ₖ cl w = w` (monotone, both sides ≤ₖ `w` so the join is,
`w` fixed) and `w = cl v ≤ₖ cl(v∨v')` (monotone, `v ≤ₖ v∨v'`). -/
theorem preimage_joinK (w : Valuation) (hw : M.closureOp w = w)
    {v v' : Valuation} (h : Preimage M w v) (h' : Preimage M w v') :
    Preimage M w (joinK v v') := by
  have hvw : leK v w := preimage_le M w v h
  have hv'w : leK v' w := preimage_le M w v' h'
  apply leK_antisymm
  · -- cl (v ∨ v') ≤ₖ cl w = w
    have hjw : leK (joinK v v') w := joinK_le hvw hv'w
    have := M.closureOp_mono hjw
    rw [hw] at this; exact this
  · -- w = cl v ≤ₖ cl (v ∨ v')
    have hle : leK v (joinK v v') := le_joinK_left v v'
    have := M.closureOp_mono hle
    rw [h] at this; exact this

/-- **Cosettling is a finite join-subsemilattice with top.** For a
closure-stable `w` (`cl w = w`), the cosettling `T⁻¹(w) = {v : cl v = w}` satisfies
the corpus's three structural facts bundled together:

* **(a) Containment** — `Preimage w v → v ≤ₖ w` (`T⁻¹(w) ⊆ [⊥, w]`);
* **(b) Maximum** — `w ∈ T⁻¹(w)` and `w` is the ≤ₖ-greatest pre-image (the **top**);
* **(c) Closed under join** — `Preimage w v → Preimage w v' → Preimage w (v ∨ₖ v')`
  (a **join-subsemilattice**).

Together: `T⁻¹(w)` is a finite join-subsemilattice with top of `[⊥, w]` — the
`cosettling.md` structure. (The corpus's further facts — *no minimum in general* and
*not closed under meet* — are genuinely example/regime-dependent: distinct minimal
pre-images are typically incomparable, and `v ∩ v'` need not be a pre-image, as in the
worked `T⁻¹(v₂) = {v₁, {(0,0),(2,2)}, v₂}` example. They are documented in prose, not
provable from the closure laws alone.) -/
theorem cosettling_join_subsemilattice (w : Valuation) (hw : M.closureOp w = w) :
    (∀ v, Preimage M w v → leK v w)
    ∧ (Preimage M w w ∧ ∀ v, Preimage M w v → leK v w)
    ∧ (∀ {v v' : Valuation}, Preimage M w v → Preimage M w v' →
        Preimage M w (joinK v v')) :=
  ⟨fun v hv => preimage_le M w v hv,
   preimage_self_max M w hw,
   fun h h' => preimage_joinK M w hw h h'⟩

end ModalFrame
end Valuation
end RelMath
