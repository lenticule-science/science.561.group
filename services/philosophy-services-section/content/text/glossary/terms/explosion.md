---
name: "Explosion"
description: "The classical principle that from a contradiction, any proposition whatsoever can be derived — making inconsistency catastrophic. Paraconsistent logic is defined by rejecting this."
date-created: 2026-03-05
aliases:
  - "explosion"
  - "ex falso quodlibet"
  - "principle of explosion"
  - "ex contradictione quodlibet"
keywords:
  - Logic
component-of: classical-logic
inverse-of: paraconsistent-logic
tags:
  - logic
defines:
  - "Explosion"
  - "explosion"
  - "ex falso quodlibet"
  - "principle of explosion"
---

Explosion (ex falso quodlibet, "from the false, anything follows") is the principle of [classical logic](../../classical/index.md) that from a contradiction, any proposition whatsoever can be derived. If both A and ¬A hold, then for any B, the following argument is valid: from A, derive A ∨ B by disjunction introduction; from ¬A and A ∨ B, derive B by disjunctive syllogism. This means that any inconsistent classical theory is trivial — it proves everything.

The philosophical force of explosion is that it makes consistency the price of rationality. A classical logician who discovers a contradiction in a theory must reject something in the theory or accept that the theory is worthless (it proves everything and therefore distinguishes nothing). There is no middle ground: inconsistency is catastrophe.

Paraconsistent logic rejects this. The defining feature of a paraconsistent logic is that the inference from {A, ¬A} to B is not valid. Contradiction is localized: that A and ¬A both hold tells you something about A, but it does not license conclusions about unrelated proposition B. The mechanism for blocking explosion varies across paraconsistent systems. In Priest's LP (Logic of Paradox), the three-valued semantics allow a proposition to be both true and false (a [dialetheia](./dialetheia.md)) without this "both" value propagating to all propositions. In Belnap's four-valued logic, "both true and false" is a distinct epistemic state that coexists with "true," "false," and "neither."

The rejection of explosion does not mean that contradictions are harmless or desirable. It means that the logical system can reason about contradictions without collapsing — that the discovery of an inconsistency is a problem to be investigated, not a trigger that destroys the entire inferential structure.

## Related terms

- [Dialetheia](./dialetheia.md) — a true contradiction; the concept that requires explosion to fail if it is to be non-trivially assertible
- [Bivalence](bivalence.md) — the classical principle that admits only two truth values; paraconsistent logics often extend beyond two
- [Law of Excluded Middle](../../../../services/western-services-section/services/analytic-philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) — retained in some paraconsistent logics (LP), rejected in others
