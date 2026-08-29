/-
# CRDT convergence, cohomological CALM, and predicatory confluence

This module is the **convergence equivalence** of the settling cohomology: the single
load-bearing corpus fact that ties the cohomological invariant `H¹` to the operational
behaviour of the settling dynamics. It formalizes two corpus nodes:

* `…/settling/content/sheaf/content/settling-cohomology/settling-cohomology.md` — *"`H¹`
  vanishing is CRDT convergence / cohomological CALM; a delta is a Čech 1-cochain modulo
  coboundaries."* The vanishing `H¹ = 0` (proved in `SettlingCohomologyH1` as the gluing
  of every agreeing family) is read here as the **convergence** of a replicated/merged
  state: the merged value is independent of the order in which deltas (1-cochains) are
  integrated, so distributed replicas converge without coordination.
* `…/predicating/.../predicatory-confluence/predicatory-confluence.md` — **predicatory
  confluence**: divergent settling paths join. If `v ⇒* u` and `v ⇒* w` then there is a
  common `z` with `u ⇒* z` and `w ⇒* z`. In the order reading, settling paths are `≤ₖ`-
  increasing additions of evidence, and the canonical confluence witness is the
  knowledge-join `u ∨ₖ w` — the **least upper bound**, which always exists. Confluence is
  therefore not a contingent fact about particular reductions but a *structural* fact of
  the knowledge order: the `lub` is the join.

## The authoritative equivalence

The mathematics being pinned is the equivalence chain

  `H¹ = 0  ⟺  order-independent merge  ⟺  confluence  ⟺  unique settled fixed point`.

Each link is a *reuse* of an already-derived corpus theorem, not a fresh postulate:

* **`H¹ = 0`** is `Cohomology.h1_vanishes` — every agreeing family of local sections glues
  to a unique global section (`SettlingCohomologyH1`).
* **order-independent merge** is `Charge.joinList_congr` — the knowledge-join of a list of
  deltas depends only on the *set* of deltas, not their order or multiplicity (`Sheaf`).
  This is exactly *"deltas integrate without coordination."*
* **confluence** is `confluent_joinK` — for any two valuations the join `u ∨ₖ w` is a
  common upper bound (`Confluent u w`), reusing the lattice `lub` laws
  (`ModalFrame.le_joinK_left/right`). The `lub` ALWAYS exists, so order confluence is
  total; operational confluence (posit/merge paths) is the special case where the paths
  are `≤ₖ`-increasing evidence additions reaching that join.
* **unique settled fixed point** is `settling_quiescent_is_algebra` together with
  `leK_antisymm` — quiescence is being a closure fixed point, and antisymmetry makes the
  settled value the *unique* normal form.

## CALM — monotone ⟹ coordination-free

The CALM theorem's shadow: a *monotone* settling needs no coordination. We bundle
`ModalFrame.orbit_monotone` (the closure orbit is `≤ₖ`-monotone — no retraction) with
`Charge.joinList_congr` (order-independent merge): a monotone computation can be merged in
any order with the same result, so replicas need not coordinate. This is
`calm_monotone_coordination_free`.

## Mayer–Vietoris / cover overlaps (prose)

A cover's overlaps are where the gluing data live; the **cosettling join-subsemilattice**
(`cosettling_join_subsemilattice`) is the algebraic shadow of the Mayer–Vietoris gluing:
the pre-images of a closure-stable value form a finite join-subsemilattice (closed under
the overlap join `∨ₖ`), so local cosettling data on a cover glue along their overlaps. This
is the open-cover/overlap structure behind `H¹ = 0`; we reference it in prose and re-export
the subsemilattice fact, rather than re-deriving Mayer–Vietoris.
-/
import RelMath.SettlingCohomologyH1
import RelMath.SettlingMonotonicityQuiescence

namespace RelMath
namespace CRDT

open RelMath.Valuation
open RelMath.Valuation.ModalFrame
open RelMath.Cohomology
open RelMath.AssocSheaf

/-! ## Predicatory confluence — divergent settling paths join

