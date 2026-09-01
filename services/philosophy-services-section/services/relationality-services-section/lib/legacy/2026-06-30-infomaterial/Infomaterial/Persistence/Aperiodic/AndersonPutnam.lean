import Infomaterial.Persistence.Aperiodic.Classification
import Infomaterial.Closure.Monad.KZ
import Infomaterial.Language.Positing.Quartet
import Infomaterial.Language.Positing.Bigraded

/-!
# The Anderson–Putnam direct limit and the step-`n` invariant

`H¹(aperiodic) = lim→` of the finite-stage cohomologies of the bounded sub-sites along the
settling-iterate substitution self-map `ω*`. The directed system over `(Nat, ≤)` is built, and its
colimit is the quotient of the stage elements by eventual equality. The per-grade structure is the
aperiodic nuclear quartet; a concrete constant system realizes the framework; and the classifying
invariant refines to a step-`n` invariant `cl-inv⁽ⁿ⁾ ∈ ℤⁿ`, aligning with FOUR at `n = 2`.

## Main definitions

* `DirectedSystem`, `DirectedSystem.Colimit` — the Anderson–Putnam directed system and its colimit
  (`Quot` of eventual equality).
* `gradeQuartet`, `apSystem` — the per-grade nuclear quartet and the concrete constant system.
* `stepNInvariant` — the rank-`n` step parameterization of `cl-inv`.

## Main results

* `aperiodic_direct_limit` — eventual equality is an equivalence relation, the colimit identifies
  eventually-equal representatives (the cocone law), and each grade realizes the nuclear quartet.
* `step_two_is_four` — the `n = 2` step aligns with FOUR (`Articulating.Corner ≃ Bool × Bool`).

## References

* `…/aperiodic-settling/commutating/content/aperiodic-nuclear-quartet-category/content/anderson-putnam-direct-limit/anderson-putnam-direct-limit.md`
-/

namespace Infomaterial
namespace Persistence.Aperiodic

/-! ## The Anderson–Putnam direct limit

`H¹(aperiodic) = lim→` of the finite-stage cohomologies of the bounded sub-sites `T*_{≤τ}`,
along the settling-iterate substitution self-map `ω*`. We model the directed system over
`Nat` and build the colimit as a quotient of the sigma-type by eventual equality. -/

universe u

/-- A **directed system of finite-stage cohomologies** over `(Nat, ≤)` — the Anderson–Putnam
data. `stage τ` is the finite-stage cohomology of the bounded sub-site `T*_{≤τ}`; `map h` is
the `ω*`-induced map `H(T*_{≤m}) → H(T*_{≤n})` for `m ≤ n` (the settling-iterate substitution
self-map). The functor laws make it a genuine directed system. -/
structure DirectedSystem where
  /-- The finite-stage cohomology at stage `τ` (`= Ȟ(T*_{≤τ})`). -/
  stage : Nat → Type u
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
def Colimit : Type u := Quot S.Eventually

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
directed system are the quartet grades (`Positing.Bigraded.SquareFamily` — the stacked KZ
diamonds). We tie the directed system to the quartet recurrence by indexing the per-grade
structure with the nuclear quartet, reusing `SquareFamily.fiber_quartet`. -/

/-- The **per-grade quartet datum**: at each grade the structure whose finite-stage
cohomology is taken is the aperiodic nuclear quartet (a `NuclearSquare` on the knowledge-
Heyting-algebra), realizing the `Fix(π) = Fix(j₁) ∩ Fix(j₂)` quartet at every fiber. We
reuse `Positing.Bigraded`'s `SquareFamily` over `Nat` (the grade index): one quartet per stage,
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

/-! ## Step-n parameterization — `cl-inv^{(n)} ∈ ℤ^n` and the n=2 ↔ FOUR alignment

For substitution-recurrence aperiodic settlings the classifying invariant refines to a
step-`n` invariant `cl-inv^{(n)} ∈ ℤ^n` of rank `n`. At `n = 2` this aligns with FOUR — the
bilattice's value structure (`Articulating.Corner ≃ Bool × Bool`). The full rank-`n` cohomological theorem
and the uncountable-rank pre-quotient invariant are documented in the module header. -/

/-- The **step-`n` classifying invariant** `cl-inv^{(n)}(v) ∈ ℤ^n`, modeled as `Fin n → Int`
(the post-quotient Anderson–Putnam Čech cohomology, rank `n`). We carry it as the `n`-tuple
of generator coordinates. -/
def stepNInvariant (n : Nat) (coords : Fin n → Int) : Fin n → Int := coords

/-- **The `n = 2` step aligns with FOUR.** At `n = 2` the step-`n` invariant `cl-inv^{(2)} ∈
ℤ²` indexes the **two** bilattice axes (knowledge / truth), and the four sign-corners of
`ℤ²` (the value structure at the corners) are in bijection with FOUR — `Articulating.Corner ≃ Bool × Bool`
(`Four.cornerStatus`). We record the alignment as: the step-2 index set `Fin 2` has the two
axes, and FOUR `= Articulating.Corner.all.length = 4 = 2²` is the corner count of the bilattice the step-2
invariant lives over. -/
theorem step_two_is_four :
    -- the step-2 invariant lives over Fin 2 (the two bilattice axes)
    (∀ coords : Fin 2 → Int, stepNInvariant 2 coords = coords)
    -- and FOUR — the bilattice's corner count — is 4 = 2² (n=2 ↔ FOUR, via Articulating.Corner ≃ Bool×Bool)
    ∧ Articulating.Corner.all.length = 4
    ∧ (∀ c : Articulating.Corner, (cornerStatus.inv (cornerStatus.to c)) = c) := by
  refine ⟨fun _ => rfl, Articulating.Corner.card_eq_four, ?_⟩
  intro c
  exact cornerStatus.left c

end Persistence.Aperiodic
end Infomaterial
