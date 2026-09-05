---
title: "What Is Linear Logic?"
description: "An introduction to linear logic for readers who understand classical logic but haven't encountered resource-sensitive reasoning."
date-created: 2026-03-30
depends-on: []
introduces:
  - linear-logic
  - substructural-logic
type: concept-introduction
status: current
---
In classical logic, if you know $A$, you can use $A$ as many times as you want. You can also ignore it. Hypotheses are free, unlimited, and disposable.

Linear logic (Girard 1987) changes this: using a hypothesis **consumes** it. If you know $A$, you can use $A$ once. Using it a second time requires having a second copy.

This sounds restrictive, but it models something real. Money works this way: spending a dollar removes it from your possession. Actions work this way: performing an action uses the opportunity. Assertions in a multi-source knowledge system work this way: citing a source's claim as evidence uses that claim, and if two sources contradict, you cannot pretend one of them was never stated.

The key connectives of linear logic:

**Tensor** ($A \otimes B$): "I have both $A$ and $B$." Producing this requires producing both separately. It is a real conjunction, not a free one — you need both resources.

**Linear implication** ($A \multimap B$): "Consuming one $A$ produces one $B$." This is not classical implication (which is free to use). Using $A \multimap B$ uses up both the implication and the $A$.

**Of course** ($!A$): "As many copies of $A$ as needed." This is the escape hatch back to classical logic. Marking a hypothesis with $!$ makes it reusable. Classical logic is linear logic where everything is marked $!$.

Tensor and linear implication form an adjunction: $\otimes \dashv \multimap$. Combining resources (tensor) is adjoint to consuming one to produce another (linear implication). This is the same adjunction as product-and-implication in a residuated lattice, and the same as Lambek's product-and-residual in categorial grammar.

The connection to bilattices (Jakl 2025): the four-valued bilattice $\{\bot, t, f, \top\}$ is a model of linear logic. The "resources" are epistemic states. Extending a claim (tensor/fusion) combines epistemic content. Restricting by a claim (linear implication) tests against epistemic conditions. Affirming $t$ and denying $f$ the same assertion produces contestation $\top$ — the resources are consumed and the result is a contradiction. The evidence cannot be un-used.
