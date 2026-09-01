---
type: reference
class: foundational
status: active
authors: ["Tomer Ullman"]
year: 2023
venue: "arXiv:2302.08399"
title: "Large Language Models Fail on Trivial Alterations to Theory-of-Mind Tasks"
---

# Ullman 2023 — LLM ToM failures

Ullman, T.
(2023).
Large Language Models Fail on Trivial Alterations to Theory-of-Mind Tasks. arXiv:2302.08399.

The paper demonstrating that LLM performance on classical false-belief tasks is *brittle* — collapsing under systematic but trivial perturbations of task surface features.
A direct response to Kosinski (2023), which had reported high LLM accuracy on standard ToM tasks.

Methodology:

- Take standard false-belief tasks LLMs pass.
- Apply systematic perturbations: rename characters, change object identities, alter narrative ordering, modify irrelevant details.
- Test LLM accuracy on perturbed versions.

Findings:

- LLM performance drops substantially on perturbed tasks, often to near-chance.
- Failures are systematic, not random — suggesting surface-feature exploitation rather than robust ToM.
- Children pass the same perturbed tasks readily; the brittleness is LLM-specific.

Interpretation:

- LLMs likely *pattern-match* on training-data ToM task surface features.
- Apparent ToM may not reflect robust mental-state attribution.
- Standard ToM benchmarks are insufficient evidence; perturbation testing is necessary.

The paper has been widely cited and has reshaped methodology for LLM ToM evaluation.
Subsequent work has both replicated Ullman's findings on additional LLMs and developed more sophisticated perturbation batteries.

The Kosinski-Ullman exchange exemplifies the contemporary LLM ToM debate — what counts as evidence for ToM, the methodological standards for evaluation, and the underlying question of what LLMs are doing when they appear ToM-capable.

Cited by: [machine-theory-of-mind](teaching/explanations/machine-theory-of-mind.md), [the-llm-tom-debate](teaching/explanations/the-llm-tom-debate.md), [do-llms-have-theory-of-mind](questions/do-llms-have-theory-of-mind.md).
