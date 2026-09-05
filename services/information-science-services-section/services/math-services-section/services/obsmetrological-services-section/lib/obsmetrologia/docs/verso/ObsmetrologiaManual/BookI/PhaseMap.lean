import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Articulation.Articulating.FourCorner
import Obsmetrologia.Language.Predicating.Cell
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Closure.Regime
import Obsmetrologia.Site.Basic

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Site

/-!
A prolegomenon chapter mapping the generated phases before the reader enters them.
-/

#doc (Manual) "Phase map" =>

# Phase Map

The phase map is not a table of contents. It is a dependency spine. Its job is to
tell the reader what becomes lawful at each level and what must still be refused.

The claim-site carried here is:

* claim-site: the generated phase spine of Obsmetrologia;
* phase: prolegomena;
* generating sites: the critical vocabulary page, mark, utterance,
  predication cell, valuation, closure regime, and fixed-fiber cover;
* downstream uses: every Book I-XI placement decision;
* Lean carriers: `Obsmetrologia.Mark`, `Obsmetrologia.PredicationCell`,
  `Obsmetrologia.Valuation`, `Obsmetrologia.ClosureRegime`,
  `Obsmetrologia.Site.Covers`;
* Blueprint/proof-tree nodes: the proof-tree gives the primitive floor; later
  Blueprint nodes attach after their phase has a carrier;
* provenance: the root manual's phase organization;
* familiar comparison: ontology chart, dependency diagram, curriculum map;
* reader closure: read each book heading as a lawfulness boundary;
* frontier status: this is a manual phase map. A first-class Lean `Phase` record
  remains future infrastructure.

The governing sentence is:

> A phase is the least context in which a word can be used as mathematics.

## Genesis: Admission

Genesis admits marks and the articulating recursion. It does not admit objects,
sets, truth, equality, topology, or physics as mathematical premises.

Checked:

```lean
example (k : Kind) : k = Kind.token \/ k = Kind.claim :=
  Kind.two_kinds k

example (u : Utterance) :
    (Articulating.utter u).floor = u :=
  Articulating.floor_utter u
```

If a later page cannot descend to this admission boundary without importing
extra data, it is not an Obsmetrologia page yet.

## Language: Position And Value

The language phase generates oriented predication sites and then values over
those sites. This is where subject, predicate, object, charge, valuation, truth
order, and knowledge order become lawful.

Checked:

```lean
example (u : Utterance) :
    PredicationCell.seed u =
      ⟨u.token, u.claim, u.token⟩ :=
  rfl

example : Valuation = (Claim -> Charge) :=
  Valuation.isClaimCharge
```

Category, logic, equality, quantification, and hyperdoctrine language are
projections here. They are not starting assumptions.

## Closure: Settling

The closure phase asks what happens when valued content is allowed to settle.
Order, fixed point, closure operator, ordinal, Scott-continuity, and regime are
lawful here.

Checked:

```lean
example :
    classify spineData = ClosureRegime.strict :=
  spine_is_strict
```

The phase rule is that convergence language must name its regime. If the regime
is not known, the claim is not settled.

## Recurrence: Transported FOUR

The recurring FOUR is not a numerological motif. It is the repeated transport of
the first two-by-two coherence cell into later carriers.

Checked:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four

example (u : Utterance) :
    Articulating.FourCorner.toCorner
        (Articulating.Cell.initial u).fourCorner =
      Charge.kBot :=
  absurd_is_kBot u
```

This phase authorizes comparison across four-corner carriers only where a
transport theorem or construction exists.

## Gluing: Local To Global

After closure, the question is whether local settled data glues. Sites, covers,
sections, sheaves, cohomology, defects, and descent become lawful here.

Checked:

```lean
example (U : Clopen) :
    Covers U [U] :=
  covers_self U

example (U U' : Clopen) :
    Covers U [U'] <-> U' = U :=
  covers_singleton_iff U U'
```

The gluing phase is where the manual stops accepting single-carrier confidence.
A claim may have local witnesses and still fail to descend.

## Persistence: Non-Scott Matter

Persistence appears when closure does not remain strict or Scott-comfortable.
Aperiodic tilings, substitution systems, inverse hulls, co-classifying
invariants, material jamming, and long-lived obstruction are lawful here, but
only as consequences of the prior closure and gluing phases.

The ordinary comparisons are symbolic dynamics, topology, materials, and
quasicrystals. The Obsmetrologia claim is about persistent relational matter.

## Spacetime: Causal Settling

Spacetime is not the arena. It is a phase domain generated when causal relation
is read as a settling problem. Intervals, cones, incidence, operators,
curvature, action, dimension, and horizon language are lawful only after causal
order has been generated.

The ordinary comparison is Lorentzian geometry. The carrier is finite relational
spacetime unless a continuum reconstruction theorem has been built.

## Physical Phases: Witnesses

Physical pages are tests of generated machinery. Kinetics, fluid, plasma,
reaction, quantum, dense matter, keratin, hole, and black-hole reading
vocabulary are admitted only when they witness closure, gluing, obstruction,
persistence, or causal settling.

The phase rule is severe: physics names do not promote themselves. They must
name the carrier that makes them lawful.

## Atlas And Frontier

The atlas records projections after their generating phase is known. The frontier
records visible generating paths whose carrier is missing, too weak, or not yet
glued.

The repair question for any page is therefore:

> Which phase first makes this sentence mathematical?

If the page cannot answer, it belongs upstream as vocabulary work or downstream
as frontier work, but not as a stable phase page.
