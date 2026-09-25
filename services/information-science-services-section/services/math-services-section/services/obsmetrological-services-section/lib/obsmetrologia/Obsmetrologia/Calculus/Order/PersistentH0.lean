import Obsmetrologia.Calculus.Order.SetNumberGraphTheory

/-!
# Persistent H⁰: connected components only merge along a filtration

Persistent homology tracks topological features through a growing filtration. The degree-0 invariant
H⁰ counts **connected components**; its persistence content is the monotonicity law: as the filtration
grows (edges are added), components only **merge**, never split — so the component count is
non-increasing. This is the graph-level invariant of persistent H⁰ over a metric/alpha filtration, which
needs metric simplicial complexes and is out of this dependency-free core.

Connectivity is the reflexive–transitive closure of the undirected edge relation (`PathConn`).
Edge-monotone growth lifts to connectivity-monotone growth (`PathConn.mono`), so anything connected at
filtration stage `m` stays connected at every later stage `n ≥ m` (`components_only_merge`): the
equivalence classes (components) only coarsen, which is exactly "the number of components is
non-increasing."

The **cardinal** form `componentsAt n ≤ componentsAt m` is deliberately not stated: counting distinct
components needs decidable reachability plus finite-quotient cardinality infrastructure not yet in the
core. The relation-coarsening proved here is its content; the count is a follow-up once that machinery
exists.

## Main definitions
* `PathConn` — undirected connectivity; `GraphFiltration` — an edge-monotone family of graphs.

## Main results
* `PathConn.trans` — connectivity is transitive.
* `PathConn.mono` — edge growth lifts to connectivity growth.
* `components_only_merge` — connectivity at an earlier stage persists to every later stage.

## References
Corpus glass/topology line; the glass frontier memo (persistent homology, medium-range order — the
analytic theory; here the H⁰ component-merge projection).

## Tags
persistent homology, H0, connected components, filtration, glass
-/

namespace Obsmetrologia
namespace Calculus.Order

open Obsmetrologia.Discrete

/-- **Undirected connectivity** `u ~ w` in a graph: the reflexive–transitive closure of the undirected
edge relation (an edge in either direction). The component relation whose classes are the connected
components counted by H⁰. -/
inductive PathConn {V : Type} (G : Graph V) : V → V → Prop
  | refl (v : V) : PathConn G v v
  | step {u v w : V} : (G u v = true ∨ G v u = true) → PathConn G v w → PathConn G u w

/-- **Connectivity is transitive** — paths compose. -/
theorem PathConn.trans {V : Type} {G : Graph V} {u v w : V}
    (h1 : PathConn G u v) (h2 : PathConn G v w) : PathConn G u w := by
  induction h1 with
  | refl _ => exact h2
  | step huv _ ih => exact PathConn.step huv (ih h2)

/-- **Edge growth lifts to connectivity growth.** If every edge of `G` is an edge of `H`, then every
`G`-connection is an `H`-connection — adding edges can only connect more, never less. -/
theorem PathConn.mono {V : Type} {G H : Graph V}
    (hsub : ∀ u v, G u v = true → H u v = true) {u w : V}
    (h : PathConn G u w) : PathConn H u w := by
  induction h with
  | refl v => exact PathConn.refl v
  | step huv _ ih =>
      refine PathConn.step ?_ ih
      cases huv with
      | inl h => exact Or.inl (hsub _ _ h)
      | inr h => exact Or.inr (hsub _ _ h)

/-- A **graph filtration**: a family of graphs growing with the index — every edge present at stage `m`
is present at every later stage `n ≥ m`. -/
structure GraphFiltration (V : Type) where
  /-- The graph at each filtration stage. -/
  graphAt : Nat → Graph V
  /-- Edges only accumulate: a stage-`m` edge persists to every later stage. -/
  mono : ∀ {m n : Nat}, m ≤ n → ∀ u v, graphAt m u v = true → graphAt n u v = true

/-- **Components only merge.** Anything connected at filtration stage `m` is connected at every later
stage `n ≥ m` — equivalence classes (components) only coarsen as the filtration grows, the persistence
content of "the number of components is non-increasing." -/
theorem components_only_merge {V : Type} (F : GraphFiltration V) {m n : Nat} (hmn : m ≤ n)
    {u v : V} (h : PathConn (F.graphAt m) u v) : PathConn (F.graphAt n) u v :=
  PathConn.mono (fun a b hab => F.mono hmn a b hab) h

end Calculus.Order
end Obsmetrologia
