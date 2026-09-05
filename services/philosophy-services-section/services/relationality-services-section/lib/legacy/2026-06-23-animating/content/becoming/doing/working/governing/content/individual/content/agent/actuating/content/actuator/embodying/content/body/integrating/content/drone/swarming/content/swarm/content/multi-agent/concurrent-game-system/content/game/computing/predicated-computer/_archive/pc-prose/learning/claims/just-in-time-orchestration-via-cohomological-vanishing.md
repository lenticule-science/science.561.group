---
type: theorem
class: engineering-claim
status: proved
depends-on: [opportunistic-scheduling-loop, work-feasibility, work-item, resource-state-predications, wavefront-locality-via-cohomology-vanishing, crdt-convergence-via-mayer-vietoris, settling-cohomology, settling-associated-sheaf, settlement-via-closure-2-monad]
see-also: [agent-self-queueing-bounded-by-modal-restriction, telemetry-as-continuous-valued-settling-projection]
---

# Just-in-time orchestration: feasibility flips propagate via local Mayer-Vietoris vanishing

**Claim.** For any change to a substrate's [resource-state-predications](teaching/explanations/resource-state-predications.md) or to a [work-item](teaching/explanations/work-item.md)'s state, the [opportunistic-scheduling-loop](teaching/explanations/opportunistic-scheduling-loop.md)'s re-evaluation of [work-feasibility](teaching/explanations/work-feasibility.md) is *structurally local* — bounded by the affected work-items, not by the queue size. Per [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md), this locality follows from $\delta^0 = 0$ on the orchestration sub-fibration's settling-associated sheaf — there is no global $H^1$-class encoding "feasibility-changes that need to propagate beyond the affected region."

The substrate's scheduler therefore reacts in O(affected work-items) per change, not O(queue size). This is what makes just-in-time orchestration tractable: a substrate with thousands of queued work-items can re-schedule on resource-state changes without scanning the queue.

## Why this holds

Per [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), the Mayer-Vietoris connecting homomorphism $\delta^0 : H^0(U_1 \cap U_2, \mathcal{F}_U) \to H^1(U, \mathcal{F}_U)$ on the substrate's settling-associated sheaf is identically zero. Applied to the orchestration sub-fibration:

- $\mathcal{F}_U$ is the settling-associated sheaf restricted to the orchestration cells (work-items, feasibility cells, resource-state predications).
- A cover $U = U_1 \cup U_2$ of the orchestration sub-region splits along (e.g.) work-items affected by a particular resource versus those not affected.
- The $\delta^0 = 0$ result means: feasibility changes within $U_1$ extend cleanly to $U$ without producing an $H^1$-obstruction in $U_2$.

Engineering translation: a change to `free-cpu-fraction` re-evaluates feasibility for work-items whose `cost-estimate.cpu-seconds` falls in the affected range. Work-items in $U_2$ (different cost ranges, different resources) are *structurally unaffected* — the substrate doesn't need to re-evaluate them, and per the cohomological vanishing, doing so would yield no information.

Per [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md), the wavefront's per-cell work is bounded by the affected region; per the orchestration application, the affected region is the work-items whose feasibility-rule premises mention the changed resource-state predication.

## The orchestration sub-fibration

The substrate's orchestration cells form a sub-fibration of the full predication-fibration:

- **Resource-state cells** — per [resource-state-predications](teaching/explanations/resource-state-predications.md), the canonical predicates.
- **Work-item cells** — per [work-item](teaching/explanations/work-item.md), the queueable units.
- **Feasibility cells** — per [work-feasibility](teaching/explanations/work-feasibility.md), the bilattice-valued readiness.
- **Dispatch cells** — per [dispatch](theories/agential-orchestration-platform/concepts/dispatch.md), the active-work records.

Per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md), this sub-fibration has its own cohomology. Per the theorem, $H^1$ on the orchestration sheaf vanishes — feasibility changes don't propagate as cohomology classes.

## Engineering consequence

