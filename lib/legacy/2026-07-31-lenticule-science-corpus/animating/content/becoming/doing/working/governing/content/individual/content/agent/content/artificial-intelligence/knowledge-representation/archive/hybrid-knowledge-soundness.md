---
type: theorem
class: contemporary
status: established
depends-on:
  - teaching/explanations/neurosymbolic.md
  - ../morphisms/neurosymbolic-translation.md
see-also:
  - neurosymbolic-tradeoff.md
references:
  - references/garcez-neurosymbolic2022.md
---

# Hybrid knowledge soundness

## Statement

A hybrid neurosymbolic system preserves **soundness**
of symbolic inference *only* when its neural
component:

1. Operates as an *advisor* to symbolic inference
   (proposing candidates verified by the symbolic
   system), or
2. Operates *within constraints* enforced by the
   symbolic component, or
3. Has its outputs *post-verified* by symbolic
   reasoning.

Naive integration where neural outputs feed
symbolic inference *without verification* loses
soundness: errors in neural outputs propagate to
symbolic conclusions.

## What soundness means

**Soundness** of an inference system: every
derivable conclusion is true in every model of the
premises. The fundamental correctness property.

A sound symbolic system never derives false
conclusions from true premises.

## How hybrids can lose soundness

Common failure pattern:

- Neural system extracts symbolic facts from text
  (e.g., "Paris is the capital of France").
- Some extracted facts are wrong ("Bonn is the
  capital of Germany" — outdated).
- Symbolic system reasons over extracted facts.
- Conclusions from wrong premises may be wrong but
  validly *derived* — symbolic system has lost
  soundness because its premises are bad.

The symbolic system itself remains sound (derives
correctly from its premises) — but the *hybrid* is
unsound because the premises came from an unreliable
source.

## Three preserving patterns

### 1. Advisor pattern

Neural component *suggests* candidates; symbolic
component *verifies*.

- Example: neural theorem prover suggests proof
  steps; symbolic checker verifies.
- Sound because every accepted output is checked.
- Cost: verification.

### 2. Constraint pattern

Symbolic component *enforces* hard constraints on
neural outputs.

- Example: code generation with type-checking
  loop until type-correct.
- Sound for constraints checked.
- Cost: checking and re-generation.

### 3. Post-verification pattern

Neural component generates freely; symbolic
component verifies after.

- Example: LLM generates math; symbolic checker
  verifies arithmetic.
- Sound for whatever's verified.
- Cost: verification + handling rejection.

These all preserve soundness *for what's verified*;
unverified outputs may still be wrong.

## Why this matters

- **Safety.** Production systems often need sound
  outputs in critical contexts (medical, legal,
  scientific).
- **Trust.** Users rely on soundness for trust.
- **Verification.** Sound inference allows formal
  verification of properties.
- **Debugging.** Sound systems are easier to debug
  (errors localize).

## What you give up

Sound hybrids:

- Often slower (verification cost).
- More restrictive output (only what's verifiable).
- More engineering complexity.

Tradeoff: soundness vs throughput/scope.

## In contemporary AI

- **Tool-using LLMs.** When LLM outputs to tool, is
  re-grounded; partially sound.
- **Code generation with tests.** Tests verify
  generated code.
- **Theorem proving.** Lean / Coq verify neural
  proof suggestions.
- **Math problem solving.** Symbolic verification
  of LLM math.

In all, the verifier preserves soundness for the
verified portion.

## Limits

- **Verification incomplete.** Can't verify
  everything; unverified outputs may be wrong.
- **Verifier scope.** Verifier must cover what
  matters; gaps in verifier scope let errors through.
- **Cost.** Verification can be expensive.
- **False rejection.** Verifier may reject correct
  outputs that look wrong.

## Status

Increasingly recognized constraint. Production
neurosymbolic systems increasingly adopt advisor /
verifier patterns. Active research on
verification-aware neural training to reduce false-
rejection rates.
