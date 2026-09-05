import Infomaterial.Cohomology.SettlingCohomologyH1
import Infomaterial.Calculus.Order.SetNumberGraphTheory

/-!
# Coordination cohomology — the cover-nerve Čech `Ȟ¹` as coordination cost

This certifies the corpus construction
`…/settling/monotonicity-certificate.mts` (+ its `cohomology.mts`): for a federated
cover, each logical cell builds the **source–stance bipartite nerve**, and the
**coordination cost** of that cell is the rank of `Ȟ¹` of the nerve. The shipped
`cohomologyOfCells` computes, over the integer incidence matrix:

* `Ȟ⁰` = the number of **connected components** (union-find over the 0-cells / entities),
  the global-section dimension;
* `Ȟ¹` = the **cycle rank** `|E| − |V| + |C|` (cells − entities + components), the number
  of independent gluing obstructions;
* the **Laplacian view** `L = δ⁰ᵀ δ⁰` recovers both as kernel/cokernel ranks around the
  incidence rank `ρ`: `Ȟ⁰ = |V| − ρ`, `Ȟ¹ = |E| − ρ`.

## What is proved here (faithful scope)

The shipped invariant is the **Euler/cycle-rank** of the nerve. We carry a nerve by its
three counts together with the **union-find invariant** the shipped component count
guarantees (`|V| ≤ |E| + |C|`: starting from `|V|` singleton components, each of the `|E|`
cells merges at most one pair, so at least `|V| − |E|` components survive), and prove:

* **(the iff, direction (1))** `Ȟ¹ = 0 ⟺ |V| = |E| + |C|` — the obstruction vanishes **iff
  the nerve is a forest** (Euler characteristic equals the component count). This is the
  discrete/finite form of "a family of local sections glues to a monotone
  (CALM / coordination-free) global section **iff** its Čech class `[δs] ∈ Ȟ¹` is zero":
  `Ȟ¹` carries no cycle exactly when the source–stance nerve is acyclic;
* **(rank = coordination cost, corollary)** `Ȟ¹ = |E| − (|V| − |C|)` counts the cells in
  excess of a spanning forest — the irreducible coordination obstructions, each a cell that
  needs a total order; coordination-free ⟺ `Ȟ¹ = 0`;
* **(the connected witness, fully graph-backed)** a finite **tree** (`Discrete.FinTree`,
  with its spanning identity `|E| + 1 = |V|`) has `Ȟ¹ = 0` — `tree_coordination_free`, with
  no assumed invariant: `edge_count` supplies everything;
* **(the Laplacian dual)** `Ȟ⁰ = |V| − ρ` (kernel) and `Ȟ¹ = |E| − ρ` (cokernel) around the
  incidence rank `ρ = |V| − |C|` — matching the shipped `cohomologyLaplacian` rank
  identities; `Ȟ⁰ = |C|` is the harmonic / `ker L` side
  (`LawvereLaplacian.IsHarmonic`, `LawvereHarmonicCohomology`), `Ȟ¹` its dual.

## Frontier (stated, not faked)

Two pieces are genuinely open here and are left as explicit obligations, never as a
`sorry` dressed up as a proof:

* the **general components-count lemma** `|V| ≤ |E| + |C|` from a `Discrete.FinGraph` with a
  derived component count (the union-find invariant) — Infomaterial has `FinGraph.Connected` and
  `Reach` but no general component counter yet, so for a non-tree nerve we *carry* the
  invariant as the cover-nerve well-formedness field rather than re-derive it;
* the **value-level converse** — that a genuine cycle (`Ȟ¹ ≠ 0`) actually *obstructs* a
  monotone global section unless a total order is imposed on the cycle's cells — beyond the
  rank count. The existence half (an agreeing family over an acyclic cover glues) is the
  settling sheaf model's `Cohomology.h1_vanishes`, cited below.
-/

namespace Infomaterial
namespace Cohomology

open Infomaterial.AssocSheaf (Cochain)

/-! ## The cover nerve as its Euler counts -/

/-- The **cover nerve** of one logical cell of a federated cover, carried by the three
counts the shipped `cohomologyOfCells` reduces to: `entities` = the 0-cells `|V|`, `cells`
= the 1-cells `|E|`, `components` = the connected components `|C|` (`Ȟ⁰`, union-find). The
two fields are the **union-find invariant** the shipped component count guarantees: every
component meets ≥ 1 vertex (`components ≤ entities`), and each of the `cells` edges merges at
most one component so at least `entities − cells` survive (`entities ≤ cells + components`).
For a tree these are *derived*, not assumed — see `ofTree`. -/
structure CoverNerve where
  /-- `|V|` — the entity 0-cells of the nerve. -/
  entities : Nat
  /-- `|E|` — the source–stance 1-cells of the nerve. -/
  cells : Nat
  /-- `|C|` — the connected components (`Ȟ⁰`, union-find over the entities). -/
  components : Nat
  /-- Every component contains at least one entity. -/
  components_le_entities : components ≤ entities
  /-- The spanning-forest bound: `|V| ≤ |E| + |C|` (each cell merges ≤ 1 component). -/
  entities_le_cells_add_components : entities ≤ cells + components

namespace CoverNerve

/-- **`Ȟ⁰` — the component count.** The global-section dimension of the nerve: the number of
independent stances the cover already agrees on (the kernel side of the incidence Laplacian). -/
def H0rank (N : CoverNerve) : Nat := N.components

