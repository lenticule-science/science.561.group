import Infomaterial.Relational.Spacetime.Causal.Cone

/-!
# Causal nets — regions, isotony, and spacelike independence (an AQFT criterion)

The order-theoretic reduction of an algebraic-QFT causal net: causal regions (predicates on events)
form an inclusion preorder, closed diamonds are monotone in their endpoints (isotony), and
spacelike-separated regions are symmetric, disjoint, and **independent** in any causal net carrying
an independence relation (`content/.../lorentzian-causal-settling`). No operator algebras are
present, so independence is an abstract relation an algebraic instance can later make *commutation*:
the honest content is *spacelike separation forces independence*, not *operators commute*.

No free data: regions, inclusion, and spacelike separation are thin predicates over
`Spacetime.Causal.Cone.CausalLe`/`Spacelike`; every law reduces to the cone order.

## Main definitions

* `Region` / `RegionLe` — causal regions and their inclusion order.
* `SpacelikeRegions` — pairwise spacelike (hence disjoint) regions.
* `DiamondRegion` — a closed causal diamond as a region.
* `IndependentNet` — a causal net with a spacelike-driven independence relation.

## Main results

* `regionLe_refl` / `regionLe_trans` — inclusion is a preorder.
* `spacelikeRegions_symm` / `spacelikeRegions_disjoint` — spacelike regions are symmetric, disjoint.
* `closedDiamond_mono` — diamonds are monotone in their endpoints (isotony).
* `spacelike_independence_symmetric` — spacelike data are independent both ways.
* `causal_net_region_theory` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Infomaterial.Relational.Spacetime.Causal.Cone`.

## Tags

causal net, AQFT, isotony, spacelike independence, causal region, light cone
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Net

open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Causal.Cone

/-! ## (A) Regions and inclusion -/

/-- A causal region is a predicate on events. -/
abbrev Region (E : Type) := E → Prop

/-- Region inclusion. -/
def RegionLe {E : Type} (U V : Region E) : Prop := ∀ x, U x → V x

/-- Inclusion is reflexive. -/
theorem regionLe_refl {E : Type} (U : Region E) : RegionLe U U := fun _ h => h

/-- Inclusion is transitive. -/
theorem regionLe_trans {E : Type} {U V W : Region E} :
    RegionLe U V → RegionLe V W → RegionLe U W :=
  fun hUV hVW x hx => hVW x (hUV x hx)

variable {E : Type} (C : CausalSet E)

/-- A region is future-closed when membership is preserved up the causal order. -/
def FutureClosedRegion (U : Region E) : Prop :=
  ∀ ⦃x y : E⦄, U x → Spacetime.Causal.Cone.CausalLe C x y → U y

/-- A closed causal diamond as a region. -/
def DiamondRegion (a b : E) : Region E := Spacetime.Causal.Cone.ClosedDiamond C a b

/-- Two regions are spacelike-separated when no member of one causally precedes a member of the
other (in either direction); by reflexivity this forces disjointness. -/
def SpacelikeRegions (U V : Region E) : Prop :=
  ∀ x y, U x → V y → ¬ Spacetime.Causal.Cone.CausalLe C x y ∧ ¬ Spacetime.Causal.Cone.CausalLe C y x

/-! ## (B) Spacelike laws -/

/-- Spacelike separation of regions is symmetric. -/
theorem spacelikeRegions_symm {U V : Region E} (h : SpacelikeRegions C U V) :
    SpacelikeRegions C V U := by
  intro a b ha hb
  exact ⟨(h b a hb ha).2, (h b a hb ha).1⟩

/-- Spacelike regions are disjoint. -/
theorem spacelikeRegions_disjoint {U V : Region E} (h : SpacelikeRegions C U V) :
    ∀ x, ¬ (U x ∧ V x) := by
  intro x hx
  exact (h x x hx.1 hx.2).1 (Spacetime.Causal.Cone.causalLe_refl C x)

/-! ## (C) Isotony of diamond regions -/

/-- Closed diamonds are monotone in their endpoints: widening the apexes enlarges the region. -/
theorem closedDiamond_mono {a a' b b' : E}
    (ha : Spacetime.Causal.Cone.CausalLe C a' a) (hb : Spacetime.Causal.Cone.CausalLe C b b') :
    RegionLe (Spacetime.Causal.Cone.ClosedDiamond C a b) (Spacetime.Causal.Cone.ClosedDiamond C a' b') :=
  fun _ hx => ⟨Spacetime.Causal.Cone.causalLe_trans C ha hx.1, Spacetime.Causal.Cone.causalLe_trans C hx.2 hb⟩

/-! ## (D) Causal nets and spacelike independence -/

/-- A causal net carrying an independence relation on local data, with spacelike-separated regions
forced independent — the AQFT locality criterion. -/
structure IndependentNet {E : Type} (C : CausalSet E) where
  /-- The local data assigned to a region. -/
  Local : Region E → Type
  /-- The independence relation between local data of two regions. -/
  Indep : ∀ U V, Local U → Local V → Prop
  /-- Independence is symmetric. -/
  indep_symm : ∀ U V a b, Indep U V a b → Indep V U b a
  /-- Spacelike-separated regions have independent local data. -/
  spacelike_indep : ∀ U V, SpacelikeRegions C U V → ∀ a b, Indep U V a b

/-- Spacelike-separated local data are independent in both directions. -/
theorem spacelike_independence_symmetric (N : IndependentNet C) {U V : Region E}
    (h : SpacelikeRegions C U V) :
    (∀ a b, N.Indep U V a b) ∧ (∀ b a, N.Indep V U b a) :=
  ⟨N.spacelike_indep U V h,
   fun b a => N.indep_symm U V a b (N.spacelike_indep U V h a b)⟩

/-! ## (E) The bundled headline -/

/-- **Causal net region theory.** Causal regions form an inclusion preorder; closed diamonds are
monotone in their endpoints; spacelike-separated regions are symmetric and disjoint. -/
theorem causal_net_region_theory :
    (∀ U : Region E, RegionLe U U)
    ∧ (∀ U V W : Region E, RegionLe U V → RegionLe V W → RegionLe U W)
    ∧ (∀ U V : Region E, SpacelikeRegions C U V → SpacelikeRegions C V U)
    ∧ (∀ U V : Region E, SpacelikeRegions C U V → ∀ x, ¬ (U x ∧ V x))
    ∧ (∀ a a' b b' : E, Spacetime.Causal.Cone.CausalLe C a' a → Spacetime.Causal.Cone.CausalLe C b b' →
        RegionLe (Spacetime.Causal.Cone.ClosedDiamond C a b) (Spacetime.Causal.Cone.ClosedDiamond C a' b')) :=
  ⟨fun U => regionLe_refl U,
   fun _ _ _ hUV hVW => regionLe_trans hUV hVW,
   fun _ _ h => spacelikeRegions_symm C h,
   fun _ _ h => spacelikeRegions_disjoint C h,
   fun _ _ _ _ ha hb => closedDiamond_mono C ha hb⟩

end Relational.Spacetime.Causal.Net
end Infomaterial
