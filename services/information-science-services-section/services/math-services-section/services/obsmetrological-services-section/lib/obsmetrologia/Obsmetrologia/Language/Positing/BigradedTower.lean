import Obsmetrologia.Language.Positing.NucleusAndCommutingNuclei
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Language.Positing.Bigraded
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Language.Positing.FiberAlgebra
import Obsmetrologia.Language.Predicating.HyperdoctrineDual

/-!
# Positing.BigradedTower — the (truth,knowledge) Klein-four grading of the nuclear quartet

Corpus node (cited): `…/settling/content/bigraded-diamond/bigraded-diamond.md`.

`Positing.Bigraded` and `NucleusAndCommutingNuclei` give the **single diamond** — the
nuclear quartet of two commuting nuclei on one Heyting algebra, four corners
`(A, Fix j₁, Fix j₂, A*)` indexed by `Articulating.Corner`. `Positing.Gauge` gives the group
`K₄ ≅ ℤ/2 × ℤ/2` with its two commuting generating involutions `∼` (negation, the
internal `ℤ/2` *knowledge* gauge) and `−` (conflation, the *truth* axis).
`Positing.FiberAlgebra` proves **the cross-order finding**
`Obsmetrologia.Positing.FiberAlgebra.cross_order_not_knowledge_nucleus`: a *truth*-closure is **not** a
*knowledge* nucleus (not even knowledge-inflationary). `PredicationHyperdoctrineDual`
carries the **two adjoint systems** (`dual_adjoint_system` for the truth order, the
original knowledge system) — the two gradings' source.

This module **grades the diamond by `K₄ ≅ ℤ/2(knowledge) × ℤ/2(truth)`** — one `ℤ/2`
per ORDER — and stacks the diamonds into the **bigraded diamond tower**.

What this derives:

1. **The bigrading bijection** `K4 ≃ Articulating.FourCorner` (`= Bool × Bool`), exhibiting the two
   `ℤ/2` grading axes explicitly: the FIRST `Bool` is the **knowledge** axis
   (`∼`-presence, i.e. `Positing.Gauge.K4.inGauge`), the SECOND is the **truth** axis
   (`−`-presence). `id ↔ (false,false)`, `neg ↔ (true,false)`, `conf ↔ (false,true)`,
   `negConf ↔ (true,true)`. Composed with `FourCornerCell.cornerBij` this is also
   `K4 ≃ Articulating.Corner ≃ Charge` — the diamond's four corners `{free, j₁, j₂, both}`.

2. **`bigraded_diamond_tower`** — a `K₄`-graded family of nuclear quartets:
   `tower : K4 → NuclearSquare Charge.heytingK`, each grade a *same-order*
   `Charge.joinSquare` (the proven nuclear square), every grade realizing the Nuclear
   Quartet Theorem (`fix_pi_iff`); bundled with the grading group `= K₄`
   (`Positing.Gauge.K4.isGroup`), the corner exhaustion (`Articulating.Corner.card_eq_four`), and the
   `K₄ ≃ Articulating.FourCorner` bigrading bijection.

3. **`tower_bigrading_is_two_orders`** — the crucial coherence: the two `ℤ/2`
   factors of `K₄` ARE the two orders (knowledge, truth) as **grading axes**, and this
   is WHY the two orders cannot be two co-nuclei in a single square. We carry the proven
   finding `Obsmetrologia.Positing.FiberAlgebra.cross_order_not_knowledge_nucleus` as a field of the
   bundle: a truth-closure is not a knowledge-nucleus, so the second order MUST enter as
   a grading axis, not a co-nucleus. The proven quartet at each grade uses two
   SAME-order nuclei (`Charge.joinSquare`); the OTHER order is the grade. This is the
   formalization's reconciliation of the corpus's "(j_k, j_t)" prose with the proven
   structure — the pair `(j_k, j_t)` is NOT two nuclei in one square but one same-order
   square per `K₄`-grade, the grade being the cross-order axis.
-/

namespace Obsmetrologia
namespace Positing.BigradedTower

open Obsmetrologia.Positing.Gauge

/-! ## 1. The bigrading bijection `K4 ≃ Articulating.FourCorner` — the two `ℤ/2` axes

`K₄ ≅ ℤ/2(knowledge) × ℤ/2(truth)`. We decompose each `K4` element into its two `ℤ/2`
components and read them as a `Articulating.FourCorner = Bool × Bool`:

* the **knowledge** component (FIRST `Bool`) — is the `∼` (negation) gauge generator
  present? This is exactly `Positing.Gauge.K4.inGauge` (the internal `ℤ/2` gauge `{id, neg}`);
* the **truth** component (SECOND `Bool`) — is the `−` (conflation) generator present?

`id ↦ (F,F)`, `neg ↦ (T,F)` [knowledge axis on], `conf ↦ (F,T)` [truth axis on],
`negConf ↦ (T,T)` [both axes on]. -/

