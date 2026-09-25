import Obsmetrologia.Language.Predicating.Fibration
import Obsmetrologia.Language.Predicating.Hyperdoctrine
import Obsmetrologia.Closure.SettlingMonotonicityQuiescence

/-!
# TheoryRelativeIdeal — the theory-relative ideal of a resource within a host theory

This module formalizes the corpus node

  …/settling/content/closure-2-monad/content/theory-relative-ideal/theory-relative-ideal.md

A **host theory** `T` is a predication settling whose closure `Cl_T` drives a seed to its
fully-settled state `v_T_∞`, the `Cl_T`-fixed point (here `M.settle seed`, the closure
orbit's fixed point of `ModalPairAdjunction` / `SettlingMonotonicityQuiescence`). A
**resource** `R` carries a **type embedding** `ι : C_R ↪ C_T` — a faithful, generator-class
preserving functor placing the resource's predicate scope inside the theory's.

The **theory-relative ideal** of `R` within `T` is the restriction of the theory's settled
state to the resource scope:

  `v_R_(T,∞) := ι*(v_T_∞)`,    `(ι*(v_T_∞))(p) := v_T_∞(ι(p))`  for every resource predicate `p`.

The base morphism `ι*` is precisely the predication-settling **base-morphism reindexing**
`Valuation.reindex` (precomposition `ι* v = v ∘ ι`) of `Hyperdoctrine`. So the relative ideal
is `relativeIdeal ι vT := Valuation.reindex ι vT`, a settling over the **same predicate scope**
as `R` (the resource cells).

The carrier is the valuation `relativeIdeal ι vT`; the laws below identify it with
`Valuation.reindex`, give its cellwise behavior, and show how it inherits monotonicity
and fixed-point structure from the host.
-/

namespace Obsmetrologia
namespace RelIdeal

open Obsmetrologia.Valuation
open Obsmetrologia.Valuation.ModalFrame

/-! ## 0. The type embedding and the relative ideal

The type embedding `ι : C_R ↪ C_T` is realized as a cellwise reindexing map on predicate
cells — the base map of the predicate category along which the predication-settling
base-morphism reindexes the theory fibers. The **relative ideal** of the host settled state
`vT` is its restriction along `ι`, i.e. precomposition `vT ∘ ι` — `Valuation.reindex`. -/

/-- The **theory-relative ideal** of the host settled state `vT` along the type embedding
`ι : C_R ↪ C_T` (modeled as a cellwise reindexing): `v_R_(T,∞) := ι*(vT)`, the restriction of
the theory's settled state to the resource scope. Definitionally `Valuation.reindex ι vT`,
precomposition `vT ∘ ι`, a settling over the resource predicate scope `C_R`. -/
def relativeIdeal (ι : PredicationCell → PredicationCell) (vT : Valuation) : Valuation :=
  Valuation.reindex ι vT

/-- **The relative ideal IS the reindex of the settled state** — definitional, recorded. -/
theorem relativeIdeal_eq_reindex (ι : PredicationCell → PredicationCell) (vT : Valuation) :
    relativeIdeal ι vT = Valuation.reindex ι vT := rfl

/-- **Cellwise law.** `(ι*(vT))(p) = vT(ι(p))` for every resource predicate cell `p` — the
ideal at a resource cell is the theory's settled state at the embedded cell. -/
theorem relativeIdeal_apply (ι : PredicationCell → PredicationCell) (vT : Valuation)
    (p : PredicationCell) : relativeIdeal ι vT p = vT (ι p) := rfl

/-! ## 1. The theory-relative ideal is the reindex of the settled fixed point

The ideal is exactly `Valuation.reindex ι vT`, evaluated cellwise, and the restriction
composes correctly under nested embeddings via `Hyperdoctrine`'s functoriality:

* the **trivial** type embedding `id : C_T ↪ C_T` restricts to the host state itself
  (`reindex_id`);
* a **nested** embedding `C_R ↪ C_R' ↪ C_T` restricts in one step or in two — `reindex_comp`
  (`reindex ι (reindex ι' vT) = reindex (ι' ∘ ι) vT`), so the relative ideal is functorial in
  the embedding.

We bundle the cellwise identity together with these functoriality laws. -/

/-- A proof-carrying bundle witnessing that the theory-relative ideal is the genuine
**reindex** of the host settled state along `ι`, functorial in the embedding. -/
structure IsReindexIdeal (ι : PredicationCell → PredicationCell) (vT : Valuation) : Prop where
  /-- The ideal is the reindex of the settled state. -/
  is_reindex : relativeIdeal ι vT = Valuation.reindex ι vT
  /-- Cellwise: `(ι*(vT))(p) = vT(ι(p))`. -/
  cellwise : ∀ p, relativeIdeal ι vT p = vT (ι p)
  /-- The **trivial** embedding `id` restricts to the host state — `reindex_id`. -/
  ideal_id : relativeIdeal id vT = vT
  /-- **Nested** embeddings compose: restricting along `ι'` then `ι` equals restricting along
  `ι' ∘ ι` — contravariant functoriality `reindex_comp` of the type embeddings. -/
  ideal_comp : ∀ (ι' : PredicationCell → PredicationCell),
    relativeIdeal ι (relativeIdeal ι' vT) = relativeIdeal (ι' ∘ ι) vT

/-- The theory-relative ideal of `R` within `T` is **exactly the reindex** of
the settled fixed point `vT = v_T_∞` along the type embedding `ι`: `relativeIdeal ι vT =
Valuation.reindex ι vT`, evaluated cellwise `(ι*(vT))(p) = vT(ι(p))`. Via `Hyperdoctrine`'s
functoriality (`reindex_id`, contravariant `reindex_comp`) the restriction of a settled state
composes correctly under nested type embeddings, so the ideal is a genuine settling over the
resource scope `C_R`. (Faithfulness / generator-preservation of `ι` are documented
side-conditions on legitimate embeddings; they do not affect the restriction algebra, which is
precomposition for any base map.) -/
theorem theory_relative_ideal_is_reindex (ι : PredicationCell → PredicationCell)
    (vT : Valuation) : IsReindexIdeal ι vT where
  is_reindex := rfl
  cellwise := fun _ => rfl
  ideal_id := Valuation.reindex_id vT
  ideal_comp := fun ι' => Valuation.reindex_comp ι ι' vT

/-! ## 2. The relative ideal inherits settledness / monotonicity

If the host state `vT = v_T_∞` is settled (a `Cl_T`-fixed point, `Quiescent M vT`), the
reindexed ideal inherits the structure faithfully:

* **monotone** — reindexing respects `leK` (`reindex_mono`): a more-settled host state yields a
  more-settled ideal; in particular the ideal of `v_T_∞` dominates the ideal of any state below
  it. So the ideal **respects the order**.
* **no new content beyond the host** — every value of the ideal is a value the host already
  decided (`(ι*(vT))(p) = vT(ι(p))`), so the ideal is the settled-state *restricted*; it never
  introduces a cell value the theory has not already settled, and each value sits ≤ₖ the host
  top `⊤ₖ`.
* **host fixed point preserved cellwise** — if `Cl_T vT = vT` (`Quiescent`), then
  `(ι*(vT))(p) = (Cl_T vT)(ι(p))` for every resource cell `p`: the ideal is precisely the host
  closure restricted to the embedded cells, witnessing that reindexing a fixed point is
  well-behaved over the resource scope.

We bundle these structural properties. -/

/-- The relative ideal **respects the host order** — `reindex_mono`. If host state `vT` sits
≤ₖ-below `wT`, the ideal of `vT` sits ≤ₖ-below the ideal of `wT`. Monotonicity of the
restriction along the type embedding. -/
theorem relativeIdeal_mono (ι : PredicationCell → PredicationCell) {vT wT : Valuation}
    (h : leK vT wT) : leK (relativeIdeal ι vT) (relativeIdeal ι wT) :=
  Valuation.reindex_mono ι h

/-- **The ideal introduces no new content beyond the host.** Each ideal value is a host value:
`(ι*(vT))(p) = vT(ι(p))`; in particular every cell of the ideal sits ≤ₖ the host top `⊤ₖ`
(the host already bounds it). The ideal is the settled state *restricted*, never a fresh value
over `C_R`. -/
theorem relativeIdeal_le_kTop (ι : PredicationCell → PredicationCell) (vT : Valuation)
    (p : PredicationCell) : Charge.leK (relativeIdeal ι vT p) Charge.kTop = true :=
  Charge.leK_kTop (vT (ι p))

/-- **The host fixed point is preserved cellwise under reindexing.** If `vT` is settled
(`Quiescent M vT`, i.e. `Cl_T vT = vT`), then for every resource cell `p` the ideal value is
exactly the host closure at the embedded cell: `(ι*(vT))(p) = (Cl_T vT)(ι(p))`. The ideal is
the host closure restricted to the resource scope — reindexing a fixed point is well-behaved
over `C_R`. -/
theorem relativeIdeal_fixed_cellwise (M : ModalFrame) (ι : PredicationCell → PredicationCell)
    (vT : Valuation) (hfix : Quiescent M vT) (p : PredicationCell) :
    relativeIdeal ι vT p = M.closureOp vT (ι p) := by
  show vT (ι p) = M.closureOp vT (ι p)
  rw [hfix]

/-- **The reindex of a settled state equals the reindex of its host closure.** Global form of
the cellwise law: if `vT` is settled, `relativeIdeal ι vT = relativeIdeal ι (Cl_T vT)`, so the
ideal can be read either off the settled state or off the host closure applied to it — they
coincide over the resource scope. -/
theorem relativeIdeal_reindex_closure (M : ModalFrame) (ι : PredicationCell → PredicationCell)
    (vT : Valuation) (hfix : Quiescent M vT) :
    relativeIdeal ι vT = relativeIdeal ι (M.closureOp vT) := by
  show Valuation.reindex ι vT = Valuation.reindex ι (M.closureOp vT)
  rw [hfix]

/-- A proof-carrying bundle of the relative ideal's inherited structural properties. -/
structure IdealSettled (M : ModalFrame) (ι : PredicationCell → PredicationCell)
    (vT : Valuation) : Prop where
  /-- Monotone — respects `leK`. -/
  mono : ∀ {wT : Valuation}, leK vT wT →
    leK (relativeIdeal ι vT) (relativeIdeal ι wT)
  /-- No new content: every ideal value is bounded by the host top `⊤ₖ`. -/
  bounded : ∀ p, Charge.leK (relativeIdeal ι vT p) Charge.kTop = true
  /-- The ideal value is the host closure restricted to the embedded cell (host fixed point
  preserved cellwise). -/
  fixed_cellwise : ∀ p, relativeIdeal ι vT p = M.closureOp vT (ι p)
  /-- Global: the ideal is the reindex of the host closure of the settled state. -/
  reindex_closure : relativeIdeal ι vT = relativeIdeal ι (M.closureOp vT)

/-- The theory-relative ideal **inherits settledness / monotonicity** from the
host fixed point. Given a settled host state `vT = v_T_∞` (`Quiescent M vT`, `Cl_T vT = vT`):

* **monotone / order-respecting** — `reindex_mono`: the restriction along `ι` is `leK`-monotone;
* **no new content beyond the host** — every ideal value is host-decided, hence ≤ₖ `⊤ₖ`; the
  ideal is the settled state *restricted*;
* **host fixed point preserved cellwise** — `(ι*(vT))(p) = (Cl_T vT)(ι(p))`, and globally
  `ι*(vT) = ι*(Cl_T vT)`, so reindexing a fixed point is well-behaved over the resource scope.

This is the strongest dependency-free statement that the ideal does not introduce content
beyond the host: it is the host settled state restricted, not a fresh `Cl_R`-computation over
`C_R`. (Per the corpus "What this is NOT": the host theory may derive about the resource what
the resource's own closure cannot — so we do **not** claim a `Cl_R`-fixed point; that would
overstate.) Uses at most `propext` / `Quot.sound`. -/
theorem relative_ideal_settled (M : ModalFrame) (ι : PredicationCell → PredicationCell)
    (vT : Valuation) (hfix : Quiescent M vT) : IdealSettled M ι vT where
  mono := fun {_} h => relativeIdeal_mono ι h
  bounded := fun p => relativeIdeal_le_kTop ι vT p
  fixed_cellwise := fun p => relativeIdeal_fixed_cellwise M ι vT hfix p
  reindex_closure := relativeIdeal_reindex_closure M ι vT hfix

end RelIdeal
end Obsmetrologia
