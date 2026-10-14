---
title: "Systems Engineering"
description: "Systems engineering, in this section's sense, is the discipline of building regulators: components that observe a managed process, judge whether its condition requires a change, construct that change, and carry it out, while a shared body…"
---

Systems engineering, in this section's sense, is the discipline of building
regulators: components that observe a managed process, judge whether its
condition requires a change, construct that change, and carry it out, while
a shared body of operational knowledge makes the four activities mutually
intelligible across cycles. The canonical architectural decomposition of
this activity is [MAPE-K](../terms/mape-k.md) — Monitor, Analyze, Plan,
Execute over Knowledge — and this section takes MAPE-K as its founding
architecture in the same sense that `fabrication-science-services-section`
takes the Central Dogma of Fabrication as its founding thesis: not as a
completed theory of autonomy, but as the decomposition whose couplings
still need to be specified before any instance of it can be trusted.

Grounding theory:
- [MAPE-K: Autonomic Control, Operational Knowledge, and the Mathematics of Self-Adaptive Systems](../../../../../../../../content/text/documents/articles/notes/2026/07/11/2026-07-11-research-on-mape-k.md)
- [CapCell: the AP-EVM Standard for Agentic Orchestration](../../../../../../../../content/text/documents/articles/notes/2026/07/25/2026-07-25-capcell-the-ap-evm-standard-for-agentic-orchestration.md) — applies MAPE-K to a proved coordination-cost result (§10, MAPE-K rebalancing); a narrower, applied companion to the survey above.

The engineering practice this theory grounds lives under
`engineering-services-section/services/systems-engineering-services-section/`.
A live instance of a MAPE-K loop already runs beneath
`561-group-services-section` — see the [MAPE-K](../terms/mape-k.md) term for
that pointer — which predates this section and should be reconciled with it
rather than duplicated.

## Federated computational-resource flow: research assay (2026-10-14)

**Scientific question.** Can an Obsmetrologia-informed, typed local-chart or
sheaf model predict admissible placement of agentic work among sovereign
machine and cloud actors more accurately, or at lower metered resource cost,
than conventional queueing-control policies? This is a falsifiable *research
proposal*, not an established theorem about Obsmetrologia, a deployed
cross-cloud allocator, or a claim to free provider capacity. It refines the
existing MAPE-K and cybernetic-feedback program; it does not create a second
scheduler, operating ledger, or work-queue ontology.

