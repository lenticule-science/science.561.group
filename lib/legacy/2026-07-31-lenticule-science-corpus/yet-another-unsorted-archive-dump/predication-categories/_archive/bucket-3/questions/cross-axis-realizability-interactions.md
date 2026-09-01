---
kind: question
status: open
explores: [bigraded-realizability-refinement, c-naturality-coupling-realizability-refinement, rule-language-fragment-realizability-refinement, transfinite-bounded-regime-realizability, aperiodic-regime-realizability, predicate-category-naturality, closure-rule]
---

# Cross-axis realizability interactions

The three axes of the [realizability program](../narratives/realizability-program.md) — [bigraded value-type](../theorems/bigraded-realizability-refinement.md), [$\mathcal{C}$-naturality coupling](../theorems/c-naturality-coupling-realizability-refinement.md), and [rule-language fragment](../theorems/rule-language-fragment-realizability-refinement.md) — are each refined under restrictions that hold the other axes fixed. Bigraded refinement is proved on *discrete* $\mathcal{C}$. The $\mathcal{C}$-naturality coupling refinement is stated in the *bare* $\Pi_1$+$<$ rule language. The rule-language fragment hierarchy is stated for the *truth-side single-predicate* slice. The interactions are open.

## The three pairwise interactions

**Bigraded × $\mathcal{C}$-naturality (on non-discrete $\mathcal{C}$).** Does the truth-side / inconsistency-side independence proved on discrete $\mathcal{C}$ persist when $\mathcal{C}$ is non-discrete? The four predicate-generator-class couplings act on the value-type components: specialization couples truth-side along restriction; converse swaps coupling structure between the components; subject- and object-projection collapse coupling diagonally. Whether the bigraded pair is still independently realizable, or whether the generator-class couplings constrain the pair jointly, is unsettled. Concrete substantive question: do the four predicate-generator classes act *separately* on each of the two components, or does e.g. converse mix them?

**Bigraded × rule-language.** Does the bigraded component split persist under rule-language enrichment? Named-ordinal entity-equality literals, ordinal-arithmetic primitives, and higher fragments enrich the realizable family along the rule-language axis — whether the enrichment respects the bigraded $(c_t, c_\top)$-decomposition or introduces new value-type-mixing classes is open. The natural conjecture: enriched fragments preserve the bigraded split (each component is independently realizable at every fragment level), but a counterexample would identify a value-type-mixing rule-language primitive.

**$\mathcal{C}$-naturality × rule-language.** Do the four predicate-generator-class couplings persist under rule-language enrichment? Specifically: does specialization-forces-restriction still hold when the rule language has named-ordinal entity-equality? Does the converse-swap structure still hold for $\Pi_2$-rules? The four generator classes are stated structurally with respect to the bare-language realizable family; whether they are stable under fragment enrichment, or whether richer fragments break specific couplings, is open.

## The full three-way interaction

The full three-axis product question — *realizable family on $(\text{value-type}, \mathcal{C}\text{-coupling}, \text{rule-language})$* — is the synthesis. The conjecture suggested by the program's structure is that the realizable family is the *product* of per-axis families: each axis refines the realizable family independently, and the full family is the product over the three axes of per-axis-realizable subsets. A counterexample would identify cross-axis constraints that no per-axis theorem captures.

This conjecture is stronger than what the per-axis theorems give: per-axis theorems characterize each axis fixing the others at trivial; the product conjecture says the trivial-fixing assumption is without loss of generality.

## Why this matters

The per-axis refinements give a structural decomposition of the realizable family. Whether the decomposition is *clean* (product) or *coupled* (constrained) determines what the realizability program's full statement is. A clean product structure would license stating realizability as a triple of per-axis answers. A coupled structure would force a more intricate combined statement and would identify which axis-pair couplings the temporal 2-category structurally enforces.

The interactions are also where the [representation-theory question](representation-theory-skh.md) sharpens: a "free residuated 2-category" answer would predict specifically a clean product structure — the universal-property structure of a free 2-category enforces independent decomposition along generators. A coupled realizable family would be evidence against the free-2-category candidate.

## Position in the program

This question is the *next frontier* once the per-axis refinements are at theorem-strength. Currently the per-axis pieces are at draft / sketch status (see [realizability of cohomology classes](realizability-of-cohomology-classes.md) for the per-piece state); cross-axis interactions are not addressable until the per-axis statements firm up. But the question is now stable enough to articulate, because the three axes are themselves clearly identified and structurally orthogonal at the level of the per-axis refinements.
