import Infomaterial.Relational.Spacetime.Support.Cotangent

/-!
# Causal cohomology — the order-complex cochain complex of a causal set

`CotangentMicrosupport` gave the degree-0 coboundary `δ⁰` on direct edges but did nothing
cohomological with it — no `δ¹`, no cocycle condition, no `H¹`. This module supplies the missing
complex: the **order complex** (nerve) of the causal poset, with its `C⁰ → C¹ → C²` cochain complex,
the fundamental identity `δ¹ ∘ δ⁰ = 0`, and the `H¹` obstruction in which the `cl-inv` class lives.

A causal set is a poset; its nerve has simplices = causal chains. We take:

* `C⁰` = integer functions on events;
* `C¹` = integer functions on causal pairs `a ≤ b` (the 1-simplices);
* `C²` = integer functions on composable triples `a ≤ b ≤ c` (the 2-simplices, with `a ≤ c` by
  transitivity);

with the simplicial coboundaries `δ⁰ f (a,b) = f b − f a` and
`δ¹ φ (a,b,c) = φ(b,c) − φ(a,c) + φ(a,b)`. The defining identity `δ¹(δ⁰ f) = 0` telescopes. A
**cocycle** is a closed 1-cochain (`δ¹ φ = 0`), a **coboundary** is an exact one (`φ = δ⁰ f`); every
coboundary is a cocycle, and `H¹ = ` cocycles / coboundaries is the genuine obstruction — it **can** be
nonzero (that is the `cl-inv` class; finite causal sets are not order-complex-acyclic in general).

This is the explicit, in-the-causal-set version of the abstract Čech `H¹` of
`Cohomology.SettlingCohomologyH1` / `Cohomology.AlexandrovHusainov`, and it grounds
`CotangentMicrosupport`'s wavefront: the wavefront of a `cl-inv` cocycle is its support, and an
**empty wavefront forces a trivial class**. No free data — the simplices are thin subtypes of
`Spacetime.Causal.Cone.CausalLe`, the identities are `omega` over `ℤ`.

## Main definitions

* `OneSimplex` / `TwoSimplex` — the causal 1- and 2-simplices (the order complex).
* `delta0` / `delta1` — the simplicial coboundaries `C⁰ → C¹ → C²`.
* `Cocycle` / `Coboundary` — closed and exact 1-cochains.
* `Wavefront` — the support of a 1-cochain.

## Main results

