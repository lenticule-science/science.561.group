---
title: "Cost is a Lawvere-quantale composition"
description: "Closure-fuel, sandbox limits, federation routing, and telemetry all live in one Lawvere quantale on cost. Reads contribute the unit; settlements contribute positive cost; composition is the quantale's $\\otimes$. Federation paths compose by the same arithmetic."
kind: decision
date: "2026-05-02"
status: committed
---


## What

The OS's cost discipline — per-respond closure-fuel, per-session sandbox budgets, per-personnel daily budgets, federation-path routing metrics, driver call budgets, and runtime telemetry — is a *single* Lawvere-quantale composition.
The substrate picks one commutative unital quantale $\mathcal{V}$ at deployment time; per-operation costs are values in $\mathcal{V}$; the total cost of any computation is the quantale's binary operation $\otimes$ applied along the operation sequence:

$$ c_\mathrm{total} \;=\; c_1 \otimes c_2 \otimes \dots \otimes c_n. $$

The default quantale is $([0, \infty], +, \min)$ — additive cost (closure-fuel layers, latency, byte counts), with $\min$-suprema for cheapest-path routing.
Reliability-weighted regions use $([0, 1], \cdot, \max)$.
Bottleneck composition uses $([0, \infty], \min, \infty)$.
Multi-criteria deployments use product quantales.
The substrate refuses non-quantale cost models.

Three cost-class assignments are normative across the OS:

- **Reads contribute the quantale unit.** A `get-cell`, `has-cell`, `project`, `traversal`, witness-chain inspection, or audit query contributes $0$ in $[0, \infty]$ (or $1$ in $[0, 1]$).
  Reads do not advance substrate state and do not consume settlement fuel.
  Per [`predicated-computing/theorems/cost-discipline-reads-free`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md).
- **Admissions contribute a small constant.** One event-log append per admitted message; bounded.
- **Settlements contribute the load-bearing cost.** Per closure-rule firing; bounded by affected-region size, not substrate size.

Federation routing uses the same quantale arithmetic.
Multi-hop latency is the sum of per-hop latencies; multi-hop reliability is the product; multi-hop trust composes via the bilattice's $\odot$ when $\mathcal{V}$ is the bilattice viewed as a quantale.
Per [`predicated-computing/theorems/federation-path-metrics-multiplicative`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md), federation-graph paths compose grades by the quantale's $\cdot$, with the composite independent of intermediate-join choices because $\otimes$ distributes over arbitrary suprema.

Per [`predicated-computing/theorems/cost-composition-via-lawvere-quantale`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md).
The substrate's runtime cost is a continuous-valued settling in $\mathcal{V}$; the cost composition theorem proves the total is exactly the $\otimes$-product along the operation sequence.

## Why

v0.2 currently treats each cost surface independently: `sandbox-and-fuel.md` configures a per-session closure-fuel budget; `driver-model.md` declares per-driver call budgets; `network-rate` budgets sit on sessions; planned federation-protocol latency-routing has no cost model at all.
These are six separate accountings that must agree about what "the cost of this respond" means.

The Lawvere-quantale framing collapses them into one composition law.
A respond's total cost is the $\otimes$-sum of its admissions, settlements, driver calls, and federation hops.
The session's budget is exactly the quantale ceiling on that sum.
The personnel daily budget is the quantale ceiling on the sum of session sums.
Federation routing picks the cheapest-cost path because the path metric is the quantale's composition. *One arithmetic, one composition law*, used everywhere cost is reasoned about.

The reads-free guarantee is what makes this affordable.
Per the cost-discipline-reads-free theorem, audit queries, fiber projection reads, capability-fiber lookups, witness inspections, and saved-search materialisations contribute the quantale's unit and so do not advance the cost total.
The substrate's observation surface and audit surface scale horizontally without contention because they are quantale-free in the cost composition.
Settlement is the only billable work; per [decisions/heartbeat-is-the-scheduler.md](heartbeat-is-the-scheduler.md), the heartbeat tick is exactly where settlement happens, so cost accounting and scheduling discipline coincide.

