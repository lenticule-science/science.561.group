---
type: theorem
class: engineering-claim
status: proved
depends-on: [cost-discipline, settling-as-computation, predication-valuation, predication-settling, increment-sequence, closure-drivenness]
see-also: [project, traversal, settle]
---

# Reads do not advance substrate state

**Claim.** Every substrate operation classified as a *read* — [traversal](../morphisms/traversal.md), [get-cell](../morphisms/get-cell.md), [has-cell](../morphisms/has-cell.md), [project](../morphisms/project.md), audit-trail inspection — produces no advance of the substrate's [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md). The settling family $(v_\tau)_{\tau<\lambda}$ at history $t$ before any read at $t$ equals the family after the read; the read introduces no new ordinal index, no new cell value, no new entry in the [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md).

Reads are *free* in the [cost-discipline](teaching/explanations/cost-discipline.md) sense: they do not advance history, do not consume settlement fuel, do not emit state-changing witnesses.

The theorem is the substrate's commitment that *only settlement is billable*: admissions are bounded-cost (one event-log entry per message), settlements are variable-cost (per [fuel-bound](teaching/explanations/fuel-bound.md)), reads are free.

## Why this holds

A read is a query against the [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) $v_\tau$ at a chosen ordinal $\tau$. Per [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md), the substrate's settling is determined by the increment sequence $U$ and the closure operator $\mathrm{cl}^{\mathcal{S}}$ — formally, $v_{\tau+1}(p) = \mathrm{cl}^{\mathcal{S}}_p(v_\tau(p) \vee_k u_{\tau+1}(p))$. A read does not contribute to $U$; therefore it does not produce a successor valuation.

**Part 1: Read operations don't admit messages.** Per [admit](../morphisms/admit.md), the substrate's history advances only through admitted port messages, each of which contributes an entry to the increment sequence $U$. A read operation does not pass through the boundary admission gate; it operates on existing valuations $v_\tau$. No new entry is produced in $U$; the substrate's history index is unchanged.

**Part 2: Read operations don't apply closure rules.** Per [closure-rule-application](../morphisms/closure-rule-application.md), closure rules fire when their premise pattern matches against substrate content during settlement; the rule's conclusion enters the next valuation $v_{\tau+1}$. A pure read does not match-and-conclude; it only retrieves existing values. The closure operator is not invoked; no successor valuation is produced.

**Part 3: Read operations don't advance the indexed family.** Per [substrate-state](teaching/explanations/substrate-state.md), the substrate's state is the indexed family of [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) — exactly the predication settling $(v_\tau)$. A read at history $t$ retrieves content from $v_t$; it does not produce a new $v_{t+1}$. Per [stepping-laws](stepping-laws.md), the substrate's coalgebra discipline is satisfied trivially because no step has been taken.

Combining the three: a read does not contribute to $U$ (Part 1), does not invoke $\mathrm{cl}$ (Part 2), and does not produce a new valuation (Part 3). The settling family is unchanged.

## Engineering consequence

The reads-free guarantee is what makes the substrate's *audit trail* meaningful. Per the [audit stack](teaching/explanations/substrate-as-stack-composition.md), an auditor can read substrate content without disturbing it; per [settlement-determinism](settlement-determinism.md), the audit can replay any prior reads against the same valuation and get the same answers. If reads were billable, audit work would itself be substrate-content; the chain of "reading the audit chain" would have no termination.

The guarantee is also what makes the substrate's *observation* surface scalable. Per [project](../morphisms/project.md), an external system can query substrate content as often as it wants; the substrate's settlement work is unaffected. Multiple consumers reading the same valuation simultaneously do not contend; per [container](teaching/explanations/container.md)'s deployment options, observation can be scaled horizontally without coordination.

The guarantee further makes *caching* meaningful: a cache of substrate content does not become stale due to read activity, only due to substrate state change (a new entry in $U$). A cache is invalidated by an admitted message, not by a read; the substrate's read-side can therefore safely cache observations within an observation invocation per [interfacer](teaching/explanations/interfacer.md).

## What the theorem rules out

A substrate operation that produces a state change as a side-effect of being read is *not* a pure read:

- A "read with side-effect" — e.g., a read that updates a last-accessed timestamp — is a settlement (a closure-rule application that fires on the read trigger, contributing an entry to $U$). The substrate's discipline is to make this explicit: the operation is *not* free; it is a settle-on-read operation, billed accordingly.
- A "lazy read" — a read that triggers settlement of un-settled predications before returning — is two operations: a settle (billed) followed by a read (free). The substrate's interface should expose them separately so the caller can decide whether to wait for settlement or to receive un-settled flags.
- A "read that surfaces something for repair" — e.g., a read that detects a contradiction and triggers [apply-repair](../morphisms/apply-repair.md) — is conflating reading with settling. The substrate's discipline is to let the read return the contested predication and let a separate operation decide whether to repair.

A substrate that conflates reads with state-change operations has lost the cost-discipline guarantee; its audit chain mixes reads with settlements, and its scaling story collapses.

## What the theorem requires

- The substrate's read operators (per [traversal](../morphisms/traversal.md), [get-cell](../morphisms/get-cell.md), [has-cell](../morphisms/has-cell.md), [project](../morphisms/project.md)) are *pure functions* of the current valuation $v_t$ — no side effects, no closure-rule firing, no increment-sequence writes.
- The substrate's caching layer (when present) does not introduce state changes that escape the read invocation. Persistent caches would be a second source of truth, in violation of [source-of-truth](teaching/explanations/source-of-truth.md).
- Read instrumentation (audit-of-reads when explicitly enabled) is recognized as a *separate* settlement operation, not as a property of reads themselves. An instrumented read is two operations: a read (free) plus a settle-on-instrumentation (billed).

## Connection to Landauer's principle

The reads-free guarantee is the substrate's reformulation of Landauer's thermodynamic principle: irreversible information processing has a thermodynamic cost; reversible processing does not. A read is reversible (the valuation is unchanged; the read can be re-run with the same result); a settlement is irreversible (a new valuation $v_{t+1}$ has been produced; per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the substrate's monotone-only discipline means the prior valuation is in the family but the cumulative content has advanced). Per [correspondences-with-established-theory](teaching/explanations/correspondences-with-established-theory.md), the substrate's cost discipline is Landauer's principle made operational at the substrate level.
