import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Logic and categories overview" =>

# Logic And Categories

Status: recovered mathematics.

Modules: `Hyperdoctrine`, `Quantifying`, `PredicationFibration`,
`PredicationHyperdoctrineDual`, `ModalPairAdjunction`, `LinearLogicChu`,
`CurryHowardLambekQuartet`, `LambekCalculus`, `TemporalTwoCategory`,
`YonedaArrowsFirst`, `KZCoherentSheaf`, `QuantaleEnrichedSheaf`,
`TheoryRelativeIdeal`, `Factorization`.

This family is where familiar categorical and logical objects become visible
inside Infomaterial. The documentation burden is especially high here because the
terms are familiar enough to mislead readers.

`Hyperdoctrine`, `Quantifying`, and `PredicationFibration` recover quantifier and
fiber structure from predication. `PredicationHyperdoctrineDual` and
`ModalPairAdjunction` track dual and modal adjunction patterns. `LinearLogicChu`,
`CurryHowardLambekQuartet`, and `LambekCalculus` recover logical calculi from the
generated structures rather than importing them as first principles.

`TemporalTwoCategory`, `YonedaArrowsFirst`, `KZCoherentSheaf`,
`QuantaleEnrichedSheaf`, `TheoryRelativeIdeal`, and `Factorization` are theory
bridges. Each needs explicit documentation of its generating path, because these
names carry strong received meanings.

Reader warning: a recovered category-theoretic object is not automatically the
ambient category-theoretic object with a new label. The overview must say what is
preserved, what is weakened, and what is generated differently.
