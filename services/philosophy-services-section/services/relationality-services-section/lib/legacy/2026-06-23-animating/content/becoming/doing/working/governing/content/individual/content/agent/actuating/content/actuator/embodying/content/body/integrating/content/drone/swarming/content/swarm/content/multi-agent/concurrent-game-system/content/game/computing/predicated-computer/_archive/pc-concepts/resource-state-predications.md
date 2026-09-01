---
type: concept
class: telemetry-discipline
depends-on: [telemetry, time-and-event-ordinals, predication-fiber-algebra, continuous-valued-settling, lawvere-quantale-settling, cost-discipline]
see-also: [work-item, work-feasibility, opportunistic-scheduling-loop, telemetry-as-continuous-valued-settling-projection]
---

# Resource-state predications

The substrate's *canonical predicate catalog for current-resource-availability* — the predications that the substrate's [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) reads when deciding what work fits in current capacity. In the substrate's hyperdoctrine setting, resource-state predications are *a particular sub-fibration of the substrate's [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md)* — the fibers concerned with substrate runtime budgets.

Per [telemetry](telemetry.md), runtime observation is substrate content; per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), it lives in a $\mathcal{V}$-enriched setting. This concept fixes the predicate names so closure rules can read resource-state portably across substrates.

## Why this concept exists

Without canonical predicate names, two substrates' "what resources are available" queries would use different predicates — same concept, incompatible vocabulary. Federation of work-items across substrates would be impossible (a work-item that says "needs 100MB free network" couldn't be checked against the receiver's resource state). This concept fixes the canonical names; per [shared-vocabulary-federation](shared-vocabulary-federation.md), the names are content-addressed by their canonical-form definitions, so substrates that admit the same definition share the same resource-state vocabulary.

## Canonical resource-state predicates

Each predicate has the substrate (or a sub-region of it) as subject. Each value is in a quantale appropriate to the resource kind.

### Compute resources

- **`free-cpu-fraction`** — fraction of CPU currently available, in $[0, 1]$. Quantale $([0, 1], \cdot, \min)$ — composition multiplies (scaling down work multiplies CPU need).
- **`free-cpu-cores`** — count of fully-free CPU cores, integer in $\mathbb{Z}_{\geq 0}$. For substrates that pin work to cores.
- **`free-gpu-fraction`** — fraction of GPU currently available; per-device when multiple GPUs exist.
- **`compute-load-1m` / `compute-load-5m` / `compute-load-15m`** — Unix-load-style averages of CPU pressure. Used for trend-aware scheduling.

### Memory resources

- **`free-memory-bytes`** — bytes of RAM currently available. Quantale $([0, \infty], +, \min)$ in the standard Lawvere sense.
- **`free-swap-bytes`** — bytes of swap currently available; for substrates running on systems with swap.
- **`memory-pressure`** — 0/1 indicator of memory pressure (per Linux PSI or equivalent). Used to defer non-urgent work when system is thrashing.

### Storage resources

- **`free-storage-bytes:{volume}`** — per-volume free storage. Multiple volumes (substrate-content store, event-log volume, working-set volume) tracked separately.
- **`storage-iops-budget:{volume}`** — IOPS budget for the volume; for substrates running on rate-limited block storage (cloud disks).
- **`storage-write-throughput-budget`** — bytes-per-second write throughput budget.

### Network resources

- **`free-network-bandwidth-bps`** — bytes-per-second free network throughput. Quantale $([0, \infty], \cdot, \min)$ — bottleneck composition.
- **`network-latency-to:{peer}`** — measured RTT to a federation peer. Per [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md), used for federation-aware scheduling.
- **`network-rate-limit-budget-of:{api}`** — remaining rate-limit budget for an external API (OpenAI, Anthropic, arxiv API, etc.). Critical for LLM-using substrates.

### LLM-specific resources

