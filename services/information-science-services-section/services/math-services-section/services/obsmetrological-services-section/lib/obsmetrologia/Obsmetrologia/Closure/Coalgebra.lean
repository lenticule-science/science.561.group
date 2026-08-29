import Obsmetrologia.Closure.Monad.KZ
import Obsmetrologia.Closure.SettlingMonotonicityQuiescence
import Obsmetrologia.Language.Predicating.Hyperdoctrine

/-!
# Settling coalgebra structure — the settling-equipped predication hyperdoctrine

This module formalizes the corpus node

  `…/positing/content/valuation/content/knowledge-least-valuation/settling/content/`
  `predication-hyperdoctrine/content/settling-coalgebra-structure/`
  `settling-coalgebra-structure.md`

A **settling-equipped predication hyperdoctrine** — the 2-categorical realization
of a *spatiotemporal knowledge presheaf* — over `(L, C, E, λ)` is a pair `(E, c)`:

* **(C1)** `E` is a predication hyperdoctrine (the dep `Hyperdoctrine`: reindexing
  with its quantifier adjoints `∃_f ⊣ f* ⊣ ∀_f`, Frobenius, Beck–Chevalley).
* **(C2)** `c : E → F_U(E)` is a **coalgebra** for the **settling endofunctor**
  `F_U`, parametrized by an *increment sequence* `U = (u_τ)`. The settling
  endofunctor is `F_U(v) = Cl(v) ∨ₖ u_τ` — close under inference, then admit the
  τ-increment of new evidence. (`Cl = ModalFrame.closureOp`, the corpus settling
  closure `□◇`.)
* **(C3) Settling monotonicity.** The orbit `(v_τ)` derived from `c` is
  `≤ₖ`-monotone: `σ ≤ τ ⟹ v_σ ≤ₖ v_τ` pointwise. The orbit is `v₀ = E`,
  `v_{τ+1} = F_U(v_τ)` at successors, `v_μ = ⋁ₖ{v_σ : σ < μ}` at limits
  (**settling continuity**).

We model the 2-monad **1-categorically** over the *thin* valuation knowledge poset
`leK` (a poset = thin 2-category), exactly as the deps `Closure2MonadKZ` /
`SettlingMonotonicityQuiescence` do. So a *coalgebra map* `c : E → F_U(E)` is the
order witness `leK E (F_U E)` (the unfolding 2-cell), dual to a *Cl-algebra
structure* `a : Cl E → E` rendered as `leK (Cl E) E` (the consuming 2-cell).

We derive, faithful to the named node:

1. **`settlingEndofunctor`** `F_U(v) = Cl(v) ∨ₖ u` (reuse `closureOp` ∨ₖ an
   increment), inflationary and monotone; at the zero increment it reduces to `Cl`.
   **`SettlingCoalgebra`** bundles a carrier valuation, the coalgebra map
   `leK carrier (F_U carrier)`, and the C3 orbit-monotonicity witness.
   **`coalgebraOrbit`** is the settling orbit: successors reuse
   `SettlingMonotonicityQuiescence.orbit` (iterating `Cl`); the **limit** step is
   the `≤ₖ`-join `⋁ₖ` over the prior orbit (settling continuity), realized as the
   finite `joinK` fold over `[0, μ)` — `coalgebraOrbitLimit`.
2. **`coalgebra_dual_of_algebra`** — the coalgebra `c : E → F_U(E)` is
   the **dual** of the settling Cl-**algebra**. The algebra *consumes* `Cl E` to
   produce `E` (`leK (Cl E) E`, forced to the fixed point `Cl E = E`, reusing
   `IsClAlgebra` / `Closure2MonadKZ`); the coalgebra *produces* `F_U E` from `E`
   (`leK E (F_U E)`, always, by inflation). At **quiescence** (`Cl E = E`, the
   zero increment) the two witnesses coincide and `c` is an **iso**: `E = F_U E`.
   Reuses `settling_quiescent_is_algebra`.
3. **`cclosed_iff_closure_algebra`** — a fully `C`-closed
   settling-equipped hyperdoctrine is **equivalent to** being an **algebra for the
   closure 2-monad `Cl`** (predicate-category naturality = Cl-algebra). Property-
   like (Kelly–Lack K2): unique up to iso. Reuses `Closure2MonadKZ`'s
   `IsClAlgebra` / `ClAlgebraStructure` and its property-like uniqueness.
