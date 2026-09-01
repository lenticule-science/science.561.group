import Obsmetrologia.Calculus.Order.SetNumberGraphTheory
import Obsmetrologia.Calculus.Order.NumberTheoryCombinatorics

/-!
# CombinatoricsExtremal — degree parity (the handshake corollary) and the
bipartite/2-coloring necessary direction

This module adds the **extremal / parity / coloring** layer of finite graph theory on
top of the graph spine already present in `SetNumberGraphTheory.lean` (`Graph`,
`FinGraph`, `outDeg`/`inDeg`, the directed handshake identities
`sum_outDeg_eq_ecard` / `sum_inDeg_eq_edgesInto`, `DAG`, `Reach`, `FinTree`). The
received content (`_archive/combinatorics/combinatorics.md`) names graph theory as
predication over a finite carrier; among its proved claims are the **handshake
lemma** and the tree-equivalences, while the **extremal / Ramsey** material is
named-as-deferred. We prove here the two *necessary*-direction consequences that the
handshake structure already forces, and document the harder converses.

## Degree parity — the handshake corollary

For a finite **undirected** graph (a `Symmetric`, `Irreflexive` adjacency over a
listed vertex set), the **degree** of a vertex is its count of listed neighbors. The
degree sum is the double sum `Σ_v Σ_w [u∼w]` of the symmetric, diagonal-zero
incidence indicator; a symmetric, diagonal-zero double sum over `L × L` is **even**
(each off-diagonal pair `{v,w}` is counted at both `(v,w)` and `(w,v)`). Hence
**`Σ degree` is even (`= 2|E|`)** — the handshake corollary. A pure list-parity lemma
— `Σ f ≡ #{odd f} (mod 2)` — then yields **the number of odd-degree vertices is
even**, the necessary condition for an Eulerian circuit (`combinatorics.md`).

## Bipartite / 2-coloring — the necessary direction of König

A graph is **bipartite** when its vertices 2-color (`c : V → Bool`) with **no
monochromatic edge**: every edge joins the two colors. Along any **walk** the color
alternates, so the color at the endpoint is the start color XOR the parity of the walk
length. A **closed** walk returns to its start vertex, hence to its start color,
forcing the parity of its length to be even: a bipartite graph has **no odd closed
walk** — the easy/necessary half of the König characterization
(bipartite ⇔ no odd cycle).
-/

namespace Obsmetrologia
namespace Combinatorics

open Obsmetrologia.Discrete (Graph)
open Obsmetrologia.Discrete.Graph (FinGraph Irreflexive)

/-! # =====================================================================
    # (A) List parity: a sum is even iff an even number of summands are odd
    # ===================================================================== -/

/-- The number of **odd** values of `f` over a list `L` — a `List.filter`-length count. -/
def countOdd {V : Type} (f : V → Nat) (L : List V) : Nat :=
  (L.filter (fun v => decide (f v % 2 = 1))).length

/-- **List parity.** The parity of `Σ_{v ∈ L} f v` equals the parity of the number of
`v ∈ L` with `f v` odd: `(Σ f) % 2 = (#{v : f v odd}) % 2`. Induction on `L`, splitting
on the parity of the head. -/
theorem sum_mod_two {V : Type} (f : V → Nat) (L : List V) :
    ((L.map f).foldr (· + ·) 0) % 2 = (countOdd f L) % 2 := by
  induction L with
  | nil => rfl
  | cons v L ih =>
    show (f v + (L.map f).foldr (· + ·) 0) % 2 = (countOdd f (v :: L)) % 2
    have hcount : countOdd f (v :: L)
        = (if f v % 2 = 1 then 1 else 0) + countOdd f L := by
      unfold countOdd
      rw [List.filter_cons]
      by_cases hodd : f v % 2 = 1
      · rw [decide_eq_true hodd, if_pos rfl, if_pos hodd, List.length_cons]; omega
      · rw [decide_eq_false hodd, if_neg (by decide : ¬(false = true)), if_neg hodd]
        omega
    rw [hcount]
    by_cases hodd : f v % 2 = 1
    · rw [if_pos hodd]; omega
    · rw [if_neg hodd]; omega

