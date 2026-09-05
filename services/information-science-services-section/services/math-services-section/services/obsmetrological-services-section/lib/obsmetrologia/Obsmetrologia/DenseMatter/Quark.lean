import Obsmetrologia.QuantumContextuality.CohomologicalContextuality
import Obsmetrologia.AperiodicOrder.Defect

/-!
# Quark — finite gauge connection and Wilson-loop invariance (DERIVED)

The quark phase of substance: a finite gauge group acting on an edge-labelled graph, with
**holonomy**, **local gauge transformations**, and the foundational **Wilson-loop gauge
invariance** — a class function of a closed-loop holonomy is invariant under any local gauge
transformation. The quark/dense-matter frontier
(`…/obsmetrologia_frontier_map_blackhole_quark_neutron_2026-06-27.md`, §9.1) notes the repository
already has an internal `ℤ/2` gauge (bilattice negation in `BigradedCohomology`) and
curvature-as-commutator (`CausalSets.Curvature.Lambek`), but no gauge-theory *vocabulary*; this
module supplies it.

The mechanism is exactly Yang–Mills holonomy stripped to the discrete case. A connection labels each
directed edge by a group element; a gauge transformation `u` relabels each edge `(x,y)` by
`u(x)·A(x,y)·u(y)⁻¹`; the holonomy along a path telescopes, so a **closed** loop's holonomy conjugates
by the basepoint, `H ↦ u(x)·H·u(x)⁻¹`, and any conjugation-invariant function of it (a Wilson loop) is
gauge invariant. This is the finite, no-`SU(3)` skeleton of "physical observables are gauge-invariant".

`SU(3)` color, spinors, Wilson *area law*, and confinement are the -absent analytic layer
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
* `pureGauge_closed_holo_one` — a pure-gauge connection has trivial Wilson loops.
* `pureGauge_iff_delta0` — over `ℤ/2`, pure gauge is exactly the coboundary condition of
  `QuantumContextuality.Coboundary`'s underlying `delta0`.
* `prConnection_flux` — the PR box's parity target, read as a `ℤ/2` connection on its four
  measurements, has Wilson loop `true` around the context 4-cycle and is not pure gauge:
  contextuality is gauge flux.
* `holo_neg`, `verso_even_loop_invariant` — flipping every edge bit (the cloth's verso
  reading, `WeaveDraft.overUnder_swap_is_negate`) changes a loop's holonomy by the parity
  of its length: even loops are face-independent, odd loops flip.

## References
`content/.../obsmetrologia_frontier_map_blackhole_quark_neutron_2026-06-27.md` §9.1–9.2. Bridges the internal
`ℤ/2` gauge of `Positing.BigradedCohomology` to gauge-theory vocabulary.

## Tags
gauge theory, holonomy, Wilson loop, gauge invariance, finite group, quark
-/

namespace Obsmetrologia
namespace DenseMatter.Quark

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

/-- **Holonomy factors over path concatenation.** The holonomy along a path split at any point is
the product of the front sub-path's holonomy and the back sub-path's holonomy, the back one read
from the front's endpoint — by induction on the front sub-path, peeling one edge and reassociating.
This is the multiplicative factorization law any front/back cochain splitting on paths must go
through. -/
theorem holo_append (G : FiniteGroup) {V : Type} (A : GaugeField G V) (x : V) (u v : List V) :
    holo G A x (u ++ v) = G.mul (holo G A x u) (holo G A (lastOf x u) v) := by
  induction u generalizing x with
  | nil => show holo G A x v = G.mul G.one (holo G A x v); rw [G.one_mul]
  | cons y u ih =>
    show G.mul (A (x, y)) (holo G A y (u ++ v))
      = G.mul (G.mul (A (x, y)) (holo G A y u)) (holo G A (lastOf y u) v)
    rw [ih y, G.mul_assoc]

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

/-! ## Pure gauge, flux, and the `ℤ/2` welds

