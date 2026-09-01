# Predicated Software Engineering

A subtheory of [predicated-computing](../../_index.md). Studies the *practice-side* of computing on the predicated substrate: producing, evolving, and operating software whose codebase, build artifacts, deployments, and contributors are themselves substrate entities. Sibling and complement to the substrate-side platform subtheories ([database-platform](../database-platform/_index.md), [functional-runtime-platform](../functional-runtime-platform/_index.md), etc.); those study what computing *is*, this studies what producing-and-evolving-it *is*.

The fusion is non-trivial: a codebase is a [predication-cell-system](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md) whose entities are source files, definitions, identifiers, tests, deployments, and increments; software-engineering activities — commit, refactor, deploy, test, review — are morphisms on that cell-system; the question of "what changes when this lands" becomes a question about the action on the [settling-associated sheaf](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md). The substrate-algebraic vocabulary inherited from predicated-computing (closure-2-monad, predication-fibration, four-regime classification, bigraded cohomology) is precisely the vocabulary engineering practice needs but historically lacked.

## Why a subtheory rather than a sibling theory

Three reasons.

1. **Library structure.** [Software-engineering](../../../software-engineering/_index.md) is a discipline within computing in the engineering tree; this subtheory mirrors that placement, with its predicated form nested inside predicated-computing the way the discipline is nested inside computing.
2. **Substrate inheritance.** The predicated form inherits from predicated-computing: predication-cells, closure rules, settling, bilattice values, regime classification. A codebase-as-substrate is a specialization, not a re-derivation.
3. **Co-content.** Activities like refactoring, testing, and review *presuppose* a working substrate (a codebase that exists, whose state can be observed, whose change can be witnessed). Without that substrate the activities have no object. The subtheory shape captures this dependency.

## Convention

Following the [predication-categories convention](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md). Same frontmatter, same status markers, same relation set. Notes here depend on predicated-computing's substrate objects/morphisms in addition to the math program's.

## Layout

- `concepts/` — engineering-semantic anchors that recur across the subtheory: codebase-as-cell-system, change-as-witness-increment, witness-language-relativity.
- `objects/` — formal structures: codebase-cell-system, source-file-as-entity, definition-as-entity, build-artifact, test-witness.
- `morphisms/` — activities: commit, merge, refactor, test-run, deploy, review-vote.
- `theorems/` — claims about engineering invariants on the substrate.
- `examples/` — worked engineering scenarios as substrate operations.
- `narratives/` — synthesis essays.
- `questions/` — open questions about the fusion.
- `references/` — disciplinary precursors.
- `theories/` — subtheories.

## Subtheories

- [`predicated-software-development/`](theories/predicated-software-development/_index.md) — the activity-slice that changes the codebase (as opposed to deploying-it, observing-it, or organizing-around-it). Hosts [predicated-software-refactoring](theories/predicated-software-development/theories/predicated-software-refactoring/_index.md), the leaf where the substrate machinery has the most to say.

## What this subtheory commits to

- **A codebase is substrate content, not just data.** Source files, definitions, identifiers, tests, and deployment artifacts are predication cells in the codebase's cell-system, related by predicates like `defined-in`, `references`, `is-test-for`, `was-deployed-as`. This is not a metaphor — it is the substrate's primary reading of what a codebase is.
- **Engineering activities are morphisms.** Every commit, refactor, test-run, deploy, and review-vote is a substrate operation: a witness-bearing increment to the codebase's settling. The four-regime classification of operations applies.
- **Witness-language relativity is structural.** What it means for a change to be observable or invariant depends on which cells are designated witness-bearing. The disciplinary intuition that "it depends what we're testing" is the substrate-algebraic fact that the [settling-associated sheaf](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) is parameterized by the witness designation.

## Status

Active. Parent fusion drafted as a thin anchor for [predicated-software-development](theories/predicated-software-development/_index.md); fuller content (concepts, objects, morphisms specific to the engineering layer rather than its development sub-activity) accrues as [predicated-software-refactoring](theories/predicated-software-development/theories/predicated-software-refactoring/_index.md) demands them upward.
