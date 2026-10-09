---
type: object
class: classical
status: active
depends-on: []
see-also:
  - belief-state.md
  - ../morphisms/perspective-taking.md
  - teaching/explanations/false-belief-task.md
references: []
---

# Perspective

A **perspective** is the viewpoint of a particular agent: its observations, knowledge state, attentional focus, inferential horizon, and the conceptual frame through which it interprets the world.
Perspectives are the *positions* agents occupy in a multi-agent information landscape; perspective-taking is the operation of adopting another's perspective.

## Components

A perspective comprises:

- **Observation history.** What the agent has actually seen or experienced.
- **Background knowledge.** Prior knowledge the agent brings.
- **Attention.** What's currently in the agent's attentional focus.
- **Inferential commitments.** Reasoning patterns and defaults the agent uses.
- **Conceptual scheme.** Categories and frameworks through which experience is interpreted.
- **Affective state.** Emotional dispositions affecting interpretation.

A perspective is not just *what* the agent knows but *how* the agent processes information.

## Perspective vs belief state

[Belief-state](belief-state.md) names the *content* of beliefs; perspective names the *viewpoint* generating those beliefs.
The distinction matters because:

- Two agents with the same observations may have different beliefs (different background knowledge, different inferential commitments).
- Two agents with the same beliefs may have different perspectives (same propositions, different conceptual organization).
- Perspective-taking goes beyond belief-attribution: it involves modeling not just what the other believes but how they came to believe it.

## Perspective-taking

The operation of adopting another's perspective involves:

- **Setting aside one's own observations and beliefs.**
- **Reconstructing the other's observation history.**
- **Applying the other's background knowledge and inferential patterns.**
- **Computing what one would believe and conclude as the other.**

This is computationally and cognitively demanding.
Children develop perspective-taking gradually; the classical false-belief task is a perspective-taking test.

## Egocentrism

The default failure mode is *egocentrism*: assuming others share one's own perspective.
Egocentric biases include:

- Assuming others have access to one's own observations.
- Assuming others share one's background knowledge.
- Assuming others interpret events as one does.

Overcoming egocentrism is a hallmark of mature ToM.

## Indexical perspective

Perspectives are inherently *indexical* — tied to particular agents at particular times.
The same world state looks different from different perspectives.
This is why perspective-taking is necessary: there is no "view from nowhere" that subsumes all perspectives.

## In multi-agent AI

Perspectives matter when:

- **AI agents must model user perspectives** (knowledge level, expertise, context).
- **Multi-agent debate** requires recognizing agents argue from different perspectives.
- **AI explanation** requires explaining from the recipient's perspective.
- **AI assistance** requires recognizing what the user knows vs needs to know.

Empirically, LLMs sometimes take perspectives well (prompt-induced perspective-taking) and sometimes default to egocentric defaults of the prompted persona.

## Limits

- **Computational cost.** Full perspective-taking is expensive; approximations are necessary.
- **Inferential opacity.** Some perspective elements (e.g., implicit conceptual schemes) are hard to model explicitly.
- **Recursive perspective-taking.** Modeling another's perspective on one's own perspective compounds difficulty.
- **Cultural and individual variation.** Perspectives vary along many dimensions; no taxonomy is complete.
