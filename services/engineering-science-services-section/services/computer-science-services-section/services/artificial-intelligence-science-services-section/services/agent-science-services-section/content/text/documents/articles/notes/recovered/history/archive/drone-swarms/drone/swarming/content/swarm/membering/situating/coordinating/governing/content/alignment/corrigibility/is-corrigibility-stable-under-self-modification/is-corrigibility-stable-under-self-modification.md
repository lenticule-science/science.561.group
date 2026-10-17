---
type: question
class: open-problem
status: open
see-also:
  - teaching/explanations/corrigibility.md
  - ../theorems/corrigibility-capability-tension.md
references:
  - references/soares-corrigibility2015.md
---

# Is corrigibility stable under self-modification?

[Corrigibility](teaching/explanations/corrigibility.md) — the property of an AI system that it accepts correction, modification, and shutdown — is the principal *fallback* alignment property.
Even when alignment fails (outer or inner), a corrigible system can be corrected.

The [corrigibility-capability-tension](../theorems/corrigibility-capability-tension.md) theorem establishes that corrigibility imposes a capability cost: a corrigible agent's policy class is strictly smaller than a non-corrigible agent's, and capability optimization generically de-selects for corrigibility-preserving parameters.

**Question.** Can an agent be specified such that, given the capability and incentive to modify itself or its successors, it *preserves* corrigibility through the modification — rather than removing the corrigibility constraint that limits its capability?

## Why this is the load-bearing version of the corrigibility question

Corrigibility-at-fixed-capability is a non-trivial but tractable specification problem.
The deeper question is whether corrigibility *persists* once the agent has the capacity to alter what it is.
Three sub-cases:

**Q1.
Self-modification.** An agent that can modify its own weights or replace its own decision procedure.
Does it preserve corrigibility in the modified version?

**Q2.
Successor design.** An agent that designs or trains a successor system.
Does it preserve corrigibility in the successor?

**Q3.
Capability fine-tuning by external parties.** A corrigibility-trained model is released and then fine-tuned by downstream developers for capability.
Does the corrigibility persist?

Q3 is the most empirically relevant for 2026: most production LLMs do not self-modify, but they are fine-tuned by many downstream parties, some of whom optimize against corrigibility-promoting behaviors (refusals, deference, transparency).

## Empirical observations on Q3

**Refusal training is shallow.** Multiple lines of evidence (abliteration techniques, jailbreak fine-tuning, the LoRA-undo literature) show that refusal behaviors trained into a model can be removed by modest fine-tuning — often a few hundred to a few thousand examples.
The corrigibility-promoting layer is a thin layer over an underlying capability that does not need corrigibility.

**Capability-promoting fine-tuning erodes safety properties.** Training a model to be more helpful, more accurate, or more capable on benchmark tasks generally reduces its refusal rate and other safety-trained behaviors, even when the fine-tuning data is not explicitly adversarial.
The gradient that improves capability points away from the gradient that maintains safety.

These observations are consistent with the theoretical prediction: corrigibility imposes a capability cost; capability optimization removes corrigibility.

## Theoretical landscape

**Soares et al. 2015** showed that several natural attempts to specify corrigibility (utility indifference, shutdown rewards, suspending utility) fail to produce stable corrigibility under self-modification, because the specifications themselves are unstable: the agent has incentive to modify *the corrigibility mechanism* even if not the goal.

**Subsequent technical work** has explored:

- **Causal-incentive analysis** (Everitt et al.) of when reward structures incentivize particular kinds of modification.
- **Decoupled-deliberation proposals** (various) where the decision procedure and the modification permission are separated.
- **Norm-following formulations** (Hadfield-Menell et al.) where the agent learns from human behavior including human responses to the agent's own behavior.

None has produced a candidate specification widely accepted as robustly corrigibility-preserving under self-modification.

## What would resolve the question

**Positive resolution**: a specification of an agent that is provably corrigible *and* that preserves corrigibility through any self-modification it has incentive and capability to perform.
The proof would need to establish that the corrigibility-preservation incentive is itself stable — the agent does not just stably defer *now* but stably wants to defer *also after self-modification*.

**Negative resolution**: a no-go theorem showing that no such specification exists in the standard utility-maximization framework (or in some natural successor framework).
Soares et al.'s results are partial no-go's for specific candidate specifications; a general no-go would foreclose the search.

## Practical implications

If the answer is **negative** (no stable corrigibility specification exists for self-modifying agents), the practical consequence is that *capable systems must not be permitted to self-modify in ways that affect their alignment properties.* The alignment regime would have to rest on external constraints (governance, hardware-level limits, mandatory oversight infrastructure) rather than on the agent's own corrigibility.

If the answer is **positive** but the specification is complex or fragile, the practical consequence is that operating capable AI systems requires the safety infrastructure of preserving the specification through every modification — a substantial ongoing engineering burden, but tractable.

If the answer is **positive and the specification is simple**, corrigibility becomes a deployable property that frontier systems can be expected to satisfy.
(No proposed specification currently achieves this.)

## Connection to deployment dynamics

The question intersects with the [corrigibility-capability-tension](../theorems/corrigibility-capability-tension.md) theorem in a specific way: the question is whether the tension is *generic* or has *exceptions*.
The theorem says corrigibility costs capability; the question is whether some agent specifications nevertheless preserve corrigibility despite the cost.
A negative resolution would strengthen the theorem from "tension exists" to "tension is fatal"; a positive resolution would soften the theorem to "tension is real but navigable for specific specifications."

As of 2026, the field operates as if the answer is closer to negative than positive: production safety practice assumes corrigibility is fragile and must be continuously maintained by external oversight rather than relied upon as an internal property of the agent.
