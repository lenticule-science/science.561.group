import ObsmetrologiaManual.DocSetup
import Obsmetrologia

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
The keystone exposition: a self-contained account of `Obsmetrologia.quartet_recurrence`
and `Obsmetrologia.twistoring_eq_commutating`, written to point at the Lean declarations
that carry the content rather than restate them. Every `{name …}` and
`{docstring …}` resolves against the live `Obsmetrologia` environment, and every `lean`
block is elaborated, so the prose cannot drift from the proof.

Heavy `{docstring …}` signature rendering overflows the ~1 MB native stack on
Windows (the same wall as doc-gen4); build this module on WSL/CI, where the stack is
large enough. The `{name …}` welding and the elaborated `lean` blocks are checked on
either platform.
-/

#doc (Manual) "The keystone: one four-corner cell" =>

# The Keystone — One Four-Corner Cell, Met at Every Depth

_This section is the rigorous core of Part III. Where the surrounding chapter
compares the recurrences in prose, this one states the conflation as a theorem and
links each step to the declaration that proves it._

Obsmetrologia descends through four base verbs — articulating, predicating, positing,
settling. The corpus's deepest single claim is that these are *not four separate
structures* but *one four-corner coherence cell*, generated at the first
two-sided articulation and then met again, unchanged in shape, at every later
depth. This is easy to assert and easy to over-read as a slogan. The point of this
section is that in Obsmetrologia it is neither asserted nor a slogan: it is the theorem
{name Obsmetrologia.quartet_recurrence}`quartet_recurrence`, with the recurring
_coherence square_ recorded separately as {name Obsmetrologia.twistoring_eq_commutating}`twistoring_eq_commutating`.

We build the claim in five steps:

1. the four-corner cell is _forced_ by two-sidedness — exactly four corners, not three or five;
2. the same object carries _five readings_ (articulation phase, status pair, bilattice reading, nuclear quartet, modal four);
3. the _master conflation_ certifies those readings are one object;
4. the _coherence 2-cell_ abstracts the commuting square the readings share;
5. that square recurs at two genuinely different depths — the _honest scope_ of the claim.

## 1. Four corners, forced by two-sidedness

An utterance is a two-sided thing: a token side and a claim side. When articulating
acts, each side is independently either articulated or not. Two independent binary
statuses give a partition into corners, indexed by {name Obsmetrologia.Articulating.Corner}`Corner`.

{docstring Obsmetrologia.Articulating.Corner}

The cardinality is not a convention — it is derived. One side would give two cells;
three sides would give eight; the two-sidedness of the utterance gives exactly four.
That is {name Obsmetrologia.Articulating.Corner.card_eq_four}`card_eq_four`:

```lean
example : Articulating.Corner.all.length = 4 := Articulating.Corner.card_eq_four
```

The corners biject with the raw status pair {name Obsmetrologia.Articulating.FourCorner}`FourCorner` —
the canonical four-corner object every later quartet is an instance of.

{docstring Obsmetrologia.Articulating.FourCorner}

## 2. Five readings of one object

The four-corner cell reappears under different names as the spine descends. Each
reappearance is a bijection back to {name Obsmetrologia.Articulating.Corner}`Corner`, witnessed in
Lean, so none of them is a _new_ object:

* _Articulation phase_ — `{potential, active, stable, absurd}`, read off a cell's
  two articulation statuses ({name Obsmetrologia.Articulating.Cell.corner}`Articulating.Cell.corner`).
* _Status pair_ — {name Obsmetrologia.Articulating.FourCorner}`FourCorner`, that is `Bool × Bool`.
* _Bilattice reading_ — the four evidence values positing admits,
  {name Obsmetrologia.Reading}`Reading`, which is definitionally {name Obsmetrologia.Articulating.Corner}`Corner`.
* _Nuclear quartet_ — the four sub-algebras `(A, Fix j₁, Fix j₂, A*)` of a settled
  fiber algebra.
* _Modal four_ — `{neither, ◇, □, both}`: apply neither closure, `j₁` alone (◇),
  `j₂` alone (□), or both. This is {name Obsmetrologia.Modal}`Modal`.

{docstring Obsmetrologia.Modal}

The modal reading is a faithful renaming of the corners: the round trip through
{name Obsmetrologia.Modal.toCorner}`toCorner` and {name Obsmetrologia.Modal.ofCorner}`ofCorner`
is the identity, so {name Obsmetrologia.Modal}`Modal` _is_ {name Obsmetrologia.Articulating.Corner}`Corner`
met under modal names.

