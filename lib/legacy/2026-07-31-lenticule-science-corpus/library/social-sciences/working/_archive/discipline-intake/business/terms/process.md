---
id: process
description: "A Process is a fully determined operation: both its meaning and its execution path are fixed before it runs. Same input always produces same output. Corresponds to Fix(σ)∩Fix(Δ) in the nuclear quartet."
extends: FlatfileAgentialResourceSystemSkillfulWork
date-modified: 2026-03-19
params:
  input: relational-universe
  specification: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  nuclear-fixed-point-satisfaction:
    - relational-history-saturating-nucleus:
        - specification
    - relational-history-transferring-nucleus:
        - specification
---

# Process

## Formal definition

A **Process** is an element $W$ of the fiber $H_t$ satisfying both nuclear fixed-point conditions:

$$W \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$
$$\sigma_t(W) = W \quad\text{and}\quad \Delta_t(W) = W$$

As a [Skill](skills.md) type, a Process is a morphism $f : A \to B$ with the guarantee that $f(a) \in H^*_t$ for all inputs — the output is always fully settled before it is inspected.

**The nuclear quartet.** The four positions partition $H_t$ (excluding $\bot$):

| Position | Nuclear condition | Set |
|---|---|---|
| **Process** | $\sigma_t(W) = W$ and $\Delta_t(W) = W$ | $H^*_t$ |
| [**Procedure**](procedure.md) | $\sigma_t(W) = W$ and $\Delta_t(W) \neq W$ | $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ |
| [**Derivation**](derivation.md) | $\sigma_t(W) \neq W$ and $\Delta_t(W) = W$ | $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ |
| [**Inquiry**](inquiry.md) | $\sigma_t(W) \neq W$ and $\Delta_t(W) \neq W$ | $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ |

The joint projection $\pi_t = \sigma_t \circ \Delta_t : H_t \to H^*_t$ maps every element into Process position — closing all open questions of meaning and execution. A Process is the fixed point of $\pi_t$.

## What this is

A **Process** is a defined, repeatable transformation: given the same input, it always produces the same output.
This is what the word "process" names in business process management (ISO 9000) and formal methods alike — a transformation whose complete behavior is determined by its specification before it runs.

In this system, a Process is [FlatfileAgentialResourceSystemSkillfulWork](flatfile-agential-resource-system-skillful-work.md) in which both closure nuclei have been applied: meaning-closure (σ) and execution-closure (Δ).
The result is full determination — no open questions about what it is doing or how it will do it.

The mathematical position is Fix(σ)∩Fix(Δ) — the intersection of both fixed-point sub-algebras in the nuclear quartet ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md)).
The joint projection π reflects every operation into this position.
A Process is already there.

## What full determination means

Meaning-closure (σ) means the Process knows what it is about.
Its purpose, its domain, its output type — all settled.
Execution-closure (Δ) means the Process knows exactly how to proceed.
No branches, no judgment calls, no conditions to evaluate.
Every step follows from the previous one without decision.

An operation that contains conditions is not yet Δ-closed — it is a [Procedure](procedure.md).
An operation whose purpose is still being established is not yet σ-closed — it is a [Derivation](derivation.md) or [Inquiry](inquiry.md).

## The other three positions

- [Procedure](procedure.md) — meaning-closed, execution-open: knows what, branches on how.
- [Derivation](derivation.md) — execution-closed, meaning-open: follows fixed rules, produces a judgment.
- [Inquiry](inquiry.md) — neither closed: open exploration.
- [FlatfileAgentialResourceSystemSkillfulWork](flatfile-agential-resource-system-skillful-work.md) — all four positions together exhaust the nuclear quartet.

## Open questions

- Formal proof that σ-closure and Δ-closure together imply determinism for skill work — blocked by: skill-algebra construction.
