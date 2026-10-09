---
type: theorem
class: classical
status: proved
depends-on:
  - ../objects/utility-function.md
  - ../objects/decision-problem.md
see-also:
  - teaching/explanations/decision-theory.md
references:
  - references/vnm1944.md
title: VNM utility theorem
description: Let $\succeq$ be a binary relation on the set $L$ of lotteries (probability distributions over a finite outcome set $O$).
---

# VNM utility theorem

## Statement

Let $\succeq$ be a binary relation on the set $L$ of *lotteries* (probability distributions over a finite outcome set $O$).
Suppose $\succeq$ satisfies the four VNM axioms:

1. **Completeness.** For all $L_1, L_2 \in L$, either $L_1 \succeq L_2$ or $L_2 \succeq L_1$ (or both).
2. **Transitivity.** $L_1 \succeq L_2$ and $L_2 \succeq L_3$ imply $L_1 \succeq L_3$.
3. **Continuity.** If $L_1 \succ L_2 \succ L_3$, there exists $p \in (0, 1)$ with $p L_1 + (1-p) L_3 \sim L_2$.
4. **Independence.** For all $L_1, L_2, L_3$ and $p \in (0, 1]$, $L_1 \succeq L_2 \iff p L_1 + (1-p) L_3 \succeq p L_2 + (1-p) L_3$.

Then there exists a utility function $u : O \to \mathbb{R}$ such that for all lotteries $L_1, L_2$,

$$ L_1 \succeq L_2 \iff \mathbb{E}_{L_1}[u] \ge \mathbb{E}_{L_2}[u]. $$

The function $u$ is unique up to positive affine transformation.

## Proof sketch

The proof constructs $u$ explicitly:

1. Pick a best outcome $o^*$ and a worst outcome $o_*$ (well- defined by completeness and transitivity on degenerate lotteries).
2. For each outcome $o$, continuity gives a unique $p_o \in [0, 1]$ such that $o \sim p_o\, o^* + (1 - p_o)\, o_*$.
  Set $u(o) = p_o$.
3. Independence implies that for any lottery $L = \sum p_i\, o_i$, $L \sim \left(\sum p_i u(o_i)\right) o^* + \left(1 - \sum p_i u(o_i)\right) o_*$.
4. Hence $L_1 \succeq L_2$ iff $\mathbb{E}_{L_1}[u] \ge \mathbb{E}_{L_2}[u]$.

The uniqueness up to positive affine transformation follows from the fact that the construction depended only on the choice of $o^*$ and $o_*$, and any other choice produces a $u$ related by $u'(o) = \alpha u(o) + \beta$ with $\alpha > 0$.

## Why it matters

The theorem is the *founding result* of decision theory.
It shows that the apparently complex notion of "rational choice under risk" reduces, under four innocent-looking axioms, to the maximization of expected value of a real-valued function.
It provides:

- **A reduction** of preferences to a single number per outcome.
- **A justification** for treating utility as the substrate of rationality (and, derivatively, for treating reward signals in RL as utility surrogates).
- **A diagnostic** for irrationality: any agent whose behavior cannot be represented as expected-utility maximization violates one of the axioms.

## Limits

The theorem is silent on:

- **Where the probabilities come from.** VNM takes lotteries (with given probabilities) as primitive.
  Savage's framework derives subjective probabilities from preferences over acts; the two together give the Savage representation theorem.
- **Logical omniscience.** All logically equivalent lotteries must be ranked identically.
  Real agents cannot satisfy this.
- **Continuity violations.** Lexicographic preferences (always prefer more of $X$, breaking ties with $Y$) violate continuity and have no expected-utility representation.
- **Independence violations.** The Allais paradox shows systematic empirical violations of independence by humans.

These limits are widely known but do not undermine the theorem's normative role: VNM tells you what *coherent* choice looks like, not what humans actually do.
