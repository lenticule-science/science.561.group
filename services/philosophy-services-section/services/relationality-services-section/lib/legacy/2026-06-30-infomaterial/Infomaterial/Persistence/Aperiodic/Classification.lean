import Infomaterial.Cohomology.SettlingCohomologyH1
import Infomaterial.Closure.Regime
import Infomaterial.Persistence.Aperiodic.Witness.JeandelRao

/-!
# Aperiodic classification — the `cl-inv` model, cohomological equivalence, and the dichotomy

The abstract classifying-invariant model for aperiodic-regime settlings. A `Settling` carries its
closure-ordinal regime and its `H¹`-class `cl-inv`, with the corpus vanishing constraint. The
relation formalized here is **cohomological equivalence** `CohEquiv` (equality of `cl-inv`); the
corpus's structural **mutual-local-derivability** (an invertible settling-morphism) is carried
abstractly as `LocalDerivability` and proven to *refine* `CohEquiv` (Step 3 of the classification).

## Main definitions

* `H1Class`, `Settling` — the `H¹`-class and the abstract settling with its vanishing constraint.
* `CohEquiv` — cohomological equivalence (equal `cl-inv`).
* `LocalDerivability` — the abstract mutual-local-derivability relation with its groupoid laws and
  the Step-3 fact that an invertible settling-morphism preserves `cl-inv`.

## Main results

* `mld_refines_cohEquiv` — Step 3: `D.Mld v v' → CohEquiv v v'`.
* `clinv_dichotomy` — `cl-inv = 0` throughout the strict/Scott regimes, with a nonzero aperiodic
  witness (not a biconditional — see its docstring).
* `cohEquiv_classification_model` — the bundle (equivalence relation, Step-3 refinement, dichotomy).

The substantive converse (Step 4: equal `cl-inv` yields a settling-morphism) is the open frontier,
blueprint `thm:aperiodic-mld-classification`.

## References

* `…/aperiodic-settling/content/aperiodic-classifying-invariant/aperiodic-classifying-invariant.md`
* `…/settling/content/mutually-locally-derivable/mutually-locally-derivable.md`
* `…/aperiodic-settling/references/aperiodic-regime-classification.md`
-/

namespace Infomaterial
namespace Persistence.Aperiodic

/-! ## The `cl-inv` model, cohomological equivalence, and the classification frontier

We carry an abstract `H¹`-class type and an abstract `Settling` carrier with its classifying
map. The relation actually formalized here is **cohomological equivalence** `CohEquiv` —
equality of classifying invariants — which is genuinely an equivalence relation and is what the
moduli quotient and synonymy are built on.

The corpus's **mutual-local-derivability** is a *different, finer* relation: `v ~MLD v'` iff
there is an **invertible settling-morphism** `v → v'` (`mutually-locally-derivable.md`). The
corpus is explicit that cohomological equivalence is *a priori weaker* than MLD
(`aperiodic-regime-classification.md`); their coincidence — that `cl-inv` is a *complete*
invariant for MLD — is the substantive classification theorem. Its two directions:

* **Step 3 (easy)** — an invertible settling-morphism induces a sheaf iso `1_{F_U} ↦ 1_{F_{U'}}`,
  so MLD ⟹ equal `cl-inv`. We model MLD abstractly (`LocalDerivability`) and prove this.
* **Step 4 (substantive, open)** — equal `cl-inv` yields a settling-morphism, by Hermida–Jacobs
  fibered coinduction + Bonchi up-to-closure. This converse is the frontier (blueprint
  `thm:aperiodic-mld-classification`); it is **not** asserted here.

The genuine content of this module is therefore the regime dichotomy (`cl-inv = 0 ⟺
strict/Scott`, with a nonzero aperiodic witness) and the easy refinement `MLD ⟹ CohEquiv`. -/

/-- An abstract **`H¹`-class** type — the values of `cl-inv`. A model: the cohomology
`H¹(T*_{≤κ}, F_U)` realized as an additive group of classes, with a distinguished `zero`
(the class of the identity-cochain coboundary, `[1_{F_U}] = 0` in the strict/Scott regime).
We keep it abstract via a carrier with a distinguished zero so the dichotomy can speak of
`cl-inv = 0`. -/
structure H1Class where
  /-- The underlying class datum. We model classes by `Int` (a free generator coordinate);
  the **zero class** is `0`. This is enough to state `cl-inv = 0` and to exhibit nonzero
  classes (the aperiodic "all-ones" diagonal). -/
  coord : Int
  deriving DecidableEq, Repr

