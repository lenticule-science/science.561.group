---
type: object
class: defined-structure
status: stable
depends-on: []
see-also:
  - teaching/explanations/corrigibility.md
  - questions/minimum-viable-alignment-tax.md
references:
  - references/ngo-alignment2022.md
---

# Alignment tax

The **alignment tax** is the capability cost paid for alignment interventions: the gap between what a model could do absent alignment constraints and what it can do given them.

## Definition

For a model $M$ trained with alignment intervention $A$ and a capability metric $C$:

$$\mathrm{tax}_A(M, C) = C(M_{\text{no-}A}) - C(M_A)$$

where $M_{\text{no-}A}$ is the same model trained without intervention $A$.
The tax can be measured per-intervention (KL-penalty tax, RLHF tax, constitutional-AI tax) or aggregate.

## Why the tax exists

Alignment interventions constrain the model's behavior:

- **KL-penalty against a reference policy** prevents the policy from drifting too far, including drift toward better task performance.
- **Refusal training** prevents the model from producing certain classes of output, including outputs that would be helpful in legitimate contexts adjacent to the prohibited ones.
- **RLHF** itself trades raw capability for human-preferred presentation; the optimization pressure is spent partly on preference-fitting rather than task performance.
- **Process supervision** rewards interpretable reasoning chains, which may be longer and more constrained than the unconstrained optimum.
- **Constitutional principles** rule out behaviors that are sometimes the most effective task-completion strategies.

The tax is partly compositional: stacking interventions stacks taxes, sometimes super-linearly (interventions interfere with each other).

## Empirical observations

For LLMs as of 2026:

- **RLHF tax on raw benchmarks**: typically 1–10% on capability benchmarks compared to a base model fine-tuned only on the same data without preference-shaping.
  Highly task-dependent.
- **Refusal-training tax on adjacent legitimate tasks**: substantial; models trained to refuse weapons-synthesis questions also become less helpful on chemistry homework.
  Quantifying this is itself an potential area.
- **Constitutional-AI tax**: typically smaller than RLHF-with-human-feedback tax for the same alignment quality; the principle-following is more parameter-efficient than direct preference-fitting.
- **Process-supervision tax**: highly variable; for some tasks (mathematical reasoning) negative (process supervision improves capability), for others positive.

The general principle: each intervention has a tax, but the relationship between tax and alignment-quality-gained is not monotone.
Some interventions improve both; some sacrifice capability for negligible alignment gain.

## Why the tax matters strategically

If the alignment tax is large, the market pressure on developers is to reduce it (shipping more capable, less aligned models).
If the tax is small or zero (or if alignment improvements *increase* capability), the pressure aligns with safety.

Empirically the picture is mixed: instruction-following RLHF was capability-positive (the resulting models were more useful, not less, than base models, despite some benchmark regressions).
Heavy refusal-training appears capability-negative on legitimate tasks.

The [minimum-viable-alignment-tax](questions/minimum-viable-alignment-tax.md) question asks: what is the smallest alignment tax compatible with a specified safety property?
An answer would have substantial bearing on whether market dynamics favor or oppose alignment.

## Connection to corrigibility

The [corrigibility-capability-tension](../theorems/corrigibility-capability-tension.md) theorem can be read as: corrigibility *necessarily* imposes an alignment tax.
The tax is the capability the agent foregoes by deferring to its principals rather than maximally pursuing its own goal.
A corrigibility tax of zero would imply that deferring is costless, which holds only for trivial goals.

This gives a structural argument for why a robust alignment program must accept some non-zero alignment tax: capability-maximizing training will generically de-select for corrigibility-preserving parameters.
