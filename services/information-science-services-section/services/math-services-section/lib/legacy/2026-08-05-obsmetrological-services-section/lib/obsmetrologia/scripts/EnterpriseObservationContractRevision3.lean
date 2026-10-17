import Obsmetrologia.Language.Predicating.Temporal
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Site.Claim
import Obsmetrologia.Closure.RuleSystem
import Obsmetrologia.CausalSets.Causal.Order
import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.Cohomology.CoordinationCohomology

/-!
# Enterprise observation acceptance contract, Revision 3

This contract addresses the independent Revision 2 PQA review at SHA-256
`5d0a5929452b2aca99e7d24d723b12163fd9f011de53c763ba93888b0a0646a2`.
It retains record partitions in each observation, states object-level coherence
at the imported Obsmetrologia carriers, and represents authorization with one
concrete evidence record transported as an `Option`.

Later contracts remain responsible for transition-level Cech restriction and
gluing preservation, causal reachability preservation, monotonic settlement,
CoverNerve H1 and Landauer preservation, and the value-level converse. Those
transition laws are distinct from the object-level well-formedness required
here. This script supplies no production observation definition or inhabitant.
-/

namespace Obsmetrologia.EnterpriseAcceptance

/-- A normalized record with a stable identity cell followed by its assertion
cells. -/
structure EnterpriseRecordEncoding where
  identityCell : PredicationCell
  assertionCells : List PredicationCell

namespace EnterpriseRecordEncoding

/-- The nonempty ordered cells of one normalized record. -/
def cells (encoding : EnterpriseRecordEncoding) : List PredicationCell :=
  encoding.identityCell :: encoding.assertionCells

end EnterpriseRecordEncoding

/-- Normalize records while retaining their order and per-record boundaries. -/
def recordEncodings {EnterpriseRecord : Type}
    (recordEncoder : EnterpriseRecord → EnterpriseRecordEncoding)
    (records : List EnterpriseRecord) : List EnterpriseRecordEncoding :=
  records.map recordEncoder

/-- Project the ordered cells of every normalized record without flattening the
record partition. -/
def cellsByRecord (encodings : List EnterpriseRecordEncoding) :
    List (List PredicationCell) :=
  encodings.map EnterpriseRecordEncoding.cells

/-- One witnessed 1-cell of the Cech cover nerve. Its endpoints are cover
patches and its overlap is an observed predication cell. -/
structure CechNerveCell
    (observedCells : List PredicationCell)
    (datum : Cohomology.Cech1) where
  leftPatch : PredicationCell → Bool
  rightPatch : PredicationCell → Bool
  leftPatch_mem : leftPatch ∈ datum.cover.patches
  rightPatch_mem : rightPatch ∈ datum.cover.patches
  overlapCell : PredicationCell
  overlapCell_observed : overlapCell ∈ observedCells
  leftPatch_holds : leftPatch overlapCell = true
  rightPatch_holds : rightPatch overlapCell = true