/-- **Even sum ⇒ even count of odd summands.** If `Σ_{v ∈ L} f v` is even then the
number of `v ∈ L` with `f v` odd is even — the handshake corollary's engine. -/
theorem countOdd_even_of_sum_even {V : Type} (f : V → Nat) (L : List V)
    (h : (L.map f).foldr (· + ·) 0 % 2 = 0) : countOdd f L % 2 = 0 := by
  rw [← sum_mod_two]; exact h

/-! # =====================================================================
    # (B) Symmetric, diagonal-zero double sums are even
    # ===================================================================== -/

/-- A fold of a pointwise sum splits: `Σ (p v + q v) = Σ p v + Σ q v`. -/
theorem foldr_map_add {V : Type} (p q : V → Nat) (L : List V) :
    (L.map (fun v => p v + q v)).foldr (· + ·) 0
      = (L.map p).foldr (· + ·) 0 + (L.map q).foldr (· + ·) 0 := by
  induction L with
  | nil => rfl
  | cons a L ih =>
    rw [List.map_cons, List.foldr_cons, List.map_cons, List.foldr_cons,
        List.map_cons, List.foldr_cons, ih]
    omega

/-- A double sum `Σ_{v ∈ L} g v a` of a fixed second argument `a`, as a single fold. -/
def colSum {V : Type} (g : V → V → Nat) (L : List V) (a : V) : Nat :=
  (L.map (fun v => g v a)).foldr (· + ·) 0
/-- A double sum `Σ_{w ∈ L} g a w` over the second argument. -/
def rowSum {V : Type} (g : V → V → Nat) (L : List V) (a : V) : Nat :=
  (L.map (fun w => g a w)).foldr (· + ·) 0
/-- The full double sum `Σ_{v ∈ L} Σ_{w ∈ L} g v w`. -/
def dsum {V : Type} (g : V → V → Nat) (L : List V) : Nat :=
  (L.map (fun v => rowSum g L v)).foldr (· + ·) 0

/-- For a symmetric `g`, the row sum and column sum at a point coincide:
`Σ_w g a w = Σ_v g v a`. -/
theorem row_eq_col {V : Type} {g : V → V → Nat} (hsym : ∀ u v, g u v = g v u)
    (L : List V) (a : V) : rowSum g L a = colSum g L a := by
  unfold rowSum colSum
  have : (fun w => g a w) = (fun v => g v a) := by funext w; exact hsym a w
  rw [this]

/-- **Symmetric, diagonal-zero double sums are even.** If `g v v = 0` for all `v` and
`g` is symmetric, then `Σ_{v∈L} Σ_{w∈L} g v w` is even. Induction on `L`: peeling the
head `a` contributes `g a a = 0`, the cross terms `Σ_w g a w + Σ_v g v a = 2·rowSum`
(by symmetry), and the inner block (even by IH). -/
theorem dsum_even {V : Type} {g : V → V → Nat}
    (hdiag : ∀ v, g v v = 0) (hsym : ∀ u v, g u v = g v u) (L : List V) :
    dsum g L % 2 = 0 := by
  induction L with
  | nil => rfl
  | cons a L ih =>
    show ((( (a :: L).map (fun v => rowSum g (a :: L) v)).foldr (· + ·) 0) % 2 = 0)
    rw [List.map_cons, List.foldr_cons]
    have hra : rowSum g (a :: L) a = rowSum g L a := by
      unfold rowSum; rw [List.map_cons, List.foldr_cons, hdiag, Nat.zero_add]
    have hrv : ∀ v, rowSum g (a :: L) v = g v a + rowSum g L v := by
      intro v; unfold rowSum; rw [List.map_cons, List.foldr_cons]
    rw [hra]
    have hsplit :
        ((L.map (fun v => rowSum g (a :: L) v)).foldr (· + ·) 0)
          = colSum g L a + dsum g L := by
      have hfun : (fun v => rowSum g (a :: L) v)
          = (fun v => g v a + rowSum g L v) := by funext v; exact hrv v
      rw [hfun, foldr_map_add]
      rfl
    rw [hsplit, ← row_eq_col hsym L a]
    -- (rowSum L a + (rowSum L a + dsum L)) % 2 = 0, using ih : dsum L % 2 = 0
    omega

