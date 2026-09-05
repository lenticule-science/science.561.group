---
kind: question
status: open
explores: [settling-associated-sheaf, closure-rule, rule-language-fragment-realizability-refinement, settling-cohomology]
---

# Rule-language-fragment-stratified sheaves (rule-language-axis cohomology)

The current $\mathbf{Ab}$-valued cohomology doesn't see which [closure-rule language](../concepts/closure-rule.md) fragment realized a given class. The [rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md) hierarchy — bare $\Pi_1$+$<$, named-ordinal entity-equality, ordinal-arithmetic, $\Pi_2$, projective — parameterizes expressivity of the rule language, but the resulting realizable cohomology classes are merged in the current cohomology: a class is just a class, with no record of the minimum-realizing-fragment.

Open: replace $\mathbf{Ab}$ with a value category that carries rule-language fragment data. This is the *rule-language-axis slice* of axis-aware cohomology — value-category enrichment that makes the rule-language fragment hierarchy intrinsic to sections.

## Candidate value categories

- **Filtered abelian groups indexed by the fragment hierarchy.** Sections carry a filtration by the rule-language fragments realizing them; the cohomology is a *graded* invariant, with the $n$th graded piece capturing classes realized exactly at fragment level $n$. This is the most direct candidate — homological algebra of filtered objects is well-developed.
- **Sheaves valued in a fragment poset (or category).** Objects are rule-language fragments; morphisms are expressivity refinements. Sections at a cell get labeled with their realizing fragment, and cohomology operations track fragment composition. Closer to a "Lindenbaum–Tarski sheaf" framing.
- **Sheaves of formulas modulo provable equivalence.** Sections are equivalence classes of formulas in some fragment; restriction is substitution; cohomology classes record the formula-content of cell propagation, not just its $\mathbb{Z}$-rank. Heaviest candidate, closest to classical proof-theoretic stratifications.

Each candidate would expose a different aspect of the rule-language axis. Filtered objects expose stratification-by-fragment-strength; fragment-poset values expose category-of-fragments structure; formula-valued sheaves expose proof-theoretic content directly.

Whether these candidates are derived-equivalent or genuinely distinct is open. Unlike the bigraded axis, the rule-language hierarchy doesn't have an off-the-shelf duality apparatus — Lindenbaum–Tarski algebraization is the closest, but its application here is itself a research question.

## What this gives the program

A rule-language-axis cohomology would let realizability theorems of the form "fragment $n$ realizes exactly the classes in $X_n$" become *intrinsic* statements about cohomology values, rather than external comparisons between an abstract realizable family and a separately-stated cohomology. The rule-language fragment refinement's expressivity hierarchy would be visible directly in cohomology graded pieces.

It would also be the cohomological home for the fragment-stratified moduli stratification implied by the [rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md): the moduli stack would be filtered by minimum-realizing-fragment, and a fragment-aware cohomology would compute that filtration directly.

This question is one slice of a three-axis-aware cohomology program. The companion questions cover the bigraded value-type axis ([bilattice-valued sheaves](bilattice-valued-sheaves.md)) and the $\mathcal{C}$-naturality coupling axis ([$\mathcal{C}$-naturality-valued sheaves](c-naturality-valued-sheaves.md)). Cross-axis combinations — sheaves valued in a category encoding all three axes — are downstream of all three being individually developed.

This is the least-developed of the three axis slices because the rule-language axis itself is currently the least-mature axis of the realizability program (only the bare-language base case is at theorem-strength; richer fragments are sketched). Sharpening the rule-language realizability refinement is upstream of formalizing this question.
