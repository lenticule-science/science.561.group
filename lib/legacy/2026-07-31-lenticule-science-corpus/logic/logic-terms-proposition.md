---
title: "Proposition"
aliases:
  - "proposition"
  - "propositions"
date-created: 2025-12-26
type: definition
tags: []
mathematical-object: heyting-algebra
references:
  - "Johnstone, Stone Spaces, Cambridge University Press, 1982"
requires:
  - ./formula.md
  - ./model.md
---

Let $H$ be a [Heyting algebra](../../../concepts/heyting-algebra/index.md).

**Definition.** A *proposition* in $H$ is an element $a \in H$. The element $\top$ represents full truth, $\bot$ represents falsity, and the partial order $a \leq b$ is read as "$a$ entails $b$." The [connectives](./connective.md) on propositions are the Heyting algebra operations: meet ($\wedge$), join ($\vee$), [implication](./heyting-implication.md) ($\to$), and negation ($\neg a = a \to \bot$).

A proposition is distinguished from a [formula](./formula.md) by its semantic character. A formula is a syntactic object; a proposition is what a formula denotes when interpreted in a [model](./model.md). Formally, an interpretation of a formal language $\mathcal{L}$ in $H$ is a function $\llbracket - \rrbracket \colon \mathrm{Form}(\mathcal{L}) \to H$, and a proposition is any element in the image of such an interpretation.

**Proposition.** *The set of propositions of $H$ forms a bounded distributive [lattice](../../../objects/posets/terms/lattice.md) under $\wedge$ and $\vee$, with bounds $\bot$ and $\top$.*

*Proof sketch.* This is immediate from the definition of a Heyting algebra as a bounded lattice with implication. $\square$

**Proposition.** *In a Boolean algebra ($\neg\neg a = a$ for all $a$), every proposition is either $\top$ or $\bot$ in every prime filter. In a non-Boolean Heyting algebra, there exist propositions that are neither $\top$ nor $\bot$ in every prime filter.*

*Proof sketch.* Prime filters of a Boolean algebra are ultrafilters, which decide every element. In a non-Boolean Heyting algebra, there exist prime filters $\mathfrak{p}$ and elements $a$ such that neither $a \in \mathfrak{p}$ nor $\neg a \in \mathfrak{p}$. $\square$

**Examples.**

- In a Boolean algebra $B$, propositions are the elements of $B$, and the logic is classical: $a \vee \neg a = \top$ for all $a$.
- In the open-set [lattice](../../../objects/posets/terms/lattice.md) $\mathcal{O}(X)$ of a topological space $X$, propositions are open sets. The logic is [intuitionistic](../curricula/intuitionistic-logic.md): an open set $U$ with $U \vee \neg U = U \cup \mathrm{int}(U^c) \neq X$ witnesses the failure of excluded middle.
- In a topos, propositions are the global elements of the [subobject classifier](../../higher-topos-theory/terms/subobject-classifier.md) $\Omega$, which is a Heyting algebra encoding the topos's internal logic.
