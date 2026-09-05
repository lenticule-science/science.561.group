---
type: concept
class: invariant
depends-on: [event-log, predication-graph-store, d-frame, settlement-via-closure-2-monad, closure-2-monad]
see-also: [witness, repair, sublocale-as-application, replication-consistency-via-network-sheaf]
---

# Two-store coherence

The invariant that the [event log](../objects/event-log.md) (append-only, monotonic, source of truth in rigorous reading) and the [predication-graph store](../objects/predication-graph-store.md) (editable, queryable, source of truth in practical reading) record the same content. In the substrate's hyperdoctrine setting, the invariant is *exactly the [d-frame](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/d-frame.md)'s consistency-totality structure on the pair (log-derived state, store-state)*: the two stores are coherent iff the pair is in the d-frame's $\mathrm{con}$ relation, and the substrate's content is *defined* iff the pair is also in the $\mathrm{tot}$ relation.

When the two diverge — when the pair $(L_+, L_-) = (\mathrm{replay}(L), \mathrm{store})$ falls *out of* $\mathrm{con}$ — the system is *incoherent* and the substrate's other guarantees no longer hold. The substrate's repair discipline reads the $\mathrm{con}$-failure as a signal requiring resolution.

## Hyperdoctrinal structure

A substrate maintains two presentations of its content:

- $L_+$ — the *event-log-derived* state: $\mathrm{replay}(L) \in A_p$, the closure-fixed-point of replaying the log under the substrate's closure operator.
- $L_-$ — the *store* state: the predication-graph as currently held in $A_p$.

Per [d-frame](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/d-frame.md), the pair $(L_+, L_-)$ lives in a d-frame structure with two relations:

- $\mathrm{con}$ — *consistency*: $(L_+, L_-) \in \mathrm{con}$ exactly when the two presentations don't co-witness a contradiction. The disjoint-opens reading: the log says "this cell is $v$" and the store says "this cell is $v'$" with $v \neq v'$ produces a $\top$-witness — a $\mathrm{con}$-failure.
- $\mathrm{tot}$ — *totality*: $(L_+, L_-) \in \mathrm{tot}$ exactly when together the two presentations cover the substrate's content. The together-covering reading: every cell either appears in the log (will be replayed into the store) or appears directly in the store (was admitted via mutation).

The substrate's coherence invariant is then: **$(\mathrm{replay}(L), \mathrm{store})$ is in both $\mathrm{con}$ and $\mathrm{tot}$ at every cell**.

## Two architectural patterns realize the invariant

- **Event-first.** The event log is primary; every operator emits an event before any predication-graph mutation. A reducer projects the event log into the predication graph as a derived view. Coherence is a property of the reducer: the predication graph at time $t$ equals $\mathrm{replay}(L_t)$ — by construction, the pair $(L_+, L_-)$ has $L_+ = L_-$ pointwise, so $\mathrm{con}$ and $\mathrm{tot}$ hold trivially.
- **File-first.** The predication-graph store is primary (e.g., editable Markdown files); a hook records each mutation as an event in the event log. Coherence is a property of the hook: every change to the predication graph produces a corresponding event before the change becomes visible. Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the closure 2-monad's idempotence guarantees that re-replaying $L$ produces the same $L_+$; coherence requires the hook's discipline to keep $L_+ = L_-$.

The two patterns differ in *which side carries the burden of correctness*:

- Under event-first, divergence is impossible by construction *if* the reducer is deterministic and the predication graph is never mutated outside the reducer's path.
- Under file-first, divergence is possible whenever a mutation slips past the hook (a manual edit without the hook running, a bug in the hook, a race during concurrent writes). The system MUST detect divergence (e.g., by periodic re-derivation from the event log and canonical-hash comparison) and MUST [repair](repair.md) it before any further closure-rule applications use the diverged state.

## Why d-frame is the right grounding

A naive view: two-store coherence is a "the log and the store are byte-equal" check. But that view doesn't accommodate the substrate's $\bot$ / $\top$ structure: the log might *not yet have* an event the store reflects (a $\bot$ in $L_+$ paired with non-$\bot$ in $L_-$ — uninformed-vs-told mismatch, not a contradiction); or two operators might have raced and admitted contradictory mutations (a $\top$ situation that needs governance). The d-frame's $\mathrm{con}$ / $\mathrm{tot}$ structure expresses both:

- $L_+ = \bot$, $L_- = \mathbf{t}$: not a $\mathrm{con}$-failure — the store knows something the log doesn't yet record. Per the substrate's discipline, this is a hook failure (the mutation didn't get logged) — repair via emitting the missing event.
- $L_+ = \mathbf{t}$, $L_- = \mathbf{f}$: a $\mathrm{con}$-failure — the log says one thing, the store says another. Per [repair](repair.md), this is a $\top$-witness requiring resolution.
- $L_+ = \mathbf{t}$, $L_- = \mathbf{t}$: in $\mathrm{con}$ and $\mathrm{tot}$ — coherent.
- $L_+ = \bot$, $L_- = \bot$: in $\mathrm{con}$ but not $\mathrm{tot}$ — neither presentation has the cell. Per the substrate's policy, this may be a no-content situation or a missing-cell signal.

The d-frame structure on $(L_+, L_-)$ is exactly what lets the substrate distinguish these cases without collapsing them.

## Why this matters for audit

The invariant is what makes the [witness](witness.md) chain trustworthy: an auditor with the event log can re-derive the predication graph and verify it byte-for-byte. Without two-store coherence, the witness records something that does not match what the predication graph actually contains, and the audit becomes unsound. Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the substrate's settlement is deterministic on the log; coherence is what guarantees the auditor's re-derivation matches what the substrate's runtime is actually serving.

Per [replication-consistency-via-network-sheaf](../theorems/replication-consistency-via-network-sheaf.md), the same d-frame discipline extends to multi-replica consistency: each replica has its own $(L_+, L_-)$ pair, and the network-sheaf consensus across replicas is the d-frame limit of all pairs — coherent across the substrate exactly when every pair-of-replicas is in $\mathrm{con}$.
