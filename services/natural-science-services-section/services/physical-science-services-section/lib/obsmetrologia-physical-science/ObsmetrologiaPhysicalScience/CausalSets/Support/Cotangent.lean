import ObsmetrologiaPhysicalScience.CausalSets.Support.Causal

/-!
# Cotangent microsupport — the wavefront set in codirection space

`CausalMicrosupport` gives the base singular support: *which events* a section's influence reaches.
The Kashiwara–Schapira microsupport is richer — it lives in the **cotangent bundle** `T*M`, recording
not just where a section is singular but *in which codirection*. This module supplies the discrete
cotangent layer the light-cone frontier asks for.

The discrete covector is the **1-cochain**: in the Anderson–Putnam reading a causal set is a cochain
complex (`C⁰` events, `C¹` the direct causal edges, with coboundary `δ⁰ f = f(target) − f(source)`),
and a 1-cochain is an edge-value field — a discrete covector field. So:

* the **cotangent bundle** is `Codir C`, the directed causal edges `prec0`; these are the **null
  generators** — the discrete characteristic variety `σ(□) = 0`, as opposed to the full timelike cone;
* the **wavefront set** of an edge-cochain `φ` is its support (the codirections where `φ ≠ 0`) — a
  cotangent object, distinguishing two singularities at the same event but different edges;
* the **base singular support is the projection** `π(WF)`: an event is singular iff *some* codirection
  at it is in the wavefront — the discrete `WF(u) ↠ sing-supp(u)`;
* the wavefront is the **edge-support of the `cl-inv` cochain**: `φ` at a generator edge is the
  cl-inv coordinate (the `H1Carrier.clInv = ⟨cochain gen⟩` shape of the classification rewire), so a
  nonzero cl-inv forces a wavefront point, hence a singularity at its base — cohomological reading
  *is* cotangent microlocal data.

A **bridge, not an identity** with smooth microlocal sheaf theory: there is no symplectic cotangent
bundle here, only the causal order's edge incidence. What is captured is the codirection
layer, its characteristic confinement, the base projection, bicharacteristic propagation, and the
cl-inv/wavefront identification. The symplectic bicharacteristic *flow* and the literal AP-complex
identification stay frontier (`thm:cotangent-symplectic-flow`).

## Main definitions

* `Codir` — the discrete cotangent bundle: directed causal edges (null codirections).
* `EdgeCochain` / `delta0` / `IsCoboundary` — 1-cochains, the coboundary, exactness.
* `Wavefront` / `SingSupport` — the wavefront set and its base projection.

## Main results

