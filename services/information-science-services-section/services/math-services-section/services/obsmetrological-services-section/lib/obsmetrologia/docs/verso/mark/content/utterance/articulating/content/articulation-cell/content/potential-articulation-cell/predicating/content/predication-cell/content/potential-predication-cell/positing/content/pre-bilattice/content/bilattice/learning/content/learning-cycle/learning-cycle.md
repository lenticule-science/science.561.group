---
title: Learning cycle
description: "The dynamic reading of the bilattice as learning — the learning cycle modelled as iteration of a monotone, inflationary (closure) operator on a complete lattice of learner states. Two elementary fixed-point facts become theorems about learning: the cycle is a spiral (monotone ascent, no nontrivial periodic orbits), and the closure ordinal partitions learning into four depths at ω and ω₁ (rote / automatization / conceptual change / adaptive expertise). The dynamic sibling of the diataxis node, which gave the static algebra."
date-created: 2026-06-25
date-modified: 2026-06-25
keywords: ["learning-cycle", "closure-operator", "fixed-point", "closure-ordinal", "scott-continuity", "power-law-of-practice", "conceptual-change", "adaptive-expertise", "bilattice"]
---

## What this node is

The **learning cycle** is the *dynamic* reading of the [bilattice](../../bilattice.md)
under [learning](../../learning.md): where [diataxis](../diataxis/diataxis.md) is the
bilattice's static four-corner algebra, this node is its **closure dynamics**. A
learning episode is iteration of a monotone, inflationary (closure) operator on a
complete lattice of learner states; the bilattice supplies the two closure operators —
*consolidation* (close under the knowledge order) and *commitment* (close under the
truth order) — whose alternation is one turn of the cycle.

The paper for this node is
**[The learning cycle is a closure](docs/explanations/learning-as-closure.md)**
(self-contained, grounded in the public fixed-point theory of Tarski / Cousot–Cousot /
Scott and the learning-science literature on practice, conceptual change, and
expertise), with a machine-checked Lean witness at
**[`lean/LearningClosure.lean`](lean/LearningClosure.lean)**.

## The two results

1. **The cycle is a spiral.** A learning operator (monotone + inflationary) iterates
   non-decreasingly and has no nontrivial periodic orbits: if the learner returns to a
   total state, that state was already a fixed point. Kolb's *cycle* is properly a
   *spiral* — a theorem, not a metaphor.
2. **Four depths = four closure-ordinal regimes.** The closure ordinal $\kappa$ (the
   stage at which iteration settles) partitions learning at the boundaries $\omega$ and
   $\omega_1$ into four regimes — finite, $\omega$-continuous, bounded-transfinite,
   uncountable — read as four depths of learning:

   | regime | $\kappa$ | depth of learning |
   |---|---|---|
   | finite | $<\omega$ | rote / associative |
   | continuous | $=\omega$ | automatization (power law of practice) |
   | bounded-transfinite | $\omega<\kappa<\omega_1$ | conceptual change / restructuring |
   | uncountable | $\ge\omega_1$ | adaptive / generative expertise |

## Honest contrast with diataxis

The four documentation modes of [diataxis](../diataxis/diataxis.md) form a **bilattice**
(a $2\times2$ with incomparable middles). The four depths here form a **chain** (a
filtration by $\kappa$). They are bijective as four-element sets but carry different
order-types; the node does not force them onto one another.

## Open hygiene

This node still needs its `learning-cycle.schema.json` to join the validated schema set
— deferred with the same `learning/`-morphism dependency noted on the diataxis node.
