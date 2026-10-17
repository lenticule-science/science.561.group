import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Primitive reference" =>

# Reference: Admission Boundary

## Topic

Namespace/topic: `Infomaterial` primitive spine.

Blueprint topic: `ch:primitives`.

## Concept Modules

* `Infomaterial.Mark`: atomic marks and their two positional kinds.
* `Infomaterial.Utterance`: ordered token/claim carrier.
* `Infomaterial.Articulating`: recursive base morphism and finite floor.

## Terms

* `Infomaterial.Mark`: atomic primitive carrier.
* `Infomaterial.Kind`: positional split into `token` and `claim`.
* `Infomaterial.Kind.two_kinds`: exhaustiveness of the two kinds.
* `Infomaterial.Kind.token_ne_claim`: distinctness of token and claim.
* `Infomaterial.Utterance`: ordered token/claim pair.
* `Infomaterial.Utterance.at_`: positional projection.
* `Infomaterial.Articulating`: recursive base morphism.
* `Infomaterial.Articulating.head`: head utterance projection.
* `Infomaterial.Articulating.depth`: finite recursion depth.
* `Infomaterial.Articulating.floor`: innermost utterance.
* `Infomaterial.Articulating.utter_ne_pair`: shape distinction between floor and
  recursive pair.
