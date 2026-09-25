import Obsmetrologia.AperiodicOrder.Tiling.MatterTopology
import Obsmetrologia.Language.Positing.D4Gauge
import Obsmetrologia.Cohomology.LandauerEntropy
import Obsmetrologia.Closure.Regime

/-!
# Lenticular percolation: condensate density crosses into conduction/load-bearing topology

`CondensateMatter` measures matter by *density* (`rigidity`, the count of Bose-condensed $\top$
lenticules); `MatterTopology` measures it by *shape* (`H1rank`, the cycle rank of the contact
network). This module is the bridge the two name as their open residue: the **percolation map**
from how *many* condensates a material holds to whether they *bear load*.

The control parameter is the contact count `cells`; the order parameter is `H1rank`, the number
of held load-bearing cycles. The cover-nerve invariant `entities ≤ cells + components` floors the
contact count at the spanning forest `entities − components`, so `H1rank` is exactly the contacts
**in excess of that forest** (`h1rank_eq_excess`). This makes the transition sharp:

* **The threshold law.** A network conducts/bears load exactly when its contacts reach the spanning
  forest plus one (`loadBearing_iff_critical`); the unique insulating/floppy state is the forest
  itself, sitting at the single critical count (`floppy_iff_at_threshold`). The order parameter is
  monotone in the contacts (`h1rank_mono`), and the first contact past the forest opens the first
  cycle (`percolation_onset`, the jamming click read as the transition).
* **The density bridge — necessary but not sufficient.** A condensed lenticule is a held-$\top$
  contact, so a material supplies at most `rigidity` contacts (`cells ≤ rigidity`). Load-bearing
  then forces the density strictly past the forest threshold (`density_necessary`) — but the same
  density realizes both a floppy forest and a load-bearing cycle (`density_not_sufficient`): the
  **percolation gap**, where placement, not count, decides. A realizable density `d` is anchored
  by `rigidity_replicate_two`.
* **The gauge-canonical placement measure.** A placement is a `Charge`-colouring of the sites, and
  the gauge group of FOUR is `D₄ = Aut(FOUR; {≤ₖ, ≤ₜ})` (`D4Gauge`). `D₄` acts *transitively* on
  the four corners (`gauge_transitive` — `negSwap` is the 4-cycle through them), so the unique
  gauge-invariant probability is uniform: over the eight gauge images of any charge each corner is
  hit exactly twice (`gauge_orbit_equidistributes`), fixing the condensate (`⊤`) base-rate at the
  *derived* `2/8 = 1/4` (`condensate_baserate_quarter`). The placement measure is not external — it
  is forced by the gauge symmetry.

This is still not metalization. The metalized side is the StepN finite algebraic recurrence proved in
`MetallizationDichotomy`; the conductor side here is `H¹`/Landauer-positive load-bearing topology.

The red frontier this opens (not built): the *critical fraction* — the condensate density
fraction at which a load-bearing cycle first appears with probability one. Its measure is settled
(the `D₄`-uniform placement, `⊤`-rate `1/4`); what remains is the *network* threshold — how the
`1/4` base-rate of condensed contacts meets the spanning-forest count on a given contact graph — a
finite counting question over FOUR-colourings, no longer a missing-measure one.

## References
Corpus aperiodic-settling line; `CondensateMatter`, `MatterTopology` (`CoordinationCohomology`);
`dev/.../2026-06-26-survey-of-beadwork-mathematics.md` §IV.D (beaded metamaterials, superjamming),
§IX (jamming, rigidity percolation, contact networks).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.Cohomology

/-! ## The order parameter is the excess over the spanning forest -/

/-- The **percolation threshold** of a contact network: the spanning-forest contact count
`entities − components`. By the cover-nerve invariant this is the floor on `cells`; a network at it
is a forest, every contact past it a held cycle. -/
def percolationThreshold (N : CoverNerve) : Nat := N.entities - N.components

