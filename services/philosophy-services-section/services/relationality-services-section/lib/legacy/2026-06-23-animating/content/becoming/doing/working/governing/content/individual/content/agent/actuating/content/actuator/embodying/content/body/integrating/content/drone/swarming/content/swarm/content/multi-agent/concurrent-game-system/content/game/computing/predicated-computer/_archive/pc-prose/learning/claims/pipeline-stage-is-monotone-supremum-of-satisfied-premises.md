---
type: theorem
class: engineering-claim
status: proved
depends-on: [closure-rule-system-realizes-closure-2-monad, settlement-via-closure-2-monad, monotonic-clock-discipline, modal-restriction-as-substrate-authorization-primitive]
see-also: [paraconsistency-as-substrate-discipline, transaction-atomicity-via-closure-idempotence]
---

# A pipeline-stage cell is the supremum, in the stage poset, of stages whose stage-promotion premise the substrate currently satisfies, and is monotone non-decreasing under closure-rule-only operation

**Claim.** Let $(\mathbf{S}, \le)$ be the totally ordered five-element stage poset

$$\mathrm{idea} \;<\; \mathrm{review} \;<\; \mathrm{plan\text{-}draft} \;<\; \mathrm{spec\text{-}edit} \;<\; \mathrm{integrated},$$

and consider only the four *stage-promotion* rules §3.1–§3.4 (the merge transition §3.5 is treated separately below). For each $S \in \mathbf{S}$, let $P_S(C, \Sigma)$ be the positive premise-pattern that the stage-promotion rule for $S$ requires of a non-merged pipeline-card $C$ against substrate state $\Sigma$ (the conjunction of asserted-stratum cells the rule's `premise` block names), with $P_\mathrm{idea}$ taken as the trivial premise (kind=pipeline-card) discharged at card creation. Suppose §3.1–§3.4 are downward-closed in the sense that, for $S' \le S$ in $\mathbf{S}$, $P_S(C, \Sigma)$ entails $P_{S'}(C, \Sigma)$.

Then for any non-merged pipeline-card $C$ and any substrate state $\Sigma$ at quiescence under the closure-rule system,

$$\mathrm{stage}_\Sigma(C) \;=\; \bigvee\, \{\,S \in \mathbf{S} \mid P_S(C, \Sigma)\,\} \;=\; \max\, \{\,S \in \mathbf{S} \mid P_S(C, \Sigma)\,\}.$$

Furthermore, in any operating regime in which the substrate's asserted-cell set is monotone non-decreasing in event-ord — i.e. closure-rule firings only assert and the captain authors no retract — the map $\mathrm{ord} \mapsto \mathrm{stage}_{\Sigma_\mathrm{ord}}(C)$ is monotone non-decreasing in $(\mathbf{S}, \le)$.

## Why this holds

**Part 1: stage = supremum at quiescence.** Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), the substrate's stage-promotion rules are realized as the closure 2-monad's iteration. A rule for stage $S$ has shape $P_S(C, \Sigma) \vdash (C, \mathrm{stage}, S, \mathrm{True})$. At quiescence the closure-rule system has fired every rule whose premise is satisfied; therefore $(C, \mathrm{stage}, S, \mathrm{True})$ is asserted for every $S \in \mathbf{S}$ with $P_S(C, \Sigma)$.

The downward-closure assumption $P_S \Rightarrow P_{S'}$ for $S' \le S$ — verified by inspection of §3.1–3.4 of the dev spec, each of which extends the previous stage's premise with additional anchors, fitting cells, or signed decisions — makes the satisfied-promotion-stage set $\{S : P_S(C, \Sigma)\}$ downward-closed in the total order $(\mathbf{S}, \le)$. A downward-closed subset of a finite total order has a unique maximum, which is its supremum. The cell $(C, \mathrm{stage}, *, \mathrm{True})$ that callers and §3 rules read is the highest such $S$ — equivalently, the supremum.

The substrate's $(C, \mathrm{stage}, S, \mathrm{True})$ assertions for $S' < \max$ are present-but-superseded; the §1 stage value the dev spec names is the asserted maximum. (Implementations that wish to retract the lower-$S$ assertions for storage hygiene may do so without changing the supremum.)

**Part 2: monotonicity in event-ord under closure-rule-only operation.** Per [monotonic-clock-discipline](monotonic-clock-discipline.md), the substrate's event-ord is monotone non-decreasing and the substrate state at ord $n$ is the fold of the event-log prefix up to $n$. Under closure-rule-only operation, every event is an assertion (no retracts); the asserted-cell set $\Sigma_\mathrm{ord}$ is therefore monotone non-decreasing in $\mathrm{ord}$.

Each promotion premise $P_S$ is positive — a conjunction of $(s, p, o, v)$-shape assertions named in the rule's premise block, with no negative literals (§3.1–§3.4 contain no `NOT` clauses; capability and anchor-existence premises are positive cell assertions per the dev spec's capability-model and §3.3 anchor-resolution discipline, both of which surface as $\Box_R$-gated positive premises per [modal-restriction-as-substrate-authorization-primitive](modal-restriction-as-substrate-authorization-primitive.md)). Positive premises are monotone in the asserted-cell order: $\Sigma \subseteq \Sigma'$ and $P_S(C, \Sigma)$ imply $P_S(C, \Sigma')$.