The quantale framing also gives the engine a *forecasting* discipline: knowing per-operation costs and the quantale's $\otimes$, the engine can predict whether a respond will fit in its fuel envelope before starting per `predicated-computing/concepts/fuel-bound`.
Combined with [decisions/regime-classification-is-load-bearing.md](regime-classification-is-load-bearing.md), the engine knows the closure-ordinal envelope per regime and so can convert "this rule system is in regime $X$ over base $B$" into "this respond will cost no more than $f(\kappa, |B|)$ in $\mathcal{V}$."

The captain's source claim — that the OS can quantitatively forecast its performance — becomes structural: the cost model is a Lawvere-quantale settling, the composition is the chosen quantale's $\otimes$, the federation extension is the same quantale on the federation graph.
Telemetry and cost are the same continuous-valued settling per [`predicated-computing/theorems/telemetry-as-continuous-valued-settling-projection`].

Source: `predicated-computing/theorems/cost-composition-via-lawvere-quantale` (proved); `cost-discipline-reads-free` (proved); `federation-path-metrics-multiplicative` (proved); `predicated-computing/concepts/cost-discipline`; `predicated-computing/concepts/fuel-bound`.

## What it rules out

- **Non-quantale cost models.** A cost composition with context-dependent terms ("plus a coordination overhead added on top"), non-monotone aggregation, or path-dependent grades that don't reduce to a quantale composition is not admissible.
  The substrate's discipline is that the total is *exactly* the quantale-composition.
- **Reads billed at positive cost.** A "read with side-effect" that updates a last-accessed timestamp is structurally a settlement, not a read; it must be made explicit.
  A substrate that bills reads at positive cost has lost the audit-scaling and observation-scaling guarantees.
- **Per-subsystem cost arithmetics.** v0.2 must not implement a network-rate accounting in tokens-per-second alongside a closure-fuel accounting in layers alongside a driver-budget accounting in calls — they are all values in the same quantale, composed by the same $\otimes$.
- **Quantale switching mid-composition.** A respond cannot use $([0, \infty], +, \min)$ for one phase and $([0, 1], \cdot, \max)$ for another.
  Switching requires explicit conversion via a quantale homomorphism, recorded as substrate content.
- **Federation cost models that don't compose.** A federation hop whose grade composition is not the quantale's $\cdot$ — e.g., bespoke "trust score arithmetic" — breaks cross-hop forecasting and route comparison.
- **Hidden cost terms.** Any cost the substrate spends that isn't recorded as a $\mathcal{V}$-value on a witness is a discipline violation.
  Per `predicated-computing/theorems/telemetry-as-continuous-valued-settling-projection`, telemetry is the substrate's record of the quantale composition.

## What it does not constrain

- **Choice of quantale.** $([0, \infty], +, \min)$ is the v0.2 default; deployments may declare reliability-weighted, bottleneck-composition, or product quantales.
  The choice is a substrate parameter, not a structural commitment.
- **Specific per-operation cost values.** v0.2 sets defaults (16 layers per respond, 256 MB memory, 100 rps, 1000 events/sec) that map to $\mathcal{V}$-values; the values are deployment-tunable.
- **Whether to expose Unix-style cost dimensions** (`ulimit`-shaped projections, cgroups-shaped views) for tooling.
  The OS may project to such surfaces; the underlying discipline remains the quantale.
- **The wire encoding of $\mathcal{V}$-values on witnesses.** (Per the quantale's serialisation; standard JSON for $[0, \infty]$ and $[0, 1]$; bilattice four-named-strings for the bilattice quantale.)
- **The implementing spec.** This decision justifies a future `specs/kernel/cost-discipline.md` that gives the v0.2 wire shape, the per-quantale serialisation, and the per-axis defaults; that spec is v0.2 *implementation* work, not part of this decision.
- **How additional cost dimensions (a future "energy quantale" for ICS deployments, a future "carbon quantale") are added.** They are alternative $\mathcal{V}$ choices or product factors; not a structural change to the substrate.
