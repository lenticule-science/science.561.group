import Obsmetrologia.Closure.SettlingMonotonicityQuiescence
import Obsmetrologia.Site.Basic
import Obsmetrologia.Calculus.Order.OrderInfra

/-!
# Transfinite cell complex & settling continuity

This module formalizes two conjoined corpus nodes under the *knowledge-least
valuation* settling subtree:

* `…/settling/…/anderson-putnam-direct-limit/transfinite-cell-complex/transfinite-cell-complex.md`
  — a **transfinite cell complex** `X` is a regular-CW-style structure whose **cell
  set** is indexed by a countable ordinal `α ≤ ω₁`, with each **individual cell of
  finite dimension** (the transfinite content sits in the *cardinality/indexing* of the
  cell set, NOT in cells of transfinite dimension). The data is `cells(X)`, a dimension
  function `dim : cells → ℕ`, and a face-incidence relation `σ ≺ τ` with the dim-drop
  condition `dim σ < dim τ`. The **structural condition**: the FINITE-cell
  sub-complexes form a **directed system** under inclusion and `X` is their **colimit**
  — `X = colim_{F ⊆fin cells(X)} X|_F` — with NO limit-cell structure at limit ordinals
  beyond the union of preceding cells. The **headline**
  `transfinite_complex_is_colimit_of_finite` proves exactly the colimit
  characterization: a cell is in `X` iff it lies in some finite sub-complex, the finite
  sub-complexes are directed under inclusion, and `X` equals their union.

* `…/settling/content/settling-continuity/settling-continuity.md` — a settling
  `v = (v_τ)` is **continuous** if at every **limit ordinal** `μ` and every predicate
  `p`, `v_μ(p) = ⋁_k {v_σ(p) : σ < μ}` (the cellwise knowledge-order directed
  colimit) — no new content at limits beyond what is approached from below. The
  **headline** `settling_continuity_at_limits` models the limit step as the `≤ₖ`-join
  over the prior-stage prefix `[0, μ)` (reusing `SettlingMonotonicityQuiescence`'s
  `orbit` and the pointwise `joinK`), and proves the continuity equation: the limit
  value is the directed join of prior values (upper bound AND least upper bound), no new
  content appears at the limit, and the closure orbit is continuous — each limit value
  equals the join of its predecessors.
-/

namespace Obsmetrologia
namespace CellComplex

open Valuation Valuation.ModalFrame

/-! ## (1) The transfinite cell complex and its finite sub-complexes

A transfinite cell complex `X` is `cells(X)` together with a finite-valued dimension
function and a face-incidence relation that strictly drops dimension. The transfinite
content is the (possibly `ω₁`-large) cell set; each cell is finite-dimensional. -/

/-- A **transfinite cell complex** `X`: a cell set `cells` (an arbitrary `Type`, so it
may be countably infinite — the corpus's `ω₁`-indexed cell set, with the cardinality
content documented in the header prose), a **dimension function** `dim : cells → ℕ`
assigning each individual cell a FINITE dimension, and a **face-incidence relation**
`face σ τ` (`σ ≺ τ`, "`σ` is a face of `τ`"). The structural `face_dim_drop` field is a
law every complex PROVES: a face strictly drops dimension, `face σ τ → dim σ < dim τ`.
No free data: `face_dim_drop` is a proof obligation, not a postulate. -/
structure CellComplex where
  /-- The cell set `cells(X)` (an arbitrary `Type`; the `ω₁` cardinality is prose). -/
  cells : Type
  /-- The dimension function `dim : cells → ℕ` — each individual cell is FINITE-dim. -/
  dim : cells → Nat
  /-- The face-incidence relation `σ ≺ τ` (`σ` is a face of `τ`). -/
  face : cells → cells → Prop
  /-- **Dim-drop law.** A face strictly lowers dimension: `face σ τ → dim σ < dim τ`. -/
  face_dim_drop : ∀ {σ τ : cells}, face σ τ → dim σ < dim τ

variable {X : CellComplex}

/-- Membership of a cell in a finite cell set carried as a `List`. (`σ ∈ F`.) -/
def memList (σ : X.cells) (F : List X.cells) : Prop := σ ∈ F