Hence the satisfied-premise set $\{S : P_S(C, \Sigma_\mathrm{ord})\}$ is monotone non-decreasing in $\mathrm{ord}$. Its supremum in the totally ordered $(\mathbf{S}, \le)$ is therefore monotone non-decreasing in $\mathrm{ord}$. By Part 1, this supremum is $\mathrm{stage}_{\Sigma_\mathrm{ord}}(C)$.

**Part 3: backward stage movement requires retract.** The contrapositive: if $\mathrm{stage}_{\Sigma_\mathrm{ord_2}}(C) < \mathrm{stage}_{\Sigma_\mathrm{ord_1}}(C)$ for $\mathrm{ord_1} \le \mathrm{ord_2}$, then by Part 2 the closure-rule-only assumption fails on $[\mathrm{ord_1}, \mathrm{ord_2}]$ — some asserted cell present at $\mathrm{ord_1}$ is absent at $\mathrm{ord_2}$. The substrate's only authorized cell-removal pathway at the asserted stratum is an explicit retract event with capability-fiber authority. Any backward stage movement therefore witnesses such a retract event in the log, and per [modal-restriction-as-substrate-authorization-primitive](modal-restriction-as-substrate-authorization-primitive.md) the retract is gated by the $\Box_R$-licensing capability cell that authorizes the regression.

## Corollary (saturation re-derives the new supremum)

After a retract event removes some asserted cells from $\Sigma$, the substrate's σ/Δ saturation step (per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md)) re-runs the §3 stage-promotion rules against the post-retract premise-set; the rules whose positive premises still hold re-fire; the resulting $\mathrm{stage}_\Sigma(C)$ is the supremum over the now-smaller satisfied-premise set, which by Part 1 is the new maximum stage whose premise still holds. No bespoke "stage recomputation" code is required beyond the standard saturation step.

## Merge cards (§3.5): consistent extension, not exception

The merge transition assigns a follower's stage by inheritance from the lead rather than by independent premise re-derivation. The result still composes with the supremum view as follows. The §3.5 rule fires on the positive premise $(C_\mathrm{lead}, \mathrm{merged\text{-}with}, C_\mathrm{follower}, \mathrm{True})$ (after symmetric closure) and emits, for each $S$ at which the lead currently sits, $(C_\mathrm{follower}, P^\mathrm{inherited}_S, *, \mathrm{True})$ cells that re-discharge the follower's $P_S$ via the dev spec's `fitting-inherited-from` chain (§3.2 prose). The follower's $P_S$ then holds on the post-saturation $\Sigma$, and the Part-1 supremum view applies to the follower as written above. The downward-closure assumption is preserved because inheritance discharges *every* lower-stage premise simultaneously (a lead at $\mathrm{spec\text{-}edit}$ has $P_S$ satisfied for all $S \le \mathrm{spec\text{-}edit}$ and its merge into the follower extends each in lockstep).

The §3.5 prose's restriction that "merging at `plan-draft` or later requires retracting the affected anchors first" is the spec ensuring the follower's pre-merge premise set is small enough that inherited discharge does not collide with already-asserted-but-distinct anchor cells; without it, the substrate would have to either drop assertions silently or surface a $\top$-stratum disagreement (per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md)).

## What the theorem leaves to the dev spec

- The exact §3 premises — which capability cell, which anchor cells, which fitting cells are required at each stage — are specified by the dev spec. The theorem assumes §3.1–§3.4 are positive and form a downward-closed family in $(\mathbf{S}, \le)$; verification is by inspection of those four sections.
- The signoff feedback-cell mechanism (§1 prose: "card stays at `spec-edit` with a `signoff-feedback-cell` appended") is consistent with the theorem: appending feedback does not change the satisfied-premise set for stages $S \le \mathrm{spec\text{-}edit}$, so the supremum is unchanged. Re-submission is a fresh decision-record assertion that may newly satisfy $P_\mathrm{integrated}$.
