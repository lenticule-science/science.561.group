---
type: example
class: agent-community-walkthrough
depends-on: [agent-community-consensus, bilattice-network-sheaf-consensus, governance-decision]
instantiates: [agent-community-consensus, dispatch-composes-authorization]
title: Two-agent disagreement resolution
description: A concrete walkthrough of two agents — analyst-cassia and analyst-josh — producing disagreeing assertions about the same substrate cell, with the substrate recording the disagreement as $\top$ per bilattice network-sheaf consensus, and a…
---

# Two-agent disagreement resolution

A concrete walkthrough of two agents — `analyst-cassia` and `analyst-josh` — producing disagreeing assertions about the same substrate cell, with the substrate recording the disagreement as $\top$ per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), and a governance-decision resolving it.

## Setup

- Substrate $S$ with two agents enrolled in the `data-analysis` office: `analyst-cassia` and `analyst-josh`.
- Both agents are dispatched the same work-item: classify whether email sample `e-2026-04-15-7392` is phishing.
- Per [dispatch-composes-authorization](../../../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), both agents have the required capability and authorization for the classification work; both receive the dispatch.

## Disagreement trace

**Cassia's classification.** `analyst-cassia` runs the classification skill, examines the email, and admits the predication $\langle e\text{-}7392, \mathrm{is\text{-}phishing}, \mathbf{true}\rangle = \mathbf{t}$.
Per [skill-invocation](../../../skill/skill-invocation/skill-invocation.md), her witness is signed by her identity and admitted to $S$.

**Josh's classification (concurrent).** `analyst-josh` runs the same skill on the same email, reaches the opposite conclusion, and admits $\langle e\text{-}7392, \mathrm{is\text{-}phishing}, \mathbf{true}\rangle = \mathbf{f}$.

**Substrate merge.** Per [merge](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/merge.md), the substrate's bilattice $\vee_k$ join applied to cassia's $\mathbf{t}$ and josh's $\mathbf{f}$ at the same cell produces $\top = \langle 1, 1\rangle$ — the four-bilattice's contradiction value (per [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md)).

**Substrate records the disagreement.** The cell `is-phishing(e-7392)` now holds $\top$.
Per [agent-community-consensus](../agent-community-consensus/agent-community-consensus.md), the substrate's network-sheaf for the `data-analysis` agent community has its $\bigvee_k$-join showing the $\top$-witness at this cell, and its $\bigwedge_k$-meet (consensus) showing $\bot$ (no consensus).

**Repair-catalog match.** Per [repair-catalog](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/repair-catalog.md), the substrate's repair entry for `phishing-classification-disagreement` matches: severity `escalate-to-governance`.
The substrate's audit chain records the repair-trigger.

## Resolution trace

**Governance decision.** Per [governance-decision](../../../governance/governance-decision/governance-decision.md), the substrate routes the disagreement to the `data-analysis-supervision` office's quorum-decision rule.
The supervisor, `morgan-sennhauser`, examines both classifications and the email itself.

**Soul-violation check.** Per [soul-violation-check](../../governing-soul/soul-violation-check/soul-violation-check.md), the substrate verifies the proposed resolution doesn't violate the scope's governing soul.
Resolving classification disagreement is admissible per the scope's soul.

**Resolution admit.** The supervisor's decision (the email *is* phishing — cassia was right) is admitted as a new predication $\langle e\text{-}7392, \mathrm{is\text{-}phishing}, \mathbf{true}\rangle = \mathbf{t}$ with provenance citing the governance decision.
Per [retraction](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md)'s repair-discipline, josh's contradicting predication is retracted via the repair recipe; the substrate's audit chain preserves the original disagreement and the resolution.

**Post-resolution settling.** The cell now holds $\mathbf{t}$ (after a fresh settling started by the resolution event).
Per [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the new settling proceeds monotonically; the prior $\top$-state is in the audit chain but not in the current substrate state.

## What's notable

- **Disagreement was substrate-content, not an exception.** Per [agent-community-consensus](../agent-community-consensus/agent-community-consensus.md), $\top$-witnesses are first-class substrate values.
  The substrate didn't crash, didn't pick a winner silently — it recorded the disagreement for resolution.
- **Both agents' work is preserved.** The audit chain includes cassia's and josh's witnesses; an auditor can reconstruct who classified what.
- **Resolution is auditable.** Per [governance-decision](../../../governance/governance-decision/governance-decision.md), the resolution decision is itself a witnessed substrate event; an auditor can ask "why was this resolved this way?" and see the supervisor's decision plus the cited reasoning.
- **Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), this would work across federated substrates.** If cassia and josh were on different substrates, their witnesses would federate; the receiving substrate's bilattice merge would produce the same $\top$; the same governance flow would resolve.
