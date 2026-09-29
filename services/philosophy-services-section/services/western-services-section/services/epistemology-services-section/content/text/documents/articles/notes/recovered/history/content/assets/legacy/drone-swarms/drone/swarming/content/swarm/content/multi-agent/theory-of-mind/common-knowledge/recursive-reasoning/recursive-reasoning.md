---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/belief-hierarchy.md
see-also:
  - teaching/explanations/cognitive-hierarchy.md
  - teaching/explanations/common-knowledge.md
references:
  - references/camerer-ho-chong2004.md
---

# Recursive reasoning

**Recursive reasoning** is the morphism modeling another agent that itself models you, iterating to a chosen depth.
It is the procedural realization of a finite-depth [belief-hierarchy](../objects/belief-hierarchy.md).

## The recursion

At depth $k$, agent A reasons:

- **Depth 0.** I model the world.
- **Depth 1.** I model B as modeling the world.
- **Depth 2.** I model B as modeling me as modeling the world.
- **Depth 3.** I model B as modeling me as modeling B as modeling the world.
- ...

Each depth requires *deeper* mental simulation; computational cost grows with depth.

## Termination

Pure recursion would be infinite; practical recursive reasoning terminates at finite depth via:

- **Fixed depth bound.** Stop at depth $k$ chosen by budget or convention.
- **Convergence detection.** Stop when further depth doesn't change conclusions.
- **Common-knowledge collapse.** When common knowledge is established, the entire tower collapses.
- **Pragmatic shortcuts.** Stop when "good enough" decision is reached.

The choice of termination affects strategic behavior.

## Empirical depth

Per [cognitive-hierarchy](teaching/explanations/cognitive-hierarchy.md), empirical depths are bounded:

- **Humans** typically reason at depth 1-3 in experimental games (mean $\tau \approx 1.5$).
- **Experts** reach depth 3-4 in their domains; rarely beyond.
- **LLMs** prompted to reason recursively can produce depth-2 to depth-3 reasoning fluently; deeper is brittle.

The bound is *empirical* (not impossibility-bounded); deeper reasoning is in principle possible but computationally and cognitively demanding.

## Why depth matters

Strategic outcomes depend on depth:

- **Beauty contest games.** Deeper reasoners win against shallower ones.
- **Coordination games.** Mutual depth matters; both must reason at compatible depth to coordinate.
- **Strategic deception.** Effective deception requires reasoning at one depth deeper than the target.
- **Safety considerations.** Multi-agent AI safety may depend on reasoning depths AI vs human can achieve.

## In multi-agent AI

Recursive reasoning matters when:

- **LLM agents reason about other LLM agents.** Depth of recursive reasoning affects coordination quality.
- **Multi-agent RL with opponent modeling.** Implicit recursive reasoning (modeling opponent that models you that models opponent...).
- **AI debate.** Effective argumentation requires recursive modeling of opponent's counter-arguments.
- **Adversarial AI safety.** Considering whether AI can recursively reason about human supervisors.

## Computational approaches

- **Explicit depth-bounded recursion.** Code computes depth $k$ reasoning explicitly.
- **Monte Carlo tree search with opponent modeling.** Implicit recursion through search.
- **Self-play.** Generates approximate recursive reasoning through iterated training.
- **LLM prompted recursion.** "Now consider what they'd think you'd think..." chained.

## Limits

- **Computational explosion.** Depth-$k$ reasoning has $O(\text{branching}^k)$ cost.
- **Convergence not guaranteed.** Sequences of depth- bounded reasoning may not converge to common- knowledge reasoning even as $k$ grows.
- **Mismatch.** When agents reason at different depths, outcomes can be hard to predict.
- **Empirical depth bounds.** Real agents (human and AI) rarely benefit from depth beyond 3-4.

## Status

Foundational behavioral game theory framework.
Adaptation to AI multi-agent analysis is active.
Whether LLM agents implement recursive reasoning robustly or only on prompting is empirically partial.
