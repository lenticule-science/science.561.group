/-!
# Finite gauge connection and Wilson-loop invariance — the quark bridge (DERIVED)

The quark/dense-matter frontier (`…/infomaterial_frontier_map_blackhole_quark_neutron_2026-06-27.md`, §9.1)
notes the repository already has an internal `ℤ/2` gauge (bilattice negation in `BigradedCohomology`)
and curvature-as-commutator (`Spacetime.Curvature.Lambek`), but no gauge-theory *vocabulary*. This
module supplies it: a finite gauge group acting on an edge-labelled graph, with **holonomy**, **local
gauge transformations**, and the foundational **Wilson-loop gauge invariance** — a class function of a
closed-loop holonomy is invariant under any local gauge transformation.

The mechanism is exactly Yang–Mills holonomy stripped to the discrete case. A connection labels each
directed edge by a group element; a gauge transformation `u` relabels each edge `(x,y)` by
`u(x)·A(x,y)·u(y)⁻¹`; the holonomy along a path telescopes, so a **closed** loop's holonomy conjugates
by the basepoint, `H ↦ u(x)·H·u(x)⁻¹`, and any conjugation-invariant function of it (a Wilson loop) is
gauge invariant. This is the finite, no-`SU(3)` skeleton of "physical observables are gauge-invariant".

`SU(3)` color, spinors, Wilson *area law*, and confinement are the genuinely-absent analytic layer
(Lie groups / bundles / QFT); the holonomy and its gauge-invariance are exactly this, and proved here.

## Main definitions
* `FiniteGroup` — a group on an arbitrary carrier (no Mathlib).
* `GaugeField`, `GaugeTransform`, `transformEdge` — connection, gauge transformation, gauge action.
* `holo` — path holonomy; `lastOf` — a path's endpoint.
* `ClassFunction` — a conjugation-invariant functional (a Wilson-loop observable).

## Main results
* `holo_transform` — the gauge-transformed holonomy telescopes to `u(start)·H·u(end)⁻¹`.
* `closedLoop_holonomy_conjugates` — a closed loop's holonomy conjugates by the basepoint.
* `wilsonLoop_invariant` — a class function of a closed-loop holonomy is **gauge invariant**.

## References
`content/.../infomaterial_frontier_map_blackhole_quark_neutron_2026-06-27.md` §9.1–9.2. Bridges the internal
`ℤ/2` gauge of `Positing.BigradedCohomology` to gauge-theory vocabulary.

## Tags
gauge theory, holonomy, Wilson loop, gauge invariance, finite group, quark
-/

namespace Infomaterial
namespace Gauge

/-- A **group** on an arbitrary carrier (the finite/discrete gauge group; no Lie structure, no
Mathlib). -/
structure FiniteGroup where
  carrier : Type
  one : carrier
  mul : carrier → carrier → carrier
  inv : carrier → carrier
  mul_assoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a, mul one a = a
  mul_one : ∀ a, mul a one = a
  inv_mul : ∀ a, mul (inv a) a = one
  mul_inv : ∀ a, mul a (inv a) = one

/-- The group identity `(a·(m·q⁻¹))·(q·n) = a·(m·n)` — the telescoping cancellation behind holonomy
gauge transport. -/
theorem mul_slide (G : FiniteGroup) (a m q n : G.carrier) :
    G.mul (G.mul a (G.mul m (G.inv q))) (G.mul q n) = G.mul a (G.mul m n) := by
  rw [G.mul_assoc a (G.mul m (G.inv q)) (G.mul q n), G.mul_assoc m (G.inv q) (G.mul q n),
    ← G.mul_assoc (G.inv q) q n, G.inv_mul q, G.one_mul n]

/-- A directed **edge** of the base graph. -/
abbrev Edge (V : Type) : Type := V × V

/-- A **gauge field** (connection): a group label on every directed edge. -/
abbrev GaugeField (G : FiniteGroup) (V : Type) : Type := Edge V → G.carrier

/-- A **local gauge transformation**: a group element at every vertex. -/
abbrev GaugeTransform (G : FiniteGroup) (V : Type) : Type := V → G.carrier

