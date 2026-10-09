---
type: object
class: classical
status: active
depends-on:
  - belief-state.md
see-also:
  - teaching/explanations/cognitive-hierarchy.md
  - teaching/explanations/common-knowledge.md
  - ../morphisms/recursive-reasoning.md
references: []
---

# Belief hierarchy

A **belief hierarchy** is the infinite tower of meta- beliefs an agent (in principle) holds: beliefs about the world, beliefs about beliefs about the world, beliefs about beliefs about beliefs, ad infinitum.
It is the formal structure that distinguishes shallow from deep ToM.

## The structure

For a single proposition $p$:

- **Level 0.** "Is $p$ true?" — first-order belief about $p$.
- **Level 1.** "Does B believe $p$?" — second-order belief about B's belief.
- **Level 2.** "Does B believe A believes $p$?" — third- order.
- **Level n.** And so on, in principle without bound.

[Common-knowledge](teaching/explanations/common-knowledge.md) of $p$ is the assertion that the *entire* tower of mutual-belief assertions about $p$ holds.

## Why bounded

In principle infinite, in practice agents reason at *finite depth*:

- **Working-memory limits.** Holding many levels of meta-belief strains memory.
- **Computational cost.** Each level multiplies reasoning cost.
- **Diminishing predictive returns.** Deep meta-beliefs rarely affect first-order behavior much.
- **Communication infeasibility.** Communicating deep meta-beliefs requires complex protocols rarely worth the bandwidth.

Per [cognitive-hierarchy](teaching/explanations/cognitive-hierarchy.md), empirical bounds on human strategic reasoning are typically L1-L4.

## Why depth matters

Depth of belief hierarchy affects:

- **Coordination.** Some coordination games require high-order mutual belief; shallow reasoners coordinate worse.
- **Strategic play.** Deeper reasoners can exploit shallower ones.
- **Communication.** Speech-act interpretation often requires modeling listener's beliefs about speaker's beliefs.
- **Trust.** Trust building requires modeling counter- party's beliefs about own trustworthiness.
- **Deception.** Effective deception requires modeling target's beliefs about deceiver's beliefs.

## Representational difficulties

Representing arbitrary-depth belief hierarchies is hard:

- **Naive representation** (a tree of belief predications) explodes exponentially.
- **Common-knowledge shortcuts** apply when the entire tower can be summarized as "p is common knowledge" — but require establishing common knowledge first.
- **Approximation by depth-bound** sacrifices expressiveness for tractability.
- **Probabilistic over depth** assigns distributions over reasoning depths to handle uncertainty about others' depth.

Each approach trades off in different directions.

## In multi-agent AI

Belief hierarchies appear when:

- **Multi-agent RL agents model opponent reasoning depth.** Implicitly or explicitly.
- **LLM agents reason about other agents' reasoning.** Prompted reasoning at depth 2-3 is common; deeper is rare.
- **Strategic AI in games.** Optimal play may require deep belief modeling; bounded reasoning is computationally necessary.
- **AI alignment via debate.** Debate protocols implicitly use bounded belief hierarchy reasoning.

## Limits

- **Infinite depth unattainable.** Even in principle, no finite computation reaches infinite depth.
- **Convergence questions.** Sequences of depth-bounded reasoning may not converge to common-knowledge reasoning even as depth grows.
- **Empirical depth.** Real agents (human or AI) reason at quite shallow depth in most settings; representational machinery for deeper reasoning is rarely exercised.
