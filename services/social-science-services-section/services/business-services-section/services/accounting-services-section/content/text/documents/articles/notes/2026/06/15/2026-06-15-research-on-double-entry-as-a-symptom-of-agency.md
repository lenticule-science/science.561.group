---
title: "Research on Double-Entry as a Symptom of Agency"
description: "Examines double-entry bookkeeping as a conservation structure intrinsic to agency, records a 2026 package migration based on that idea, and bounds the analogy between balanced postings and cohomological obstruction."
date-created: 2026-06-15
keywords:
  - agency
  - double-entry
  - ledger
  - agent
  - conservation
  - animating
  - codec
  - accounting
  - trading
  - cohomology
  - kernel
  - federation
audience: future agents working the agent/markets domains
section: accounting
---

# Research on Double-Entry as a Symptom of Agency

> Historical orientation: this note records a package migration performed on
> 2026-06-15. At that point, `@emsenn/ledger` was removed as a discrete package
> and its capabilities were moved into `@emsenn/animating` and
> `@emsenn/trading`. The paths in §§3–5 describe that migration state; they are
> not a map of the repository's present accounting implementation.

## 1. Why ledger could not simply be imported into agent

The dependency facts at the time:

```
relationality → agent → games → markets ⇄ ledger
                 (L1)    (L2)
```

`@emsenn/animating` depends on only `content`, `language`, `relationality`.
`@emsenn/ledger` sat four hops below it (`ledger → markets → games → agent`), and `markets ⇄ ledger` was a real cycle pnpm warned about: `ledger` imported `markets/financial`, `markets` imported `ledger/algebra` + `ledger/codecs`.
The companion note `2026-06-15-research-on-the-ontological-spine-as-a-definability-tower.md` proves that order is a *theorem* — agent is L₁, constitutive.
So "put ledger's codecs into agent" would have made `agent → ledger → markets → games → agent`, a cycle through the whole stack.

The cycle was itself the symptom: **money's conservation law had been homed in a financial domain instead of upstream of it.**

## 2. The reframe: conservation is agency-intrinsic

Stripped of money, double-entry is: a transaction is a bundle of signed movements over accounts whose per-unit sums vanish.
`balance.mts`'s `residual(...).size === 0` is exactly

$$\partial(\text{txn}) \;=\; \sum_i \text{posting}_i \;=\; 0 \quad\text{(per commodity)} \iff \text{the chain is a CYCLE.}$$

That has a useful structural analogy to the cohomological machinery the agent
package then computed: federation represented disagreement using H¹ of an
observer graph, while the fleet represented opposition using H¹ of an observer
sheaf. The two constructions are not different degrees of one complex.
Double-entry's condition is a kernel condition on a boundary or aggregation
map; H¹ is a quotient of cocycles by coboundaries. Both expose failures of
local data to compose consistently, but calling double-entry a “degree-0 case”
of H¹ conflates homology with cohomology and discards the quotient involved in
H¹.

In the narrower analogy, “the books balance” means “the represented act lies
in the kernel, ∂ = 0.”
Conservation is the accounting an *agent* keeps of its resource flow; money is one commodity among many.
So the kernel belongs in `agent`, and the financial *reading* downstream.

## 3. What was executed

`@emsenn/ledger` was deleted.
Its three layers moved to where the spine allows:

| former                    | now                          | why                                            |
| ------------------------- | ---------------------------- | ---------------------------------------------- |
| `@emsenn/ledger/algebra`  | `@emsenn/animating/accounting`   | exact money + conservation ∂ = the agency kernel (zero-dep, no inversion) |
| `@emsenn/ledger/codecs`   | `@emsenn/animating/codecs`       | journal parsers + decimal saturation = the representation boundary (cf. relationality's toml codecs) |
| `@emsenn/ledger/topology` | `@emsenn/trading/ledger`     | accounts/reports/`loadLedger` = the financial bookkeeping product |
| `@emsenn/ledger/scripts`  | `@emsenn/trading/ledger/scripts` | the `ledger-computer` CLI rides with the reports |

The structure vocabulary was kept verbatim (`Amount`/`commodity`/`Transaction`/`Posting`) so consumers changed only import specifiers, not code.
all declared required consumers were rewired:

- `markets` — dropped its `@emsenn/ledger` dep, gained `@emsenn/animating`; money now reads from `@emsenn/animating/accounting`.
  This **dissolves the `ledger ⇄ markets` cycle**: the topology that imported `markets/financial` is now *inside* markets (a relative import), and markets reads conservation "from within" the agency it already sits on.
- `hive`, `llm-computer`, `hive-server` — `ledger/algebra|codecs` → `agent/accounting|codecs`.
- `farolfi`, `waggle` — same, plus `ledger/topology|scripts` → `markets/ledger|markets/ledger/scripts`.

A latent gap was fixed in passing: the codecs barrel never re-exported `detectFormat`; it now does.

## 4. Where the old surface moved in that migration

- exact money / `Amount` / `add`/`sub`/`times` / registry / conservation → `@emsenn/animating/accounting`
- `parseText`/`parseBeancount`/`parseHledger`/`parseDecimal`/`format` → `@emsenn/animating/codecs`
- `loadLedger` / `bal`/`bs`/`is`/`cashflow`/`reg`/`print`/`check` reports → `@emsenn/trading/ledger`
- the `ledger-computer` CLI and book/reconcile/settle scripts → `@emsenn/trading/ledger/scripts`

## 5. Invariant established by that migration

The migration required `@emsenn/animating` not to gain a dependency on
`ledger`, `markets`, or `games`. Its accounting and codec modules were kept
dependency-free so the package move did not reintroduce the cycle it removed.
That constraint explains the 2026-06-15 design; a present implementation must
be read from the live Engineering services rather than inferred from this
record.

## Historical references (paths at the time of the migration)

- `lib/animating/src/accounting/`, `lib/animating/src/codecs/` — the relocated kernel.
- `lib/trading/src/ledger/` — the relocated bookkeeping topology + reports.
- `dev/docs/notes/2026-06-15-research-on-the-ontological-spine-as-a-definability-tower.md` — why the spine is a theorem.
- `lib/animating/src/federation/cost-graph.mts`, commit `93bfef5` — the H¹ this is the degree-0 case of.
