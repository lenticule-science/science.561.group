import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Logic and categories overview" =>

# Logic And Categories

Status: recovered mathematics.

Modules: `Hyperdoctrine`, `Quantifying`, `Fibration`,
`Predicating.HyperdoctrineDual`, `Closure.Modal`,
`ResiduatedLatticeStandalone`, `TwistProductResiduation`, `LinearLogicChu`,
`Predicating.CurryHowardLambek`, `LambekCalculus`, `FCALambekCircle`,
`Temporal`, `YonedaArrowsFirst`, `KZCoherentSheaf`,
`QEnriched`, `TheoryRelativeIdeal`, `Factorization`.

This family is where familiar categorical and logical objects become visible
inside Obsmetrologia. The documentation burden is especially high here because the
terms are familiar enough to mislead readers.

`Hyperdoctrine`, `Quantifying`, and `Fibration` recover quantifier and
fiber structure from predication. `Predicating.HyperdoctrineDual` and
`Closure.Modal` track dual and modal adjunction patterns.
`ResiduatedLatticeStandalone`, `TwistProductResiduation`, `LinearLogicChu`,
`Predicating.CurryHowardLambek`, `LambekCalculus`, and `FCALambekCircle` recover
logical calculi from the generated structures rather than importing them as first
principles.

`Temporal`, `YonedaArrowsFirst`, `KZCoherentSheaf`,
`QEnriched`, `TheoryRelativeIdeal`, and `Factorization` are theory
bridges. Each needs explicit documentation of its generating path, because these
names carry strong received meanings.

Reader warning: a recovered category-theoretic object is not automatically the
ambient category-theoretic object with a new label. The overview must say what is
preserved, what is weakened, and what is generated differently.
