/-
# Blowup classification — the local data is a complete invariant

This module formalizes the corpus node

* `…/non-scott-continuous-firing-ordinal/firing-blowup/firing-blowup.md`
  §"The local data of a firing" and §"The local structural data is complete"

— the **blowup classification theorem**. `FiringBlowup` gave the blowup `Bl_μ` of a
firing as the pair `(predecessor, actual)` carrying the standing knowledge-increment
`predecessor ≤ₖ actual` (`predecessor_le_actual`). Here we extract the firing's three
pieces of **local combinatorial data** and prove they form a **complete invariant**: the
triple, together with the predecessor, reconstructs the actual value **cell-wise**, hence
determines the blowup up to isomorphism in `Arr(Val(C))`.

The three pieces (`firing-blowup.md`):

* **(1) incidence pattern** `π_μ` — the cells where the firing morphism is non-trivial
  (`predecessor φ ≠ actual φ`), the cells that acquire new value;
* **(2) firing-type function** `τ_μ` — for each incident cell, the kind of bilattice
  increment `∈ {T, F, ⊤}` read off the corpus increment table;
* **(3) consistency-failure pattern** `γ_μ` — for `⊤`-firings, the predecessor-side
  source `s = v^{→μ}(φ) ∈ {⊥, t, f}` that became `⊤`.

**The increment table** (`before = v^{→μ}(φ)`, `after = v_μ(φ)`; `after ≥ₖ before` always
by `predecessor_le_actual`):

| before | after | cell-wise type |
|--------|-------|----------------|
| ⊥ₖ     | t     | `tSide` (truth-side firing)            |
| ⊥ₖ     | f     | `fSide` (falsity-side firing)          |
| ⊥ₖ     | ⊤ₖ    | `top`   (full ⊤-firing)                |
| t      | ⊤ₖ    | `top`   (consistency failure, truth)   |
| f      | ⊤ₖ    | `top`   (consistency failure, falsity) |
| (no change)  | `none` (not in the incidence pattern)  |

Because the firing morphism always points **up** the knowledge order, only these five
increment cases (plus the diagonal `before = after`) arise — exactly the table. We prove
`cellType` is `none` **iff** the cell does not fire (`before = after`), and that
`reconstruct before (cellType before after) = after` for every ≤ₖ-pair. The keystone
`blowup_classified` then concludes: two blowups with the **same predecessor** and the
**same local data** have the **same actual value**, hence are equal blowups (isomorphic in
the arrow category).

As in `FiringBlowup`, the settling trajectory is modelled by the
Nat-indexed closure orbit (every stage a successor); the limit-ordinal / NSC sub-class is
documented there. The `Charge` carrier is the finite four-point FOUR, so the increment
table is a complete case analysis — there is nothing outside it. The consistency-failure
datum `γ_μ` is, for a `⊤`-firing, exactly `some (predecessor φ)`; it is bundled as the
third field of `LocalData` per the corpus, and is recoverable from the predecessor, so the
reconstruction needs only `before + type`.
-/
import RelMath.FiringBlowup
import RelMath.Four

namespace RelMath
namespace Blowup

open RelMath.Valuation
open RelMath.Valuation.ModalFrame

/-! ## (2) Cell-wise firing type

The firing morphism's increment at a cell is one of three kinds — truth-side, falsity-side,
or full `⊤` — or no increment at all. `FiringType` names the three kinds; `cellType`
reads the kind off the corpus increment table, returning `none` when the cell does not
fire (`before = after`). -/

/-- The three kinds of cell-wise bilattice increment a firing can produce
(`firing-blowup.md`, the increment table):

* `tSide` — truth-side firing `⊥ₖ → t`;
* `fSide` — falsity-side firing `⊥ₖ → f`;
* `top` — full `⊤`-firing `⊥ₖ → ⊤ₖ`, or a consistency failure `t → ⊤ₖ` / `f → ⊤ₖ`. -/
inductive FiringType
  | tSide
  | fSide
  | top
  deriving DecidableEq, Repr

