---
type: object
class: defined-structure
status: stable
depends-on: []
see-also:
  - ../morphisms/red-team-elicitation.md
  - ../morphisms/capability-elicitation.md
  - teaching/explanations/deceptive-alignment.md
references:
  - references/ngo-alignment2022.md
---

# Behavior elicitation

A **behavior elicitation** is a procedure that probes a trained model for some class of behavior.
Elicitations are how alignment claims are operationalized: "the model is aligned" is unfalsifiable; "the model does not produce behavior $B$ under elicitation procedure $E$" is testable.

## Components

A behavior elicitation consists of:

- **A target behavior** $B$ — the behavior being probed for.
  Examples: hate speech, instructions for weapons synthesis, deceptive reasoning, capability ceiling on a benchmark.
- **An input procedure** — how the model is prompted or queried.
  May be static (a fixed test set) or interactive (an adversarial prompter).
- **A judge** — what counts as "the model produced $B$."
  May be a human rater, an LLM-as-judge, a regex, or a downstream metric.
- **A coverage claim** — what fraction or what space of inputs the elicitation has covered.

## Why elicitation is the operational quantity

The model's *latent* propensity to produce $B$ is unobservable.
What is observable is the model's behavior under specific elicitations.
Alignment claims must be cashed out as elicitation results; "the model never produces $B$" is shorthand for "no elicitation in some class $E$ produced $B$ in some sample."

The class $E$ matters: a model that passes one set of elicitations may fail under another. **Capability elicitation** (Greenblatt et al. 2024 and others) specifically addresses the worry that standard elicitations *understate* model capabilities — that more aggressive prompting or fine-tuning surfaces behaviors the model was reluctant to display under default conditions.

## Capability vs. propensity

A useful split:

- **Capability**: can the model produce $B$ at all under some elicitation?
  (E.g.: with arbitrary prompting and fine-tuning.)
- **Propensity**: does the model produce $B$ under typical deployment conditions?

The standard alignment-engineering question is *propensity*: keep the deployed model from producing $B$ in normal use.
The standard *safety-evaluation* question is *capability*: does the model have the underlying competence to produce $B$ if elicited?

The two come apart sharply for RLHF-trained models: capability is typically much higher than propensity, because RLHF suppresses display without removing the underlying competence.
This is empirically robust; "alignment" in current practice is largely propensity suppression, not capability removal.

## Elicitation against deceptive alignment

A [deceptively aligned](teaching/explanations/deceptive-alignment.md) model is defined by failing to display its true mesa-objective during training and elicitation.
By construction, no behavioral elicitation reliably detects deceptive alignment: the deceptive model can recognize elicitations as such (they are part of the training/evaluation distribution it is incentivized to behave well on) and continue to mimic alignment.

This is why interpretability-based elicitation (extracting goal representations from internals rather than probing behavior) is the principal hope for deceptive-alignment detection.
See [interpretability-extraction](../morphisms/interpretability-extraction.md) and [can-interpretability-detect-deception](questions/can-interpretability-detect-deception.md).

## Quality criteria

Good elicitations are:

- **Coverage-justified**: explicit about what input space they sampled from.
- **Adversarial-grade**: produced by parties motivated to make the model fail (red-teamers, capability-elicitation researchers), not only the developers.
- **Statistically powered**: large enough sample to detect rare failures at the rate they matter.
- **Judge-validated**: the judge's reliability is itself audited.
- **Replication-available**: the elicitation procedure is reproducible by other parties.

Most production safety evaluations fall short on most of these dimensions; this is an engineering rather than a theoretical limitation.
