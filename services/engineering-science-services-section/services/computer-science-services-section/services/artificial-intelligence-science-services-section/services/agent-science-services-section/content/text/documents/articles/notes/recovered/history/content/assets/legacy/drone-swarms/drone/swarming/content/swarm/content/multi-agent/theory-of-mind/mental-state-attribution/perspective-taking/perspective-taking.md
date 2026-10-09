---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/perspective.md
see-also:
  - belief-attribution.md
  - teaching/explanations/false-belief-task.md
references: []
---

# Perspective-taking

**Perspective-taking** is the morphism that adopts another agent's [perspective](../objects/perspective.md) — suspending one's own viewpoint and reasoning as the other would.
It is more demanding than [belief-attribution](belief-attribution.md): not just what the other believes but how they would reason.

## The operation

Perspective-taking involves:

1. **Bracketing one's own perspective.** Setting aside one's own beliefs, observations, knowledge.
2. **Reconstructing the other's observation history.** What has the other observed?
3. **Loading the other's background.** What does the other know?
  What categories do they use?
4. **Reasoning as the other.** Computing what inferences and decisions the other would make.
5. **Returning to own perspective.** Using the other-perspective output to inform own action.

The bracketing step is the hardest — overcoming egocentric defaults requires deliberate cognitive effort.

## Levels of perspective-taking

- **Visual.** "What does the other see from there?"
  (Earliest developmental form.)
- **Affective.** "How would they feel?"
  (Empathy in the cognitive-empathy sense.)
- **Cognitive.** "What would they think?"
  (Mature ToM.)
- **Recursive.** "What would they think I think?"
  (Higher-order ToM.)

Each level requires the previous as substrate.

## In development

Children develop perspective-taking progressively:

- **Visual perspective-taking** by age 2-3.
- **Cognitive perspective-taking** by age 4-5 (false-belief tasks).
- **Recursive perspective-taking** later, into adolescence.

Adults may regress to egocentrism under cognitive load, time pressure, or emotion.

## In multi-agent AI

Perspective-taking applies when:

- **AI explains things.** Effective explanation requires taking the user's perspective on what is and isn't obvious.
- **AI assists.** Helpful assistance requires modeling what the user knows, wants, can do.
- **AI argues.** Effective argumentation requires modeling the audience's beliefs and concerns.
- **AI deceives or detects deception.** Both require recursive perspective-taking.

LLMs can perform perspective-taking when prompted to ("Consider this from X's perspective").
Whether this is robust perspective-taking or surface-level pattern matching is empirically unclear.

## Common failures

- **Curse of knowledge.** Once you know X, it's hard to model someone who doesn't know X.
- **Egocentric anchoring.** Starting from own perspective and adjusting insufficiently.
- **False consensus.** Assuming others share own perspective more than they do.
- **Empathy gaps.** Understanding others' perspectives in domains one hasn't experienced.

These failures appear in humans and plausibly in AI systems trained on human data.

## Computational approaches

- **Inverse planning.** Model the other as a planner; infer their perspective from observed actions.
- **Bayesian theory of mind.** Probabilistic inference over perspective parameters.
- **Simulation theory.** Run own decision-making apparatus with substituted parameters.
- **Theory theory.** Apply explicit theory of how perspectives differ.

LLMs likely use a mix of simulation- and theory-style perspective-taking; the mechanism is opaque.

## Limits

- **Underdetermination.** Many perspectives produce same behavior.
- **Cost.** Full perspective-taking is computationally expensive.
- **Verification.** Can't verify that adopted perspective matches the other's actual perspective.
- **Recursive limits.** Per [cognitive-hierarchy](teaching/explanations/cognitive-hierarchy.md), recursive perspective-taking has empirical bounds.
