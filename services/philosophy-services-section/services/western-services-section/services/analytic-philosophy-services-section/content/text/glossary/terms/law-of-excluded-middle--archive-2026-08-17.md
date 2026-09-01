---

name: "Law of Excluded Middle"
description: "The principle that for any proposition P, either P is true or ¬P is true — rejected by constructivism and intuitionistic logic for infinite domains."
date-created: 2026-03-03T00:00:00
aliases:
  - "law of excluded middle"
  - "excluded middle"
  - "tertium non datur"
  - "LEM"
tags: []
tradition: classical-logic
date-modified: 2026-03-09
part-of: philosophy/disciplines/analytic-philosophy/terms
component-of: classical-logic
requires: bivalence
contrasts-with: [constructive-proof, intuitionistic-logic]
enables: proof-by-contradiction
---

The law of excluded middle (*tertium non datur*: no third is given) states that for any proposition P, either P is true or its negation ¬P is true — there is no middle ground. In classical logic, this is an axiom: every proposition is either true or false, and no other status is possible. It underwrites proof by contradiction (to prove P, assume ¬P and derive a contradiction) and the classical treatment of disjunction (A ∨ ¬A is always true).

[Mathematical constructivism](./mathematical-constructivism.md) and [intuitionistic logic](../../../../../../../../humanities/domains/math/domains/logic/texts/intuitionistic-logic.md) reject this principle for infinite domains. [L. E. J. Brouwer](../../../../../../../../../references/people/l-e-j-brouwer.md) argued that to assert P ∨ ¬P is to claim that one possesses either a proof of P or a proof of ¬P — but for many mathematical propositions (e.g., whether a particular infinite decimal expansion contains a certain digit), neither proof is available. The law of excluded middle, applied indiscriminately, asserts the existence of knowledge that has not been constructed. Intuitionistic logic replaces it with a constructive interpretation of disjunction: A ∨ B is provable only when A is provable or B is provable (and we know which).

The rejection of the law of excluded middle produces a weaker but more nuanced logic. In classical logic, double negation elimination holds (¬¬P implies P); in [intuitionistic logic](../../../../../../../../humanities/domains/math/domains/logic/texts/intuitionistic-logic.md), it does not — knowing that the denial of P leads to contradiction does not provide a construction of P. This distinction matters when logic is interpreted computationally: under the Curry-Howard correspondence, an intuitionistic proof of P is a program that computes a witness for P, and there is no general program that transforms the absence of a counterexample into the presence of an example.

For this research program, the rejection of the law of excluded middle is not a technical restriction but a philosophical commitment. The [semiotic universe](../../mathematics/objects/universes/semiotic-universe/index.md) is built on [Heyting algebras](../../mathematics/concepts/heyting-algebra/index.md) (the algebraic semantics of [intuitionistic logic](../../../../../../../../humanities/domains/math/domains/logic/texts/intuitionistic-logic.md)) rather than Boolean algebras (the algebraic semantics of classical logic) because meaning is not binary. A [sign](../../../../../../../../science/domains/linguistics/domains/semiotics/terms/sign.md) is not simply "meaningful" or "meaningless," true or false — it occupies a position in a [lattice](../../../../../../../../humanities/domains/math/domains/order/terms/lattice.md) of semantic values, and that position is achieved through constructive interpretive processes (the [closure operators](../../mathematics/concepts/closure-operator/index.md)), not given in advance by a law that partitions everything into one of two categories.