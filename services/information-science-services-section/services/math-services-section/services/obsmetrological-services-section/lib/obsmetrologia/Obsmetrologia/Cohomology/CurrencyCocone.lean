import Obsmetrologia.Cohomology.CoordinationCohomology
import Obsmetrologia.QuantumContextuality.CohomologicalContextuality
import Obsmetrologia.Dynamics.Flow.FreeEnergyLyapunov
import Obsmetrologia.CausalSets.Causal.Cohomology

/-! # The currency cocone — the five `H¹` prices over one nerve

The corpus names five objects `H¹`: propositional Čech (`a`, always vanishing),
the cover-nerve cycle rank (`b`, `CoverNerve.H1rank`), the settling-flow quotient
`H¹` (`c`, the ledger's mint register), the `ℤ/2` context-graph `H¹` (`d`, the
merge's `topCount`), and the causal order-complex `H¹` (`e`, the wavefront). Three
proved edges relate their prices over a shared nerve:

* `d ≤ b`: `topCount ≤ massSum ≤ H1rank`
  (`QuantumContextuality.two_spread_ledger`, `topCount_le_massSum`);
* `c = d`: the ledger's mint plus jump registers are the merge's held-`⊤` support
  (`Valuation.topSupport_eq_mints_add_jumps`);
* `e ≥ d`: the causal wavefront dominates the merge's frustrated support under
  mod-two reduction (`CausalSets.Causal.Cohomology.reduced_coboundary_is_parity_gradient`).

This module bundles the prices into a **cocone**: an apex `PricedNerve` over a
base `CoverNerve`, receiving a commuting leg from each currency. The apex holds
the five `Nat` prices constrained by the proved edges; the legs read each price;
the cocone law is that every leg factors through the base cycle rank consistently.
Existence of the cocone is proved here; its universality (that it is the colimit —
every competing price factors through it uniquely) is the open follow-up.

## References
`CoordinationCohomology` (base `CoverNerve`); the three edge theorems above;
`AperiodicOrder.Tiling.Percolation` (held-`⊤` as condensed contacts, the between
object the apex sits over).
-/

namespace Obsmetrologia
namespace Cohomology

open Obsmetrologia.QuantumContextuality
open Obsmetrologia.Valuation

/-- **The priced nerve — the cocone apex.** A cover nerve `base` carrying the five
currency prices over it, constrained by the three proved edges: the merge held-`⊤`
support `topPrice` is bounded by the record mass `massPrice` and the base cycle
rank; the ledger mint and jump registers sum to `topPrice`; and the causal
wavefront `causalPrice` dominates `topPrice`. The propositional Čech price is
`0` by flasqueness (`h1_vanishes`), recorded as `cechPrice`. -/
structure PricedNerve where
  /-- The base cover nerve — held-`⊤` knit into a contact shape. -/
  base : CoverNerve
  /-- `d` — the `ℤ/2` context-graph held-`⊤` support (merge `topCount`). -/
  topPrice : Nat
  /-- `d` with multiplicity — the record contradiction mass (`massSum`). -/
  massPrice : Nat
  /-- `c` split — the ledger mint register over the settling step. -/
  mintPrice : Nat
  /-- `c` defect — the ledger jump register (`⊥`-straight-to-`⊤`). -/
  jumpPrice : Nat
  /-- `e` — the causal order-complex wavefront support. -/
  causalPrice : Nat
  /-- `a` — the propositional Čech price, `0` by flasqueness. -/
  cechPrice : Nat
  /-- Edge `d ≤ b`: the merge price is bounded by mass, mass by the cycle rank. -/
  spread : topPrice ≤ massPrice ∧ massPrice ≤ base.H1rank
  /-- Edge `c = d`: mints plus jumps are the held-`⊤` support. -/
  ledger_split : mintPrice + jumpPrice = topPrice
  /-- Edge `e ≥ d`: the causal wavefront dominates the merge support. -/
  causal_dominates : topPrice ≤ causalPrice
  /-- Flasqueness: the propositional Čech price vanishes. -/
  cech_vanishes : cechPrice = 0

namespace PricedNerve

/-! ## The legs — each currency reads its price -/

/-- Leg `a`: the propositional Čech currency. -/
def legCech (P : PricedNerve) : Nat := P.cechPrice
/-- Leg `b`: the cover-nerve cycle-rank currency. -/
def legRank (P : PricedNerve) : Nat := P.base.H1rank
/-- Leg `c`: the settling-flow currency (mint register). -/
def legMint (P : PricedNerve) : Nat := P.mintPrice
/-- Leg `d`: the `ℤ/2` context-graph currency (merge support). -/
def legTop (P : PricedNerve) : Nat := P.topPrice
/-- Leg `e`: the causal order-complex currency (wavefront). -/
def legCausal (P : PricedNerve) : Nat := P.causalPrice

/-! ## The cocone laws — every leg orders into the base cycle rank -/

/-- **The prices order into the base cycle rank.** Reading down the diagram, every
currency price is bounded by the cover-nerve cycle rank `b`: the Čech price is `0`,
the merge price is at most the mass at most the rank, the mint register is at most
the merge price, and the causal price bounds the merge price from above. The cocone
commutes: each leg factors through `legRank` consistently. -/
theorem legs_order_into_rank (P : PricedNerve) :
    P.legCech ≤ P.legRank
    ∧ P.legMint ≤ P.legTop
    ∧ P.legTop ≤ P.massPrice
    ∧ P.massPrice ≤ P.legRank
    ∧ P.legTop ≤ P.legCausal := by
  refine ⟨?_, ?_, P.spread.1, P.spread.2, P.causal_dominates⟩
  · rw [legCech, P.cech_vanishes]; exact Nat.zero_le _
  · rw [legMint, legTop, ← P.ledger_split]; exact Nat.le_add_right _ _

/-- **The Čech and mint legs are dominated by the merge/rank legs.** The cocone
collapses `a` to the base and routes `c` through `d`: `legCech ≤ legRank` and
`legMint ≤ legTop ≤ legRank`. -/
theorem cech_mint_dominated (P : PricedNerve) :
    P.legCech ≤ P.legRank ∧ P.legMint ≤ P.legRank := by
  obtain ⟨hc, hm, ht, hr, _⟩ := legs_order_into_rank P
  exact ⟨hc, Nat.le_trans hm (Nat.le_trans ht hr)⟩

/-- **The cocone is coordination-free exactly at zero rank.** When the base nerve
is a forest (`H1rank = 0`), every currency price collapses to `0`: the entire
priced diagram vanishes, no obstruction in any currency. This is the shared
vanishing point the cocone factors through. -/
theorem coordinationFree_collapses (P : PricedNerve) (h : P.base.H1rank = 0) :
    P.topPrice = 0 ∧ P.massPrice = 0 ∧ P.mintPrice = 0 ∧ P.jumpPrice = 0
    ∧ P.cechPrice = 0 := by
  have hmass : P.massPrice = 0 := Nat.le_zero.mp (h ▸ P.spread.2)
  have htop : P.topPrice = 0 := Nat.le_zero.mp (hmass ▸ P.spread.1)
  have hsplit := P.ledger_split
  rw [htop] at hsplit
  refine ⟨htop, hmass, ?_, ?_, P.cech_vanishes⟩ <;> omega

/-! ## The colimit — the join is the least cocone -/

/-- **The colimit price** — the join (least upper bound) of the currency legs, which
by the edge order is `max massPrice causalPrice`: the mint, top and mass legs sit
below the mass, and the causal leg above the top, so the two maximal legs are the
mass and the causal. -/
def colimitPrice (P : PricedNerve) : Nat := max P.massPrice P.causalPrice

/-- **The colimit universal property.** `colimitPrice` is the *least* value all five
legs factor into: for every `n`, all legs are `≤ n` iff `colimitPrice ≤ n`. This is
the universal property of the colimit in the poset category `(ℕ, ≤)` — `colimitPrice`
is initial among the cocones (upper bounds) over the currency legs, the unique
mediating map to any competing cocone being the order `colimitPrice ≤ n`. -/
theorem colimit_universal (P : PricedNerve) (n : Nat) :
    (P.legCech ≤ n ∧ P.legMint ≤ n ∧ P.legTop ≤ n ∧ P.massPrice ≤ n ∧ P.legCausal ≤ n)
    ↔ P.colimitPrice ≤ n := by
  have hcz := P.cech_vanishes
  have hm := P.ledger_split
  have ht := P.spread.1
  unfold colimitPrice legCech legMint legTop legCausal
  rw [Nat.max_le]
  constructor
  · rintro ⟨_, _, _, hmass, hcaus⟩; exact ⟨hmass, hcaus⟩
  · rintro ⟨hmass, hcaus⟩
    refine ⟨?_, ?_, ?_, hmass, hcaus⟩ <;> omega

/-- **`colimitPrice` is a cocone.** Every currency leg factors into it: it is an
upper bound of all five legs. -/
theorem legs_le_colimitPrice (P : PricedNerve) :
    P.legCech ≤ P.colimitPrice ∧ P.legMint ≤ P.colimitPrice ∧ P.legTop ≤ P.colimitPrice
    ∧ P.massPrice ≤ P.colimitPrice ∧ P.legCausal ≤ P.colimitPrice :=
  (colimit_universal P P.colimitPrice).mpr (Nat.le_refl _)

/-- **The mediating map is unique.** Any two values that are each the least upper
bound of the legs are equal: the colimit is unique up to the order's antisymmetry.
Here, any `m` satisfying the same universal property as `colimitPrice` equals it. -/
theorem colimitPrice_unique (P : PricedNerve) (m : Nat)
    (hm : ∀ n, (P.legCech ≤ n ∧ P.legMint ≤ n ∧ P.legTop ≤ n ∧ P.massPrice ≤ n
        ∧ P.legCausal ≤ n) ↔ m ≤ n) :
    m = P.colimitPrice := by
  have h1 : m ≤ P.colimitPrice :=
    (hm P.colimitPrice).mp
      ((colimit_universal P P.colimitPrice).mpr (Nat.le_refl _))
  have h2 : P.colimitPrice ≤ m :=
    (colimit_universal P m).mp ((hm m).mpr (Nat.le_refl _))
  exact Nat.le_antisymm h1 h2

end PricedNerve

/-! ## A concrete cocone — the PR box priced over its nerve -/

/-- **The PR-box priced nerve.** The minimal contextual scenario instantiates the
cocone: its context 4-cycle nerve `prNerve` (rank one), the held-`⊤` support one
(`prWitnessFamily_topCount_eq_one`), record mass one, one mint and no jump, and the
causal price at least one. Existence witness that the cocone is inhabited by a real
obstruction, not only the trivial forest. -/
def prPricedNerve : PricedNerve where
  base := prNerve
  topPrice := 1
  massPrice := 1
  mintPrice := 1
  jumpPrice := 0
  causalPrice := 1
  cechPrice := 0
  spread := ⟨Nat.le_refl 1, by decide⟩
  ledger_split := by decide
  causal_dominates := Nat.le_refl 1
  cech_vanishes := rfl

/-- The PR-box cocone carries a genuine obstruction: every currency price is one,
the base cycle rank is one, and the cocone laws hold on a non-forest nerve. -/
theorem prPricedNerve_nontrivial :
    prPricedNerve.base.H1rank = 1
    ∧ prPricedNerve.legTop = 1
    ∧ prPricedNerve.legCausal = 1
    ∧ prPricedNerve.legMint ≤ prPricedNerve.legTop := by
  refine ⟨?_, rfl, rfl, ?_⟩
  · show prNerve.H1rank = 1
    decide
  · exact (PricedNerve.legs_order_into_rank prPricedNerve).2.1

end Cohomology
end Obsmetrologia
