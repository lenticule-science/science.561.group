import Obsmetrologia.Calculus.Order.ChromaticNumber

/-!
# Finite Ramsey: the party theorem `R(3,3) ≤ 6`

`ChromaticNumber` colours **vertices** so adjacent ones differ; Ramsey colours **edges** and asks
for monochromatic structure. The two are the same alphabet read twice: there a colouring avoids a
pattern, here every colouring is *forced* to contain one. This module proves the smallest Ramsey number bound — the **party theorem**:

> Among any six people, three are mutual acquaintances or three are mutual strangers.

Equivalently: every 2-colouring of the edges of the complete graph `K₆` contains a **monochromatic
triangle** (`ramsey_three_three`), so `R(3,3) ≤ 6`. The proof is the textbook pigeonhole, made
constructive: at any vertex, of its five edges three share a colour (`three_of_five`, decided over
`Bool`); among that triple, either one inner edge closes a monochromatic triangle through the
centre, or all three inner edges carry the other colour and the triple is itself monochromatic
(`mono_of_three_spokes`).

This canonicalizes the Ramsey material that `combinatorics.md` had named-as-deferred. The corpus's
archived "relational Ramsey" sketch modelled a *complete* graph with a total edge function and so
only re-proved that any subset of `Kₙ` is a clique — a triviality, not Ramsey. The content of
Ramsey is the **two-colouring** and the **pigeonhole bound**, which is what is proved here.

## Main definitions
* `MonoTriangle` — three distinct vertices whose three connecting edges share one colour.

## Main results
* `three_of_five` — of five `Bool` edge-colours, some three coincide (pigeonhole, `decide`).
* `mono_of_three_spokes` — three equal spokes from a centre force a monochromatic triangle.
* `ramsey_three_three` — every symmetric 2-colouring of `K₆` has a monochromatic triangle: `R(3,3) ≤ 6`.

## Implementation notes
A 2-colouring of the edges of `K₆` is a symmetric `c : Fin 6 → Fin 6 → Bool` (the colour of the
unordered edge `{i,j}`; the diagonal is unused). The general finite Ramsey theorem `R(k,k) < ∞` and
the lower bound `R(3,3) = 6` (the 5-cycle colouring of `K₅` with no monochromatic triangle) remain
frontier — red blueprint nodes whose `\uses` is this module.

## References
Corpus `combinatorics.md` (extremal/Ramsey, named-as-deferred); Diestel ch. 9 (Ramsey theory).

## Tags
ramsey, monochromatic triangle, pigeonhole, party theorem, extremal combinatorics
-/

namespace Obsmetrologia
namespace Combinatorics

/-- A **monochromatic triangle** of an edge-colouring `c`: three distinct vertices `i, j, k` whose
three connecting edges all carry one colour. -/
def MonoTriangle {n : Nat} (c : Fin n → Fin n → Bool) : Prop :=
  ∃ i j k : Fin n, i ≠ j ∧ i ≠ k ∧ j ≠ k ∧ c i j = c i k ∧ c i k = c j k

/-- **Pigeonhole on five `Bool`s.** Among five edge-colours, some three coincide — one of the
`C(5,3) = 10` triples is constant. Decided by `Bool` exhaustion (32 cases). -/
theorem three_of_five (b1 b2 b3 b4 b5 : Bool) :
    (b1 = b2 ∧ b2 = b3) ∨ (b1 = b2 ∧ b2 = b4) ∨ (b1 = b2 ∧ b2 = b5) ∨
    (b1 = b3 ∧ b3 = b4) ∨ (b1 = b3 ∧ b3 = b5) ∨ (b1 = b4 ∧ b4 = b5) ∨
    (b2 = b3 ∧ b3 = b4) ∨ (b2 = b3 ∧ b3 = b5) ∨ (b2 = b4 ∧ b4 = b5) ∨
    (b3 = b4 ∧ b4 = b5) := by
  cases b1 <;> cases b2 <;> cases b3 <;> cases b4 <;> cases b5 <;> decide

/-- **Three equal spokes force a monochromatic triangle.** If a centre `z` joins three distinct
vertices `p, q, r` by edges of one colour `b = c z p = c z q = c z r`, then either some inner edge
`pq`, `qr`, or `pr` also has colour `b` (closing a `b`-triangle through `z`), or all three inner
edges have the other colour and `{p,q,r}` is itself monochromatic. -/
theorem mono_of_three_spokes {n : Nat} (c : Fin n → Fin n → Bool)
    {z p q r : Fin n} (hzp : z ≠ p) (hzq : z ≠ q) (hzr : z ≠ r)
    (hpq : p ≠ q) (hpr : p ≠ r) (hqr : q ≠ r)
    (h1 : c z p = c z q) (h2 : c z q = c z r) : MonoTriangle c := by
  by_cases hpqb : c p q = c z p
  · -- triangle through z, p, q
    exact ⟨z, p, q, hzp, hzq, hpq, h1, h1.symm.trans hpqb.symm⟩
  · by_cases hqrb : c q r = c z p
    · -- triangle through z, q, r
      exact ⟨z, q, r, hzq, hzr, hqr, h2, ((h1.trans h2).symm).trans hqrb.symm⟩
    · by_cases hprb : c p r = c z p
      · -- triangle through z, p, r
        exact ⟨z, p, r, hzp, hzr, hpr, h1.trans h2, ((h1.trans h2).symm).trans hprb.symm⟩
      · -- all three inner edges avoid the spoke colour, so they all equal `!(c z p)`
        have e1 : c p q = !(c z p) := by cases hcz : c z p <;> cases hc : c p q <;> simp_all
        have e2 : c q r = !(c z p) := by cases hcz : c z p <;> cases hc : c q r <;> simp_all
        have e3 : c p r = !(c z p) := by cases hcz : c z p <;> cases hc : c p r <;> simp_all
        exact ⟨p, q, r, hpq, hpr, hqr, e1.trans e3.symm, e3.trans e2.symm⟩

/-- **The party theorem / `R(3,3) ≤ 6`.** Every symmetric 2-colouring of the edges of `K₆` contains
a monochromatic triangle: among six people, three are mutual acquaintances or three mutual
strangers. Pigeonhole at vertex `0` (`three_of_five` over its five edges) feeds
`mono_of_three_spokes`. -/
theorem ramsey_three_three (c : Fin 6 → Fin 6 → Bool) :
    MonoTriangle c := by
  rcases three_of_five (c 0 1) (c 0 2) (c 0 3) (c 0 4) (c 0 5) with
    ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩
  · exact mono_of_three_spokes c (z := 0) (p := 1) (q := 2) (r := 3)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 1) (q := 2) (r := 4)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 1) (q := 2) (r := 5)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 1) (q := 3) (r := 4)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 1) (q := 3) (r := 5)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 1) (q := 4) (r := 5)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 2) (q := 3) (r := 4)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 2) (q := 3) (r := 5)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 2) (q := 4) (r := 5)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b
  · exact mono_of_three_spokes c (z := 0) (p := 3) (q := 4) (r := 5)
      (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) a b

end Combinatorics
end Obsmetrologia
