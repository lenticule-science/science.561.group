---
type: reference
class: contemporary
authors: [Emre Kıcıman, Robert Ness, Amit Sharma, Chenhao Tan]
year: 2023
venue: arXiv preprint
status: contested
---

# Kıcıman, Ness, Sharma & Tan, "Causal Reasoning and Large Language Models" (2023)

Empirical evaluation of LLM causal reasoning.

## What it argues

- LLMs (GPT-3.5, GPT-4) achieve strong performance
  on multiple causal reasoning benchmarks:
  - Pairwise causal discovery from text.
  - Counterfactual reasoning.
  - Mediation analysis.
  - Causal judgment.
- GPT-4 outperforms several dedicated causal
  discovery methods on benchmark tasks.
- LLMs may possess "causal reasoning" capabilities
  that arise from pre-training on causally-rich
  text.

## Why it matters

Concrete empirical evidence pushing back on the
"LLMs cannot reason causally" position. Reframes the
debate: not whether LLMs can do causal reasoning at
all, but what kind, when it works, and when it
fails.

The empirical results are striking; their
interpretation is contested.

## Caveats

- Benchmarks may be in training distribution.
- "Causal reasoning" is broad; LLM performance
  varies across types.
- Mechanism unclear: pattern matching, implicit
  causal models, or genuine reasoning?

## How to read

Empirical paper; results presented in tables. Worth
reading alongside Pearl-style theoretical positions
for the empirical balance.

## Related works

- Pearl-Mackenzie 2018 — Pearl-side argument.
- Bareinboim et al. 2020 — formal hierarchy
  constraints.
- Various follow-up empirical studies.