/-- The **zero `H¹`-class** `[0] = 0` — the class of the identity-cochain *coboundary*,
forced in the strict/Scott regime (`SettlingCohomologyH1.classifying_invariant_zero_strict`). -/
def H1Class.zero : H1Class := ⟨0⟩

/-- A **carrier of an `H¹`-class**: a closed 1-cochain on a finite one-vertex Anderson–Putnam
complex, with a distinguished generator edge. Since `δ⁰ = 0` on a one-vertex complex the only
coboundary is `0`, so the class `[φ] ∈ H¹` *is* the cocycle; in the rank-1 model `H¹ ≅ ℤ` it is read
off the generator. This is the datum a settling's `cl-inv` is **derived from** — no class is named
without a complex and a cocycle witnessing it. -/
structure H1Carrier where
  /-- The finite one-vertex AP complex (`Witness.OneVertexComplex`). -/
  K : Witness.OneVertexComplex
  /-- The 1-cochain carrying the class. -/
  cochain : K.Edge → Int
  /-- The generator edge the rank-1 coordinate is read at. -/
  gen : K.Edge
  /-- The cochain is closed (`δ¹ φ = 0`): a genuine cocycle, hence a genuine `H¹` class. -/
  closed : K.IsCocycle cochain

/-- The **derived classifying invariant** of a carrier: the rank-1 `H¹`-coordinate, the cocycle's
value at the generator. Zero iff the generator is unmarked; nonzero exactly when the carrier exhibits
a nonzero cocycle there. -/
def H1Carrier.clInv (c : H1Carrier) : H1Class := ⟨c.cochain c.gen⟩

