---
name: "Truth-Functionality"
description: "The property of a connective whose compound truth value is determined entirely by the truth values of its components — the semantic backbone of classical propositional logic."
date-created: 2026-03-05
aliases:
  - "truth-functionality"
  - "truth-functional"
  - "truth-functional connective"
keywords:
  - Logic
requires: bivalence
component-of: classical-logic
verifies: tautology
tags:
  - logic
defines:
  - "Truth-functionality"
  - "truth-functional"
  - "truth-functional connective"
---

A [connective](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/connective.md) is truth-functional when the truth value of the compound it forms is determined entirely by the truth values of its components. Classical propositional logic is truth-functional throughout: knowing the truth values of A and B suffices to determine the truth values of A ∧ B, A ∨ B, A → B, and ¬A. This property is what makes truth tables possible and is the semantic backbone of classical [propositional logic](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/teaching-articles/explanations/propositional-logic.md).

Truth-functionality depends on [bivalence](../../../../../../../../../../content/text/glossary/terms/bivalence.md). If propositions can take more than two values — or if their truth value depends on context, time, possible worlds, or epistemic state — then the simple input-output picture breaks down. Modal operators (necessarily, possibly) are the paradigm of non-truth-functional connectives: knowing that A is true does not tell you whether "necessarily A" is true, because that depends on what happens at other possible worlds.

In [intuitionistic logic](../../../../../../../../../../content/text/intuitionistic/index.md), the connectives are not truth-functional in the classical sense. The [Heyting implication](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/heyting-implication.md) A → B is not determined by the truth values of A and B alone; it encodes the existence of a constructive method for transforming proofs of A into proofs of B. The BHK interpretation replaces truth-value inputs with proof-construction inputs, and the "output" is not a truth value but a proof obligation. This is one of the deepest divergences between classical and [intuitionistic](../../../../../../../../../../content/text/intuitionistic/index.md) logic: classical logic computes with truth values, intuitionistic logic computes with proofs.

## Related terms

- [Bivalence](../../../../../../../../../../content/text/glossary/terms/bivalence.md) — the semantic prerequisite for classical truth-functionality
- [Connective](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/connective.md) — the formal objects that are or are not truth-functional
- [Heyting Implication](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/heyting-implication.md) — the intuitionistic replacement that is not truth-functional
- [Modal Logic](../../../../../../../../../../../../mathematics/disciplines/modal-logic/index.md) — the paradigmatic extension of classical logic with non-truth-functional operators
