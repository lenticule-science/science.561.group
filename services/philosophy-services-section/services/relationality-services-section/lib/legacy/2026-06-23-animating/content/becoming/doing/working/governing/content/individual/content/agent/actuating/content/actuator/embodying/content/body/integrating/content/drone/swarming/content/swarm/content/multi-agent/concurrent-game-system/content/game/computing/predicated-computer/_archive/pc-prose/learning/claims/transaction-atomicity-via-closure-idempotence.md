---
type: theorem
class: engineering-claim
status: proved
depends-on: [transaction, closure-2-monad, closure-2-monad-lax-idempotence, closure-driven-settling-monotonicity, settlement-via-closure-2-monad, knowledge-order, retraction]
see-also: [settlement-via-closure-2-monad, compaction-via-cosettling-equivalence-class]
---

# Transaction atomicity follows from closure 2-monad lax-idempotence

**Claim.** For any [transaction](teaching/explanations/transaction.md) $\tau$ on a substrate state $v \in A_p$, with pending updates $u_1, \dots, u_n$ producing a sub-settling $v \to v_1 \to \dots \to v_n^*$ where $v_n^* = \mathrm{cl}(v_{n-1} \vee_k u_n)$ is the sub-settling's fixed point, the substrate's two outcomes are:

- **Commit.** Install $v_n^*$ as the new substrate state. Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), $\mathrm{Cl}(v_n^*) = v_n^*$ — committing a committed transaction is a no-op.
- **Abort.** Discard the sub-settling; return to base $v$. Per [retraction](../morphisms/retraction.md), the abort is a repair-authorized retraction recording the discarded sub-settling.

There is no third outcome — no "partial commit" of some $u_i$ but not others. Atomicity is *structural*, not protocol: the closure-driven sub-settling either reaches its fixed point (commit-eligible) or is discarded (aborted).

## Why this holds

The argument follows from three combined PredCat properties.

**Part 1: The sub-settling is monotone.** Per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), each step $v_i \to v_{i+1} = \mathrm{cl}(v_i \vee_k u_{i+1})$ satisfies $v_{i+1} \geq_k v_i$ in the [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md). The sub-settling is therefore a $\leq_k$-chain in the fiber $A_p$.

**Part 2: The fixed point is uniquely determined.** Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the closure 2-monad $\mathrm{Cl}$ is lax-idempotent: $\mu \cdot \eta_\mathrm{Cl} = 1_\mathrm{Cl}$. The fixed point $v_n^*$ is therefore the unique closure of the sub-settling's join $v \vee_k u_1 \vee_k \dots \vee_k u_n$ (per the joint property of monad multiplication and the join). Two sub-settlings with the same base and the same multiset of pending updates produce the same fixed point — order-independence of update application within the sub-settling.

**Part 3: Commit installs the join atomically; abort retracts the join atomically.** Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), substrate state transitions are $\mathrm{Cl}$-applications. The commit's substrate transition is $v \to v_n^*$ — a single $\mathrm{Cl}$-application of the joint pending updates. Per the algebra-as-property corollary (Kelly-Lack K2), this transition is structurally well-defined; the substrate cannot be in an intermediate state $v_i$ for $0 < i < n$ from outside the sub-settling's own observation.

Atomicity is therefore not enforced by a coordination protocol — it is a property of the closure 2-monad's algebra structure on the substrate's fibration.

## Engineering consequence

- **Commit idempotence is structural.** Re-committing a transaction is a no-op. Per lax-idempotence, $\mathrm{Cl}(v_n^*) = v_n^*$ — the substrate's commit operation is naturally idempotent.
- **Abort is an explicit retraction, not a missing commit.** A transaction that fails to commit is *aborted*; its sub-settling is recorded and retracted. There is no silent rollback; per [witness](../objects/witness.md), the abort is auditable.
- **Order-independence within a transaction.** The sub-settling's fixed point depends only on the multiset of pending updates, not their ordering. Two transactions with the same base and same updates in different orders commit to the same state.
- **Concurrent transactions reduce to closure-merge.** Per the concurrent transactions are concurrent sub-settlings; their joint fixed point is the $\vee_k$-join of the individual fixed points, closed. When the sub-settlings commute under closure-merge (per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md)), no isolation conflict arises; when they don't, the substrate's isolation level determines whether one is rejected, both proceed and merge, or one is reordered.

## What the theorem rules out

- **Partial commit.** A substrate that installs some but not all of $u_1, \dots, u_n$ has not implemented the closure-2-monad's atomicity. The fixed point either is or is not installed; no fragment is admissible.
- **Commit-without-fixed-point.** A substrate that commits before the sub-settling reaches its fixed point has confused commit with intermediate state. The commit must wait for the closure-driven settling to converge.
- **Abort-as-overwrite.** Abort is *retraction*, not *backwards-overwrite*. The substrate records that the sub-settling existed and was discarded; it does not silently revert as if the transaction never happened.

## What the theorem requires

- The substrate implements the closure 2-monad $\mathrm{Cl}$ per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md).
- The transaction's pending updates are admissible cells in the fiber $A_p$ (no schema violation).
- The base $v$ is itself a $\mathrm{Cl}$-fixed point (i.e., the substrate's pre-transaction state is settled).

## Position

Together with [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md) and [compaction-via-cosettling-equivalence-class](compaction-via-cosettling-equivalence-class.md), this theorem grounds the substrate's transaction discipline in the closure 2-monad's structure. Atomicity is a property of the monad's algebra structure, not a protocol layered on top — exactly as the same monad-structural property gives commit-idempotence and compaction-equivalence-classes their structural form.