/-- The **gauge action** on a connection: relabel each edge `(x,y)` by `u(x)·A(x,y)·u(y)⁻¹`. -/
def transformEdge (G : FiniteGroup) {V : Type} (A : GaugeField G V) (u : GaugeTransform G V) :
    GaugeField G V :=
  fun e => G.mul (u e.1) (G.mul (A e) (G.inv (u e.2)))

/-- The **endpoint** of a path that starts at `x` and steps through the given vertices. -/
def lastOf {V : Type} (x : V) : List V → V
  | [] => x
  | (y :: rest) => lastOf y rest

/-- The **holonomy** of a connection along a path from `x` through the listed vertices: the ordered
group product of the edge labels. -/
def holo (G : FiniteGroup) {V : Type} (A : GaugeField G V) : V → List V → G.carrier
  | _, [] => G.one
  | x, (y :: rest) => G.mul (A (x, y)) (holo G A y rest)

/-- **Gauge transport of holonomy.** Under a local gauge transformation `u`, the holonomy along a path
telescopes to `u(start)·H·u(end)⁻¹` — only the endpoints survive. -/
theorem holo_transform (G : FiniteGroup) {V : Type} (A : GaugeField G V) (u : GaugeTransform G V)
    (x : V) (rest : List V) :
    holo G (transformEdge G A u) x rest
      = G.mul (u x) (G.mul (holo G A x rest) (G.inv (u (lastOf x rest)))) := by
  induction rest generalizing x with
  | nil =>
      show G.one = G.mul (u x) (G.mul G.one (G.inv (u x)))
      rw [G.one_mul, G.mul_inv]
  | cons y rest ih =>
      show G.mul (transformEdge G A u (x, y)) (holo G (transformEdge G A u) y rest)
        = G.mul (u x) (G.mul (G.mul (A (x, y)) (holo G A y rest)) (G.inv (u (lastOf y rest))))
      rw [ih y]
      unfold transformEdge
      rw [mul_slide G (u x) (A (x, y)) (u y)
        (G.mul (holo G A y rest) (G.inv (u (lastOf y rest))))]
      rw [G.mul_assoc (A (x, y)) (holo G A y rest) (G.inv (u (lastOf y rest)))]

/-- **A closed loop's holonomy conjugates by the basepoint.** If the path returns to its start, the
gauge-transformed holonomy is `u(x)·H·u(x)⁻¹`. -/
theorem closedLoop_holonomy_conjugates (G : FiniteGroup) {V : Type} (A : GaugeField G V)
    (u : GaugeTransform G V) (x : V) (rest : List V) (hclosed : lastOf x rest = x) :
    holo G (transformEdge G A u) x rest
      = G.mul (u x) (G.mul (holo G A x rest) (G.inv (u x))) := by
  rw [holo_transform, hclosed]

/-- A **class function** (a Wilson-loop observable): a functional of the gauge group invariant under
conjugation. -/
structure ClassFunction (G : FiniteGroup) where
  f : G.carrier → Nat
  conj_invariant : ∀ g h, f (G.mul h (G.mul g (G.inv h))) = f g

/-- **Wilson-loop gauge invariance.** A class function of a closed-loop holonomy is unchanged by any
local gauge transformation — the finite skeleton of "Wilson loops are gauge-invariant observables". -/
theorem wilsonLoop_invariant (G : FiniteGroup) {V : Type} (A : GaugeField G V)
    (u : GaugeTransform G V) (cf : ClassFunction G) (x : V) (rest : List V)
    (hclosed : lastOf x rest = x) :
    cf.f (holo G (transformEdge G A u) x rest) = cf.f (holo G A x rest) := by
  rw [closedLoop_holonomy_conjugates G A u x rest hclosed]
  exact cf.conj_invariant (holo G A x rest) (u x)

/-! ## A concrete gauge group: `ℤ/2` -/

/-- The gauge group **`ℤ/2`** (`Bool` under XOR) — the discrete gauge group of the repository's
internal bilattice-negation gauge, now in gauge-connection form. -/
def Z2 : FiniteGroup where
  carrier := Bool
  one := false
  mul := xor
  inv := id
  mul_assoc := by decide
  one_mul := by decide
  mul_one := by decide
  inv_mul := by decide
  mul_inv := by decide

end Gauge
end Infomaterial
