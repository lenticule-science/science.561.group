---
title: "Substructural Logic"
description: "A family of logics that restricts contraction, weakening, or exchange instead of treating them as invisible structural rules."
aliases:
  - "substructural logic"
  - "substructural logics"
date-created: 2026-03-30
type: term
term-kind: concept
algebraic-semantics: residuated-lattice
source-snapshot: 2026-08-17-windows-561-group
source-variants:
  - substructural-logic/flowif-substructural-logic.md
  - substructural-logic/research-substructural-logic.md
---

Substructural logics vary the structural rules governing hypotheses:

- **Contraction** permits $A,A \vdash B$ to be reduced to $A \vdash B$; dropping it makes duplication explicit and yields resource sensitivity.
- **Weakening** permits $A \vdash B$ to become $A,C \vdash B$; dropping it makes unused assumptions matter.
- **Exchange** permits $A,B \vdash C$ to become $B,A \vdash C$; dropping it makes order matter.

Linear logic drops contraction and weakening. The Lambek calculus drops all three, so resources are ordered, used once, and not disposable. Relevance logics commonly retain exchange while dropping contraction. Galatos, Jipsen, Kowalski, and Ono (2007) identify residuated lattices as the algebraic semantics of this family: contraction corresponds to idempotence, weakening to integrality, and exchange to commutativity of the product.
