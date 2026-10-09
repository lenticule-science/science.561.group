import Obsmetrologia.Language.Predicating.Cell

/-!
# Predication cell — the potential-cell constructor

A **claim** is the utterance's right-hand mark, typed: `Utterance.claim : Claim`,
also named `Predicate` (`abbrev Predicate := Claim`, in `Cell.lean`). It is not the
name of the oriented triple `(s, p, o)` — that is the **predication cell**,
`PredicationCell`, also defined in `Cell.lean`. This module only adds the
potential-cell constructor for `PredicationCell`; the cell's core constructors
(`seed`, `converse`) and their laws live in `Cell.lean` itself.

## Main definitions

* `PredicationCell.ofPotential`

## Main results

* `PredicationCell.seed_subject`
* `PredicationCell.seed_predicate`
* `PredicationCell.seed_object`
* `PredicationCell.ofPotential_eq_seed`
-/

namespace Obsmetrologia

namespace PredicationCell

/-- The predication cell generated from a typed potential articulation cell. -/
def ofPotential (c : Articulating.PotentialCell) : PredicationCell :=
  predicating c

@[simp] theorem seed_subject (u : Utterance) : (seed u).subject = u.token := rfl

@[simp] theorem seed_predicate (u : Utterance) : (seed u).predicate = u.claim := rfl

@[simp] theorem seed_object (u : Utterance) : (seed u).object = u.token := rfl

@[simp] theorem ofPotential_eq_seed (c : Articulating.PotentialCell) :
    ofPotential c = seed c.utterance := rfl

end PredicationCell

end Obsmetrologia
