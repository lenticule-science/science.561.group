import Obsmetrologia.Language.Predicating.Temporal
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Site.Claim
import Obsmetrologia.Closure.RuleSystem
import Obsmetrologia.CausalSets.Causal.Order
import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.Cohomology.CoordinationCohomology

/-!
# Enterprise observation acceptance contract, Revision 2

This abstract contract repairs the findings in the independent PQA review at
SHA-256 `be06482b78ec4e3290581439cc54a2003c3aa6305f5a008b985b0a726e8ee9f1`.
It reuses `Temporal.Category`, retains record boundaries, binds every observed
coordinate to one normalized construction, and carries authorization as
transition-indexed evidence with positive and refusal witnesses.

The Obsmetrologia Lean MCP handshake was unavailable in this authoring session.
The exact imported declarations were inspected at source and this script is
checked with the package-local Lake environment.

Later contracts retain responsibility for Cech restriction and gluing
preservation, causal reachability preservation, valuation monotonicity and
closure settlement, CoverNerve H1 and Landauer preservation, and the
value-level converse. This script supplies no production implementation.
-/

namespace Obsmetrologia.EnterpriseAcceptance

/-- A normalized record with a distinguished identity cell and its remaining
assertion cells. -/
structure EnterpriseRecordEncoding where
  identityCell : PredicationCell
  assertionCells : List PredicationCell

namespace EnterpriseRecordEncoding

/-- The nonempty cell sequence of one normalized record. -/
def cells (encoding : EnterpriseRecordEncoding) : List PredicationCell :=
  encoding.identityCell :: encoding.assertionCells

end EnterpriseRecordEncoding

/-- Normalize records without erasing their list positions. -/
def recordEncodings {EnterpriseRecord : Type}
    (recordEncoder : EnterpriseRecord → EnterpriseRecordEncoding)
    (records : List EnterpriseRecord) : List EnterpriseRecordEncoding :=
  records.map recordEncoder

/-- Retain one cell list per record rather than identifying the state with one
unmarked flattened sequence. -/
def cellsByRecord (encodings : List EnterpriseRecordEncoding) :
    List (List PredicationCell) :=
  encodings.map EnterpriseRecordEncoding.cells

/-- The exact carrier coordinates of one normalized enterprise observation. -/
structure ObservationState (ObservationEvent : Type) where
  predicationCells : List PredicationCell
  valuation : Valuation
  sitePoints : List Claim.SitePoint
  closureRules : ClosureRule.RuleSystem
  causalSet : CausalSets.Causal.Order.CausalSet ObservationEvent
  cechDatum : Cohomology.Cech1
  coverNerve : Cohomology.CoverNerve

/-- Coordinate encoders for one normalized record sequence. Later coordinates
receive the neighbouring coordinates on which their object-level meaning
depends. -/
structure ObservationEncoders (ObservationEvent : Type) where
  valuationOf : List EnterpriseRecordEncoding → Valuation
  sitePointsOf : List EnterpriseRecordEncoding → List Claim.SitePoint
  closureRulesOf :
    List EnterpriseRecordEncoding → Valuation → ClosureRule.RuleSystem
  causalSetOf :
    List EnterpriseRecordEncoding →
      CausalSets.Causal.Order.CausalSet ObservationEvent
  cechDatumOf :
    List EnterpriseRecordEncoding →
      Valuation → List Claim.SitePoint → Cohomology.Cech1
  coverNerveOf :
    List EnterpriseRecordEncoding →
      List Claim.SitePoint → Cohomology.Cech1 → Cohomology.CoverNerve

/-- Construct the whole observation from one boundary-preserving normalized
record sequence and one set of explicit coordinate encoders. -/
def normalizedObservation {ObservationEvent : Type}
    (encoders : ObservationEncoders ObservationEvent)
    (encodings : List EnterpriseRecordEncoding) :
    ObservationState ObservationEvent :=
  let valuation := encoders.valuationOf encodings
  let sitePoints := encoders.sitePointsOf encodings
  let closureRules := encoders.closureRulesOf encodings valuation
  let causalSet := encoders.causalSetOf encodings
  let cechDatum := encoders.cechDatumOf encodings valuation sitePoints
  let coverNerve := encoders.coverNerveOf encodings sitePoints cechDatum
  {
    predicationCells := (cellsByRecord encodings).flatten
    valuation := valuation
    sitePoints := sitePoints
    closureRules := closureRules
    causalSet := causalSet
    cechDatum := cechDatum
    coverNerve := coverNerve
  }

/-- A functor between two existing small category carriers. Composition follows
`Temporal.Category.comp g f`, with the later morphism supplied first. -/
structure CategoryFunctor
    (sourceCategory targetCategory : Temporal.Category) where
  obj : sourceCategory.Obj → targetCategory.Obj
  map : {source target : sourceCategory.Obj} →
    sourceCategory.Hom source target →
      targetCategory.Hom (obj source) (obj target)
  map_id : (source : sourceCategory.Obj) →
    map (sourceCategory.id source) = targetCategory.id (obj source)
  map_comp : {source middle target : sourceCategory.Obj} →
    (g : sourceCategory.Hom middle target) →
    (f : sourceCategory.Hom source middle) →
    map (sourceCategory.comp g f) =
      targetCategory.comp (map g) (map f)

