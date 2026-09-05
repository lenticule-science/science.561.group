---
type: definition
class: substrate-aggregate
realizes: [continuous-valued-settling]
depends-on: [cost-discipline, fuel-bound, predicated-computer, regime-record]
see-also: [cost-composition-via-lawvere-quantale, federation-path-metrics-multiplicative, federation-fuel-as-tensor-distributivity, telemetry-as-continuous-valued-settling-projection]
---

# Cost quantale of fuel

A **cost quantale of fuel** is the substrate-entity formal declaration of a [predicated computer](predicated-computer.md)'s cost-domain: the predication-graph entity naming the commutative unital quantale $\mathcal{V} = (V, \otimes, k, \bigvee)$ that the substrate's [cost-discipline](teaching/explanations/cost-discipline.md) and [fuel-bound](teaching/explanations/fuel-bound.md) machinery compose over. Every per-operation cost the substrate emits, every fuel-budget the substrate enforces, and every federation-hop grade the substrate composes (per [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md)) takes its values in $V$ and composes via $\otimes$.

Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the substrate's cost composition is structurally determined by the chosen quantale; the cost quantale of fuel record is where that choice is recorded as substrate content rather than left implicit in scattered fuel-policy fields. Without it, the cost-domain is a host-implementation parameter; with it, the cost-domain is queryable, version-hashable substrate content that federation handshakes can verify, that audit machinery can cite, and that engine code can dispatch on.

The "Lawvere" qualifier is implicit in the math — every continuous-valued settling lives in a Lawvere quantale per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md) — so the substrate-side name foregrounds what the record is *for*, namely fuel.

## Structural fields

A cost-quantale-of-fuel record carries:

- **`id`** — kebab-case identifier (commonly `default`, the substrate's primary cost-domain declaration).
- **`description`** — one-line summary.
- **`carrier`** — the underlying set $V$. Declared by symbolic name with a domain (e.g., `extended-non-negative-reals` for $[0,\infty]$, `unit-interval` for $[0,1]$, `bilattice` for $\mathbf{L}^\bowtie$). The substrate engine consults this to choose the value representation.
- **`tensor`** — the binary operation $\otimes : V \times V \to V$. Declared by symbolic name (`addition`, `multiplication`, `min`, `max`, `bilattice-fusion`). The most common default is `addition` on $[0,\infty]$ — the additive Lawvere quantale.
- **`unit`** — the unit element $k \in V$ for $\otimes$. Reads contribute this value per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md). For $([0,\infty], +)$: $k = 0$. For $([0,1], \cdot)$: $k = 1$.
- **`join`** — the join operation $\bigvee : \mathcal{P}(V) \to V$ (arbitrary suprema in the quantale's order). For $([0,\infty], +)$ under cost-order: $\bigvee = \min$. For $([0,1], \cdot)$ under reliability-order: $\bigvee = \max$.
- **`order-convention`** — one of `cost-order` (smaller-is-better; default for additive cost), `reliability-order` (larger-is-better; default for multiplicative reliability), or `bilattice-knowledge-order`. The convention determines how `join` and `tensor` interact and what "admissible cost within envelope" means concretely; see *Invariants* below.
- **`distributivity-witness`** — pointer to the proof obligation establishing that $\otimes$ preserves arbitrary $\bigvee$ in each argument (the standard quantale axiom). For the four common carriers above the witness is structural and the field cites the relevant on-disk proof; for a custom carrier the substrate refuses activation until the witness is supplied.
- **`fuel-units`** — declared semantic interpretation (`seconds`, `bytes`, `calls`, `tokens`, `joules`, `currency-units`). Lets human auditors and federation peers interpret raw values; structurally the quantale arithmetic is unit-free.
- **`forecast-policy`** — declares how the substrate forecasts session totals from per-operation contributions (per the composition law of the quantale). For additive: prefix sum. For multiplicative-reliability: prefix product.
- **`overflow-discipline`** — for carriers with a top element (e.g., $\infty$ in $[0,\infty]$), the substrate's behavior when a composed cost reaches the top: `abort-on-budget-exhaustion`, `degrade-to-best-effort`, `escalate-to-captain`. Always regime-compatible per [regime-record](regime-record.md)'s `fuel-policy` invariant.
- **`version-hash`** — canonical-form hash of the record's content, citable in [witness](witness.md) records, in [regime-record](regime-record.md)'s `fuel-policy` field, and in [federation-bridge](federation-bridge.md) handshakes.

## Invariants

- **Quantale axioms hold.** The declared $(V, \otimes, k, \bigvee)$ is a commutative unital quantale: $\otimes$ is associative, commutative, has unit $k$, and preserves arbitrary $\bigvee$ in each argument. The `distributivity-witness` field discharges the last axiom; the others are structural for the four common carriers.
- **Order-convention coherence.** The `order-convention` field's choice determines the orientation of $\bigvee$. Under `cost-order`, the quantale's order is the *reverse* of the carrier's natural numerical order ($r \le_{\mathcal{V}} r'$ iff $r \ge r'$ as reals), so $\bigvee$ is `min` (the supremum of "no-worse-than" costs is the *least* cost, the best one), and $k = 0$ is the top. Under `reliability-order`, the quantale's order matches the carrier's natural order, $\bigvee$ is `max`, and $k = 1$ is the top. A record declaring `cost-order` with `join = max` is malformed.
- **Reads use the unit.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), the substrate's read operations contribute $k$ to any composed cost. A substrate that bills reads at non-unit values is not implementing this object's cost-discipline.
- **Regime-compatible.** The active [regime-record](regime-record.md)'s `fuel-policy` field cites this object's `version-hash`. A regime declaring `aperiodic` with a cost quantale whose `overflow-discipline` is `abort-on-budget-exhaustion` and whose forecast-policy bounds finite values only is malformed — the substrate's settle would abort at the first non-Scott-continuous firing.
- **Federation-domain coherent.** Two substrates federating exchange `version-hash` fields at handshake. Per [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md), composing grades across a federation requires either an identical quantale on both sides or an explicitly recorded quantale-homomorphism between them; the substrate refuses silent quantale-coercion.
- **Distributivity is structural.** $\otimes$ preserves $\bigvee$ in each argument (the standard quantale axiom): $a \otimes (\bigvee_i b_i) = \bigvee_i (a \otimes b_i)$ and dually on the left. Monotonicity of $\otimes$ in each argument is an immediate corollary: if $b \le_{\mathcal{V}} b'$ then $a \otimes b' = a \otimes (b \vee b') = (a \otimes b) \vee (a \otimes b')$, so $a \otimes b \le_{\mathcal{V}} a \otimes b'$. This is what makes [federation-fuel-as-tensor-distributivity](../theorems/federation-fuel-as-tensor-distributivity.md) a corollary of the quantale axioms rather than new substrate structure.

