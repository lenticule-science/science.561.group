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
  - id: ref1
    type: document
    title: Johnstone, Stone Spaces, Cambridge University Press, 1982
requires:
  - ./formula.md
  - ./model.md
---

A proposition is a statement that is capable of being true or false. "It is raining" is a proposition. "2 + 2 = 4" is a proposition. "Close the door" is not — it is a command, not something that has a truth value. The concept is one of the oldest in logic: Aristotle defined it (as *apophansis*) in *De Interpretatione* as a sentence that can be affirmed or denied.

The key distinction is between a proposition and a [formula](./formula.md). A formula is a syntactic object — a string of symbols written according to grammatical rules. A proposition is what a formula *means* when interpreted in some context. The formula "$x > 5$" is not yet a proposition: its truth depends on what $x$ is. But when interpreted in a [model](../objects/model.md) — say, with $x$ assigned to 7 — it becomes the proposition "7 > 5," which is true. Formally, an interpretation of a language $\mathcal{L}$ in an algebra $H$ is a function $\llbracket - \rrbracket : \mathrm{Form}(\mathcal{L}) \to H$ that sends each formula to an element of $H$, and a proposition is an element in the image of that interpretation.

In classical logic, propositions live in a Boolean algebra — they are simply true or false, with no middle ground. Every proposition satisfies the law of excluded middle: $a \vee \neg a = \top$. This is the logic Gottlob Frege formalized in *Begriffsschrift* (1879) and that Bertrand Russell and Alfred North Whitehead developed systematically in *Principia Mathematica* (1910–1913). Frege distinguished sharply between *Sinn* (the thought a sentence expresses) and *Bedeutung* (its truth value), making the proposition — the objective thought, independent of who thinks it — the fundamental bearer of truth.

But classical logic is not the only option. In a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md) $H$, propositions are elements of $H$, where $\top$ represents full truth, $\bot$ represents falsity, and the partial order $a \leq b$ is read as "$a$ entails $b$." The [connectives](./connective.md) on propositions are the Heyting algebra operations: meet ($\wedge$) for conjunction, join ($\vee$) for disjunction, [implication](../morphisms/heyting-implication.md) ($\to$), and negation ($\neg a = a \to \bot$). In a Heyting algebra that is not Boolean, the law of excluded middle can fail — a proposition can be neither fully true nor fully false. This is the logic of constructive mathematics, where asserting something requires producing evidence, not merely ruling out its negation.

The most concrete example of non-Boolean propositions comes from topology. In the open-set [lattice](../../order/objects/lattice.md) $\mathcal{O}(X)$ of a topological space $X$, each open set is a proposition. Conjunction is intersection, disjunction is union, and negation is the interior of the complement. An open set $U$ can fail excluded middle: $U \cup \mathrm{int}(U^c) \neq X$ when the boundary of $U$ is nonempty. In a topos, propositions are global elements of the [subobject classifier](../../topology/objects/subobject-classifier.md) $\Omega$, which is a Heyting algebra encoding the topos's internal logic.