**Existing reference results.** Tassiulas and Ephremides (1992), DOI
[10.1109/9.182479](https://doi.org/10.1109/9.182479), provide throughput
stability results for constrained queueing networks. Neely (2010),
[Stochastic Network Optimization](https://doi.org/10.1007/978-3-031-79995-2),
develops Lyapunov drift-plus-penalty controls, including a backlog/cost
tradeoff. Cruz (1991), DOI [10.1109/18.61109](https://doi.org/10.1109/18.61109),
supplies non-stochastic burst/delay calculus under stated arrival envelopes.
These support the *baseline*, not the novelty or success of a gauge model.

### A minimal lawful model

Let `V` contain explicitly identified compute actors (including a local
machine, a Google Cloud Run job, an Oracle instance, or a Cloudflare Worker).
Let `E` contain only actual, rights-authorized transport channels; an
imagined edge conveys no execution authority. At discrete time `t`, define
`q_i^k` as admitted waiting work units of one compatible class `k` at node
`i`, `z_ij^k` as admitted units in durable transport, `a_i^k` as new
arrivals, `d_i^k` as *completed and received* units, `f_ij^k` as admitted
outbound transfers, `r_ij^k` as independently received transfers, and
`x_i^k` as terminal withdrawn/refused-after-admission units. Counts
refer to a stable work identity: retries and message redelivery do **not**
create new units.

```text
q_i^k(t+1) = q_i^k(t) + a_i^k(t) - d_i^k(t) - x_i^k(t)
                         - Σ_j f_ij^k(t) + Σ_j r_ji^k(t)
z_ij^k(t+1) = z_ij^k(t) + f_ij^k(t) - r_ij^k(t)
```

All quantities and transfers are nonnegative integers constrained by real
admission, transport, and receiving. Cumulative accounting obeys

```text
Σ_i q_i^k(t) + Σ_(i,j) z_ij^k(t)
    + D^k(t) + X^k(t) = N_initial^k + A^k(t).
```

**Elementary conservation derivation:** sum the two state updates over
nodes and edges. Each `-f` at a source cancels exactly one `+f` in
transit; each `+r` at the destination cancels one `-r` in transit.
The remaining `a`, `d`, `x` become their cumulative totals.
Induction from the initial reading establishes the equality for every step
*if the stated assumptions hold*. A dropped, duplicated or prematurely
acknowledged unit falsifies the corresponding implementation invariant. For
a concrete counterexample assay, begin with `q_A=5, q_B=2, z_AB=0`;
admit two at A, transfer three A→B and complete one at B. The new
`q_A=4, q_B=1, z_AB=3, D=1` sums to nine, equal to seven original
units plus two admissions. After B receives the three and completes two,
`q_A=4, q_B=2, z_AB=0, D=3` still sums to nine.

A fluid approximation replaces integer counts by real-valued rates only
after calibrating an observation interval and error model:
`dq_i^k/dt = λ_i^k - μ_i^k(u_i) - Σ_j φ_ij^k + Σ_j ψ_ji^k`.
An effective `μ` is *observed accepted output rate*, not process CPU
utilization, successful HTTP status, or a source commit. Calibration must
report changing job mix, retries, cold starts, queue age, network delay,
measurement loss, and the presence of externally blocked receivers.

### Resource dimensions, custody and prices

A computing allocation has a vector of separate typed dimensions:
vCPU-seconds, RAM byte-seconds, instantaneous vCPUs/bytes, network ingress
and egress bytes, storage byte-time, input/output/cache inference tokens by
model, elapsed wall-seconds, and measured joules when an actual instrument
exists. Units and commodity identities must be stable and source-linked
through the Group's **existing** SignCell/SCA, SEN and SEAVT and NI
readings; these names do not themselves establish a unit conversion.
In particular, an Oracle OCPU is not simply relabeled a Google vCPU, an
unmeasured watt-hour is not a CPU-second, and provider-reported token counts
are not a financial valuation without a rate and billing condition.

A legitimate capacity constraint is `Σ_j demand_j^r ≤ received_available_i^r`
for **each** dimension `r`, supplemented by instantaneous overlap limits,
rights to process each data class, authentication, residency, deadline,
memory peak, actual execution configuration and independent receiving.
Provider-published free allowances are ceilings for eligible accounts,
**not owned current balances**. Google Cloud Run's free tier is aggregated
at billing-account scope and depends on billing configuration and region;
Oracle Always Free capacity is home-region/shape dependent; Cloudflare Free
limits use their own UTC daily windows and per-operation constraints.
A provider quota readout, observed metering and actual billing statement
are distinct sources.

Semantic identity is the actor/provider/account/region/resource ID,
metering interval, unit, quantity, revision and source observation, with
separate ownership/rights and recipient authority. Prefer mapping to
[OpenTelemetry resource attributes](https://opentelemetry.io/docs/specs/semconv/resource/)
and [W3C PROV-O](https://www.w3.org/TR/prov-o/) for observation provenance,
and [FOCUS billing](https://focus.finops.org/docs/specification/v1-2/sections/introduction/)
for provider *invoiced* cost and usage. These standards serve different
readings: do not post a Cloud Monitoring estimate, an internal exchange,
a reserved capacity forecast, a resource transfer, and a settled payable as
five equivalent financial transactions. The existing Farolfi/Beancount
authority retains money books and double-entry posting; Engineering supplies
typed ingestion, Coesite supplies the receiving/reconciliation method, and
the corporate instance owns account-level grants.

### Klein/gauge/sheaf hypothesis — constrained, not presupposed

**H-gauge:** local dimensional *coordinate choices*, represented by
invertible `G_i` on the **same** resource type, and measured transports
`T_ij` can make capacity forecasts and inconsistencies more legible
without changing physical units, permissions, or queue conservation.
Under a change of chart, `x'_i=G_i x_i` and
`T'_ij=G_j T_ij G_i^{-1}`; a closed-path product transforms by
conjugation, so its conjugacy invariants can detect path inconsistency
independently of local chart choices. A nonidentity path product is a
**model/measurement mismatch candidate**, not a physical gravitational
field or proof of exotic mathematics. The word *Klein* is a proposed
connection to geometric transformations, not a license to equate
Lorentzian, chromatic, financial and CPU spaces. Transformations that
change types, make irreversible conversions, or lack calibrated inverses
are partial morphisms with explicit uncertainty, **not gauges**.

For a sheaf-style comparison, local observations at two nodes must agree
on the overlap only under a declared, calibrated restriction map. A
sheaf-Laplacian disagreement score can identify where further sensing or
calibration is valuable, but cannot move work by itself. Study first
whether standard queueing plus typed transport already explains the
system; accept gauge/sheaf machinery only if it supplies out-of-sample
predictive or decision gain after accounting for its own inference cost.

### Preregistered receiving and falsification

Use the **same timestamped, rights-cleared** traces of offered work,
queue admissions, provider quotas, resource allocations, transfer receipts,
completed outputs and costs for each policy; keep an unseen holdout period
and an explicit negative/control case. Compare (A) fixed placement,
(B) least observed queue/estimated completion time, (C) conventional
max-weight/backpressure or drift-plus-penalty with the same constraints,
and (D) the proposed typed chart/sheaf forecast with the **same actuator
and real authorization boundary**. Replay first without cloud effects.
Measure independently received completions per minute and per resource
unit, 95th/99th queue age, deadline violations, peak memory, transport
bytes, billed cost after provider reconciliation, drop/duplication rate,
and computational overhead of the optimizer itself.

Hard falsifiers include conservation or dimensional-identity violation;
unauthorized transfer; a purportedly zero-spend action without provider
scope-level evidence; gauge-dependent decisions caused solely by an
invertible unit relabeling; no significant advantage over ordinary
backpressure on holdout traces; or improvements that disappear after the
optimizer's costs and stale-sample errors are counted. Do not assign
actual user jobs, turn on paid resources, promote a new production scheduler,
or replay Cold Red Gate's preserved ActivityPub custody during this scientific
assay. The current operating recovery must separately establish a known
installed release and backlog-safe delivery.

**Receiving chain:** Lenticule independently receives the model, units,
counterexamples and falsification result; Red Cup only then implements
accepted generic policy inside the existing allocation/transport engine;
Coesite provides versioned allocation, backpressure, authorization,
rollback and receipt *operation data*; the 561 Group and any public/customer
actor independently receive their own execution and economic consequence.
A source edit, synthetically passing conservation example, and provider
pricing page do not establish installed capacity. The repository's
[`tests/federated-resource-flow.test.mjs`](../../../../../../../../tests/federated-resource-flow.test.mjs)
executes the finite-state conservation, transport-loss refusal, local-chart
holonomy invariance and resource-unit nonfungibility **toy assays**. They
are checks on this proposed finite model, not a proof that the installed
Semioverse currently satisfies it or that gauges improve scheduling.
