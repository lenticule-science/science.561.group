---
title: Intuitionistic Logic
aliases:
- Intuitionistic Logic
- intuitionistic-logic
- constructive logic
date-created: 2026-03-01 00:00:00
tags:
- logic
depends-on:
- /mathematics/disciplines/logic/curricula/propositional-logic.md
- /mathematics/objects/posets/curricula/heyting-algebras.md
introduces:
- Intuitionistic Logic
references:
  - id: troelstra_ConstructivismMathematics_1988
    type: document
    title: Constructivism in Mathematics: An Introduction
    author:
      - literal: Troelstra
    issued:
      - year: 1988
  - id: dummett_ElementsIntuitionism_2000
    type: document
    title: Elements of Intuitionism
    author:
      - literal: Dummett
    issued:
      - year: 2000
  - id: vandalen_LogicStructure_2013
    type: document
    title: Logic and Structure
    author:
      - literal: Vandalen
    issued:
      - year: 2013
type: overview
status: current
---
## Entry conditions

Use intuitionistic logic when:

- You need to reason about evidence, construction, or partial information rather than absolute truth and falsity.
- You want logical operations that have computational content — where a proof of "there exists an $x$" must exhibit the $x$.
- You are working in a [Heyting algebra](../../../teaching/explanations/heyting-algebra/index.md) rather than a [Boolean algebra](../../../teaching/explanations/boolean-algebra/index.md).

## The key difference from classical logic

Classical propositional logic assumes the **[law of excluded middle](../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md)**: for every proposition $P$, either $P$ or $\neg P$ holds. Intuitionistic logic drops this assumption. A proposition is true when you have a construction (a proof, a witness, an exhibit) that establishes it. A proposition is false when you have a construction showing it leads to contradiction. A proposition for which you have neither is simply undecided — it is not forced into one bin or the other.

This is not a restriction for the sake of austerity. It reflects the structure of situations where knowledge is partial: the meaning of a [sign](../../../../linguistics/theories/semiotics/terms/sign.md) may be underdetermined; a measurement may be inconclusive; a claim may have evidence for it without that evidence being decisive. Intuitionistic logic gives these situations a formal language.

## The BHK interpretation

The [Brouwer](../../../../../../../references/people/l-e-j-brouwer.md)-[Heyting](../../../../../../../references/people/arend-heyting.md)-[Kolmogorov](../../../../../../../references/people/andrey-kolmogorov.md) (BHK) interpretation defines the meaning of each connective in terms of constructions [@troelstra_ConstructivismMathematics_1988]:

- A proof of $A \wedge B$ is a pair: a proof of $A$ and a proof of $B$.
- A proof of $A \vee B$ is a proof of $A$ or a proof of $B$, together with an indication of which.
- A proof of $A \Rightarrow B$ is a method that transforms any proof of $A$ into a proof of $B$.
- A proof of $\neg A$ is a method that transforms any proof of $A$ into a proof of $\bot$ (absurdity).
- There is no proof of $\bot$.

Under this reading, $A \vee \neg A$ requires that you can either prove $A$ or derive a contradiction from $A$. For many propositions, you can do neither, so [excluded middle](../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md) fails.

## What changes without [excluded middle](../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md)

Several classically valid principles become unavailable:

| Principle | Classical | Intuitionistic |
|-----------|-----------|----------------|
| $A \vee \neg A$ ([excluded middle](../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md)) | valid | not generally valid |
| $\neg\neg A \Rightarrow A$ (double negation elimination) | valid | not generally valid |
| $(\neg B \Rightarrow \neg A) \Rightarrow (A \Rightarrow B)$ (contraposition, strong form) | valid | not generally valid |
| $(A \Rightarrow B) \vee (B \Rightarrow A)$ (linearity) | valid | not generally valid |

What remains valid includes: $A \Rightarrow \neg\neg A$, the deduction theorem, modus ponens, and all reasoning that proceeds by constructing witnesses rather than eliminating alternatives.

