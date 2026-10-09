---
type: object
class: classical
status: active
depends-on:
  - belief-state.md
see-also:
  - agent-type.md
  - teaching/explanations/mental-state-attribution.md
references: []
---

# Mental model

A **mental model** (in ToM context) is one agent's representation of another agent's *internals* — beliefs, desires, intentions, capabilities, dispositions.
It is the structure mental-state attribution constructs and maintains.

## What it contains

A mental model of agent B held by agent A typically includes:

- **B's beliefs** (B's [belief-state](belief-state.md)).
- **B's preferences/desires.** What B values.
- **B's capabilities.** What B can do.
- **B's tendencies.** Behavioral regularities — habits, decision patterns, style.
- **B's higher-order states.** What B believes about A, others.
- **B's emotional state** if relevant.

The model is partial — A cannot model all of B exhaustively — and *inferential* — built from observations rather than direct access.

## Constructing mental models

Mental models are built through:

- **Direct observation.** Watching B's actions and inferring underlying states.
- **Communication.** B telling A about B's states (with appropriate trust adjustments).
- **Default expectations.** Modeling B as a typical member of its class (typical human, typical AI agent, typical adversary).
- **Iterated interaction.** Refining the model through repeated experience.

Each source has different reliability and informativeness.

## Mental models vs world models

Distinguish:

- **World model.** Representation of the *environment* — its states, dynamics, and contents.
- **Mental model.** Representation of *another agent's* internals.

Both are important but different: world models predict environmental change; mental models predict agent behavior given environmental observations.

## Mental models in development

Children develop mental models progressively:

- Distinguishing animate from inanimate objects.
- Attributing goals (~12 months).
- Attributing perception (~2 years).
- Attributing beliefs (~4 years; false-belief task).
- Higher-order modeling (~6+ years).

Each stage adds richness to the kinds of mental models the child can construct.

## In multi-agent AI

Mental models of other agents are needed for:

- **Cooperative AI.** Modeling collaborator goals to coordinate.
- **Adversarial AI.** Modeling opponents to exploit.
- **Helpful assistants.** Modeling users to assist.
- **Multi-agent learning.** Opponent modeling to predict other learners.
- **AI debate and oversight.** Modeling debater positions and reasoning.

Contemporary LLM agents construct *some* mental models through prompting (explicitly reasoning about other agents); whether these models are robust and useful is empirically partial.

## Quality of mental models

Mental model quality varies along:

- **Accuracy.** How well the model predicts.
- **Coverage.** How many aspects of B the model captures.
- **Calibration.** How well confidence in model predictions reflects actual reliability.
- **Updateability.** How readily the model adjusts to new observations.
- **Generalization.** How well the model handles novel scenarios.

Good mental models score well on all; poor ones fail on one or more.

## Limits

- **Underdetermination.** Behavior alone underdetermines mental states; multiple models predict the same observed behavior.
- **Computational cost.** Detailed mental models are expensive to maintain.
- **Privacy and self-presentation.** B may actively manage what A's model can infer about B.
- **Recursive explosion.** Mental models of mental models grow exponentially.