/-- **The order parameter is the contacts in excess of the spanning forest.** `H1rank` counts the
contacts past the percolation threshold — each surplus contact is one held load-bearing cycle. -/
theorem h1rank_eq_excess (N : CoverNerve) :
    N.H1rank = N.cells - percolationThreshold N := by
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  unfold CoverNerve.H1rank percolationThreshold
  omega

/-! ## The sharp threshold law -/

/-- **The percolation threshold law.** A network conducts/bears load exactly when its contacts reach the
spanning forest plus one: load-bearing $\iff$ `entities − components + 1 ≤ cells`. The transition is
sharp and at a definite contact count. -/
theorem loadBearing_iff_critical (N : CoverNerve) :
    loadBearing N ↔ percolationThreshold N + 1 ≤ N.cells := by
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  unfold loadBearing CoverNerve.H1rank percolationThreshold
  constructor <;> intro h <;> omega

/-- **The insulating/floppy state is exactly the spanning forest.** Because the contact count is
floored at the threshold, a network is non-load-bearing iff it sits *at* the threshold — the
percolation point is the single critical contact count `entities − components`, not a sub-critical
range. -/
theorem floppy_iff_at_threshold (N : CoverNerve) :
    ¬ loadBearing N ↔ N.cells = percolationThreshold N := by
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  unfold loadBearing CoverNerve.H1rank percolationThreshold
  constructor <;> intro h <;> omega

