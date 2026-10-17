import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Positing.Reading

/-!
# Positing.Meme — a predication cell bound to a reading

A **meme** bundles one [predication cell](../Predicating/Claim.lean) — the
oriented cell positing admits value onto — with one
[reading](Reading.lean), the bilattice value itself. `PredicationCell` and
`Reading` already carry all the content; `Meme` is not a new predication-fiber
primitive, it is the pairing a finite process needs to fold one assertion at a
time into a `Valuation` (`Positing.Valuation`), the way `Utterance` is what an
`Articulating` trace folds one move at a time.

This is the `move → step → trace` correspondence's *step*, for the positing
fiber: a **move** is one address of a valuation trace, a **meme** is the step
carried there — one predication cell, valued.
-/

namespace Obsmetrologia

/-- One predication cell bound to one bilattice reading — one asserted claim,
carrying its value. The step a valuation trace folds. -/
structure Meme where
  /-- The predication cell asserted. -/
  cell : PredicationCell
  /-- The reading asserted at that claim. -/
  reading : Reading
  deriving DecidableEq, Repr, Inhabited

end Obsmetrologia