## Kripke semantics

Intuitionistic logic has a natural semantics using [Kripke frames](./kripke-frames.md), with one additional requirement: the accessibility relation is a [partial order](../../order/objects/partial-order.md), and truth is **monotone** — once a proposition becomes true at a world, it stays true at all accessible (later, more-informed) worlds [@vandalen_LogicStructure_2013].

A Kripke model for intuitionistic logic is a triple $(W, \leq, V)$ where:

- $W$ is a set of worlds (think: states of knowledge).
- $\leq$ is a [partial order](../../order/objects/partial-order.md) on $W$ (think: increasing information).
- $V$ assigns to each atomic proposition the set of worlds where it holds, with the constraint that $V(p)$ is upward-closed: if $w \in V(p)$ and $w \leq w'$, then $w' \in V(p)$.

The forcing relation $w \Vdash A$ is defined inductively:

- $w \Vdash p$ iff $w \in V(p)$.
- $w \Vdash A \wedge B$ iff $w \Vdash A$ and $w \Vdash B$.
- $w \Vdash A \vee B$ iff $w \Vdash A$ or $w \Vdash B$.
- $w \Vdash A \Rightarrow B$ iff for every $w' \geq w$, if $w' \Vdash A$ then $w' \Vdash B$.
- $w \Vdash \neg A$ iff for every $w' \geq w$, $w' \nVdash A$.

Notice: [excluded middle](../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md) fails because there may be a world $w$ where $A$ does not yet hold, but some extension of $w$ makes $A$ true — so $\neg A$ does not hold at $w$ either.

## The algebraic connection

The [Lindenbaum-Tarski construction](../../../teaching/explanations/lindenbaum-tarski-algebra/index.md) shows that the equivalence classes of formulas under intuitionistic provability form a [Heyting algebra](../../../teaching/explanations/heyting-algebra/index.md). Conversely, every [Heyting algebra](../../../teaching/explanations/heyting-algebra/index.md) provides a sound and complete semantics for intuitionistic propositional logic [@dummett_ElementsIntuitionism_2000].

This correspondence is exact: intuitionistic logic IS the internal logic of [Heyting algebras](../../../teaching/explanations/heyting-algebra/index.md), just as classical logic is the internal logic of [Boolean algebras](../../../teaching/explanations/boolean-algebra/index.md).

## Worked example

Consider two worlds: $w_0$ (initial knowledge) and $w_1$ (extended knowledge), with $w_0 \leq w_1$. Let $p$ be the proposition "the sample contains iron."

- At $w_0$: the initial test is inconclusive. $p$ does not hold — the evidence is insufficient. But $\neg p$ does not hold either, because further testing at $w_1$ might confirm $p$.
- At $w_1$: a more sensitive test is run and $p$ holds.

At $w_0$, neither $p$ nor $\neg p$ is forced. Excluded middle fails. The [Heyting implication](../morphisms/heyting-implication.md) $p \Rightarrow p$ still holds everywhere (trivially), and $\neg p \Rightarrow \neg p$ holds everywhere, but $p \vee \neg p$ does not hold at $w_0$.

## Common mistakes

- Treating intuitionistic logic as "weaker" classical logic. It is a different logic with different valid principles, not a subset of classical theorems. Intuitionistic proofs carry computational content that classical proofs do not.
- Assuming $\neg\neg A$ gives you $A$. Double negation elimination fails. You can show $A$ is not refutable without having a proof of $A$.
- Forgetting monotonicity in Kripke models. If $p$ holds at world $w$, it must hold at all worlds above $w$. Truth can grow but not shrink.

## Minimal data

- A set of atomic propositions.
- Connectives $\wedge, \vee, \Rightarrow, \neg$ with BHK reading.
- An inference system (e.g. natural deduction for intuitionistic logic) that lacks [excluded middle](../../../../../humanities/theories/philosophy/theories/western/theories/analytic-philosophy/terms/law-of-excluded-middle.md) and double negation elimination.