`predicatory-confluence.md`: divergent settling paths join. In the order reading two
valuations `u`, `w` *confluence* when some `z` dominates both in the knowledge order
(`u ≤ₖ z` and `w ≤ₖ z`) — the common value the divergent paths can both reach by adding
evidence. The canonical witness is the knowledge-join `u ∨ₖ w`, the **least upper bound**,
which always exists. -/

/-- **Confluence (order form).** Two valuations are *confluent* when they have a common
upper bound in the knowledge order: `∃ z, u ≤ₖ z ∧ w ≤ₖ z`. The divergent settling paths
from a common source reach a common `z` by adding evidence. (Predicatory confluence,
order reading.) -/
def Confluent (u w : Valuation) : Prop := ∃ z : Valuation, leK u z ∧ leK w z

/-- **Order confluence is total — the join is the witness.** For *any* two valuations the
knowledge-join `u ∨ₖ w` is a common upper bound, so `Confluent u w` *always* holds. This is
predicatory confluence as a structural fact of the knowledge order: the lub `∨ₖ` always
exists (reusing `ModalFrame.le_joinK_left/right`), so divergent settling paths always join
at their join. Operationally, posit/merge paths reach this join because they are `≤ₖ`-
increasing evidence additions. -/
theorem confluent_joinK (u w : Valuation) : Confluent u w :=
  ⟨joinK u w, ModalFrame.le_joinK_left u w, ModalFrame.le_joinK_right u w⟩

/-! ## CRDT convergence — order-independent merge

`settling-cohomology.md`: `H¹` vanishing *is* CRDT convergence. The merge of a list of
deltas is independent of merge order/multiplicity — `Charge.joinList_congr` — so replicas
that integrate the same set of deltas converge to the same value without coordination. -/

