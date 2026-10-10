import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Algebra and discrete overview" =>

# Algebra And Discrete Recovery

Status: recovered mathematics and infrastructure.

Modules: `AlgebraHierarchy`, `SetNumberGraphTheory`,
`NumberTheoryCombinatorics`, `CombinatoricsExtremal`, `LinearAlgebra`,
`LinearAlgebraRankNullity`, `FormalConceptAnalysis`, `FCALambekCircle`,
`Equality`, `OrderSwapDuality`, `SynonymyAntonymy`,
`SubstitutionUniversalityClass`, `InternalReals`.

This family records conventional mathematical recovery work: algebraic
hierarchies, finite and discrete structures, equality, linear algebra, concept
analysis, and internal number-like objects.

`AlgebraHierarchy`, `LinearAlgebra`, `LinearAlgebraRankNullity`, and
`InternalReals` make familiar algebraic material available without Mathlib.
`SetNumberGraphTheory`, `NumberTheoryCombinatorics`, and
`CombinatoricsExtremal` cover finite combinatorial recovery.

`FormalConceptAnalysis` and `FCALambekCircle` connect concept lattices and
logical structure. `Equality`, `OrderSwapDuality`, `SynonymyAntonymy`, and
`SubstitutionUniversalityClass` document identity, duality, naming, and
substitution phenomena as generated objects.

Reader warning: these modules are easy to misread as "homebrew replacements for
Mathlib." The documentation should instead explain why the local definitions are
needed to preserve the no-Mathlib, generated-foundation discipline.
