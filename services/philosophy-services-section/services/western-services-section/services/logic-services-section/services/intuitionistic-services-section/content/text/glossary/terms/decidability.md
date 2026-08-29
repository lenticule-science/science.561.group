---
title: "Decidability"
description: "The property of a proposition for which a constructive method exists to determine whether it holds or its negation holds — the boundary where classical and intuitionistic logic agree."
date-created: 2026-03-05T00:00:00
type: term
aliases:
  - "decidability"
  - "decidable proposition"
  - "decidable"
keywords:
  - Logic
defines:
  - "Decidability"
  - "decidable proposition"
  - "decidable"
requires: constructive-proof
restricts: law-of-excluded-middle
---

A proposition P is decidable when there exists a constructive method for determining whether P holds or ¬P holds — that is, when P ∨ ¬P can be proved constructively. In intuitionistic logic, excluded middle does not hold in general, but it does hold for decidable propositions. Decidability marks the boundary between the territory where classical and intuitionistic logic agree and the territory where they diverge.

Finite domains are paradigmatically decidable. If P is a property of natural numbers and the domain is finite, then one can in principle check each element and determine whether P holds or fails. For infinite domains, decidability becomes the exception rather than the rule. The proposition "every even number greater than 2 is the sum of two primes" (Goldbach's conjecture) is currently neither proved nor refuted. The intuitionist refuses to assert that it is true or false in advance of a proof or refutation; the classicist asserts this on the strength of [bivalence](../../../../../classical-services-section/content/text/glossary/terms/bivalence.md) alone.

The computational reading makes decidability precise. A proposition is decidable when there exists an algorithm that, given any instance, halts and returns either "yes" or "no." The halting problem — whether a given Turing machine halts on a given input — is the canonical example of an undecidable proposition. No algorithm exists that correctly answers this question for all inputs. Under the BHK interpretation, this means there is no constructive proof of the relevant instance of excluded middle.

Decidability is not an all-or-nothing property of a logic but a property of individual propositions within a logic. Intuitionistic logic is the logic that takes this seriously: rather than assuming excluded middle universally and treating all propositions as decidable, it requires decidability to be proved case by case. Propositions about finite structures, equality of natural numbers, and membership in recursive sets are decidable. Propositions about arbitrary real numbers, arbitrary functions, or halting behavior are generally not.

## Related terms

- [Constructive proof](./constructive-proof.md) — the standard of evidence that decidability requires
- [Witness](./witness.md) — constructive decidability provides a witness for which disjunct holds
- [Law of Excluded Middle](../../../../../../../analytic-philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) — holds for decidable propositions, fails for undecidable ones
- [Bivalence](../../../../../classical-services-section/content/text/glossary/terms/bivalence.md) — the classical principle that treats all propositions as decidable in advance
