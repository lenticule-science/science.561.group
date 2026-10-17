---
type: theorem
class: informal
status: active
depends-on:
  - ../objects/belief-state.md
  - teaching/explanations/mental-state-attribution.md
see-also:
  - tom-from-behavior-bound.md
references: []
---

# Behavioral-equivalence underdetermination

**Statement (informal).** Two agents that produce identical behavior across all observed situations may have arbitrarily different mental states, mechanisms, and internal organizations.
Behavioral equivalence does not entail mental-state equivalence.

## What it asserts

- Many distinct internal mental-state configurations can produce the same observed behavioral output.
- No finite behavioral observation suffices to pin down the unique internal configuration.
- Mental-state attribution from behavior is therefore *inherently inferential* — committing to one of many consistent attributions on grounds beyond pure behavior.

## Why it holds

The observed-behavior space is generally lower- dimensional than the internal-state space:

- **Many beliefs** can produce the same action under different preference assumptions.
- **Many goals** can produce the same action sequence under different planning algorithms.
- **Many mechanisms** (different neural networks, different programs, different Bayesian models) can implement behaviorally equivalent functions.
- **Many internal architectures** (modular, monolithic, recurrent, feedforward) can compute the same input-output mapping.

This is the same reason inverse problems are typically ill-posed.

## Concrete examples

- **Lookup-table agent vs reasoning agent.** A sufficiently large lookup table can reproduce any finite behavioral specification; from behavior alone, it's indistinguishable from a reasoning agent.
- **Behaviorist vs cognitive accounts.** Both can predict behavior in restricted domains; differ in internal commitments not testable from behavior alone.
- **Different decision theories** (CDT, EDT, FDT) can produce identical behavior in many situations, diverging only on Newcomb-like cases that may not arise.
- **Different LLM architectures** trained on similar data can produce similar behavior despite different internals.

## Implications for ToM

- **ToM attributions are underdetermined.** From behavior alone, multiple ToM attributions are consistent.
- **Disambiguation requires non-behavioral evidence.** Mechanism inspection, communication, intervention experiments.
- **The "really has" question may not be empirically resolvable** from behavior alone.
- **Conventions matter.** Practical ToM relies on conventional attribution defaults, not just inference from behavior.

## Implications for machine ToM

This result bears directly on the LLM-ToM debate:

- **LLMs passing false-belief tasks** is consistent with multiple internal organizations: real ToM, pattern-matching on training data, surface-feature exploitation.
- **Behavioral equivalence to ToM-having humans** does not entail LLM ToM; the inference is underdetermined.
- **Mechanistic interpretability** is needed to distinguish behaviorally equivalent mechanisms.
- **Robust generalization** across novel scenarios provides *some* disambiguation but not complete.

## Connections

Related to:

- [tom-from-behavior-bound](tom-from-behavior-bound.md) — broader claim about ToM inference.
- *Underdetermination of theory by data* in philosophy of science.
- *Identifiability* in statistics and learning theory.
- *Interpretability* — the project of resolving underdetermination through internal inspection.

## Limits

- **The underdetermination is asymptotic.** With *infinite* observation, some attributions might become more plausible than others — but never with certainty.
- **Pragmatic disambiguation.** In practice, ToM attributions are made on conventional and contextual grounds beyond pure behavior; this works for most purposes.
- **Cross-modal evidence.** Combining behavior with other evidence (mechanism, self-report, anatomy) can partially disambiguate.

## Status

Informal but well-recognized.
Implicit in much philosophy of mind, cognitive science, and AI interpretability discourse.
Relevant for the contemporary debate about machine ToM where behavioral evidence alone is being asked to settle attribution questions behavioral evidence is structurally unable to settle.
