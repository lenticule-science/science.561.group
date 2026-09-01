/-!
# PastaTopology — nuclear pasta: excursion-set topology (DERIVED)

The dense-matter map (`…/infomaterial_frontier_map_blackhole_quark_neutron_2026-06-27.md`, §13.3) flags
nuclear-pasta morphology as "one of the best neutron-matter targets because it matches the repository's
existing finite topology strengths." Deep in a neutron star, competing nuclear/Coulomb forces shape
matter into droplets, rods, slabs, and sponges — classified by the **topology of density excursion
sets** `K_θ = {x : ρ(x) ≥ θ}` via volume, Euler characteristic, and Betti numbers.

A `CellComplex` carries vertices, edges, and (triangular) faces; a density `ρ` and threshold `θ` cut
out the **excursion subcomplex** (cells all of whose vertices clear the threshold). Two exact facts:
the excursion is a **filtration** — it shrinks monotonically as the threshold rises (the basis of
persistent homology) — and its **Euler characteristic** `χ = V − E + F` distinguishes morphology
(a filled droplet has `χ = 1`, a hollow loop `χ = 0`).

This is finite combinatorial topology, not nuclear structure: real pasta needs density functionals,
Minkowski functionals over ℝ³, and persistent homology over continua (the not-visible analytic layer).

## Main definitions
* `CellComplex`, `eulerChar` — a finite complex and its Euler characteristic.
* `excVerts`/`excEdges`/`excFaces`, `excEuler` — the excursion subcomplex at a density threshold.

## Main results
* `excVerts_anti`/`excEdges_anti`/`excFaces_anti` — the excursion is a filtration (shrinks as `θ` rises).
* `filledTriangle_euler` / `hollowTriangle_euler` — `χ` separates droplet (`1`) from loop (`0`).

## References
`content/.../infomaterial_frontier_map_blackhole_quark_neutron_2026-06-27.md` §13.3. Adjacent to
`Topology.PersistentH0` (graph-filtration persistent H⁰).

## Tags
nuclear pasta, excursion set, Euler characteristic, filtration, persistent homology
-/

namespace Infomaterial
namespace Relational.DenseMatter

/-- A finite **cell complex**: 0-cells (vertices), 1-cells (edges), 2-cells (triangular faces). -/
structure CellComplex (V : Type) where
  verts : List V
  edges : List (V × V)
  faces : List (V × V × V)

/-- The **Euler characteristic** `χ = V − E + F`. -/
def eulerChar {V : Type} (K : CellComplex V) : Int :=
  (K.verts.length : Int) - (K.edges.length : Int) + (K.faces.length : Int)

/-- A vertex is in the **excursion** at threshold `θ` when its density clears `θ`. -/
def vIn {V : Type} (ρ : V → Nat) (θ : Nat) (v : V) : Bool := decide (θ ≤ ρ v)

/-- An edge is in the excursion when both endpoints are. -/
def eIn {V : Type} (ρ : V → Nat) (θ : Nat) (e : V × V) : Bool :=
  decide (θ ≤ ρ e.1 ∧ θ ≤ ρ e.2)

/-- A face is in the excursion when all three vertices are. -/
def fIn {V : Type} (ρ : V → Nat) (θ : Nat) (f : V × V × V) : Bool :=
  decide (θ ≤ ρ f.1 ∧ θ ≤ ρ f.2.1 ∧ θ ≤ ρ f.2.2)

/-- The excursion **vertices** at threshold `θ`. -/
def excVerts {V : Type} (K : CellComplex V) (ρ : V → Nat) (θ : Nat) : List V :=
  K.verts.filter (vIn ρ θ)

/-- The excursion **edges** at threshold `θ`. -/
def excEdges {V : Type} (K : CellComplex V) (ρ : V → Nat) (θ : Nat) : List (V × V) :=
  K.edges.filter (eIn ρ θ)

/-- The excursion **faces** at threshold `θ`. -/
def excFaces {V : Type} (K : CellComplex V) (ρ : V → Nat) (θ : Nat) : List (V × V × V) :=
  K.faces.filter (fIn ρ θ)

/-- The Euler characteristic of the excursion subcomplex at threshold `θ`. -/
def excEuler {V : Type} (K : CellComplex V) (ρ : V → Nat) (θ : Nat) : Int :=
  ((excVerts K ρ θ).length : Int) - (excEdges K ρ θ).length + (excFaces K ρ θ).length

/-- **The excursion is a filtration (vertices).** Raising the threshold can only remove vertices: the
excursion sets are nested `K_{θ₂} ⊆ K_{θ₁}` for `θ₁ ≤ θ₂`. -/
theorem excVerts_anti {V : Type} (K : CellComplex V) (ρ : V → Nat) {θ₁ θ₂ : Nat} (h : θ₁ ≤ θ₂)
    {v : V} (hv : v ∈ excVerts K ρ θ₂) : v ∈ excVerts K ρ θ₁ := by
  unfold excVerts at hv ⊢
  rw [List.mem_filter] at hv ⊢
  refine ⟨hv.1, ?_⟩
  have hp := hv.2
  unfold vIn at hp ⊢
  simp only [decide_eq_true_eq] at hp ⊢
  omega

/-- **The excursion is a filtration (edges).** -/
theorem excEdges_anti {V : Type} (K : CellComplex V) (ρ : V → Nat) {θ₁ θ₂ : Nat} (h : θ₁ ≤ θ₂)
    {e : V × V} (he : e ∈ excEdges K ρ θ₂) : e ∈ excEdges K ρ θ₁ := by
  unfold excEdges at he ⊢
  rw [List.mem_filter] at he ⊢
  refine ⟨he.1, ?_⟩
  have hp := he.2
  unfold eIn at hp ⊢
  rw [decide_eq_true_eq] at hp ⊢
  exact ⟨by omega, by omega⟩

/-- **The excursion is a filtration (faces).** -/
theorem excFaces_anti {V : Type} (K : CellComplex V) (ρ : V → Nat) {θ₁ θ₂ : Nat} (h : θ₁ ≤ θ₂)
    {f : V × V × V} (hf : f ∈ excFaces K ρ θ₂) : f ∈ excFaces K ρ θ₁ := by
  unfold excFaces at hf ⊢
  rw [List.mem_filter] at hf ⊢
  refine ⟨hf.1, ?_⟩
  have hp := hf.2
  unfold fIn at hp ⊢
  rw [decide_eq_true_eq] at hp ⊢
  exact ⟨by omega, by omega, by omega⟩

/-! ## Morphology witnesses: `χ` separates droplet from loop -/

/-- A **filled triangle** (droplet/disk): three vertices, three edges, one face. -/
def filledTriangle : CellComplex Nat :=
  { verts := [0, 1, 2], edges := [(0, 1), (1, 2), (0, 2)], faces := [(0, 1, 2)] }

/-- A **hollow triangle** (rod/loop): three vertices, three edges, no face. -/
def hollowTriangle : CellComplex Nat :=
  { verts := [0, 1, 2], edges := [(0, 1), (1, 2), (0, 2)], faces := [] }

/-- A filled droplet has Euler characteristic `1`. -/
theorem filledTriangle_euler : eulerChar filledTriangle = 1 := by decide

/-- A hollow loop has Euler characteristic `0` — the descriptor distinguishes the two morphologies. -/
theorem hollowTriangle_euler : eulerChar hollowTriangle = 0 := by decide

end Relational.DenseMatter
end Infomaterial
