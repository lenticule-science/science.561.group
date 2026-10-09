---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - mental-state-attribution.md
  - false-belief-task.md
  - intentional-stance.md
references:
  - references/premack-woodruff1978.md
  - references/wimmer-perner1983.md
---

# Theory of mind

**Theory of mind** (ToM) is an agent's capacity to attribute mental states — beliefs, desires, intentions, knowledge, emotions — to other agents and use these attributions to predict and explain behavior.
Premack & Woodruff (1978) introduced the term in asking whether chimpanzees have it; the phrase has since organized a large body of work in developmental psychology, philosophy of mind, game theory, and AI.

## What ToM does

A ToM-capable agent can:

- **Predict behavior** from inferred mental states ("she will look in the box because she believes the cookie is there").
- **Explain behavior** post-hoc by inferring the mental state that produced it.
- **Distinguish appearance from reality** in others' minds (others can have beliefs the agent knows to be false).
- **Reason about higher-order states** (others' beliefs about others' beliefs).
- **Coordinate strategically** by anticipating others' responses to one's own actions.

Without ToM, prediction of agent behavior must rely on *behavioral* regularities — what the agent has done in similar situations — without modeling *why*.

## Distinguishing ToM from related capacities

- **Behavioral prediction.** Predicting *what* an agent will do, possibly correctly, without modeling internal states.
  Doesn't require ToM.
- **Empathy.** Sharing another agent's emotional state.
  Related to but distinct from ToM (cognitive empathy = ToM; affective empathy = emotional resonance).
- **Imitation.** Copying another's actions.
  Possible without ToM.
- **Joint attention.** Coordinating attention with another agent on a shared object.
  A precursor to ToM in development.

ToM specifically involves mental-state attribution and its use in inference.

## Levels and orders

ToM is hierarchical:

- **First-order ToM.** Modeling another agent's beliefs about the world ("she thinks the cookie is in the box").
- **Second-order ToM.** Modeling another agent's beliefs about others' beliefs ("she thinks Tom thinks the cookie is in the box").
- **Higher-order.** Beliefs about beliefs about beliefs about...
  (in principle infinite; in practice bounded).

[Cognitive-hierarchy](cognitive-hierarchy.md) models formalize the bound.

## Diagnostic tasks

The standard diagnostic for first-order ToM is the [false-belief-task](false-belief-task.md) (Wimmer & Perner 1983; Sally-Anne version, Baron-Cohen et al. 1985): an agent moves an object while another is absent; the test is whether the subject predicts the absent agent will look where they *believe* the object is (false location) rather than where it actually is (true location).
Children typically pass around age 4.

## In machine ToM

Whether AI systems have ToM is contested:

- **Behavioral evidence.** LLMs pass standard false- belief tasks (Kosinski 2023).
- **Robustness evidence.** They fail systematic perturbations (Ullman 2023).
- **Mechanistic question.** Even if behavior matches, does the mechanism implement ToM in any meaningful sense?

See [machine-theory-of-mind](machine-theory-of-mind.md) and [do-llms-have-theory-of-mind](questions/do-llms-have-theory-of-mind.md).

## Why ToM matters

ToM underwrites:

- **Communication.** Producing and interpreting utterances requires modeling what listeners know and believe.
- **Cooperation.** Coordinating action requires modeling partners' goals and capabilities.
- **Strategic reasoning.** Game-theoretic reasoning is recursive ToM.
- **Social inference.** Understanding social situations requires ToM.
- **Deception detection** and **honesty assessment.** Both require modeling what others know.

ToM is therefore foundational to most social cognition.
