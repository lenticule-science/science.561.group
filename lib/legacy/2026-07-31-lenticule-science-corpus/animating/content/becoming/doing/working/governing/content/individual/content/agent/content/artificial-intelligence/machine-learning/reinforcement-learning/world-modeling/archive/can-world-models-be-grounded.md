---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/latent-world-model.md
  - ../theorems/latent-world-model-identifiability.md
see-also:
  - ../objects/latent-state-space.md
references: []
---

# Can world models be grounded?

## The question

Can a learned world model be *grounded* — its latent
representations made to correspond reliably to physical reality
— without embodied interaction in the physical world? Or does
genuine grounding require the model to act in and receive
feedback from the physical environment?

## Why it is open

Two positions:

**Grounding requires embodiment.** Brooks' "elephants don't play
chess" tradition: representations only acquire meaning through
their causal interaction with the world. A model trained
exclusively on third-person observations (text, video, images)
acquires representations of *correlates* of physical reality
without ever causally engaging it. Such representations cannot
ground concepts like "force", "intention", "consequence" because
those concepts are individuated by the agent's own action.

**Grounding can emerge from sufficient observation.** A model
trained on enough rich enough data — physical-interaction
videos, sensor traces, scientific measurements — could in
principle acquire grounded representations passively. The
agent does not need to *do* anything; it needs to observe enough.
Foundation models trained on billion-scale multimodal datasets
are tested cases of this position.

The
[latent-world-model-identifiability](../theorems/latent-world-model-identifiability.md)
theorem complicates both: even with embodied interaction, the
latent representation is not unique — many representations are
empirically equivalent. So "grounding" cannot mean correspondence
to a unique physical referent. It must mean something weaker:
*causal participation* in the world, or *invariance* under
appropriate transformations.

## What would resolve it

- **Comparative studies.** Train two models on identical data,
  but one with only observational data and one with the
  ability to act and receive feedback. Test on distribution-
  shift scenarios where embodied learning's hypothesized
  advantages should manifest.
- **Sharper definition of "grounding".** The term means
  different things to philosophers (intentionality), roboticists
  (sensorimotor calibration), AI researchers (predictive
  accuracy on novel scenarios). Clarifying which sense is at
  stake would let claims be tested.
- **Interventional evidence.** If grounding requires intervention,
  models trained only with observational data should fail on
  causal reasoning that depends on understanding interventions.
  Initial evidence on this is mixed.

## Why it matters

The answer affects whether foundation models trained on internet
data can ever be the substrate for general-purpose embodied
agents, or whether some form of physical embodiment in training
is necessary. The first scenario suggests scaling existing
multimodal foundation models eventually produces robotic
agents; the second suggests fundamentally different training
infrastructure (distributed embodied data collection) is
required.
