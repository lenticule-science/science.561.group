import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Settlement

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Settlement

/-!
A teaching chapter for the settlement genus: one recurring shape (a bare site
paired with content it admits) met independently in four places in this
library.
-/

#doc (Manual) "Settlement Genus" =>

# Settlement Genus

`Obsmetrologia.Settling` names a morphism: the closure `◇∘□` to its fixed
point. A separate, later naming decision (outside this Lean tree, in the
metroplat package's own naming discipline) needed a word for a different
thing entirely: the whole assembled running artifact, at any scale. The word
chosen was *settlement*, on the reasoning that the artifact is named by the
process it runs — the thing that settles is a settlement. That reuse of the
root risked colliding with `Settling` inside this very library (and did
collide, briefly, in a Collatz module literally named `Settlement` for the
stage sense — since renamed to `Settling`).

Resolving the naming question properly meant asking what a settlement
actually is, mathematically, rather than only picking a word. The answer:
*a settlement is a site inhabited.* A site is a bare carrier, rule, or
topology — it can exist with nothing accreted over it. A settlement is that
same base paired with actual content satisfying the base's own admission
law. This page formalizes that shape once and exhibits four independent
witnesses of it, built without each other in mind.

## The Shape

{docstring Obsmetrologia.Settlement}

Two fields only: the content, and a proof it is admitted. This is
deliberately thin — the `Language.Positing.Quartet` module abstracts a
coherence cell (`CommutingPair`) the same way, keeping only what its two
instances actually share and naming their differences separately rather than
forcing them into the shared cell. The same discipline applies here.

## Instance — Tiles

A `Tiles` value already has exactly this shape: a carrier with a finite local
rule (bare), paired with a listed pattern proven admissible against it
(settled).

{docstring Obsmetrologia.Settlement.ofTiles}

## Instance — Beads

A `Beads` thread has the same shape one rung up the ladder: the lenticule
carrier (bare), paired with a routed thread proven `ThreadLegal` against the
hole-transition rule — the same `warpAlt` shift of finite type a weave
crossing uses. This was the open fourth instance the first draft of this
page named without finding: a site somewhere in the library not yet
recognized as one.

{docstring Obsmetrologia.Settlement.ofBeadsThread}

## Instance — Hole

Book VIII's causal-boundary `Hole` bundles a substrate and a chosen readout —
these alone already determine the shroud combinatorially, with no observed
activity presupposed, exactly the bare corner — together with an effect
relation whose every source is shroud-supported, the settled corner. This
page's Holes chapter had already flagged the open question of what ties a
support boundary to persistence and effects into one generated object; the
settlement shape is one honest answer to that question, at the level of
generality it actually supports (it does not claim persistence or
non-fillability, only content-over-a-base admitted by a law).

{docstring Obsmetrologia.Settlement.ofHole}

## Instance — the bitopological settling site itself

A `Cech1` datum is a cover of the site together with local sections — the
site side, before any global content is assumed. For an agreeing family (a
`Cocycle`), the glued section is a settlement of that datum: the content is
the glue, and the admission law is being a `Coboundary` of the family. No
gluing is re-derived here; `glue`/`glue_coboundary` are the constructive half
of `h1_vanishes`, reused verbatim.

{docstring Obsmetrologia.Settlement.ofCech1}

## The Recurring Cell

{docstring Obsmetrologia.Settlement.tiles_beads_hole_cech1_are_settlements}

Checked:

```lean
example (T : AperiodicOrder.Crystal.Tiles) :
    (Settlement.ofTiles T).content = T.word :=
  rfl
```

Four domains, one shape, no domain built with the others in mind. Whether
further instances exist — a fifth site somewhere in this library not yet
recognized as one — is open; this page claims exactly four, not a general
theorem that every site/content pair in the corpus fits.