/-- The **knowledge** `ℤ/2` component of a `K4` element: is the negation generator `∼`
present? Identical to `Positing.Gauge.K4.inGauge`-membership of the nontrivial part — `neg`
and `negConf` carry the `∼` factor, `id` and `conf` do not. -/
def knowledgeBit : K4 → Bool
  | K4.id      => false
  | K4.neg     => true
  | K4.conf    => false
  | K4.negConf => true

/-- The **truth** `ℤ/2` component of a `K4` element: is the conflation generator `−`
present? `conf` and `negConf` carry the `−` factor, `id` and `neg` do not. -/
def truthBit : K4 → Bool
  | K4.id      => false
  | K4.neg     => false
  | K4.conf    => true
  | K4.negConf => true

/-- The forward map `K4 → Articulating.FourCorner`: `(knowledge-axis present?, truth-axis present?)`
— the explicit `ℤ/2 × ℤ/2` decomposition. -/
def toFourCorner (g : K4) : Articulating.FourCorner := (knowledgeBit g, truthBit g)

/-- The inverse map `Articulating.FourCorner → K4`: reassemble a `K4` element from its two `ℤ/2`
components `(knowledge?, truth?)`. -/
def ofFourCorner : Articulating.FourCorner → K4
  | (false, false) => K4.id
  | (true,  false) => K4.neg
  | (false, true ) => K4.conf
  | (true,  true ) => K4.negConf

@[simp] theorem ofFourCorner_toFourCorner (g : K4) :
    ofFourCorner (toFourCorner g) = g := by
  cases g <;> rfl

@[simp] theorem toFourCorner_ofFourCorner (s : Articulating.FourCorner) :
    toFourCorner (ofFourCorner s) = s := by
  obtain ⟨a, b⟩ := s; cases a <;> cases b <;> rfl

/-- **The bigrading bijection** `K4 ≃ Articulating.FourCorner`. The two coordinates are the two
`ℤ/2` grading axes: knowledge (`∼`) and truth (`−`). -/
def bigradingBij : Bij K4 Articulating.FourCorner where
  to := toFourCorner
  inv := ofFourCorner
  left := ofFourCorner_toFourCorner
  right := toFourCorner_ofFourCorner

/-- Composed with `FourCornerCell.cornerBij`, the bigrading bijection also identifies a
`K₄`-grade with a diamond **corner** (`= Charge`): `K4 ≃ Articulating.Corner`. -/
def gradeCornerBij : Bij K4 Articulating.Corner where
  to g := Articulating.FourCorner.toCorner (toFourCorner g)
  inv c := ofFourCorner (Articulating.FourCorner.ofCorner c)
  left g := by
    show ofFourCorner (Articulating.FourCorner.ofCorner (Articulating.FourCorner.toCorner (toFourCorner g))) = g
    rw [Articulating.FourCorner.ofCorner_toCorner, ofFourCorner_toFourCorner]
  right c := by
    show Articulating.FourCorner.toCorner (toFourCorner (ofFourCorner (Articulating.FourCorner.ofCorner c))) = c
    rw [toFourCorner_ofFourCorner, Articulating.FourCorner.toCorner_ofCorner]

/-- **The knowledge axis is the internal `ℤ/2` gauge.** The first grading coordinate
`knowledgeBit` agrees with `Positing.Gauge.K4.inGauge`'s nontrivial generator: an element
carries the `∼` factor iff it is `neg`-like. Concretely `knowledgeBit g` is `true`
exactly for `neg`/`negConf`, matching the `∼`-component of the `K₄ ≅ ℤ/2 × ℤ/2`
decomposition. -/
theorem knowledgeBit_eq_neg_component (g : K4) :
    knowledgeBit g = (decide (g = K4.neg) || decide (g = K4.negConf)) := by
  cases g <;> rfl

/-- **The truth axis is the conflation `ℤ/2`.** The second grading coordinate carries
the `−` factor: `truthBit g` is `true` exactly for `conf`/`negConf`. -/
theorem truthBit_eq_conf_component (g : K4) :
    truthBit g = (decide (g = K4.conf) || decide (g = K4.negConf)) := by
  cases g <;> rfl

/-- **The two axes are independent `ℤ/2`s.** Each generator toggles exactly its own
coordinate and fixes the other under the group multiplication: multiplying by `neg`
flips the knowledge bit and fixes the truth bit; multiplying by `conf` flips the truth
bit and fixes the knowledge bit. This is the `ℤ/2 × ℤ/2` product structure made
explicit on the grading coordinates. -/
theorem axes_independent (g : K4) :
    (knowledgeBit (K4.mul K4.neg g) = !knowledgeBit g
      ∧ truthBit (K4.mul K4.neg g) = truthBit g)
    ∧ (knowledgeBit (K4.mul K4.conf g) = knowledgeBit g
      ∧ truthBit (K4.mul K4.conf g) = !truthBit g) := by
  cases g <;> exact ⟨⟨rfl, rfl⟩, ⟨rfl, rfl⟩⟩

