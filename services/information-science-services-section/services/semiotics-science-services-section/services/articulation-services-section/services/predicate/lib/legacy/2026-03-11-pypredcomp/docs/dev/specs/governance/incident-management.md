---
title: "Incident management"
description: "Incident-record vocabulary. Severity flow. Member-reports flow. Postmortem structure. ICS-style coordination for organizational incidents."
kind: spec
status: normative
version: "0.7"
---


When something goes wrong organizationally — a member reports a problem, a system fails, a peer relationship breaks down, a financial discrepancy is found — the substrate captures it as an **incident-record**, coordinates response, and produces a postmortem.

This is distinct from technical alerting (per [observability/alerting.md](../observability/alerting.md), which handles substrate-level anomalies).
Org incidents include but exceed technical failures.

## Grounded in

- [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — incidents are $\top$-cells in the inconsistency sheaf; the timeline (§6 — chronological view of all incident-events) is the underlying $H^0$-cocycle of the incident's $\top$-class.
  Postmortem traversal (§7) walks the cohomology of the affected sub-region; recurring incident patterns across time are $H^1$-classes when the substrate's regime admits them.
  Joint federation-level incidents (§9) cohere across peers because federation-level disagreements are visible as cycle holonomy in the same cohomology, per [`predicated-computing/theorems/cycle-holonomy-as-federation-disagreement`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cycle-holonomy-as-federation-disagreement.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Incident records

```json
{
  "kind": "incident",
  "id": "<sha256>",
  "slug": "incident:duplicate-ledger-import-2026-05-12",
  "title": "Last week's hledger import doubled some entries",
  "reported-by": "personnel:taylor",
  "reported-at-ord": 5234,
  "severity": "minor | moderate | major | critical | emergency",
  "incident-class": "data-integrity | personnel-conflict | external-incident | financial | safety | security | governance | other",
  "status": "reported | investigating | mitigating | resolved | postmortem-pending | closed",
  "scope": "scope:bookkeeping | scope:engineering | scope:confederacy | scope:public",
  "incident-commander": "personnel:emsenn",
  "response-team": ["personnel:emsenn", "personnel:taylor", "personnel:jordan"],
  "summary-cell": "cell:<text>",
  "timeline-cell": "cell:<chronological-text>",
  "root-cause-cell": "cell:<text>",
  "resolution-cell": "cell:<text>",
  "postmortem-cell": "cell:<retrospective-text>",
  "blocking-decisions": ["decision:..."]
}
```

## 2. Severity

| Severity | Meaning | Response time |
|---|---|---|
| `minor` | Annoyance; can wait | days |
| `moderate` | Disrupts some work | hours |
| `major` | Disrupts significant work | hours, urgent |
| `critical` | Org-level threat | immediate |
| `emergency` | Safety / legal / existential | immediate, all-hands |

Severity escalation/de-escalation is allowed; substrate records the change.

## 3. Member-reports flow

Any member can file an incident:

```sh
respond incident:new \
  payload='{
    title: "...",
    severity: "moderate",
    incident-class: "data-integrity",
    summary: "...",
    related-cells: [...]
  }' \
  sender=personnel:taylor
```

Or via UI: an "Report incident" button on the home dashboard.

The substrate creates the incident-record; a closure rule routes:

- Severity ≥ major: notify captain immediately.
- Incident-class = security: notify security office.
- All incidents: notify appropriate office per scope.

## 4. Incident commander

For non-trivial incidents, an incident commander is assigned.
The IC:

- Coordinates the response team.
- Decides on mitigation steps.
- Communicates with stakeholders.
- Approves the postmortem.

Commanders are authorized via capability fiber: only office-of-operations members or specifically empowered personnel can commander.

## 5. Status flow

```
reported → investigating → mitigating → resolved → postmortem-pending → closed
                ↓                ↓
            on-hold          escalated (severity++)
```

Each transition is a substrate event; auditable.

## 6. Timeline as substrate

The incident's timeline accumulates as substrate cells linked from the incident:

```json
{
  "kind": "incident-event",
  "of-incident": "incident:...",
  "at-ord": 5240,
  "by-personnel": "personnel:taylor",
  "kind-of-event": "observation | action | decision | communication",
  "text-cell": "cell:<description>"
}
```

The timeline is a chronological view of all incident-events for an incident.

## 7. Postmortem

After `resolved`, a postmortem is required for severity ≥ moderate.
The postmortem-cell contains:

- What happened.
- When and how it was detected.
- Response timeline.
- Root cause.
- Impact (people, systems, finance).
- What worked.
- What didn't work.
- Action items (each becomes a task per [work-orchestration/](../work-orchestration/)).
- Charter / decision changes (if any) per [governance/](.).

The postmortem is signed by the IC and reviewed by relevant offices.

## 8. Action items

Postmortems often produce action items:

- "Add a guard rule preventing duplicate imports."
- "Document the import procedure clearly."
- "Add an alert on import-of-recently-imported-file."

Each action item is a task (per [work-orchestration/task.md](../work-orchestration/task.md)) with `from-incident: incident:<id>`.
Tracked separately so the org can verify follow-through.

## 9. Federation

For cross-confederacy incidents (e.g., a peer's misbehavior, a shared resource issue):

- Joint-incident-record on each peer's substrate.
- Joint-incident-commander (per joint-decision).
- Cross-peer timeline.
- Joint postmortem.

## 10. Public incidents

For incidents affecting external users / followers / customers:

- Status-page integration: a closure rule projects the incident's status to a public-readable cell.
- Public communication via [communication/announcement.md](../communication/announcement.md) — captain-curated summary.
- Resolution announcement post-resolution.

## 11. Conformance

Incident management passes:

1. Member files incident; routed to appropriate office.
2. Severity escalation triggers notifications.
3. Timeline captures all events.
4. Postmortem required for severity ≥ moderate; absence flagged.
5. Action items tracked back to incident.
6. Federation: joint-incident syncs across peers.