* `codir_reaches` — a codirection points into the causal future (bicharacteristic step).
* `singSupport_iff_projection` — base singular support is the projection of the wavefront.
* `wavefront_empty_coboundary` — empty wavefront ⟹ the cochain is a (trivial) coboundary.
* `clinv_nonzero_singular` — nonzero cl-inv at a generator forces a singularity at its base.
* `cotangent_microsupport` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`; companion to `Obsmetrologia.CausalSets.Support.Causal` and
`Obsmetrologia.CausalSets.Support.Microlocal`. The cl-inv shape is `Obsmetrologia.AperiodicOrder.Tiling`'s `H1Carrier.clInv`.

## Tags

cotangent microsupport, wavefront set, codirection, characteristic variety, cl-inv, bicharacteristic
-/

namespace Obsmetrologia
namespace CausalSets.Support.Cotangent

open Obsmetrologia.CausalSets.Causal.Order

variable {E : Type} (C : CausalSet E)

/-! ## (A) The discrete cotangent bundle — directed causal edges as null codirections -/

/-- The **discrete cotangent bundle** `T*C`: the directed causal edges `prec0`. A codirection is a
direct causal link `(a, b)`; these are the **null generators** — the discrete characteristic variety
`σ(□) = 0` — not the full timelike cone (which is the transitive closure `reaches`). -/
def Codir : Type := { p : E × E // C.prec0 p.1 p.2 = true }

/-- The base event of a codirection (the bundle projection `π : T*C → C`). -/
def codSource (ξ : Codir C) : E := ξ.val.1

/-- The tip of a codirection (the event the null generator points to). -/
def codTarget (ξ : Codir C) : E := ξ.val.2

/-- **A codirection lies in the characteristic variety** — it is a direct causal edge by
construction. The wavefront, being a set of codirections, is therefore confined to the null
generators (KS: the singular support lies in the characteristic set). -/
theorem codir_characteristic (ξ : Codir C) : C.prec0 (codSource C ξ) (codTarget C ξ) = true :=
  ξ.property

/-- **A codirection points into the causal future** — its tip is reachable from its base by the
single null generator. This is the one-step bicharacteristic: a cotangent singularity propagates
along its edge into the cone. Chaining (via `reaches_trans`) is the discrete bicharacteristic flow,
whose base projection is `CausalMicrosupport`'s `causalClosure`. -/
theorem codir_reaches (ξ : Codir C) : C.reaches (codSource C ξ) (codTarget C ξ) := by
  show C.reaches ξ.val.1 ξ.val.2
  exact CausalSet.reaches.last ξ.property

/-! ## (B) 1-cochains, the coboundary, and the wavefront set -/

/-- A **1-cochain** (discrete covector field): an integer value on each codirection. -/
abbrev EdgeCochain : Type := Codir C → Int

/-- The **degree-0 coboundary** `δ⁰ f = f(target) − f(source)`: the discrete gradient along an edge.
A causal set with `δ⁰` is a cochain complex (`C⁰ = E → ℤ`, `C¹ = EdgeCochain`). -/
def delta0 (f : E → Int) : EdgeCochain C := fun ξ => f ξ.val.2 - f ξ.val.1

/-- A 1-cochain is **exact** (a coboundary) when it is the gradient of a 0-cochain — the trivial
`H¹` class. -/
def IsCoboundary (φ : EdgeCochain C) : Prop := ∃ f : E → Int, φ = delta0 C f

/-- The **wavefront set** of a 1-cochain: the codirections where it is nonzero — its support, a
conic subset of the cotangent bundle. -/
def Wavefront (φ : EdgeCochain C) : Codir C → Prop := fun ξ => φ ξ ≠ 0

/-- The **base singular support**: an event is singular iff some codirection at it is in the
wavefront — the projection `π(WF)` of the wavefront to the base. -/
def SingSupport (φ : EdgeCochain C) : E → Prop :=
  fun e => ∃ ξ : Codir C, codSource C ξ = e ∧ Wavefront C φ ξ

/-! ## (C) The base projection and the reading bridge -/

/-- **Base singular support is the projection of the wavefront** (`sing-supp = π(WF)`): an event is
singular exactly when some wavefront codirection sits over it. The cotangent layer determines the
base layer by forgetting the codirection. -/
theorem singSupport_iff_projection (φ : EdgeCochain C) (e : E) :
    SingSupport C φ e ↔ ∃ ξ : Codir C, codSource C ξ = e ∧ φ ξ ≠ 0 := Iff.rfl

/-- The wavefront is empty iff the cochain vanishes identically (no codirection carries reading). -/
theorem wavefront_empty_iff_zero (φ : EdgeCochain C) :
    (∀ ξ, ¬ Wavefront C φ ξ) ↔ φ = fun _ => 0 := by
  constructor
  · intro h
    funext ξ
    by_cases hz : φ ξ = 0
    · exact hz
    · exact absurd hz (h ξ)
  · intro h ξ hw
    rw [h] at hw
    exact hw rfl

/-- **Empty wavefront ⟹ trivial cohomology class.** A cochain with no wavefront vanishes, hence is
the zero coboundary `δ⁰ 0` — its `H¹` class is trivial. The microlocal/cohomology bridge: no singular
codirections means no cohomological obstruction (the cotangent analogue of
`CausalSets.Support.Microlocal.continuous_empty_singular_support`). -/
theorem wavefront_empty_coboundary (φ : EdgeCochain C) (h : ∀ ξ, ¬ Wavefront C φ ξ) :
    IsCoboundary C φ := by
  refine ⟨fun _ => 0, ?_⟩
  have hz : φ = fun _ => 0 := (wavefront_empty_iff_zero C φ).mp h
  funext ξ
  simp [delta0, hz]

/-- **Nonzero `cl-inv` forces a wavefront point.** A nonzero value of `φ` at a generator codirection
`gen` — the `cl-inv` coordinate, mirroring `H1Carrier.clInv = ⟨cochain gen⟩` — *is* membership of
`gen` in the wavefront. Cohomological reading is a cotangent microlocal datum, by definition. -/
theorem clinv_nonzero_wavefront (φ : EdgeCochain C) (gen : Codir C) (h : φ gen ≠ 0) :
    Wavefront C φ gen := h

/-- **Nonzero `cl-inv` forces a singularity at its base.** If the cl-inv coordinate `φ gen` is
nonzero, the event at the base of the generator edge is in the singular support — the cohomological
reading projects to a base singularity. This is the cl-inv ⟹ wavefront ⟹ sing-supp chain: a
nontrivial class cannot have empty singular support. -/
theorem clinv_nonzero_singular (φ : EdgeCochain C) (gen : Codir C) (h : φ gen ≠ 0) :
    SingSupport C φ (codSource C gen) :=
  ⟨gen, rfl, h⟩

/-! ## (D) The bundled headline -/

/-- **The cotangent microsupport.** The discrete cotangent layer of the causal cone:

* **characteristic confinement / bicharacteristic** — every codirection is a null generator pointing
  into the causal future (`codir_reaches`); singularities propagate along edges;
* **base projection** — the singular support is the projection of the wavefront
  (`singSupport_iff_projection`): the cotangent datum determines the base datum;
* **empty wavefront ⟹ trivial class** — no singular codirections means the cochain is a coboundary
  (`wavefront_empty_coboundary`);
* **cl-inv ⟹ singularity** — a nonzero cl-inv coordinate at a generator forces a base singularity
  (`clinv_nonzero_singular`): cohomological reading *is* cotangent microlocal data.

A bridge, not an identity: the symplectic bicharacteristic flow stays frontier. -/
theorem cotangent_microsupport :
    (∀ ξ : Codir C, C.reaches (codSource C ξ) (codTarget C ξ))
    ∧ (∀ (φ : EdgeCochain C) (e : E),
        SingSupport C φ e ↔ ∃ ξ : Codir C, codSource C ξ = e ∧ φ ξ ≠ 0)
    ∧ (∀ (φ : EdgeCochain C), (∀ ξ, ¬ Wavefront C φ ξ) → IsCoboundary C φ)
    ∧ (∀ (φ : EdgeCochain C) (gen : Codir C), φ gen ≠ 0 → SingSupport C φ (codSource C gen)) :=
  ⟨codir_reaches C,
   fun φ e => singSupport_iff_projection C φ e,
   fun φ h => wavefront_empty_coboundary C φ h,
   fun φ gen h => clinv_nonzero_singular C φ gen h⟩

end CausalSets.Support.Cotangent
end Obsmetrologia
