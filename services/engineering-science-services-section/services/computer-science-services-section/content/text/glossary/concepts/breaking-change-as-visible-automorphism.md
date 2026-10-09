---
type: theorem
status: draft
depends-on: [refactor-as-invisible-automorphism, visible-automorphism-quotient]
title: Breaking change as visible automorphism
description: "The dual classification: a breaking change under witness language $W$ is a non-trivial element of the visible automorphism quotient $\\mathrm{Aut}^{\\mathrm{vis}}W(v^{\\mathrm{code}}) = \\mathrm{Aut}^\\simeq(v^{\\mathrm{code}}) /…"
---

# Breaking change as visible automorphism

The dual classification: a *breaking change* under witness language $W$ is a non-trivial element of the visible automorphism quotient $\mathrm{Aut}^{\mathrm{vis}}_W(v^{\mathrm{code}}) = \mathrm{Aut}^\simeq(v^{\mathrm{code}}) / N_W(v^{\mathrm{code}})$.

## Statement

Let $v^{\mathrm{code}}$ be a codebase settling and $W$ a witness language. A transformation $\phi \in \mathrm{Aut}^\simeq(v^{\mathrm{code}})$ is a **breaking change** under $W$ iff its image in $\mathrm{Aut}^{\mathrm{vis}}_W(v^{\mathrm{code}})$ is non-trivial.

**Theorem.** *The breaking changes under $W$ are exactly the codebase-automorphisms $\phi$ whose action on $\mathcal{F}^{\mathrm{code}}_W$ is non-trivial. Every codebase-automorphism is either a [refactoring](refactor-as-invisible-automorphism.md) under $W$ or a breaking change under $W$, and these classes partition $\mathrm{Aut}^\simeq(v^{\mathrm{code}})$ into a normal subgroup and its non-trivial cosets.*

## What this proves about disciplinary practice

**(a) Refactor-vs-breaking-change is a clean dichotomy at the substrate level.** Every codebase-automorphism is exactly one of the two. The everyday confusion ("is this a refactor or a breaking change?") is the substrate-algebraic question of which side of the kernel $\phi$ lands on, and is decidable from the action on $\mathcal{F}^{\mathrm{code}}_W$.

**(b) Breaking changes form a coset structure, not a subgroup.** The set of breaking changes is *not* closed under composition — a breaking change composed with its inverse is a refactoring (the identity). What is closed is the *cosets* of $N_W$: each non-trivial coset is a "breaking change of type $X$," and composing within a coset stays in the same coset. Composing across cosets follows the multiplication rule in the quotient group $\mathrm{Aut}^{\mathrm{vis}}_W$.

**(c) Communicated semantic versioning is the cohomology of $\mathrm{Aut}^{\mathrm{vis}}_W$.** A version-bump declaration ("this is a major change," "this is a minor change") is a coarse classification of which coset of $N_W$ a release sits in. The substrate's $H^\bullet(\mathrm{Aut}^{\mathrm{vis}}_W; \mathbb{Z})$ is the structurally-correct version graph; SemVer is one (coarse) reading of it.

## Comparison: substantive restructuring of a working community

Parallel to [restructure-as-visible-automorphism](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md): a "substantive reorg" of a working community and a "breaking change" to a codebase are the same kind of substrate operation on different settlings. The communities and codebases that admit large visible-automorphism quotients are the ones for which substantive change is *frequently possible without consensus*; the rigid-moduli cases (small or trivial quotient) admit a small repertoire of substantive changes.

## Where used

- [public-api-rename-is-substantive](public-api-rename-is-substantive.md) — a particular breaking-change classification.
- The [structure-preservation-as-substrate-algebra](../../documents/articles/teaching-articles/explanations/structure-preservation-as-substrate-algebra.md) narrative.