* `delta1_delta0` — the fundamental identity `δ¹ ∘ δ⁰ = 0`.
* `coboundary_cocycle` — every coboundary is a cocycle.
* `wavefront_empty_coboundary` — an empty wavefront forces a (trivial) coboundary class.
* `causal_cochain_complex` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Infomaterial.Relational.Spacetime.Support.Cotangent`;
the explicit order-complex companion of `Infomaterial.Cohomology.SettlingCohomologyH1`.

## Tags

causal cohomology, order complex, nerve, cochain complex, coboundary, cocycle, cl-inv, wavefront
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Cohomology

open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Causal.Cone

variable {E : Type} (C : CausalSet E)

/-! ## (A) The order complex — simplices of the causal nerve -/

/-- A **causal 1-simplex**: an ordered causally-related pair `a ≤ b`. -/
def OneSimplex : Type := { p : E × E // CausalLe C p.1 p.2 }

/-- A **causal 2-simplex**: a composable chain `a ≤ b ≤ c` (its third edge `a ≤ c` is forced by
transitivity). -/
def TwoSimplex : Type := { t : E × E × E // CausalLe C t.1 t.2.1 ∧ CausalLe C t.2.1 t.2.2 }

/-- The leading edge `(a,b)` of a 2-simplex `a ≤ b ≤ c`. -/
def edge01 (t : TwoSimplex C) : OneSimplex C := ⟨(t.val.1, t.val.2.1), t.property.1⟩

/-- The trailing edge `(b,c)` of a 2-simplex `a ≤ b ≤ c`. -/
def edge12 (t : TwoSimplex C) : OneSimplex C := ⟨(t.val.2.1, t.val.2.2), t.property.2⟩

/-- The long edge `(a,c)` of a 2-simplex `a ≤ b ≤ c` — present by transitivity of the causal order. -/
def edge02 (t : TwoSimplex C) : OneSimplex C :=
  ⟨(t.val.1, t.val.2.2), causalLe_trans C t.property.1 t.property.2⟩

/-! ## (B) The cochain groups and coboundaries -/

/-- Degree-0 cochains: integer functions on events. -/
abbrev C0 (_C : CausalSet E) : Type := E → Int

/-- Degree-1 cochains: integer functions on causal pairs. -/
abbrev C1 (C : CausalSet E) : Type := OneSimplex C → Int

/-- Degree-2 cochains: integer functions on composable causal triples. -/
abbrev C2 (C : CausalSet E) : Type := TwoSimplex C → Int

/-- The **degree-0 coboundary** `δ⁰ f (a,b) = f b − f a` — the discrete gradient. -/
def delta0 (f : C0 C) : C1 C := fun e => f e.val.2 - f e.val.1

/-- The **degree-1 coboundary** `δ¹ φ (a,b,c) = φ(b,c) − φ(a,c) + φ(a,b)` — the simplicial alternating
sum over the faces of a 2-simplex. -/
def delta1 (φ : C1 C) : C2 C :=
  fun t => φ (edge12 C t) - φ (edge02 C t) + φ (edge01 C t)

/-! ## (C) The fundamental identity and cocycles -/

/-- **`δ¹ ∘ δ⁰ = 0`** — the defining identity of the cochain complex: applying `δ¹` to a gradient
telescopes to zero, `(f c − f b) − (f c − f a) + (f b − f a) = 0`. -/
theorem delta1_delta0 (f : C0 C) : delta1 C (delta0 C f) = fun _ => 0 := by
  funext t
  simp only [delta1, delta0, edge01, edge12, edge02]
  omega

/-- A 1-cochain is a **cocycle** (closed) when `δ¹` annihilates it. -/
def Cocycle (φ : C1 C) : Prop := delta1 C φ = fun _ => 0

/-- A 1-cochain is a **coboundary** (exact) when it is the gradient of a 0-cochain. -/
def Coboundary (φ : C1 C) : Prop := ∃ f : C0 C, φ = delta0 C f

/-- **Every coboundary is a cocycle** — `δ¹ ∘ δ⁰ = 0`, so exact cochains are closed. This is the
inclusion `im δ⁰ ⊆ ker δ¹` whose quotient is `H¹`. -/
theorem coboundary_cocycle {φ : C1 C} (h : Coboundary C φ) : Cocycle C φ := by
  obtain ⟨f, rfl⟩ := h
  exact delta1_delta0 C f

/-! ## (D) The wavefront and the obstruction bridge -/

/-- The **wavefront set** of a 1-cochain: the causal pairs where it is nonzero (its support) — the
order-complex companion of `Spacetime.Support.Cotangent.Wavefront` on the full causal order. -/
def Wavefront (φ : C1 C) : OneSimplex C → Prop := fun e => φ e ≠ 0

/-- **An empty wavefront forces a trivial class.** A 1-cochain with no wavefront vanishes, hence is
the zero coboundary `δ⁰ 0`: its `H¹` class is trivial. Contrapositive — a nontrivial cohomology
class (a `cl-inv ≠ 0`) has a nonempty wavefront: cohomological charge forces a singular causal pair.
This is the microlocal/cohomology bridge on the causal set's own complex. -/
theorem wavefront_empty_coboundary {φ : C1 C} (h : ∀ e, ¬ Wavefront C φ e) : Coboundary C φ := by
  have hz : φ = fun _ => 0 := by
    funext e
    by_cases he : φ e = 0
    · exact he
    · exact absurd he (h e)
  refine ⟨fun _ => 0, ?_⟩
  funext e
  simp [delta0, hz]

/-- A nonzero `cl-inv` coordinate at a causal pair `e` **is** membership of `e` in the wavefront —
the cohomological charge is the microlocal datum. -/
theorem clinv_nonzero_wavefront {φ : C1 C} (e : OneSimplex C) (h : φ e ≠ 0) : Wavefront C φ e := h

/-! ## (E) The bundled headline -/

/-- **The causal order complex is a cochain complex.** The causal poset's nerve carries
`C⁰ → C¹ → C²` with the simplicial coboundaries, satisfying:

* **`δ¹ ∘ δ⁰ = 0`** (`delta1_delta0`) — the defining cochain identity, telescoping over `ℤ`;
* **coboundaries are cocycles** (`coboundary_cocycle`) — `im δ⁰ ⊆ ker δ¹`, so `H¹` is well-defined as
  the quotient, the genuine obstruction in which the `cl-inv` class lives;
* **empty wavefront ⟹ trivial class** (`wavefront_empty_coboundary`) — a `cl-inv` with no singular
  causal pair is a coboundary; contrapositively a nonzero `cl-inv` forces a wavefront point.

This is the explicit, in-the-causal-set realization of the abstract Čech `H¹`, grounding the
`cl-inv` (a 1-cocycle class) and the wavefront (its support) on one complex. -/
theorem causal_cochain_complex :
    (∀ f : C0 C, delta1 C (delta0 C f) = fun _ => 0)
    ∧ (∀ φ : C1 C, Coboundary C φ → Cocycle C φ)
    ∧ (∀ φ : C1 C, (∀ e, ¬ Wavefront C φ e) → Coboundary C φ) :=
  ⟨delta1_delta0 C,
   fun _ h => coboundary_cocycle C h,
   fun _ h => wavefront_empty_coboundary C h⟩

end Relational.Spacetime.Causal.Cohomology
end Infomaterial
