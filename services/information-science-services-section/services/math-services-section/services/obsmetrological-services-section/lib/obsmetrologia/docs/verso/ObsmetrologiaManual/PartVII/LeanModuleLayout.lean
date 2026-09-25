import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
The current Lean files are mostly flat. This page records the documentation
layout that should guide future namespace and module organization.
-/

#doc (Manual) "Lean module layout" =>

# Lean Module Layout

The current active Lean library lives mostly as flat modules under `Obsmetrologia/`.
That is workable for compilation, but it is not enough for a documentation system
at the scale Obsmetrologia needs.

The documentation layout should lead the source layout, carefully. We should not
rename modules casually while the project is moving quickly, but we should know
the target shape.

## Target Rule

Namespace equals topic.

Module equals concept.

Declaration equals term.

In Lean-like form, the nesting should read as topic, then concept, then term:

```lean
namespace Obsmetrologia.Settling
namespace Closure
def settles_by_three : Prop := True
end Closure
end Obsmetrologia.Settling
```

In documentation form:

```text
Part: Settling
  Topic: Closure and fixed points
    Concept: Closure operator
      Term: settles_by_three
        Tutorial
        How-to
        Explanation
        Reference
```

The documentation can adopt this layout before the Lean source is physically
reorganized. That lets us avoid churn while still giving readers the right map.

## Present Transitional Layout

The present source modules fall into topic families:

* primitives and first generators;
* predication and categorical recovery;
* positing, reading, valuation, and bilattice structure;
* settling, order, closure, and fixed points;
* generated calculus order infrastructure;
* generated calculus logic: residuation, Chu spaces, Lambek calculus, and the FCA-Lambek circle;
* hyperdoctrine, quantification, equality, and logic;
* sheaf, cohomology, CRDT, and local-to-global recovery;
* FOUR, gauge, nuclei, and recurrence;
* algebra, discrete mathematics, and received structures;
* dynamics, geometry, optimization, probability, and physical analogues;
* aperiodicity and finite-certificate frontier.

Those families are already enough to write Diataxis topic pages. Later, the Lean
namespace structure can follow the documentation where the documentation has
stabilized.

## Refactor Rule

Do not move a Lean module merely because it resembles a topic.

Move or split a module only when the generating path is clear, the documentation
topic exists, and the concept boundary is stable. The source refactor should
confirm the documentation structure, not guess it.

## Module Page Requirement

Every active Lean module should have a concept page with:

1. topic namespace;
2. generating morphism;
3. upstream concepts;
4. downstream concepts;
5. main declarations;
6. Blueprint labels;
7. corpus provenance;
8. Diataxis coverage status.

This is the bridge from the present flat library to a future namespace-organized
library.
