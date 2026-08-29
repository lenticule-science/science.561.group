---
title: "Proposition"
description: "A proposition is a statement that is capable of being true or false. \"It is raining\" is a proposition. \"2 + 2 = 4\" is a proposition. \"Close the door\" is not — it is a command, not something that has a truth value. The concept is one of the oldest in logic: Aristotle defined it (as *apophansis*) in *De Interpretatione* as a sentence that can be affirmed or denied."
aliases:
  - "proposition"
  - "propositions"
date-created: 2025-12-26
introduces: definition
tags: []
mathematical-object: heyting-algebra
references:
  ref1:
    title: "Johnstone, Stone Spaces, Cambridge University Press, 1982"
requires:
  - ./formula.md
  - ./model.md
defines:
  - "Proposition"
  - "propositions"
type: term
term-kind: definition
---

A proposition is a statement that is capable of being true or false. "It is raining" is a proposition. "2 + 2 = 4" is a proposition. "Close the door" is not — it is a command, not something that has a truth value. The concept is one of the oldest in logic: Aristotle defined it (as *apophansis*) in *De Interpretatione* as a sentence that can be affirmed or denied.

The key distinction is between a proposition and a [formula](./formula.md). A formula is a syntactic object — a string of symbols written according to grammatical rules. A proposition is what a formula *means* when interpreted in some context. The formula "$x > 5$" is not yet a proposition: its truth depends on what $x$ is. But when interpreted in a [model](./model.md) — say, with $x$ assigned to 7 — it becomes the proposition "7 > 5," which is true. Formally, an interpretation of a language $\mathcal{L}$ in an algebra $H$ is a function $\llbracket - \rrbracket : \mathrm{Form}(\mathcal{L}) \to H$ that sends each formula to an element of $H$, and a proposition is an element in the image of that interpretation.

In classical logic, propositions live in a Boolean algebra — they are simply true or false, with no middle ground. Every proposition satisfies the law of excluded middle: $a \vee \neg a = \top$. This is the logic Gottlob Frege formalized in *Begriffsschrift* (1879) and that Bertrand Russell and Alfred North Whitehead developed systematically in *Principia Mathematica* (1910–1913). Frege distinguished sharply between *Sinn* (the thought a sentence expresses) and *Bedeutung* (its truth value), making the proposition — the objective thought, independent of who thinks it — the fundamental bearer of truth.

But classical logic is not the only option. In a [Heyting algebra](./heyting-algebra.md) $H$, propositions are elements of $H$, where $\top$ represents full truth, $\bot$ represents falsity, and the partial order $a \leq b$ is read as "$a$ entails $b$." The [connectives](./connective.md) on propositions are the Heyting algebra operations: meet ($\wedge$) for conjunction, join ($\vee$) for disjunction, [implication](./heyting-implication.md) ($\to$), and negation ($\neg a = a \to \bot$). In a Heyting algebra that is not Boolean, the law of excluded middle can fail — a proposition can be neither fully true nor fully false. This is the logic of constructive mathematics, where asserting something requires producing evidence, not merely ruling out its negation.

The most concrete example of non-Boolean propositions comes from topology. In the open-set [lattice](./lattice.md) $\mathcal{O}(X)$ of a topological space $X$, each open set is a proposition. Conjunction is intersection, disjunction is union, and negation is the interior of the complement. An open set $U$ can fail excluded middle: $U \cup \mathrm{int}(U^c) \neq X$ when the boundary of $U$ is nonempty. In a topos, propositions are global elements of the [subobject classifier](./subobject-classifier.md) $\Omega$, which is a Heyting algebra encoding the topos's internal logic.

## Additional material from the Google Drive library

Let $H$ be a [Heyting algebra](./heyting-algebra.md).

**Definition.** A *proposition* in $H$ is an element $a \in H$. The element $\top$ represents full truth, $\bot$ represents falsity, and the partial order $a \leq b$ is read as "$a$ entails $b$." The [connectives](./connective.md) on propositions are the Heyting algebra operations: meet ($\wedge$), join ($\vee$), [implication](./heyting-implication.md) ($\to$), and negation ($\neg a = a \to \bot$).

A proposition is distinguished from a [formula](./formula.md) by its semantic character. A formula is a syntactic object; a proposition is what a formula denotes when interpreted in a [model](./model.md). Formally, an interpretation of a formal language $\mathcal{L}$ in $H$ is a function $\llbracket - \rrbracket \colon \mathrm{Form}(\mathcal{L}) \to H$, and a proposition is any element in the image of such an interpretation.

**Proposition.** *The set of propositions of $H$ forms a bounded distributive [lattice](./lattice.md) under $\wedge$ and $\vee$, with bounds $\bot$ and $\top$.*

*Proof sketch.* This is immediate from the definition of a Heyting algebra as a bounded lattice with implication. $\square$

**Proposition.** *In a Boolean algebra ($\neg\neg a = a$ for all $a$), every proposition is either $\top$ or $\bot$ in every prime filter. In a non-Boolean Heyting algebra, there exist propositions that are neither $\top$ nor $\bot$ in every prime filter.*

*Proof sketch.* Prime filters of a Boolean algebra are ultrafilters, which decide every element. In a non-Boolean Heyting algebra, there exist prime filters $\mathfrak{p}$ and elements $a$ such that neither $a \in \mathfrak{p}$ nor $\neg a \in \mathfrak{p}$. $\square$

**Examples.**

- In a Boolean algebra $B$, propositions are the elements of $B$, and the logic is classical: $a \vee \neg a = \top$ for all $a$.
- In the open-set [lattice](./lattice.md) $\mathcal{O}(X)$ of a topological space $X$, propositions are open sets. The logic is [intuitionistic](../../documents/articles/teaching-articles/explanations/intuitionistic-logic.md): an open set $U$ with $U \vee \neg U = U \cup \mathrm{int}(U^c) \neq X$ witnesses the failure of excluded middle.
- In a topos, propositions are the global elements of the [subobject classifier](./subobject-classifier.md) $\Omega$, which is a Heyting algebra encoding the topos's internal logic.