-/

namespace Obsmetrologia
namespace Coalgebra

open Valuation Valuation.ModalFrame

variable (M : ModalFrame)

/-! ## (1) The settling endofunctor `F_U` and the coalgebra structure

`F_U(v) = Cl(v) ∨ₖ u` — close under inference (the corpus closure `Cl = □◇`), then
admit the τ-increment `u` of new evidence. We carry the single increment `u` as an
explicit parameter (scoping above). -/

/-- **The settling endofunctor** `F_U(v) = Cl(v) ∨ₖ u` on valuations: the modal
settling closure `Cl = closureOp` joined with the τ-increment `u` of the increment
sequence `U`. Reuses `closureOp`; the `∨ₖ` is the pointwise knowledge-join. -/
def settlingEndofunctor (u v : Valuation) : Valuation :=
  Valuation.joinK (M.closureOp v) u

/-- **Zero increment recovers `Cl`.** At the knowledge-least increment
`u = ⊥ₖ = knowledgeLeast`, the settling endofunctor *is* the closure:
`F_U(v) = Cl(v)`. (This is the pure-settling orbit the dependency iterates.) -/
@[simp] theorem settlingEndofunctor_zero (v : Valuation) :
    settlingEndofunctor M Valuation.knowledgeLeast v = M.closureOp v := by
  funext φ
  show Charge.joinK (M.closureOp v φ) Charge.kBot = M.closureOp v φ
  rw [Charge.joinK_comm]; exact Charge.joinK_kBot (M.closureOp v φ)

/-- **`F_U` is inflationary** — `v ≤ₖ F_U(v)`. The closure is inflationary
(`closureOp_infl`) and joining the increment only moves further up the knowledge
order: `v ≤ₖ Cl v ≤ₖ Cl v ∨ₖ u`. This is the coalgebra map's existence. -/
theorem settlingEndofunctor_infl (u v : Valuation) :
    leK v (settlingEndofunctor M u v) :=
  leK_trans (M.closureOp_infl v) (le_joinK_left (M.closureOp v) u)

/-- **`F_U` is monotone** in the knowledge order — functoriality of the endofunctor.
`Cl` is monotone (`closureOp_mono`) and `∨ₖ` is monotone in its closure argument. -/
theorem settlingEndofunctor_mono (u : Valuation) {v w : Valuation} (h : leK v w) :
    leK (settlingEndofunctor M u v) (settlingEndofunctor M u w) :=
  joinK_le (leK_trans (M.closureOp_mono h) (le_joinK_left (M.closureOp w) u))
    (le_joinK_right (M.closureOp w) u)

/-- A **settling coalgebra** `(E, c)` over the modal frame `M` and increment `u`,
modeled 1-categorically over the thin valuation poset:

* `carrier` — the state valuation `E` (the predication hyperdoctrine's state, C1);
* `coalgMap` — the **coalgebra map** `c : E → F_U(E)` rendered as the order witness
  `leK carrier (F_U carrier)` (the *unfolding* 2-cell, dual to a Cl-algebra's
  consuming `leK (Cl E) E`);
* `monotone` — **settling monotonicity (C3)**: the pure-`Cl` orbit from `carrier`
  is `≤ₖ`-monotone, `σ ≤ τ ⟹ v_σ ≤ₖ v_τ`.

It is a `Type`-level bundle (it carries the `carrier` valuation as data); the two
order/monotonicity fields are `Prop`. -/
structure SettlingCoalgebra (u : Valuation) where
  /-- The carrier/state valuation `E`. (Existence witness; carried in the field.) -/
  carrier : Valuation
  /-- The coalgebra map `c : E → F_U(E)` as the unfolding order witness. -/
  coalgMap : leK carrier (settlingEndofunctor M u carrier)
  /-- Settling monotonicity (C3): the orbit from `carrier` is `≤ₖ`-monotone. -/
  monotone : ∀ {m n : Nat}, m ≤ n → leK (orbit M carrier m) (orbit M carrier n)

/-- **Every valuation carries a canonical settling coalgebra.** The coalgebra map is
`settlingEndofunctor_infl` (always inflationary) and C3 is the dependency's
`orbit_monotone`. So `(E, c)` exists for every state `E` — the coalgebra is *forced*
data, not free (the dual of the Cl-algebra being a property). -/
def canonicalCoalgebra (u E : Valuation) : SettlingCoalgebra M u where
  carrier := E
  coalgMap := settlingEndofunctor_infl M u E
  monotone := fun h => orbit_monotone M E h

/-! ## The settling orbit with successor and limit steps

The orbit is `v₀ = E`, `v_{τ+1} = F_U(v_τ)` at successors (reuse the dependency's
pure-`Cl` `orbit`), `v_μ = ⋁ₖ{v_σ : σ < μ}` at limits (settling continuity, modeled
as a finite `joinK` fold). -/

/-- **The settling orbit (successor steps).** Reuses
`SettlingMonotonicityQuiescence.orbit`: `coalgebraOrbit E n = Clⁿ(E)`. (The
zero-increment / pure-settling orbit; see the-scoping header for the nonzero
increment.) -/
def coalgebraOrbit (E : Valuation) (n : Nat) : Valuation := orbit M E n

/-- **The settling continuity / limit step** `v_μ = ⋁ₖ{v_σ : σ < μ}`: the
`≤ₖ`-join of all earlier orbit values, modeled as the finite `joinK` fold over
`[0, μ)`. At `μ = 0` it is `⊥ₖ = knowledgeLeast` (empty join); each later stage
joins the next orbit value. This is the corpus's **settling continuity** equation
at a (finite) limit stage `μ`. -/
def coalgebraOrbitLimit (E : Valuation) : Nat → Valuation
  | 0 => Valuation.knowledgeLeast
  | μ + 1 => Valuation.joinK (coalgebraOrbitLimit E μ) (coalgebraOrbit M E μ)

/-- **The limit dominates every earlier orbit value** — `v_σ ≤ₖ v_μ` for `σ < μ`.
The half of "`v_μ` is the join `⋁ₖ{v_σ : σ < μ}`" that says it is an *upper bound*:
settling continuity retracts nothing. -/
theorem coalgebraOrbitLimit_ge (E : Valuation) :
    ∀ (μ σ : Nat), σ < μ → leK (coalgebraOrbit M E σ) (coalgebraOrbitLimit M E μ) := by
  intro μ
  induction μ with
  | zero => intro σ h; exact absurd h (Nat.not_lt_zero σ)
  | succ k ih =>
    intro σ h
    rcases Nat.lt_succ_iff_lt_or_eq.1 h with hlt | heq
    · exact leK_trans (ih σ hlt) (le_joinK_left (coalgebraOrbitLimit M E k) (coalgebraOrbit M E k))
    · subst heq
      exact le_joinK_right (coalgebraOrbitLimit M E σ) (coalgebraOrbit M E σ)

/-- **The limit is the LEAST upper bound** — if a valuation `w` dominates every
earlier orbit value `v_σ` (`σ < μ`) then it dominates `v_μ`. The other half of
"`v_μ = ⋁ₖ{v_σ : σ < μ}`": settling continuity adds nothing above the earlier
stages. Together with `coalgebraOrbitLimit_ge`, `v_μ` is the `≤ₖ`-join. -/
theorem coalgebraOrbitLimit_least (E : Valuation) :
    ∀ (μ : Nat) (w : Valuation),
      (∀ σ, σ < μ → leK (coalgebraOrbit M E σ) w) → leK (coalgebraOrbitLimit M E μ) w := by
  intro μ
  induction μ with
  | zero => intro w _; exact knowledgeLeast_le w
  | succ k ih =>
    intro w hub
    refine joinK_le (ih w (fun σ hσ => hub σ (Nat.lt_succ_of_lt hσ))) ?_
    exact hub k (Nat.lt_succ_self k)

/-! ## (2) The coalgebra is the dual of the settling algebra

Where a Cl-**algebra** structure `a : Cl E → E` (rendered `leK (Cl E) E`) *consumes*
`F_U(E)` to produce `E` and is forced to the fixed point `Cl E = E`, the
**coalgebra** map `c : E → F_U(E)` (rendered `leK E (F_U E)`) *produces* `F_U(E)`
from `E` — always, by inflation. At quiescence the two coincide and `c` is iso. -/

/-- **The coalgebra map is the dual of the algebra structure map.** The Cl-**algebra**
structure map `a : Cl E → E` is the order witness `leK (Cl E) E` (consuming,
`Closure2MonadKZ.ClAlgebraStructure.structMap`); the settling **coalgebra** map
`c : E → F_U(E)` is `leK E (F_U E)` (producing). They run in *opposite* directions
across `E` and `Cl E ≤ₖ F_U E` — the algebra/coalgebra duality. -/
theorem coalgMap_dual_structMap (u E : Valuation) (s : ClAlgebraStructure M E) :
    leK (M.closureOp E) E ∧ leK E (settlingEndofunctor M u E) :=
  ⟨s.structMap, settlingEndofunctor_infl M u E⟩

/-- **At quiescence the coalgebra is an iso** (zero increment). If `E` is a fixed
point `Cl E = E` (quiescent / a Cl-algebra, reusing
`settling_quiescent_is_algebra`), then at the zero increment the coalgebra map's
target collapses onto `E`: `F_U(E) = E`. The unfolding `c : E → F_U(E)` and its
inverse coincide — `c` is an **isomorphism** at quiescence. -/
theorem coalgebra_iso_at_quiescence {E : Valuation} (h : Quiescent M E) :
    settlingEndofunctor M Valuation.knowledgeLeast E = E := by
  rw [settlingEndofunctor_zero]
  exact (quiescent_iff_fixed M E).1 h

/-- **The settling coalgebra is the dual of the settling algebra.**
Bundle the full duality of the settling-equipped predication hyperdoctrine `(E, c)`:

* **(C3) orbit monotonicity** — `σ ≤ τ ⟹ v_σ ≤ₖ v_τ` (`orbit_monotone`);
* **settling continuity** — the limit `v_μ` is the `≤ₖ`-join `⋁ₖ{v_σ : σ < μ}`: it
  dominates every earlier stage (`coalgebraOrbitLimit_ge`) and is the least such
  (`coalgebraOrbitLimit_least`);
* **algebra ⇄ coalgebra duality** — the Cl-**algebra** map `leK (Cl E) E` (consume)
  and the **coalgebra** map `leK E (F_U E)` (produce) run oppositely; and at
  **quiescence** (`Cl E = E`, zero increment) the coalgebra is an **iso**
  `F_U(E) = E`. The algebra is the property `IsClAlgebra E := Cl E = E`
  (`settling_quiescent_is_algebra`); the coalgebra is its dual unfolding.

So `c : E → F_U(E)` is the dual of the settling Cl-algebra: the algebra is the
fixed point that *consumes* the dynamics, the coalgebra *unfolds* it; on a fixed
point they are inverse. (Exposed at `Obsmetrologia.coalgebra_dual_of_algebra`.) -/
theorem coalgebra_dual_of_algebra (E : Valuation) :
    -- (C3) settling monotonicity
    (∀ {m n : Nat}, m ≤ n → leK (orbit M E m) (orbit M E n))
    -- settling continuity: limit is the ≤ₖ-join over the prior orbit
    ∧ (∀ μ σ, σ < μ → leK (coalgebraOrbit M E σ) (coalgebraOrbitLimit M E μ))
    ∧ (∀ μ (w : Valuation),
        (∀ σ, σ < μ → leK (coalgebraOrbit M E σ) w) → leK (coalgebraOrbitLimit M E μ) w)
    -- algebra (consume, forced to the fixed point) ⇄ coalgebra (produce, inflation)
    ∧ (∀ _s : ClAlgebraStructure M E,
        leK (M.closureOp E) E ∧ leK E (settlingEndofunctor M Valuation.knowledgeLeast E))
    -- at quiescence the coalgebra is an iso F_U(E) = E
    ∧ (Quiescent M E → settlingEndofunctor M Valuation.knowledgeLeast E = E) :=
  ⟨fun h => orbit_monotone M E h,
   fun μ σ h => coalgebraOrbitLimit_ge M E μ σ h,
   fun μ w h => coalgebraOrbitLimit_least M E μ w h,
   fun s => coalgMap_dual_structMap M Valuation.knowledgeLeast E s,
   fun h => coalgebra_iso_at_quiescence M h⟩

/-! ## (3) C-closed ⟺ closure-algebra (Kelly–Lack property-like)

The corpus: *predicate-category naturality* of a settling-equipped hyperdoctrine is
equivalently the state being an **algebra for the closure 2-monad `Cl`**; by
Kelly–Lack this is a **property**, unique up to unique iso. We identify "fully
`C`-closed" with the state being a `Cl`-algebra and reuse `Closure2MonadKZ`'s
property-like uniqueness. -/

/-- **`C`-closed** = the state valuation is a fixed point of the closure
`Cl E = E` (saturated under inference / predicate-category naturality). This is
exactly `Closure2MonadKZ.IsClAlgebra`. -/
def CClosed (E : Valuation) : Prop := IsClAlgebra M E

/-- **A fully `C`-closed settling-equipped hyperdoctrine ⟺ a closure-2-monad
algebra (Kelly–Lack).** For a state `E`:

* **equivalence** — being `C`-closed (predicate-category naturality, `CClosed E`)
  is the same as carrying a `Cl`-**algebra** structure (`ClAlgebraStructure M E`):
  each direction reuses `Closure2MonadKZ` (`isClAlgebra_of_structure` /
  `structure_of_isClAlgebra`);
* **property-like (K2)** — the `Cl`-algebra structure is **unique**: any two
  structures on `E` are equal (proof-irrelevant `Prop`), so a `C`-closed state
  admits **at most one** algebra structure, *up to unique iso* (Kelly–Lack). Reuses
  `closure_algebra_property_like_modal`.

This is the corpus's "`C`-closed presheaves as closure-algebras": the spatiotemporal
knowledge presheaf name is recovered as the algebra-theoretic consequence.
(Exposed at `Obsmetrologia.cclosed_iff_closure_algebra`.) -/
theorem cclosed_iff_closure_algebra (E : Valuation) :
    (CClosed M E ↔ ClAlgebraStructure M E)
    ∧ (∀ s t : ClAlgebraStructure M E, s = t) :=
  ⟨⟨structure_of_isClAlgebra M, isClAlgebra_of_structure M⟩,
   fun _ _ => rfl⟩

end Coalgebra

/-! ## Headlines at the spec'd `Obsmetrologia.*` paths

The two headline theorems are exposed at the top-level `Obsmetrologia` namespace. They
restate the `Coalgebra`-scoped proofs verbatim. -/

open Valuation Valuation.ModalFrame Coalgebra in
/-- **The settling coalgebra is the dual of the settling algebra.** See
`Obsmetrologia.Coalgebra.coalgebra_dual_of_algebra`: for the settling-equipped predication
hyperdoctrine `(E, c)`, bundle (C3) orbit monotonicity, settling continuity (the
limit is the `≤ₖ`-join over the prior orbit), the algebra/coalgebra duality
(consume `leK (Cl E) E` ⇄ produce `leK E (F_U E)`), and the iso at quiescence
`F_U(E) = E`. -/
theorem coalgebra_dual_of_algebra (M : ModalFrame) (E : Valuation) :
    (∀ {m n : Nat}, m ≤ n → leK (orbit M E m) (orbit M E n))
    ∧ (∀ μ σ, σ < μ → leK (coalgebraOrbit M E σ) (coalgebraOrbitLimit M E μ))
    ∧ (∀ μ (w : Valuation),
        (∀ σ, σ < μ → leK (coalgebraOrbit M E σ) w) → leK (coalgebraOrbitLimit M E μ) w)
    ∧ (∀ _s : ClAlgebraStructure M E,
        leK (M.closureOp E) E ∧ leK E (settlingEndofunctor M Valuation.knowledgeLeast E))
    ∧ (Quiescent M E → settlingEndofunctor M Valuation.knowledgeLeast E = E) :=
  Coalgebra.coalgebra_dual_of_algebra M E

open Valuation Valuation.ModalFrame Coalgebra in
/-- **`C`-closed ⟺ closure-2-monad algebra (Kelly–Lack).** See
`Obsmetrologia.Coalgebra.cclosed_iff_closure_algebra`: a fully `C`-closed settling-equipped
hyperdoctrine is equivalent to the state carrying a `Cl`-algebra structure, and that
structure is unique (property-like, up to unique iso). -/
theorem cclosed_iff_closure_algebra (M : ModalFrame) (E : Valuation) :
    (CClosed M E ↔ ClAlgebraStructure M E)
    ∧ (∀ s t : ClAlgebraStructure M E, s = t) :=
  Coalgebra.cclosed_iff_closure_algebra M E

end Obsmetrologia