- **Resource-change re-evaluation is O(affected work-items).** A change to `free-network-bandwidth-bps` re-evaluates feasibility for work-items whose cost-estimate involves network. Per the theorem, work-items not involving network are unaffected — no re-evaluation needed.
- **Work-item admission triggers exactly one feasibility evaluation.** The newly-admitted work-item gets its feasibility evaluated once; existing work-items are unaffected by the new admission (modulo dependency updates if the new item affects others' deps).
- **Completion triggers re-evaluation only of dependent items.** When a work-item completes, only items with `dependencies` referencing it re-evaluate `dependencies-satisfied`. Per the theorem, items with no dependency on the completed work are unaffected.
- **Per-resource scheduling parallelism.** Resources affecting different work-items can be sampled and updated in parallel — per the theorem, the per-resource feasibility updates don't interfere.
- **Federation announcement processing is local.** When a federation peer announces a resource-state update, only the substrate's federated work-items routed to that peer re-evaluate feasibility. Per the theorem, locally-routed work-items are unaffected.

## Comparison to polling

A polling scheduler re-scans the entire queue every tick to find newly-feasible items. Per the theorem, this is structurally wasteful — most work-items haven't changed and don't need re-evaluation. The substrate's wavefront-driven approach scales structurally: queue size doesn't affect per-update cost.

For a queue of $N$ work-items where a single resource-state change affects $k \ll N$ items:
- **Polling scheduler**: $O(N)$ per tick, $O(N \cdot \mathrm{tick\_rate})$ amortized.
- **Wavefront scheduler (this theorem)**: $O(k)$ per change, $O(k \cdot \mathrm{change\_rate})$ amortized.

For typical substrate workloads, $k \ll N$ and $\mathrm{change\_rate}$ is bounded by actual resource fluctuation rate. The wavefront approach is asymptotically better and has lower latency (changes propagate immediately, not at next tick).

## Cohomological reading: the orchestration sheaf

Per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md):

- $H^0(\mathrm{orchestration})$ counts the settled feasibility cells — the current set of feasible work-items.
- $H^1(\mathrm{orchestration})$ would count obstructions to extending local feasibility to global feasibility — per the theorem, this is zero.

A non-trivial $H^1$ would mean "there's a feasibility change in $U_1$ that, when extended to $U$, conflicts with $U_2$'s state." This would happen if, e.g., resource-state changes interacted non-locally — a CPU-fraction change requiring a re-evaluation of network-only work-items. The theorem says this doesn't happen on the substrate's orchestration sub-fibration.

Per [settling-cohomology-vanishes-above-degree-1](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md), $H^{\geq 2}$ vanishes for the standard substrate's predicate generators — so there are no higher-order corrections either. The orchestration sheaf has trivial cohomology in all degrees ≥ 1 on the substrate's regime.

## What the theorem rules out

- **Schedulers that require global queue scans on each change.** Per the theorem, the wavefront update is local. A scheduler that re-scans the queue on every resource-state change is wasting work.
- **Resource-change effects propagating beyond the affected work-items.** Per the cohomological vanishing, there are no hidden long-range interactions in the substrate's orchestration. Implementations that introduce them (e.g., a side-table that gets re-derived on every change) are inventing structure the substrate doesn't have.
- **Polling-based re-evaluation as an optimization.** Per the theorem, the wavefront-driven approach is asymptotically optimal — polling cannot beat it. Implementations that "optimize" by polling are de-optimizing.
- **Federation-announcement processing requiring substrate-wide re-evaluation.** Per the theorem, federation peer state announcements affect only the work-items routed to that peer. The substrate's federation-aware scheduler doesn't need to re-evaluate non-federated work.

## What the theorem requires

- The substrate's orchestration cells are a sub-fibration of the predication-fibration (per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)).
- The orchestration's settling-associated sheaf is a settling-associated sheaf in the bilattice value-domain (so [crdt-convergence-via-mayer-vietoris](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md) applies).
- Closure rules on orchestration cells respect bounded-radius locality (per [closure-rule](teaching/explanations/closure-rule.md)).
- The substrate's predicate generators satisfy the cohomological dimension condition $\mathrm{cd}(\mathcal{C}^\mathrm{op}) \leq 1$ (per [settling-cohomology-vanishes-above-degree-1](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md)).

## Position

This theorem grounds the substrate's just-in-time orchestration in the predication-categories' cohomological framework. Together with [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md) (the substrate's general locality), [trace-causality-via-mayer-vietoris-spans](trace-causality-via-mayer-vietoris-spans.md) (trace assembly is sheaf gluing), and [backup-as-cohomology-preservation](backup-as-cohomology-preservation.md) (backup preserves cohomology), the substrate's claim to *scale beyond polling* — to handle large queues with low per-change overhead — is a cohomological theorem about its orchestration discipline.

The substrate's runtime is structurally just-in-time: when resources change, the wavefront fires; when work-items admit, the wavefront fires; when dispatches complete, the wavefront fires. There is no scheduler tick because the cohomology is trivial — no hidden state that needs periodic synchronization, no global obstruction class that needs periodic recomputation. The scheduler *is* the wavefront.

This is what enables the user's vision: the system runs, notices it has spare resources, figures out what to do with itself — *without* a scheduler that wakes up every N seconds and re-evaluates everything. The wavefront handles it locally, just-in-time, structurally.
