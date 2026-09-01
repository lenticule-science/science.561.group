---
type: theorem
class: engineering-claim
status: proved
depends-on: [compaction, event-log, closure-2-monad, iterated-cosettling-counts-derivable-cells, iterated-cosettling-via-moore-family, closure-2-monad-lax-idempotence, settlement-via-closure-2-monad]
see-also: [transaction-atomicity-via-closure-idempotence, settlement-via-closure-2-monad, non-destructive-compaction-realizes-cosettling-equivalence-class]
---

# Compaction is quotienting the log by the cosettling equivalence class

**Claim.** For any substrate event log $L$ that produces closure-fixed-point $w = T^*(L)$ under the substrate's closure operator $T$, the substrate may rewrite $L$ to any log $L'$ in the cosettling equivalence class

$$T^{*-1}(w) \;=\; \{L' : \mathrm{seed}(L) \subseteq L' \subseteq w\}$$

without changing the substrate's settled state. Per [iterated-cosettling-counts-derivable-cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md), this equivalence class is the lattice interval between the seed (cells with no incoming closure rule) and $w$, of size $2^{|w \setminus \mathrm{seed}|}$ — the substrate has structural freedom in which representative to choose.

[Compaction](teaching/explanations/compaction.md) is exactly this quotienting: select a canonical $L' \in T^{*-1}(w)$ that is smaller than $L$ but produces the same closure-fixed-point.

## Why this holds

Per [iterated-cosettling-counts-derivable-cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md), for a strict-regime closure operator $T$ with seed-derived target $w$:

- *Necessary condition for $L' \in T^{*-1}(w)$*: $\mathrm{seed}(L) \subseteq L'$ (cells with no incoming rule must be present in any prefix that produces $w$).
- *Sufficient condition*: $L' \subseteq w$ (any subset of $w$ that contains the seed produces $w$ under closure).

Per [iterated-cosettling-via-moore-family](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-via-moore-family.md), this generalizes beyond the strict regime: the cosettling equivalence class is the closure-equivalence interval $[\mathrm{generators}(w), w]$ in the Moore-family Galois connection $T \dashv \iota$.

Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the closure 2-monad $\mathrm{Cl}$ is lax-idempotent: $\mathrm{Cl}^2 \cong \mathrm{Cl}$. So if the original $L$ is already in the cosettling class's canonical representative, further compaction is a no-op — *compaction is itself idempotent*.

Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the substrate's settled state is uniquely determined by the closure-fixed-point. Two logs in the same cosettling equivalence class therefore produce indistinguishable substrate states; the substrate may freely rewrite from one representative to another.

## Engineering consequence

- **Replay-equivalence is structural.** The substrate's compaction-correctness check ($T^*(L') = T^*(L)$) succeeds *exactly* when $L' \in T^{*-1}(w)$. Per the theorem, this is decidable by checking $\mathrm{seed}(L) \subseteq L' \subseteq w$ without re-running the full closure.
- **Compaction is bounded structurally.** The maximally-compacted representative is the seed itself: $\mathrm{seed}(L) \in T^{*-1}(w)$, since seed alone produces $w$ under closure. The substrate's most-aggressive compaction policy reduces $L$ to its seed.
- **Compaction is idempotent.** Per lax-idempotence of $\mathrm{Cl}$, compacting a compacted log returns the same compacted log. The substrate's compaction operator naturally satisfies "fixed-point" semantics.
- **Audit-retention is policy on the equivalence class.** Different audit-retention policies select different representatives in $T^{*-1}(w)$: a forensic-retention policy selects $L$ itself (or a high-information representative); an aggressive-compaction policy selects the seed. The choice is policy; the equivalence class is structural.
- **Compaction composes with snapshots.** Per [snapshot](../objects/snapshot.md), a snapshot is a cache of $T^*(L)$. Since compaction preserves $T^*(L)$, the snapshot remains valid across compaction — no snapshot invalidation is needed when compacting.

## What the theorem rules out

- **Compaction outside the equivalence class.** A compaction that produces $L'$ not in $T^{*-1}(w)$ would change the substrate's settled state. Per the theorem, the substrate's check rejects such compactions; per [witness](../objects/witness.md), the rejection is auditable.
- **Compaction that breaks the seed.** Removing seed cells changes $T^{*-1}(w)$'s lower bound. The substrate refuses; per the theorem, the seed is structurally necessary.
- **Cross-channel compaction.** Compaction that mixes events from different [channel](teaching/explanations/channel.md)s is not in the per-channel cosettling equivalence class. Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), inter-channel ordering is preserved.

## What the theorem requires

- The substrate's closure operator is in a regime where the cosettling equivalence class is well-defined (strict regime per [iterated-cosettling-counts-derivable-cells](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-counts-derivable-cells.md), or admits the Moore-family generalization per [iterated-cosettling-via-moore-family](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/iterated-cosettling-via-moore-family.md)).
- The seed and $w$ are computable from the log (the substrate can identify which cells have no incoming closure rule).
- The compaction operator preserves cross-channel ordering per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md).

## Position

Together with [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md) and [transaction-atomicity-via-closure-idempotence](transaction-atomicity-via-closure-idempotence.md), this theorem grounds the substrate's compaction discipline in the closure 2-monad's cosettling structure. Compaction, transactions, and settlement are three engineering surfaces of the same structural property: the cosettling equivalence class has a determined lattice interval, lax-idempotence makes the canonical representative naturally idempotent under further operations, and the substrate's freedom to choose among representatives is what makes log-size discipline possible.
