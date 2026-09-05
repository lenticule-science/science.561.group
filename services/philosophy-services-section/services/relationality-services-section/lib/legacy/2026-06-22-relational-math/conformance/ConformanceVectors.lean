import RelMath.Four
import RelMath.CurryHowardLambekQuartet

namespace RelMath.Conformance

open RelMath

def charges : List Charge :=
  [Charge.kBot, Charge.tTop, Charge.tBot, Charge.kTop]

def tsName (c : Charge) : String :=
  match c.pos, c.neg with
  | false, false => "absurd"
  | true, false => "potential"
  | false, true => "active"
  | true, true => "stable"

def boolJson (b : Bool) : String :=
  if b then "true" else "false"

def quoted (s : String) : String :=
  "\"" ++ s ++ "\""

def chargeJson (c : Charge) : String :=
  "{\"$id\":\"relating/articulating/predicating/positing/bilattice-charge/value\",\"name\":"
    ++ quoted (tsName c)
    ++ ",\"coordinates\":{\"positive\":"
    ++ boolJson c.pos
    ++ ",\"negative\":"
    ++ boolJson c.neg
    ++ "}}"

def unaryInputJson (a : Charge) : String :=
  "{\"charge\":" ++ chargeJson a ++ "}"

def binaryInputJson (a b : Charge) : String :=
  "{\"left\":" ++ chargeJson a ++ ",\"right\":" ++ chargeJson b ++ "}"

def row (id input output : String) : String :=
  "{\"$schema\":\"relating/conformance/golden-vector\",\"e\":\"lean/RelMath/conformance/ConformanceVectors.lean\",\"a\":"
    ++ quoted id
    ++ ",\"v\":{\"operation\":{\"$id\":"
    ++ quoted id
    ++ "},\"input\":"
    ++ input
    ++ ",\"output\":"
    ++ output
    ++ "},\"t\":\"2026-06-22T00:00:00.000Z\"}"

def unaryRows (id : String) (f : Charge → Charge) : List String :=
  charges.map fun a => row id (unaryInputJson a) (chargeJson (f a))

def concatMap {α β : Type} (xs : List α) (f : α → List β) : List β :=
  match xs with
  | [] => []
  | x :: rest => f x ++ concatMap rest f

def binaryRows (id : String) (f : Charge → Charge → Charge) : List String :=
  concatMap charges fun a =>
    charges.map fun b => row id (binaryInputJson a b) (chargeJson (f a b))

def binaryBoolRows (id : String) (f : Charge → Charge → Bool) : List String :=
  concatMap charges fun a =>
    charges.map fun b => row id (binaryInputJson a b) (boolJson (f a b))

def fourRows : List String :=
  binaryRows "relating/articulating/predicating/positing/bilattice-charge/joinKnowledgeValue" Charge.joinK
  ++ binaryRows "relating/articulating/predicating/positing/bilattice-charge/meetKnowledgeValue" Charge.meetK
  ++ binaryRows "relating/articulating/predicating/positing/bilattice-charge/joinTruthValue" Charge.joinT
  ++ binaryRows "relating/articulating/predicating/positing/bilattice-charge/meetTruthValue" Charge.meetT
  ++ unaryRows "relating/articulating/predicating/positing/bilattice-charge/negateValue" Charge.negate
  ++ unaryRows "relating/articulating/predicating/positing/bilattice-charge/conflateValue" Charge.conflate
  ++ unaryRows "relating/articulating/predicating/positing/bilattice-charge/doubleValue" Charge.negConf
  ++ binaryBoolRows "relating/articulating/predicating/positing/bilattice-charge/leqKnowledge" Charge.leK
  ++ binaryBoolRows "relating/articulating/predicating/positing/bilattice-charge/leqTruth" Charge.leT

open CHL

def tyJson : Ty -> String
  | Ty.base => "[\"base\"]"
  | Ty.arrow a b => "[\"arrow\"," ++ tyJson a ++ "," ++ tyJson b ++ "]"
  | Ty.prod a b => "[\"prod\"," ++ tyJson a ++ "," ++ tyJson b ++ "]"
  | Ty.unit => "[\"unit\"]"

def tmJson : Tm -> String
  | Tm.var n => "[\"var\"," ++ toString n ++ "]"
  | Tm.lam t => "[\"lam\"," ++ tmJson t ++ "]"
  | Tm.app t u => "[\"app\"," ++ tmJson t ++ "," ++ tmJson u ++ "]"
  | Tm.pair t u => "[\"pair\"," ++ tmJson t ++ "," ++ tmJson u ++ "]"
  | Tm.fst t => "[\"fst\"," ++ tmJson t ++ "]"
  | Tm.snd t => "[\"snd\"," ++ tmJson t ++ "]"
  | Tm.star => "[\"star\"]"

partial def normalFuel : Nat -> Tm -> Tm
  | 0, t => t
  | n + 1, t =>
      let u := dev t
      if u = t then u else normalFuel n u

def normal (t : Tm) : Tm :=
  normalFuel 1000 t

def calculusOperationId : String :=
  "relating/term/chl/eval"

def calculusInputJson (name : String) (t : Tm) : String :=
  "{\"sample\":" ++ quoted name ++ ",\"term\":" ++ tmJson t ++ "}"