/-- **`Ȟ¹` — the cycle rank `|E| − |V| + |C|`.** Exactly the shipped `cohomologyOfCells`
first-cohomology rank (`magnitude (|E| − |V| + |C|)`); the union-find invariant makes the
truncated subtraction exact. The number of independent coordination obstructions. -/
def H1rank (N : CoverNerve) : Nat := (N.cells + N.components) - N.entities

/-- **Coordination-free** (CALM / monotone): the nerve carries no gluing obstruction. -/
def CoordinationFree (N : CoverNerve) : Prop := N.H1rank = 0

/-! ## The iff — direction (1) -/

/-- **The coordination–cohomology iff (discrete/finite).** `Ȟ¹ = 0` **iff** the nerve is a
**forest** `|V| = |E| + |C|` (Euler characteristic = component count). This is the shipped
form of "a family of local sections glues to a coordination-free global section iff its Čech
class `[δs] ∈ Ȟ¹` vanishes": the obstruction rank is zero exactly when the source–stance
nerve is acyclic. -/
theorem h1_vanishes_iff_forest (N : CoverNerve) :
    N.H1rank = 0 ↔ N.entities = N.cells + N.components := by
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  unfold H1rank
  constructor
  · intro h; omega
  · intro h; omega

/-- **`CoordinationFree` is exactly the forest/acyclic nerve.** Restatement of the iff at the
named predicate. -/
theorem coordinationFree_iff_forest (N : CoverNerve) :
    N.CoordinationFree ↔ N.entities = N.cells + N.components :=
  h1_vanishes_iff_forest N

/-! ## Rank = coordination cost (corollary) -/

/-- **Rank `Ȟ¹` = coordination cost.** The obstruction rank is the count of cells in excess
of a spanning forest, `|E| − (|V| − |C|)` — the independent cycles, each an irreducible
coordination obstruction (a cell needing a total order). Together with the vanishing iff this
is "rank `Ȟ¹` counts the irreducible coordination obstructions, the nonzero classes the cells
needing a total order." -/
theorem h1rank_is_coordination_cost (N : CoverNerve) :
    N.H1rank = N.cells - (N.entities - N.components)
    ∧ (N.H1rank = 0 ↔ N.entities = N.cells + N.components) := by
  refine ⟨?_, h1_vanishes_iff_forest N⟩
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  unfold H1rank
  omega

/-! ## The Laplacian dual: `Ȟ⁰ = ker`, `Ȟ¹ = coker` -/

/-- **The Laplacian kernel/cokernel identities.** With the incidence rank `ρ = |V| − |C|`,
`Ȟ⁰ = |V| − ρ` (the kernel of the incidence Laplacian `L = δ⁰ᵀδ⁰`) and `Ȟ¹ = |E| − ρ` (its
cokernel) — the shipped `cohomologyLaplacian` rank identities `zeroCohomologyKernelRank` /
`firstCohomologyCokernelRank`. So `Ȟ⁰ = |C|` is the harmonic / `ker L` side
(`LawvereLaplacian.IsHarmonic`, `LawvereHarmonicCohomology`) and `Ȟ¹` is its dual. -/
theorem laplacian_kernel_cokernel (N : CoverNerve) :
    N.H0rank = N.entities - (N.entities - N.components)
    ∧ N.H1rank = N.cells - (N.entities - N.components) := by
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  unfold H0rank H1rank
  refine ⟨?_, ?_⟩
  · omega
  · omega

end CoverNerve

/-! ## The connected witness — a finite tree is coordination-free (fully graph-backed) -/

/-- The cover nerve of a finite **tree**: its vertices, edges, and the single component, with
the union-find invariant *derived* from the tree's spanning identity `|E| + 1 = |V|` (no
assumption). -/
def CoverNerve.ofTree {V : Type} [DecidableEq V] (T : Infomaterial.Discrete.Graph.FinTree V) : CoverNerve where
  entities := T.fin.vcard
  cells := T.fin.ecard
  components := 1
  components_le_entities := by have := T.edge_count; omega
  entities_le_cells_add_components := by have := T.edge_count; omega

/-- **Every tree-cover is coordination-free.** A finite tree's source–stance nerve has
`Ȟ¹ = 0`: the spanning identity `|E| + 1 = |V|` (`Discrete.FinTree.edge_count`) forces the
cycle rank to vanish. The fully graph-backed, assumption-free witness of the iff on the
connected, acyclic case. -/
theorem tree_coordination_free {V : Type} [DecidableEq V] (T : Infomaterial.Discrete.Graph.FinTree V) :
    (CoverNerve.ofTree T).H1rank = 0 := by
  have h := T.edge_count
  show (T.fin.ecard + 1) - T.fin.vcard = 0
  omega

/-! ## The sheaf-gluing side — the existence half, cited from the settling sheaf model -/

/-- **An agreeing family over a cover glues (existence).** The settling sheaf model already
proves the existence half of "glues ⟺ `[δs] = 0`": every 1-cocycle (agreeing family) over a
cover is a coboundary — it glues to a global `F_U`-section, uniquely (`Cohomology.h1_vanishes`).
This is the coordination-free direction; the combinatorial obstruction *rank* of the same
cover is `CoverNerve.H1rank` above, vanishing exactly on the forest case. -/
theorem agreeing_family_glues (D : Cech1) (h : Cocycle D) :
    (∃ g : Cochain, Coboundary D g) ∧ (∀ g g' : Cochain, Coboundary D g → Coboundary D g' → g = g') :=
  h1_vanishes D h

end Cohomology
end Infomaterial