/-- The repaired semantic obligations for the first enterprise-observation
tranche. Both category arguments are existing `Temporal.Category` values. -/
structure EnterpriseObservationContractRevision2
    (EnterpriseRecord : Type)
    (ObservationEvent : Type)
    (sourceCategory targetCategory : Temporal.Category) where
  /-- The target category objects are exactly observation states, through an
  explicit reversible carrier identification. -/
  targetState : targetCategory.Obj → ObservationState ObservationEvent
  /-- Recover a target-category object from its observation state. -/
  targetObject : ObservationState ObservationEvent → targetCategory.Obj
  /-- Reading a recovered target object returns the original observation. -/
  targetState_targetObject : (state : ObservationState ObservationEvent) →
    targetState (targetObject state) = state
  /-- Recovering a read target object returns the original category object. -/
  targetObject_targetState : (object : targetCategory.Obj) →
    targetObject (targetState object) = object
  /-- The source state's ordered enterprise records. -/
  stateRecords : sourceCategory.Obj → List EnterpriseRecord
  /-- One record normalization, retaining the per-record carrier. -/
  recordEncoder : EnterpriseRecord → EnterpriseRecordEncoding
  /-- Individual record normalization is lossless. -/
  recordEncoder_injective : Function.Injective recordEncoder
  /-- Boundary-preserving state normalization is lossless. -/
  recordEncodings_injective : Function.Injective
    (fun state => recordEncodings recordEncoder (stateRecords state))
  /-- At least one record inhabits the source record interface. -/
  recordWitness : EnterpriseRecord
  /-- The six derived coordinate functions used with the cell-boundary
  construction. -/
  observationEncoders : ObservationEncoders ObservationEvent
  /-- The categorical observation map. -/
  observationFunctor : CategoryFunctor sourceCategory targetCategory
  /-- The target object selected by the functor is exactly the single normalized
  observation construction. -/
  object_map_is_normalized : (state : sourceCategory.Obj) →
    targetState (observationFunctor.obj state) =
      normalizedObservation observationEncoders
        (recordEncodings recordEncoder (stateRecords state))
  /-- The complete normalized observation distinguishes source states. -/
  observationOf_injective : Function.Injective
    (fun state =>
      normalizedObservation observationEncoders
        (recordEncodings recordEncoder (stateRecords state)))
  /-- Exact admitted-instrument evidence, indexed by the source transition it
  authorizes. -/
  admittedInstrumentAuthorizationEvidence :
    {source target : sourceCategory.Obj} →
      sourceCategory.Hom source target → Type
  /-- Exact target authorization evidence, indexed by the observed transition. -/
  targetAuthorizationEvidence :
    {source target : targetCategory.Obj} →
      targetCategory.Hom source target → Type
  /-- Mapping a transition preserves and reflects its authorization evidence. -/
  authorizationEvidenceMap :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      admittedInstrumentAuthorizationEvidence transition →
        targetAuthorizationEvidence (observationFunctor.map transition)
  /-- Target evidence determines the admitted source instrument evidence. -/
  authorizationEvidenceReflect :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      targetAuthorizationEvidence (observationFunctor.map transition) →
        admittedInstrumentAuthorizationEvidence transition
  /-- Evidence reflection after preservation returns the source evidence. -/
  authorizationEvidence_reflect_map :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      (evidence : admittedInstrumentAuthorizationEvidence transition) →
      authorizationEvidenceReflect transition
          (authorizationEvidenceMap transition evidence) = evidence
  /-- Evidence preservation after reflection returns the target evidence. -/
  authorizationEvidence_map_reflect :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      (evidence :
        targetAuthorizationEvidence (observationFunctor.map transition)) →
      authorizationEvidenceMap transition
          (authorizationEvidenceReflect transition evidence) = evidence
  /-- Authorization inhabitation is reflected at the mapped transition. -/
  reflects_authorization :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      Nonempty (admittedInstrumentAuthorizationEvidence transition) ↔
        Nonempty
          (targetAuthorizationEvidence (observationFunctor.map transition))
  /-- An authorized nonidentity transition exists. -/
  authorizedWitness :
    ∃ (source target : sourceCategory.Obj),
      source ≠ target ∧
        ∃ transition : sourceCategory.Hom source target,
          Nonempty (admittedInstrumentAuthorizationEvidence transition)
  /-- An unauthorized nonidentity transition exists. -/
  unauthorizedWitness :
    ∃ (source target : sourceCategory.Obj),
      source ≠ target ∧
        ∃ transition : sourceCategory.Hom source target,
          admittedInstrumentAuthorizationEvidence transition → False
  /-- Identity preservation at the reused category carrier's exact hom types. -/
  map_id : (source : sourceCategory.Obj) →
    observationFunctor.map (sourceCategory.id source) =
      targetCategory.id (observationFunctor.obj source)
  /-- Composition preservation in the reused carrier's `g`-then-`f` argument
  orientation. -/
  map_comp : {source middle target : sourceCategory.Obj} →
    (g : sourceCategory.Hom middle target) →
    (f : sourceCategory.Hom source middle) →
    observationFunctor.map (sourceCategory.comp g f) =
      targetCategory.comp
        (observationFunctor.map g)
        (observationFunctor.map f)

end Obsmetrologia.EnterpriseAcceptance
