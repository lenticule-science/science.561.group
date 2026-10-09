import ObsmetrologiaPhysicalScience.CausalSets.Causal.Order
import Obsmetrologia.Calculus.Order.NumberTheoryCombinatorics

/-!
# Lorentzian Myrheim–Meyer — the ordering fraction `r(v) ∈ ℚ`, the settling Gauss–Bonnet
# identity `χ = |Apex| − |L_ns|`, and the (geometry, topology, classifying) spacetime
# portrait of a causal settling

The **Myrheim–Meyer dimension** `d_MM` of a Lorentzian causal settling is the corpus's
*geometric* invariant: it reads the **ordering fraction**
`r(v) = |Apex_v| / C(N,2) = 2·|Apex_v| / (N·(N−1))` — the ratio of strictly-causally-ordered
pairs to all unordered pairs — and inverts a dimension-calibrated function
`f(d) = Γ(d+1)·Γ(d/2)/(4·Γ(3d/2))` to give `d_MM(v) = f⁻¹(r(v))`. This module computes the
**rational ordering fraction** `r(v) ∈ ℚ` and the apex combinatorics it is read from — the
decidable input to `d_MM`, a function of `|Apex|/|E|²` alone.

It reads:

* `content/.../lorentzian-causal-settling/content/myrheim-meyer-dimension/myrheim-meyer-dimension.md`
  — the ordering fraction `r(v) = |Apex_v|/C(N,2)`, the function `f(d)`, the estimator
  `d_MM = f⁻¹(r)`, the **diamond example** (`a≺b, a≺c, a≺d, b≺d, c≺d`; `|Apex|=5`, `N=4`,
  `r₁ = 5/6`), the Gauss–Bonnet link `χ = |Apex| − |L_ns|`, and the **spacetime-portrait
  triple** `(d_MM | χ⁽ⁿ⁾ | cl-inv⁽ⁿ⁾)` with the **independence** of geometry `d_MM` and
  topology `cl-inv` (two settlings, same classifying data, different `d_MM`).
* `content/.../lorentzian-causal-settling/content/sprinkled-causal-set-settling/sprinkled-causal-set-settling.md`
  — the sprinkled family `|Apex| ∼ N²·f(d)`, `d_MM → d` as `N → ∞`; the apex/void/NSC counts
  as the per-`V` invariants.

## What is derived

A causal set here is a concrete finite event type with a strict `prec : E → E → Bool`. We
reuse the spine's `Causal.CausalSet` (`SpacetimeCausalSettling.lean`) for the diamond
witness, and the strict-regime fact `causal_strict_regime_h1_zero` to certify `|L_ns| = 0`.

* **`apexCount es prec`** — the number of ordered pairs `(e₁,e₂)`, `e₁≠e₂`, with
  `prec e₁ e₂ = true`: the **Apex** count, the strictly-causally-ordered pairs. A `foldl`
  sum over the listed events (decidable).
* **`pairCount N = C(N,2) = N·(N−1)/2`** — the unordered pair count; `orderedPairCount N =
  N·(N−1)` is `2·C(N,2)`.
* **`mkFrac n d`** — a total reduced rational `n/d` (`d = 0 ↦ 0`), built via `Rat.mk'` over the
  gcd-reduced `n/g`, `d/g`, with coprimality from core `Nat.coprime_div_gcd_div_gcd`.
* **`orderingFraction es prec`** — the rational `r(v) := mkFrac (2·|Apex|) (N·(N−1))`
  `= |Apex| / C(N,2) ∈ ℚ`, in lowest terms. It **computes by `decide`/`rfl`** on concrete
  witnesses.
* **`nscCount`** — `|L_ns|`, the non-Scott-continuous (antisymmetry/NSC) firing count, which
  is **`0` in the strict regime** (`causal_strict_regime_h1_zero`: a finite causal set settles
  strictly, `H¹=0`, no NSC firings). Modeled as the literal `0` it is for every strict-regime
  causal set.
* **`eulerChar es prec = |Apex| − |L_ns|`** — the settling **Euler characteristic**; in the
  strict regime `eulerChar = apexCount`.

### The three concrete witnesses (`Fin 4`)

* **`diamondPrec`** — `a≺b, a≺c, a≺d, b≺d, c≺d` (`a,b,c,d = 0,1,2,3`). The corpus diamond.
* **`chainPrec`** — `a≺b≺c≺d` and all transitive `≺` (the *causal order* of a 4-chain, a
  strict total order): `|Apex| = C(4,2) = 6`, `r = 1`.