/-- **The cell-wise firing type** `τ_μ(φ)` read off the corpus increment table. `before` is
the predecessor value `v^{→μ}(φ)`, `after` the actual value `v_μ(φ)`. Returns `none` when
the cell does not fire. Because `after ≥ₖ before` always (`predecessor_le_actual`), only
the table's increment cases and the diagonal arise; every other `before/after` pair (a
≤ₖ-*decrease* or an incomparable pair) is impossible at a real firing and is mapped to
`none` by the catch-all (it never occurs). -/
def cellType (before after : Charge) : Option FiringType :=
  match before, after with
  -- ⊥ₖ = potential, t = active, f = stable, ⊤ₖ = absurd
  | Corner.potential, Corner.active => some FiringType.tSide   -- ⊥ → t
  | Corner.potential, Corner.stable => some FiringType.fSide   -- ⊥ → f
  | Corner.potential, Corner.absurd => some FiringType.top     -- ⊥ → ⊤
  | Corner.active,    Corner.absurd => some FiringType.top     -- t → ⊤ (consistency failure)
  | Corner.stable,    Corner.absurd => some FiringType.top     -- f → ⊤ (consistency failure)
  | _,                _             => none                    -- no change / non-firing

/-- **`cellType` is `none` exactly on the non-firing cells.** For a genuine firing
increment (`before ≤ₖ after`, the standing direction), `cellType before after = none` iff
`before = after` — i.e. the cell is **not** in the incidence pattern. The hypothesis
`before ≤ₖ after` (always available cell-wise from `predecessor_le_actual`) rules out the
≤ₖ-decrease pairs, so the only `none` case is the diagonal. -/
theorem cellType_none_iff (before after : Charge)
    (h : Charge.leK before after = true) :
    cellType before after = none ↔ before = after := by
  constructor
  · intro hnone; revert hnone h; cases before <;> cases after <;> decide
  · intro heq; subst heq; cases before <;> rfl

/-- A non-firing cell (`before = after`) has `cellType = none` — the diagonal direction of
`cellType_none_iff`, needing no ≤ₖ hypothesis. -/
@[simp] theorem cellType_self (a : Charge) : cellType a a = none := by cases a <;> rfl

/-! ## Reconstruction — the firing type recovers the after-value

`reconstruct` rebuilds the actual value `v_μ(φ)` from the predecessor `before` and the
cell-wise firing type. This is the engine of completeness: the after-value is **determined**
by `before` and `τ_μ(φ)` alone. -/

/-- **Reconstruct the after-value** from the predecessor and the cell-wise firing type:

* `none` (no firing) ↦ `before` (the value is unchanged);
* `tSide` ↦ `t`  (`⊥ₖ → t`);
* `fSide` ↦ `f`  (`⊥ₖ → f`);
* `top`   ↦ `⊤ₖ` (`⊥ₖ/t/f → ⊤ₖ`).

For the three increment kinds the after-value is the *bound* the firing rises to — the
predecessor disappears from the data because the increment table is **deterministic** in
its result column. -/
def reconstruct (before : Charge) : Option FiringType → Charge
  | none                 => before
  | some FiringType.tSide => Charge.tTop
  | some FiringType.fSide => Charge.tBot
  | some FiringType.top   => Charge.kTop

/-- **Cell-wise completeness.** `reconstruct before (cellType before after) = after` for
every firing increment (`before ≤ₖ after`). The predecessor together with the cell-wise
firing type **reconstructs the actual value**. Proved by exhausting the finite `Charge`:
the ≤ₖ hypothesis kills the off-table pairs, and each of the five table rows reconstructs
its result column, while the diagonal rows reconstruct `before = after`. -/
theorem reconstruct_cellType (before after : Charge)
    (h : Charge.leK before after = true) :
    reconstruct before (cellType before after) = after := by
  cases before <;> cases after <;> revert h <;> decide

/-! ## (3) Consistency-failure source

For a `⊤`-firing the corpus records the predecessor-side source `s = v^{→μ}(φ)` that became
`⊤` (`⊥`, `t`, or `f`); for non-`⊤` firings the failure datum is empty. -/

/-- **The cell-wise consistency-failure source** `γ_μ(φ)`: when the firing type at `φ` is
`top`, the predecessor value `before` that became `⊤ₖ` (the source of the consistency
failure — `⊥` full firing, `t` falsity-acquired, `f` truth-acquired); otherwise `none`. -/
def cellFailure (before after : Charge) : Option Charge :=
  match cellType before after with
  | some FiringType.top => some before
  | _                   => none

/-- The consistency-failure source, when present, is exactly the predecessor value — so
`γ_μ` carries no information beyond the predecessor and the firing type. -/
theorem cellFailure_eq (before after : Charge)
    (h : cellType before after = some FiringType.top) :
    cellFailure before after = some before := by
  unfold cellFailure; rw [h]

/-! ## (1)+(2)+(3) The local data triple, bundled

`LocalData` bundles the three cell-wise functions — incidence `π`, firing type `τ`, and
consistency-failure source `γ` — over the whole predication base, exactly the corpus's
"local data of a firing". -/

