import Obsmetrologia.Calculus.Order.FormalConceptAnalysis
import ObsmetrologiaPhysicalScience.QuantumContextuality.MeasurementScenario

/-!
# The concept lattice of a measurement scenario

A measurement scenario presents a formal context in the sense of `FCA`: its witnessed
allowed assignments are the objects, its measurements the attributes, and reading a
chosen outcome is the incidence.
-/

namespace Obsmetrologia
namespace FCA

/-! ## The incidence of a measurement scenario — FCA's context, derived

`(G, M, I)` was carried above as three free inputs — any relation qualifies, so nothing
forces `I` to be a **witnessed** incidence rather than an assumed one. `QuantumContextuality.Model`
supplies that witness: fix a scenario's allowed assignments as the objects, its
measurements as the attributes, and a chosen outcome `o₀` as "has the attribute" — an
object *has* attribute `m` exactly when its assignment reads `o₀` at `m`. This is the
formal-context reading of a measurement scenario, not a resemblance: `primeA`/`primeB`
below run on incidence built from an actual `Model.support` witness. -/

open QuantumContextuality

/-- An **allowed assignment** of a model: an outcome function together with a witness
that some context of the scenario supports it. The FCA object carrier — not the bare
`M → O`, but the assignments the model actually realizes. -/
def Allowed {M O : Type} (E : Model M O) : Type :=
  {g : M → O // ∃ C, C ∈ E.scenario.contexts ∧ E.support C g}

/-- **The incidence of a model at outcome `o₀`.** An allowed assignment `g` *has*
attribute `m` exactly when it reads `o₀` there. The attributes are the model's own
measurement carrier; the objects are its witnessed allowed assignments — the formal
context a measurement scenario presents. -/
def modelIncidence {M O : Type} (E : Model M O) (o₀ : O) : Allowed E → M → Prop :=
  fun g m => g.1 m = o₀

/-- **The PR box's incidence at `true`.** The formal context `modelIncidence prBox true`
has as objects the PR box's witnessed allowed assignments and as attributes its four
measurements; the derivation Galois connection (`derivation_galois_connection`) and the
concept lattice (`conceptLatticeData`) apply to it exactly as to any context, now built
from a proved-inhabited empirical model rather than an assumed relation. -/
def prBoxConceptLattice : ConceptLatticeData (Allowed prBox) PRM (modelIncidence prBox true) :=
  conceptLatticeData (modelIncidence prBox true)

end FCA
end Obsmetrologia