/-- The exact boundary-bearing and proof-carrying observation carrier. -/
structure ObservationState (ObservationEvent : Type) where
  /-- The record partition remains observable in the resulting state. -/
  recordEncodings : List EnterpriseRecordEncoding
  /-- The flat cell projection used by existing predication carriers. -/
  predicationCells : List PredicationCell
  /-- The flat projection is exactly the retained per-record cells flattened. -/
  predicationCells_flatten :
    predicationCells = (cellsByRecord recordEncodings).flatten
  valuation : Valuation
  /-- Every cell carried by an observed record has evidence above knowledge
  bottom. -/
  valuation_record_nonbottom :
    ∀ encoding, encoding ∈ recordEncodings →
      ∀ cell, cell ∈ encoding.cells → valuation cell ≠ Charge.kBot
  sitePoints : List Claim.SitePoint
  /-- Site-point claim projection is exactly the observed cell sequence. -/
  sitePoints_project_predication :
    sitePoints.map (fun point => point.q) = predicationCells
  closureRules : ClosureRule.RuleSystem
  /-- Every closure consequent names an observed cell. -/
  closureRule_cells_observed :
    ∀ rule, rule ∈ closureRules → rule.cell ∈ predicationCells
  /-- The observed valuation is settled by its named rule system. -/
  closureRules_settle_valuation :
    ClosureRule.Tstep closureRules valuation = valuation
  /-- One explicit event pairing for every retained record, in record order. -/
  recordEvents : List (EnterpriseRecordEncoding × ObservationEvent)
  /-- The event pairing projects to exactly the retained records. -/
  causal_record_events : recordEvents.map Prod.fst = recordEncodings
  causalSet : CausalSets.Causal.Order.CausalSet ObservationEvent
  /-- The real causal set's event list is exactly the record-event projection. -/
  causal_events_follow_records : causalSet.events = recordEvents.map Prod.snd
  cechDatum : Cohomology.Cech1
  /-- The local sections agree on every cover overlap. -/
  cechDatum_cocycle : Cohomology.Cocycle cechDatum
  /-- The agreeing family is the restriction of its exact glued section. -/
  cechDatum_glues :
    Cohomology.Coboundary cechDatum (Cohomology.glue cechDatum)
  /-- Explicit observed overlaps counted as the nerve's 1-cells. -/
  nerveCells : List (CechNerveCell predicationCells cechDatum)
  /-- Each counted nerve cell has one stable list occurrence. -/
  nerveCells_nodup : nerveCells.Nodup
  /-- Cover patches chosen as representatives of the nerve components. -/
  nerveComponents : List (PredicationCell → Bool)
  /-- Every component representative belongs to the same Cech cover. -/
  nerveComponents_in_cover :
    ∀ patch, patch ∈ nerveComponents → patch ∈ cechDatum.cover.patches
  /-- Component representatives are not counted twice. -/
  nerveComponents_nodup : nerveComponents.Nodup
  coverNerve : Cohomology.CoverNerve
  /-- Nerve vertices are exactly the patches of the observed Cech cover. -/
  coverNerve_entities :
    coverNerve.entities = cechDatum.cover.patches.length
  /-- Nerve 1-cells are exactly the explicit observed overlap witnesses. -/
  coverNerve_cells : coverNerve.cells = nerveCells.length
  /-- Nerve components are exactly the named cover representatives. -/
  coverNerve_components : coverNerve.components = nerveComponents.length
  /-- The real H1 rank is the Euler count of those named observed supports. -/
  coverNerve_h1_observed :
    Cohomology.CoverNerve.H1rank coverNerve =
      (nerveCells.length + nerveComponents.length) -
        cechDatum.cover.patches.length

/-- Concrete authorization evidence for one admitted enterprise instrument. The
stable evidence identity is the admitted record identity; authority and
admission cells are carried by that same boundary-bearing record. -/
structure AdmittedInstrumentEvidence where
  evidenceIdentity : PredicationCell
  admittedRecord : EnterpriseRecordEncoding
  authorityCell : PredicationCell
  admissionCell : PredicationCell
  evidenceIdentity_stable : evidenceIdentity = admittedRecord.identityCell
  authorityCell_carried : authorityCell ∈ admittedRecord.cells
  admissionCell_carried : admissionCell ∈ admittedRecord.cells

/-- A functor between existing small category carriers. Composition uses the
`Temporal.Category.comp g f` argument orientation. -/
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

