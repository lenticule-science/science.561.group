import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Primitive reference" =>

# Reference: Admission Boundary

## Topic

Namespace/topic: `Obsmetrologia` primitive spine.

Blueprint topic: `ch:primitives`.

## Concept Modules

* `Obsmetrologia.Mark`: atomic marks and their two positional kinds.
* `Obsmetrologia.Utterance`: ordered token/claim carrier.
* `Obsmetrologia.Articulating`: recursive base morphism and finite floor.

## Terms

* `Obsmetrologia.Mark`: atomic primitive carrier.
* `Obsmetrologia.Kind`: positional split into `token` and `claim`.
* `Obsmetrologia.Kind.two_kinds`: exhaustiveness of the two kinds.
* `Obsmetrologia.Kind.token_ne_claim`: distinctness of token and claim.
* `Obsmetrologia.Utterance`: ordered token/claim pair.
* `Obsmetrologia.Utterance.at_`: positional projection.
* `Obsmetrologia.Articulating`: recursive base morphism.
* `Obsmetrologia.Articulating.head`: head utterance projection.
* `Obsmetrologia.Articulating.depth`: finite recursion depth.
* `Obsmetrologia.Articulating.floor`: innermost utterance.
* `Obsmetrologia.Articulating.utter_ne_pair`: shape distinction between floor and
  recursive pair.
