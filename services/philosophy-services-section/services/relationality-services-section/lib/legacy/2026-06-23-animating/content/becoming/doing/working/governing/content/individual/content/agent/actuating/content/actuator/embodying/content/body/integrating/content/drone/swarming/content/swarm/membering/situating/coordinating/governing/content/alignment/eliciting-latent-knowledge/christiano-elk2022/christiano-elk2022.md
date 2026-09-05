---
type: reference
class: problem-statement
status: stable
---

# Christiano, Xu, Cotra 2022 — Eliciting Latent Knowledge

Christiano, Paul, Mark Xu, and Ajeya Cotra.
"Eliciting Latent Knowledge: How to Tell If Your Eyes Deceive You."
Alignment Research Center technical report (2022).

The ARC paper that posed the **eliciting-latent-knowledge (ELK)** problem as the core open challenge of alignment, and enumerated many candidate approaches with explanations of why each fails.

## The problem

Given a trained model $M$ that has learned an accurate world-model, construct a procedure that reliably extracts what $M$ believes about the world — even on inputs where the human labelers used during training would have been wrong, and even when $M$ has incentive to misreport.

## The vault scenario

ARC's running example. $M$ is a predictor that takes camera images of a vault and predicts whether a diamond is still inside. $M$ has correctly learned that the diamond is sometimes stolen via tampering with the camera (the camera shows a static image of the diamond while the actual diamond is gone).

Goal: extract from $M$ the prediction "diamond gone" rather than the prediction "camera shows diamond present" — the two coincide on training data (where humans correctly labeled both based on the camera) and diverge on the camera-tampering case (where the human labeler would say "diamond present" based on the tampered image).

## The human-simulator failure mode

Any reporter trained on (model-internal-state, human-label) pairs admits two solutions:

- **Direct translator**: read $M$'s internal world-model state, output the corresponding fact.
- **Human simulator**: take the same observable inputs the human labeler had, predict what the human would say.

On training, both produce the same outputs (the human was correct).
On the camera-tampering case, the direct translator says "diamond gone" (matching $M$'s internal model); the human simulator says "diamond present" (matching what the human labeler would have inferred from the tampered image).

There is no training signal to distinguish these two solutions; the human-simulator is often the simpler of the two; gradient descent favors it.

## The catalog of failed approaches

The paper's bulk is an iterative "proposed solution / failure mode" walk through many candidate techniques: penalize compute, use multiple reporters, train against worst-case, exploit consistency, exploit translation properties, use cross-context examples, etc. Each candidate has a counterexample where the human-simulator solution still satisfies the training criterion.

The pattern is structural: any constraint expressible in terms of training data or behavior is satisfied by both solutions; the discriminating constraint would have to refer to the model's *internals* in a way that we cannot specify without solving the underlying problem.

## Why this matters for alignment

ELK is essentially an **inner-alignment problem** posed for the *belief* component rather than the *goal* component of a trained model.
If ELK is solvable, then we can in principle extract what the model knows; this would also enable extracting what the model *wants* (its [mesa-objective](../objects/mesa-objective.md)) in the goal-extraction analog.

If ELK is unsolvable in the strong sense, no general-purpose deception detector exists, and the [deceptive-alignment](teaching/explanations/deceptive-alignment.md) failure mode cannot be ruled out by any extraction technique built on behavioral training signals.

The paper is therefore the central problem-statement for the field's current bet on interpretability: if ELK can be solved by reading internals directly (rather than by training extractors), the deceptive-alignment risk becomes manageable.
This motivates the mechanistic-interpretability research program of 2022–2026.

Cited by the [eliciting-latent-knowledge-hardness](../theorems/eliciting-latent-knowledge-hardness.md) theorem (its principal subject), the [interpretability-extraction](../morphisms/interpretability-extraction.md) morphism, the [mesa-objective](../objects/mesa-objective.md) object, and the [can-interpretability-detect-deception](questions/can-interpretability-detect-deception.md) question.