/-! # =====================================================================
    # (C) Undirected graphs: symmetric, degree, and the even degree sum
    # ===================================================================== -/

/-- A graph is **symmetric** (undirected) when adjacency is unordered:
`u ∼ v ↔ v ∼ u`. -/
def Symmetric {V : Type} (F : FinGraph V) : Prop := ∀ u v, F.graph u v = F.graph v u

/-- The **degree** of a vertex in the undirected reading: its count of listed
neighbors — exactly the spine's `outDeg`. -/
def degree {V : Type} [DecidableEq V] (F : FinGraph V) (v : V) : Nat := F.outDeg v

/-- The degree sum `Σ_v degree(v)` over the vertex list. -/
def degSum {V : Type} [DecidableEq V] (F : FinGraph V) : Nat := F.sumVerts (degree F)

/-- The **incidence indicator** `[u ∼ w]` as a `Nat` (`1` if adjacent, else `0`). -/
def inc {V : Type} (F : FinGraph V) (v w : V) : Nat :=
  if F.graph v w = true then 1 else 0

/-- The degree of `v` is the row sum of the incidence indicator: a `filter`-length
equals the sum of the matching indicators. -/
theorem outDeg_eq_rowSum {V : Type} [DecidableEq V] (F : FinGraph V) (v : V) :
    F.outDeg v = rowSum (inc F) F.verts v := by
  show (F.verts.filter (fun w => F.graph v w)).length = rowSum (inc F) F.verts v
  unfold rowSum
  induction F.verts with
  | nil => rfl
  | cons w L ih =>
    rw [List.filter_cons, List.map_cons, List.foldr_cons]
    have hinc : inc F v w = (if F.graph v w = true then 1 else 0) := rfl
    rw [hinc]
    by_cases hg : F.graph v w = true
    · rw [if_pos hg, if_pos hg, List.length_cons, ih]; omega
    · rw [if_neg hg, if_neg hg, Nat.zero_add, ih]

/-- The degree sum is the full double sum of the incidence indicator,
`Σ_v Σ_w [v ∼ w]`. -/
theorem degSum_eq_dsum {V : Type} [DecidableEq V] (F : FinGraph V) :
    degSum F = dsum (inc F) F.verts := by
  show F.sumVerts (degree F) = dsum (inc F) F.verts
  unfold Obsmetrologia.Discrete.Graph.FinGraph.sumVerts dsum
  apply congrArg (fun l => List.foldr (· + ·) 0 l)
  apply List.map_congr_left
  intro v _
  show degree F v = rowSum (inc F) F.verts v
  exact outDeg_eq_rowSum F v

/-- The incidence indicator of an **irreflexive** graph is diagonal-zero. -/
theorem inc_diag {V : Type} (F : FinGraph V) (hirr : Irreflexive F.graph) (v : V) :
    inc F v v = 0 := by
  unfold inc; rw [hirr v]; rfl
/-- The incidence indicator of a **symmetric** graph is symmetric. -/
theorem inc_symm {V : Type} (F : FinGraph V) (hsym : Symmetric F) (u v : V) :
    inc F u v = inc F v u := by
  unfold inc; rw [hsym u v]

/-- **The degree sum of a finite undirected graph is even** (`= 2|E|`): the handshake
corollary. The incidence indicator is symmetric (undirected) and diagonal-zero
(irreflexive), so its double sum over `verts × verts` is even by `dsum_even`. -/
theorem degSum_even {V : Type} [DecidableEq V] (F : FinGraph V)
    (hsym : Symmetric F) (hirr : Irreflexive F.graph) : degSum F % 2 = 0 := by
  rw [degSum_eq_dsum F]
  exact dsum_even (inc_diag F hirr) (inc_symm F hsym) F.verts

