import InfomaterialManual.DocSetup
import Infomaterial.Language.Predicating.Cell
import Infomaterial.Language.Positing.Valuation
import Infomaterial.Closure.Regime
import Infomaterial.Site.Basic
import Infomaterial.Persistence.Aperiodic.Classification

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Site
open Infomaterial.Persistence.Aperiodic

/-!
A prolegomenon chapter for proof-tree and Blueprint carriers.
-/

#doc (Manual) "Proof and Blueprint carriers" =>

# Proof And Blueprint Carriers

The manual has three non-Lean evidence surfaces near the formal library:
Verso pages, the proof-tree markdown under `docs/verso/mark`, and Blueprint
nodes under `docs/blueprint/src`. They are useful only when the reader knows
what kind of carrier each one is.

The claim-site carried here is:

* claim-site: proof-tree and Blueprint carriers as lawful evidence surfaces;
* phase: prolegomena, before phase pages start using proof and graph nodes;
* generating sites: mark, kind, utterance, predication cell, closure regime,
  site cover, and aperiodic classifying invariant;
* downstream uses: every Page Law entry that mentions proof-tree or Blueprint
  nodes, every frontier claim, and every migrated older Part page;
* Lean carriers: `Infomaterial.Mark`, `Infomaterial.Kind.two_kinds`,
  `Infomaterial.PredicationCell.seed`, `Infomaterial.Site.covers_self`,
  `Infomaterial.Persistence.Aperiodic.clinv_dichotomy`;
* Blueprint/proof-tree nodes: `def:mark`, `lem:two-kinds`,
  `thm:bitopological-site-grothendieck`, `thm:clinv-dichotomy`,
  `thm:mld-refines-cohequiv`, and the not-ready
  `thm:aperiodic-mld-classification`;
* provenance: `docs/verso/mark/mark.md`, `docs/blueprint/lean_decls`, and
  Blueprint chapter files;
* familiar comparison: proof graph, dependency graph, concept map, bibliography;
* reader closure: distinguish settlement, incidence, provenance, and frontier;
* frontier status: there is no automatic checker that the Page Law bullets
  match Blueprint labels or proof-tree markdown routes.

The governing sentence is:

> A graph node is incidence; a markdown node is provenance; a Lean declaration
> is settlement; a Verso page is the teaching surface that must glue them.

## Proof Tree Is Primitive Provenance

The mark proof tree is the primitive-floor body. Its root markdown is
`docs/verso/mark/mark.md`; its child routes include token, claim, and utterance.
It explains why a mark is non-assembling and why token and claim are the two
ways marks are carried.

That makes it provenance for the Genesis phase. It does not by itself prove the
Lean primitive. The settlement carrier is still the declaration:

{docstring Infomaterial.Mark}

and the first checked law is the two-kind split:

{docstring Infomaterial.Kind.two_kinds}

Checked:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example : Kind.token = Kind.claim -> False :=
  Kind.token_ne_claim
```

The proof-tree route is therefore lawful evidence for why the reader should
care about the primitive floor. It is not permission to add structure below the
mark.

## Blueprint Is Incidence

Blueprint files say which graph node names which Lean declaration. For example,
`docs/blueprint/src/chapters/primitives/01-marks-and-kinds.tex` carries:

* `def:mark` with `Infomaterial.Mark`;
* `lem:two-kinds` with `Infomaterial.Kind.two_kinds`;
* `lem:token-ne-claim` with `Infomaterial.Kind.token_ne_claim`.

When the Blueprint node is marked `leanok`, it says the graph incidence reaches
a Lean declaration. It does not replace a checked example in Verso, and it does
not teach the phase law by itself.

The predication seed shows the pattern. Blueprint can carry the incidence, but
Lean carries the settlement:

{docstring Infomaterial.PredicationCell.seed}

Checked:

```lean
example (u : Utterance) :
    PredicationCell.seed u =
      ⟨u.token, u.claim, u.token⟩ :=
  rfl
```

The Verso page glues the two: it tells the reader why this declaration belongs
to the language phase and what downstream pages may now use.

## Green Nodes And Red Nodes

Blueprint uses different proof statuses. The manual must preserve that
difference.

The sheaf-site chapter contains green nodes such as
`thm:bitopological-site-grothendieck`, which points to:

{docstring Infomaterial.Site.bitopological_site_grothendieck}

The local identity cover is checked here as the smallest readable witness:

```lean
example (U : Clopen) :
    Covers U [U] :=
  covers_self U
```

The aperiodic classification chapter also has green nodes:
`thm:clinv-dichotomy` and `thm:mld-refines-cohequiv`.

{docstring Infomaterial.Persistence.Aperiodic.clinv_dichotomy}

Checked:

```lean
example :
    ∃ v : Settling,
      v.regime = ClosureRegime.aperiodic
        ∧ v.clInv ≠ H1Class.zero :=
  clinv_dichotomy.2
```

But the Blueprint node `thm:aperiodic-mld-classification` is marked not ready.
It names a frontier converse. A stable page may cite that node only as frontier,
not as a theorem.

## Drift

Drift happens when the carriers disagree:

* Blueprint says `leanok`, but no Lean declaration exists;
* Lean has a declaration, but Verso teaches no phase route;
* proof-tree markdown explains a primitive, but the page treats it as theorem;
* Verso uses a familiar comparison stronger than the Lean carrier;
* a red Blueprint node is cited as if it were green.

The repair is not to delete the weak carrier. The repair is to state its role:
provenance, incidence, settlement, teaching surface, or frontier.

## Migration Test

Older Part material may be migrated only when it can answer:

1. Which phase makes the words lawful?
2. Which Lean declaration carries the settled claim?
3. Which Blueprint label records incidence, if any?
4. Which proof-tree markdown route supplies provenance, if any?
5. Which statement remains frontier?

If those answers cannot be supplied, the material stays a note or frontier
trace. It is not promoted into the phase books.
