import Obsmetrologia.Calculus.Order.ColoringEntropy
import Obsmetrologia.Calculus.Order.TileAdjacencyChromatic
import Obsmetrologia.Dynamics.Flow.ChromaticTileCubicGap
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.AperiodicOrder.Tiling.Diffraction

/-!
# K₄/FOUR and the finite analytic chromatic spine

The complete-graph obstruction says that king adjacency is exactly
FOUR-chromatic: the palette cannot collapse below the four readings.  The
Rayleigh and finite-diffraction modules chase the same finite chromatic carrier
from the analytic side: sum-of-squares energy gives the Rayleigh floor, small
tiles give exact gap witnesses, algebraic path gaps give root and bracket
certificates, and the finite Fourier-side readout agrees with the current
Pisot/Salem phase classifier.

This module records that these are one proved finite spine.  It does not assert
the general spectral formula, infinite-volume diffraction, or a continuum
Lebesgue decomposition.

## Main result

* `k4_four_analytic_spine` bundles the K₄/FOUR symmetry, king-adjacency
  obstruction, the `4! = 24` colouring-count witness, and the finite Rayleigh,
  spectral-gap, algebraic-gap, and finite Fourier-side phase witnesses.

## Tags

K4, FOUR, chromatic obstruction, Rayleigh energy, spectral gap, finite
diffraction, Pisot, Salem
-/

namespace Obsmetrologia
namespace Flow

/-- The rational scalar used by the finite chromatic Rayleigh tile. -/
abbrev ChromaticRat := Real.Internal.Rat

/-- The proposition asserting that the K₄/FOUR chromatic obstruction carries
the current finite analytic spine. -/
def K4FourAnalyticSpine (v : List ChromaticRat) (n : Nat)
    (w : Fin (n + 1) → Bool) (side : Bool) : Prop :=
  Positing.Gauge.K4.all.length = 4 ∧
    (∀ g : Positing.Gauge.K4, Positing.Gauge.K4.mul g g = Positing.Gauge.K4.id) ∧
      (∀ (g h : Positing.Gauge.K4) (a : Reading),
        Positing.Gauge.K4.act (Positing.Gauge.K4.mul g h) a =
          Positing.Gauge.K4.act g (Positing.Gauge.K4.act h a)) ∧
        Combinatorics.Colorable Combinatorics.kingAdjacency Reading ∧
          ¬ Combinatorics.Colorable
            Combinatorics.kingAdjacency Combinatorics.TriangularPhase ∧
            Combinatorics.properK4Colourings.length = 24 ∧
              (((0 : ChromaticRat) * ChromaticTileRayleigh.normSq v ≤
                  ChromaticTileRayleigh.dirichlet v)
              ∧ (ChromaticTileRayleigh.dirichlet v = 0 ↔
                  ChromaticTileRayleigh.Flat v)
              ∧ AntiLandauer.antiLandauerBits
                  (ChromaticTileRayleigh.chainNerve n) = 1
              ∧ Landauer.landauerBits
                  (ChromaticTileRayleigh.chainNerve n) = 0) ∧
              ChromaticTileRayleigh.dirichlet [(1 : ChromaticRat), -1] =
                ChromaticTileRayleigh.normSq [(1 : ChromaticRat), -1] +
                  ChromaticTileRayleigh.normSq [(1 : ChromaticRat), -1] ∧
                ChromaticTileRayleigh.idirichlet [(1 : Int), 0, -1] =
                  ChromaticTileRayleigh.inormSq [(1 : Int), 0, -1] ∧
                  (Real.Internal.RReal.ofRat (Real.Internal.Rat.ofNat 2) +
                        (- Real.Internal.sqrtNat 2)) *
                      (Real.Internal.RReal.ofRat (Real.Internal.Rat.ofNat 2) +
                        (- Real.Internal.sqrtNat 2)) +
                    Real.Internal.RReal.ofRat (Real.Internal.Rat.ofNat 2)
                    =
                      (Real.Internal.RReal.ofRat (Real.Internal.Rat.ofNat 2) +
                          Real.Internal.RReal.ofRat (Real.Internal.Rat.ofNat 2)) *
                        (Real.Internal.RReal.ofRat (Real.Internal.Rat.ofNat 2) +
                          (- Real.Internal.sqrtNat 2)) ∧
                    evalIntPoly tile7GapCubic 0 < 0 ∧
                      0 < evalIntPoly tile7GapCubic 1 ∧
                      (AperiodicOrder.Tiling.lebesgueType
                          (AperiodicOrder.Tiling.phaseDiffractionComponent side) =
                            AperiodicOrder.Tiling.phaseType side
                        ∧ regimeOf
                            (AperiodicOrder.Tiling.phaseTruthContent side)
                            (AperiodicOrder.Tiling.phaseInconsistencyContent side) =
                              AperiodicOrder.Tiling.phaseType side
                        ∧ AperiodicOrder.Tiling.pisotSalemClass
                            (AperiodicOrder.Tiling.phaseScaling side) =
                              AperiodicOrder.Tiling.phaseType side
                        ∧ AperiodicOrder.Tiling.closureRegime side =
                            AperiodicOrder.Tiling.phaseType side) ∧
                        (AperiodicOrder.Tiling.finiteFourierDualReadout n w side).atomMass =
                            AperiodicOrder.Tiling.finiteDiffractionMass n w
                              Obsmetrologia.Discrete.Set.univ ∧
                          0 <
                            (AperiodicOrder.Tiling.finiteFourierDualReadout n w side).atomMass

/-- The finite analytic spine carried by the K₄/FOUR chromatic obstruction.

The first three conjuncts are the K₄ action on FOUR: four elements, involutive
multiplication, and action-by-composition.  The next three are the exact
FOUR-chromatic king-adjacency obstruction and its finite count
`4! = 24`.  The remaining conjuncts are the finite analytic chase: Rayleigh
bottom and harmonic kernel on a rational tile, the 2- and 3-site gap witnesses,
the first quadratic and cubic algebraic gap certificates, the common finite
phase readout, and the finite Fourier-side mass law. -/
theorem k4_four_analytic_spine (v : List ChromaticRat) (n : Nat)
    (w : Fin (n + 1) → Bool) (side : Bool) :
    K4FourAnalyticSpine v n w side := by
  unfold K4FourAnalyticSpine
  exact ⟨Positing.Gauge.K4.card_eq_four,
    Positing.Gauge.K4.mul_self,
    Positing.Gauge.K4.act_mul,
    Combinatorics.king_chromaticNumber_bounded_attained.1,
    Combinatorics.king_chromaticNumber_bounded_attained.2,
            Combinatorics.properK4Colourings_count,
            ChromaticTileRayleigh.chromatic_tile_rayleigh v n,
    ChromaticTileRayleigh.twoSite_eigenvector,
    ChromaticTileRayleigh.iThreeSite_eigenvector,
    tile4_gap_char_root,
    tile7_gap_bracket.1,
    tile7_gap_bracket.2,
    AperiodicOrder.Tiling.phaseType_readings_agree side,
    (AperiodicOrder.Tiling.finiteFourierDualReadout_mass n w side).1,
    (AperiodicOrder.Tiling.finiteFourierDualReadout_mass n w side).2⟩

end Flow
end Obsmetrologia
