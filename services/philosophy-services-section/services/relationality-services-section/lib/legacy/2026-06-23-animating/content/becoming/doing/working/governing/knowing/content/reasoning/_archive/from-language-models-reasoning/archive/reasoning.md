---
title: "Reasoning"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
depends-on: []
see-also:
  - deductive-reasoning
  - inductive-reasoning
  - abductive-reasoning
  - common-sense-reasoning
  - formal-reasoning
  - chain-of-thought
discipline: >
  The study of inference in AI systems: the classical
  triad (deductive, inductive, abductive), common-sense
  reasoning, formal proof, and chain-of-thought in
  LLMs. Connects classical logic and proof theory with
  the empirical reasoning behavior of foundation
  models.
---


**Reasoning** in AI is the general capacity to derive
conclusions from premises, evidence, or context.
Spans formal logical inference and informal everyday
inference. The umbrella under which deductive,
inductive, abductive, common-sense, and chain-of-
thought reasoning sit.

## The classical taxonomy

Three traditional kinds, all sibling-placed below:

- **Deductive.** From premises that necessitate the
  conclusion. Truth-preserving.
- **Inductive.** From observed instances to general
  rule. Truth-suggesting, not preserving.
- **Abductive.** From evidence to best-explanation
  hypothesis. Defeasible.

Each has formal foundations and AI realizations.

## What reasoning systems do

Across types:

- **Derive new conclusions** from existing knowledge
  + inputs.
- **Check claims** against premises.
- **Explain** why a conclusion holds.
- **Plan** sequences of steps to achieve goals.
- **Diagnose** explanations for observed states.
- **Generalize** from data to rules.

Different reasoning types specialize in different of
these.

## Formal vs neural reasoning

Two broad approaches in AI:

### Formal / symbolic

- Explicit inference rules.
- Provable soundness/completeness.
- Brittle outside formal scope.
- Examples: theorem provers, logic programs, rule
  systems.
- Substrate (proof, inference-rule) lives under
  `formal-reasoning/`.

### Neural

- Pattern matching and statistical generalization.
- Robust, scalable.
- Lacks formal guarantees.
- Examples: neural networks, large language models.

Modern reasoning research is largely about how to
achieve reliable inference with neural systems and
how to combine the two.

## Chain-of-thought reasoning

The contemporary phenomenon: LLMs solve harder
problems when prompted to produce step-by-step
reasoning traces. Empirically robust but
theoretically contested. Whether CoT is *real
reasoning* or *fluent mimicry* is unresolved. Sits
at `chain-of-thought/`.

## Common-sense reasoning

Human everyday inference uses a vast, mostly tacit
body of "common sense." This has resisted symbolic
formalization. LLMs trained on web text have made
empirical progress on common-sense benchmarks via
implicit knowledge. Sits at `common-sense-reasoning/`.

## Reasoning in agents

Reasoning is a *means* to action for AI agents:

- Plan-execution: reason about steps, execute.
- Diagnosis: reason about causes from symptoms.
- Decision: reason about consequences, choose.
- Explanation: reason about *why* an action was
  taken.

## Limits and open issues

- **Verification.** Hard to know whether reasoning
  is correct without checking.
- **Scaling.** Symbolic reasoning has combinatorial
  complexity; neural reasoning has reliability
  issues.
- **Faithfulness.** Reasoning traces may not reflect
  actual computation.
- **Common sense.** Long-standing AI difficulty.

## In contemporary AI

- **Reasoning models.** Models trained explicitly
  for multi-step reasoning (OpenAI o-series,
  DeepSeek-R1).
- **Test-time compute.** Trading inference compute
  for accuracy via more reasoning steps.
- **Tool-augmented reasoning.** LLM + calculator,
  code, search.
- **Verification.** Symbolic verifiers checking
  neural reasoning.

## Status

Foundational concept; substantial active research.
The relationship between classical reasoning theory
and the empirical reasoning behavior of LLMs is one
of the most active research questions.
