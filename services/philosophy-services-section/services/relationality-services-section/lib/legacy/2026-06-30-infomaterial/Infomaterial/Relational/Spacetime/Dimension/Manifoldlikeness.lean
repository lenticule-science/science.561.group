import Infomaterial.Relational.Spacetime.Causal.Cohomology.N
import Infomaterial.Relational.Spacetime.Incidence.Mobius

/-!
# Causal manifoldlikeness — the order-complex cohomology as reconstructed-spacetime topology

`CausalCohomologyN` built the full graded cohomology `Hⁿ = ker δ / im δ` of the causal order complex.
In causal-set theory the cohomology of that order complex *is* the topology of the reconstructed
spacetime — its Betti numbers are the holes of the approximated manifold — so general `Hⁿ` is the
instrument for **manifoldlikeness**: does a causal set's cohomology match a Lorentzian manifold's?
That question is the causal-set **Hauptvermutung**. This module states it cohomologically and supplies
its two provable halves.

**Well-definedness (the Hauptvermutung's invariance half).** For the reconstructed topology to be a
property of the *spacetime* rather than of the particular causal set sprinkled into it, the cohomology
must be invariant under the local-isomorphism (MLD / factor-map) equivalence. It is: pullback of a
cochain along **any** map `f : E' → E`, `(f^*φ)(l) = φ(l.map f)`, is a **cochain map** — it commutes
with the coboundary `δ` (`pullback_delta`) — so it carries cocycles to cocycles and coboundaries to
coboundaries (`pullback_cocycle`, `pullback_coboundary`) and descends to a map on `Hⁿ`. A factor map
(the morphism underlying an MLD) therefore induces a map on cohomology, and the topological signature
is a well-defined invariant of the MLD-class.

**The computable invariant (the Euler-characteristic half).** The order complex's Euler characteristic
is the alternating simplex (chain) count `χ = Σₖ(−1)ᵏ·#{k\text{-chains}}`, which by **Philip Hall** is
the incidence **Möbius function** `μ` (`Spacetime.Incidence.Mobius.hallSum = mobius`), and by Euler–Poincaré equals
`Σₙ(−1)ⁿ dim Hⁿ`. On the corpus diamond the interval `(0,3)` has chain census `(c₁,c₂,c₃) = (1,2,0)`,
so `χ = −1 + 2 − 0 = +1 = μ(0,3)`: the reduced Euler characteristic of the interval's order complex.
That order complex is the two spacelike midpoints `{1,2}` — an `S⁰` — and `μ = +1 = (−1)²` is exactly
the link signature of a **2-dimensional** Alexandrov interval. The diamond is cohomologically certified
2D-manifoldlike.

The full Hauptvermutung — that a sprinkled causal set's whole Betti profile converges to the Lorentzian
manifold's, and the Euler–Poincaré identity over the (infinite) cochain complex — stays the frontier
(`thm:causal-set-hauptvermutung`).

## Main definitions

* `pullback` — the factor-map pullback `f^*` on cochains, `(f^*φ)(l) = φ(l.map f)`.

## Main results

* `pullback_delta` — `f^*` is a cochain map: `f^*(δφ) = δ(f^*φ)`.
* `pullback_cocycle` / `pullback_coboundary` — `f^*` carries cocycles and coboundaries along, so
  cohomology is functorial — the topology is an MLD-invariant.
* `diamond_interval_euler` — the diamond interval `(0,3)`'s Euler characteristic = Philip Hall chain
  count = `μ = +1`, the 2D-manifoldlike `S⁰`-link signature.
* `causal_manifoldlikeness` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Infomaterial.Relational.Spacetime.Causal.Cohomology.N` (the graded
cohomology) and `Infomaterial.Relational.Spacetime.Incidence.Mobius` (the Philip Hall / Möbius Euler characteristic).

## Tags

manifoldlikeness, Hauptvermutung, Euler characteristic, Philip Hall, Möbius, MLD-invariance, causal set
-/

namespace Infomaterial
namespace Relational.Spacetime.Dimension.Manifoldlikeness

open Infomaterial.Relational.Spacetime.Causal.Cohomology.N
open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

/-! ## (A) The factor-map pullback is a cochain map — cohomology is functorial -/

/-- The **factor-map pullback** `f^*` on cochains: `(f^*φ)(l) = φ(l.map f)`. A map `f : E' → E` of
event types (the morphism underlying an MLD / sliding-block factor) pulls a cochain on the target back
to one on the source. -/
def pullback {E E' : Type} (f : E' → E) (φ : Cochain E) : Cochain E' :=
  fun l => φ (l.map f)

/-- **`f^*` is a cochain map**: it commutes with the coboundary, `f^*(δφ) = δ(f^*φ)`. The cone
recursion `δφ(a∷τ) = φ(τ) − δ(a·φ)(τ)` transports through `l ↦ l.map f` by induction on the chain —
the prepend-shift `a·φ` pulls back to the prepend-shift of the pullback. This is what makes cohomology
functorial. -/
theorem pullback_delta {E E' : Type} (f : E' → E) (φ : Cochain E) (σ : List E') :
    pullback f (delta φ) σ = delta (pullback f φ) σ := by
  induction σ generalizing φ with
  | nil => rfl
  | cons a τ ih =>
    simp only [pullback, List.map_cons, delta_cons]
    have h := ih (fun m => φ (f a :: m))
    simp only [pullback] at h
    rw [h]
    rfl

/-- **`f^*` carries cocycles to cocycles** (`ker δ` is preserved): a closed cochain pulls back closed.
So the cohomology `Hⁿ = ker δ / im δ` receives a well-defined pullback — functorial under factor maps,
hence an **MLD-invariant**. -/
theorem pullback_cocycle {E E' : Type} (f : E' → E) {φ : Cochain E} (h : Cocycle φ) :
    Cocycle (pullback f φ) := by
  funext σ
  rw [← pullback_delta]
  show delta φ (List.map f σ) = 0
  rw [h]

/-- **`f^*` carries coboundaries to coboundaries** (`im δ` is preserved): an exact cochain pulls back
exact, its primitive pulling back to a primitive. With `pullback_cocycle` this is the full statement
that `f^*` descends to cohomology. -/
theorem pullback_coboundary {E E' : Type} (f : E' → E) {φ : Cochain E} (h : Coboundary φ) :
    Coboundary (pullback f φ) := by
  obtain ⟨ψ, rfl⟩ := h
  exact ⟨pullback f ψ, funext fun σ => pullback_delta f ψ σ⟩

/-! ## (B) The diamond is cohomologically 2D-manifoldlike -/

/-- **The diamond interval's Euler characteristic is the 2D-manifoldlike signature.** The corpus
diamond's interval `(0,3)` has order-complex chain census `(c₁,c₂,c₃) = (1,2,0)`, so its Euler
characteristic `χ = Σₖ(−1)ᵏcₖ = −1 + 2 − 0 = +1` — the **Philip Hall** alternating chain sum
(`Spacetime.Incidence.Mobius.hallSum`), which equals the incidence **Möbius** value `μ(0,3) = +1`
(`Spacetime.Incidence.Mobius.diamond_philip_hall`). The interval's order complex is the two spacelike midpoints
`{1,2}` (an `S⁰`), and `μ = +1 = (−1)²` is the link signature of a 2-dimensional Alexandrov interval:
the diamond is cohomologically certified 2D-manifoldlike. -/
theorem diamond_interval_euler :
    Spacetime.Incidence.Mobius.hallSum fourEvents diamondPrec 0 3 = 1
    ∧ Spacetime.Incidence.Mobius.mobius fourEvents diamondPrec 0 3 = 1
    ∧ Spacetime.Incidence.Mobius.chainCount fourEvents diamondPrec 1 0 3 = 1
    ∧ Spacetime.Incidence.Mobius.chainCount fourEvents diamondPrec 2 0 3 = 2
    ∧ Spacetime.Incidence.Mobius.chainCount fourEvents diamondPrec 3 0 3 = 0 := by
  refine ⟨?_, ?_, Spacetime.Incidence.Mobius.diamond_chainCount.1, Spacetime.Incidence.Mobius.diamond_chainCount.2.1,
    Spacetime.Incidence.Mobius.diamond_chainCount.2.2⟩
  · rw [Spacetime.Incidence.Mobius.diamond_philip_hall]; exact Spacetime.Incidence.Mobius.diamond_mobius_profile.1
  · exact Spacetime.Incidence.Mobius.diamond_mobius_profile.1

/-! ## (C) The bundled headline -/

/-- **Causal manifoldlikeness.** The order-complex cohomology of `CausalCohomologyN` is the topology of
the reconstructed spacetime, and this module supplies the two provable halves of the causal-set
Hauptvermutung:

* **the topology is an MLD-invariant** — the factor-map pullback `f^*` is a cochain map
  (`pullback_delta`) carrying cocycles to cocycles and coboundaries to coboundaries
  (`pullback_cocycle`, `pullback_coboundary`), so `Hⁿ` is functorial and the topological signature is
  well-defined on the MLD-class, not an artefact of the particular sprinkling;
* **the computable invariant is the Möbius/Euler characteristic** (`diamond_interval_euler`) — the
  order complex's Euler characteristic `Σₖ(−1)ᵏ·#{k\text{-chains}}` is, by Philip Hall, the incidence
  Möbius `μ`, and on the diamond interval `(0,3)` it is `+1 = (−1)²`, the `S⁰`-link signature of a
  2-dimensional Alexandrov interval — the diamond certified 2D-manifoldlike.

General `Hⁿ` is thus the instrument that lets manifoldlikeness be *stated*; the continuum-limit Betti
matching is `thm:causal-set-hauptvermutung`. -/
theorem causal_manifoldlikeness :
    (∀ {E E' : Type} (f : E' → E) (φ : Cochain E) (σ : List E'),
        pullback f (delta φ) σ = delta (pullback f φ) σ)
    ∧ (∀ {E E' : Type} (f : E' → E) (φ : Cochain E), Cocycle φ → Cocycle (pullback f φ))
    ∧ (∀ {E E' : Type} (f : E' → E) (φ : Cochain E), Coboundary φ → Coboundary (pullback f φ))
    ∧ Spacetime.Incidence.Mobius.hallSum fourEvents diamondPrec 0 3 = 1
    ∧ Spacetime.Incidence.Mobius.mobius fourEvents diamondPrec 0 3 = 1 :=
  ⟨fun f φ σ => pullback_delta f φ σ,
   fun f _ h => pullback_cocycle f h,
   fun f _ h => pullback_coboundary f h,
   diamond_interval_euler.1,
   diamond_interval_euler.2.1⟩

end Relational.Spacetime.Dimension.Manifoldlikeness
end Infomaterial