A connection is **pure gauge** when it is the gauge transform of the trivial connection;
its Wilson loops are all trivial. Over `ℤ/2` the pure-gauge condition is exactly the
coboundary condition of the contextuality module: a parity target on a measurement
scenario is a `ℤ/2` connection on the context graph, `QuantumContextuality.delta0` is the
gauge transform of the trivial connection, and a nonzero cycle-sum is a nontrivial Wilson
loop. The PR box's target carries one unit of flux. Flipping every edge bit — the cloth's
verso reading (`WeaveDraft.overUnder_swap_is_negate`: the over/under swap acts by
bilattice negation) — changes a loop's holonomy by the parity of its length, so even
plaquettes are face-independent and odd loops flip. -/

/-- A connection is **pure gauge** when every edge label is `u(x)·u(y)⁻¹` for one vertex
assignment `u` — the gauge transform of the trivial connection. -/
def IsPureGauge (G : FiniteGroup) {V : Type} (A : GaugeField G V) : Prop :=
  ∃ u : GaugeTransform G V, ∀ e : Edge V, A e = G.mul (u e.1) (G.inv (u e.2))

/-- A pure-gauge connection's holonomy telescopes to `u(start)·u(end)⁻¹`. -/
theorem pureGauge_holo (G : FiniteGroup) {V : Type} (A : GaugeField G V)
    (u : GaugeTransform G V) (hu : ∀ e : Edge V, A e = G.mul (u e.1) (G.inv (u e.2)))
    (x : V) (rest : List V) :
    holo G A x rest = G.mul (u x) (G.inv (u (lastOf x rest))) := by
  induction rest generalizing x with
  | nil =>
    show G.one = G.mul (u x) (G.inv (u x))
    rw [G.mul_inv]
  | cons y rest ih =>
    show G.mul (A (x, y)) (holo G A y rest) = _
    rw [hu (x, y), ih y,
      show G.mul (u x) (G.inv (u y)) = G.mul (u x) (G.mul G.one (G.inv (u y))) by
        rw [G.one_mul],
      mul_slide G (u x) G.one (u y) (G.inv (u (lastOf y rest))), G.one_mul]
    rfl

/-- **A pure-gauge connection has trivial Wilson loops**: around any closed path the
holonomy is the identity. -/
theorem pureGauge_closed_holo_one (G : FiniteGroup) {V : Type} (A : GaugeField G V)
    (h : IsPureGauge G A) (x : V) (rest : List V) (hclosed : lastOf x rest = x) :
    holo G A x rest = G.one := by
  obtain ⟨u, hu⟩ := h
  rw [pureGauge_holo G A u hu x rest, hclosed, G.mul_inv]

/-- Boolean inequality is `ℤ/2` multiplication. -/
theorem bne_eq_xor (a b : Bool) : (a != b) = xor a b := by
  cases a <;> cases b <;> rfl

/-- **Pure gauge is the coboundary condition.** A two-argument `Bool` target is the
`QuantumContextuality.delta0` gradient of a global assignment iff its connection is pure
gauge over `ℤ/2`. -/
theorem pureGauge_iff_delta0 {M : Type} (φ : M → M → Bool) :
    IsPureGauge Z2 (fun e : Edge M => φ e.1 e.2)
      ↔ ∃ f : M → Bool, ∀ i j, φ i j = QuantumContextuality.delta0 f i j := by
  constructor
  · rintro ⟨u, hu⟩
    refine ⟨fun m => (u m : Bool), fun i j => ?_⟩
    have h : φ i j = xor (u i) (u j) := hu (i, j)
    rw [h]
    exact (bne_eq_xor (u i) (u j)).symm
  · rintro ⟨f, hf⟩
    refine ⟨f, fun e => ?_⟩
    have h := hf e.1 e.2
    show φ e.1 e.2 = xor (f e.1) (f e.2)
    rw [h]
    show (f e.1 != f e.2) = xor (f e.1) (f e.2)
    rw [bne_eq_xor]

/-- The PR box's parity target as a `ℤ/2` connection on its four measurements. -/
def prConnection : GaugeField Z2 QuantumContextuality.PRM :=
  fun e => QuantumContextuality.prTarget e.1 e.2

