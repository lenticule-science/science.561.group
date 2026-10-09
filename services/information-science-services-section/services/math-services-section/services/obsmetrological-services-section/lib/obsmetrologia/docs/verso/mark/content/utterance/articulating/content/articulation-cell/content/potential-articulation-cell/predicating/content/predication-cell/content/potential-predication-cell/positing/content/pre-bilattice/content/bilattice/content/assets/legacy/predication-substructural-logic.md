---

introduces: logic
description: "A family of logics that weaken or drop structural rules (contraction, weakening, exchange) of classical logic. Includes linear logic, relevance logic, and the Lambek calculus."
aliases: [substructural logics, substructural]
specialization: logic
structural-rules: [contraction, weakening, exchange]
algebraic-semantics: residuated-lattice
contraction-corresponds-to: idempotence
weakening-corresponds-to: integrality
exchange-corresponds-to: commutativity
dropping-all-gives: lambek-calculus
dropping-contraction-weakening-gives: linear-logic
dropping-contraction-gives: relevance-logic
reference: galatos-jipsen-kowalski-ono-2007
date-created: 2026-03-30
---

A substructural logic is a logic that restricts one or more of the structural rules assumed in classical logic:

- **Contraction** ($A, A \vdash B$ implies $A \vdash B$): a hypothesis can be used more than once. Dropping this gives resource sensitivity.
- **Weakening** ($A \vdash B$ implies $A, C \vdash B$): unused hypotheses are harmless. Dropping this gives relevance.
- **Exchange** ($A, B \vdash C$ implies $B, A \vdash C$): order doesn't matter. Dropping this gives non-commutativity.

[Linear logic](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/linear-logic.md) drops contraction and weakening: each hypothesis is used exactly once. The [Lambek calculus](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/lambek-calculus.md) drops all three: hypotheses are ordered, used exactly once, and cannot be reordered.

Galatos, Jipsen, Kowalski, & Ono (2007) proved that the algebraic semantics of substructural logics are [residuated lattices](../../algebra/objects/residuated-lattice.md). Each structural rule corresponds to an algebraic condition: contraction to idempotence of the product, weakening to integrality, exchange to commutativity.
