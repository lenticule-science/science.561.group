---
type: narrative
depends-on: [pipeline-stage-is-monotone-supremum-of-satisfied-premises, closure-rule-system-realizes-closure-2-monad, monotonic-clock-discipline]
see-also: [regime-discipline, events-as-source-of-truth]
---

# Pipeline-stage monotonicity: where the spec's "monotone forward" comes from

The ideas-to-plans pipeline dev spec claims that a pipeline-card's stage progression is *monotone forward during normal operation*, with two narrowly-scoped backward movements available only as substrate edits, never as closure-rule transitions. This narrative says where that claim comes from — and what it costs the spec when it tries to step outside it.

## The shape of the claim

Stage assignment is not a separate piece of bookkeeping the substrate tracks alongside the pipeline-card. It is — per [pipeline-stage-is-monotone-supremum-of-satisfied-premises](../theorems/pipeline-stage-is-monotone-supremum-of-satisfied-premises.md) — the supremum, in the totally-ordered five-element stage poset, of the stages whose §3 premise the substrate currently satisfies. The closure rules don't *advance* the stage; they make the next stage's premise satisfied, and the stage that the spec reads is the supremum that follows from saturation.

This is what makes the spec's "monotone forward during normal operation" structurally true rather than a discipline the captain has to manually enforce. Normal operation means closure-rule firings only assert; per [monotonic-clock-discipline](../theorems/monotonic-clock-discipline.md) the substrate's asserted-cell set is then monotone in event-ord; positive premises are monotone in the asserted-cell set; downward-closed satisfied-premise families have monotone suprema. Forward-only is a theorem of closure-rule-only operation, not a dispatch convention.

## What this rules out

**Silent stage regression via rule firing.** A closure rule cannot lower a card's stage by being added or by firing, because closure rules only assert; the satisfied-premise set can only grow, and so can the supremum. The §1 prose's promise that "the §3 closure rules themselves never fire backwards" is not a coding convention — it is what closure-rule semantics give for free. A captain who tries to ship a "pipeline-stage-demote" closure rule will find that the substrate's closure-2-monad realization rejects the rule shape; per [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md) the system requires inflationarity in the knowledge order, and a stage-decrease rule violates it.

**Out-of-order ord-stamping producing non-monotone stages.** The supremum at ord $n$ depends only on $\Sigma_n$, not on the order in which earlier rules fired. Even if two stage-promotion rules race within a tick — `review → plan-draft` and `plan-draft → spec-edit` — both rules' assertions land in the same saturated state and the read is the maximum. The spec's §3.2 prose about "the substrate emits a `(follower, fitting-inherited-from, lead)` cell at the saturated stratum" is the visible side of this: assertions in saturation contribute to the supremum once they exist, regardless of their ord-stamp.

**Cycles in the stage progression.** A cycle would require the supremum to revisit a strictly-lower element after passing it, which under the monotonicity result requires a retract. The spec's §1 enumeration of the two backward pathways is therefore exhaustive — *any* observed regression must witness one of those pathways in the event log, and the audit-log's `acting-as` / `licensed-by-capability` fields must attribute the authority that effected it.

## Where the spec is doing real work the theorem doesn't

The theorem assumes the §3.1–§3.4 promotion premises are positive (no `NOT` clauses) and form a downward-closed family. Both are spec-side commitments verified by inspection: each transition demands what the previous transition demanded plus some new anchors, fitting, or signoffs. A future revision that introduced a negative premise — for example, "transition to `integrated` only if no `signoff-feedback-cell` exists" — would break the positivity assumption and forfeit the monotonicity guarantee. Such a revision would need either a different theorem or a different stage discipline.

The merge transition (§3.5) is handled separately: a merged follower inherits its lead's stage rather than deriving its own. The theorem's "Merge cards: consistent extension, not exception" section reconciles this by observing that the §3.5 rule, after symmetric `merged-with` closure, emits inherited-discharge cells that re-satisfy each of the follower's $P_S$ in lockstep — so the supremum view applies to the post-saturation follower without modification. The §3.5 prose's discipline that "merging at `plan-draft` or later requires retracting the affected anchors first" is then the spec ensuring that the follower's pre-merge premise set is small enough that inherited discharge does not collide with already-asserted-but-distinct anchor cells; without it, the substrate would surface a $\top$-stratum disagreement.

## Engineering consequence

- **Saturation is the only stage-update primitive.** No per-card "advance" or "demote" code is needed; the standard σ/Δ pass is sufficient. After any cell-set change — assertion or retract — the saturation step re-derives the supremum.
- **Audit chains for stage transitions are events plus saturation, not stage-transition events.** The substrate doesn't need a `pipeline-stage-changed` event; the event log already records the underlying cell assertions/retracts, and the stage at any ord is recoverable by re-running saturation against $\Sigma_n$.
- **Two-pathway backward movement is auditable structurally.** A regression *must* witness a retract event with capability authority; the spec's "narrowly-scoped backward movements as substrate edits, NOT as closure-rule transitions" is then enforceable by inspecting the event log for retract events lacking the required capability rather than by inspecting the stage cells themselves.
- **The §11 conformance vector for "forward-rule monotonicity" reduces to the theorem.** Verifying that closure-rule firings never decrease a card's stage no longer requires a behavioral test; it follows from the §3 rule shapes being inflationary positive-premise rules in a downward-closed family.

## Position relative to the regime discipline

The theorem assumes closure-rule-only operation when claiming monotonicity in event-ord. In the substrate's strict regime (per [regime-discipline](regime-discipline.md)) saturation is finite per tick and assertions accumulate predictably; monotonicity is straightforward. In Scott-continuous and transfinite-bounded regimes the result still holds, just with the saturation step's per-tick fuel envelope tracking the regime's bound. In the aperiodic regime, the supremum is still well-defined at any quiescent state, but the substrate may not reach quiescence within a single tick; the spec's §3 premises hold or fail on the *current* asserted-cell snapshot, not on a hypothetical converged state.

The pipeline-card's stage is therefore as much a regime-conditional fact as anything else the substrate decides — but unlike federation convergence or settlement cost, the regime conditioning here is mild: the supremum view holds at every observable substrate state, and the spec's "monotone forward" claim degrades gracefully across regimes rather than breaking outright.
