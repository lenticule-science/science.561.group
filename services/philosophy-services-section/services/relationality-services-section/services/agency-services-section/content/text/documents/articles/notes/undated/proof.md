---
type: object
class: foundational
status: active
depends-on:
  - inference-rule.md
see-also:
  - deduction-step.md
  - ../morphisms/proof-search.md
references:
  - references/russell-norvig-ai2020.md
title: Proof
description: A proof is a finite sequence of inference steps demonstrating that a conclusion follows from premises.
---

# Proof

A **proof** is a finite sequence of inference steps
demonstrating that a conclusion follows from
premises. The artifact of formal reasoning that can
be checked mechanically for correctness.

## Structure

A proof:

- **Premises.** Initial assumptions.
- **Steps.** Each applying an inference rule to
  earlier steps.
- **Conclusion.** Final derived statement.

Each step justified by a previously-derived statement
or by a rule application.

## Forms

Proofs come in different presentations:

- **Linear.** Sequence of numbered steps with
  justifications.
- **Tree.** Steps as nodes; rule applications as
  edges.
- **Natural deduction.** Tree-structured with
  intro/elim rules.
- **Sequent.** Sequent-calculus derivation tree.
- **Resolution.** Sequence of resolvent clauses.
- **Tactic-based.** As constructed by interactive
  proof assistants.

Same logical content, different presentations.

## Proofs as objects

In modern proof assistants, proofs are *first-class
objects*:

- Stored as data structures.
- Type-checked by a small trusted kernel.
- Manipulated by tactics.
- Curry-Howard: proofs *are* programs.

This enables formal verification of proof
correctness.

## Properties

A proof typically:

- **Establishes a theorem.**
- **Uses only sound rules.**
- **Is finite.**
- **Is mechanically checkable.**
- **Can be communicated.**

These properties give proofs their epistemic value.

## Proof checking vs proof finding

- **Proof checking.** Verify a given proof. Easy
  (polynomial time for standard systems).
- **Proof finding.** Construct a proof. Hard
  (undecidable in general for FOL; high complexity
  for decidable fragments).

The asymmetry is fundamental: easier to check than
to find.

## Famous proofs

- **Four-color theorem.** First major
  computer-assisted proof (1976).
- **Kepler conjecture.** Computer-assisted proof of
  sphere-packing density.
- **Feit-Thompson theorem** formalized in Coq
  (2012). Major formal-mathematics achievement.
- **Compiler correctness** (CompCert). Verified C
  compiler in Coq.

These show formal proof at substantial scale.

## Proofs in AI

- **Theorem provers** produce proofs.
- **Proof assistants** (Lean, Coq, Isabelle) help
  humans construct proofs.
- **Verified software/hardware.** Production
  systems.
- **AI for math.** Recent direction: AI assists
  formal-math research.

## Proof and LLMs

Recent integration:

- LLMs as proof-step suggesters.
- LLMs translating informal proofs to formal.
- LLMs generating proof candidates checked by
  formal kernels.
- AlphaProof, LeanGym, Lean Copilot: hybrid
  systems.

The combination is more reliable than either alone:
LLM creativity + formal verification.

## Limits

- **Construction expensive.** Even with assistants,
  proofs take effort.
- **Proof-search complexity.** Combinatorial.
- **Formalization gap.** Many informal proofs hard
  to formalize.
- **Trust requires kernel correctness.** A proof is
  only as trustworthy as the checker.

## In contemporary AI

- **AI for formal math.** Major active program.
- **Verified ML systems.** Verifying properties of
  ML models.
- **Proof carrying code.** Code with attached
  correctness proofs.
- **Reasoning models** generate proof-like
  reasoning traces.

## Status

Foundational artifact. Standard in formal-methods
practice. Active integration with AI systems is
current research frontier.