/-- **The PR box carries one unit of `ℤ/2` flux**: the Wilson loop of its parity
connection around the context 4-cycle `0–2–1–3–0` is nontrivial, so the connection is
not pure gauge — contextuality as gauge flux, agreeing with
`QuantumContextuality.prTarget_not_coboundary` through `pureGauge_iff_delta0`. -/
theorem prConnection_flux :
    holo Z2 prConnection (false, false) [(true, false), (false, true), (true, true), (false, false)] = true
    ∧ ¬ IsPureGauge Z2 prConnection := by
  refine ⟨rfl, fun h => ?_⟩
  have h1 := pureGauge_closed_holo_one Z2 prConnection h (false, false) [(true, false), (false, true), (true, true), (false, false)] rfl
  exact Bool.noConfusion (h1.symm.trans rfl)

/-- The parity of a walk length. -/
def parity : Nat → Bool
  | 0 => false
  | n + 1 => !(parity n)

/-- **Holonomy of the bit-flipped connection**: flipping every edge label changes a
path's holonomy by the parity of its length. -/
theorem holo_neg {V : Type} (A : GaugeField Z2 V) (x : V) (rest : List V) :
    holo Z2 (fun e => !(A e)) x rest = xor (parity rest.length) (holo Z2 A x rest) := by
  induction rest generalizing x with
  | nil => rfl
  | cons y rest ih =>
    show xor (!(A (x, y))) (holo Z2 (fun e => !(A e)) y rest)
      = xor (!(parity rest.length)) (xor (A (x, y)) (holo Z2 A y rest))
    rw [ih y]
    generalize A (x, y) = a
    generalize holo Z2 A y rest = h
    generalize parity rest.length = p
    cases a <;> cases h <;> cases p <;> rfl

/-- **The verso reading preserves even Wilson loops.** Flipping every edge bit — the
cloth read from its other face — leaves the holonomy of every even-length loop
unchanged: the plaquette flux spectrum is face-independent. -/
theorem verso_even_loop_invariant {V : Type} (A : GaugeField Z2 V) (x : V)
    (rest : List V) (h : parity rest.length = false) :
    holo Z2 (fun e => !(A e)) x rest = holo Z2 A x rest := by
  rw [holo_neg, h]
  generalize holo Z2 A x rest = w
  cases w <;> rfl

/-- **The verso reading flips odd Wilson loops** — the Möbius seam: a loop of odd
length is not face-independent. -/
theorem verso_odd_loop_flips {V : Type} (A : GaugeField Z2 V) (x : V)
    (rest : List V) (h : parity rest.length = true) :
    holo Z2 (fun e => !(A e)) x rest = !(holo Z2 A x rest) := by
  rw [holo_neg, h]
  generalize holo Z2 A x rest = w
  cases w <;> rfl

/-- Bundles the `ℤ/2` welds: pure gauge is the coboundary condition; the PR box's
parity connection has nontrivial Wilson loop and is not pure gauge; and the verso
bit-flip preserves even loops and flips odd ones. -/
theorem z2_flux_reading {M : Type} (φ : M → M → Bool) {V : Type}
    (A : GaugeField Z2 V) (x : V) (rest : List V) :
    (IsPureGauge Z2 (fun e : Edge M => φ e.1 e.2)
      ↔ ∃ f : M → Bool, ∀ i j, φ i j = QuantumContextuality.delta0 f i j)
    ∧ (holo Z2 prConnection (false, false) [(true, false), (false, true), (true, true), (false, false)] = true
        ∧ ¬ IsPureGauge Z2 prConnection)
    ∧ (parity rest.length = false →
        holo Z2 (fun e => !(A e)) x rest = holo Z2 A x rest)
    ∧ (parity rest.length = true →
        holo Z2 (fun e => !(A e)) x rest = !(holo Z2 A x rest)) :=
  ⟨pureGauge_iff_delta0 φ, prConnection_flux,
    verso_even_loop_invariant A x rest, verso_odd_loop_flips A x rest⟩

/-! ## The product connection: one loop, two charges

The product of two gauge groups acts componentwise, and the holonomy of a product
connection is the pair of the factor holonomies: one Wilson loop reads both charges at
once. Instantiated on the PR measurement carrier with the contextuality flux in one
factor and the orientation (length-parity) connection in the other: the context 4-cycle
reads `(true, false)` — one unit of contextual flux, even orientation — while any odd
loop flips the second factor (the Möbius seam). -/

