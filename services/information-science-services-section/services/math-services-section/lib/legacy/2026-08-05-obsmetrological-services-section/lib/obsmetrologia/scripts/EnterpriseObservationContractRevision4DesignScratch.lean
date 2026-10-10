import Obsmetrologia.Site.Intension
import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.CausalSets.Causal.Order
import Obsmetrologia.Cohomology.CoordinationCohomology
import Obsmetrologia.Language.Predicating.Temporal
import Obsmetrologia.Closure.RuleSystem

namespace Obsmetrologia

/-- The minimal common carrier for one valuation read through one bounded site cover. -/
structure ValuatedSiteCover where
  point : Claim.SitePoint
  valuation : Valuation
  cover : List Site.Clopen
  covers : Site.Covers point.U cover

namespace ValuatedSiteCover

def ofValuatedTermReading {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) : ValuatedSiteCover where
  point := R.reading.topic.point
  valuation := R.valuation
  cover := R.reading.topic.cover
  covers := R.reading.topic.covers

@[simp] theorem ofValuatedTermReading_point {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) :
    (ofValuatedTermReading R).point = R.reading.topic.point := rfl

@[simp] theorem ofValuatedTermReading_valuation {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) :
    (ofValuatedTermReading R).valuation = R.valuation := rfl

@[simp] theorem ofValuatedTermReading_cover {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) :
    (ofValuatedTermReading R).cover = R.reading.topic.cover := rfl

theorem ofValuatedTermReading_covers {C : Claim.TermContext}
    (R : Claim.ValuatedTermReading C) :
    (ofValuatedTermReading R).covers = R.reading.topic.covers := rfl

def relativeSupport (V : ValuatedSiteCover) : PredicationCell -> Bool :=
  Claim.ValuatedTermReading.clopenPatch V.valuation V.point.U

def relativePatches (V : ValuatedSiteCover) : List (PredicationCell -> Bool) :=
  V.cover.map (Claim.ValuatedTermReading.clopenPatch V.valuation)

@[simp] theorem relativeSupport_eq (V : ValuatedSiteCover) :
    V.relativeSupport =
      Claim.ValuatedTermReading.clopenPatch V.valuation V.point.U := rfl

@[simp] theorem relativePatches_eq (V : ValuatedSiteCover) :
    V.relativePatches =
      V.cover.map (Claim.ValuatedTermReading.clopenPatch V.valuation) := rfl

theorem relativeSupportOccursInCoverPatch (V : ValuatedSiteCover) :
    forall cell, V.relativeSupport cell = true ->
      exists patch, patch ∈ V.relativePatches ∧ patch cell = true := by
  intro cell hcell
  have hjoin : Claim.ValuatedTermReading.clopenPatch V.valuation
      (Site.joinList V.cover) cell = true := by
    rw [V.covers.2]
    exact hcell
  obtain ⟨U, hU, hpatch⟩ :=
    Claim.ValuatedTermReading.clopenPatch_joinList_true V.valuation cell hjoin
  exact ⟨Claim.ValuatedTermReading.clopenPatch V.valuation U,
    List.mem_map.mpr ⟨U, hU, rfl⟩, hpatch⟩

def complementPatch (V : ValuatedSiteCover) : PredicationCell -> Bool :=
  fun cell => ! V.relativeSupport cell

def totalizedPatches (V : ValuatedSiteCover) : List (PredicationCell -> Bool) :=
  V.relativePatches ++ [V.complementPatch]

@[simp] theorem complementPatch_eq (V : ValuatedSiteCover) :
    V.complementPatch = fun cell => ! V.relativeSupport cell := rfl

@[simp] theorem totalizedPatches_eq (V : ValuatedSiteCover) :
    V.totalizedPatches = V.relativePatches ++ [V.complementPatch] := rfl

theorem complementPatch_mem_totalizedPatches (V : ValuatedSiteCover) :
    V.complementPatch ∈ V.totalizedPatches := by
  simp [totalizedPatches]

def totalizedCover (V : ValuatedSiteCover) : Sheaf.Cover where
  patches := V.totalizedPatches
  covers := by
    intro cell
    cases hsupport : V.relativeSupport cell with
    | false =>
        exact ⟨V.complementPatch, by simp [totalizedPatches],
          by simp [complementPatch, hsupport]⟩
    | true =>
        obtain ⟨patch, hpatch, hholds⟩ :=
          V.relativeSupportOccursInCoverPatch cell hsupport
        exact ⟨patch, List.mem_append_left _ hpatch, hholds⟩

