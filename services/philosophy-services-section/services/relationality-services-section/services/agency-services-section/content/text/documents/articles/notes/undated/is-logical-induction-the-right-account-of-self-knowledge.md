---
type: question
status: open
see-also:
  - teaching/explanations/logical-induction.md
  - ../theorems/logical-induction-criterion.md
references:
  - references/garrabrant-logical-induction2016.md
title: Is logical induction the right account of self-knowledge?
description: Logical induction provides a calibrated, computable, self- referential account of belief over logical sentences, including sentences about the inductor's own future beliefs.
---

# Is logical induction the right account of self-knowledge?

## The question

Logical induction provides a calibrated, computable, self- referential account of belief over logical sentences, including sentences about the inductor's own future beliefs.
Is it the *right* substrate for embedded-agency self-knowledge, or is it one candidate among many?

## What logical induction does

A logical inductor satisfies: - Calibration of asymptotic frequencies. - Convergence of probabilities in the limit. - Self-knowledge: $\mathbb{P}_n(\phi) \approx \mathbb{P}_n(\mathbb{P}_n(\phi) \in I)$. - Coherence with the underlying axiom system in the limit.

These are strong properties.
The framework is the most-developed formal account of computable, calibrated, self-referential belief currently available.

## Open concerns

- **Computational tractability.** Logical induction is uniformly computable but extraordinarily slow.
  Whether a tractable approximation can preserve the key properties is unknown.
- **Bounded properties.** All the properties are *limit* properties; the agent has weak guarantees at any fixed step.
  Decision-theoretic applications often need bounded-step guarantees.
- **Language fixed.** The framework assumes a fixed object language.
  Real agents extend their conceptual vocabulary.
  Whether logical induction lifts cleanly to settings with vocabulary growth is open.
- **Decision-theoretic interface.** Combining logical induction with FDT or UDT to get a complete embedded decision theory is non-trivial; multiple proposals exist.
- **Alternatives.** Reflective oracles (Christiano et al.) and Cartesian frames (Garrabrant) address overlapping ground with different formal commitments.
  The literature has not chosen.

## Why it matters

Self-knowledge is a load-bearing component of any embedded- agency framework.
The choice of self-knowledge substrate determines which alignment-relevant arguments go through.
If logical induction is the right substrate, alignment arguments should be checked against it.
If a different substrate is right, those arguments need rechecking.

## Status

Open.
Logical induction has the *most* developed framework for self-referential calibrated belief, but "most developed" is not "correct" or "complete".
