import Infomaterial.Relational.Spacetime.Causal.Laplacian

/-!
# Causal microsupport — singular support confined to the causal cone

`MicrolocalSupport` gives the *temporal* singular support of a closure flow: a singularity is an
NSC firing at a limit, and vanishing `H¹` is empty singular support. This module gives the
*spatial/cone* companion the light-cone frontier actually asks for (the survey's "causal
microsupport", §14.2): a Kashiwara–Schapira-style **microsupport confined to a causal cone**, and
the two theorems that confinement buys — **causal propagation** (the PDE/propagation-of-singularities
side) and **spacelike independence** (the AQFT/Einstein-causality side).

The microsupport of an event section `S` is its causal closure `causalClosure C S` — the set of
events `S`'s influence reaches, which is *exactly the union of the future cones of `S`'s support*.
So the microsupport is **conic by construction** (an up-set of the causal order). From that single
fact:

* a **point source** has microsupport equal to its closed future cone — singularities propagate
  along the cone, not across it (KS propagation);
* the microsupport **never reaches a spacelike-separated event** — a region's influence is confined
  to its causal cone and is independent of the spacelike complement (AQFT Einstein causality).

This is a **bridge, not an identity** with smooth microlocal sheaf theory: there is no cotangent
bundle here, only the causal order's cone. The formal content is the causal-closure cone geometry;
the microlocal/AQFT words are the reading. No free data — everything reuses
`Spacetime.Causal.Laplacian.causalClosure` and the `ConeField` cone laws.

## Main definitions

* `Microsupport` — the causal microsupport of a section (its causal closure).
* `ConfinedTo` — the microsupport lies inside a causal region.

## Main results

* `microsupport_iff_union_cones` — the microsupport is the union of the future cones of the support.
* `microsupport_upward_closed` — the microsupport is conic (an up-set of the causal order).
* `microsupport_point` — a point source propagates to exactly its closed future cone.
* `microsupport_excludes_spacelike` / `microsupport_excludes_spacelike_region` — no propagation to
  spacelike-separated events (AQFT locality).
* `spacelike_microsupport_independent` — spacelike point sources are mutually unreached.
* `causal_microsupport_unifies` — the bundled headline: cone propagation and spacelike locality.

## References

`content/.../lorentzian-causal-settling`. Built on `Infomaterial.Relational.Spacetime.Causal.Laplacian` and
`Infomaterial.Relational.Spacetime.Causal.Cone`; companion to `Infomaterial.Relational.Spacetime.Support.Microlocal`.

## Tags

microsupport, singular support, causal cone, propagation of singularities, Einstein causality, AQFT
-/

namespace Infomaterial
namespace Relational.Spacetime.Support.Causal

open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Causal.Cone
open Infomaterial.Relational.Spacetime.Causal.Laplacian

variable {E : Type} (C : CausalSet E)

/-! ## (A) The microsupport and its conic confinement -/

/-- The **causal microsupport** of an event section: the events its influence reaches, i.e. its
causal closure. This is the cone-confined analogue of the Kashiwara–Schapira singular support. -/
def Microsupport (S : Section E) : Section E := causalClosure C S

/-- **The microsupport is the union of the future cones of the support** — confinement to the causal
cone, holding by the very definition of causal closure. An event is in the microsupport iff it lies
in the closed future cone of some support event. -/
theorem microsupport_iff_union_cones (S : Section E) (y : E) :
    Microsupport C S y ↔ ∃ x, S x ∧ ClosedFuture C x y := Iff.rfl

/-- **The microsupport is conic** — an up-set of the causal order: if `y` is in the microsupport and
`y ≤ z` causally, so is `z`. This is the KS "the singular support is a conic set" property. -/
theorem microsupport_upward_closed (S : Section E) {y z : E}
    (hy : Microsupport C S y) (hyz : CausalLe C y z) : Microsupport C S z := by
  obtain ⟨x, hxS, hxy⟩ := hy
  exact ⟨x, hxS, causalLe_trans C hxy hyz⟩

/-- The microsupport stabilizes — propagating again adds nothing (it is a closure). -/
theorem microsupport_idem (S : Section E) :
    Microsupport C (Microsupport C S) = Microsupport C S := causalClosure_idem C S

/-- The microsupport **lies inside** a causal region `U`: `S`'s influence never leaves `U`. -/
def ConfinedTo (S U : Section E) : Prop := ∀ y, Microsupport C S y → U y

/-! ## (B) Propagation of singularities — a point source fills its future cone -/

/-- **Propagation along the cone.** The microsupport of a point source at `a` is exactly its closed
future cone `J⁺(a)`: a singularity seeded at one event propagates to precisely the events causally
after it — along the cone, never across it. This is the causal-set model of propagation of
singularities. -/
theorem microsupport_point (a : E) :
    Microsupport C (fun x => x = a) = ClosedFuture C a := by
  funext y
  apply propext
  constructor
  · rintro ⟨x, rfl, h⟩; exact h
  · intro h; exact ⟨a, rfl, h⟩

/-! ## (C) AQFT locality — no propagation across spacelike separation -/

/-- **Einstein causality (point form).** A point source at `a` never reaches a distinct
spacelike-separated event `b`: its microsupport excludes `b`. Influence is confined to the causal
cone and cannot cross to the spacelike complement. -/
theorem microsupport_excludes_spacelike {a b : E} (hne : a ≠ b) (h : Spacelike C a b) :
    ¬ Microsupport C (fun x => x = a) b := by
  rintro ⟨x, rfl, hxb⟩
  rcases hxb with heq | hr
  · exact hne heq
  · exact h.1 hr

/-- **Einstein causality (region form).** A section supported in a region `S` has microsupport
disjoint from any event `b` that is outside `S` and spacelike-separated from every support event.
The influence of a region stays in its causal cone, independent of its spacelike complement — the
AQFT locality criterion. -/
theorem microsupport_excludes_spacelike_region {S : Section E} {b : E}
    (hnb : ¬ S b) (h : ∀ x, S x → Spacelike C x b) :
    ¬ Microsupport C S b := by
  rintro ⟨x, hxS, hxb⟩
  rcases hxb with rfl | hr
  · exact hnb hxS
  · exact (h x hxS).1 hr

/-- **Mutual independence of spacelike sources.** Two point sources at distinct spacelike-separated
events have microsupports each excluding the other's seed: neither influences the other. This is the
causal-set model of "spacelike-separated observables commute." -/
theorem spacelike_microsupport_independent {a b : E} (hne : a ≠ b) (h : Spacelike C a b) :
    (¬ Microsupport C (fun x => x = a) b) ∧ (¬ Microsupport C (fun x => x = b) a) :=
  ⟨microsupport_excludes_spacelike C hne h,
   microsupport_excludes_spacelike C (Ne.symm hne) (spacelike_symm C h)⟩

/-! ## (D) The bundled headline -/

/-- **Causal microsupport unifies propagation and locality.** With the microsupport confined to the
causal cone (conic, `microsupport_upward_closed`):

* **propagation of singularities** — a point source's microsupport is exactly its closed future cone
  (`microsupport_point`); singularities travel along the cone;
* **Einstein causality** — the microsupport never reaches a distinct spacelike-separated event
  (`microsupport_excludes_spacelike`); influence respects spacelike separation;
* **propagation is a closure** — re-propagating adds nothing (`microsupport_idem`).

The PDE side (propagation along null/causal directions) and the AQFT side (spacelike locality) are
the same cone-confinement fact, read two ways. -/
theorem causal_microsupport_unifies :
    (∀ a, Microsupport C (fun x => x = a) = ClosedFuture C a)
    ∧ (∀ a b, a ≠ b → Spacelike C a b → ¬ Microsupport C (fun x => x = a) b)
    ∧ (∀ (S : Section E) {y z : E}, Microsupport C S y → CausalLe C y z → Microsupport C S z)
    ∧ (∀ S : Section E, Microsupport C (Microsupport C S) = Microsupport C S) :=
  ⟨microsupport_point C,
   fun _ _ hne h => microsupport_excludes_spacelike C hne h,
   fun S _ _ hy hyz => microsupport_upward_closed C S hy hyz,
   microsupport_idem C⟩

end Relational.Spacetime.Support.Causal
end Infomaterial