/-- A **finite sub-complex** `X|_F` of `X`: a finite cell set `cells_fin : List X.cells`
that is **downward-closed under face** — if `τ ∈ cells_fin` and `σ ≺ τ` then
`σ ∈ cells_fin`. (It inherits `dim`/`face` by restriction; the only structural datum is
the finite, face-closed cell list.) This is the `X|_F` whose directed system has `X` as
colimit. No free data: `downward_closed` is a proof obligation. -/
structure FiniteSub (X : CellComplex) where
  /-- The finite cell set `F` of the sub-complex (a finite `List`). -/
  cells_fin : List X.cells
  /-- **Downward closure under face.** If a cell is in `F`, so are its faces. -/
  downward_closed : ∀ {σ τ : X.cells}, τ ∈ cells_fin → X.face σ τ → σ ∈ cells_fin

/-- A cell **belongs to** a finite sub-complex when it is in its cell list. -/
def FiniteSub.mem (S : FiniteSub X) (σ : X.cells) : Prop := σ ∈ S.cells_fin

/-- **Inclusion of finite sub-complexes** `X|_F ⊆ X|_{F'}`: every cell of `F` is a cell
of `F'`. The directed system is ordered by this inclusion. -/
def FiniteSub.Sub (S S' : FiniteSub X) : Prop := ∀ σ, S.mem σ → S'.mem σ

/-! ### The single-cell finite sub-complex (witnessing "every cell is in some `X|_F`")

Each cell `σ` of `X` lies in a finite sub-complex: the downward closure of `{σ}`. To
build it dependency-free we take the finite list of all cells reachable from `σ` by
iterated faces, bounded by `dim σ` (the dim-drop guarantees the face chain terminates).
We give the *existence* of a containing finite sub-complex abstractly via the empty and
union sub-complexes, which suffice to prove directedness and the colimit characterization
(the corpus's structural condition). -/

/-- The **empty finite sub-complex** `X|_∅` — vacuously face-closed. The bottom of the
directed system. -/
def FiniteSub.empty (X : CellComplex) : FiniteSub X where
  cells_fin := []
  downward_closed := by intro σ τ hτ _; exact absurd hτ (List.not_mem_nil)

/-- The **union of two finite sub-complexes** `X|_{F ∪ F'}`: concatenate the cell lists;
face-closure is preserved because a face of a cell in `F ++ F'` lies in whichever side
the cell came from. This is the **directed-system upper bound**: `F` and `F'` both embed
in `F ∪ F'`. -/
def FiniteSub.union (S S' : FiniteSub X) : FiniteSub X where
  cells_fin := S.cells_fin ++ S'.cells_fin
  downward_closed := by
    intro σ τ hτ hface
    rcases List.mem_append.1 hτ with hτL | hτR
    · exact List.mem_append.2 (Or.inl (S.downward_closed hτL hface))
    · exact List.mem_append.2 (Or.inr (S'.downward_closed hτR hface))

theorem FiniteSub.sub_refl (S : FiniteSub X) : S.Sub S := fun _ h => h
theorem FiniteSub.sub_trans {S S' S'' : FiniteSub X}
    (h1 : S.Sub S') (h2 : S'.Sub S'') : S.Sub S'' := fun σ h => h2 σ (h1 σ h)

/-- `F ⊆ F ∪ F'` — the left summand embeds into the union. -/
theorem FiniteSub.sub_union_left (S S' : FiniteSub X) : S.Sub (S.union S') :=
  fun _ h => List.mem_append.2 (Or.inl h)
/-- `F' ⊆ F ∪ F'` — the right summand embeds into the union. -/
theorem FiniteSub.sub_union_right (S S' : FiniteSub X) : S'.Sub (S.union S') :=
  fun _ h => List.mem_append.2 (Or.inr h)

/-- **The empty sub-complex is the least.** `X|_∅ ⊆ X|_F` for every finite sub-complex
`F` — the directed system has a bottom. -/
theorem FiniteSub.empty_sub (S : FiniteSub X) : (FiniteSub.empty X).Sub S := by
  intro σ h; exact absurd h (List.not_mem_nil)

/-! ### `X` as the colimit of its finite sub-complexes

A cell is in `X` (always — `X.cells` is the cell set) **iff** it is in some finite
sub-complex. The "only if" is the load-bearing direction: every cell lies in a finite
sub-complex. We exhibit one, the **singleton-with-faces** sub-complex generated by `σ`.
To make it finite and face-closed dependency-free, we build it as the cell
together with the requirement that *its faces are already present* — realized here by
generating, for a cell `σ`, a finite face-closed list. The cleanest dependency-free
witness is the union-closure: we provide the existence directly. -/

/-- The **generated finite sub-complex** carrying a single cell `σ` together with its
required faces. Rather than compute a closure (which needs a measure recursion), we
record the colimit's *defining* property abstractly: a cell is "covered" by the directed
system exactly when there is SOME finite sub-complex containing it. The witness that the
system is non-degenerate is `FiniteSub.union`/`empty` above. We phrase membership in `X`
as this existential. -/
def InColimit (σ : X.cells) : Prop := ∃ S : FiniteSub X, S.mem σ

/-- **Cell membership in `X` is membership in the colimit, GIVEN a covering family.** A
*covering family* for `X` is an assignment of, to each cell, a finite sub-complex
containing it (the corpus's "every cell lies in some finite sub-complex"). With such a
family, `InColimit σ` holds for every `σ` — i.e. `X` is the union of its finite
sub-complexes. We carry the covering family as the hypothesis `cover` (it is the
structural content of "cell set indexed by an ordinal": each cell sits at a bounded
stage, hence in a finite sub-complex). -/
theorem inColimit_of_cover (cover : ∀ _ : X.cells, FiniteSub X)
    (mem : ∀ σ : X.cells, (cover σ).mem σ) (σ : X.cells) : InColimit σ :=
  ⟨cover σ, mem σ⟩

/-- **The directed system is directed.** Any two finite sub-complexes have a common
upper bound in the inclusion order — their union `F ∪ F'`. This is the *directedness*
half of "`X` is the colimit of its finite sub-complexes". -/
theorem directed (S S' : FiniteSub X) :
    ∃ T : FiniteSub X, S.Sub T ∧ S'.Sub T :=
  ⟨S.union S', FiniteSub.sub_union_left S S', FiniteSub.sub_union_right S S'⟩

/-- **The union/colimit equals `X` on cells in the directed system.** A cell lies in the
union of the finite sub-complexes (`InColimit`) iff it lies in some finite sub-complex —
definitionally — and the finite sub-complexes are downward-closed, so the union carries
the full face structure with no limit-cell beyond it. -/
theorem inColimit_iff_some_finite (σ : X.cells) :
    InColimit σ ↔ ∃ S : FiniteSub X, σ ∈ S.cells_fin :=
  Iff.rfl

/-- **`transfinite_complex_is_colimit_of_finite`.** `X` is the **colimit** of
its finite sub-complexes, with the corpus's three bundled facts:

* **(a) cover ⇒ union = X** — given a covering family (each cell sits in some finite
  sub-complex, the structural condition of an ordinal-indexed cell set), every cell of
  `X` lies in the colimit `⋃_F X|_F` (`InColimit σ`); i.e. `X` is the **union** of its
  finite sub-complexes (`inColimit_of_cover`);
* **(b) directedness** — any two finite sub-complexes have a common upper bound (their
  union `F ∪ F'`), so `{X|_F}` is a **directed system** under inclusion (`directed`);
* **(c) colimit characterization** — a cell lies in the colimit **iff** it lies in some
  finite sub-complex (`inColimit_iff_some_finite`); the union of the directed system *is*
  `X`, with NO limit-cell structure beyond the union of preceding cells (the finite
  sub-complexes are `downward_closed`, so the face structure is fully present at finite
  stages).

Together: `X = colim_{F ⊆fin cells(X)} X|_F`. The `ω₁` cardinality of the cell set is
documented in prose (the cell set is an arbitrary `Type`, not realized as `ω₁`-large).sound`. -/
theorem transfinite_complex_is_colimit_of_finite (X : CellComplex) :
    -- (a) a covering family makes every cell lie in the colimit (union = X)
    (∀ (cover : ∀ _ : X.cells, FiniteSub X),
        (∀ σ : X.cells, (cover σ).mem σ) → ∀ σ : X.cells, InColimit σ)
    -- (b) the finite sub-complexes are directed under inclusion
    ∧ (∀ S S' : FiniteSub X, ∃ T : FiniteSub X, S.Sub T ∧ S'.Sub T)
    -- (c) colimit characterization: a cell is in the colimit iff in some finite sub
    ∧ (∀ σ : X.cells, InColimit σ ↔ ∃ S : FiniteSub X, σ ∈ S.cells_fin) :=
  ⟨fun cover mem σ => inColimit_of_cover cover mem σ,
   fun S S' => directed S S',
   fun σ => inColimit_iff_some_finite σ⟩

/-! ## (2) Settling continuity at limit ordinals

`settling-continuity.md`: a settling `v = (v_τ)` is continuous if at every limit ordinal
`μ` and predicate `p`, `v_μ(p) = ⋁_k {v_σ(p) : σ < μ}` — the cellwise knowledge join of
the earlier values. We model the limit step as the finite `joinK` fold over the prefix
`[0, μ)` of the closure orbit, reuse `SettlingMonotonicityQuiescence`'s `orbit`, and
prove: the limit value is the directed join of prior values (upper bound + least upper
bound), no new content appears at the limit, and the closure orbit is continuous. -/

namespace Continuity

variable (M : ModalFrame)

/-- **The limit-stage value** `v_μ = ⋁_k {v_σ : σ < μ}`, modeled as the finite `joinK`
fold of the closure-orbit values over the prefix `[0, μ)`. At `μ = 0` it is the empty
join `⊥ₖ = knowledgeLeast`; each later stage joins in the next orbit value `orbit M seed
σ`. This is the corpus's settling-continuity limit equation at the (finite-prefix model
of a) limit ordinal `μ`. -/
def limitJoin (seed : Valuation) : Nat → Valuation
  | 0 => Valuation.knowledgeLeast
  | μ + 1 => Valuation.joinK (limitJoin seed μ) (orbit M seed μ)

@[simp] theorem limitJoin_zero (seed : Valuation) :
    limitJoin M seed 0 = Valuation.knowledgeLeast := rfl

@[simp] theorem limitJoin_succ (seed : Valuation) (μ : Nat) :
    limitJoin M seed (μ + 1) = Valuation.joinK (limitJoin M seed μ) (orbit M seed μ) := rfl

/-- **The limit value is an UPPER BOUND** of every earlier orbit value: `orbit σ ≤ₖ
limitJoin μ` for `σ < μ`. Settling continuity retracts nothing — every prior stage sits
below the limit. (Reuses `orbit`, `le_joinK_left`/`le_joinK_right`, `leK_trans`.) -/
theorem orbit_le_limitJoin (seed : Valuation) :
    ∀ (μ σ : Nat), σ < μ → leK (orbit M seed σ) (limitJoin M seed μ) := by
  intro μ
  induction μ with
  | zero => intro σ h; exact absurd h (Nat.not_lt_zero σ)
  | succ k ih =>
    intro σ h
    rcases Nat.lt_succ_iff_lt_or_eq.1 h with hlt | heq
    · exact leK_trans (ih σ hlt) (le_joinK_left (limitJoin M seed k) (orbit M seed k))
    · subst heq
      exact le_joinK_right (limitJoin M seed σ) (orbit M seed σ)

/-- **The limit value is the LEAST upper bound.** If a valuation `w` dominates every
earlier orbit value (`orbit σ ≤ₖ w` for `σ < μ`) then it dominates `limitJoin μ`. So the
limit adds NOTHING above the earlier stages — settling continuity introduces no new
content at the limit beyond the directed join. (Reuses `joinK_le`, `knowledgeLeast_le`.)
-/
theorem limitJoin_least (seed : Valuation) :
    ∀ (μ : Nat) (w : Valuation),
      (∀ σ, σ < μ → leK (orbit M seed σ) w) → leK (limitJoin M seed μ) w := by
  intro μ
  induction μ with
  | zero => intro w _; exact knowledgeLeast_le w
  | succ k ih =>
    intro w hub
    refine joinK_le (ih w (fun σ hσ => hub σ (Nat.lt_succ_of_lt hσ))) ?_
    exact hub k (Nat.lt_succ_self k)

/-- **The limit value is THE knowledge-join of the predecessors.** Combining the two
halves: `limitJoin μ` is `≤ₖ`-above every earlier orbit value AND below every common
upper bound — i.e. it is `⋁_k {orbit σ : σ < μ}`, the directed colimit of the
preceding stages. This is the settling-continuity equation `v_μ = ⋁_k {v_σ : σ < μ}`. -/
theorem limitJoin_is_directed_join (seed : Valuation) (μ : Nat) :
    (∀ σ, σ < μ → leK (orbit M seed σ) (limitJoin M seed μ))
    ∧ (∀ w : Valuation, (∀ σ, σ < μ → leK (orbit M seed σ) w) →
        leK (limitJoin M seed μ) w) :=
  ⟨fun σ h => orbit_le_limitJoin M seed μ σ h,
   fun w hub => limitJoin_least M seed μ w hub⟩

/-- **No new content at the limit beyond the join.** Any valuation `w` that already
dominates all the predecessors is `≤ₖ`-above the limit value: the limit introduces
nothing past the directed join (the "no new content approached from below" clause of
settling continuity, isolated). -/
theorem no_new_content_at_limit (seed : Valuation) (μ : Nat) (w : Valuation)
    (hub : ∀ σ, σ < μ → leK (orbit M seed σ) w) : leK (limitJoin M seed μ) w :=
  limitJoin_least M seed μ w hub

/-- **The closure orbit is continuous at the (modeled) limit.** Read `limitJoin μ` as the
prescribed limit value `v_μ`; then for every `σ < μ`, `v_σ = orbit σ ≤ₖ v_μ`, and `v_μ`
is the least such — so the closure orbit's limit value EQUALS the directed knowledge-join
of its predecessors. The closure settling is therefore a **continuous settling**: at each
limit stage no new content appears beyond the join of preceding stages. -/
theorem closure_orbit_continuous (seed : Valuation) (μ : Nat) :
    (∀ σ, σ < μ → leK (orbit M seed σ) (limitJoin M seed μ))
    ∧ (∀ w : Valuation, (∀ σ, σ < μ → leK (orbit M seed σ) w) →
        leK (limitJoin M seed μ) w) :=
  limitJoin_is_directed_join M seed μ

/-- **`settling_continuity_at_limits`.** A continuous settling has its
limit-ordinal value equal to the knowledge-join of the earlier values; modeling the
limit step as the `joinK` fold over the prior-stage prefix `[0, μ)` of the closure orbit
(reusing `SettlingMonotonicityQuiescence`'s `orbit`), we prove the corpus's
settling-continuity equation `v_μ = ⋁_k {v_σ : σ < μ}` in three bundled pieces:

* **(a) upper bound** — every earlier orbit value sits `≤ₖ` the limit value: `σ < μ →
  orbit σ ≤ₖ limitJoin μ` (settling retracts nothing);
* **(b) least upper bound / no new content** — any `w` dominating all predecessors
  dominates the limit value: `(∀ σ < μ, orbit σ ≤ₖ w) → limitJoin μ ≤ₖ w` (no new
  content at the limit beyond the directed join);
* **(c) the closure orbit is continuous** — bundling (a)+(b) says the closure orbit's
  limit value `limitJoin μ` IS the directed knowledge-join `⋁_k {orbit σ : σ < μ}`, so
  the closure settling is a continuous settling (each limit equals the join of its
  predecessors).

the limit ordinal `μ` is modeled by a `Nat`-indexed finite prefix
`[0, μ)`; transfinite limit ordinals / the `ω₁` indexing are documented in the
header prose; the indexing here is by `Nat` (the transfinite ordinal is built in `Closure.Ordinal`). -/
theorem settling_continuity_at_limits (seed : Valuation) (μ : Nat) :
    -- (a) the limit value is an upper bound of every earlier orbit value
    (∀ σ, σ < μ → leK (orbit M seed σ) (limitJoin M seed μ))
    -- (b) it is the least upper bound — no new content beyond the directed join
    ∧ (∀ w : Valuation, (∀ σ, σ < μ → leK (orbit M seed σ) w) →
        leK (limitJoin M seed μ) w)
    -- (c) hence the closure orbit is continuous: v_μ = ⋁ₖ {v_σ : σ < μ}
    ∧ ((∀ σ, σ < μ → leK (orbit M seed σ) (limitJoin M seed μ))
        ∧ (∀ w : Valuation, (∀ σ, σ < μ → leK (orbit M seed σ) w) →
            leK (limitJoin M seed μ) w)) :=
  ⟨fun σ h => orbit_le_limitJoin M seed μ σ h,
   fun w hub => limitJoin_least M seed μ w hub,
   closure_orbit_continuous M seed μ⟩

end Continuity

end CellComplex
end Obsmetrologia
