---
title: "Independence"
aliases:
  - "independence"
  - "independent"
  - "independent events"
date-created: 2026-01-01
type: term
tags: []
---

Two [events](./event.md) A and B are independent if the occurrence of one does not affect the [probability](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/probability.md) of the other: P(A ∩ B) = P(A) · P(B). Equivalently, [conditional probability](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/conditional-probability.md) is trivial: P(A | B) = P(A) and P(B | A) = P(B). Independence means that knowing B occurred gives no information about whether A occurred.

Independence is symmetric (if A is independent of B, then B is independent of A) but not transitive. It is distinct from mutual exclusivity: mutually exclusive events (A ∩ B = ∅) are strongly dependent — knowing one occurred tells you the other did not. Pairwise independence of several events does not imply mutual independence; the latter requires P(A₁ ∩ A₂ ∩ ... ∩ Aₙ) = P(A₁) · P(A₂) · ... · P(Aₙ) for every subcollection.

Random variables X and Y are independent if every event defined through X is independent of every event defined through Y. Independence of random variables is the foundation of classical statistics: it justifies using the [sample](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/sample.md) to draw conclusions about the [population](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/population.md), and it underlies the law of large numbers and the central limit theorem.
