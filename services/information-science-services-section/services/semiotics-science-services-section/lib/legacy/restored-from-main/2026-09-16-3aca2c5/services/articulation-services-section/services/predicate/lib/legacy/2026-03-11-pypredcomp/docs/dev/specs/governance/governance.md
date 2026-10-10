---
title: "Governance"
description: "Charter, decisions, voting, policy, amendments, budgets, incident management, joint decisions across confederacy peers. The substrate-resident governance vocabulary that organizations running on the OS use."
kind: index
---


How an organization running on the substrate makes durable decisions: writes a charter, proposes amendments, votes, derives enforcing closure rules from policy, manages budgets, responds to incidents, coordinates joint decisions across federated peers.

This section establishes the **substrate vocabulary** for governance entities.
The user-facing governance app at v0.7 (per [milestones/v0.7-561-productivity-stack.md](../../milestones/v0.7-561-productivity-stack.md)) builds UIs on top of these primitives.

Per [decisions/self-representation-everywhere.md](../../decisions/self-representation-everywhere.md): charter clauses, decision records, votes, budgets are all substrate cells.
Per [decisions/capability-not-acl.md](../../decisions/capability-not-acl.md): policy is enforced by the algebra, not by an ACL layer.

## Specs

- [charter.md](charter.md) — charter as substrate entity.
  Charter clauses with `formality`.
  Activation as closure rules.
- [decision-record.md](decision-record.md) — ADR pattern as substrate cells.
  Proposal, review, approval, signature chain.
- [voting-and-proposals.md](voting-and-proposals.md) — proposals, vote records, vote-tally, decision derivation.
- [policy-as-closure-rule.md](policy-as-closure-rule.md) — how charter clauses and approved decisions become enforcing closure rules.
- [amendment-lifecycle.md](amendment-lifecycle.md) — proposing changes to charter; amendment workflow; activation/retirement.
- [joint-decision.md](joint-decision.md) — decisions spanning multiple confederacy peers; cross-ship votes; shared records.
- [budget.md](budget.md) — budget cells; spending approval; budget-vs-actual; campaign-budget linkage.
- [incident-management.md](incident-management.md) — incident-record vocabulary, severity flow, member-reports, postmortems.

## Theory grounding

The substrate-resident vocabulary established here is the *normative* face of work, formalised in [predicated-governance](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/_index.md) — a subtheory of [predicated-work](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md).
Governance is not a separate domain in the library; it is the *normative-substructure* slice of work.
This spec realises that subtheory.

The library's [governance domain](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/governance/_index.md) supplies the lived-tradition content: the [hohfeldian](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/governance/theories/hohfeldian/_index.md) framework supplies the term-level operational vocabulary (assignment, novation, succession, waiver, ratification, revocation, estoppel, appeal, relief), and the [jurisdiction](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/governance/theories/jurisdiction/_index.md) framework supplies the scope-condition vocabulary (invocation, declination, submission, excess, vires) used by [joint-decision.md](joint-decision.md).
Both are realised on the predicated-governance substrate.

### Spec ↔ object map

| Spec | Predicated-governance object |
|---|---|
| [charter.md](charter.md) | [normative-system](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/normative-system.md) + per-clause [norm](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/norm.md) |
| [decision-record.md](decision-record.md) authority chain | [office-as-double-settlement](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/office-as-double-settlement.md) and [jural-relation](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/jural-relation.md) |
| [joint-decision.md](joint-decision.md) cross-peer scope | [polity](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/polity.md) and [jurisdiction](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/jurisdiction.md) |
| [budget.md](budget.md) clause type | [norm](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/norm.md) instantiated as fungible-allocation; the budget's enforcement is the same closure-rule discipline as charter clauses |

### Spec ↔ morphism map

All under [`predicated-governance/morphisms/`](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/):

| Spec operation | Predicated-governance morphism |
|---|---|
| Office creation, charter activation | [installation](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/installation.md) |
| Capability grant, sub-office endowment | [delegation](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/delegation.md) |
| [decision-record.md](decision-record.md) reassignment | [assignment](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/assignment.md) |
| [amendment-lifecycle.md](amendment-lifecycle.md) substitution | [novation](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/novation.md) |
| Charter / decision retraction | [revocation](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/revocation.md) |
| Personnel turnover under a standing office | [succession](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/succession.md) and [succession-as-handoff-cobordism](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/succession-as-handoff-cobordism.md) |
| Voluntary forfeiture in [incident-management.md](incident-management.md) | [waiver](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/waiver.md) |
| Retroactive validation of unauthorised act | [ratification](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/ratification.md) |
| Foreclosure by prior conduct | [estoppel](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/estoppel.md) |
| Correlative jural-relation pairing (claim/duty etc.) | [correlate-of](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/morphisms/correlate-of.md) |

