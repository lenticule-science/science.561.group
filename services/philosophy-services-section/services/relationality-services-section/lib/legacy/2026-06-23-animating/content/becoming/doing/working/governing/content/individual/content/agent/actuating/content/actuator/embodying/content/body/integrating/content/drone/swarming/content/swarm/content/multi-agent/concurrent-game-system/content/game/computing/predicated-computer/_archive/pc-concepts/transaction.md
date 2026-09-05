---
type: concept
class: coherence-discipline
depends-on: [settlement-determinism, settling-monotonicity, witness, retraction, closure-2-monad, closure-2-monad-lax-idempotence, predication-fibration, knowledge-order]
see-also: [multi-cell-coherence, transaction-atomicity-via-closure-idempotence]
---

# Transaction

A *substrate-recorded multi-cell atomic operation*. In the substrate's hyperdoctrine setting, a transaction is not a coordination primitive layered on top of cell admission — it is *a finite sub-settling on the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) $\mathrm{Cl}$ of the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), with commit equal to the sub-settling's fixed point and abort equal to discarding the sub-settling and returning to its base*. Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the iterative structure that makes commit well-defined is exactly $\mathrm{Cl}$'s lax-idempotence: re-applying $\mathrm{Cl}$ to an already-closed value returns the same value, so commit's "all updates apply or none" is structural, not protocol.

## Hyperdoctrinal structure

A transaction $\tau$ on a substrate state $v$ has the structure:

- **Base.** The pre-transaction substrate state $v \in A_p$ (a value in the appropriate fiber).
- **Pending updates.** A finite sequence of cell-admission predications $u_1, u_2, \dots, u_n$ to be added.
- **Sub-settling.** The closure-driven settling $v \to v_1 \to v_2 \to \dots \to v_n$ where $v_{i+1} = \mathrm{cl}(v_i \vee_k u_{i+1})$. Per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), this is $\leq_k$-monotone in the [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md): each step adds information, never removes it.
- **Commit.** The sub-settling's fixed point $v_n^*$ becomes the new substrate state. Per lax-idempotence, $\mathrm{Cl}(v_n^*) = v_n^*$ — committing twice produces the same result.
- **Abort.** The sub-settling is discarded; the substrate returns to base $v$. Per [retraction](../morphisms/retraction.md), this is a repair-authorized retraction recording that the transaction's pending settling existed and was discarded.

Per [transaction-atomicity-via-closure-idempotence](../theorems/transaction-atomicity-via-closure-idempotence.md), the substrate's atomicity is structural: a transaction either reaches its fixed-point commit (all updates apply, by closure-driven-settling-monotonicity composed at each step) or returns to base (no updates apply, by the retraction discipline). There is no intermediate state observable from outside the transaction's sub-settling.

## Transaction structure (engineering surface)

- **Transaction-id.** Substrate identifier for the sub-settling.
- **Pending updates.** The cell-admission predications $u_1, \dots, u_n$.
- **Isolation level.** The transaction's view of concurrent transactions. In the hyperdoctrine setting, isolation levels correspond to which fiber the sub-settling reads from: `read-uncommitted` reads other transactions' open sub-settlings; `read-committed` reads only fixed points; `repeatable-read` snapshots a fiber at transaction start; `serializable` requires the closure-merge of concurrent sub-settlings to commute.
- **State.** `pending` (sub-settling in progress), `prepared` (sub-settling reached fixed point, awaiting commit signal), `committed` (fixed point installed as substrate state), `aborted` (sub-settling discarded).
- **Conflict-detection policy.** What the transaction does when its updates conflict with concurrent sub-settlings: `optimistic-retry` (re-derive the sub-settling against the new base), `pessimistic-lock` (uses [lock](theories/functional-runtime-platform/concepts/lock.md) to serialize sub-settling construction), `last-writer-wins` (commit unconditionally, accepting overwrites).

## Why "closure-monad iteration" is the right grounding

A naive view: transactions are an external coordination protocol (begin/commit/rollback) added to the substrate. But that view doesn't explain *why* commit is idempotent, *why* abort is structural rather than ad-hoc, or *why* the substrate's settlement-determinism applies to transactions specifically. The substrate's answer: each of these is a property of the closure 2-monad's lax-idempotence applied to a sub-fibration.

- **Commit idempotence** is $\mathrm{Cl}^2 \xRightarrow{\mu} \mathrm{Cl}$ with $\mu \cdot \eta_\mathrm{Cl} = 1_\mathrm{Cl}$ (per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md)). Re-committing a committed transaction returns the same fixed point.
- **Atomicity** is the closure-driven-settling-monotonicity property: each step of the sub-settling adds knowledge, the fixed point is the join of all steps, and the commit installs the join atomically (per [transaction-atomicity-via-closure-idempotence](../theorems/transaction-atomicity-via-closure-idempotence.md)).
- **Determinism** is per [settlement-determinism](../theorems/settlement-determinism.md): the sub-settling is a function of its base and pending updates; replay produces the same fixed point.
- **Audit** is per [witness](../objects/witness.md): commit and abort are witnessed events; the sub-settling's intermediate values are recorded.

## Transactions interact with federation-convergence

- **Single-substrate transactions.** Atomic per the closure-monad discipline. The fixed point installs in one fiber-update.
- **Cross-substrate transactions.** Require either two-phase commit (synchronous, blocks until all participants reach prepared state on their local sub-settlings, then all commit together) or saga patterns (asynchronous, with compensating closure-driven-settlings as compensating actions). Per [federation-convergence](../theorems/federation-convergence.md), cross-substrate atomic transactions are inherently more expensive than CRDT-shaped operations because they require synchronizing fixed-point installation across substrates.
- **CRDT-shaped operations.** Per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), updates that are commutative under $\vee_k$ require no transaction — peers can independently apply and the closure-merge converges. The substrate's discipline is to use CRDT where possible and reserve transactions for genuinely-non-commutative updates.

Per [retraction](../morphisms/retraction.md)'s discipline, transaction abort is a repair-authorized retraction of the sub-settling. The aborted predications form their own settling that ends at the abort point; the post-abort substrate continues with the pre-transaction state $v$.