def calculusOutputJson (t : Tm) : String :=
  "{\"dev\":" ++ tmJson (dev t) ++ ",\"normal\":" ++ tmJson (normal t) ++ "}"

def calculusRow (name : String) (t : Tm) : String :=
  row calculusOperationId (calculusInputJson name t) (calculusOutputJson t)

def calculusSamples : List (String × Tm) :=
  [ ("beta-id-star", Tm.app (Tm.lam (Tm.var 0)) Tm.star)
  , ("beta-under-lam", Tm.app (Tm.lam (Tm.lam (Tm.app (Tm.var 1) (Tm.var 0)))) Tm.star)
  , ("fst-pair", Tm.fst (Tm.pair (Tm.app (Tm.lam (Tm.var 0)) Tm.star) (Tm.var 0)))
  , ("snd-pair", Tm.snd (Tm.pair (Tm.var 0) (Tm.app (Tm.lam (Tm.var 0)) Tm.star)))
  , ("nested-projection-beta",
      Tm.app
        (Tm.lam (Tm.fst (Tm.pair (Tm.var 0) Tm.star)))
        (Tm.snd (Tm.pair Tm.star (Tm.pair Tm.star Tm.star))))
  , ("congruent-pair",
      Tm.pair
        (Tm.app (Tm.lam (Tm.var 0)) Tm.star)
        (Tm.fst (Tm.pair (Tm.app (Tm.lam Tm.star) (Tm.var 0)) Tm.star)))
  ]

def calculusRows : List String :=
  calculusSamples.map fun sample => calculusRow sample.fst sample.snd

def domainOperationId : String :=
  "relating/term/domain/eval"

def domainInputJson (name term : String) : String :=
  "{\"sample\":" ++ quoted name ++ ",\"term\":" ++ term ++ "}"

def domainOutputJson (term : String) : String :=
  "{\"dev\":" ++ term ++ ",\"normal\":" ++ term ++ "}"

def domainRow (name term output : String) : String :=
  row domainOperationId (domainInputJson name term) (domainOutputJson output)

def markTermJson (m : Mark) : String :=
  "[\"mark\"," ++ quoted m.surface ++ "]"

def chargeTermJson (c : Charge) : String :=
  "[\"charge\"," ++ quoted (tsName c) ++ "]"

def boolTermJson (b : Bool) : String :=
  "[\"bool\"," ++ boolJson b ++ "]"

def generatorName : Generator -> String
  | Generator.specialization => "specialization"
  | Generator.converse => "converse"
  | Generator.subjectProjection => "subjectProjection"
  | Generator.objectProjection => "objectProjection"

def generatorTermJson (g : Generator) : String :=
  "[\"generator\"," ++ quoted (generatorName g) ++ "]"

def unaryTermJson (op : String) (a : Charge) : String :=
  "[" ++ quoted op ++ "," ++ chargeTermJson a ++ "]"

def binaryTermJson (op : String) (a b : Charge) : String :=
  "[" ++ quoted op ++ "," ++ chargeTermJson a ++ "," ++ chargeTermJson b ++ "]"

def domainUnaryRows (op : String) (f : Charge -> Charge) : List String :=
  charges.map fun a => domainRow (op ++ "-" ++ tsName a) (unaryTermJson op a) (chargeTermJson (f a))

def domainBinaryRows (op : String) (f : Charge -> Charge -> Charge) : List String :=
  concatMap charges fun a =>
    charges.map fun b =>
      domainRow (op ++ "-" ++ tsName a ++ "-" ++ tsName b) (binaryTermJson op a b) (chargeTermJson (f a b))

def domainOrderRows (op : String) (f : Charge -> Charge -> Bool) : List String :=
  concatMap charges fun a =>
    charges.map fun b =>
      domainRow (op ++ "-" ++ tsName a ++ "-" ++ tsName b) (binaryTermJson op a b) (boolTermJson (f a b))

def domainSettleRows : List String :=
  concatMap charges fun target =>
    charges.map fun seed =>
      domainRow
        ("settle-" ++ tsName target ++ "-" ++ tsName seed)
        (binaryTermJson "settle" target seed)
        (chargeTermJson (Charge.settle (Charge.joinClosure target) seed))

def domainRows : List String :=
  (charges.map fun c => domainRow ("charge-" ++ tsName c) (chargeTermJson c) (chargeTermJson c))
  ++ [domainRow "mark-atom" (markTermJson { surface := "atom" }) (markTermJson { surface := "atom" })]
  ++ (Generator.all.map fun g => domainRow ("generator-" ++ generatorName g) (generatorTermJson g) (generatorTermJson g))
  ++ domainUnaryRows "negate" Charge.negate
  ++ domainUnaryRows "conflate" Charge.conflate
  ++ domainUnaryRows "negConf" Charge.negConf
  ++ domainBinaryRows "joinK" Charge.joinK
  ++ domainBinaryRows "meetK" Charge.meetK
  ++ domainBinaryRows "joinT" Charge.joinT
  ++ domainBinaryRows "meetT" Charge.meetT
  ++ domainOrderRows "leK" Charge.leK
  ++ domainOrderRows "leT" Charge.leT
  ++ domainSettleRows

def rows : List String :=
  fourRows ++ calculusRows ++ domainRows

end RelMath.Conformance

def main : IO Unit :=
  RelMath.Conformance.rows.forM IO.println