/-- The degree sum, as a fold over the mapped degrees (the form `sum_mod_two`
consumes). -/
theorem degSum_eq_fold {V : Type} [DecidableEq V] (F : FinGraph V) :
    degSum F = (F.verts.map (degree F)).foldr (· + ·) 0 := rfl

/-- **The number of odd-degree vertices is even.** From `degSum_even` and the list
parity lemma: in a finite undirected graph the count of vertices of odd degree is
even — the necessary condition for an Eulerian circuit (`combinatorics.md`). -/
theorem countOdd_degree_even {V : Type} [DecidableEq V] (F : FinGraph V)
    (hsym : Symmetric F) (hirr : Irreflexive F.graph) :
    countOdd (degree F) F.verts % 2 = 0 := by
  apply countOdd_even_of_sum_even
  rw [← degSum_eq_fold]
  exact degSum_even F hsym hirr

/-! # =====================================================================
    # (D): handshake and degree parity
    # ===================================================================== -/

/-- **`handshake_and_degree_parity`.** For any finite undirected graph
(`Symmetric` adjacency, `Irreflexive`, over a listed vertex set), bundling:

* `degSum = ecard` — the degree sum equals the directed edge count (the spine's
  handshake identity `Σ outDeg = |E|`);
* `degSum % 2 = 0` — the **sum of all vertex degrees is EVEN** (`= 2|E|`); and
* `countOdd degree verts % 2 = 0` — consequently the **number of odd-degree vertices
  is EVEN**, the Eulerian-circuit necessary condition.

The evenness is the symmetric, diagonal-zero double-sum lemma `dsum_even`; the
odd-count consequence is the list-parity lemma `sum_mod_two`. (`combinatorics.md`,
handshake lemma & its corollary.) -/
theorem handshake_and_degree_parity {V : Type} [DecidableEq V] (F : FinGraph V)
    (hsym : Symmetric F) (hirr : Irreflexive F.graph) :
    degSum F = F.ecard ∧
    degSum F % 2 = 0 ∧
    countOdd (degree F) F.verts % 2 = 0 := by
  refine ⟨?_, degSum_even F hsym hirr, countOdd_degree_even F hsym hirr⟩
  show F.sumVerts (degree F) = F.ecard
  exact Obsmetrologia.Discrete.Graph.FinGraph.sum_outDeg_eq_ecard F

/-! # =====================================================================
    # (E) Bipartite / 2-coloring and walk parity
    # ===================================================================== -/

/-- A **walk** in `G` from `start`: a list of vertices `[v₁, …, vₙ]` such that
consecutive vertices (including `start → v₁`) are joined by an (undirected) edge. We
carry the start separately so a *closed* walk is "`walkEnd = start`". The walk's
**length** is the number of edges, `vs.length`. -/
def IsWalk {V : Type} (G : Graph V) : V → List V → Prop
  | _, [] => True
  | u, v :: vs => (G u v = true ∨ G v u = true) ∧ IsWalk G v vs

/-- The **last** vertex of a walk `start :: …`: the final vertex visited (`start` if
the walk is empty). The endpoint to compare with `start` for closedness. -/
def walkEnd {V : Type} (start : V) : List V → V
  | [] => start
  | v :: vs => walkEnd v vs

/-- A graph is **bipartite** when its vertices carry a 2-coloring `c : V → Bool` with
**no monochromatic edge**: every edge joins the two colors (`c u ≠ c v`). -/
def Bipartite {V : Type} (G : Graph V) : Prop :=
  ∃ c : V → Bool, ∀ u v, G u v = true → c u ≠ c v

