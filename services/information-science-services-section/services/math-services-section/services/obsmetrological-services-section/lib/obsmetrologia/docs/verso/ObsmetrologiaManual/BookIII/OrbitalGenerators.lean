import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Language.Predicating.Orbital

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The teaching carrier for the orbital keystone: generator exhaustiveness for
predication reindexings.
-/

#doc (Manual) "Orbital generators" =>

# Orbital Generators: Predication Forces FOUR

The claim-site carried here is:

* claim-site: generator exhaustiveness for natural reindexings of an oriented
  pair;
* phase: language, the keystone underneath predicating's four generators;
* generating sites: none inside the cell machinery — this module is standalone,
  built from an abstract entity type and its permutations alone;
* Lean carrier: `Obsmetrologia.Language.Predicating.Orbital`;
* Blueprint nodes: `thm:orbital-exhaustive`, `thm:orbital-diagonal-fixed`,
  `prop:orbital-three-counterexample`;
* provenance: the monograph's "predication forces FOUR", in its generator
  exhaustiveness sense, corrected from three entities to four by the proof
  itself;
* familiar comparison: the four maps `Hom(2,2)`, the functions of a two-element
  set to itself; the four orbital maps of a pair under its symmetric group;
* danger: reading the four-case Boolean check on `PredicationCell` as the
  theorem. It is a roundtrip confirming a count this module forces from
  naturality alone.

The governing sentence is:

> A reindexing of an oriented pair that is natural in the entity type is
> exhausted by four maps once the entity type has four pairwise-distinct
> entities — the same four as the four corners, because a pair has two hands.

## The Four Generators, Unconditionally

Each of the four orbital maps is equivariant for *any* entity type, with no
distinctness hypothesis: they are built termwise from the permutation action,
and they are the pair-level shadows of `PredicationCell.converse`, `subjProj`,
`objProj`, and the identity.

```lean
example {E : Type} : Obsmetrologia.Orbital.Equivariant (fun p : E × E => p) :=
  Obsmetrologia.Orbital.id_equivariant

example {E : Type} :
    Obsmetrologia.Orbital.Equivariant (fun p : E × E => (p.2, p.1)) :=
  Obsmetrologia.Orbital.converse_equivariant

example {E : Type} :
    Obsmetrologia.Orbital.Equivariant (fun p : E × E => (p.1, p.1)) :=
  Obsmetrologia.Orbital.subjProj_equivariant

example {E : Type} :
    Obsmetrologia.Orbital.Equivariant (fun p : E × E => (p.2, p.2)) :=
  Obsmetrologia.Orbital.objProj_equivariant
```

## The Converse Direction Needs Four Entities

That these four are *all* the equivariant maps needs four pairwise-distinct
entities. This is the keystone theorem, stated here exactly as it is proved:

```lean
example {E : Type} [DecidableEq E]
    (four : ∃ a b c d : E, a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d)
    (f : E × E → E × E) (hf : Obsmetrologia.Orbital.Equivariant f) :
    (∀ p, f p = p) ∨ (∀ p, f p = (p.2, p.1)) ∨ (∀ p, f p = (p.1, p.1)) ∨
      (∀ p, f p = (p.2, p.2)) :=
  Obsmetrologia.Orbital.orbital_exhaustive four f hf
```

Only three pairwise-distinct entities are needed for the diagonal half alone:

```lean
example {E : Type} [DecidableEq E]
    (three : ∃ a b c : E, a ≠ b ∧ b ≠ c ∧ a ≠ c)
    (f : E × E → E × E) (hf : Obsmetrologia.Orbital.Equivariant f) (s : E) :
    f (s, s) = (s, s) :=
  Obsmetrologia.Orbital.diagonal_fixed three f hf s
```

## At Exactly Three Entities, A Fifth Map

The off-diagonal half genuinely needs the fourth entity. At exactly three
entities there is a fifth equivariant map, `thirdMap`, sending every
off-diagonal pair to the doubled excluded third entity — natural, and none of
the four generators:

```lean
example : Obsmetrologia.Orbital.Equivariant Obsmetrologia.Orbital.ThreeSample.thirdMap :=
  Obsmetrologia.Orbital.ThreeSample.thirdMap_equivariant

example :
    ¬ ((∀ p, Obsmetrologia.Orbital.ThreeSample.thirdMap p = p) ∨
        (∀ p, Obsmetrologia.Orbital.ThreeSample.thirdMap p = (p.2, p.1)) ∨
        (∀ p, Obsmetrologia.Orbital.ThreeSample.thirdMap p = (p.1, p.1)) ∨
        (∀ p, Obsmetrologia.Orbital.ThreeSample.thirdMap p = (p.2, p.2))) :=
  Obsmetrologia.Orbital.ThreeSample.thirdMap_not_orbital
```

At three entities a pair can still *name* its own complement — "the other
one" — so there are nine natural reindexings, not four. Four is the first
entity count at which a pair's complement is no longer nameable as a single
further entity, which is exactly when the generator count settles at four:
the same `2^2` as the four corners of the articulation cell (Book II), since
both are forced by a two-hand set having exactly four self-maps.

## What This Page Does Not Say

This module does not import `Cell.lean` or `PredicationCell`; it is proved
standalone, from an abstract entity type and its permutations alone, so that
the concrete `converse`/`subjProj`/`objProj` are shown to be shadows of a
naturality fact rather than definitions this module depends on. It does not
compute the nine natural reindexings at three entities in closed form beyond
exhibiting the one counterexample; the full count is stated in prose, not
formalized here.
