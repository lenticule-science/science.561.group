---
type: question
status: open
see-also:
  - can-tom-be-learned-from-text.md
  - teaching/explanations/machine-theory-of-mind.md
---

# Does theory of mind require embodiment?

## The question

Human ToM develops through embodied social interaction: joint attention, gestural communication, face-to-face exchange, shared physical environments.
Does ToM *require* embodiment, or can it develop in disembodied systems trained on text/data alone?

This is related to but distinct from [can-tom-be-learned-from-text](can-tom-be-learned-from-text.md): the embodiment question is about *what experience* suffices, not just *what data*.

## What "embodiment" means

Several senses, with different relevance:

- **Physical embodiment.** Having a physical body interacting with a physical world.
- **Multimodal grounding.** Receiving sensory data from multiple modalities corresponding to the world.
- **Interactive embodiment.** Acting on the world and receiving feedback.
- **Social embodiment.** Interacting with other embodied agents in shared physical contexts.

Different senses make different claims about what's necessary for ToM.

## Why embodiment might matter

- **Grounding.** Mental-state vocabulary may need to be grounded in embodied experience to be meaningfully manipulated.
- **First-person perspective.** Having one's own perspective may be necessary to model others' perspectives.
- **Social experience.** Real social interaction produces ToM-relevant data unavailable from text.
- **Joint attention.** A precursor to ToM in development; requires shared physical context.
- **Embodied simulation.** Simulation theories of ToM posit that we model others by simulating their states in our own embodied apparatus.

If any of these is necessary, disembodied AI ToM is fundamentally limited.

## Why embodiment might not matter

- **Linguistic substitutes.** Rich text descriptions of mental states may substitute for embodied experience.
- **Functional equivalence.** What matters for ToM is the *functional capacity* (predicting and explaining behavior); the substrate may not matter.
- **Empirical success.** LLMs do many ToM tasks well without embodiment; if embodiment were strictly necessary, this wouldn't happen.
- **Theory theory.** If ToM is *theory-like* (not simulation-like), it can be acquired declaratively without embodied simulation.

## Empirical evidence

Limited and contested:

- **LLMs (disembodied).** Show partial ToM capabilities; pass standard tasks, fail perturbations.
  Suggests partial ToM is achievable without embodiment.
- **Embodied AI agents.** Show some ToM-relevant behaviors (e.g., joint attention in some HRI research); whether these are *better* than disembodied counterparts on matched ToM tasks is unclear.
- **Multimodal LLMs.** Some evidence of improved performance on multimodal tasks; ToM-specific improvements are partial.
- **Comparative cognition.** Some non-human animals exhibit ToM-relevant behavior with very different embodiment than humans, suggesting embodiment- variability is compatible with ToM.

## What progress would require

- **Controlled comparisons.** LLMs vs multimodal LLMs vs embodied agents on identical ToM benchmarks.
- **Robust ToM benchmarks.** Tests not just for surface performance but for robust ToM capacity.
- **Theoretical frameworks.** Theories specifying what ToM requires that distinguish between embodiment hypotheses.
- **Cognitive science.** Continued investigation of human ToM development clarifying what role embodiment plays there.

## Hypotheses

**Strict embodiment.** ToM requires embodiment; disembodied AI cannot have it in any robust sense.

**Soft embodiment.** Embodiment helps but isn't necessary; disembodied AI can have partial ToM.

**Embodiment-irrelevant.** ToM is functional; embodiment doesn't matter for its acquisition.

**Embodiment-equivalent.** Sufficiently rich non-embodied substrate (text + interaction + feedback) substitutes for embodiment.

**Functional equivalence with different mechanism.** Disembodied AI achieves functional ToM through different mechanism than embodied agents; the *capacity* is present, the *implementation* differs.

## Why it matters

- **AI development direction.** Whether to invest in embodied AI for ToM-relevant capabilities.
- **LLM ToM trajectory.** What scaling can and cannot achieve.
- **AI cognitive limits.** Whether disembodied AI has fundamental cognitive limits.
- **Cognitive science.** Bears on whether human ToM development requires embodiment.

## Status

Open.
The question intertwines empirical work, philosophy of mind, and AI engineering.
No clean answer is available; partial evidence suggests embodiment helps but isn't strictly necessary for *some* ToM capabilities, while *robust* ToM may require more than disembodied text training.
Likely to remain open for some time.