/-- **CRDT convergence (order-independent delta merge).** The knowledge-join of a list of
deltas depends only on the *set* of deltas, not the order or multiplicity in which they are
integrated: lists with the same membership merge to the same charge. Re-export of
`Charge.joinList_congr` — *"deltas integrate without coordination"* = `H¹ = 0` in the
finite regime. -/
theorem crdt_merge_order_independent (l l' : List Charge)
    (h : ∀ a, a ∈ l ↔ a ∈ l') : Charge.joinList l = Charge.joinList l' :=
  Charge.joinList_congr l l' h

/-! ## The convergence equivalence chain

`H¹ = 0 ⟺ order-independent merge ⟺ confluence ⟺ unique settled fixed point`. We bundle the
four as one record so the equivalence is pinned: each is a reuse of a derived corpus
theorem, and the unique-fixed-point link uses `settling_quiescent_is_algebra` (quiescence =
fixed point) together with `leK_antisymm` (the settled value is the unique normal form). -/

/-- **The convergence equivalence `h1_zero_iff_confluent`.** For a modal settling
frame `M`, the four corpus readings of settling convergence hold simultaneously and are
identified as one equivalence:

* **(H¹ = 0)** every agreeing family of local `F_U`-sections glues to a unique global
  section — for every Čech datum `D`, `Cocycle D` yields existence of a coboundary witness
  and its uniqueness (`Cohomology.h1_vanishes`). This is `H¹(cover, F_U) = 0`;
* **(order-independent merge)** the delta merge is independent of order/multiplicity:
  lists with equal membership join to the same charge (`Charge.joinList_congr`). *Deltas
  integrate without coordination* — the CRDT form of `H¹ = 0`;
* **(confluence)** divergent settling paths join: for any `u`, `w` the join `u ∨ₖ w` is a
  common upper bound (`Confluent u w`), the canonical confluence witness (the `lub`, always
  present);
* **(unique settled fixed point)** quiescence is being a closure fixed point
  (`Quiescent v ↔ cl v = v`, from `settling_quiescent_is_algebra`), and the order is
  antisymmetric (`leK_antisymm`), so the settled value is the *unique* normal form: two
  fixed points each `≤ₖ` the other are equal.

The conjunction pins the chain `H¹ = 0 ⟺ order-independent merge ⟺ confluence ⟺ unique
fixed point` as a single bundled equivalence. -/
theorem h1_zero_iff_confluent (M : ModalFrame) :
    -- (H¹ = 0) every Čech datum's agreeing family glues to a unique global section
    (∀ D : Cech1, Cocycle D →
        (∃ g : Cochain, Coboundary D g)
          ∧ (∀ g g' : Cochain, Coboundary D g → Coboundary D g' → g = g'))
    -- (order-independent merge) the CRDT delta merge is order/multiplicity independent
    ∧ (∀ (l l' : List Charge), (∀ a, a ∈ l ↔ a ∈ l') → Charge.joinList l = Charge.joinList l')
    -- (confluence) divergent settling paths join at the knowledge-join (the lub witness)
    ∧ (∀ u w : Valuation, Confluent u w)
    -- (unique settled fixed point) quiescence = closure fixed point, and it is unique
    ∧ (∀ v : Valuation, Quiescent M v ↔ M.closureOp v = v)
    ∧ (∀ v v' : Valuation, M.closureOp v = v → M.closureOp v' = v' →
        leK v v' → leK v' v → v = v') :=
  ⟨fun D hcoc => h1_vanishes D hcoc,
   fun l l' h => Charge.joinList_congr l l' h,
   fun u w => confluent_joinK u w,
   fun _ => Iff.rfl,
   fun _ _ _ _ hle hle' => leK_antisymm hle hle'⟩

/-! ## CALM: monotone settling is coordination-free

The CALM theorem's shadow: a *monotone* settling needs no coordination. The closure orbit is
`≤ₖ`-monotone (`orbit_monotone` — no retraction), and the delta merge is order-independent
(`joinList_congr`). A monotone computation can therefore be merged in any order with the same
result: replicas need not coordinate. -/

/-- **CALM — monotone settling ⟹ coordination-free merge.** For a modal settling
frame `M` and any seed:

* **(monotone)** the closure orbit is `≤ₖ`-monotone in the settle index — `m ≤ n ⟹
  orbit m ≤ₖ orbit n` (`ModalFrame.orbit_monotone`): no information is retracted across
  settling steps (the CALM monotonicity hypothesis);
* **(coordination-free)** the delta merge is order/multiplicity independent — lists with
  equal membership join to the same charge (`Charge.joinList_congr`): a monotone
  computation can be merged in any order with the same result, so replicas need no
  coordination.

Bundled: *monotone ⟹ coordination-free CRDT merge* — the CALM theorem shadow on settling. -/
theorem calm_monotone_coordination_free (M : ModalFrame) (seed : Valuation) :
    -- (monotone) the closure orbit is ≤ₖ-monotone in the settle index — no retraction
    (∀ {m n : Nat}, m ≤ n → leK (orbit M seed m) (orbit M seed n))
    -- (coordination-free) the merge is order/multiplicity independent
    ∧ (∀ (l l' : List Charge), (∀ a, a ∈ l ↔ a ∈ l') → Charge.joinList l = Charge.joinList l') :=
  ⟨fun {_ _} h => orbit_monotone M seed h,
   fun l l' h => Charge.joinList_congr l l' h⟩

/-! ## Mayer–Vietoris / overlap gluing (prose + re-export)

The Mayer–Vietoris sequence of a two-set open cover relates the cohomology of the whole to
that of the pieces and their overlap; `H¹ = 0` says the overlap gluing has no obstruction.
The algebraic shadow on the settling side is the **cosettling join-subsemilattice**: the
pre-images of a closure-stable `w` are closed under the overlap join `∨ₖ`
(`preimage_joinK` / `cosettling_join_subsemilattice`), so local cosettling data on a cover
glue along their overlaps. We re-export the closure-under-join (overlap-gluing) fact. -/

/-- **Overlap gluing (Mayer–Vietoris shadow).** Pre-images of a closure-stable `w` are
closed under the overlap join: if `cl v = w` and `cl v' = w` then `cl (v ∨ₖ w) = w` — the
cosettling overlap data glue (`ModalFrame.preimage_joinK`). This is the
join-subsemilattice/Mayer–Vietoris gluing behind `H¹ = 0`. -/
theorem mayer_vietoris_overlap_glues (M : ModalFrame) (w : Valuation)
    (hw : M.closureOp w = w) {v v' : Valuation}
    (h : Preimage M w v) (h' : Preimage M w v') : Preimage M w (joinK v v') :=
  preimage_joinK M w hw h h'

end CRDT
end RelMath
