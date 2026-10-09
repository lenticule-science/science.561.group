---
name: "Linear Logic"
description: "A substructural logic in which hypotheses are resources: tensor combines resources, linear implication consumes one resource to produce another, and reuse requires an explicit exponential modality."
aliases:
  - "linear logic"
  - "linear logics"
date-created: 2026-03-30
term-kind: concept
specialization: substructural-logic
fundamental-adjunction: "⊗ ⊣ ⊸"
algebraic-semantics: residuated-lattice
categorical-semantics: star-autonomous-category
structural-rules-dropped:
  - contraction
  - weakening
---

Linear logic, introduced by Girard (1987), treats assumptions as resources rather than freely reusable truth-preserving premises. A hypothesis may be used once; duplicating or discarding it requires an explicit structural permission.

Its multiplicative connectives include tensor ($A \otimes B$), which combines resources, and linear implication ($A \multimap B$), which consumes an $A$ resource to produce a $B$ resource. They form the adjunction $\otimes \dashv \multimap$. Par ($\parr$) is the multiplicative dual of tensor. The exponential $!A$ marks a resource as reusable and thereby recovers classical behavior locally.

Linear logic drops contraction (free duplication) and weakening (free disposal). Its algebraic semantics are residuated structures; categorically, its models include star-autonomous categories. The resource discipline makes it suitable for state transitions, concurrent processes, and interactive computation: proofs normalize as computations, and a state proposition consumed by a rule is not silently left available for a second use.

In the bilattice-valued setting represented by the Chu construction, tensor corresponds to fusion ($\odot$) and linear implication to the corresponding residual ($\Rightarrow$). Conflicting epistemic resources can therefore be combined into a represented contest rather than erased.
