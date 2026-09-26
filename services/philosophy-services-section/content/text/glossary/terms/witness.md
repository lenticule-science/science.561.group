---
name: "Witness"
description: "A specific object that satisfies an existential claim — in intuitionistic logic, to prove something exists you must produce the object itself, not merely show its non-existence is impossible."
date-created: 2026-03-05
aliases:
  - "witness"
  - "witness (logic)"
  - "constructive witness"
keywords:
  - Logic
produced-by: constructive-proof
title: "Witness"
tags:
  - logic
defines:
  - "Witness"
  - "witness (logic)"
  - "constructive witness"
---

A witness is a specific object that satisfies an existential claim. In intuitionistic logic, to prove ∃x.P(x) one must produce a particular object a together with a proof that P(a) holds. The object a is the witness. This contrasts with classical logic, where ∃x.P(x) can be proved indirectly — by assuming ∀x.¬P(x) and deriving a contradiction — without ever identifying the object in question.

The demand for witnesses is a direct consequence of the BHK interpretation: a proof of ∃x.P(x) is a pair (a, p) where a is an element of the domain and p is a proof that P(a). Without a, there is no proof, no matter how compelling the indirect argument.

This requirement has philosophical force. A classical proof that "there exists a real number with property Q" may proceed entirely by contradiction, establishing that the non-existence of such a number is impossible. The intuitionist objects: you have shown that something exists without showing what it is. The proof asserts a fact about mathematical reality without providing the means to access it. For the intuitionist, this is not a proof at all — it is an argument that a proof should exist.

The computational reading sharpens the point. Under the Curry-Howard correspondence, a proof of ∃x.P(x) is a program that computes the pair (a, p). A classical non-constructive proof corresponds to no such program. The witness requirement is therefore also an effectiveness requirement: existence claims must be backed by algorithms.

In [model](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/model.md) theory, a witness is any element that satisfies a formula in a given structure. This classical use of "witness" is weaker than the constructive one: it requires only that the object exist in the model, not that it be constructively produced.

## Related terms

- [Constructive proof](./constructive-proof.md) — the proof method that requires witnesses for existence claims
- [Decidability](./decidability.md) — when the witness or its absence can always be constructively determined
- [Provenness](provenness.md) — the epistemic status that witnessing confers