@[simp] theorem totalizedCover_patches (V : ValuatedSiteCover) :
    V.totalizedCover.patches = V.totalizedPatches := rfl

def supportedIdentityCochain (V : ValuatedSiteCover) : AssocSheaf.Cochain :=
  AssocSheaf.restrict V.relativeSupport
    (Cohomology.identityCochain V.valuation)

@[simp] theorem supportedIdentityCochain_eq (V : ValuatedSiteCover) :
    V.supportedIdentityCochain = AssocSheaf.restrict V.relativeSupport
      (Cohomology.identityCochain V.valuation) := rfl

def localSection (V : ValuatedSiteCover) (patch : PredicationCell -> Bool) :
    AssocSheaf.Cochain :=
  AssocSheaf.restrict patch V.supportedIdentityCochain

@[simp] theorem localSection_eq (V : ValuatedSiteCover)
    (patch : PredicationCell -> Bool) :
    V.localSection patch = AssocSheaf.restrict patch V.supportedIdentityCochain := rfl

def cechDatum (V : ValuatedSiteCover) : Cohomology.Cech1 where
  cover := V.totalizedCover
  local_ := V.localSection

@[simp] theorem cechDatum_cover (V : ValuatedSiteCover) :
    V.cechDatum.cover = V.totalizedCover := rfl

@[simp] theorem cechDatum_local (V : ValuatedSiteCover) :
    V.cechDatum.local_ = V.localSection := rfl

theorem cocycle (V : ValuatedSiteCover) : Cohomology.Cocycle V.cechDatum := by
  intro left _ right _ cell hleft hright
  simp [cechDatum, localSection, AssocSheaf.restrict, hleft, hright]

theorem glueCoboundary (V : ValuatedSiteCover) :
    Cohomology.Coboundary V.cechDatum (Cohomology.glue V.cechDatum) :=
  Cohomology.glue_coboundary V.cechDatum V.cocycle

theorem glueUnique (V : ValuatedSiteCover) :
    forall g1 g2 : AssocSheaf.Cochain,
      Cohomology.Coboundary V.cechDatum g1 ->
      Cohomology.Coboundary V.cechDatum g2 -> g1 = g2 :=
  Cohomology.glue_unique V.cechDatum

end ValuatedSiteCover

namespace EnterpriseAcceptance.Revision4

structure EnterpriseRecordEncoding where
  identityCell : PredicationCell
  assertionCells : List PredicationCell

namespace EnterpriseRecordEncoding

def cells (encoding : EnterpriseRecordEncoding) : List PredicationCell :=
  encoding.identityCell :: encoding.assertionCells

end EnterpriseRecordEncoding

def recordEncodings {EnterpriseRecord : Type}
    (recordEncoder : EnterpriseRecord -> EnterpriseRecordEncoding)
    (records : List EnterpriseRecord) : List EnterpriseRecordEncoding :=
  records.map recordEncoder

def cellsByRecord (encodings : List EnterpriseRecordEncoding) :
    List (List PredicationCell) :=
  encodings.map EnterpriseRecordEncoding.cells

structure CategoryFunctor
    (sourceCategory targetCategory : Temporal.Category) where
  obj : sourceCategory.Obj -> targetCategory.Obj
  map : {source target : sourceCategory.Obj} ->
    sourceCategory.Hom source target ->
      targetCategory.Hom (obj source) (obj target)
  map_id : (source : sourceCategory.Obj) ->
    map (sourceCategory.id source) = targetCategory.id (obj source)
  map_comp : {source middle target : sourceCategory.Obj} ->
    (g : sourceCategory.Hom middle target) ->
    (f : sourceCategory.Hom source middle) ->
    map (sourceCategory.comp g f) =
      targetCategory.comp (map g) (map f)

structure StableEnterpriseRecord (StableIdentity : Type) where
  stableIdentity : StableIdentity
  encoding : EnterpriseRecordEncoding

namespace StableEnterpriseRecord

def cells {StableIdentity : Type}
    (record : StableEnterpriseRecord StableIdentity) : List PredicationCell :=
  record.encoding.cells

end StableEnterpriseRecord

def orderedCausalGraph {ObservationEvent : Type} [DecidableEq ObservationEvent]
    (events : List ObservationEvent) : Discrete.Graph ObservationEvent :=
  fun source target =>
    (events.zip events.tail).any
      (fun edge => decide (edge.1 = source) && decide (edge.2 = target))