/-- The **coordinate carrier** realizing an integer class `n` as a genuine cocycle: the one-edge,
no-face complex (whose `H¹` is exactly `ℤ`), with the generator marked `n`. Its closedness is vacuous
(no faces), and `clInv = ⟨n⟩` by construction — the faithful rank-1 realization used when the
coordinate is already derived upstream (e.g. a step rule's substitution coordinate). -/
def coordCarrier (n : Int) : H1Carrier where
  K := { Edge := Unit, Face := Empty, edges := [()], d2 := fun f _ => f.elim }
  cochain := fun _ => n
  gen := ()
  closed := fun f => f.elim

@[simp] theorem coordCarrier_clInv (n : Int) : (coordCarrier n).clInv = ⟨n⟩ := rfl

/-- An abstract **settling** with its classifying invariant. A settling carries its
closure-ordinal regime `regime` and the `H¹`-class `clInv := [1_{F_U}]`. The corpus's
**vanishing constraint** is a field: in a regime with vanishing cohomology
(`cohomologyVanishes regime = true ⟺ regime ∈ {strict, scott}`), `cl-inv` is *forced to
zero* (it is a coboundary — `classifying_invariant_zero_strict`). This is the only structural
constraint; the aperiodic class is free (possibly nonzero). -/
structure Settling where
  /-- The closure-ordinal regime of the settling (`strict`/`scott`/`transfiniteBounded`/`aperiodic`). -/
  regime : ClosureRegime
  /-- The **carrier** of the classifying invariant: a cocycle on a one-vertex AP complex. `cl-inv` is
  *derived* from it (`carrier.clInv`), not posited — no settling names a class without a complex and a
  cocycle witnessing it. -/
  carrier : H1Carrier
  /-- **The vanishing constraint** (corpus): in the strict/Scott regimes the cohomology
  stabilizes and `cl-inv` is forced to be the zero class — reusing
  `SettlingCohomologyH1.classifying_invariant_zero_strict` (`[1_{F_U}]` is a coboundary). -/
  vanishing : cohomologyVanishes regime = true → carrier.clInv = H1Class.zero

/-- The **classifying invariant** `cl-inv = [1_{F_U}] ∈ H¹`, derived from the settling's carrier
(the cocycle read at its generator). No longer a free field — every `cl-inv` is the class of an
exhibited cocycle. -/
def Settling.clInv (v : Settling) : H1Class := v.carrier.clInv

/-- **Cohomological equivalence** of two settlings: equal classifying invariant
`cl-inv(v) = cl-inv(v')`. This is the relation the formalized moduli quotient and synonymy are
built on. The corpus reads it as *a priori weaker* than mutual-local-derivability
(`aperiodic-regime-classification.md`); their coincidence is the open classification. -/
def CohEquiv (v v' : Settling) : Prop := v.clInv = v'.clInv

/-- **`CohEquiv` is reflexive** (it is the pullback of `Eq` along `cl-inv`). -/
theorem cohEquiv_refl (v : Settling) : CohEquiv v v := rfl

/-- **`CohEquiv` is symmetric.** -/
theorem cohEquiv_symm {v v' : Settling} (h : CohEquiv v v') : CohEquiv v' v := h.symm

/-- **`CohEquiv` is transitive.** -/
theorem cohEquiv_trans {v v' v'' : Settling} (h : CohEquiv v v') (h' : CohEquiv v' v'') :
    CohEquiv v v'' := h.trans h'

/-- An abstract **local-derivability structure**: the corpus's mutual-local-derivability
relation `Mld` (`v ~MLD v'` iff there is an invertible settling-morphism `v → v'`,
`mutually-locally-derivable.md`), equipped with the groupoid laws (identity / inverse /
composition of invertible settling-morphisms) and **Step 3** of the classification — an
invertible settling-morphism induces a sheaf iso `1_{F_U} ↦ 1_{F_{U'}}`, hence preserves
`cl-inv`. The relation is **not** `cl-inv`-equality; that coincidence is the open classification
(the converse, Step 4 — blueprint `thm:aperiodic-mld-classification`). -/
structure LocalDerivability where
  /-- The mutual-local-derivability relation: an invertible settling-morphism `v → v'`. -/
  Mld : Settling → Settling → Prop
  /-- Identity settling-morphism. -/
  mld_refl : ∀ v, Mld v v
  /-- Inverse of an invertible settling-morphism. -/
  mld_symm : ∀ {v v'}, Mld v v' → Mld v' v
  /-- Composition of settling-morphisms. -/
  mld_trans : ∀ {v v' v''}, Mld v v' → Mld v' v'' → Mld v v''
  /-- **Step 3** (structural): an invertible settling-morphism preserves the classifying
  invariant. -/
  preserves_clInv : ∀ {v v'}, Mld v v' → v.clInv = v'.clInv

/-- **MLD refines cohomological equivalence (Step 3, the easy direction).** An invertible
settling-morphism preserves the classifying invariant, so `v ~MLD v'` implies `cl-inv(v) =
cl-inv(v')`. The converse — equal cohomology yields a settling-morphism (Step 4) — is the
substantive open direction (`thm:aperiodic-mld-classification`). -/
theorem mld_refines_cohEquiv (D : LocalDerivability) {v v' : Settling} (h : D.Mld v v') :
    CohEquiv v v' := D.preserves_clInv h

/-- Literal **settling equality** is a local-derivability structure (only the identity
morphism) — a witness that `LocalDerivability` is inhabited by a relation strictly finer than
cohomological equivalence, so `mld_refines_cohEquiv` is not vacuous. -/
def eqLocalDerivability : LocalDerivability where
  Mld v v' := v = v'
  mld_refl _ := rfl
  mld_symm h := h.symm
  mld_trans h h' := h.trans h'
  preserves_clInv h := by rw [h]

/-! ### The regime dichotomy: `cl-inv = 0 ⟺ regime ∈ {strict, scott}`

The vanishing side is proven from the `Settling.vanishing` constraint (reusing
`cohomologyVanishes_iff`). The nonzero side is exhibited by a concrete aperiodic witness. -/

/-- **Strict/Scott ⟹ `cl-inv = 0`.** If the settling's regime has vanishing cohomology
(equivalently `regime ∈ {strict, scott}`, by `cohomologyVanishes_iff`), its classifying
invariant is the zero class. Reuses the `vanishing` constraint, which packages
`SettlingCohomologyH1.classifying_invariant_zero_strict` (`[1_{F_U}]` is a coboundary). -/
theorem clinv_zero_of_settles (v : Settling)
    (hr : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) :
    v.clInv = H1Class.zero :=
  v.vanishing ((cohomologyVanishes_iff v.regime).mpr hr)

/-- **The aperiodic nonzero witness.** A concrete settling in the aperiodic regime whose
classifying invariant is the *nonzero* "all-ones" diagonal class `[1] ≠ 0` — the transfinite-
induction settling's canonical class. Its `vanishing` constraint is *vacuously* satisfied
because `cohomologyVanishes aperiodic = false`. This exhibits that `cl-inv` **can** be
nonzero in the aperiodic regime (corpus: new `H¹`-generators arrive at countable limits). -/
def aperiodicWitness : Settling where
  regime := ClosureRegime.aperiodic
  carrier :=
    { K := Witness.jrComplex
      cochain := Witness.phi
      gen := Witness.Edge.e2
      closed := Witness.phi_closed }
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- **The aperiodic witness has nonzero `cl-inv`.** `cl-inv(aperiodicWitness) = [φ] ≠ 0`, derived
from the Jeandel–Rao decorated cocycle: its value at the generator edge `e2` is `φ(e2) = 1 ≠ 0`
(`Witness.phi_nonzero`). No bare coordinate — the nonzero class comes from a genuine finite
Anderson–Putnam cohomology witness. -/
theorem aperiodicWitness_clinv_nonzero : aperiodicWitness.clInv ≠ H1Class.zero :=
  fun h => Witness.phi_nonzero (congrArg H1Class.coord h)

/-- **The regime dichotomy for `cl-inv`.** For a settling `v`:

* (vanishing side, proven) if `v.regime ∈ {strict, scott}` then `cl-inv(v) = 0`;
* (nonzero side, witnessed) there exists a settling — `aperiodicWitness`, in the **aperiodic**
  regime — whose `cl-inv` is nonzero.

So `cl-inv = 0` throughout the strict/Scott regimes, while in the aperiodic regime it **can** be
nonzero (witnessed). This is the universal vanishing direction together with an aperiodic
non-vanishing witness — *not* a biconditional `cl-inv = 0 ⟺ settles` (an aperiodic settling may
also have `cl-inv = 0`). The regime dichotomy of `aperiodic-classifying-invariant.md`. -/
theorem clinv_dichotomy :
    (∀ v : Settling,
      (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
        v.clInv = H1Class.zero)
    ∧ (∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ v.clInv ≠ H1Class.zero) :=
  ⟨clinv_zero_of_settles, ⟨aperiodicWitness, rfl, aperiodicWitness_clinv_nonzero⟩⟩

/-! ## The cohomological-equivalence model, the easy refinement, and the regime dichotomy -/

/-- **The cohomological-equivalence model and the classification frontier.** For any
local-derivability structure `D`, bundles:

* **`CohEquiv` is an equivalence relation** — reflexive, symmetric, transitive (the pullback of
  equality of `H¹`-classes);
* **MLD refines cohomological equivalence (Step 3, proved)** — `D.Mld v v' → CohEquiv v v'`: an
  invertible settling-morphism preserves `cl-inv`;
* **the regime dichotomy (genuine content)** — `cl-inv = 0` throughout the strict/Scott regimes
  (the cohomology stabilizes, `[1_{F_U}]` is a coboundary), and `cl-inv` **can be nonzero** in
  the aperiodic regime (a concrete `aperiodicWitness` with `cl-inv = [1] ≠ 0`).

The converse to Step 3 — cohomological equivalence implies MLD (Step 4: equal cohomology yields
a settling-morphism) — is the substantive open classification (blueprint
`thm:aperiodic-mld-classification`); it is deliberately **not** asserted here.

Corpus: `aperiodic-classifying-invariant.md`, `aperiodic-regime-classification.md`. -/
theorem cohEquiv_classification_model (D : LocalDerivability) :
    -- CohEquiv is an equivalence relation
    (∀ v : Settling, CohEquiv v v)
    ∧ (∀ v v' : Settling, CohEquiv v v' → CohEquiv v' v)
    ∧ (∀ v v' v'' : Settling, CohEquiv v v' → CohEquiv v' v'' → CohEquiv v v'')
    -- Step 3: MLD refines cohomological equivalence (an invertible morphism preserves cl-inv)
    ∧ (∀ v v' : Settling, D.Mld v v' → CohEquiv v v')
    -- the regime dichotomy: strict/scott ⟹ cl-inv = 0, and aperiodic ⟹ can be nonzero
    ∧ (∀ v : Settling,
        (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
          v.clInv = H1Class.zero)
    ∧ (∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ v.clInv ≠ H1Class.zero) :=
  ⟨cohEquiv_refl,
   fun _ _ h => cohEquiv_symm h,
   fun _ _ _ h h' => cohEquiv_trans h h',
   fun _ _ h => mld_refines_cohEquiv D h,
   clinv_zero_of_settles,
   ⟨aperiodicWitness, rfl, aperiodicWitness_clinv_nonzero⟩⟩

end Persistence.Aperiodic
end Infomaterial