/-- The **product** of two finite gauge groups: componentwise structure. -/
def FiniteGroup.prod (G H : FiniteGroup) : FiniteGroup where
  carrier := G.carrier × H.carrier
  one := (G.one, H.one)
  mul := fun a b => (G.mul a.1 b.1, H.mul a.2 b.2)
  inv := fun a => (G.inv a.1, H.inv a.2)
  mul_assoc := by
    intro a b c
    show (G.mul (G.mul a.1 b.1) c.1, H.mul (H.mul a.2 b.2) c.2) = _
    rw [G.mul_assoc, H.mul_assoc]
  one_mul := by
    intro a
    show (G.mul G.one a.1, H.mul H.one a.2) = a
    rw [G.one_mul, H.one_mul]
  mul_one := by
    intro a
    show (G.mul a.1 G.one, H.mul a.2 H.one) = a
    rw [G.mul_one, H.mul_one]
  inv_mul := by
    intro a
    show (G.mul (G.inv a.1) a.1, H.mul (H.inv a.2) a.2) = (G.one, H.one)
    rw [G.inv_mul, H.inv_mul]
  mul_inv := by
    intro a
    show (G.mul a.1 (G.inv a.1), H.mul a.2 (H.inv a.2)) = (G.one, H.one)
    rw [G.mul_inv, H.mul_inv]

/-- **Holonomy factorizes over the product**: the product connection's holonomy is the
pair of the factor holonomies — one loop reads both charges. -/
theorem holo_prod (G H : FiniteGroup) {V : Type} (A : GaugeField (FiniteGroup.prod G H) V)
    (x : V) (rest : List V) :
    holo (FiniteGroup.prod G H) A x rest
      = (holo G (fun e => (A e).1) x rest, holo H (fun e => (A e).2) x rest) := by
  induction rest generalizing x with
  | nil => rfl
  | cons y rest ih =>
    show (FiniteGroup.prod G H).mul (A (x, y)) (holo (FiniteGroup.prod G H) A y rest) = _
    rw [ih y]
    rfl

/-- The **orientation connection**: every edge carries the nontrivial `ℤ/2` element, so a
path's holonomy is the parity of its length. -/
def orientationConnection (V : Type) : GaugeField Z2 V := fun _ => true

/-- The orientation connection's holonomy is the length parity. -/
theorem orientation_holo {V : Type} (x : V) (rest : List V) :
    holo Z2 (orientationConnection V) x rest = parity rest.length := by
  induction rest generalizing x with
  | nil => rfl
  | cons y rest ih =>
    show xor true (holo Z2 (orientationConnection V) y rest) = !(parity rest.length)
    rw [ih y]
    cases parity rest.length <;> rfl

/-- The **PR product connection**: contextuality flux in the first factor, orientation in
the second, on the four-corner measurement carrier. -/
def prProductConnection : GaugeField (FiniteGroup.prod Z2 Z2) QuantumContextuality.PRM :=
  fun e => (prConnection e, orientationConnection QuantumContextuality.PRM e)

/-- **One loop, two charges.** Around the PR context 4-cycle the product Wilson loop
reads `(true, false)`: one unit of contextual flux, even orientation. The factors are
the two components of one holonomy. -/
theorem prProduct_wilson :
    holo (FiniteGroup.prod Z2 Z2) prProductConnection (false, false)
        [(true, false), (false, true), (true, true), (false, false)]
      = (true, false) := rfl

/-- **The product connection reading**, bundled: holonomy factorizes over the product;
the orientation factor is the length parity; and the PR 4-cycle's product Wilson loop
carries contextual flux in one component and even orientation in the other. -/
theorem product_connection_reading {V : Type}
    (A : GaugeField (FiniteGroup.prod Z2 Z2) V) (x : V) (rest : List V) :
    (holo (FiniteGroup.prod Z2 Z2) A x rest
      = (holo Z2 (fun e => (A e).1) x rest, holo Z2 (fun e => (A e).2) x rest))
    ∧ (holo Z2 (orientationConnection V) x rest = parity rest.length)
    ∧ holo (FiniteGroup.prod Z2 Z2) prProductConnection (false, false)
        [(true, false), (false, true), (true, true), (false, false)]
      = (true, false) :=
  ⟨holo_prod Z2 Z2 A x rest, orientation_holo x rest, prProduct_wilson⟩