/-- Revision 3 obligations over the existing category and observation carriers. -/
structure EnterpriseObservationContractRevision3
    (EnterpriseRecord : Type)
    (ObservationEvent : Type)
    (sourceCategory targetCategory : Temporal.Category) where
  /-- Read the real observation carried by a target-category object. -/
  targetState : targetCategory.Obj → ObservationState ObservationEvent
  /-- Recover the exact target object from its observation. -/
  targetObject : ObservationState ObservationEvent → targetCategory.Obj
  targetState_targetObject : (state : ObservationState ObservationEvent) →
    targetState (targetObject state) = state
  targetObject_targetState : (object : targetCategory.Obj) →
    targetObject (targetState object) = object
  /-- The ordered enterprise records present at a source object. -/
  stateRecords : sourceCategory.Obj → List EnterpriseRecord
  /-- Lossless normalization of each enterprise record. -/
  recordEncoder : EnterpriseRecord → EnterpriseRecordEncoding
  recordEncoder_injective : Function.Injective recordEncoder
  /-- Source objects are determined by their ordered normalized records. -/
  recordEncodings_injective : Function.Injective
    (fun state => recordEncodings recordEncoder (stateRecords state))
  /-- The record interface is inhabited. -/
  recordWitness : EnterpriseRecord
  /-- The categorical observation mapping with exact functor laws. -/
  observationFunctor : CategoryFunctor sourceCategory targetCategory
  /-- The mapped real target state retains exactly the normalized source records. -/
  object_map_recordEncodings : (state : sourceCategory.Obj) →
    (targetState (observationFunctor.obj state)).recordEncodings =
      recordEncodings recordEncoder (stateRecords state)
  /-- The mapped observation state distinguishes source objects. -/
  observationOf_injective : Function.Injective
    (fun state => targetState (observationFunctor.obj state))
  /-- Source transitions return concrete admitted-instrument evidence or refusal. -/
  sourceAuthorizationEvidence :
    {source target : sourceCategory.Obj} →
      sourceCategory.Hom source target →
        Option AdmittedInstrumentEvidence
  /-- Target transitions return the same concrete evidence carrier or refusal. -/
  targetAuthorizationEvidence :
    {source target : targetCategory.Obj} →
      targetCategory.Hom source target →
        Option AdmittedInstrumentEvidence
  /-- Mapping a transition preserves its exact optional evidence value. -/
  authorizationEvidence_preserved :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      targetAuthorizationEvidence (observationFunctor.map transition) =
        sourceAuthorizationEvidence transition
  /-- Reading mapped evidence reflects the exact source optional evidence value. -/
  authorizationEvidence_reflected :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      sourceAuthorizationEvidence transition =
        targetAuthorizationEvidence (observationFunctor.map transition)
  /-- Present source evidence names a retained source record, an authority cell in
  the mapped source observation, and an admission cell in the mapped target. -/
  sourceEvidence_carried :
    {source target : sourceCategory.Obj} →
      (transition : sourceCategory.Hom source target) →
      (evidence : AdmittedInstrumentEvidence) →
      sourceAuthorizationEvidence transition = some evidence →
        evidence.admittedRecord ∈
            recordEncodings recordEncoder (stateRecords source) ∧
          evidence.authorityCell ∈
            (targetState (observationFunctor.obj source)).predicationCells ∧
          evidence.admissionCell ∈
            (targetState (observationFunctor.obj target)).predicationCells
  /-- Present target evidence is carried by its source observation and both
  target-category endpoint cell carriers, including away from the functor image. -/
  targetEvidence_carried :
    {source target : targetCategory.Obj} →
      (transition : targetCategory.Hom source target) →
      (evidence : AdmittedInstrumentEvidence) →
      targetAuthorizationEvidence transition = some evidence →
        evidence.admittedRecord ∈
            (targetState source).recordEncodings ∧
          evidence.authorityCell ∈
            (targetState source).predicationCells ∧
          evidence.admissionCell ∈
            (targetState target).predicationCells
  /-- A nonidentity transition carrying concrete evidence exists. -/
  authorizedWitness :
    ∃ (source target : sourceCategory.Obj),
      source ≠ target ∧
        ∃ (transition : sourceCategory.Hom source target)
          (evidence : AdmittedInstrumentEvidence),
          sourceAuthorizationEvidence transition = some evidence
  /-- A nonidentity transition carrying exact refusal exists. -/
  unauthorizedWitness :
    ∃ (source target : sourceCategory.Obj),
      source ≠ target ∧
        ∃ transition : sourceCategory.Hom source target,
          sourceAuthorizationEvidence transition = none
  /-- Identity preservation at the exact reused hom types. -/
  map_id : (source : sourceCategory.Obj) →
    observationFunctor.map (sourceCategory.id source) =
      targetCategory.id (observationFunctor.obj source)
  /-- Composition preservation in the reused `g`-then-`f` orientation. -/
  map_comp : {source middle target : sourceCategory.Obj} →
    (g : sourceCategory.Hom middle target) →
    (f : sourceCategory.Hom source middle) →
    observationFunctor.map (sourceCategory.comp g f) =
      targetCategory.comp
        (observationFunctor.map g)
        (observationFunctor.map f)

end Obsmetrologia.EnterpriseAcceptance
