---
type: narrative
class: thematic
status: active
depends-on: []
see-also:
  - ../teaching/explanations/llm-as-world-model.md
  - ../theorems/llm-world-model-incoherence.md
  - ../learning/questions/are-llms-implicit-world-models.md
references:
  - ../references/lecun-jepa2022.md
  - ../references/kambhampati-llm-planning2024.md
---

# Why LLMs are imperfect world models

The empirical pattern is consistent: large language models exhibit
substantial *world-knowledge* — they answer factual questions,
simulate dialogue, predict outcomes in described scenarios — and
yet they fail systematic tests of *world-model coherence* —
contradicting themselves across paraphrased queries, failing
classical-planning benchmarks small enough to be solved by direct
forward simulation, exhibiting reversal-curse-style asymmetries.
The puzzle: how can an entity know so much yet model so poorly?

## The structural argument

The argument is essentially LeCun's (2022) and Kambhampati's
(2024), and applies to any model trained on next-token prediction
over text:

**Premise 1.** Next-token prediction selects for producing text
that resembles plausible continuation of training text. This is
the loss function. There is no other.

**Premise 2.** Text about a coherent world is usually consistent
with that world. Authors describing reality use language that
reflects how reality actually behaves. The training objective
therefore *correlates* with world-model coherence — to predict
text well, encoding a fair amount of world knowledge helps.

**Premise 3.** The correlation is imperfect. Text contains:
- Errors and inconsistencies even in factual sources.
- Fiction, hypotheticals, counterfactuals — all valid text
  about non-existent worlds.
- Multiple incompatible perspectives on the same events
  (politics, history, science with paradigm shifts).
- Stylistic conventions that diverge from underlying reality
  (Hollywood physics, simplified explanations, narrative
  compression).

**Premise 4.** The training objective places no direct pressure
to resolve these inconsistencies. The model is rewarded for
matching the empirical distribution of text, not for converging
to a single coherent world model that *generates* the text.

**Conclusion.** The trained model encodes a *superposition* of
many world-shaped patterns, none of which is privileged as "the
world model". When queried, the model's response depends on which
patterns the prompt activates — hence the systematic surface-form
sensitivity, the contradiction across paraphrases, the failure
of planning on small problems where any usable forward model
would succeed by simulation.

## Why it works as well as it does

Given the structural argument, the puzzle inverts: why do LLMs
work *as well as they do*? Several factors:

**Web-scale data averages out idiosyncrasy.** While individual
sources contain inconsistencies, the average over billions of
documents produces relatively coherent representations of
common-knowledge facts. The model encodes the consensus, not
any single author's view.

**Cross-source consistency provides implicit supervision.** When
many sources independently describe the same physical fact
(gravity pulls down, water boils at 100°C, mortar hardens), the
training objective rewards consistency with all of them. The
underlying fact serves as an attractor.

**Learned compositionality.** The model learns to compose
patterns rather than memorize individual training examples.
This composition exhibits significant generalization, behaving
*as if* the model had a more coherent world model than it
actually does. The composition can fail (the failure cases are
the incoherences) but works often enough to look like a world
model from the outside.

**Post-training resolves some incoherences.** RLHF, instruction
tuning, and constitutional methods can patch specific
incoherence cases (the reversal curse partially, planning
performance partially) without changing the underlying training
objective. These are surface fixes, not structural ones.

## The implication for agent design

If the structural argument is correct, then **augmenting LLMs
with explicit external world models** is not optional but
essential for any agent that needs reliable forward simulation:

- **Code execution sandboxes** for verifying predictions of
  algorithm behavior.
- **Physics simulators** for verifying predictions of physical
  outcomes.
- **Knowledge graphs and databases** for grounding factual
  claims.
- **Symbolic planners** ([planning](../../planning/_index.md))
  for goal-directed action sequences in well-specified domains.

The LLM provides the *interface* (parsing requests, generating
queries, integrating results) while the external systems
provide the *forward model*. This pattern is now dominant in
agent frameworks (LangChain, AutoGPT, ReAct, the modern function-
calling toolchains) and increasingly in foundation-model
products (code interpreter, browsing tools, structured search).

## Could scale alone fix it?

The empirical question is whether more training data, more
parameters, or longer training would produce a coherent world
model from the next-token-prediction objective alone. Three
positions:

- **Scaling optimists** (Sutskever, OpenAI scaling-laws line).
  Yes — coherence emerges with scale; current incoherences
  shrink monotonically; we just need more.
- **Scaling pessimists** (LeCun, Kambhampati). No — the
  objective is structurally insufficient regardless of scale;
  coherence requires fundamentally different training (joint-
  embedding, planning-in-the-loop, world-model objectives).
- **Pragmatists.** Whichever — but external-world-model
  augmentation works *now* and is cheaper than scaling, so do
  that and don't bet the agent on the controversy resolving.

See [are-llms-implicit-world-models](../learning/questions/are-llms-implicit-world-models.md).
