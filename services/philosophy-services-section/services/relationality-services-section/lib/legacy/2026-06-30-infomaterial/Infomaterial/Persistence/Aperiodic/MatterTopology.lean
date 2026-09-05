import Infomaterial.Cohomology.CoordinationCohomology
import Infomaterial.Persistence.Aperiodic.CondensateMatter

/-!
# Matter topology: load-bearing rigidity is the cycle rank

`CondensateMatter` measures matter by *density* --- the count of Bose-condensed ($\top$) lenticules.
But matter has a *shape*: a fabric bears load only when its contacts close a **cycle**. This module
takes that rung. The contact network of a material is a `CoverNerve`, and its load-bearing rigidity
is the coordination cohomology cycle rank $\check H^1 = |E| - |V| + |C|$ (`CoverNerve.H1rank`): a
forest is floppy, a cyclic network is rigid. Each surplus contact past the spanning forest is one
more held cycle --- the **jamming click**, the discrete step from floppy toward jammed.

Green here:
* `loadBearing_iff_not_forest` --- a material bears load iff its contact network is not a forest
  ($\check H^1 > 0$), reusing `h1_vanishes_iff_forest`.
* `jamming_click` --- one redundant contact raises the cycle rank by exactly one.

The residue (the **percolation**) is the bridge from `CondensateMatter.rigidity` (condensate density)
to `H1rank` (cycle topology): how many condensates, placed how, force the first load-bearing cycle.
Density is necessary --- a load-bearing network needs condensed contacts --- but not sufficient: a
floppy chain of condensates carries mass without bearing load. The threshold law is the open frontier.

## References
Corpus coordination-cohomology line (`CoordinationCohomology`, `LandauerEntropy`);
`dev/.../2026-06-26-survey-of-beadwork-mathematics.md` §IV.D (beaded metamaterials, load-bearing
superjamming), §IX (jamming, contact networks).
-/

namespace Infomaterial
namespace Persistence.Aperiodic

open Infomaterial.Cohomology

/-- A material's contact network is **load-bearing** when it carries a cycle: $\check H^1 > 0$.
Rigidity acquires a shape --- not the condensate density of `rigidity`, but the cycle structure of
the contacts. -/
def loadBearing (N : CoverNerve) : Prop := 0 < N.H1rank

/-- **Load-bearing iff not a forest.** A contact network bears load exactly when it is not a
tree/forest --- when some contact closes a cycle. Floppy $=$ forest; rigid $=$ cyclic. -/
theorem loadBearing_iff_not_forest (N : CoverNerve) :
    loadBearing N ↔ N.entities ≠ N.cells + N.components := by
  rw [loadBearing, Nat.pos_iff_ne_zero, ne_eq, CoverNerve.h1_vanishes_iff_forest]

/-- **The jamming click.** Adding one redundant contact (a cell that merges no component) raises the
load-bearing cycle rank by exactly one: each surplus contact past the spanning forest is one more
held cycle --- the discrete step from floppy toward jammed. -/
theorem jamming_click (N N' : CoverNerve)
    (hc : N'.cells = N.cells + 1) (he : N'.entities = N.entities)
    (hk : N'.components = N.components) :
    N'.H1rank = N.H1rank + 1 := by
  have h := N.entities_le_cells_add_components
  simp only [CoverNerve.H1rank, hc, he, hk]
  omega

end Persistence.Aperiodic
end Infomaterial
