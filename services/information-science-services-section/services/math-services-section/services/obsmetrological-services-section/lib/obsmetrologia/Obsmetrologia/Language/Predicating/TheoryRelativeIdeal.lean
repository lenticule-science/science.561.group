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

The laws stay exposed directly rather than through a parallel proof bundle. -/

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

These structural properties stay exposed as direct theorems. -/

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

end RelIdeal
end Obsmetrologia