structure ObservationStateRevision4
    (StableIdentity ObservationEvent : Type)
    [DecidableEq ObservationEvent] where
  records : List (StableEnterpriseRecord StableIdentity)
  recordIdentities_nodup : (records.map StableEnterpriseRecord.stableIdentity).Nodup
  recordIdentity_collision_free :
    forall {left right}, left ∈ records -> right ∈ records ->
      left.stableIdentity = right.stableIdentity -> left = right
  predicationCells : List PredicationCell
  predicationCells_flatten :
    predicationCells = (records.map StableEnterpriseRecord.cells).flatten
  siteCover : ValuatedSiteCover
  sitePoints : List Claim.SitePoint
  sitePoints_project_predication :
    sitePoints.map (fun point => point.q) = predicationCells
  sitePoint_strata :
    forall point, point ∈ sitePoints -> point.tau = siteCover.point.tau
  sitePoint_supports :
    forall point, point ∈ sitePoints -> point.U ⊑ siteCover.point.U
  recordCells_in_site_support :
    forall cell, cell ∈ predicationCells -> siteCover.relativeSupport cell = true
  closureRules : ClosureRule.RuleSystem
  closureRule_cells_observed :
    forall rule, rule ∈ closureRules -> rule.cell ∈ predicationCells
  closureRules_settle_valuation :
    ClosureRule.SClosed closureRules siteCover.valuation
  recordEvents : List (StableEnterpriseRecord StableIdentity × ObservationEvent)
  causal_record_events : recordEvents.map Prod.fst = records
  causalSet : CausalSets.Causal.Order.CausalSet ObservationEvent
  causal_events_follow_records : causalSet.events = recordEvents.map Prod.snd
  causal_edges_follow_record_order :
    causalSet.prec0 = orderedCausalGraph (recordEvents.map Prod.snd)

namespace ObservationStateRevision4

