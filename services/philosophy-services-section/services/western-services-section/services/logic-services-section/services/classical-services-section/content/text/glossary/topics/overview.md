---

title: "Classical Logic Overview"
description: "The philosophical commitments beneath classical logic's technical apparatus — bivalence, truth-functionality, and excluded middle as substantive, contestable positions."
aliases:
  - "Classical Logic Overview"
date-created: 2026-03-05T00:00:00
date-modified: 2026-03-29
keywords:
  - logic
teaches:
  - "Classical Logic Overview"
---

Audience: readers familiar with [propositional logic](../../../../../../../../../../humanities/domains/math/domains/logic/texts/propositional-logic.md) who want to understand its philosophical commitments.

Learning goal: articulate the foundational principles of classical logic and their philosophical significance.

Classical logic is not merely a set of inference rules. It is a philosophical position about the nature of truth and reasoning. The technical apparatus — truth tables, natural deduction, model theory — rests on commitments that are substantive and contestable.

## The core commitments

Classical logic rests on three interlocking principles:

1. **[Bivalence](../terms/bivalence.md)**: every proposition is either true or false. There is no third option, no gap, no indeterminacy.
2. **[Law of excluded middle](../../../../analytic-philosophy/terms/law-of-excluded-middle.md)**: for any proposition P, the disjunction P ∨ ¬P is logically valid.
3. **[Truth-functionality](../terms/truth-functionality.md)**: the truth value of a compound proposition is determined entirely by the truth values of its components.

These principles together produce a logic of total information. The universe, from the standpoint of classical logic, is fully determinate: every question has an answer, even if we don't know it. Ignorance is a feature of the knower, not of reality.

## What these commitments permit

The power of classical logic comes from the reasoning patterns these principles license:

- **Proof by contradiction** (reductio ad absurdum): to prove P, assume ¬P and derive a contradiction. Since ¬P leads to absurdity, and since P ∨ ¬P must hold, P follows. This depends on excluded middle.
- **Double negation elimination**: ¬¬P entails P. If it is false that P is false, then P is true. This depends on bivalence — there is nowhere else for P to be.
- **Non-constructive existence proofs**: to prove ∃x.F(x), assume ∀x.¬F(x) and derive a contradiction. The object exists because its non-existence is impossible. No witness is required.

These are not merely technical conveniences. They embody a realist philosophy: mathematical objects exist independently of our ability to construct them, and truths hold independently of our ability to verify them.

## Historical lineage

Aristotle's syllogistic logic assumed bivalence and excluded middle, though the status of future contingents (*De Interpretatione*, Chapter 9) produced early tensions. The modern form of classical logic was established by Frege's *Begriffsschrift* (1879), which introduced quantification and a truth-functional treatment of the connectives. Russell and Whitehead's *Principia Mathematica* (1910–1913) extended this into a comprehensive formal system. Hilbert's program aimed to secure all of mathematics within classical logic, treating it as the universal framework for rigorous thought.

The [intuitionistic](../../intuitionistic/_index.md) challenge, beginning with [Brouwer](../../../../../../../../../../../references/people/l-e-j-brouwer.md) in the 1910s, questioned whether classical logic's principles are valid for reasoning about infinite domains — inaugurating a philosophical debate that continues to shape the foundations of mathematics and the theory of meaning. For the intuitionistic side of this debate, see the [Intuitionistic Logic Overview](./overview.md).

Check for understanding: Why does proof by contradiction depend on the law of excluded middle?