/-! ## (F) The hexagonal frame group and the unified Wilson loop

The disclination carrier's frame group as a gauge group: the rot-orbit of
`(1, 0)` in the Eisenstein plane, under Eisenstein multiplication — the
sixth roots of unity as a derived carrier, no posited finite type. The
constant one-sixth-turn connection reads path length as rotational
holonomy: a six-loop closes (flat fabric), any shorter loop carries a
deficit (curvature). Pairing it with the PR connection gives one
connection whose single Wilson loop around the PR cycle reads a curvature
charge and the contextual flux simultaneously. -/

/-- Membership in the rot-orbit of `(1, 0)`: the six frame vectors. -/
abbrev C6Mem (v : AperiodicOrder.Defect.Disclination.Vec) : Prop :=
  v = (1, 0) ∨ v = (0, 1) ∨ v = (-1, 1) ∨ v = (-1, 0) ∨ v = (0, -1) ∨ v = (1, -1)

/-- The six frame vectors are the rot-orbit of `(1, 0)`, in order. -/
theorem c6Mem_rot_orbit :
    AperiodicOrder.Defect.Disclination.rotPow 1 (1, 0) = ((0 : Int), (1 : Int))
    ∧ AperiodicOrder.Defect.Disclination.rotPow 2 (1, 0) = ((-1 : Int), (1 : Int))
    ∧ AperiodicOrder.Defect.Disclination.rotPow 3 (1, 0) = ((-1 : Int), (0 : Int))
    ∧ AperiodicOrder.Defect.Disclination.rotPow 4 (1, 0) = ((0 : Int), (-1 : Int))
    ∧ AperiodicOrder.Defect.Disclination.rotPow 5 (1, 0) = ((1 : Int), (-1 : Int)) :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

/-- Eisenstein multiplication on the derived plane: `ζ² = ζ − 1`. -/
def mulVec (a b : AperiodicOrder.Defect.Disclination.Vec) :
    AperiodicOrder.Defect.Disclination.Vec :=
  (a.1 * b.1 - a.2 * b.2, a.1 * b.2 + a.2 * b.1 + a.2 * b.2)

/-- The fifth Eisenstein power — the orbit inverse. -/
def invVec (v : AperiodicOrder.Defect.Disclination.Vec) :
    AperiodicOrder.Defect.Disclination.Vec :=
  mulVec v (mulVec v (mulVec v (mulVec v v)))

theorem c6Mem_mul {a b : AperiodicOrder.Defect.Disclination.Vec}
    (ha : C6Mem a) (hb : C6Mem b) : C6Mem (mulVec a b) := by
  rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem c6Mem_inv {a : AperiodicOrder.Defect.Disclination.Vec}
    (ha : C6Mem a) : C6Mem (invVec a) := by
  rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;> decide

/-- On the orbit, Eisenstein multiplication by `(0, 1)` is the derived
rotation `rot`. -/
theorem zeta_mul_is_rot_on_orbit (v : AperiodicOrder.Defect.Disclination.Vec)
    (h : C6Mem v) : mulVec (0, 1) v = AperiodicOrder.Defect.Disclination.rot v := by
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl <;> decide

