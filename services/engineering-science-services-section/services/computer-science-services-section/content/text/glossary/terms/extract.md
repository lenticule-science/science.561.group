---
type: morphism
class: refactor-generator
status: draft
depends-on: [codebase-cell-system, refactor]
realizes: [refactor]
name: Extract
description: A refactor that introduces a new definition (function, method, type) in the codebase cell-system, redirecting cells from the original site to the extracted definition, without changing the witness sheaf.
---

# Extract

A refactor that introduces a new definition (function, method, type) in the [codebase cell-system](codebase-cell-system.md), redirecting cells from the original site to the extracted definition, without changing the witness sheaf.

## Action

Given a region $R$ of the codebase — a set of cells encoding a piece of code at a definition $d$ — extract introduces a new entity $d' \in E_{\mathrm{code}}$ and a corresponding predicate-extension in $\Pi_{\mathrm{code}}$ representing the new function signature. The cells encoding $R$ inside $d$ are *moved* to be encoding $R$ inside $d'$, and a single new cell — `references` from $d$ to $d'$ at the call site — is introduced.

## When it is a refactor

Extract is in $N_W(v^{\mathrm{code}})$ iff:

1. The new entity $d'$ is fresh (was permanently $\bot$ before the extract). Otherwise the extract collides with existing content and is not an automorphism.
2. The witness cells under $W$ that previously witnessed the body of $d$ are tracked at $d$, not at the cells *inside* the body. Equivalently: $W$ does not track *implementation details* — it tracks the contract of $d$.

Under most reasonable test-only or public-API witness languages, both conditions hold and extract is a refactor. Under a source-text or behavior-only witness language with line-coverage instrumentation that names every line, condition 2 may fail.

## Inverse

Extract has an inverse in $N_W$ — [inline](inline.md) — collapsing the extracted definition back into its caller. The pair (extract, inline) generates a $\mathbb{Z}$-subgroup of $N_W$ for each extractable region.

## Where used

- [refactor-as-invisible-automorphism](../concepts/refactor-as-invisible-automorphism.md) — extract is a generator of $N_W$ for any witness language tracking only contracts.
- [extract-method-as-substrate-automorphism](../../documents/articles/teaching-articles/examples/extract-method-as-substrate-automorphism.md) — worked example.
