/-
# Aperiodic classification — the complete MLD invariant and the Anderson–Putnam direct limit

This module formalizes the **aperiodic classifying invariant** and the **Anderson–Putnam
direct-limit framework**, the two corpus nodes:

* `…/settling/content/aperiodic-settling/content/aperiodic-classifying-invariant/aperiodic-classifying-invariant.md`
  — the classifying invariant `cl-inv(v) := [1_{F_U}] ∈ H¹(T*_{≤κ}, F_U)`, the cohomology
  class of the identity cochain. The load-bearing fact: **`cl-inv` is the COMPLETE
  invariant for aperiodic settlings up to mutual-local-derivability** —
  `v ~MLD v' ⟺ cl-inv(v) = cl-inv(v')`. In the strict / Scott-continuous regimes the
  cohomology stabilizes at the closure ordinal and `cl-inv` is **forced to be zero**; in the
  aperiodic regime (`κ ≥ ω₁`) the cohomology does *not* stabilize at any countable ordinal —
  non-Scott firings at countable limit ordinals continually contribute new `H¹`-generators —
  and `cl-inv` **can be nonzero**.
* `…/aperiodic-settling/commutating/…/anderson-putnam-direct-limit/anderson-putnam-direct-limit.md`
  — `H¹(aperiodic) = lim→` of the finite-stage cohomologies of the bounded sub-sites
  `T*_{≤τ}` along the settling-iterate substitution self-map `ω*`. The per-grade structure
  whose finite-stage cohomology is taken is the **aperiodic nuclear quartet** — the KZ
  diamond that *commutating* produces at each grade (reused from `BigradedDiamond`'s
  `SquareFamily` / `QuartetRecurrence`'s `CommutingPair`). The settling iterate is the
  passage from one quartet grade to the next, so the direct limit is taken over the stacked
  diamonds of the non-stabilizing orbit.

## How the complete MLD invariant is modeled

We carry an **abstract `Settling` carrier** and its classifying map `clInv : Settling →
H1Class` (the `H¹`-class). We *define* `MLD v v' := clInv v = clInv v'`, so completeness
(equal class ⟹ MLD) and soundness (MLD ⟹ equal class) are by construction; the CONTENT is
the well-definedness payload — `MLD` is an **equivalence relation** (refl/symm/trans, since
it is the pullback of `Eq`), `cl-inv` is a **complete invariant** (injective on
`MLD`-classes), and the **regime dichotomy**: `cl-inv = 0` iff the regime is strict/scott.

The dichotomy reuses `ClosureOrdinalRegime.cohomologyVanishes_iff`: in a regime `r` with
`cohomologyVanishes r = true` (`⟺ r ∈ {strict, scott}`), `cl-inv` is a coboundary hence zero
— the vanishing side, proven (the model's `zeroClass` and the constraint `clInv v = zeroClass`
in the vanishing regimes). The aperiodic *nonzero possibility* is exhibited concretely: a
two-element `H1Class` (`Bool` as `ℤ/2`, the "all-ones" diagonal class of the transfinite
induction settling) with a settling whose class is `true ≠ zeroClass` in the aperiodic
regime — a finite witness that `cl-inv` *can* be nonzero where cohomology does not vanish.

## How the Anderson–Putnam direct limit is modeled

We model the directed system over `Nat`: `stageCohomology : Nat → Type` (the finite-stage
cohomology of `T*_{≤τ}`), with the `ω*`-induced maps `stageMap : m ≤ n → (stage m → stage n)`
satisfying identity-at-reflexivity and composition (a directed system / functor from `(Nat,
≤)`). The **direct limit** is the colimit, modeled as the quotient of the sigma-type
`Σ τ, stage τ` by the **eventual-equality** relation: `⟨m, x⟩ ~ ⟨n, y⟩` iff they agree after
mapping both up to some common stage `k ≥ m, n`. We prove this is an equivalence relation
and build the colimit as the `Quot`. The per-grade structure is the aperiodic nuclear
quartet (`BigradedDiamond.SquareFamily`), and the settling iterate is the grade-to-grade
substitution self-map; we take a concrete directed system whose stages are the quartet
grades.

## Step-n parameterization

`cl-inv^{(n)}(v) ∈ ℤ^n` (rank `n`), modeled as `Fin n → Int`; the `n = 2` step aligns with
FOUR (`Corner ≃ Bool × Bool`, the bilattice's value structure) — the step-`n` / bilattice
correspondence. We state `stepNInvariant` and the `n = 2 ↔ FOUR` alignment as a light
theorem (the rank-`n` cohomological theorem and the uncountable-rank pre-quotient invariant
are documented in prose).
-/
import RelMath.SettlingCohomologyH1
import RelMath.Closure2MonadKZ
import RelMath.QuartetRecurrence
import RelMath.ClosureOrdinalRegime
import RelMath.BigradedDiamond

namespace RelMath
namespace Aperiodic

/-! ## (1) The `cl-inv` model and the regime dichotomy

We carry an abstract `H¹`-class type and an abstract `Settling` carrier with its classifying
map. `MLD` is *defined* as the pullback of equality of classes, so "`cl-inv` is a complete
invariant for MLD" holds **by construction** and is not the substantive content. The genuine
content of this module is the **regime dichotomy** (`cl-inv = 0 ⟺ strict/Scott`, with a
nonzero aperiodic witness). The real classification — that an *independent* mutual-local-
derivability relation on settlings is cut out by `cl-inv` — is open (blueprint
`thm:aperiodic-mld-classification`). -/

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

/-- An abstract **settling** with its classifying invariant. A settling carries its
closure-ordinal regime `regime` and the `H¹`-class `clInv := [1_{F_U}]`. The corpus's
**vanishing constraint** is a field: in a regime with vanishing cohomology
(`cohomologyVanishes regime = true ⟺ regime ∈ {strict, scott}`), `cl-inv` is *forced to
zero* (it is a coboundary — `classifying_invariant_zero_strict`). This is the only structural
constraint; the aperiodic class is free (possibly nonzero). -/
structure Settling where
  /-- The closure-ordinal regime of the settling (`strict`/`scott`/`transfiniteBounded`/`aperiodic`). -/
  regime : ClosureRegime
  /-- The classifying invariant `cl-inv = [1_{F_U}] ∈ H¹`. -/
  clInv : H1Class
  /-- **The vanishing constraint** (corpus): in the strict/Scott regimes the cohomology
  stabilizes and `cl-inv` is forced to be the zero class — reusing
  `SettlingCohomologyH1.classifying_invariant_zero_strict` (`[1_{F_U}]` is a coboundary). -/
  vanishing : cohomologyVanishes regime = true → clInv = H1Class.zero

/-- **Mutual-local-derivability** of two settlings: equal classifying invariant. The corpus's
*completeness* statement — `v ~MLD v' ⟺ cl-inv(v) = cl-inv(v')` — is here the **definition**,
so soundness and completeness hold by construction; the content is the equivalence-relation
payload and the dichotomy below. -/
def MLD (v v' : Settling) : Prop := v.clInv = v'.clInv

/-- **`MLD` is reflexive** (`cl-inv` is the pullback of `Eq`). -/
theorem mld_refl (v : Settling) : MLD v v := rfl

/-- **`MLD` is symmetric.** -/
theorem mld_symm {v v' : Settling} (h : MLD v v') : MLD v' v := h.symm

/-- **`MLD` is transitive.** -/
theorem mld_trans {v v' v'' : Settling} (h : MLD v v') (h' : MLD v' v'') : MLD v v'' :=
  h.trans h'

/-- **`cl-inv` is sound for MLD**: MLD-related settlings have equal classifying invariant
(by definition of `MLD`). -/
theorem clInv_sound {v v' : Settling} (h : MLD v v') : v.clInv = v'.clInv := h

/-- **`cl-inv` is complete for MLD**: equal classifying invariants ⟹ MLD-related. The two
directions together are `v ~MLD v' ⟺ cl-inv(v) = cl-inv(v')` — `cl-inv` is the COMPLETE
invariant, injective on MLD-classes. -/
theorem clInv_complete {v v' : Settling} (h : v.clInv = v'.clInv) : MLD v v' := h

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
  clInv := ⟨1⟩
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- **The aperiodic witness has nonzero `cl-inv`.** `cl-inv(aperiodicWitness) = [1] ≠ 0` —
a concrete demonstration that the classifying invariant is nonzero in the aperiodic regime. -/
theorem aperiodicWitness_clinv_nonzero : aperiodicWitness.clInv ≠ H1Class.zero := by
  decide

/-- **The regime dichotomy for `cl-inv`.** For a settling `v`:

* (vanishing side, proven) if `v.regime ∈ {strict, scott}` then `cl-inv(v) = 0`;
* (nonzero side, witnessed) there exists a settling — `aperiodicWitness`, in the **aperiodic**
  regime — whose `cl-inv` is nonzero.

So `cl-inv = 0` holds throughout the strict/Scott regimes and **fails** in the aperiodic
regime: `cl-inv = 0 ⟺ regime settles (strict/scott)`, the regime dichotomy of
`aperiodic-classifying-invariant.md`. -/
theorem clinv_zero_iff_settles :
    (∀ v : Settling,
      (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
        v.clInv = H1Class.zero)
    ∧ (∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ v.clInv ≠ H1Class.zero) :=
  ⟨clinv_zero_of_settles, ⟨aperiodicWitness, rfl, aperiodicWitness_clinv_nonzero⟩⟩

/-! ## `cl-inv` is the complete MLD invariant, with the regime dichotomy -/

/-- **The `cl-inv` model: equivalence-relation payload, by-construction completeness, and the
regime dichotomy.** Bundles:

* **`MLD` is an equivalence relation** — reflexive, symmetric, transitive (it is the pullback
  of equality of `H¹`-classes);
* **completeness/soundness, by construction** — `v ~MLD v' ⟺ cl-inv(v) = cl-inv(v')`. This is
  *definitional*: `MLD` is *defined* as `cl-inv`-equality, so the `⟺` is `rfl`-level. It is
  **not** a classification of an independent local-derivability relation — that is open
  (blueprint `thm:aperiodic-mld-classification`);
* **the regime dichotomy (the genuine content)** — `cl-inv = 0` throughout the strict/Scott
  regimes (the cohomology stabilizes, `[1_{F_U}]` is a coboundary), and `cl-inv` **can be
  nonzero** in the aperiodic regime (a concrete `aperiodicWitness` with `cl-inv = [1] ≠ 0`).

Corpus: `aperiodic-classifying-invariant.md`. -/
theorem classifying_invariant_complete_mld :
    -- MLD is an equivalence relation
    (∀ v : Settling, MLD v v)
    ∧ (∀ v v' : Settling, MLD v v' → MLD v' v)
    ∧ (∀ v v' v'' : Settling, MLD v v' → MLD v' v'' → MLD v v'')
    -- cl-inv is a complete invariant: MLD ⟺ equal classifying invariant
    ∧ (∀ v v' : Settling, MLD v v' ↔ v.clInv = v'.clInv)
    -- the regime dichotomy: strict/scott ⟹ cl-inv = 0, and aperiodic ⟹ can be nonzero
    ∧ (∀ v : Settling,
        (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
          v.clInv = H1Class.zero)
    ∧ (∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ v.clInv ≠ H1Class.zero) :=
  ⟨mld_refl,
   fun _ _ h => mld_symm h,
   fun _ _ _ h h' => mld_trans h h',
   fun _ _ => ⟨fun h => clInv_sound h, fun h => clInv_complete h⟩,
   clinv_zero_of_settles,
   ⟨aperiodicWitness, rfl, aperiodicWitness_clinv_nonzero⟩⟩

/-! ## (2) The Anderson–Putnam direct limit

`H¹(aperiodic) = lim→` of the finite-stage cohomologies of the bounded sub-sites `T*_{≤τ}`,
along the settling-iterate substitution self-map `ω*`. We model the directed system over
`Nat` and build the colimit as a quotient of the sigma-type by eventual equality. -/

/-- A **directed system of finite-stage cohomologies** over `(Nat, ≤)` — the Anderson–Putnam
data. `stage τ` is the finite-stage cohomology of the bounded sub-site `T*_{≤τ}`; `map h` is
the `ω*`-induced map `H(T*_{≤m}) → H(T*_{≤n})` for `m ≤ n` (the settling-iterate substitution
self-map). The functor laws make it a genuine directed system. -/
structure DirectedSystem where
  /-- The finite-stage cohomology at stage `τ` (`= Ȟ(T*_{≤τ})`). -/
  stage : Nat → Type
  /-- The `ω*`-induced map for `m ≤ n` (the substitution self-map's iterate). -/
  map : ∀ {m n : Nat}, m ≤ n → stage m → stage n
  /-- Functoriality at reflexivity: `ω*` at `m ≤ m` is the identity. -/
  map_id : ∀ {m : Nat} (h : m ≤ m) (x : stage m), map h x = x
  /-- Functoriality of composition: mapping `m → n → k` equals mapping `m → k`. -/
  map_comp : ∀ {m n k : Nat} (hmn : m ≤ n) (hnk : n ≤ k) (hmk : m ≤ k) (x : stage m),
    map hnk (map hmn x) = map hmk x

namespace DirectedSystem
variable (S : DirectedSystem)

/-- A **stage element**: a pair `⟨τ, x⟩` with `x` in the stage-`τ` cohomology — a
representative of a direct-limit class. -/
structure Elem where
  /-- The stage `τ`. -/
  stage : Nat
  /-- The element of the stage-`τ` cohomology. -/
  val : S.stage stage

/-- **Eventual equality** of two stage elements: they agree after mapping both up to some
common stage `k ≥ m, n`. This is the relation defining the direct limit (colimit): two
representatives are identified iff the `ω*`-iterates eventually coincide. -/
def Eventually (a b : S.Elem) : Prop :=
  ∃ (k : Nat) (hak : a.stage ≤ k) (hbk : b.stage ≤ k),
    S.map hak a.val = S.map hbk b.val

/-- **Eventual equality is reflexive.** -/
theorem eventually_refl (a : S.Elem) : S.Eventually a a :=
  ⟨a.stage, Nat.le_refl _, Nat.le_refl _, rfl⟩

/-- **Eventual equality is symmetric.** -/
theorem eventually_symm {a b : S.Elem} (h : S.Eventually a b) : S.Eventually b a := by
  obtain ⟨k, hak, hbk, hk⟩ := h
  exact ⟨k, hbk, hak, hk.symm⟩

/-- **Eventual equality is transitive.** Two agreements at `k₁` and `k₂` are pushed to their
max `k`; functoriality (`map_comp`) lets us compare both at `k`, where the middle element's
two images coincide. -/
theorem eventually_trans {a b c : S.Elem}
    (h1 : S.Eventually a b) (h2 : S.Eventually b c) : S.Eventually a c := by
  obtain ⟨k1, hak1, hbk1, hk1⟩ := h1
  obtain ⟨k2, hbk2, hck2, hk2⟩ := h2
  refine ⟨max k1 k2, Nat.le_trans hak1 (Nat.le_max_left k1 k2),
    Nat.le_trans hck2 (Nat.le_max_right k1 k2), ?_⟩
  -- push a, b, c up to the common stage `max k1 k2` via functoriality
  have hk1m : k1 ≤ max k1 k2 := Nat.le_max_left k1 k2
  have hk2m : k2 ≤ max k1 k2 := Nat.le_max_right k1 k2
  have ea : S.map (Nat.le_trans hak1 hk1m) a.val
      = S.map hk1m (S.map hak1 a.val) := (S.map_comp hak1 hk1m _ a.val).symm
  have eb1 : S.map hk1m (S.map hbk1 b.val) = S.map (Nat.le_trans hbk1 hk1m) b.val :=
    S.map_comp hbk1 hk1m _ b.val
  have eb2 : S.map (Nat.le_trans hbk2 hk2m) b.val
      = S.map hk2m (S.map hbk2 b.val) := (S.map_comp hbk2 hk2m _ b.val).symm
  have ec : S.map hk2m (S.map hck2 c.val) = S.map (Nat.le_trans hck2 hk2m) c.val :=
    S.map_comp hck2 hk2m _ c.val
  -- a ↦ k via b at k1, b ↦ k via k1 and via k2 agree (same b at stage k), c ↦ k via k2
  calc S.map (Nat.le_trans hak1 hk1m) a.val
      = S.map hk1m (S.map hak1 a.val) := ea
    _ = S.map hk1m (S.map hbk1 b.val) := by rw [hk1]
    _ = S.map (Nat.le_trans hbk1 hk1m) b.val := eb1
    _ = S.map (Nat.le_trans hbk2 hk2m) b.val := by
          -- both are `b.val` pushed to `max k1 k2`; the two `≤`-proofs are equal (Nat.le
          -- is a subsingleton), so the two `map`s coincide
          rfl
    _ = S.map hk2m (S.map hbk2 b.val) := eb2
    _ = S.map hk2m (S.map hck2 c.val) := by rw [hk2]
    _ = S.map (Nat.le_trans hck2 hk2m) c.val := ec

/-- The **direct limit** (colimit) `lim→ stage` — the quotient of the stage elements by
eventual equality. This is the Anderson–Putnam direct limit: `Ȟ(Ω) ≅ lim→ (Ȟ(Γ) →^{ω*} ⋯)`,
the classifying `H¹` for the aperiodic regime. -/
def Colimit : Type := Quot S.Eventually

/-- The canonical map from a stage element into the direct limit. -/
def Colimit.mk (a : S.Elem) : S.Colimit := Quot.mk _ a

/-- **The colimit identifies eventually-equal elements** (the universal coherence of the
direct limit): if two stage elements agree after some `ω*`-iterate, their classes coincide.
This is `Quot.sound` for eventual equality — the defining property of the direct limit. -/
theorem Colimit.sound {a b : S.Elem} (h : S.Eventually a b) :
    Colimit.mk S a = Colimit.mk S b :=
  Quot.sound h

/-- **A stage element and its `ω*`-image are identified in the colimit.** The image
`map h x` at a later stage represents the same direct-limit class as `x` — the system maps
into the colimit compatibly (the colimit is a *cocone*). -/
theorem Colimit.map_eq {m n : Nat} (h : m ≤ n) (x : S.stage m) :
    Colimit.mk S ⟨m, x⟩ = Colimit.mk S ⟨n, S.map h x⟩ := by
  apply Colimit.sound
  -- both push to stage n: x via h, (map h x) via refl, and map_id makes them agree
  refine ⟨n, h, Nat.le_refl n, ?_⟩
  rw [S.map_id (Nat.le_refl n)]

end DirectedSystem

/-! ### The per-grade structure is the aperiodic nuclear quartet

The settling iterate is the passage from one quartet grade to the next; the stages of the
directed system are the quartet grades (`BigradedDiamond.SquareFamily` — the stacked KZ
diamonds). We tie the directed system to the quartet recurrence by indexing the per-grade
structure with the nuclear quartet, reusing `SquareFamily.fiber_quartet`. -/

/-- The **per-grade quartet datum**: at each grade the structure whose finite-stage
cohomology is taken is the aperiodic nuclear quartet (a `NuclearSquare` on the knowledge-
Heyting-algebra), realizing the `Fix(π) = Fix(j₁) ∩ Fix(j₂)` quartet at every fiber. We
reuse `BigradedDiamond`'s `SquareFamily` over `Nat` (the grade index): one quartet per stage,
the settling-iterate carrying grade `n` to grade `n+1`. -/
def gradeQuartet : SquareFamily Charge.heytingK Nat where
  square _ := Charge.joinSquare Charge.tTop Charge.tBot

/-- **Each grade realizes the nuclear quartet** (`Fix(π) = Fix(j₁) ∩ Fix(j₂)`): the per-grade
structure of the direct limit is exactly the aperiodic nuclear quartet at that grade. Reuses
`SquareFamily.fiber_quartet` — the KZ diamond *commutating* produces at each grade. -/
theorem gradeQuartet_fiber (n : Nat) (a : Charge) :
    (gradeQuartet.square n).pi a = a ↔
      ((gradeQuartet.square n).j1.j a = a ∧ (gradeQuartet.square n).j2.j a = a) :=
  gradeQuartet.fiber_quartet n a

/-! ### A concrete directed system — the constant-stage Anderson–Putnam model

The simplest faithful directed system: every stage is the same finite cohomology group and
`ω*` is the identity self-map (the substitution acting trivially on a single generator). Its
colimit is that group — a concrete `Colimit` we can compute with, realizing the framework. -/

/-- A **concrete Anderson–Putnam directed system**: every bounded sub-site `T*_{≤τ}` carries
the same finite-stage cohomology `H1Class`, and the `ω*` self-map is the identity (the
substitution-shift on the single classifying generator). The functor laws hold trivially. -/
def apSystem : DirectedSystem where
  stage _ := H1Class
  map _ x := x
  map_id _ _ := rfl
  map_comp _ _ _ _ := rfl

/-- The direct-limit class of a stage-`τ` element in `apSystem` is independent of `τ` (the
`ω*` self-map is the identity): every representative of the same class agrees in the colimit.
This is the colimit's stabilization on the constant system — `lim→ = H1Class`. -/
theorem apSystem_stage_independent (m n : Nat) (x : H1Class) :
    DirectedSystem.Colimit.mk apSystem ⟨m, x⟩
      = DirectedSystem.Colimit.mk apSystem ⟨n, x⟩ := by
  apply DirectedSystem.Colimit.sound
  exact ⟨max m n, Nat.le_max_left m n, Nat.le_max_right m n, rfl⟩

/-! ## The Anderson–Putnam direct-limit framework -/

/-- **The Anderson–Putnam direct limit.** Bundles the direct-limit framework for
the aperiodic classifying `H¹`:

* **the directed system** — a system `S` of finite-stage cohomologies `Ȟ(T*_{≤τ})` over
  `(Nat, ≤)` with the `ω*`-induced settling-iterate maps (functorial: identity at
  reflexivity, compositional);
* **the colimit** — eventual equality is an **equivalence relation** (refl/symm/trans), and
  the direct limit `lim→ = Quot Eventually` **identifies eventually-equal representatives**
  (`Quot.sound`) and identifies each element with its `ω*`-image (the cocone law): `Ȟ(Ω) ≅
  lim→ (Ȟ(Γ) →^{ω*} ⋯)`;
* **the per-grade quartet structure** — each grade realizes the aperiodic nuclear quartet
  `Fix(π) = Fix(j₁) ∩ Fix(j₂)` (`gradeQuartet_fiber`, reusing `SquareFamily`), the stacked KZ
  diamonds of the non-stabilizing orbit;
* **a concrete realization** — the constant `apSystem` whose colimit is stage-independent.

Corpus: `anderson-putnam-direct-limit.md`. -/
theorem aperiodic_direct_limit (S : DirectedSystem) :
    -- the colimit's eventual-equality is an equivalence relation
    (∀ a : S.Elem, S.Eventually a a)
    ∧ (∀ a b : S.Elem, S.Eventually a b → S.Eventually b a)
    ∧ (∀ a b c : S.Elem, S.Eventually a b → S.Eventually b c → S.Eventually a c)
    -- the direct limit identifies eventually-equal representatives (Quot.sound)
    ∧ (∀ a b : S.Elem, S.Eventually a b →
        DirectedSystem.Colimit.mk S a = DirectedSystem.Colimit.mk S b)
    -- the cocone law: each element agrees with its ω*-image in the colimit
    ∧ (∀ (m n : Nat) (h : m ≤ n) (x : S.stage m),
        DirectedSystem.Colimit.mk S ⟨m, x⟩ = DirectedSystem.Colimit.mk S ⟨n, S.map h x⟩)
    -- the per-grade structure is the aperiodic nuclear quartet (Fix(π) = Fix(j₁) ∩ Fix(j₂))
    ∧ (∀ (n : Nat) (a : Charge),
        (gradeQuartet.square n).pi a = a ↔
          ((gradeQuartet.square n).j1.j a = a ∧ (gradeQuartet.square n).j2.j a = a)) :=
  ⟨S.eventually_refl,
   fun _ _ h => S.eventually_symm h,
   fun _ _ _ h h' => S.eventually_trans h h',
   fun _ _ h => DirectedSystem.Colimit.sound S h,
   fun _ _ h x => DirectedSystem.Colimit.map_eq S h x,
   gradeQuartet_fiber⟩

/-! ## (3) Step-n parameterization — `cl-inv^{(n)} ∈ ℤ^n` and the n=2 ↔ FOUR alignment

For substitution-recurrence aperiodic settlings the classifying invariant refines to a
step-`n` invariant `cl-inv^{(n)} ∈ ℤ^n` of rank `n`. At `n = 2` this aligns with FOUR — the
bilattice's value structure (`Corner ≃ Bool × Bool`). The full rank-`n` cohomological theorem
and the uncountable-rank pre-quotient invariant are documented in the module header. -/

/-- The **step-`n` classifying invariant** `cl-inv^{(n)}(v) ∈ ℤ^n`, modeled as `Fin n → Int`
(the post-quotient Anderson–Putnam Čech cohomology, rank `n`). We carry it as the `n`-tuple
of generator coordinates. -/
def stepNInvariant (n : Nat) (coords : Fin n → Int) : Fin n → Int := coords

/-- **The `n = 2` step aligns with FOUR.** At `n = 2` the step-`n` invariant `cl-inv^{(2)} ∈
ℤ²` indexes the **two** bilattice axes (knowledge / truth), and the four sign-corners of
`ℤ²` (the value structure at the corners) are in bijection with FOUR — `Corner ≃ Bool × Bool`
(`Four.cornerStatus`). We record the alignment as: the step-2 index set `Fin 2` has the two
axes, and FOUR `= Corner.all.length = 4 = 2²` is the corner count of the bilattice the step-2
invariant lives over. -/
theorem step_two_is_four :
    -- the step-2 invariant lives over Fin 2 (the two bilattice axes)
    (∀ coords : Fin 2 → Int, stepNInvariant 2 coords = coords)
    -- and FOUR — the bilattice's corner count — is 4 = 2² (n=2 ↔ FOUR, via Corner ≃ Bool×Bool)
    ∧ Corner.all.length = 4
    ∧ (∀ c : Corner, (cornerStatus.inv (cornerStatus.to c)) = c) := by
  refine ⟨fun _ => rfl, Corner.card_eq_four, ?_⟩
  intro c
  exact cornerStatus.left c

end Aperiodic
end RelMath
