import Obsmetrologia.Language.Predicating.Cell
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Site.Claim
import Obsmetrologia.Closure.RuleSystem
import Obsmetrologia.CausalSets.Causal.Order
import Obsmetrologia.Cohomology.CoordinationCohomology

/-!
# Enterprise observation acceptance contract

This script states the first enterprise-observation tranche as an abstract
interface. It defines no enterprise record encoding, category instance, functor
instance, or production observation module.

The Obsmetrologia Lean MCP handshake was unavailable in the authoring session.
The carrier declarations were therefore read from their exact source modules,
and this file is checked with the package-local Lake environment.

Later contracts must state restriction and Cech gluing preservation, causal
acyclicity and reachability preservation, valuation monotonicity and closure-rule
settlement, CoverNerve H1 and Landauer preservation, and the value-level converse.
-/

universe uObject uHom uTargetObject uTargetHom

namespace CategoryTheory

/-- A category over an explicit object type and indexed morphism family. -/
structure Category
    (Object : Type uObject)
    (Hom : Object → Object → Type uHom) where
  id : (object : Object) → Hom object object
  comp : {source middle target : Object} →
    Hom source middle → Hom middle target → Hom source target
  id_comp : {source target : Object} → (f : Hom source target) →
    comp (id source) f = f
  comp_id : {source target : Object} → (f : Hom source target) →
    comp f (id target) = f
  assoc : {a b c d : Object} →
    (f : Hom a b) → (g : Hom b c) → (h : Hom c d) →
    comp (comp f g) h = comp f (comp g h)

/-- A functor between two explicit categories, including its identity and
composition laws at the indexed morphism types. -/
structure Functor
    (SourceObject : Type uObject)
    (SourceHom : SourceObject → SourceObject → Type uHom)
    (TargetObject : Type uTargetObject)
    (TargetHom : TargetObject → TargetObject → Type uTargetHom)
    (sourceCategory : Category SourceObject SourceHom)
    (targetCategory : Category TargetObject TargetHom) where
  obj : SourceObject → TargetObject
  map : {source target : SourceObject} →
    SourceHom source target → TargetHom (obj source) (obj target)
  map_id : (source : SourceObject) →
    map (sourceCategory.id source) = targetCategory.id (obj source)
  map_comp : {source middle target : SourceObject} →
    (f : SourceHom source middle) → (g : SourceHom middle target) →
    map (sourceCategory.comp f g) =
      targetCategory.comp (map f) (map g)

end CategoryTheory

namespace Obsmetrologia.EnterpriseAcceptance

universe uRecord uState uTransition uObservationTransition

/-- A normalized enterprise record represented by at least one predication
cell. The distinguished identity cell prevents an empty encoding carrier. -/
structure EnterpriseRecordEncoding where
  identityCell : PredicationCell
  assertionCells : List PredicationCell

namespace EnterpriseRecordEncoding

/-- All predication cells carried by one normalized record. -/
def cells (encoding : EnterpriseRecordEncoding) : List PredicationCell :=
  encoding.identityCell :: encoding.assertionCells

end EnterpriseRecordEncoding

/-- The exact product carrier required for an observed enterprise state. The
event type remains explicit because `CausalSet` is indexed by it. -/
structure ObservationState (ObservationEvent : Type) where
  predicationCells : List PredicationCell
  valuation : Valuation
  sitePoints : List Claim.SitePoint
  closureRules : ClosureRule.RuleSystem
  causalSet : CausalSets.Causal.Order.CausalSet ObservationEvent
  cechDatum : Cohomology.Cech1
  coverNerve : Cohomology.CoverNerve

/-- The semantic obligations for the first enterprise-observation tranche.
The indexed transition families expose every source and target endpoint. -/
structure EnterpriseObservationContract
    (EnterpriseRecord : Type uRecord)
    (EnterpriseState : Type uState)
    (EnterpriseTransition : EnterpriseState → EnterpriseState → Type uTransition)
    (ObservationEvent : Type)
    (ObservationTransition :
      ObservationState ObservationEvent →
      ObservationState ObservationEvent →
      Type uObservationTransition)
    (sourceCategory :
      CategoryTheory.Category EnterpriseState EnterpriseTransition)
    (targetCategory :
      CategoryTheory.Category
        (ObservationState ObservationEvent)
        ObservationTransition) where
  /-- The finite enterprise records present in each source state. -/
  stateRecords : EnterpriseState → List EnterpriseRecord
  /-- A lossless normalization into an exact predication-cell carrier. -/
  recordEncoder : EnterpriseRecord → EnterpriseRecordEncoding
  /-- Distinct enterprise records have distinct normalized encodings. -/
  recordEncoder_injective : Function.Injective recordEncoder
  /-- The categorical observation mapping. -/
  observationFunctor :
    CategoryTheory.Functor
      EnterpriseState
      EnterpriseTransition
      (ObservationState ObservationEvent)
      ObservationTransition
      sourceCategory
      targetCategory
  /-- The functor's object map contains exactly the cells obtained by encoding
  the records in the source state, in source order. -/
  object_map_encodes_records : (state : EnterpriseState) →
    (observationFunctor.obj state).predicationCells =
      (stateRecords state).flatMap
        (fun record => (recordEncoder record).cells)
  /-- Source authorization for an indexed enterprise transition. -/
  sourceAuthorization : {source target : EnterpriseState} →
    EnterpriseTransition source target → Prop
  /-- Target authorization for an indexed observed transition. -/
  targetAuthorization :
    {source target : ObservationState ObservationEvent} →
    ObservationTransition source target → Prop
  /-- Identity preservation at the exact source and target morphism types. -/
  map_id : (source : EnterpriseState) →
    observationFunctor.map (sourceCategory.id source) =
      targetCategory.id (observationFunctor.obj source)
  /-- Composition preservation at the exact source and target morphism types. -/
  map_comp : {source middle target : EnterpriseState} →
    (f : EnterpriseTransition source middle) →
    (g : EnterpriseTransition middle target) →
    observationFunctor.map (sourceCategory.comp f g) =
      targetCategory.comp
        (observationFunctor.map f)
        (observationFunctor.map g)
  /-- A source transition is authorized exactly when its observed image
  satisfies the named target authorization predicate. -/
  reflects_authorization : {source target : EnterpriseState} →
    (transition : EnterpriseTransition source target) →
    sourceAuthorization transition ↔
      targetAuthorization (observationFunctor.map transition)

end Obsmetrologia.EnterpriseAcceptance
