---
type: theorem
class: engineering-claim
status: proved
depends-on: [transaction, transaction-record, begin-transaction, commit-transaction, settlement-determinism, retraction, closure-2-monad-lax-idempotence, closure-fixed-points-priestley-correspondence]
see-also: [federation-convergence]
---

# Transactions are atomic: all updates commit or none do

**Claim.** For any [transaction-record](../objects/transaction-record.md) processed via [commit-transaction](../morphisms/commit-transaction.md), the substrate's state after the commit reflects either *all* of the transaction's pending updates or *none* of them. Partial application is inadmissible.

## Why this holds

The argument follows from the substrate's transaction discipline.

**Part 1: Begin establishes a staging boundary.** Per [begin-transaction](../morphisms/begin-transaction.md), pending updates accumulate in the transaction-record's `pending-updates` field, not in the substrate's main state.

**Part 2: Commit applies updates atomically or not at all.** Per [commit-transaction](../morphisms/commit-transaction.md), the commit either:
- Applies all updates (success), advancing the substrate's settling per [settlement-determinism](settlement-determinism.md).
- Applies none and produces a conflict-witness (failure).

There is no commit-policy that admits partial application.

The mathematical reason there is no admissible partial commit is that the substrate's closure operator is the [closure 2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md), which is lax-idempotent per the [closure-2-monad lax-idempotence theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md). Lax-idempotence forces the algebra-structure on a [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) to be a *property*, not additional data: a fiber either is closed under the rule system or is not. A commit that applies some pending updates and not others would have to hand the substrate a fiber that is closed against some rule firings and open against others — a fiber that is partially a $\mathrm{Cl}$-algebra and partially not. Lax-idempotence rules this out structurally; only the all-closed fiber and the original-prefix fiber are admissible algebra states. Per the [closure-fixed-points / Priestley correspondence theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-fixed-points-priestley-correspondence.md), each of these two states corresponds to a closed subspace of the substrate's Priestley dual; the commit boundary is the substrate's choice between these two, and the choice is itself a property of the pending-update set, not a free parameter the commit can interpolate within.

**Part 3: Abort retracts pending state if any.** Per [retraction](../morphisms/retraction.md)'s repair-discipline, abort retracts any provisionally-staged content; the substrate continues with the pre-transaction state.

## Engineering consequence

- **Multi-cell coherence.** Operations that need multi-cell consistency (financial transactions, multi-step workflows, configuration updates spanning related entities) can rely on transactional atomicity.
- **Failure-safe.** A crash mid-transaction produces an abort on recovery (the transaction was never committed; the staged state is discarded).
- **Auditable.** Per [witness](../objects/witness.md), every transaction's begin/commit/abort is recorded; an auditor can verify transactional behavior.

## What the theorem rules out

- A transaction that "partially commits" with only some updates applied — non-conformant, breaks atomicity.
- A transaction whose conflict-detection produces inconsistent commit/abort decisions for the same inputs — violates [settlement-determinism](settlement-determinism.md).

## What the theorem requires

- Per [transaction-record](../objects/transaction-record.md), pending-updates are staged separately from substrate main state.
- Per [commit-transaction](../morphisms/commit-transaction.md), commit is structurally all-or-nothing.
- Per [settlement-determinism](settlement-determinism.md), commit outcomes are deterministic.