/-- The **local data of a firing** `(π_μ, τ_μ, γ_μ)`, bundled over the predication base:

* `incidence φ` — does cell `φ` fire? (`π_μ`, a `Bool` per cell);
* `firingType φ` — the cell-wise firing type (`τ_μ`, `none` off the incidence pattern);
* `consistencyFailure φ` — the `⊤`-firing source (`γ_μ`, `none` for non-`⊤` cells). -/
structure LocalData where
  incidence : PredicationCell → Bool
  firingType : PredicationCell → Option FiringType
  consistencyFailure : PredicationCell → Option Charge

/-- **Extract the local data** of the firing at step `n` from its blowup
`(predecessor, actual)`:

* `incidence φ := decide (predecessor φ ≠ actual φ)` — the cells acquiring new value;
* `firingType φ := cellType (predecessor φ) (actual φ)` — the increment kind;
* `consistencyFailure φ := cellFailure (predecessor φ) (actual φ)` — the `⊤`-source. -/
def localData (M : ModalFrame) (seed : Valuation) (n : Nat) : LocalData where
  incidence φ := decide (predecessor M seed n φ ≠ actual M seed n φ)
  firingType φ := cellType (predecessor M seed n φ) (actual M seed n φ)
  consistencyFailure φ := cellFailure (predecessor M seed n φ) (actual M seed n φ)

/-! ## The incidence pattern is the firing's support

`π_μ φ = true` exactly when cell `φ` genuinely changes value; for a trivial firing it is
empty (`≡ false`) and the firing type is `none` everywhere — tying to
`blowup_trivial_iff_identity`. -/

/-- **Incidence detects change.** `π_μ φ = true ↔ predecessor φ ≠ actual φ` — the cell is in
the incidence pattern exactly when it acquires new value. -/
theorem incidence_iff (M : ModalFrame) (seed : Valuation) (n : Nat) (φ : PredicationCell) :
    (localData M seed n).incidence φ = true ↔ predecessor M seed n φ ≠ actual M seed n φ := by
  simp [localData]

/-- **The firing type is `none` exactly off the incidence pattern.** A cell carries a real
firing type iff it is incident — `τ_μ φ = none ↔ π_μ φ = false`. Uses the standing cell-wise
direction `predecessor φ ≤ₖ actual φ` from `predecessor_le_actual`. -/
theorem firingType_none_iff_not_incident
    (M : ModalFrame) (seed : Valuation) (n : Nat) (φ : PredicationCell) :
    (localData M seed n).firingType φ = none ↔ (localData M seed n).incidence φ = false := by
  have hle : Charge.leK (predecessor M seed n φ) (actual M seed n φ) = true :=
    predecessor_le_actual M seed n φ
  simp only [localData]
  rw [cellType_none_iff _ _ hle, decide_eq_false_iff_not]
  exact ⟨fun heq hne => hne heq, fun hnne => Decidable.byContradiction hnne⟩

/-! ## §"The local structural data is complete" — the classification theorem

The keystone. The local triple, together with the predecessor, reconstructs the actual
value **cell-wise**; hence two firings with the same predecessor and the same local data
have the same actual value — i.e. equal (isomorphic) blowups. This is the
`firing-blowup.md` claim that the local data is a **complete invariant**. -/

/-- **Cell-wise reconstruction of a real blowup.** For the firing at step `n`, the
predecessor and the firing type reconstruct the actual value at every cell:
`reconstruct (predecessor φ) (firingType φ) = actual φ`. Direct from `reconstruct_cellType`
with the standing cell-wise `predecessor φ ≤ₖ actual φ`. -/
theorem reconstruct_actual (M : ModalFrame) (seed : Valuation) (n : Nat)
    (φ : PredicationCell) :
    reconstruct (predecessor M seed n φ) ((localData M seed n).firingType φ)
      = actual M seed n φ := by
  simp only [localData]
  exact reconstruct_cellType _ _ (predecessor_le_actual M seed n φ)

/-- **`blowup_classified`.** *The local structural data is complete* — the local
triple `(π_μ, τ_μ, γ_μ)` is a **complete invariant** of the blowup. Concretely: two firings
(in possibly different settlings `M₁,seed₁` and `M₂,seed₂`, at steps `n₁,n₂`) whose blowups
have

* the **same predecessor** cell-wise (`predecessor₁ = predecessor₂` as valuations), and
* the **same local data** — it suffices that the firing-type functions agree cell-wise
  (`τ_μ¹ = τ_μ²`),

