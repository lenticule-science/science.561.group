---

title: "Probability"
description: "Probability is a way of assigning numbers to uncertain outcomes so that the numbers behave consistently. You flip a coin: you do not know whether it will land heads, but you can say the chance is $1/2$. You roll a die: the chance of any particular face is $1/6$. Probability gives these intuitions a precise mathematical form."
aliases:
  - "probability"
  - "probability measure"
date-created: 2026-01-01
tags: []
---

Probability is a way of assigning numbers to uncertain outcomes so that the numbers behave consistently. You flip a coin: you do not know whether it will land heads, but you can say the chance is $1/2$. You roll a die: the chance of any particular face is $1/6$. Probability gives these intuitions a precise mathematical form.

The modern formalization rests on three axioms laid down by Andrey Nikolaevich Kolmogorov in *Grundbegriffe der Wahrscheinlichkeitsrechnung* (1933). Start with a [sample space](../objects/sample-space.md) $\Omega$ — the set of all possible outcomes. Certain subsets of $\Omega$ are designated as [events](../objects/event.md) (technically, they form a σ-algebra). A probability is a [function](../../../morphisms/function.md) $P$ that assigns a number to each event, satisfying: (1) $P(A) \geq 0$ for every event $A$; (2) $P(\Omega) = 1$; and (3) if $A_1, A_2, \ldots$ are mutually exclusive events, then $P(A_1 \cup A_2 \cup \cdots) = P(A_1) + P(A_2) + \cdots$. Everything else in probability theory — [conditional probability](./conditional-probability.md), [independence](./independence.md), [distributions](../objects/distribution.md), the law of large numbers, the central limit theorem — follows from these three axioms.

The axioms tell you how probability must behave, but they do not tell you what the numbers *mean*. This question has generated centuries of argument. The classical answer, formulated by Pierre-Simon Laplace in *Théorie analytique des probabilités* (1812), is that probability counts equally likely outcomes: the chance of heads is $1/2$ because there are two equally likely outcomes and one is heads. This works beautifully for symmetric situations like coins and dice, but breaks down when outcomes are not obviously equally likely.

The frequentist interpretation says that $P(A) = 0.3$ means that if you repeated the experiment many times, event $A$ would occur in about 30% of the trials. Jacob Bernoulli proved in *Ars Conjectandi* (1713) that this long-run convergence actually happens — the law of large numbers guarantees it. The frequentist tradition was developed rigorously by John Venn in *The Logic of Chance* (1866) and Richard von Mises in *Probability, Statistics and Truth* (1928).

The Bayesian interpretation says that probability expresses a degree of belief. When a doctor says a patient has a 70% chance of recovery, she is not imagining infinite repetitions of the patient's illness — she is quantifying her uncertainty given the available evidence. Thomas Bayes laid the mathematical foundation in *An Essay towards solving a Problem in the Doctrine of Chances* (published posthumously in 1763), showing how to update probabilities in light of new evidence. Frank Plumpton Ramsey argued in *Truth and Probability* (1926) that rational degrees of belief must obey the probability axioms, and Bruno de Finetti developed a full subjective probability program in *La prévision: ses lois logiques, ses sources subjectives* (1937).

What matters mathematically is that all three interpretations use the same axioms. The theorems of probability theory do not depend on which interpretation you prefer — they follow from Kolmogorov's three rules alone. This is what makes probability a branch of mathematics rather than philosophy: the axioms are shared ground.

Probability connects to the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe through the logic of partial information. In a [Heyting algebra](../../../objects/universes/semiotic-universe/terms/complete-heyting-algebra.md), truth values range between $\bot$ (false) and $\top$ (true), and the ordering expresses entailment. A probability measure is a different way of grading truth: rather than a [lattice](../../order/objects/lattice.md) ordering, it assigns a real number that respects the algebraic structure of events through additivity.
