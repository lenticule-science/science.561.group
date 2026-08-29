---
type: narrative
status: active
see-also:
  - ../teaching/explanations/machine-theory-of-mind.md
  - ../theorems/behavioral-equivalence-underdetermination.md
  - ../theorems/tom-from-behavior-bound.md
  - ../learning/questions/do-llms-have-theory-of-mind.md
---

# The LLM ToM debate

Whether large language models have theory of mind is one of the most active and contested questions in contemporary AI cognitive science.
The debate combines empirical findings, methodological disagreements, and deep questions about what would count as evidence.

## The triggering finding (Kosinski 2023)

Kosinski reported that GPT-3.5 and especially GPT-4 performed at high accuracy on classical false-belief tasks adapted to text format:

- Sally-Anne style scenarios where the model must predict behavior given an actor's false belief.
- Smarties-task style scenarios about contents of containers.
- Various other ToM-probe variations.

GPT-4 reportedly performed at levels comparable to or exceeding 7-year-old children on standard tasks.
The paper interpreted this as evidence of "spontaneous emergence" of ToM in LLMs.

The finding generated wide attention.

## The pushback (Ullman 2023)

Ullman responded with a perturbation study: take the same false-belief tasks and apply systematic perturbations:

- Swap character names.
- Change object identities.
- Alter narrative ordering.
- Negate key propositions.
- Modify irrelevant details.

If the LLM has *robust* ToM, these perturbations should not affect performance much (children pass perturbed tasks readily).
If the LLM has *surface-feature* exploitation, perturbations should systematically reduce performance.

Ullman found the latter: LLM performance on perturbed tasks dropped substantially.
The interpretation: LLMs are pattern-matching on training-data surface features, not implementing robust ToM.

## The escalation

Subsequent work expanded both sides:

**Pro-ToM evidence:**

- More sophisticated LLM evaluations show some success on novel ToM tasks.
- Specific architectures (chain-of-thought, scratchpad reasoning) improve LLM ToM performance.
- Behaviorally, LLMs demonstrate many ToM-relevant capabilities in interactive settings.

**Anti-ToM evidence:**

- Continued perturbation studies expose brittleness.
- Mechanistic interpretability work suggests LLMs may not implement ToM-like circuits in robust ways.
- Failure modes (hallucinated mental states, confused perspectives) persist across model generations.

## The methodological dispute

Underneath the empirical disputes is a *methodological* disagreement about what would count as evidence:

**Behavioral position.** A system has ToM if it produces ToM-consistent behavior across a sufficient range of tasks.
By this criterion, LLMs have substantial ToM.

**Mechanistic position.** A system has ToM only if its internal computation implements something recognizable as mental-state representation and inference.
By this criterion, LLM ToM status is unclear.

**Functional position.** A system has ToM if it can *use* attributed mental states across diverse novel scenarios.
By this criterion, LLMs have partial ToM — working on some tasks, failing on others.

**Pragmatic (Dennettian) position.** "Has ToM" is predictively useful framing rather than metaphysical attribute.
Whether attributing ToM to LLMs is useful varies by application.

These positions yield different empirical assessments; the disagreement is partly about *what question is being asked*.

## The underdetermination problem

A foundational issue: per [tom-from-behavior-bound](../theorems/tom-from-behavior-bound.md), behavior alone is structurally insufficient to determine whether a system has ToM.
The same behavior is consistent with multiple internal organizations.

This means:

- LLM passing of false-belief tasks **doesn't establish** ToM.
- LLM failure on perturbed tasks **doesn't refute** the possibility of any ToM (failures might reflect limitations rather than absence).
- The debate is partly *unwinnable* on behavioral evidence alone.

## What might settle it

Several methodological additions could advance the debate:

- **Mechanistic interpretability of ToM circuits.** Identifying whether LLMs have circuits implementing ToM-like operations.
- **Out-of-distribution ToM tests.** Testing on tasks far from training distribution.
- **Cross-architectural comparison.** Whether the same ToM behaviors emerge across architectures.
- **Theoretical accounts of LLM ToM.** Theories of how next-token prediction could implement ToM, with predictions about when it would work and fail.

Each is partially developed; none has decisively resolved the debate.

## The position-of-most-experts

A reasonable summary of expert opinion (which varies):

- **LLMs exhibit substantial ToM-consistent behavior.**
- **They implement *something* that produces this behavior.**
- **Whether that something is "real ToM" depends on the criterion used.**
- **It is not the same as human ToM** (different mechanism, different failure modes).
- **It is task-sensitive** (works on some, fails on others).
- **It is improving over generations** but not monotonically.

Most experts would resist both "LLMs definitely have ToM" and "LLMs definitely don't have ToM."

## What this means for AI deployment

Practical implications:

- **Don't assume robust ToM.** LLM ToM behavior is brittle; deployments shouldn't assume it.
- **Don't deny ToM-relevant capabilities.** LLMs can do many ToM-relevant tasks; designs can exploit this.
- **Monitor for failure modes** specific to ToM tasks in deployed systems.
- **Mechanistic understanding matters.** Long-term reliability requires understanding what LLMs are doing internally.

## Status

Highly active research area.
The empirical record accumulates; the methodological dispute persists.
Likely to remain unsettled for some time, with progress coming from accumulating mechanistic interpretability evidence alongside continued behavioral investigation.
The question is also *important* — bears on AI alignment, deployment safety, and the broader question of what contemporary AI systems are.