### Spec ↔ theorem map

| Theorem | Authorises |
|---|---|
| [charter-as-closure-system](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/charter-as-closure-system.md) | [policy-as-closure-rule.md](policy-as-closure-rule.md): charter clauses become enforcing closure rules — not interpreted by an enforcement layer |
| [office-formalism-equivalence](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/office-formalism-equivalence.md) | the equivalence used by [charter.md](charter.md) and [decision-record.md](decision-record.md): office-as-cell ≅ office-as-double-settlement |
| [recognition-as-bigraded-common-knowledge](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/recognition-as-bigraded-common-knowledge.md) | [voting-and-proposals.md](voting-and-proposals.md): a vote tally is a bigraded common-knowledge predicate; approval is forced when the bigrade closes |
| [delegation-as-authority-residuation](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/delegation-as-authority-residuation.md) | the capability surface in [policy-as-closure-rule.md](policy-as-closure-rule.md) and [decision-record.md](decision-record.md) — sub-grants are residuations, not new grants |
| [delegation-transport-via-beck-chevalley](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/delegation-transport-via-beck-chevalley.md) | [joint-decision.md](joint-decision.md): delegated authority transports across jurisdictional restriction; "delegate then re-base" agrees with "re-base then delegate" up to canonical iso |
| [jurisdiction-as-base-change](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/jurisdiction-as-base-change.md) | [joint-decision.md](joint-decision.md) and federation conformance §4 — cross-peer scope is base-change of the governance fibration |
| [correlative-pair-as-modal-dual](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/correlative-pair-as-modal-dual.md) | the eight Hohfeldian relations as orbit of a single modal generator — not eight separate primitives |
| [tradition-pluralism-as-fragment-coproduct](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/tradition-pluralism-as-fragment-coproduct.md) | the spec's pattern-pluralism: an org's governance is a coproduct of patterns (Hohfeldian, consensus, rotational, restorative, kinship, …), not Hohfeldian-by-default |
| [governance-decision-modal-decidability](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md) | [decision-record.md](decision-record.md) decidability of approve/reject/pending under the modal logic |

### Subordinate citations (still in scope, narrower)

- [`agential-orchestration-platform/concepts/governance`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/governance.md) and [`agential-orchestration-platform/theorems/governance-as-modal-restriction`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md) — the AgOP-stratum specialisation; load-bearing for the modal-restriction algebra at the dispatch boundary.
- [`predicated-computing/objects/closure-rule-system`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/closure-rule-system.md) — the substrate primitive that [policy-as-closure-rule.md](policy-as-closure-rule.md) consumes.
- [`interactive-application-platform/objects/list-record`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/interactive-application-platform/objects/list-record.md) — voter rosters, decision queues.

## Conformance

Governance passes:

1. Charter clause activates as closure rule; rule fires correctly. *Theory ground:* [charter-as-closure-system](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/charter-as-closure-system.md).
2. Decision-record proposal → approval → effect: round-trips with audit chain. *Theory ground:* [recognition-as-bigraded-common-knowledge](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/recognition-as-bigraded-common-knowledge.md) plus [governance-decision-modal-decidability](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/governance-decision-modal-decidability.md).
3. Vote tallies are deterministic; replay reproduces. *Theory ground:* same as §2.
4. Joint-decision across two peers produces shared result. *Theory ground:* [jurisdiction-as-base-change](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/jurisdiction-as-base-change.md) plus [delegation-transport-via-beck-chevalley](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/delegation-transport-via-beck-chevalley.md).
5. Budget overrun triggers anomaly cell. *Theory ground:* [charter-as-closure-system](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/charter-as-closure-system.md) — budget norms are charter-shaped.
6. The Hohfeldian operational verbs (assignment, novation, succession, waiver, ratification, revocation, estoppel) are each one closure-rule shape, not eight separate handlers. *Theory ground:* [correlative-pair-as-modal-dual](../../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theorems/correlative-pair-as-modal-dual.md) (operations on jural-relation are orbits of one modal generator) plus the per-morphism files above.

## Sysadmin / org-director orientation

For an organization adopting the OS, the governance section is where the org's *constitution* lives.
Charter clauses are the org's foundational rules; decisions become history; budgets bound spending; the charter+decision+budget chain is queryable, auditable, and federation-aware.
