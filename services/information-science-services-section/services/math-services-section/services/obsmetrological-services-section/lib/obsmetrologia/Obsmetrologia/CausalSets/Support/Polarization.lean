import Obsmetrologia.Calculus.Order.GraphColoring
import Obsmetrologia.CausalSets.Causal.Cohomology

/-!
# Causal polarization — the symplectic conjugate split as a proper colouring

The symplectic structure on a cotangent bundle needs a **polarization**: a splitting into conjugate
directions (position / momentum) — the antisymmetric sign the bare directed-and-acyclic causal edges
could not supply. This module supplies it through the colouring lens, with **MLD as the mediator**.

The bridge is an identity the corpus already carries (`GraphColoring`):

* a **proper colouring** of the causal graph is a **factor map into `K₄` on the FOUR**
  (`properColoring_iff_hom` / `fourColouring`) — the polarization valued in the Belnap bilattice, its
  two conjugate directions the two orders `≤ₖ`, `≤ₜ`;
* an **MLD** (a local derivation / sliding-block factor map) is a **graph homomorphism**, and
  colourings **pull back along it** (`ProperColoring.comp`) — so a factor map preserves a nondegenerate
  polarization. MLD is the discrete **canonical transformation**;
* the **obstruction** to a global (Bool) polarization is exactly **non-bipartiteness** — an odd causal
  cycle (`not_bipartite_of_odd_closed_walk`): the chromatic `H¹`-class, the polarization-obstruction
  preserved by MLD.

The polarization 1-form of a colouring `c` is its coboundary `δ⁰ c (a,b) = c b − c a` (closed by
`CausalSets.Causal.Cohomology.delta1_delta0`); it is **nondegenerate** — nonzero on every causal edge — exactly
when `c` is a **proper** colouring. So: colouring = polarization; properness = nondegeneracy; MLD =
the polarization-preserving factor map; the chromatic obstruction = the symplectic-curvature class.

A **bridge, not an identity**: this is the polarization layer (the conjugate split and its
obstruction), not the full nondegenerate symplectic 2-form, which stays
`thm:cotangent-symplectic-flow`.

## Main definitions

* `polForm` — the polarization 1-form of a colouring on direct causal edges.
* `Nondegenerate` — the polarization is nonzero on every causal edge.

## Main results

* `nondegenerate_iff_proper` — nondegeneracy of the polarization is properness of the colouring.
* `mld_preserves_polarization` — a factor map (MLD) pulls back a nondegenerate polarization.
* `exists_bool_polarization_iff_bipartite` — a global Bool polarization exists iff the causal graph is
  bipartite (the obstruction is the odd-cycle chromatic class).
