import Infomaterial.Persistence.Aperiodic.AndersonPutnam

/-!
# The inverse-limit hull `lim← stage` — the geometric dual of the Anderson–Putnam colimit

`AndersonPutnam` builds the **direct** limit `DirectedSystem.Colimit = lim→ stage` — the aperiodic
cohomology `H¹(Ω) ≅ lim→ (Ȟ(Γ) →^{ω*} ⋯)`. The **space** it is the cohomology *of* — the tiling
**hull** `Ω = lim← (Γ ←^{ω*} ⋯)` — is the dual *inverse* limit, and it was missing. This module
builds it: an `InverseSystem` (stages with *restriction* maps going down) and its hull as the type
of **threads** (coherent families), the inverse limit.

## Main definitions

* `InverseSystem`, `InverseSystem.Thread`, `InverseSystem.Hull` — the inverse system (dual of
  `DirectedSystem`: `proj : m ≤ n → stage n → stage m`) and its inverse limit (threads).
* `apHullSystem`, `constThread`, `seamMap` — the dual of `apSystem`: the constant `H1Class` inverse
  system, its (constant) threads, and the seam reading a thread to its `H¹`-class.

## Main results

* `Thread.ext` — a thread is determined by its values: the hull is a well-defined inverse limit.
* `hull_separated_by_stages` — **totally-disconnected separation** (the Cantor-type property dual to
  the colimit's eventual-equality): the finite-stage projections are jointly injective.
* `hull_pairs_clinv` — the seam `Hull → H1Class` is surjective and the aperiodic witness's **nonzero**
  class `[1] ≠ 0` is realized by a thread: the geometric hull carries the cohomological obstruction
  `cl-inv` that `AndersonPutnam` classifies. So the hull and the colimit are the two halves of one
  Anderson–Putnam node.

## Scope and frontier

This builds the inverse-limit hull and pairs it to `cl-inv`; the `apHullSystem` instance is the
*constant* (cohomology-valued, countable) hull whose threads are constant `H¹`-classes. The genuine
**uncountable Cantor** hull (the odometer `stage n = Fin n → Bool` with prefix restriction, whose
inverse limit is `2^ℕ`) and the conjectural **`hullLeaf ≅ Real`** accretion (the dense-ordered
metric continuum the residuation accretes on the leaf) are the red frontier — blueprint
`thm:bilattice-stable-top-conflict` / the `hullLeaf ≅ Real` node; they need the non-thin carrier and
the reals and are not asserted here.

## References

* `…/aperiodic-settling/commutating/content/aperiodic-nuclear-quartet-category/content/anderson-putnam-direct-limit/anderson-putnam-direct-limit.md`
-/

namespace Infomaterial
namespace Persistence.Aperiodic

/-! ## The inverse system and its hull (inverse limit) -/

/-- An **inverse system of finite-stage data** over `(Nat, ≤)` — the dual of `DirectedSystem`.
`stage τ` is the data at stage `τ`; `proj h : stage n → stage m` for `m ≤ n` is the **restriction**
from a later stage to an earlier one (the `ω*`-pullback / Anderson–Putnam bonding map). The functor
laws make it a genuine inverse system; its limit is the tiling hull. -/
structure InverseSystem where
  /-- The data at stage `τ`. -/
  stage : Nat → Type
  /-- The restriction (bonding) map `stage n → stage m` for `m ≤ n` — the `ω*`-pullback. -/
  proj : ∀ {m n : Nat}, m ≤ n → stage n → stage m
  /-- Functoriality at reflexivity: restricting along `n ≤ n` is the identity. -/
  proj_id : ∀ {n : Nat} (h : n ≤ n) (x : stage n), proj h x = x
  /-- Functoriality of composition: restricting `k → n → m` equals restricting `k → m`. -/
  proj_comp : ∀ {m n k : Nat} (hmn : m ≤ n) (hnk : n ≤ k) (hmk : m ≤ k) (x : stage k),
    proj hmn (proj hnk x) = proj hmk x

namespace InverseSystem
variable (S : InverseSystem)

/-- A **thread** of the inverse system: a coherent family `at_ : ∀ n, stage n` whose values are
compatible under restriction (`proj h (at_ n) = at_ m` for `m ≤ n`). The threads ARE the inverse
limit `lim← stage` — the tiling hull `Ω`. -/
structure Thread where
  /-- The value of the thread at each stage. -/
  at_ : ∀ n, S.stage n
  /-- Coherence: the value at a later stage restricts to the value at an earlier stage. -/
  coh : ∀ {m n : Nat} (h : m ≤ n), S.proj h (at_ n) = at_ m

/-- **The hull** `Ω = lim← stage` — the inverse limit, realized as the type of threads. The
geometric dual of `DirectedSystem.Colimit`. -/
def Hull : Type := S.Thread

/-- **A thread is determined by its values.** Two threads with the same value at every stage are
equal (the coherence fields are propositions). So the hull is a well-defined inverse limit. -/
theorem Thread.ext {t t' : S.Thread} (h : ∀ n, t.at_ n = t'.at_ n) : t = t' := by
  cases t with
  | mk a ca =>
    cases t' with
    | mk a' ca' =>
      have haa : a = a' := funext h
      subst haa
      rfl

/-- **The stage projection** `Hull → stage k`: read a thread at stage `k`. The cone leg of the
inverse limit. -/
def projAt (k : Nat) (t : S.Thread) : S.stage k := t.at_ k

/-- **The cone commutes.** Restricting the stage-`n` reading of a thread to stage `m` gives the
stage-`m` reading — the inverse-limit cone coherence. -/
theorem projAt_coh {m n : Nat} (h : m ≤ n) (t : S.Thread) :
    S.proj h (S.projAt n t) = S.projAt m t := t.coh h

/-- **Totally-disconnected separation (the Cantor-type property), constructively.** The stage
projections are *jointly injective*: two threads agreeing at every finite stage are equal. This is
the inverse-limit dual of the colimit's eventual-equality identification — where the colimit *glues*
representatives that eventually agree, the hull is *separated* by its finite-stage projections (the
finite-stage cylinders are a clopen separating family, the totally-disconnected / Cantor-style
topology of the hull). Stated as joint injectivity to stay constructive (the classical contrapositive
"distinct ⟹ differ at some finite stage" needs choice; this is its axiom-clean form). -/
theorem hull_separated_by_stages {t t' : S.Thread}
    (h : ∀ k, S.projAt k t = S.projAt k t') : t = t' :=
  Thread.ext (S := S) (fun k => h k)

end InverseSystem

/-! ## The constant `H1Class` hull — the dual of `apSystem`, pairing the hull to `cl-inv` -/

/-- **The constant Anderson–Putnam inverse system** (dual of `apSystem`): every stage carries the
same `H1Class` and the bonding map is the identity (the `ω*` self-map on the single classifying
generator). Its hull is the constant threads. -/
def apHullSystem : InverseSystem where
  stage _ := H1Class
  proj _ x := x
  proj_id _ _ := rfl
  proj_comp _ _ _ _ := rfl

/-- The **constant thread** at an `H¹`-class `c`: the value `c` at every stage (coherent since the
bonding map is the identity). -/
def constThread (c : H1Class) : apHullSystem.Thread where
  at_ _ := c
  coh _ := rfl

/-- **The seam** `Hull → H1Class`: read a thread of the constant system to its `H¹`-class (its value
at stage `0`). This is the map carrying a hull point to the cohomological class it represents. -/
def seamMap (t : apHullSystem.Thread) : H1Class := t.at_ 0

/-- The seam reads off the class of a constant thread. -/
@[simp] theorem seamMap_constThread (c : H1Class) : seamMap (constThread c) = c := rfl

/-- **The seam is surjective onto `H1Class`.** Every cohomology class is the seam of a (constant)
hull thread — the hull carries every value of `cl-inv`. -/
theorem seamMap_surjective : ∀ c : H1Class, ∃ t : apHullSystem.Thread, seamMap t = c :=
  fun c => ⟨constThread c, rfl⟩

/-- **The hull carries the aperiodic obstruction.** There is a hull thread whose seam is the
aperiodic witness's classifying invariant, and that class is **nonzero** (`[1] ≠ 0`). So the
inverse-limit hull realizes the nonzero `cl-inv` that `AndersonPutnam`'s colimit classifies — the
geometric and cohomological halves of the Anderson–Putnam node meet on the aperiodic witness. -/
theorem hull_pairs_clinv :
    ∃ t : apHullSystem.Thread, seamMap t = aperiodicWitness.clInv ∧ seamMap t ≠ H1Class.zero :=
  ⟨constThread aperiodicWitness.clInv, rfl, aperiodicWitness_clinv_nonzero⟩

/-- **The hull is non-trivial.** It has distinct threads (the constant threads at distinct classes),
separated by the stage-`0` projection (`seamMap`) — the hull is not a point. -/
theorem apHull_has_distinct_threads : ∃ t t' : apHullSystem.Thread, t ≠ t' :=
  ⟨constThread ⟨0⟩, constThread ⟨1⟩, fun h => by
    have hc : (⟨0⟩ : H1Class) = ⟨1⟩ := congrArg seamMap h
    exact absurd hc (by decide)⟩

end Persistence.Aperiodic
end Infomaterial