- **`available-llm-tokens-of:{model}:{api}`** — remaining tokens-per-time-window in the substrate's quota for a particular LLM API. Per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), used to choose which LLM to dispatch to when multiple are eligible.
- **`available-llm-context-window-of:{model}`** — current context-window budget for active sessions of a particular model.
- **`available-attention-of:{agent}`** — number of free dispatch slots for an agent (typically 1 for single-task agents, N for batch-capable agents).

### Human-attention resources

- **`available-attention-of:{user}`** — bilattice-valued: $\bot$ (don't know if user is available), $\mathbf{t}$ (user is active and reachable), $\mathbf{f}$ (user is asleep / DnD), $\top$ (conflicting signals). Used when a work-item needs human input.
- **`notification-budget-for:{user}:{period}`** — how many notifications can still be sent to the user this period without violating their declared notification preferences.

### Power / thermal (for embedded substrates)

- **`battery-fraction`** — fraction of battery remaining, $[0, 1]$. For mobile / embedded substrates.
- **`thermal-headroom`** — degrees Celsius below thermal throttle. For substrates on thermally-constrained hosts.
- **`power-budget-watts`** — current power consumption budget (for substrates on energy-aware hosts).

## Update discipline

Resource-state predications update *continuously* — per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), telemetry is a continuous-valued settling. The substrate's runtime samples actual host resources at appropriate frequencies (CPU/memory typically 1Hz, network bandwidth 0.1Hz, rate-limits on every API call) and emits update predications.

Each update is a substrate cell admission with the new value; per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), the wavefront propagates the change to dependent work-feasibility cells immediately.

Per [retraction](../morphisms/retraction.md), stale resource-state cells are explicitly retracted (not silently overwritten) — auditors can see when a particular reading was active.

## Sampling rate vs feasibility-recheck rate

Two distinct rates:

- **Sampling rate**: how often the substrate measures the host. Bounded by the host's measurement primitives' cost (typically negligible for CPU/memory, more expensive for IOPS-style metrics).
- **Feasibility-recheck rate**: how often the substrate re-evaluates work-item feasibility. Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), this isn't polling — it's wavefront-triggered when relevant resource-state cells change.

The substrate samples at the resource's natural rate; feasibility re-evaluates only when the resource state crosses a threshold that affects pending work-items. Per [wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md), the recheck is local (just the affected work-items) — not a full queue scan.

## Per-region resource state

For substrates with multiple regions (per [scope](scope.md)), resource-state predications are per-region:

- `free-cpu-fraction:{scope}` — CPU fraction available within `{scope}`.
- `free-storage-bytes:{volume}:{scope}` — storage available to `{scope}`.

Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the substrate's scopes form a cover; per the cover sheaf condition, per-region resource state composes to substrate-wide totals.

## Cross-substrate resource state

For federated substrates, peer resource state is *not* directly readable — it's announced via federation-envelope updates per [federation-envelope](federation-envelope.md). Each federation peer publishes its resource-state predications (typically with throttled frequency to avoid bandwidth waste); the receiving substrate caches the announced state.

Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the receiver's accessibility cell for the peer determines how much they trust the announced state — a $\bot$-trust peer's resource announcements are advisory; a $\mathbf{t}$-trust peer's are usable for cross-substrate work routing.

Per [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md), composing resource-state across federation paths uses the appropriate quantale — bandwidth bottlenecks compose by min; total cross-substrate latency by sum.

## Position

Resource-state predications are the substrate's *capacity-awareness primitive*. Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), they're $\mathcal{V}$-valued telemetry; per this concept, the canonical predicate names are fixed; per [work-feasibility](work-feasibility.md), the scheduler reads them to determine work feasibility.

The concept composes with [telemetry](telemetry.md) (the broader observability discipline), with [cost-discipline](cost-discipline.md) (which resources count as billable cost), with [work-feasibility](work-feasibility.md) (the feasibility relation that consumes resource-state), with [federation-envelope](federation-envelope.md) (cross-substrate resource-state announcement), and with [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) (the scheduler driving work choice from resource-state).
