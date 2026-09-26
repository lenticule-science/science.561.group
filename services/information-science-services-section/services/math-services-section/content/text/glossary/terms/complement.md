---

description: "An element ¬a such that a ∧ ¬a = ⊥ and a ∨ ¬a = ⊤. Every element of a Boolean algebra has a complement; in a Heyting algebra only the pseudocomplement ¬a = a → ⊥ exists in general. Neither is the framework negation, which is the evidence swap ~."
aliases: [ complement, complements, complementation, complemented, Complement, pseudocomplement, pseudo-complement, Heyting complement, intuitionistic negation, weak negation, negate (act) ]
applies-to: [bounded-lattice, boolean-algebra]
contrasts-with: negation
date-created: 2026-03-31

---

In a bounded [lattice](./lattice.md), the complement of an element $a$ is an element $\neg a$ satisfying:

$$a \wedge \neg a = \bot \qquad a \vee \neg a = \top$$

The meet gives non-contradiction: $a$ and its complement have nothing in common. The join gives excluded middle: between them, $a$ and $\neg a$ cover everything.

In a [Boolean algebra](./boolean-algebra.md), every element has a unique complement, and $\neg\neg a = a$. In a [Heyting algebra](./heyting-algebra.md), the pseudo-complement $\neg a = a \to \bot$ exists but may not satisfy excluded middle: $a \vee \neg a = \top$ can fail. This is the algebraic gap between classical and constructive logic.

Complementation is different from negation on a [bilattice](./bilattice.md). Negation $\mathord{\sim}$ on the four-valued bilattice swaps $t \leftrightarrow f$ and fixes $\bot, \top$. It is an [involution](./involution.md) ($\mathord{\sim}\mathord{\sim} a = a$) but it is not a complement in the truth lattice, whose bottom is $f$ and top is $t$: $\bot \wedge_t \mathord{\sim}\bot = \bot \neq f$ and $\bot \vee_t \mathord{\sim}\bot = \bot \neq t$. The truth-lattice complement is $\mathord{\sim}$ composed with [conflation](./conflation.md), which also exchanges $\bot$ and $\top$. Bilattice negation reverses truth; it does not produce the lattice-theoretic complement.

## The pseudocomplement is not negation

The literature calls the pseudocomplement $\neg a = a \to \bot$ intuitionistic or weak negation. In this knowledge base it is always called the **pseudocomplement**, and "negation" is kept for the [evidence swap](./negation.md) $\sim$ (Nelson's strong negation). The pseudocomplement is the strongest element incompatible with $a$: what a distinction leaves unmarked. It satisfies $a \leq \neg\neg a$ and not the converse, so it is not an involution, and $\neg\neg$ is a [nucleus](./nucleus.md), the double-negation nucleus.

Older notes give the pseudocomplement other names:

- The acts derivation calls it *Negate* (act 131, `Negate = ImplyRecognition GroundRecognition`: "not a" encoded as "a implies Ground Recognition"). *Negate Recognition* is the same operation on the recognition lattice.
- Movement I calls it "negation as orthogonality": the largest subobject disjoint from $a$.
- The early philosophy glossary asked whether negation is "exclusion of true in the result of a predicate".

Relationality's name for it is [unrelating](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/unrelating.md). On the residuated twist product the two operations are implication into different targets. The residuum is $\langle x, y \rangle \Rightarrow \langle z, v \rangle = \langle (x \to z) \wedge (v \to y),\ x v \rangle$. Its unit is told-both $\langle 1, 1 \rangle$, and implication into that unit is negation: $\langle x, y \rangle \Rightarrow \langle 1, 1 \rangle = \langle y, x \rangle = \mathord{\sim}\langle x, y \rangle$. Implication into told-false $\langle 0, 1 \rangle$ gives $\langle \neg x \wedge y,\ x \rangle$ instead, which uses the base pseudocomplement $\neg x$ and is not an involution.