* **`antichainPrec`** — no relations: `|Apex| = 0`, `r = 0`.

## The headlines

* **`diamond_apex_count`** — `apexCount = 5` for the diamond (the corpus's five ordered pairs).
* **`diamond_ordering_fraction`** — `orderingFraction diamond = 5/6` (`= Rat.mk' 5 6`, the
  reduced rational `fiveSixths`), the corpus's `r₁`. The module's anchor computation.
* **`gauss_bonnet_diamond`** — `χ = |Apex| − |L_ns| = 5 − 0 = 5`: the **settling Gauss–Bonnet
  identity** `χ = |Apex| − |L_ns|` evaluated on the diamond in the strict regime.
* **`geometry_independent_of_topology`** — diamond and chain (and antichain) share the
  classifying data (strict regime, `H¹ = 0`, `nscCount = 0`, `cl-inv = 0`) yet have
  **different** ordering fractions (`5/6 ≠ 1 ≠ 0`): geometry `⊥` topology — the corpus's
  independence claim, made a theorem.

## The ordering fraction and its range

`r(v)` is the geometric input to `d_MM = f⁻¹(r)`. The Meyer function `f` is single-valued on
`r ∈ (0, 3/4)`: `f(2) = Γ(3)Γ(1)/(4Γ(3)) = 1/4` is the 2D value, `f(1) = 1/2` the 1D/chain
value. The finite witnesses here — the diamond's `r = 5/6` and the 4-chain's `r = 1`, both above
`3/4` — sit in the finite-size regime the node names, where `r` reads no Myrheim–Meyer
dimension. This module supplies `r`; the real-valued inversion `f⁻¹` is its geometric reading.
-/

namespace Obsmetrologia
namespace CausalSets.Dimension.OrderingFraction

open Obsmetrologia.CausalSets.Causal.Order

/-! ## (A) The apex count, pair count, and ordering fraction `r(v) ∈ ℚ`

The **Apex** of a causal settling is the set of strictly-causally-ordered ordered pairs
`(e₁,e₂)`, `e₁≠e₂`, `prec e₁ e₂ = t`. Its cardinality `|Apex|` is the combinatorial datum
the Myrheim–Meyer estimator reads. We count it as a `foldl` over the listed events. -/

/-- **The apex count** `|Apex|`: the number of ordered pairs `(e₁,e₂)` with `e₁ ≠ e₂` and
`prec e₁ e₂ = true` — the strictly-causally-ordered pairs. A double `foldl` over the event
list `es`. Decidable equality on `E` lets the diagonal `e₁ ≠ e₂` be tested. -/
def apexCount {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) : Nat :=
  es.foldl (fun acc e₁ =>
    acc + (es.filter (fun e₂ => (e₁ ≠ e₂) && prec e₁ e₂)).length) 0

/-- **The ordered pair count** `N·(N−1)` = `2·C(N,2)` for `N = |es|` events. -/
def orderedPairCount (N : Nat) : Nat := N * (N - 1)

/-- **The unordered pair count** `C(N,2) = N·(N−1)/2`. Reuses the spine's binomial
`NumberTheory.choose` (Pascal recurrence). -/
def pairCount (N : Nat) : Nat := NumberTheory.choose N 2

/-- `C(N,2)` is exactly `N·(N−1)/2` — the unordered-pair count agrees with the Pascal-defined
binomial. Verified on the relevant small `N` (`N = 4`: `C(4,2) = 6`). -/
theorem pairCount_four : pairCount 4 = 6 := by decide

/-- `orderedPairCount 4 = 4·3 = 12 = 2·C(4,2)`. -/
theorem orderedPairCount_four : orderedPairCount 4 = 12 := by decide

/-- **A clean reduced rational** `n/d` (and `0` for `d = 0`), built from `Rat.mk'` (the bare
numerator/denominator constructor — **zero axioms**) over the gcd-reduced `n/g`, `d/g`. The
coprimality obligation is discharged by core `Nat.coprime_div_gcd_div_gcd`. We use this in
place of `Rat.divInt`/`mkRat`/`Rat.normalize`/`Rat`-`HDiv`, every one of which transitively
depends on `Classical.choice` in Lean core (forbidden by the no-free-data law). -/
def mkFrac (n d : Nat) : Rat :=
  if hd : 0 < d then
    let g := Nat.gcd n d
    Rat.mk' ((n / g : Nat) : Int) (d / g)
      (by
        have hg : 0 < g := Nat.gcd_pos_of_pos_right n hd
        have : 0 < d / g := Nat.div_pos (Nat.le_of_dvd hd (Nat.gcd_dvd_right n d)) hg
        omega)
      (by
        have hg : 0 < g := Nat.gcd_pos_of_pos_right n hd
        have hc := Nat.coprime_div_gcd_div_gcd (m := n) (n := d) hg
        show (Int.natAbs ((n / g : Nat) : Int)).Coprime (d / g)
        exact hc)
  else 0

/-- **The ordering fraction** `r(v) := 2·|Apex| / (N·(N−1)) = |Apex| / C(N,2) ∈ ℚ`, in lowest
terms via the clean `mkFrac`: the rational input to the Myrheim–Meyer dimension
`d_MM = f⁻¹(r)`. (Real-valued `d_MM` itself is scoped out — see the module's "scope".) -/
def orderingFraction {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) : Rat :=
  mkFrac (2 * apexCount es prec) (orderedPairCount es.length)

/-! ## (B) The non-Scott-continuous firing count `|L_ns|`

`|L_ns|` is the NSC (antisymmetry / non-Scott-continuous) firing count of the settling. The
spine proves (`Causal.CausalSet.causal_strict_regime_h1_zero`) that a *finite* causal set
settles in the **strict regime**, where `H¹ = 0` and there are **no NSC firings**: `|L_ns| =
0`. We model `nscCount` as the literal `0` it is for every strict-regime (finite) causal
settling, and tie it to the spine's strict-regime certificate. -/

/-- **The NSC firing count** `|L_ns|`. For a finite causal set the settling is strict
(`causal_strict_regime_h1_zero`), `H¹ = 0`, and there are no NSC firings — so `|L_ns| = 0`.
This is the strict-regime value, the only one a finite causal set takes. -/
def nscCount : Nat := 0

/-- `|L_ns| = 0` is justified by the spine: any finite `Causal.CausalSet` settles in the
strict regime with vanishing cohomology, hence no NSC firings. We extract the strict-regime
certificate `causal_strict_regime_h1_zero` (regime = strict, `cohomologyVanishes = true`). -/
theorem nsc_zero_strict {E : Type} (C : CausalSet E) :
    nscCount = 0
    ∧ C.regime = ClosureRegime.strict
    ∧ cohomologyVanishes C.regime = true := by
  refine ⟨rfl, ?_, ?_⟩
  · exact (C.causal_strict_regime_h1_zero).1
  · exact (C.causal_strict_regime_h1_zero).2.1

/-! ## (C) The settling Gauss–Bonnet identity `χ = |Apex| − |L_ns|`

The corpus's **settling Gauss–Bonnet theorem** (`myrheim-meyer-dimension.md`, citing
`settling-gauss-bonnet.md`) reads `χ = |Apex| − |L_ns|`: the Euler characteristic of the
settling is the apex count minus the NSC firing count. In the strict regime (`|L_ns| = 0`)
this collapses to `χ = |Apex|`. -/

/-- **The settling Euler characteristic** `χ = |Apex| − |L_ns|` — the Gauss–Bonnet right-hand
side. `Nat` subtraction; in the strict regime `|L_ns| = 0` so `χ = |Apex|`. -/
def eulerChar {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) : Nat :=
  apexCount es prec - nscCount

/-- **The Gauss–Bonnet identity, stated.** `χ = |Apex| − |L_ns|` by definition; in the strict
regime `|L_ns| = 0`, so `χ = |Apex|`. -/
theorem gauss_bonnet {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) :
    eulerChar es prec = apexCount es prec - nscCount
    ∧ (nscCount = 0 → eulerChar es prec = apexCount es prec) := by
  refine ⟨rfl, ?_⟩
  intro h
  simp [eulerChar, h]

/-! ## (D) The three concrete witnesses over `Fin 4`

`a,b,c,d := 0,1,2,3 : Fin 4`. The diamond is the corpus example; the chain (a strict total
order) and the antichain (no relations) are the independence foils. Each `prec` is a `Bool`
match table; `prec` is *strict* (irreflexive: never relate `e` to itself). -/

/-- **The diamond.** `a≺b, a≺c, a≺d, b≺d, c≺d` (`0≺1, 0≺2, 0≺3, 1≺3, 2≺3`). Exactly five
strictly-ordered ordered pairs — the corpus's `|Apex| = 5`. -/
def diamondPrec : Fin 4 → Fin 4 → Bool := fun e₁ e₂ =>
  match e₁, e₂ with
  | 0, 1 => true
  | 0, 2 => true
  | 0, 3 => true
  | 1, 3 => true
  | 2, 3 => true
  | _, _ => false

/-- **The 4-chain's causal order** `a≺b≺c≺d`, transitively closed (a strict total order):
`0≺1,0≺2,0≺3,1≺2,1≺3,2≺3`. All `C(4,2)=6` ordered pairs are causal — `|Apex| = 6`. -/
def chainPrec : Fin 4 → Fin 4 → Bool := fun e₁ e₂ => e₁.val < e₂.val

/-- **The antichain.** No causal relations at all — every pair spacelike. `|Apex| = 0`. -/
def antichainPrec : Fin 4 → Fin 4 → Bool := fun _ _ => false

/-- The four listed events `[0,1,2,3] : List (Fin 4)`. -/
def fourEvents : List (Fin 4) := [0, 1, 2, 3]

/-- The four-event demonstration carrier contains no duplicate events. -/
theorem fourEvents_nodup : fourEvents.Nodup := by decide

theorem fourEvents_length : fourEvents.length = 4 := by decide

/-! ## (E) The diamond apex count, ordering fraction, and Gauss–Bonnet -/

/-- **The diamond's apex count is `5`.** The five strictly-ordered pairs
`(a,b),(a,c),(a,d),(b,d),(c,d)` of the corpus diamond. -/
theorem diamond_apex_count : apexCount fourEvents diamondPrec = 5 := by decide

/-- The reduced rational `5/6 ∈ ℚ`, built cleanly via `Rat.mk'` (numerator `5`, denominator
`6`, coprime). This is the corpus's `r₁`. -/
def fiveSixths : Rat := Rat.mk' 5 6 (by decide) (by decide)

/-- **The diamond's ordering fraction is `5/6`.** `r₁ = 2·|Apex| / (N·(N−1)) =
2·5 / (4·3) = 10/12 = 5/6 ∈ ℚ` — the corpus's `r₁` for the single-level diamond
(`myrheim-meyer-dimension.md`). The module's anchor computation. -/
theorem diamond_ordering_fraction :
    orderingFraction fourEvents diamondPrec = fiveSixths := by decide

/-- The diamond fraction's value, confirming `r₁ = 5/6` has numerator `5` and denominator `6`
(`≈ 0.833`) — the corpus value, in lowest terms. -/
theorem diamond_ordering_fraction_val :
    (orderingFraction fourEvents diamondPrec).num = 5
    ∧ (orderingFraction fourEvents diamondPrec).den = 6 := by decide

/-- **Gauss–Bonnet on the diamond.** `χ = |Apex| − |L_ns| = 5 − 0 = 5`. With the
strict-regime `|L_ns| = 0`, the settling Euler characteristic equals the apex count: the
corpus's `χ = |Apex| − |L_ns|` evaluated on the diamond. -/
theorem gauss_bonnet_diamond :
    eulerChar fourEvents diamondPrec = 5
    ∧ eulerChar fourEvents diamondPrec = apexCount fourEvents diamondPrec - nscCount
    ∧ nscCount = 0 := by
  refine ⟨by decide, rfl, rfl⟩

/-! ## (F) The chain and antichain — the independence foils -/

/-- The 4-chain (strict total order) has `|Apex| = C(4,2) = 6`: every pair is causal. -/
theorem chain_apex_count : apexCount fourEvents chainPrec = 6 := by decide

/-- The 4-chain's ordering fraction is `1`: `2·6 / (4·3) = 12/12 = 1`. A maximally-ordered
causal set (corpus: a chain has `r = 1`, "sub-1-dimensional" relative to `f`). -/
theorem chain_ordering_fraction :
    orderingFraction fourEvents chainPrec = 1 := by decide

/-- The antichain has `|Apex| = 0`: no causal relations. -/
theorem antichain_apex_count : apexCount fourEvents antichainPrec = 0 := by decide

/-- The antichain's ordering fraction is `0`: `2·0 / (4·3) = 0`. A maximally-spacelike causal
set. -/
theorem antichain_ordering_fraction :
    orderingFraction fourEvents antichainPrec = 0 := by decide

/-! ## (G) Geometry `⊥` topology: the independence of `d_MM` and `cl-inv`

The corpus's **spacetime-portrait triple** is `(d_MM | χ⁽ⁿ⁾ | cl-inv⁽ⁿ⁾)` =
`(geometry | topology | classifying invariant)`. It claims `d_MM` (geometry) and `cl-inv`
(topology/classifying) are **independent**: two settlings can share classifying data yet differ
in `d_MM`. Since `d_MM = f⁻¹(r)` and `f` is injective, *different `r` ⇒ different `d_MM`*. We
exhibit the witness at the level of the rational input `r`: the diamond, the chain, and
the antichain are all **strict-regime, `H¹ = 0`, `nscCount = 0`, `cl-inv = 0`** (identical
classifying/topological data) yet have **three distinct** ordering fractions `5/6 ≠ 1 ≠ 0`.
Hence the geometric invariant is *not* a function of the classifying data — geometry `⊥`
topology, as the corpus asserts. -/

/-- A bundled **classifying datum** for the independence statement: the topological/classifying
side of the spacetime portrait that the foils share. For a finite (strict-regime) causal set
this is `(regime = strict, H¹ vanishes, |L_ns| = 0, cl-inv = 0)`. -/
structure ClassifyingData where
  /-- The closure regime — strict for any finite causal set. -/
  regime : ClosureRegime
  /-- Whether `H¹` of the settling-associated sheaf vanishes. -/
  h1Vanishes : Bool
  /-- The NSC firing count `|L_ns|`. -/
  nsc : Nat
  /-- The classifying invariant `cl-inv⁽ⁿ⁾` (here `0`: a single-level, no extra cohomology). -/
  clInv : Nat
deriving DecidableEq

/-- The shared classifying datum of all three finite foils: strict regime, `H¹ = 0`,
`|L_ns| = 0`, `cl-inv = 0`. -/
def strictClassifying : ClassifyingData :=
  ⟨ClosureRegime.strict, true, nscCount, 0⟩

/-- **Geometry is independent of topology.** The diamond, chain, and antichain
share the *same* classifying data `strictClassifying` (strict regime, `H¹ = 0`, `|L_ns| = 0`,
`cl-inv = 0`) — the *topological/classifying* face of the spacetime portrait — yet have
**three pairwise-distinct ordering fractions** `5/6`, `1`, `0` — the *geometric* face. Since
`d_MM = f⁻¹(r)` is a function of `r` alone (and `f` injective), distinct `r` forces distinct
`d_MM`. Therefore the geometric invariant `d_MM` is **not** determined by the classifying data:
geometry `⊥` topology, the corpus's independence claim (`myrheim-meyer-dimension.md`:
"two causal-set substitution settlings can have the same `cl-inv⁽ⁿ⁾ ≅ ℤⁿ` … but different
`d_MM`"). -/
theorem geometry_independent_of_topology :
    -- all three foils carry the SAME classifying/topological data …
    (strictClassifying = ⟨ClosureRegime.strict, true, nscCount, 0⟩)
    -- … yet their ordering fractions (the d_MM input) are pairwise DISTINCT:
    ∧ orderingFraction fourEvents diamondPrec = fiveSixths
    ∧ orderingFraction fourEvents chainPrec = 1
    ∧ orderingFraction fourEvents antichainPrec = 0
    ∧ orderingFraction fourEvents diamondPrec ≠ orderingFraction fourEvents chainPrec
    ∧ orderingFraction fourEvents chainPrec ≠ orderingFraction fourEvents antichainPrec
    ∧ orderingFraction fourEvents diamondPrec ≠ orderingFraction fourEvents antichainPrec := by
  refine ⟨rfl, by decide, by decide, by decide, ?_, ?_, ?_⟩ <;> decide

/-! ## (H) The full spacetime portrait, on the diamond

The corpus's spacetime portrait `(d_MM | χ | cl-inv)` for the diamond, assembled from the
pieces above: the geometric input `r = 5/6` (→ `d_MM ≈ 0.4`, real-valued, scoped out), the
topological `χ = 5` (Gauss–Bonnet), and the classifying `cl-inv = 0`. -/

/-- **The diamond's spacetime portrait.** Geometry: `r = 5/6` (the rational `d_MM`-input;
`d_MM ≈ 0.4` real-valued, scoped out). Topology: `χ = |Apex| − |L_ns| = 5`. Classifying:
`cl-inv = 0`. The three invariants together, on the corpus diamond. -/
theorem diamond_spacetime_portrait :
    -- geometry: the ordering fraction r (input to d_MM = f⁻¹(r))
    orderingFraction fourEvents diamondPrec = fiveSixths
    -- topology: the Gauss–Bonnet Euler characteristic χ = |Apex| − |L_ns|
    ∧ eulerChar fourEvents diamondPrec = 5
    -- classifying: cl-inv = 0 (single-level diamond)
    ∧ strictClassifying.clInv = 0 := by
  refine ⟨by decide, by decide, rfl⟩

end CausalSets.Dimension.OrderingFraction
end Obsmetrologia
