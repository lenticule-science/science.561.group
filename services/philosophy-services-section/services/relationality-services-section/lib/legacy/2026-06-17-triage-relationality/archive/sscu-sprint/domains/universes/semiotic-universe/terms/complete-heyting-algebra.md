---

name: "Complete Heyting Algebra"
  - "complete Heyting algebra"
  - "complete heyting algebra"
date-created: 2025-12-31
introduces: term
tags: []
---

A complete [Heyting algebra](../../../../concepts/heyting-algebra/index.md) is a complete [lattice](../../../posets/terms/lattice.md) (H, ≤) equipped with binary meet (∧), binary join (∨), top (⊤), bottom (⊥), and an implication operation (⇒) satisfying the residuation law:

c ≤ (a ⇒ b) if and only if c ∧ a ≤ b

for all a, b, c ∈ H. Completeness means that meets and joins exist for all subsets, not just finite ones.

The residuation law defines the [Heyting implication](../../../../disciplines/logic/terms/heyting-implication.md): a ⇒ b is the largest element whose meet with a stays below b. This gives H an internal logic — the elements of H serve as truth values, and the [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations (∧, ∨, ⇒, ¬) provide the logical connectives. The logic is intuitionistic: the [law of excluded middle](../../../../../../../humanities/domains/philosophy/terms/law-of-excluded-middle.md) (a ∨ ¬a = ⊤) may fail, which means H can represent partial or constructive truth.

Every complete [Heyting algebra](../../../../concepts/heyting-algebra/index.md) is equivalently a frame (a complete [lattice](../../../posets/terms/lattice.md) where finite meets distribute over arbitrary joins) or a locale (the dual of a frame). This equivalence connects the algebraic structure to topology: the open sets of any topological space form a complete [Heyting algebra](../../../../concepts/heyting-algebra/index.md), and complete [Heyting algebras](../../../../concepts/heyting-algebra/index.md) generalize topological spaces to settings where points may not exist.

In the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe, H is the ambient semantic domain. All semantic objects live in H, all logical reasoning uses H's [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations, and the [modality](./modality.md) j and [trace comonad](./trace-comonad.md) G are endomorphisms on H that respect its algebraic structure. The choice of a complete [Heyting algebra](../../../../concepts/heyting-algebra/index.md) (rather than a [Boolean algebra](../../../../concepts/boolean-algebra/index.md)) ensures that the [semiotic](../../../../../linguistics/topics/semiotics/index.md) logic is constructive — distinctions must be witnessed, not merely asserted by [excluded middle](../../../../../../../humanities/domains/philosophy/terms/law-of-excluded-middle.md).
