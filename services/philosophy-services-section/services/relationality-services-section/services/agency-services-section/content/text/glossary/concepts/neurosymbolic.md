---
type: concept
class: contemporary
status: active
depends-on:
  - knowledge-representation.md
  - vector-knowledge.md
see-also:
  - ../morphisms/neurosymbolic-translation.md
  - ../theorems/neurosymbolic-tradeoff.md
references:
  - references/garcez-neurosymbolic2022.md
title: Neurosymbolic
description: Neurosymbolic AI integrates symbolic representations and reasoning with neural network learning.
---

# Neurosymbolic

**Neurosymbolic AI** integrates symbolic
representations and reasoning with neural network
learning. The aim: combine the precision and
verifiability of symbolic systems with the scale and
flexibility of neural learning.

## The motivation

Pure symbolic AI:
- Strong semantics, sound inference.
- Brittle, hard to scale, hard to learn from data.

Pure neural AI:
- Scales, learns, robust to noise.
- Opaque, hard to verify, lacks precise semantics.

Neither alone suffices for systems needing both
verification and scale. Neurosymbolic approaches aim
to combine.

## Architectures

A taxonomy (after Kautz, Garcez, Bader):

### Type 1: Symbolic Neuro Symbolic

- Pipeline: symbolic input → neural processing →
  symbolic output.
- Example: machine translation with symbolic
  parse trees.

### Type 2: Symbolic[Neuro]

- Symbolic system with neural subroutines.
- Example: AlphaGo (search with neural value/policy).

### Type 3: Neuro;Symbolic

- Co-routine: neural and symbolic alternate.
- Example: neural perception → symbolic planner →
  neural execution.

### Type 4: Neuro:Symbolic→Neuro

- Symbolic knowledge compiled into neural network.
- Example: Knowledge distillation into neural model.

### Type 5: NeuroSymbolic

- Neural network where symbolic structure is
  inherent.
- Example: TensorLog, Markov Logic Networks,
  graph neural networks with logical structure.

### Type 6: Neuro[Symbolic]

- Neural networks doing symbolic reasoning
  internally.
- Example: Neural theorem provers, transformers
  doing arithmetic.

These categorize integrations from "loose coupling"
(Type 1-2) to "tight integration" (Type 5-6).

## Approaches

Some active research lines:

- **Neural theorem provers.** Differentiable
  unification + backward chaining.
- **Logic Tensor Networks.** Logic constraints
  over neural network outputs.
- **DeepProbLog.** Probabilistic logic + neural
  predicates.
- **Differentiable inductive logic programming.**
  Learning logic rules with gradient methods.
- **Graph neural networks for KGs.** GNN over
  knowledge graphs combining symbolic structure
  with learning.
- **Tool-using LLMs.** LLM as neural component
  delegating to symbolic tools.
- **Verifier-guided generation.** Neural generation
  + symbolic verification.

These vary in maturity and scope.

## Why it's hard

- **Representation mismatch.** Symbolic
  (discrete, structured) vs neural (continuous,
  distributed) are different mathematical objects.
- **Differentiability.** Symbolic operations often
  not differentiable; gradient-based learning
  doesn't apply.
- **Combinatorial blowup.** Symbolic reasoning has
  combinatorial explosion; neural systems handle
  large but bounded structures.
- **Quality vs scale tradeoff.** Per
  [neurosymbolic-tradeoff](../../documents/articles/notes/undated/neurosymbolic-tradeoff.md),
  precision and flexibility trade off.

## Where it works well

Some demonstrated wins:

- **AlphaGo / AlphaZero.** Neural value/policy +
  symbolic Monte Carlo tree search.
- **Tool-using LLMs.** LLM + calculator/search/code
  significantly outperforms LLM alone on relevant
  tasks.
- **AlphaProof (DeepMind 2024).** Neural-guided
  Lean proof search.
- **Drug discovery.** GNN over molecular graphs.

Common pattern: neural for messy perception/scoring,
symbolic for structured reasoning.

## Where it doesn't (yet)

- **General-purpose hybrid systems.** No single
  architecture wins broadly.
- **Knowledge transfer.** Hard to transfer learned
  patterns into symbolic form for verification.
- **Update.** Updating hybrid systems is harder
  than updating either component alone.

## Critiques

- **Engineering complexity.** Hybrid systems are
  complex; the engineering may not pay off vs
  scaling pure neural.
- **"Bitter lesson"** (Sutton 2019): historical
  pattern is that hand-engineered structure loses
  to scale + learning. Skeptics expect
  neurosymbolic to lose to pure scaling.
- **Defenders.** Argue that some structured
  knowledge is inevitable; neurosymbolic gives a
  principled framework.

## In contemporary AI

- **Foundation-model + tool use.** The most
  successful current neurosymbolic pattern.
- **Reasoning models.** Models trained to do
  multi-step reasoning explicitly (some
  neurosymbolic in spirit).
- **Verified generation.** Neural generation +
  formal verification.

## Status

Active research with growing practical instances.
Tool-using LLMs are the strongest contemporary
example. Whether deeper neurosymbolic integration
becomes standard or scaling continues to dominate is
open.
