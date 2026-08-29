import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Predicating.Cell
import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Predicating.Syntax

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for predication as the first oriented claim point.
-/

#doc (Manual) "Predication as position" =>

# Predication As Position

Predication is the first place where the book may speak about a point for a
claim. The older phrase "claim-site" is useful only if it is read carefully:
predication generates the point, not yet the settling-site object over that
point.

The claim-site carried here is:

* claim point: predication cell;
* phase: language;
* generating sites: utterance, articulation cell, potential corner;
* Lean carriers: `Obsmetrologia.Language.Predicating.Cell` and
  `Obsmetrologia.Language.Predicating.Claim`;
* familiar comparison: category-theoretic orientation and morphism generators;
* danger: treating a predication as already true, false, supported, or settled.

The governing sentence is:

> Predication creates an oriented site for value; it does not yet give that site
> a value.

## Before Predication

Before predication, there are marks, utterances, and articulation cells. An
utterance has a token side and a claim side, but that is still not the same as
an oriented subject-predicate-object position. The utterance has not yet become
a cell at which value can live.

The potential articulation cell is the source of predicating. Predicating moves
out of that potential corner and produces the first oriented claim point.

## The Cell

In Lean, the object is {name Obsmetrologia.PredicationCell}`PredicationCell`. It has
three coordinates: subject, predicate, and object. Those names are lawful here
because predicating is exactly the phase that generates them.

The seed predication is:

{docstring Obsmetrologia.PredicationCell.seed}

Checked:

```lean
example (u : Utterance) :
    PredicationCell.seed u
      = ⟨u.token, u.claim, u.token⟩ :=
  rfl
```

This tells the reader the first important thing: a seed predication is reflexive.
It begins at `(token, claim, token)`, not because every relation is reflexive
forever, but because the utterance boundary gives one token-side mark and one
claim-side mark before any later object has been generated.

## The Claim Point

The formal name for the point generated here is {name Obsmetrologia.Claim}`Claim`.
It is deliberately placed under predicating: a claim point exists as soon as
there is a predication cell. It is not yet a site object, cover, or descent datum.

Checked:

```lean
example (u : Utterance) :
    (Claim.seed u).predicate = u.claim :=
  Claim.seed_predicate u

example (c : Articulating.PotentialCell) :
    Claim.ofPotential c = Claim.seed c.utterance :=
  Claim.ofPotential_eq_seed c
```

## Orientation Is Real

The converse operation swaps subject and object:

{docstring Obsmetrologia.PredicationCell.converse}

The seed is its own converse:

{docstring Obsmetrologia.PredicationCell.converse_seed}

Checked:

```lean
example (u : Utterance) :
    PredicationCell.converse (PredicationCell.seed u)
      = PredicationCell.seed u :=
  PredicationCell.converse_seed u
```

But a non-reflexive predication does not collapse into its converse. Lean records
that orientation is real:

{docstring Obsmetrologia.PredicationCell.converse_ne}

This is where a categorical projection begins to be visible. There are oriented
positions and transformations of those positions. But category theory is not the
language from which the phase starts. It is what this phase begins to make
available.

## The Four Local Moves

Predicating carries four local movement classes:

* converse: reverse orientation;
* subject projection: collapse the object coordinate onto the subject;
* object projection: collapse the subject coordinate onto the object;
* specialization: refine the predicate coordinate.

The projection operations are idempotent:

{docstring Obsmetrologia.PredicationCell.subjProj_idem}

The matching object-projection theorem is
{name Obsmetrologia.PredicationCell.objProj_idem}`objProj_idem`.

and specialization composes:

{docstring Obsmetrologia.PredicationCell.specialize_comp}

Checked:

```lean
example
    (f g : Predicate -> Predicate)
    (phi : PredicationCell) :
    PredicationCell.specialize f
        (PredicationCell.specialize g phi)
      = PredicationCell.specialize (f ∘ g) phi :=
  PredicationCell.specialize_comp f g phi
```

That is the category-like projection: identity and composition have become visible
inside the predication phase. The reader should not reverse the dependency. We
do not begin with category and then encode predication. Predication generates
the oriented positions whose transformations can be read categorically.

## Predicate Operator Syntax

The archive called `semiotic-universe` had one piece that can graduate without
bringing its old Mathlib ambient with it: the intrinsically typed operator syntax.
It now lives in the active predication phase, where the base type is the generated
predicate position rather than an imported semantic universe.

{docstring Obsmetrologia.PredicationSyntax.Ty}

{docstring Obsmetrologia.PredicationSyntax.Term}

The raw operator carrier is:

{docstring Obsmetrologia.PredicationSyntax.RawOp}

Checked:

```lean
example :
    Obsmetrologia.PredicationSyntax.RawOp 1
      = Obsmetrologia.PredicationSyntax.Term []
        ((Obsmetrologia.PredicationSyntax.Ty.pred
            ⊗ₚ Obsmetrologia.PredicationSyntax.Ty.pred)
          ⇒ₚ Obsmetrologia.PredicationSyntax.Ty.pred) :=
  Obsmetrologia.PredicationSyntax.rawOp_one
```

The stronger archive language about Heyting domains, trace comonads, and fusion
reflection is not repeated here as if it were proved. Its honest place is the
frontier: interpret this syntax into the active valuation and settling carriers,
then prove that the admissible behaviors named by the syntax are exactly the
behaviors already generated by closure.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Primitive.Mark` for marks and positional kinds.
2. Read `Obsmetrologia.Articulation.Articulating.Utterance` for token/claim order.
3. Read `Obsmetrologia.Articulation.Articulating.Cell` for the potential corner.
4. Read `Obsmetrologia.Language.Predicating.Cell` for the oriented triple.
5. Read `Obsmetrologia.Language.Predicating.Claim` for the generated claim point.
6. Read `Obsmetrologia.Language.Predicating.Syntax` for the generated operator
   grammar over predicates.
7. Only then read value, valuation, fibration, hyperdoctrine, or equality.

The next language-phase chapter is positing: how these oriented sites receive
standing without collapsing into Boolean truth.