def coverIncidence {StableIdentity ObservationEvent : Type}
    [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :
    Cohomology.IndexedCoverIncidence where
  datum := state.siteCover.cechDatum
  observedCells := state.predicationCells

def coverNerve {StableIdentity ObservationEvent : Type}
    [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :
    Cohomology.CoverNerve :=
  Cohomology.CoverNerve.ofIndexedCoverIncidence state.coverIncidence

def componentRepresentatives {StableIdentity ObservationEvent : Type}
    [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :=
  state.coverIncidence.componentRepresentatives

theorem events_nodup {StableIdentity ObservationEvent : Type}
    [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :
    (state.recordEvents.map Prod.snd).Nodup := by
  rw [<- state.causal_events_follow_records]
  exact state.causalSet.events_nodup

theorem recordCellOccursInCoverPatch
    {StableIdentity ObservationEvent : Type} [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent)
    {cell : PredicationCell} (hcell : cell ∈ state.predicationCells) :
    exists patch, patch ∈ state.siteCover.relativePatches ∧ patch cell = true :=
  state.siteCover.relativeSupportOccursInCoverPatch cell
    (state.recordCells_in_site_support cell hcell)

theorem derivedComponents_sound
    {StableIdentity ObservationEvent : Type} [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent)
    {left right : state.coverIncidence.Vertex}
    (hleft : left ∈ state.componentRepresentatives)
    (hright : right ∈ state.componentRepresentatives)
    (hne : left ≠ right) :
    ¬ Discrete.Graph.Reach state.coverIncidence.finiteIndexedCoverGraph.graph
      left right :=
  state.coverIncidence.finiteIndexedCoverGraph.derivedComponents_sound
    state.coverIncidence.exactPresentation hleft hright hne

theorem derivedComponents_complete
    {StableIdentity ObservationEvent : Type} [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :
    forall vertex, exists representative,
      representative ∈ state.componentRepresentatives ∧
      Discrete.Graph.Reach state.coverIncidence.finiteIndexedCoverGraph.graph
        vertex representative :=
  state.coverIncidence.finiteIndexedCoverGraph.derivedComponents_complete
    state.coverIncidence.exactPresentation

theorem derivedComponents_unique
    {StableIdentity ObservationEvent : Type} [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent)
    {vertex left right : state.coverIncidence.Vertex}
    (hleft : left ∈ state.componentRepresentatives)
    (hright : right ∈ state.componentRepresentatives)
    (hvl : Discrete.Graph.Reach
      state.coverIncidence.finiteIndexedCoverGraph.graph vertex left)
    (hvr : Discrete.Graph.Reach
      state.coverIncidence.finiteIndexedCoverGraph.graph vertex right) :
    left = right :=
  state.coverIncidence.finiteIndexedCoverGraph.derivedComponents_unique
    state.coverIncidence.exactPresentation hleft hright hvl hvr

theorem coverNerveOfIncidence
    {StableIdentity ObservationEvent : Type} [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :
    state.coverNerve =
      Cohomology.CoverNerve.ofIndexedCoverIncidence state.coverIncidence := rfl

theorem coverNerve_h1_from_incidence
    {StableIdentity ObservationEvent : Type} [DecidableEq ObservationEvent]
    (state : ObservationStateRevision4 StableIdentity ObservationEvent) :
    state.coverNerve.H1rank = state.coverIncidence.cycleRank :=
  Cohomology.coverNerve_h1_from_incidence state.coverIncidence

end ObservationStateRevision4

structure AdmittedInstrumentEvidence (StableIdentity : Type) where
  evidenceIdentity : StableIdentity
  admittedRecord : StableEnterpriseRecord StableIdentity
  authorityCell : PredicationCell
  admissionCell : PredicationCell
  evidenceIdentity_stable : evidenceIdentity = admittedRecord.stableIdentity
  authorityCell_carried : authorityCell ∈ admittedRecord.cells
  admissionCell_carried : admissionCell ∈ admittedRecord.cells

def AdmittedInstrumentRule
    {StableIdentity ObservationEvent Object Transition : Type}
    [DecidableEq ObservationEvent]
    (state : Object -> ObservationStateRevision4 StableIdentity ObservationEvent)
    (source target : Object) (transition : Transition)
    (authorityCell admissionCell : Transition -> PredicationCell)
    (evidence : AdmittedInstrumentEvidence StableIdentity) : Prop :=
  source ≠ target ∧
    evidence.admittedRecord ∈ (state source).records ∧
    evidence.authorityCell = authorityCell transition ∧
    evidence.admissionCell = admissionCell transition ∧
    evidence.authorityCell ∈ (state source).predicationCells ∧
    evidence.admissionCell ∈ (state target).predicationCells

structure EnterpriseObservationContractRevision4
    (EnterpriseRecord StableIdentity ObservationEvent : Type)
    [DecidableEq ObservationEvent]
    (sourceCategory targetCategory : Temporal.Category) where
  targetState : targetCategory.Obj ->
    ObservationStateRevision4 StableIdentity ObservationEvent
  targetObject : ObservationStateRevision4 StableIdentity ObservationEvent ->
    targetCategory.Obj
  targetState_targetObject : forall state, targetState (targetObject state) = state
  targetObject_targetState : forall object, targetObject (targetState object) = object
  stateRecords : sourceCategory.Obj -> List EnterpriseRecord
  recordEncoder : EnterpriseRecord -> EnterpriseRecordEncoding
  recordEncoder_injective : Function.Injective recordEncoder
  recordIdentity : EnterpriseRecord -> StableIdentity
  recordIdentities_nodup : forall state,
    ((stateRecords state).map recordIdentity).Nodup
  governedRecordUpdate : EnterpriseRecord -> EnterpriseRecord -> Prop
  recordIdentity_stable : forall {before after},
    governedRecordUpdate before after -> recordIdentity before = recordIdentity after
  recordWitness : EnterpriseRecord
  observationFunctor : CategoryFunctor sourceCategory targetCategory
  object_map_records : forall state,
    (targetState (observationFunctor.obj state)).records =
      (stateRecords state).map (fun record =>
        { stableIdentity := recordIdentity record
          encoding := recordEncoder record })
  observationOf_injective : Function.Injective
    (fun state => targetState (observationFunctor.obj state))
  sourceAuthorityCell : {source target : sourceCategory.Obj} ->
    sourceCategory.Hom source target -> PredicationCell
  sourceAdmissionCell : {source target : sourceCategory.Obj} ->
    sourceCategory.Hom source target -> PredicationCell
  targetAuthorityCell : {source target : targetCategory.Obj} ->
    targetCategory.Hom source target -> PredicationCell
  targetAdmissionCell : {source target : targetCategory.Obj} ->
    targetCategory.Hom source target -> PredicationCell
  sourceAuthorizationEvidence : {source target : sourceCategory.Obj} ->
    sourceCategory.Hom source target ->
      Option (AdmittedInstrumentEvidence StableIdentity)
  targetAuthorizationEvidence : {source target : targetCategory.Obj} ->
    targetCategory.Hom source target ->
      Option (AdmittedInstrumentEvidence StableIdentity)
  sourceAuthorizationEvidence_some_iff :
    forall {source target} (transition : sourceCategory.Hom source target) evidence,
      sourceAuthorizationEvidence transition = some evidence <->
        AdmittedInstrumentRule
          (fun object => targetState (observationFunctor.obj object))
          source target transition
          (fun current => sourceAuthorityCell current)
          (fun current => sourceAdmissionCell current) evidence
  sourceAuthorizationEvidence_none_iff :
    forall {source target} (transition : sourceCategory.Hom source target),
      sourceAuthorizationEvidence transition = none <->
        ¬ (exists evidence, AdmittedInstrumentRule
          (fun object => targetState (observationFunctor.obj object))
          source target transition
          (fun current => sourceAuthorityCell current)
          (fun current => sourceAdmissionCell current) evidence)
  targetAuthorizationEvidence_some_iff :
    forall {source target} (transition : targetCategory.Hom source target) evidence,
      targetAuthorizationEvidence transition = some evidence <->
        AdmittedInstrumentRule targetState source target transition
          (fun current => targetAuthorityCell current)
          (fun current => targetAdmissionCell current) evidence
  targetAuthorizationEvidence_none_iff :
    forall {source target} (transition : targetCategory.Hom source target),
      targetAuthorizationEvidence transition = none <->
        ¬ (exists evidence, AdmittedInstrumentRule targetState source target transition
          (fun current => targetAuthorityCell current)
          (fun current => targetAdmissionCell current) evidence)
  authorizationEvidence_preserved :
    forall {source target} (transition : sourceCategory.Hom source target),
      targetAuthorizationEvidence (observationFunctor.map transition) =
        sourceAuthorizationEvidence transition
  authorityCell_preserved :
    forall {source target} (transition : sourceCategory.Hom source target),
      targetAuthorityCell (observationFunctor.map transition) =
        sourceAuthorityCell transition
  admissionCell_preserved :
    forall {source target} (transition : sourceCategory.Hom source target),
      targetAdmissionCell (observationFunctor.map transition) =
        sourceAdmissionCell transition
  authorizedWitness : exists (source target : sourceCategory.Obj),
    source ≠ target ∧
      exists (transition : sourceCategory.Hom source target)
        (evidence : AdmittedInstrumentEvidence StableIdentity),
      sourceAuthorizationEvidence transition = some evidence
  unauthorizedWitness : exists (source target : sourceCategory.Obj),
    source ≠ target ∧ exists transition : sourceCategory.Hom source target,
      sourceAuthorizationEvidence transition = none
  map_id : forall source,
    observationFunctor.map (sourceCategory.id source) =
      targetCategory.id (observationFunctor.obj source)
  map_comp : forall {source middle target}
    (g : sourceCategory.Hom middle target)
    (f : sourceCategory.Hom source middle),
    observationFunctor.map (sourceCategory.comp g f) =
      targetCategory.comp (observationFunctor.map g) (observationFunctor.map f)

end EnterpriseAcceptance.Revision4
end Obsmetrologia

#print axioms Obsmetrologia.ValuatedSiteCover.relativeSupportOccursInCoverPatch
#print axioms Obsmetrologia.ValuatedSiteCover.totalizedCover
#print axioms Obsmetrologia.ValuatedSiteCover.cocycle
#print axioms Obsmetrologia.ValuatedSiteCover.glueCoboundary
#print axioms Obsmetrologia.ValuatedSiteCover.glueUnique
#print axioms Obsmetrologia.EnterpriseAcceptance.Revision4.ObservationStateRevision4.events_nodup
#print axioms Obsmetrologia.EnterpriseAcceptance.Revision4.ObservationStateRevision4.derivedComponents_sound
#print axioms Obsmetrologia.EnterpriseAcceptance.Revision4.ObservationStateRevision4.derivedComponents_complete
#print axioms Obsmetrologia.EnterpriseAcceptance.Revision4.ObservationStateRevision4.derivedComponents_unique
#print axioms Obsmetrologia.EnterpriseAcceptance.Revision4.ObservationStateRevision4.coverNerve_h1_from_incidence
