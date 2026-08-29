import InfomaterialManual.DocSetup
import Infomaterial.Language.Predicating.Cell

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A teaching chapter for predication as the first oriented claim-site.
-/

#doc (Manual) "Predication as position" =>

# Predication As Position

Predication is the first place where the book may speak about a position for a
claim.

The claim-site carried here is:

* claim-site: predication cell;
* phase: language;
* generating sites: utterance, articulation cell, potential corner;
* Lean carrier: `Infomaterial.Language.Predicating.Cell`;
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
out of that potential corner and produces the first oriented claim-site.

## The Cell

In Lean, the object is {name Infomaterial.PredicationCell}`PredicationCell`. It has
three coordinates: subject, predicate, and object. Those names are lawful here
because predicating is exactly the phase that generates them.

The seed predication is:

{docstring Infomaterial.PredicationCell.seed}

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

## Orientation Is Real

The converse operation swaps subject and object:

{docstring Infomaterial.PredicationCell.converse}

The seed is its own converse:

{docstring Infomaterial.PredicationCell.converse_seed}

Checked:

```lean
example (u : Utterance) :
    PredicationCell.converse (PredicationCell.seed u)
      = PredicationCell.seed u :=
  PredicationCell.converse_seed u
```

But a non-reflexive predication does not collapse into its converse. Lean records
that orientation is real:

{docstring Infomaterial.PredicationCell.converse_ne}

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

{docstring Infomaterial.PredicationCell.subjProj_idem}

The matching object-projection theorem is
{name Infomaterial.PredicationCell.objProj_idem}`objProj_idem`.

and specialization composes:

{docstring Infomaterial.PredicationCell.specialize_comp}

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

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Infomaterial.Primitive.Mark` for marks and positional kinds.
2. Read `Infomaterial.Articulation.Articulating.Utterance` for token/claim order.
3. Read `Infomaterial.Articulation.Articulating.Cell` for the potential corner.
4. Read `Infomaterial.Language.Predicating.Cell` for the oriented triple.
5. Only then read value, valuation, fibration, hyperdoctrine, or equality.

The next language-phase chapter is positing: how these oriented sites receive
standing without collapsing into Boolean truth.
