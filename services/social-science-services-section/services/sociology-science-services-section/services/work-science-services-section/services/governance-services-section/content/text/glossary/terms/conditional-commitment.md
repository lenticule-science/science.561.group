---
name: "Conditional commitment"
description: "A conditional commitment C(debtor, creditor, antecedent, consequent) binds a debtor to a creditor to bring about the consequent if the antecedent holds. Its state is read from events, never stated: conditional until the antecedent holds, detached once it does, discharged when the consequent is recognised, and otherwise expired, cancelled by its debtor, released by its creditor, or carried by delegation, assignment or novation."
date-created: 2026-10-02
id: conditional-commitment
aliases:
  - "commitment"
  - "social commitment"
  - "C(x, y, r, u)"
provenance:
  authors:
    - emsenn
    - claude-opus-5-5
  sources:
    - "Singh, M. P. (1999). An Ontology for Commitments in Multiagent Systems: Toward a Unification of Normative Concepts. Artificial Intelligence and Law 7(1), 97–113."
    - "Yolum, P. and Singh, M. P. (2002). Flexible Protocol Specification and Execution: Applying Event Calculus Planning Using Commitments. AAMAS 2002, 527–534."
    - "Singh, M. P. (2008). Semantical Considerations on Dialectical and Practical Commitments. AAAI 2008, 176–181."
---

## Form

A commitment is a directed, social, conditional relation between two parties:

$$C(x, y, r, u)$$

the **debtor** x is committed to the **creditor** y that if the **antecedent** r holds, the **consequent** u will hold. An unconditional commitment is the case r = ⊤. Unlike an obligation in deontic logic, a commitment has both parties named, is created by an act of the debtor (a promise, see the [commitment](../../../../../../../../../../../philosophy-services-section/content/text/documents/articles/notes/2026/03/20/2026-03-20-commitment.md) note's four-state reading), and its state is *derived from what has happened*, not asserted.

## Lifecycle

| State | Holds when |
|---|---|
| conditional | created; r has not held |
| detached | r has held; u has not (the commitment is now as good as unconditional, C(x, y, ⊤, u)) |
| discharged | u has held and is recognised (see [discharge](discharge.md): performance *and* recognition) |
| expired | r can no longer hold (a deadline on the antecedent passed) |
| violated | detached, and u can no longer hold (see [breach](breach.md)) |
| cancelled | the debtor withdrew it; if detached, this is a violation priced against the debtor |
| released | the creditor freed the debtor; no breach |

Singh (1999) gives the operations: *create* (by the debtor), *discharge*, *cancel* (by the debtor), *release* (by the creditor), *delegate* (replace the debtor, by the debtor) and *assign* (replace the creditor, by the creditor). A **novation** extinguishes the commitment and constitutes another in its place ([novation](../../../../services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-novation.md)): it needs the uptake of every party whose position changes — *nemo invitus compellitur ad novationem* — so a creditor restating what it wants does not by that act bind the debtor to the restatement.

## Why antecedents

The antecedent is what makes commitments the right unit for protocols between autonomous parties (Yolum and Singh 2002): a party commits *conditionally* before the conditions of performance hold ("I will deliver once the contract is settled and nothing stands in the way"), and the commitment detaches by events the parties observe. Meaning lives in the commitments, not in an ordering of messages, so any ordering that leaves the same commitments in the same states is equally correct.

## In the house

The work arena's promise on a request creates C(promiser, opener, antecedent, conditions of satisfaction), with the antecedent *the operative contract is refined and nothing holds the work back* (no unsettled precedent, no open blocking [obstacle](../../../../../../../../../../../engineering-science-services-section/services/fabrication-science-services-section/content/text/glossary/terms/obstacle.md)). The board derives each commitment's state: a promiser's `release` is *cancel*, the opener's `withdraw` is *release*, an accepted delivery is *discharge* (recognition by the assayer), and a request that supersedes another leaves the old promisers' commitments *pending-novation* until each promises the new thread. A pending novation is owed, so it appears on the debtor's agenda. Expiry and violation are open debts of the arena: offers carry deadlines, commitments do not yet.
