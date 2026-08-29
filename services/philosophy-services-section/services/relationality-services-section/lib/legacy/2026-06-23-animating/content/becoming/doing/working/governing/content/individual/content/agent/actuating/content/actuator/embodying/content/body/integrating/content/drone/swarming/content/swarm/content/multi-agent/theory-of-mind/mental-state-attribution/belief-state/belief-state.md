---
type: object
class: classical
status: active
depends-on: []
see-also:
  - mental-model.md
  - belief-hierarchy.md
  - ../morphisms/belief-attribution.md
references: []
---

# Belief state

A **belief state** is the complete characterization of an agent's beliefs at a particular moment — what propositions the agent takes to be true, with what confidence, given what observations and inferential history.
Belief states are the principal *objects* mental-state attribution infers and updates.

## Representations

Belief states are formalized variously:

- **Probability distributions.** Bayesian belief: a distribution over possible world states.
  Updates by conditionalization on new evidence.
- **Logical theories.** A set of propositions the agent accepts.
  Updates by adding/removing propositions.
- **Possibility sets.** Set of worlds the agent considers possible.
  Updates by elimination.
- **Belief functions.** Dempster-Shafer mass functions representing partial belief.
- **Modal logic structures.** Kripke-style $w R_a v$: agent $a$ at world $w$ considers $v$ possible.

Choice of representation affects what reasoning is tractable and what attributions are expressible.

## Components of a belief state

A full belief state may include:

- **First-order beliefs.** About the world.
- **Higher-order beliefs.** About other agents' beliefs.
- **Self-beliefs.** Introspective beliefs about own beliefs.
- **Conditional beliefs.** What the agent would believe given counterfactual evidence.
- **Confidence/certainty.** Strength attached to each belief.

Different ToM applications focus on different components.

## Updating belief states

Belief states change in response to:

- **Observations.** New evidence triggers update by conditionalization (Bayesian) or revision (AGM belief revision).
- **Communication.** Messages from other agents update beliefs about the world and about other agents' beliefs.
- **Inference.** Internal reasoning derives new beliefs from existing ones.
- **Time.** Forgetting, decay, or scheduled revisions.

The dynamics of belief states are studied formally by *belief-revision theory* and *dynamic epistemic logic*.

## Belief states for ToM

When agent A models agent B's belief state, A maintains:

- A representation of B's belief state.
- An updating rule for how B's beliefs would change given hypothetical observations.
- A mapping from B's belief state to predicted behavior.

The complexity of this representation is what makes recursive ToM expensive: A's model of B's beliefs may include B's beliefs about A's beliefs, etc.

## In multi-agent AI

Belief states are central to:

- **Multi-agent RL with opponent modeling.** Each agent maintains beliefs about other agents' policies and capabilities.
- **POMDP-based agents.** Belief states over hidden environment state are the standard formalism.
- **LLM-agent ToM.** When an LLM agent reasons about another agent, it implicitly maintains a belief state about that agent.
- **Multi-agent debate.** Each agent's belief state about facts and about other agents' beliefs evolves through exchange.

## Limits

- **Representation costs.** Full belief states are intractable; approximations are required.
- **Higher-order explosion.** Beliefs about beliefs about beliefs grow exponentially; bounded-depth representation is necessary.
- **Privacy.** Belief states are private; modeling another's belief state requires inference, not observation.
- **Belief vs acceptance.** Some accounts distinguish belief (degree-of-confidence) from acceptance (categorical commitment); modeling both is more complex.
