---
name: "Constructive Proof"
description: "A proof that establishes truth by directly exhibiting the required object or method — rather than by showing that its non-existence leads to contradiction."
date-created: 2026-03-05
aliases:
  - "constructive evidence"
  - "proof as construction"
keywords:
  - Logic
component-of: intuitionistic-logic
produces: witness
contrasts-with: proof-by-contradiction
tags:
  - logic
---

A constructive proof is a proof that establishes the truth of a proposition by directly exhibiting the required mathematical object or method, rather than by showing that its non-existence leads to contradiction. In intuitionistic logic, all proofs are constructive: to prove that something exists, you must produce it; to prove a disjunction, you must prove one of the disjuncts and say which.

The requirement for constructive proof is formalized in the Brouwer-Heyting-Kolmogorov (BHK) interpretation, which defines the meaning of each logical [connective](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/connective.md) in terms of proof obligations:

- A proof of A ∧ B is a pair: a proof of A and a proof of B.
- A proof of A ∨ B is a proof of A or a proof of B, together with a specification of which.
- A proof of A → B is a method that transforms any proof of A into a proof of B.
- A proof of ¬A is a method that transforms any proof of A into a proof of absurdity (⊥).
- There is no proof of ⊥.

This interpretation is what makes excluded middle fail: to prove A ∨ ¬A constructively, you would need either a proof of A or a method for deriving absurdity from any proof of A. For many propositions — particularly those about infinite mathematical structures — neither is available.

The philosophical significance of constructive proof extends beyond technical logic. Under the Curry-Howard correspondence, constructive proofs are programs: a proof of A → B is a function that takes inputs of type A and produces outputs of type B. Classical proofs, which may use excluded middle and double negation elimination, do not in general correspond to computable functions. The constructive requirement is thus not merely an aesthetic preference but a demand for computational content — the insistence that mathematical existence claims be backed by algorithms, not just consistency arguments.

[Brouwer](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/l-e-j-brouwer.md) motivated the requirement philosophically: mathematics is a mental construction, and a proof must correspond to an act the mind can perform. [Heyting](../../../../../../../../../../../../general/people/arend-heyting.md) formalized this, and the later development of realizability (Kleene) and type theory (Martin-Löf) gave the idea precise computational and foundational form.

## Related terms

- [Witness](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/witness.md) — the object that a constructive existence proof must produce
- [Decidability](../../../../../../../../../../content/text/glossary/terms/decidability.md) — when a proposition admits constructive excluded middle
- [Mathematical Constructivism](../../../../../../../analytic-philosophy-services-section/content/text/glossary/terms/mathematical-constructivism.md) — the philosophical tradition that demands constructive proof
- [Law of Excluded Middle](../../../../../../../analytic-philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) — the classical principle that constructive proof cannot generally validate