## Operations

- *Activate.* The cost-quantale-of-fuel record is referenced by the active [regime-record](regime-record.md)'s `fuel-policy`. The substrate's engine consults this object on every cost-emitting operation to determine which arithmetic to compose, on every fuel-budget check to determine which order to compare, and on every federation handshake to verify cost-domain compatibility.
- *Edit.* A cost-domain change (e.g., switching from additive latency to multiplicative reliability for a particular substrate-scope) produces a new version. The change is recorded as an event in the [event log](event-log.md) and propagates to dependent records via their `predecessor` chains.
- *Federate.* When two substrates federate, the receiving substrate consults the sending substrate's `version-hash` against its own. Per [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md), federation between substrates with different cost quantales is admissible only with an explicit quantale-homomorphism bridge recorded as substrate content.
- *Forecast.* Given a session's per-operation cost contributions, the substrate composes them via $\otimes$ and compares against the active [fuel-bound](teaching/explanations/fuel-bound.md) to forecast whether the session will fit. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the forecast is structural — no host-runtime measurement is required to decide budget admission.
- *Audit.* Auditors consult the cost quantale to interpret recorded cost values: the per-witness `fuel-consumed` field's numeric value means addition-of-seconds under `default` and multiplication-of-probabilities under a reliability-substrate, and the audit's interpretation must match.

## Common instantiations

| `id` | `carrier` | `tensor` | `unit` | `join` | `order-convention` | Use |
|---|---|---|---|---|---|---|
| `additive-latency` (common default) | $[0,\infty]$ | $+$ | $0$ | $\min$ | cost-order | latency-aware routing, fuel-budget enforcement, time-billed sessions |
| `multiplicative-reliability` | $[0,1]$ | $\cdot$ | $1$ | $\max$ | reliability-order | independent-failure composition, federation trust scoring |
| `bottleneck-throughput` | $[0,\infty]$ | $\min$ | $\infty$ | $\sup$ | reliability-order | throughput-bounded streams, bandwidth allocation |
| `bilattice-trust` | $\mathbf{L}^\bowtie$ | $\odot$ (twist-product) | $\langle\mathbf{t},\mathbf{t}\rangle$ | $\bigvee_k$ | bilattice-knowledge-order | per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), modal-graded trust |

A substrate may host multiple cost-quantale-of-fuel records simultaneously (one per scope), and the engine selects per the active regime-record's `fuel-policy` reference. A multi-criteria substrate (latency *and* reliability) instantiates the product quantale `additive-latency × multiplicative-reliability` with pointwise $\otimes$, per the same cited theorem.

## Position in the substrate

The cost quantale of fuel is the substrate's *cost-domain declaration*: the engineering parameter that grounds every per-operation cost contribution, every fuel-budget enforcement, every federation-hop grade composition, and every audit-side cost interpretation in one queryable substrate-entity. Without it, cost is implicit in scattered policy fields and the substrate has no single point of cost-truth; with it, cost is one substrate entity, citable by hash, editable as content, federation-portable.

The pattern composes with [cost-discipline](teaching/explanations/cost-discipline.md) (the engine convention this object parameterises), with [fuel-bound](teaching/explanations/fuel-bound.md) (the budget-enforcement primitive that reads the active record), with [regime-record](regime-record.md) (whose `fuel-policy` field cites this object), with [federation-path-metrics-multiplicative](../theorems/federation-path-metrics-multiplicative.md) (the federation grade-composition that takes its quantale from this record), with [federation-fuel-as-tensor-distributivity](../theorems/federation-fuel-as-tensor-distributivity.md) (the federation-side admissibility lifting that follows from this object's distributivity invariant), and with [witness](witness.md) (whose `fuel-consumed` field's interpretation comes from this record).
