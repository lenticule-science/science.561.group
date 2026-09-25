---
type: theorem
status: draft
depends-on: [codebase-cell-system, refactor, invisible-automorphism-subgroup, settling-associated-sheaf, visible-automorphism-sources, restructure-as-visible-automorphism]
realizes: [refactor-as-invisible-automorphism, witness-language-relativity]
title: Refactor as invisible automorphism
description: The disciplinary notion of a refactoring — a transformation of a codebase that preserves observable behavior while changing structure — coincides exactly with the substrate-algebraic notion of an invisible automorphism of the codebase…
---

# Refactor as invisible automorphism

The disciplinary notion of a refactoring — a transformation of a codebase that preserves observable behavior while changing structure — coincides exactly with the substrate-algebraic notion of an invisible automorphism of the [codebase cell-system](../terms/codebase-cell-system.md), parameterized by the project's witness language $W$.

## Statement

Let $v^{\mathrm{code}}$ be a [codebase cell-system](../terms/codebase-cell-system.md) with [predication settling](../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md), and let $W \subseteq \Pi_{\mathrm{code}} \times E_{\mathrm{code}} \times E_{\mathrm{code}}$ be a witness language — a set of cell positions deemed witness-bearing.

Let $\phi = (\pi_E, \pi_\Pi, g)$ be a candidate transformation: an entity-permutation $\pi_E \in \mathrm{Sym}(E_{\mathrm{code}})$, a generator-class-preserving endofunctor $\pi_\Pi$ of $\Pi_{\mathrm{code}}$, and an element $g \in K_4$ from the substrate's symmetry group, acting on $v^{\mathrm{code}}$ stagewise. Suppose $\phi$ stabilizes $v^{\mathrm{code}}$ — i.e., $\phi \in \mathrm{Aut}^\simeq(v^{\mathrm{code}})$.

**Theorem.** *$\phi$ is a refactoring under witness language $W$ iff $\phi$'s action on cell positions fixes every cell of $W$ that has been newly designated by the settling — equivalently, iff $\phi$ acts as the identity on the $W$-restricted [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) $\mathcal{F}^{\mathrm{code}}_W$. The refactorings under $W$ form the invisible-automorphism subgroup $N_W(v^{\mathrm{code}}) \trianglelefteq \mathrm{Aut}^\simeq(v^{\mathrm{code}})$.*

## Sketch

The theorem reduces to [visible-automorphism-sources](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/visible-automorphism-sources.md) applied to the codebase cell-system, with the witness-language $W$ selecting which sub-sheaf of $\mathcal{F}^{\mathrm{code}}_U$ measures visibility.

The $\Leftarrow$ direction is [invisible-automorphism-subgroup](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) directly: an automorphism that fixes the $W$-witness cells acts trivially on every cohomological invariant of $\mathcal{F}^{\mathrm{code}}_W$, hence cannot be detected by any witness in $W$. This is what "preserves observable behavior under $W$" means.

The $\Rightarrow$ direction: an automorphism whose action on $\mathcal{F}^{\mathrm{code}}_W$ is non-trivial induces a non-trivial action on at least one cohomology class $H^n(\mathbf{T}^*, \mathcal{F}^{\mathrm{code}}_W)$, which (by the witness-language's defining property: $W$-witnesses span the $W$-cohomology) is detectable by some witness in $W$. Hence the automorphism is observable under $W$ and is not a refactoring under $W$.

The gauge component $g$ contributes nothing to the refactor/non-refactor distinction (parallel to its non-contribution in [restructure-as-visible-automorphism](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md)): when $g$ stabilizes $v^{\mathrm{code}}$, it acts only on cell values not positions, and is therefore in $N_W$ for every $W$. $\square$

## What the theorem proves about disciplinary practice

**(a) The refactoring catalog is a generating set, not a list of conventions.** Each catalog entry — [rename](../terms/rename.md), [extract](../terms/extract.md), [inline](../terms/inline.md), [move](../terms/move.md) — is constructed as an automorphism in $N_W$ for typical $W$. The catalog is a *generating set* of $N_W$ (or its connected component containing the identity, in graph terms — see [refactor-graph](../../documents/articles/research/2026/07/31/lenticule-import/computing/software/software-development/archive/teaching/explanations/refactor-graph.md)), modulo composition. The fact that Fowler's catalog has been empirically near-complete for thirty years is the substrate-algebraic fact that $N_W$ for typical witness languages is generated by these specific kinds of automorphisms.

**(b) A change is a refactoring relative to a $W$.** "Is this a refactoring?" is not a question with an absolute answer; it is a question with a $W$-relative answer. A change can simultaneously be a refactoring under one project's witness language and a substantive change under another's. The theorem makes this precise.

**(c) "Tests pass" is necessary but not sufficient for refactoring under any $W$ richer than test-only.** If $W$ extends beyond tests — to public APIs, to monitoring, to debugger-paths — passing tests does not place the change in $N_W$. The theorem identifies exactly when "tests pass" suffices: when $W$ is the test-witness language itself.

## Comparison: dual to the work theorem

This is the dual classification of [restructure-as-visible-automorphism](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md): there, organizational restructurings that fix newly-designated operational cells are *cosmetic*; here, codebase transformations that fix newly-designated witness cells are *refactorings*. Both are particular cases of the substrate-algebraic distinction between cosmetic (in $N(v)$) and substantive (non-trivial in the visible quotient) automorphisms — the math is one theorem, with two specializations on different cell-systems.

The duality is exact: a "cosmetic reorg" of a working community and a "refactoring" of a codebase are *the same kind of substrate operation* on different settlings. The disciplinary literatures of each were developed independently (Fowler 1999 for refactoring; everyday HR practice for reorganization) and converge on the same substrate-algebraic structure when re-presented in the predication-categories framework.

## Where used

- [breaking-change-as-visible-automorphism](breaking-change-as-visible-automorphism.md) — the visible-quotient classification.
- [refactoring-closed-under-composition](refactoring-closed-under-composition.md) — corollary.
- [public-api-rename-is-substantive](public-api-rename-is-substantive.md) — application to a specific witness-language choice.
- [structure-preservation-as-substrate-algebra](../../documents/articles/teaching-articles/explanations/structure-preservation-as-substrate-algebra.md) — synthesis essay.
