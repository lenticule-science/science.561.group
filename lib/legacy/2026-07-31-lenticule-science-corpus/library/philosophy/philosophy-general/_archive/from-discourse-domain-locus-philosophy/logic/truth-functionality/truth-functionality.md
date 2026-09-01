---

title: "Truth-Functionality"
description: "The property of a connective whose compound truth value is determined entirely by the truth values of its components — the semantic backbone of classical propositional logic."
date-created: 2026-03-05T00:00:00
aliases:
  - "truth-functionality"
  - "truth-functional"
  - "truth-functional connective"
keywords:
  - logic
requires: bivalence
component-of: classical-logic
verifies: tautology
---

A [connective](../../../../../../../../../humanities/theories/math/theories/logic/terms/connective.md) is truth-functional when the truth value of the compound it forms is determined entirely by the truth values of its components. Classical propositional logic is truth-functional throughout: knowing the truth values of A and B suffices to determine the truth values of A ∧ B, A ∨ B, A → B, and ¬A. This property is what makes truth tables possible and is the semantic backbone of classical [propositional logic](../../../../../../../../../humanities/theories/math/theories/logic/texts/propositional-logic.md).

Truth-functionality depends on [bivalence](./bivalence.md). If propositions can take more than two values — or if their truth value depends on context, time, possible worlds, or epistemic state — then the simple input-output picture breaks down. Modal operators (necessarily, possibly) are the paradigm of non-truth-functional connectives: knowing that A is true does not tell you whether "necessarily A" is true, because that depends on what happens at other possible worlds.

In [intuitionistic logic](../../intuitionistic/_index.md), the connectives are not truth-functional in the classical sense. The [Heyting implication](../../../../../../../../../humanities/theories/math/theories/logic/terms/heyting-implication.md) A → B is not determined by the truth values of A and B alone; it encodes the existence of a constructive method for transforming proofs of A into proofs of B. The BHK interpretation replaces truth-value inputs with proof-construction inputs, and the "output" is not a truth value but a proof obligation. This is one of the deepest divergences between classical and [intuitionistic](../../intuitionistic/_index.md) logic: classical logic computes with truth values, intuitionistic logic computes with proofs.