* `causal_polarization` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Obsmetrologia.Order.GraphColoring` and
`Obsmetrologia.CausalSets.Causal.Cohomology`; the polarization layer of `thm:cotangent-symplectic-flow`.

## Tags

polarization, symplectic, proper colouring, factor map, MLD, chromatic obstruction, FOUR
-/

namespace Obsmetrologia
namespace CausalSets.Support.Polarization

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.Combinatorics

variable {E : Type} (C : CausalSet E)

/-! ## (A) The polarization 1-form of a colouring -/

/-- The **polarization 1-form** of a colouring `c` on a direct causal edge `a ≺₀ b`: the discrete
gradient `c b − c a` (the coboundary `δ⁰ c`). The conjugate sign the bare directed edge lacks. -/
def polForm (c : E → Int) (a b : E) : Int := c b - c a

/-- The polarization is **nondegenerate** when it is nonzero on every direct causal edge — no causal
direction is collapsed (the conjugate split is everywhere). -/
def Nondegenerate (c : E → Int) : Prop := ∀ a b, C.prec0 a b = true → polForm c a b ≠ 0

/-! ## (B) Nondegeneracy is properness -/

/-- **Nondegeneracy ⟺ proper colouring.** The polarization 1-form of `c` is nonzero on every causal
edge exactly when `c` properly colours the causal graph: a degenerate causal direction is an edge whose
endpoints share a colour. The symplectic conjugate split *is* a proper colouring. -/
theorem nondegenerate_iff_proper (c : E → Int) :
    Nondegenerate C c ↔ ProperColoring C.prec0 c := by
  unfold Nondegenerate ProperColoring polForm
  constructor
  · intro h a b hab heq
    exact h a b hab (by omega)
  · intro h a b hab hz
    exact h a b hab (by omega)

/-! ## (C) MLD is the polarization-preserving factor map -/

/-- **MLD preserves the polarization (the canonical transformation).** A factor map `f` (a graph
homomorphism — the morphism underlying a mutual local derivation / sliding-block code) pulls a
nondegenerate polarization on the target back to a nondegenerate polarization on the source. A factor
map is the discrete symplectomorphism: it carries the conjugate split. Reuses `ProperColoring.comp`. -/
theorem mld_preserves_polarization {E' : Type} (C' : CausalSet E') (f : E' → E)
    (hf : GraphHom C'.prec0 C.prec0 f) (c : E → Int) (h : Nondegenerate C c) :
    Nondegenerate C' (fun v => c (f v)) := by
  rw [nondegenerate_iff_proper] at h ⊢
  exact ProperColoring.comp hf h

/-! ## (D) The obstruction is the chromatic class -/

/-- **A global Bool polarization exists iff the causal graph is bipartite.** A nondegenerate
`Bool`-valued polarization (a proper 2-colouring) exists exactly when the causal graph is bipartite;
the obstruction is non-bipartiteness — an **odd causal cycle**
(`not_bipartite_of_odd_closed_walk`). This odd-cycle chromatic `H¹`-class is the
polarization-obstruction, the discrete symplectic-curvature class — and it is MLD-invariant
(`mld_preserves_polarization`). -/
theorem exists_bool_polarization_iff_bipartite :
    (∃ c : E → Bool, ProperColoring C.prec0 c) ↔ Bipartite C.prec0 :=
  (bipartite_iff_colorableBool C.prec0).symm

/-! ## (E) The bundled headline -/

/-- **Causal polarization — the symplectic conjugate split through the colouring lens.**

* **polarization = proper colouring** (`nondegenerate_iff_proper`) — the nondegenerate conjugate split
  is exactly a proper colouring of the causal graph, valued (at four colours) in the FOUR bilattice;
* **MLD = the polarization-preserving factor map** (`mld_preserves_polarization`) — a graph
  homomorphism (sliding-block factor) carries the polarization, the discrete canonical transformation;
* **the obstruction is the chromatic class** (`exists_bool_polarization_iff_bipartite`) — a global
  Bool polarization exists iff the causal graph is bipartite; an odd causal cycle obstructs it, the
  MLD-invariant symplectic-curvature class.

So, viewed through colouring with MLD as mediator: the symplectic polarization is a proper FOUR-colouring,
MLD is the factor map preserving it, and the symplectic obstruction is the chromatic (odd-cycle)
`H¹`-class. The remaining piece — the full nondegenerate symplectic 2-form — is
`thm:cotangent-symplectic-flow`. -/
theorem causal_polarization :
    (∀ c : E → Int, Nondegenerate C c ↔ ProperColoring C.prec0 c)
    ∧ (∀ {E' : Type} (C' : CausalSet E') (f : E' → E),
        GraphHom C'.prec0 C.prec0 f → ∀ c : E → Int,
          Nondegenerate C c → Nondegenerate C' (fun v => c (f v)))
    ∧ ((∃ c : E → Bool, ProperColoring C.prec0 c) ↔ Bipartite C.prec0) :=
  ⟨fun c => nondegenerate_iff_proper C c,
   fun C' f hf c h => mld_preserves_polarization C C' f hf c h,
   exists_bool_polarization_iff_bipartite C⟩

end CausalSets.Support.Polarization
end Obsmetrologia
