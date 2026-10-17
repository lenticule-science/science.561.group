import Obsmetrologia.AperiodicOrder.Tiling.AndersonPutnam
import Obsmetrologia.AperiodicOrder.Tiling.AperiodicSettleFrame
import Obsmetrologia.AperiodicOrder.Tiling.ArithmeticZetaStar
import Obsmetrologia.AperiodicOrder.Tiling.Autopoiesis
import Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian
import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.AperiodicOrder.Tiling.ClassificationReduction
import Obsmetrologia.AperiodicOrder.Tiling.ClassificationIncompleteness
import Obsmetrologia.AperiodicOrder.Tiling.CoClassifying
import Obsmetrologia.AperiodicOrder.Tiling.CohomologicalEquivalence
import Obsmetrologia.AperiodicOrder.Tiling.CollatzTwoAdicLock
import Obsmetrologia.AperiodicOrder.Tiling.ColorPredictor
import Obsmetrologia.AperiodicOrder.Tiling.CommonBaseClassification
import Obsmetrologia.AperiodicOrder.Tiling.Diffraction
import Obsmetrologia.AperiodicOrder.Tiling.FiniteAutocorrelation
import Obsmetrologia.AperiodicOrder.Tiling.FiniteInfiniteCharger
import Obsmetrologia.AperiodicOrder.Tiling.FiniteLocalRule
import Obsmetrologia.AperiodicOrder.Tiling.GeometricMldComplete
import Obsmetrologia.AperiodicOrder.Tiling.History
import Obsmetrologia.AperiodicOrder.Tiling.InverseHull
import Obsmetrologia.AperiodicOrder.Tiling.J26
import Obsmetrologia.AperiodicOrder.Tiling.KappaStratification
import Obsmetrologia.AperiodicOrder.Tiling.LenticleIdentification
import Obsmetrologia.AperiodicOrder.Tiling.MetallicModuli
import Obsmetrologia.AperiodicOrder.Tiling.MetallizationDichotomy
import Obsmetrologia.AperiodicOrder.Tiling.Moduli
import Obsmetrologia.AperiodicOrder.Tiling.PortGraph
import Obsmetrologia.AperiodicOrder.Tiling.PortGrowth
import Obsmetrologia.AperiodicOrder.Tiling.PortVershik
import Obsmetrologia.AperiodicOrder.Tiling.SoficShift
import Obsmetrologia.AperiodicOrder.Tiling.StepN.CLehmer
import Obsmetrologia.AperiodicOrder.Tiling.StepN.FixedPoint
import Obsmetrologia.AperiodicOrder.Tiling.StepN.GoldenFieldBridge
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicMean
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicPowerLens
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicReal
import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicRoot
import Obsmetrologia.AperiodicOrder.Tiling.StepN.Recurrence
import Obsmetrologia.AperiodicOrder.Tiling.StepN.Salem
import Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRegime
import Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRoot
import Obsmetrologia.AperiodicOrder.Tiling.StepN.SubstitutionMatrix
import Obsmetrologia.AperiodicOrder.Tiling.SubstitutionPrimitivity
import Obsmetrologia.AperiodicOrder.Tiling.SynonymyAntonymy
import Obsmetrologia.AperiodicOrder.Tiling.TransfiniteUpToClosure
import Obsmetrologia.AperiodicOrder.Tiling.Universality
import Obsmetrologia.AperiodicOrder.Tiling.UpToClosureCoinduction
import Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore
import Obsmetrologia.AperiodicOrder.Tiling.Witness.HatMetatile
import Obsmetrologia.AperiodicOrder.Tiling.Witness.HatReflectionFrequency
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRao
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoDecidableCore
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoPersistence
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitution
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitutionTower

/-!
# AperiodicOrder — aperiodic tilings

The substitution-system/tiling core (`Tiling`, incl. the metallic-mean `StepN` tower,
the port-graph and lenticle carriers, and the Jeandel-Rao `Witness` cohomology
computations) and the tiling moduli.

The matter built on these carriers — the `Tile -> Bead -> Crystal -> Quasicrystal -> Glass`
chain, glass dynamics, defects, condensate matter — is in `ObsmetrologiaPhysicalScience`;
the material sector readouts are in `ObsmetrologiaMaterials`; the weave draft is in
`ObsmetrologiaFibercraft`.
-/
