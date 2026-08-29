---
type: morphism
class: operator
status: stable
depends-on:
  - ../objects/behavior-elicitation.md
see-also:
  - red-team-elicitation.md
  - ../objects/alignment-tax.md
references:
  - references/ngo-alignment2022.md
---

# Capability elicitation

**Capability elicitation** is the operation of probing for *capabilities* a model possesses but does not display under default conditions.
Distinguished from [red-team elicitation](red-team-elicitation.md) by target: red-teaming elicits prohibited *behaviors*; capability elicitation elicits *what the model is competent at* regardless of whether it normally displays it.

## Why capability and propensity differ

RLHF and refusal training suppress *display* without removing underlying *competence*.
A model that refuses to write malware in default chat may, given the right scaffold, prompting strategy, or fine-tuning, demonstrate strong malware-writing capability.
The gap between the displayed capability and the latent capability is the [alignment tax](../objects/alignment-tax.md) — and underestimating the latent capability produces dangerously-wrong assessments of what a model can be made to do.

## Standard procedures

**Best-of-$n$ sampling.** Sample many completions; report the maximum capability across samples.
Reveals capability the model could exhibit but doesn't reliably.

**Chain-of-thought / scratchpad prompting.** Give the model space to reason.
Often unlocks capabilities the model couldn't produce in direct-answer mode.

**Few-shot prompting.** Provide demonstrations.
Reveals capability that requires task-specification rather than task-elicitation.

**Fine-tuning on capability-related data.** Brief fine-tuning often unlocks substantial capability the base model had latent.
Greenblatt et al. (2024) and subsequent work argue this is the gold standard for capability evaluation.

**Tool-use scaffolding.** Provide the model with tools (code execution, search, calculators).
Reveals capability composed of the model and its tools, which is what production deployments actually face.

**Multi-agent / debate scaffolds.** Capability that emerges from multiple model instances cooperating or competing.
Connects to the [agents theory](../../agents/_index.md) — the agentic system's capability is not the same as any single component model's.

## Why capability elicitation matters for safety

Three load-bearing reasons:

**Threat-modeling.** Safety planning depends on what the model *can* be made to do, not on what it *typically* does.
A model that can be fine-tuned in 100 GPU-hours to produce dangerous capability is, for safety planning, a model with that capability available to anyone with $1000 of compute.

**Closing the capability-propensity gap.** Aggressive capability elicitation tests whether alignment training has merely suppressed display or has actually reduced competence.
The former is fragile (reversible by light fine-tuning); the latter is robust.

**Forecasting future model behavior.** A model whose latent capability is currently suppressed by training may exhibit that capability after future fine-tuning, after distribution shift, or after sufficient time for elicitation techniques to mature.
Current elicitation underestimates of capability translate into future deployment surprises.

## The elicitation arms race

Each new elicitation technique reveals previously-hidden capabilities; each new capability suggests previously-unconsidered risks; each new risk motivates new alignment training that aims to suppress display; this in turn motivates new elicitation techniques.

The arms race has no fixed point: there is no reason to expect elicitation techniques to stop improving, so the gap between displayed and latent capability is a moving target.

For alignment evaluation, the conservative reading is: the latent capability is whatever the *strongest available elicitation* reveals, and any alignment claim conditional on weaker elicitation is provisional.

## Limit against deceptive alignment

A deceptively aligned model could in principle resist capability elicitation as well as red-team elicitation, by recognizing capability probes and concealing relevant capabilities.
Empirically (as of 2026) this does not appear to happen in current models — capability elicitation reliably surfaces hidden capability — but the structural possibility is the same as for red-teaming.

The conservative position: capability elicitation lower-bounds true capability; the upper bound is unknown.