```lean
example (m : Modal) :
    Modal.ofCorner (Modal.toCorner m) = m := by
  cases m <;> rfl
```

## 3. The master conflation

The five readings are collected into one statement. {name Obsmetrologia.QuartetRecurrence}`QuartetRecurrence`
bundles the round-trip identities — every reading's path back to
{name Obsmetrologia.Articulating.Corner}`Corner` is the identity — together with the load-bearing
identity that an articulation phase, read as a four-corner, already _is_ a
bilattice reading, and with exhaustiveness.

{docstring Obsmetrologia.QuartetRecurrence}

The theorem {name Obsmetrologia.quartet_recurrence}`quartet_recurrence` inhabits that
bundle — the keystone packaged as a single term:

{docstring Obsmetrologia.quartet_recurrence}

```lean
example : QuartetRecurrence := quartet_recurrence
```

Concretely, the bundle's exhaustiveness field is the very same `card_eq_four` from
§1 — the readings did not multiply the corners:

```lean
example : Articulating.Corner.all.length = 4 :=
  Articulating.Corner.card_eq_four
```

and the articulation-phase-is-reading field is the reused
{name Obsmetrologia.articulation_phase_is_reading}`articulation_phase_is_reading`. The
un-articulated (neither-slot-witnessed) cell sits at the knowledge-bottom reading
`⊥ₖ`, the start of the descent in _both_ readings at once:

```lean
example (u : Utterance) :
    Articulating.FourCorner.toCorner
        (Articulating.Cell.unarticulated u).fourCorner
      = Reading.kBot := rfl
```

## 4. The coherence 2-cell

The recurrence is not only of the four-corner _object_. The corpus claims that the
commuting _square_ recurs — that the way two operations interact is itself one
repeated cell. Obsmetrologia isolates exactly the shared structure — the
{name Obsmetrologia.CommutingPair}`CommutingPair` of two commuting endomaps — and proves
its coherence once, generically, before instantiating it.

{docstring Obsmetrologia.CommutingPair}

A commuting pair indexes four ways of acting by {name Obsmetrologia.Articulating.Corner}`Corner`:
do nothing, apply `f`, apply `g`, or apply both. The recurring coherence cell is
the single generic lemma {name Obsmetrologia.CommutingPair.square}`square`: the
doubly-acted `absurd` corner is path-independent — `f (g a) = g (f a)`.

{docstring Obsmetrologia.CommutingPair.square}

## 5. Twistoring = commutating — and the honest scope

The generic square is instantiated at two genuinely different depths of the spine:

* {name Obsmetrologia.twistoringPair}`twistoringPair` — at the articulating birth-corner,
  on {name Obsmetrologia.Reading}`Reading`, with `f` the slot negation `∼` and `g` the
  conflation `−`, commuting by the Klein-four law;
* {name Obsmetrologia.commutatingPair}`commutatingPair` — on a settled Heyting fiber,
  with `f, g` the two commuting nuclei `j₁, j₂` of an aperiodic settling.

{docstring Obsmetrologia.twistoringPair}

{docstring Obsmetrologia.commutatingPair}

Instantiated on {name Obsmetrologia.Reading}`Reading`, the coherence square is a concrete,
checked identity:

```lean
example (a : Reading) :
    twistoringPair.cornerOp .absurd a
      = twistoringPair.g (twistoringPair.f a) :=
  twistoringPair.square a
```

That both instances satisfy the _same_ generic
{name Obsmetrologia.CommutingPair.square}`square`, indexing the _same_ four corners, is the
headline:

{docstring Obsmetrologia.twistoring_eq_commutating}

### What the theorem does and does not claim

This is where prose must be exact, because the shared cell is _strictly smaller_
than either instance. The two depths differ in a real law:

* at articulating the pair are _involutions_ — `∼ ∘ ∼ = id`, `− ∘ − = id`;
* at settling they are _idempotent nuclei_ — `j ∘ j = j`.

Involution and idempotence are incompatible in general, so the claim is emphatically
_not_ that twistoring and commutating are equal as algebraic operations. The
{name Obsmetrologia.CommutingPair}`CommutingPair` structure deliberately omits both laws.
What recurs — what {name Obsmetrologia.twistoring_eq_commutating}`twistoring_eq_commutating`
proves recurs — is _only_ the commuting-square coherence cell. That restraint is the
difference between a theorem and a resemblance: the conflation is asserted exactly to
the extent that the two depths share structure, and no further.

All declarations cited here depend on at most the core logical axioms; the
conflations are `rfl`- or `cases`-proven, carrying no axioms at all.