/-- **Color alternation along a walk.** Under a proper 2-coloring, the color of the
walk's endpoint is the start color XOR'd by the parity of the walk length: along each
edge the color flips, so `c (walkEnd start vs) = c start XOR (length vs odd)`. -/
theorem walk_color {V : Type} {G : Graph V} {c : V → Bool}
    (hc : ∀ u v, G u v = true → c u ≠ c v) :
    ∀ (start : V) (vs : List V), IsWalk G start vs →
      c (walkEnd start vs) = (xor (c start) (decide (vs.length % 2 = 1))) := by
  intro start vs
  induction vs generalizing start with
  | nil => intro _; show c start = xor (c start) (decide (0 % 2 = 1)); simp
  | cons v vs ih =>
    intro hw
    obtain ⟨hedge, hrest⟩ := hw
    -- the edge start–v flips the color: c v = ! c start
    have hflip : c v = !(c start) := by
      rcases hedge with he | he
      · have hne : c start ≠ c v := hc start v he
        cases hs : c start <;> cases hv : c v <;> simp_all
      · have hne : c v ≠ c start := hc v start he
        cases hs : c start <;> cases hv : c v <;> simp_all
    have hih := ih v hrest
    show c (walkEnd v vs) = xor (c start) (decide ((vs.length + 1) % 2 = 1))
    rw [hih, hflip]
    -- (! c start) xor P(len vs)  =  c start xor P(len vs + 1):
    -- the two parity bits are complementary, so the flips cancel.
    have hpar : decide ((vs.length + 1) % 2 = 1) = !(decide (vs.length % 2 = 1)) := by
      rcases (by omega : vs.length % 2 = 0 ∨ vs.length % 2 = 1) with h0 | h1
      · have he : (vs.length + 1) % 2 = 1 := by omega
        rw [decide_eq_true he, h0]; rfl
      · have he : (vs.length + 1) % 2 = 0 := by omega
        rw [h1]
        have hne : ¬ ((vs.length + 1) % 2 = 1) := by omega
        rw [decide_eq_false hne]; rfl
    rw [hpar]
    cases c start <;> cases (decide (vs.length % 2 = 1)) <;> rfl

/-- **`bipartite_no_odd_closed_walk`.** A **bipartite** graph (2-colorable
with no monochromatic edge) has **no odd-length closed walk**: any walk that returns
to its start vertex (`walkEnd start vs = start`) has **even** length. Proof: along a
walk the color alternates (`walk_color`), so the endpoint color is `c start` XOR'd by
the length parity; a closed walk has endpoint `= start`, hence equal color, forcing
the length parity to be even. This is the **necessary** half of the König
characterization "bipartite ⇔ no odd cycle" (`combinatorics.md`). -/
theorem bipartite_no_odd_closed_walk {V : Type} {G : Graph V}
    (hbip : Bipartite G) :
    ∀ (start : V) (vs : List V), IsWalk G start vs → walkEnd start vs = start →
      vs.length % 2 = 0 := by
  obtain ⟨c, hc⟩ := hbip
  intro start vs hw hclosed
  have hcol := walk_color hc start vs hw
  rw [hclosed] at hcol
  -- c start = xor (c start) (decide (len odd)); so the flip bit is false ⇒ even.
  -- For any booleans b q, b = xor b q forces q = false.
  have hbit : decide (vs.length % 2 = 1) = false := by
    revert hcol
    cases hs : c start <;> cases hb : decide (vs.length % 2 = 1) <;>
      intro hcol <;> first | rfl | exact Bool.noConfusion hcol
  have hno : ¬ (vs.length % 2 = 1) := by
    intro h; rw [decide_eq_true h] at hbit; exact Bool.noConfusion hbit
  omega

/-- The two parity directions packaged together — the **necessary** direction of the
bipartite ⇔ no-odd-cycle equivalence — for citation alongside the handshake
headline. -/
theorem bipartite_parity {V : Type} {G : Graph V} (hbip : Bipartite G) :
    (∃ c : V → Bool, ∀ u v, G u v = true → c u ≠ c v) ∧
    (∀ (start : V) (vs : List V), IsWalk G start vs → walkEnd start vs = start →
      vs.length % 2 = 0) :=
  ⟨hbip, bipartite_no_odd_closed_walk hbip⟩

end Combinatorics
end Obsmetrologia