/-- **The hexagonal frame group**: the rot-orbit of `(1, 0)` under
Eisenstein multiplication. -/
def C6 : FiniteGroup where
  carrier := {v : AperiodicOrder.Defect.Disclination.Vec // C6Mem v}
  one := ⟨(1, 0), Or.inl rfl⟩
  mul a b := ⟨mulVec a.val b.val, c6Mem_mul a.property b.property⟩
  inv a := ⟨invVec a.val, c6Mem_inv a.property⟩
  mul_assoc := by
    intro ⟨va, ha⟩ ⟨vb, hb⟩ ⟨vc, hc⟩
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;>
      rcases hb with rfl | rfl | rfl | rfl | rfl | rfl <;>
        rcases hc with rfl | rfl | rfl | rfl | rfl | rfl <;>
          exact Subtype.ext (by decide)
  one_mul := by
    intro ⟨va, ha⟩
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;> exact Subtype.ext (by decide)
  mul_one := by
    intro ⟨va, ha⟩
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;> exact Subtype.ext (by decide)
  inv_mul := by
    intro ⟨va, ha⟩
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;> exact Subtype.ext (by decide)
  mul_inv := by
    intro ⟨va, ha⟩
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl <;> exact Subtype.ext (by decide)

/-- The generator: one sixth-turn. -/
def zeta : C6.carrier := ⟨(0, 1), Or.inr (Or.inl rfl)⟩

/-- Powers of the generator. -/
def c6pow : Nat → C6.carrier
  | 0 => C6.one
  | n + 1 => C6.mul zeta (c6pow n)

/-- The constant one-sixth-turn connection: every edge turns the frame. -/
def zetaStep (V : Type) : GaugeField C6 V := fun _ => zeta

/-- The holonomy of the constant-turn connection is the path length as a
frame rotation. -/
theorem zetaStep_holo {V : Type} (x : V) (rest : List V) :
    holo C6 (zetaStep V) x rest = c6pow rest.length := by
  induction rest generalizing x with
  | nil => rfl
  | cons y rest ih =>
    show C6.mul zeta (holo C6 (zetaStep V) y rest) = C6.mul zeta (c6pow rest.length)
    rw [ih]

/-- **The deficit spectrum**: a four-loop and a five-loop carry nonzero
rotational holonomy — curvature — while the six-loop closes flat. -/
theorem c6_deficit_spectrum :
    c6pow 4 ≠ C6.one ∧ c6pow 5 ≠ C6.one ∧ c6pow 6 = C6.one := by
  refine ⟨fun h => ?_, fun h => ?_, Subtype.ext (by decide)⟩
  · exact absurd (congrArg Subtype.val h) (by decide)
  · exact absurd (congrArg Subtype.val h) (by decide)

/-- **The unified connection**: the hexagonal frame turn in the spatial
factor, the PR box in the internal factor, on the PR measurement sites. -/
def unifiedPRConnection : GaugeField (C6.prod Z2) QuantumContextuality.PRM :=
  fun e => (zeta, prConnection e)

/-- **One Wilson loop reads curvature and contextuality.** Around the PR
cycle, the unified connection's holonomy is the pair (four-turn deficit,
contextual flux) — both factors nonzero: the loop is curved because four
steps close where six want to, and fluxed because the PR box is
contextual. -/
theorem unified_wilson :
    holo (C6.prod Z2) unifiedPRConnection (false, false)
        [(true, false), (false, true), (true, true), (false, false)]
      = (c6pow 4, true) := by
  rw [holo_prod]
  exact Prod.ext (zetaStep_holo _ _) prConnection_flux.1

/-- **Curvature and contextuality are one gauge charge.** The unified
Wilson loop around the PR cycle reads `(c6pow 4, true)`; the spatial
factor is a nonzero frame deficit, the internal factor is the contextual
flux, and the same fabric is flat on six-loops. One loop, one charge, two
obstructions. -/
theorem curvature_contextuality_one_loop :
    holo (C6.prod Z2) unifiedPRConnection (false, false)
        [(true, false), (false, true), (true, true), (false, false)]
      = (c6pow 4, true)
    ∧ c6pow 4 ≠ C6.one
    ∧ (true : Bool) ≠ Z2.one
    ∧ c6pow 6 = C6.one :=
  ⟨unified_wilson, c6_deficit_spectrum.1, by decide, c6_deficit_spectrum.2.2⟩


/-! ### The loop-length dictionary and the deficit structure -/

theorem c6pow_six_add (n : Nat) : c6pow (n + 6) = c6pow n := by
  show C6.mul zeta (C6.mul zeta (C6.mul zeta (C6.mul zeta (C6.mul zeta
    (C6.mul zeta (c6pow n)))))) = c6pow n
  refine Subtype.ext ?_
  obtain ⟨v, hv⟩ := c6pow n
  rcases hv with rfl | rfl | rfl | rfl | rfl | rfl <;> decide

theorem c6pow_eq_one_of_six_mul : ∀ k, c6pow (6 * k) = C6.one
  | 0 => rfl
  | k + 1 => by
    rw [Nat.mul_succ, c6pow_six_add (6 * k)]
    exact c6pow_eq_one_of_six_mul k