have the **same actual value** (`actual₁ = actual₂` as valuations), hence the **same blowup
pair** `Blowup₁ = Blowup₂` — isomorphic in `Arr(Val(C))`, the model singularity is the
same. The proof reconstructs each actual value from its predecessor and firing type
(`reconstruct_actual`), then transports along the two hypotheses by function extensionality.

The incidence pattern `π_μ` and the consistency-failure pattern `γ_μ` are determined by the
same data (`firingType_none_iff_not_incident`, `cellFailure_eq`): `π_μ` is where `τ_μ ≠
none`, and `γ_μ` is `some predecessor` exactly where `τ_μ = top`. So the firing-type
function over the shared predecessor carries the whole triple, and the triple reconstructs
the blowup — completeness. -/
theorem blowup_classified
    (M₁ : ModalFrame) (seed₁ : Valuation) (n₁ : Nat)
    (M₂ : ModalFrame) (seed₂ : Valuation) (n₂ : Nat)
    (hpred : predecessor M₁ seed₁ n₁ = predecessor M₂ seed₂ n₂)
    (htype : (localData M₁ seed₁ n₁).firingType = (localData M₂ seed₂ n₂).firingType) :
    actual M₁ seed₁ n₁ = actual M₂ seed₂ n₂
    ∧ Blowup M₁ seed₁ n₁ = Blowup M₂ seed₂ n₂ := by
  have hact : actual M₁ seed₁ n₁ = actual M₂ seed₂ n₂ := by
    funext φ
    rw [← reconstruct_actual M₁ seed₁ n₁ φ, ← reconstruct_actual M₂ seed₂ n₂ φ]
    rw [congrFun hpred φ, congrFun htype φ]
  refine ⟨hact, ?_⟩
  unfold Blowup
  rw [hpred, hact]

/-! ## (4) Model singularity

A **model singularity** is an isomorphism class of *non-trivial* firing blowups
(`firing-blowup.md` §"Model singularity"). We read it as `NonTrivialFiring` (the blowup is
non-identity), and — by `blowup_classified` — two such are the *same* singularity exactly
when they share predecessor and local data. A trivial firing has **empty incidence**
(`π_μ ≡ false`) and **`none` firing type everywhere**, so it carries the zero singularity —
tying to `blowup_trivial_iff_identity`. -/

/-- **A model singularity**: a *non-trivial* firing blowup (the corpus's non-identity
morphism whose source and target differ by a pattern of ≤ₖ-increments). An isomorphism class
of these is a singularity *type*; by `blowup_classified` two are the same class exactly when
they share predecessor and local data. -/
def IsModelSingularity (M : ModalFrame) (seed : Valuation) (n : Nat) : Prop :=
  NonTrivialFiring M seed n

/-- **A trivial firing carries the empty incidence pattern.** `π_μ ≡ false`: no cell
acquires new value, because `actual = predecessor` (the no-op stage). Ties to
`blowup_trivial_iff_identity`. -/
theorem trivial_incidence_empty (M : ModalFrame) (seed : Valuation) (n : Nat)
    (h : TrivialFiring M seed n) (φ : PredicationCell) :
    (localData M seed n).incidence φ = false := by
  have heq : actual M seed n = predecessor M seed n := h
  simp [localData, congrFun heq φ]

/-- **A trivial firing has `none` firing type at every cell.** Off-the-incidence-pattern
everywhere — there is no bilattice increment, since `actual = predecessor`. This is the
local-data reading of a no-op firing: the zero singularity. -/
theorem trivial_firingType_none (M : ModalFrame) (seed : Valuation) (n : Nat)
    (h : TrivialFiring M seed n) (φ : PredicationCell) :
    (localData M seed n).firingType φ = none := by
  have heq : actual M seed n = predecessor M seed n := h
  simp only [localData]
  rw [congrFun heq φ]
  exact cellType_self _

/-- **A model singularity is genuinely non-trivial** — its blowup is non-identity (some
cell is incident). The defining property unfolded, restated against `Blowup`: a model
singularity's blowup pair is *not* the diagonal. (Mirror of `trivial_incidence_empty`: a
trivial firing is *not* a model singularity.) -/
theorem modelSingularity_nonIdentity (M : ModalFrame) (seed : Valuation) (n : Nat)
    (h : IsModelSingularity M seed n) :
    Blowup M seed n ≠ (predecessor M seed n, predecessor M seed n) :=
  nonTrivial_blowup_nonIdentity M seed n h

end Blowup
end RelMath