/-- **The order parameter is monotone in the contacts.** Adding contacts (holding entities and
components fixed) can only raise the cycle count: percolation never *un*-jams. -/
theorem h1rank_mono (N N' : CoverNerve)
    (he : N'.entities = N.entities) (hk : N'.components = N.components)
    (hc : N.cells ≤ N'.cells) :
    N.H1rank ≤ N'.H1rank := by
  unfold CoverNerve.H1rank
  omega

/-- **Percolation onset.** A network at the threshold (a spanning forest, floppy) becomes
load-bearing the instant one more contact is added: the first surplus contact opens exactly one
cycle. The `jamming_click` read as the percolation transition — sub-critical to super-critical in
one step. -/
theorem percolation_onset (N N' : CoverNerve)
    (hforest : N.cells = percolationThreshold N)
    (hc : N'.cells = N.cells + 1) (he : N'.entities = N.entities)
    (hk : N'.components = N.components) :
    loadBearing N' ∧ N'.H1rank = 1 := by
  have h1 := N.entities_le_cells_add_components
  have h2 := N.components_le_entities
  refine ⟨?_, ?_⟩
  · unfold loadBearing CoverNerve.H1rank
    rw [percolationThreshold] at hforest
    omega
  · unfold CoverNerve.H1rank
    rw [percolationThreshold] at hforest
    omega

/-! ## The density bridge: condensates are held-`⊤` contacts -/

/-- A material of `d` doubly-occupied lenticules has condensate density `d`: every site is
over-occupied, so each is a held-$\top$ contact. The canonical realizer of a target density. -/
theorem rigidity_replicate_two (d : Nat) : rigidity (List.replicate d 2) = d := by
  induction d with
  | zero => rfl
  | succ n ih =>
    rw [List.replicate_succ, rigidity, List.countP_cons, ← rigidity, ih,
      if_pos (over_occupation_inconsistency 0)]

/-- **Density is necessary.** When the network's contacts are condensed lenticules of a material
(`cells ≤ rigidity m`), load-bearing forces the condensate density strictly past the percolation
threshold: a load-bearing fabric must hold more condensates than its spanning forest. -/
theorem density_necessary (N : CoverNerve) (m : Material)
    (hcells : N.cells ≤ rigidity m) (hload : loadBearing N) :
    percolationThreshold N < rigidity m := by
  have h := (loadBearing_iff_critical N).mp hload
  omega

/-- A **forest** contact network on `d + 1` entities with `d` contacts: a spanning tree, floppy. -/
def forestNerve (d : Nat) : CoverNerve where
  entities := d + 1
  cells := d
  components := 1
  components_le_entities := by omega
  entities_le_cells_add_components := by omega

/-- A **cyclic** contact network on `d` entities with `d` contacts: one contact past the spanning
tree, load-bearing. -/
def cyclicNerve (d : Nat) (hd : 1 ≤ d) : CoverNerve where
  entities := d
  cells := d
  components := 1
  components_le_entities := hd
  entities_le_cells_add_components := by omega

/-- **Density is not sufficient — the percolation gap.** A single condensate density `d ≥ 1` is
consistent with both a floppy forest and a load-bearing cycle: two networks with the *same* contact
count `d`, one bearing no load and one bearing load. Density crosses the threshold but does not
determine load — *placement* does. This is why the percolation map is a bridge, not the
identity: the count `rigidity` underdetermines the topology `H1rank`. -/
theorem density_not_sufficient (d : Nat) (hd : 1 ≤ d) :
    ∃ N N' : CoverNerve,
      N.cells = d ∧ N'.cells = d ∧ ¬ loadBearing N ∧ loadBearing N' := by
  refine ⟨forestNerve d, cyclicNerve d hd, rfl, rfl, ?_, ?_⟩
  · rw [floppy_iff_at_threshold]; rfl
  · rw [loadBearing_iff_critical]; show (d - 1) + 1 ≤ d; omega

/-! ## The gauge-canonical placement measure: `D₄ = Aut(FOUR)` fixes the `⊤`-rate at `1/4`

A *placement* is a `Charge`-colouring of the sites. The measure on placements is not external: it is
the unique probability invariant under the gauge group of FOUR, `D₄ = Aut(FOUR; {≤ₖ, ≤ₜ})`
(`D4Gauge`). Because `D₄` acts transitively on the four corners, that invariant measure is uniform,
and the condensate (`⊤`) base-rate it forces is the *derived* fraction `1/4`. -/

open Obsmetrologia.D4 (D8)

/-- **The four corners are one `D₄`-orbit.** The gauge group `Aut(FOUR; {≤ₖ, ≤ₜ})` acts transitively
on `Charge`: any corner reaches any other under some gauge symmetry (`negSwap` is the 4-cycle through
all four). A single orbit means there is *one* gauge class of placement value — so any
gauge-invariant weighting must charge the four corners equally. -/
theorem gauge_transitive (a b : Charge) : ∃ g : D8, D8.act g a = b := by
  cases a <;> cases b <;>
    first
      | exact ⟨D8.id, rfl⟩
      | exact ⟨D8.neg, rfl⟩
      | exact ⟨D8.conf, rfl⟩
      | exact ⟨D8.negConf, rfl⟩
      | exact ⟨D8.swap, rfl⟩
      | exact ⟨D8.negSwap, rfl⟩
      | exact ⟨D8.confSwap, rfl⟩
      | exact ⟨D8.negConfSwap, rfl⟩

/-- **The gauge orbit equidistributes the condensate.** Over the eight gauge images of any charge,
exactly two are condensed (`⊤`): the orbit-stabilizer count `|D₄| / |orbit| = 8 / 4 = 2`. The
uniform placement measure is the `D₄`-invariant one, and it is canonical, not assumed. -/
theorem gauge_orbit_equidistributes (a : Charge) :
    (D8.all.map (fun g => D8.act g a)).countP (fun c => c.isInconsistency) = 2 := by
  cases a <;> decide

/-- **The condensate base-rate is `1/4`.** The gauge group has eight elements (`D8.all.length = 8`)
and its orbit of any placement value is condensed in exactly two of them: the `⊤`-fraction of the
gauge-uniform placement is `2/8 = 1/4`, derived from `D₄ = Aut(FOUR)` with no external measure. This
is the placement measure the critical-fraction frontier was missing. -/
theorem condensate_baserate_quarter (a : Charge) :
    (D8.all.map (fun g => D8.act g a)).countP (fun c => c.isInconsistency) * 4 = D8.all.length := by
  rw [gauge_orbit_equidistributes]; rfl

/-! ## A finite placement carrier for testing onset

The gauge-canonical base-rate above fixes the local FOUR placement measure. The next finite question is
graph-specific: when the placement-induced condensed contacts are wired as a contact nerve, do they cross
the spanning-forest threshold? `PlacementGraph` is the minimal carrier for that test. It does not assert
independence, random placement, or an infinite-volume critical fraction; it only records the induced
condensed-contact count and lets the existing threshold theorem fire. -/

/-- A finite FOUR placement on a contact nerve. The equation says the contact count of the nerve is
exactly the number of held-`⊤`/inconsistent placement values. -/
structure PlacementGraph where
  /-- The contact topology whose H¹ decides load-bearing. -/
  nerve : CoverNerve
  /-- FOUR values placed on the finite contact sites. -/
  siteCharges : List Charge
  /-- The contact count is induced by the condensed/held-`⊤` placements. -/
  cells_eq_condensed : nerve.cells = siteCharges.countP (fun c => c.isInconsistency)

namespace PlacementGraph

/-- The number of condensed held-`⊤` contacts in the FOUR placement. -/
def condensedContacts (P : PlacementGraph) : Nat :=
  P.siteCharges.countP (fun c => c.isInconsistency)

/-- **Finite placement onset.** If the placement-induced condensed contacts cross the spanning-forest
threshold, the placed contact graph bears load. This is the smallest formal order-parameter test:
held-`⊤` density alone is not enough, but held-`⊤` count wired into a topology and compared with H¹ is. -/
theorem loadBearing_of_condensed_crosses_threshold (P : PlacementGraph)
    (h : percolationThreshold P.nerve + 1 ≤ P.condensedContacts) :
    loadBearing P.nerve := by
  rw [loadBearing_iff_critical]
  unfold condensedContacts at h
  rw [P.cells_eq_condensed]
  exact h

/-- The finite contact graph induced by one `D₈` gauge orbit of a FOUR placement value. The orbit has
two condensed values, so we wire it as the two-contact cyclic nerve. This is the smallest concrete
graph-specific counting witness for the gauge-uniform placement measure. -/
def gaugeOrbitCyclic (a : Charge) : PlacementGraph where
  nerve := cyclicNerve 2 (by omega)
  siteCharges := D8.all.map (fun g => D8.act g a)
  cells_eq_condensed := by
    rw [gauge_orbit_equidistributes]
    rfl

/-- **Gauge-orbit placement onset.** A single `D₈` gauge orbit supplies two condensed contacts, and
the two-contact cyclic nerve crosses its spanning-forest threshold, so the induced placed graph bears
load. This is a concrete finite counting test of held-`⊤` placement crossed with topology/H¹. -/
theorem gaugeOrbitCyclic_loadBearing (a : Charge) : loadBearing (gaugeOrbitCyclic a).nerve := by
  apply loadBearing_of_condensed_crosses_threshold
  unfold gaugeOrbitCyclic condensedContacts
  rw [gauge_orbit_equidistributes]
  simp [percolationThreshold, cyclicNerve]

end PlacementGraph

/-! ## The fundamental cycle is the local model of the load-bearing cycle

The cycling that makes matter load-bearing is not a separate construction: it is the intrinsic
order-4 rotation of the predication-induced FOUR (`Positing` admits the `Charge` value to a
predication cell; `D4Gauge` carries its rotation). The generator `negSwap` — born when the two
orders `≤ₖ, ≤ₜ` are allowed to exchange — cycles the four corners `⊥ → t → ⊤ → f → ⊥`, entrenching
exactly one held-`⊤` per turn. As a contact network that single turn is one `Ȟ¹` generator, so the
fundamental cycle on FOUR *is* the local model of percolation's load-bearing cycle. -/

/-- One **spin** of the fundamental cycle: the order-4 rotation `negSwap` of FOUR (`negate ∘ swap`),
the exchange-of-orders rotation. -/
def spin (a : Charge) : Charge := D8.act D8.negSwap a

/-- The **fundamental cycle** through a charge: its full `ℤ/4` orbit under `spin`. -/
def fundamentalCycle (a : Charge) : List Charge :=
  [a, spin a, spin (spin a), spin (spin (spin a))]

/-- **The cycle closes after four spins** — `negSwap` has order 4 (`D4`'s `r_pow_four`). The rotation
returns the corner to itself, so the orbit is a cycle. -/
theorem spin_four (a : Charge) : spin (spin (spin (spin a))) = a := by cases a <;> rfl

/-- **The cycle is an order-exchange.** The spin `negSwap` lies in the `σ`-coset `K₄·σ`: it exchanges
`≤ₖ ↔ ≤ₜ`. The fundamental cycle exists precisely because the two orders may swap — it is absent from
the base Klein-four, whose elements are all involutions. -/
theorem spin_exchanges_orders : D4.D8.inSwapCoset D8.negSwap = true := rfl

/-- **The fundamental cycle visits every corner.** Each of the four charges appears in one cycle: a
single turn of the rotation is one full FOUR (`⊥, t, ⊤, f`). -/
theorem fundamentalCycle_complete (a c : Charge) : c ∈ fundamentalCycle a := by
  cases a <;> cases c <;> decide

/-- **Exactly one held-`⊤` per cycle.** Of the four corners a fundamental cycle visits, precisely one
is condensed (`⊤`): one entrenched failure per turn of the rotation — the `1/4` condensate rate read
as one-per-cycle. -/
theorem one_failure_per_cycle (a : Charge) :
    (fundamentalCycle a).countP (fun c => c.isInconsistency) = 1 := by cases a <;> decide

/-- The **fundamental loop as a contact network**: four lenticules wired in one closed cycle (4
nodes, 4 contacts, one component). -/
def fundamentalNerve : CoverNerve where
  entities := 4
  cells := 4
  components := 1
  components_le_entities := by omega
  entities_le_cells_add_components := by omega

/-- **The fundamental cycle is one load-bearing generator.** As a contact network the four-spin loop
has `Ȟ¹ = 1` (one held cycle) and bears load. The `ℤ/4` rotation of FOUR is the local model of a
single `H1rank` generator. -/
theorem fundamentalNerve_h1 : fundamentalNerve.H1rank = 1 := rfl

theorem fundamentalNerve_loadBearing : loadBearing fundamentalNerve := by
  rw [loadBearing, fundamentalNerve_h1]; omega

/-- **Cycling, load-bearing, and mass meet at the fundamental cycle.** The order-4 rotation of the
predication-induced FOUR (a) closes into a loop (`spin_four`), (b) is one `Ȟ¹` generator as a contact
network and bears load (`fundamentalNerve_h1`, `_loadBearing`), and (c) entrenches exactly one held-`⊤`
(`one_failure_per_cycle`). One fundamental cycle = one load-bearing loop = one mass quantum: FOUR's
own rotation is the local model of percolation's load-bearing cycle. -/
theorem fundamental_cycle_is_local_h1 (a : Charge) :
    spin (spin (spin (spin a))) = a
      ∧ fundamentalNerve.H1rank = 1
      ∧ loadBearing fundamentalNerve
      ∧ (fundamentalCycle a).countP (fun c => c.isInconsistency) = 1 :=
  ⟨spin_four a, fundamentalNerve_h1, fundamentalNerve_loadBearing, one_failure_per_cycle a⟩

/-! ## Mass is Landauer entropy: how a bead gets more informational

The cycle rank that counts a bead's load-bearing loops is, thermodynamically, its **Landauer
entropy** (`Landauer.landauerBits = H1rank`): one irreversibly-erased bit per held cycle. So the
three readings coincide — one entrenched failure ($\top$) = one load-bearing cycle = one Landauer
bit. A bead gets *more informational* exactly by entrenching more failure: each held-$\top$ it
cannot reversibly shed is one more bit of Landauer entropy, the source term of the discrete curvature
(`localCurvature`, the Benincasa–Dowker / Einstein–Hilbert action). The continuum scaling of that
source to the Ricci scalar `R` is the frontier this opens — a new stratum, not yet built. -/

/-- **Conduction/load-bearing iff it holds Landauer entropy.** A contact network bears load exactly
when its Landauer entropy is positive — when it is thermodynamically irreversible. Mass-with-shape is
held entropy: a forest is reversible and insulating/floppy, a cycle is irreversible and
load-bearing. -/
theorem loadBearing_iff_landauer (N : CoverNerve) :
    loadBearing N ↔ 0 < Landauer.landauerBits N := Iff.rfl

/-- **The Landauer entropy is the contacts past the percolation threshold.** A bead's bit-count is
exactly its excess over the spanning forest: `landauerBits = cells − (spanning forest)`. Entrenching
one more contact past threshold is one more erased bit. -/
theorem landauer_eq_excess (N : CoverNerve) :
    Landauer.landauerBits N = N.cells - percolationThreshold N :=
  h1rank_eq_excess N

/-- **The informational Higgs quantum is one Landauer bit.** The fundamental cycle — one held-$\top$,
one load-bearing loop — carries exactly one bit of Landauer entropy: the indivisible quantum by which
a bead becomes more informational. Mass, cycle, and bit are one object, and that object is the
source of one unit of discrete curvature. -/
theorem fundamental_cycle_one_bit :
    Landauer.landauerBits fundamentalNerve = 1
      ∧ (∀ a : Charge, (fundamentalCycle a).countP (fun c => c.isInconsistency) = 1) :=
  ⟨fundamentalNerve_h1, one_failure_per_cycle⟩

/-! ## The fundamental cycle, read on the regimes

`spin` and `regimeCornerBij` (`Closure.Regime`) were built independently, in different modules,
for different reasons -- one for percolation's load-bearing cycle, the other for the
four-regime/four-corner conflation. Composed, they say something neither says alone. -/

/-- **The fundamental cycle, transported onto the regimes.** `spin` read through the
`ClosureRegime ≃ Articulating.Corner` bijection: one turn of percolation's load-bearing rotation,
relabelled as a map on the four closure-ordinal regimes. -/
def regimeSpin (r : ClosureRegime) : ClosureRegime :=
  ClosureRegime.ofCorner (spin (ClosureRegime.toCorner r))

/-- **The transported cycle is not κ-height order.** One `regimeSpin` sends strict to scott, scott
to aperiodic -- skipping transfinite-bounded entirely -- aperiodic to transfinite-bounded, and
transfinite-bounded back to strict. The naive "climb `κ`" order (strict, scott,
transfinite-bounded, aperiodic) is a different cycle from the one `spin` actually generates. -/
theorem regimeSpin_cycle :
    regimeSpin ClosureRegime.strict = ClosureRegime.scott
      ∧ regimeSpin ClosureRegime.scott = ClosureRegime.aperiodic
      ∧ regimeSpin ClosureRegime.aperiodic = ClosureRegime.transfiniteBounded
      ∧ regimeSpin ClosureRegime.transfiniteBounded = ClosureRegime.strict := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> rfl

/-- **The regime spin closes after four turns**, inherited directly from `spin_four` through the
bijection. -/
theorem regimeSpin_four (r : ClosureRegime) :
    regimeSpin (regimeSpin (regimeSpin (regimeSpin r))) = r := by
  cases r <;> rfl

/-- **Two spins is the extremes-with-extremes, middles-with-middles involution.** Squaring the
4-cycle pairs strict with aperiodic -- the two regimes `Closure.Regime`'s own bijection already
reads as the bilattice's extremes, `⊥ₖ` and the fully-alive `⊤ₖ` -- and pairs scott with
transfinite-bounded, the two -infinite-but-not-extremal regimes. This is the same
order-exchanging symmetry (`spin_exchanges_orders`) that generates the fundamental cycle in the
first place, not a new one chosen to make the pairing come out this way. -/
theorem regimeSpin_regimeSpin :
    regimeSpin (regimeSpin ClosureRegime.strict) = ClosureRegime.aperiodic
      ∧ regimeSpin (regimeSpin ClosureRegime.aperiodic) = ClosureRegime.strict
      ∧ regimeSpin (regimeSpin ClosureRegime.scott) = ClosureRegime.transfiniteBounded
      ∧ regimeSpin (regimeSpin ClosureRegime.transfiniteBounded) = ClosureRegime.scott := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> rfl

end AperiodicOrder.Tiling
end Obsmetrologia