theorem six_mul_of_c6pow_eq_one : ∀ n, c6pow n = C6.one → ∃ k, n = 6 * k
  | 0, _ => ⟨0, rfl⟩
  | 1, h => absurd (congrArg Subtype.val h) (by decide)
  | 2, h => absurd (congrArg Subtype.val h) (by decide)
  | 3, h => absurd (congrArg Subtype.val h) (by decide)
  | 4, h => absurd (congrArg Subtype.val h) (by decide)
  | 5, h => absurd (congrArg Subtype.val h) (by decide)
  | n + 6, h => by
    rw [c6pow_six_add n] at h
    obtain ⟨k, rfl⟩ := six_mul_of_c6pow_eq_one n h
    exact ⟨k + 1, by rw [Nat.mul_succ]⟩

/-- **The generator has order six**: a power of the unit turn is the
identity exactly at multiples of six. -/
theorem c6pow_eq_one_iff (n : Nat) : c6pow n = C6.one ↔ ∃ k, n = 6 * k :=
  ⟨six_mul_of_c6pow_eq_one n, fun ⟨k, hk⟩ => hk ▸ c6pow_eq_one_of_six_mul k⟩

/-- **The loop-length dictionary.** On the constant one-sixth-turn fabric,
a Wilson loop is flat exactly when its length is a multiple of six: every
context cycle is a curvature census entry, deficit read off the length. -/
theorem zetaStep_wilson_iff {V : Type} (x : V) (rest : List V) :
    holo C6 (zetaStep V) x rest = C6.one ↔ ∃ k, rest.length = 6 * k := by
  rw [zetaStep_holo]
  exact c6pow_eq_one_iff rest.length

/-- **The deficit law**: an `L`-loop's charge is the inverse of the
`(6 − L)`-quantum deficit — the holonomy records how many sixths the
plaquette is short. -/
theorem c6pow_inv_deficit : ∀ L, L ≤ 6 → c6pow L = C6.inv (c6pow (6 - L))
  | 0, _ => Subtype.ext (by decide)
  | 1, _ => Subtype.ext (by decide)
  | 2, _ => Subtype.ext (by decide)
  | 3, _ => Subtype.ext (by decide)
  | 4, _ => Subtype.ext (by decide)
  | 5, _ => Subtype.ext (by decide)
  | 6, _ => Subtype.ext (by decide)
  | L + 7, h =>
    absurd (Nat.le_trans (Nat.le_add_left 7 L) h) (by decide)

/-- **The structure of the PR charge.** The unified loop's curvature factor
`ζ⁴` is the inverse square of the unit turn — the PR plaquette is short two
coordinations — and the square of the generator satisfies the Eisenstein
relation `ζ² = ζ − 1`. -/
theorem pr_deficit_structure :
    c6pow 4 = C6.inv (C6.mul zeta zeta)
    ∧ (C6.mul zeta zeta).val
        = (zeta.val.1 - C6.one.val.1, zeta.val.2 - C6.one.val.2) :=
  ⟨Subtype.ext (by decide), by decide⟩

/-- The dictionary, the deficit law, and the PR charge's structure,
bundled: flatness is divisibility of length by six, every loop's charge is
the inverse of its coordination deficit, and the PR curvature factor is
the inverse square of the unit turn, whose square is `ζ − 1`. -/
theorem deficit_charge_structure :
    (∀ {V : Type} (x : V) (rest : List V),
      holo C6 (zetaStep V) x rest = C6.one ↔ ∃ k, rest.length = 6 * k)
    ∧ (∀ L, L ≤ 6 → c6pow L = C6.inv (c6pow (6 - L)))
    ∧ c6pow 4 = C6.inv (C6.mul zeta zeta)
    ∧ (C6.mul zeta zeta).val
        = (zeta.val.1 - C6.one.val.1, zeta.val.2 - C6.one.val.2) :=
  ⟨fun x rest => zetaStep_wilson_iff x rest, c6pow_inv_deficit,
    pr_deficit_structure.1, pr_deficit_structure.2⟩

end DenseMatter.Quark
end Obsmetrologia


