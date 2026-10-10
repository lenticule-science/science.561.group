import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Language.Positing.Charge

/-!
# Positing.Meme — a claim bound to a charge

A **meme** bundles one [claim point](../Predicating/Claim.lean) — the
predication cell positing admits value onto — with one
[charge](Charge.lean), the bilattice value itself. `Claim` and `Charge`
already carry all the content; `Meme` is not a new predication-fiber
primitive, it is the pairing a finite process needs to fold one assertion at a
time into a `Valuation` (`Positing.Valuation`), the way `Utterance` is what an
`Articulating` trace folds one move at a time.

This is the `move → step → trace` correspondence's *step*, for the positing
fiber: a **move** is one address of a valuation trace, a **meme** is the step
carried there — one claim, charged.
-/

namespace Obsmetrologia

/-- One predication cell bound to one bilattice charge — one asserted claim,
carrying its value. The step a valuation trace folds. -/
structure Meme where
  /-- The claim point asserted. -/
  cell : Claim
  /-- The charge asserted at that claim. -/
  charge : Charge
  deriving DecidableEq, Repr, Inhabited

end Obsmetrologia