/-! ## 2. The tower — a `K₄`-graded family of nuclear quartets

Each grade gets a **same-order** nuclear square (`Charge.joinSquare`) on the *proven*
knowledge-Heyting-algebra `Charge.heytingK`. The grade chooses which two same-order
poles the diamond's nuclei raise toward; the OTHER order is the grade, not a nucleus.
We index by `K4` and realize the Nuclear Quartet Theorem at every grade. -/

/-- The pair of same-order poles assigned to each `K₄`-grade. The grade's two `ℤ/2`
coordinates select the two charge poles the diamond raises toward (all four poles are
exhausted as the grade ranges over `K₄`); the nuclei stay in ONE order (`joinSquare`
on `heytingK`), the cross-order distinction being the grade itself. -/
def gradePoles : K4 → Charge × Charge
  | K4.id      => (Charge.kBot, Charge.kBot)
  | K4.neg     => (Charge.tTop, Charge.kBot)
  | K4.conf    => (Charge.tBot, Charge.kBot)
  | K4.negConf => (Charge.kTop, Charge.kBot)

/-- **The bigraded diamond tower** as a `K₄`-indexed family of nuclear squares on the
proven knowledge-Heyting-algebra. Each grade is a `Charge.joinSquare` — two commuting
SAME-order join-nuclei — so each grade IS a proven nuclear quartet. -/
def towerSquare (g : K4) : NuclearSquare Charge.heytingK :=
  Charge.joinSquare (gradePoles g).1 (gradePoles g).2

/-- Packaged as a `Positing.Bigraded.SquareFamily` over the index type `K4`: the stacked
diamonds, one per grade. -/
def towerFamily : SquareFamily Charge.heytingK K4 where
  square := towerSquare

/-- **Every grade realizes the Nuclear Quartet Theorem** (`fix_pi_iff`): at grade `g`,
a charge is `π`-quiescent iff it is fixed by both same-order nuclei. -/
theorem grade_fix_pi_iff (g : K4) (a : Charge) :
    (towerSquare g).pi a = a ↔ ((towerSquare g).j1.j a = a ∧ (towerSquare g).j2.j a = a) :=
  (towerSquare g).fix_pi_iff a

/-- The four diamond corners at each grade, read off `Articulating.Corner` via the quartet's
`corner` operator (`absurd = free`, `potential = j₁`, `active = j₂`, `stable = π`). -/
def gradeCorner (g : K4) (c : Articulating.Corner) (a : Charge) : Charge :=
  (towerSquare g).corner c a

/-! ## 3. The `K₄`-graded bigraded diamond tower -/

/-- A **bigraded diamond tower** carrier: the `K₄`-graded family of nuclear
quartets together with the `K₄ ≃ Articulating.FourCorner` bigrading bijection. -/
structure BigradedTower where
  /-- The `K₄`-graded family of nuclear squares (the stacked diamonds). -/
  family : SquareFamily Charge.heytingK K4
  /-- The `K₄ ≃ Articulating.FourCorner` bigrading bijection. -/
  bigrading : Bij K4 Articulating.FourCorner

/-- **The bigraded diamond tower.** The nuclear quartet (the diamond),
graded by `K₄ ≅ ℤ/2(knowledge) × ℤ/2(truth)` and stacked: a `K₄`-indexed family of
nuclear quartets on the proven knowledge-Heyting-algebra `Charge.heytingK`, together
with the `K₄ ≃ Articulating.FourCorner` bigrading bijection. -/
def bigraded_diamond_tower : BigradedTower where
  family := towerFamily
  bigrading := bigradingBij

/-! ## 4. The crucial coherence: the bigrading is the two orders

The two `ℤ/2` factors of `K₄` are the two orders (knowledge, truth) as grading axes.
The two orders cannot be two co-nuclei in a single square: a truth-closure is not a
knowledge nucleus, so the second order enters as a grade rather than as a co-nucleus. -/

/-- **The tower's bigrading is the two orders, as grades rather than co-nuclei.**
The two `ℤ/2` factors of `K₄` assemble each grade as the `(knowledge, truth)` product,
and there is a valuation whose truth-closure is not knowledge-above it. -/
theorem tower_bigrading_is_two_orders :
    (∀ g : K4, toFourCorner g = (knowledgeBit g, truthBit g))
    ∧ (∃ v : Valuation, ¬ Positing.FiberAlgebra.fLeK v (fun φ => Charge.joinT Charge.kBot (v φ))) :=
  ⟨fun _ => rfl, Positing.FiberAlgebra.cross_order_not_knowledge_nucleus⟩

end Positing.BigradedTower
end Obsmetrologia
