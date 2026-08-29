---
title: Measuring Government Decisions
keywords:
  - idea
  - government
  - policy
  - measurement
part-of: relational-computer
description: "Represents government decisions and impacts as recognitions so they can be traced, measured, and related."
---
# Idea: Measuring Government Decisions

Represent government decisions, policies, and their impacts as recognitions so
they can be traced, measured, and related to other domains (ecology, health,
markets, community).

## 1. Core recognitions

- `DecisionRecognition`
  - a concrete government decision (law, regulation, budget, permit, ruling).
  - fields: body (city council, agency, court), date, jurisdiction, text,
    affected domains.
- `PolicyRecognition`
  - standing policies, frameworks, plans that decisions instantiate or modify.
- `VoteRecordRecognition`
  - who voted, how, on which decision (ties to `Governance` ideas).
- `ImplementationRecognition`
  - how the decision was implemented (programs started, contracts signed,
    infrastructure built).

## 2. Topology: what decisions touch

- Links from decisions to:
  - `ParcelRecognition` / `SpeciesRecognition` / `CommunityRecognition`
    (socio-ecological impacts),
  - `InstitutionRecognition` (schools, orgs, agencies affected),
  - `BudgetRecognition` and `TransactionRecognition` (finance flows),
  - `Legal ContractRecognitions` (public-private agreements),
  - `HealthMetricRecognition` (population health metrics).

This makes it possible to ask: “which recognitions are downstream of this
decision?” and “which decisions affect this place/group/metric?”

## 3. Measurement channels

Measurement can track, for each decision:

- **Implementation metrics**
  - timeliness, completeness, cost overruns, adherence to plan.
- **Outcome metrics**
  - ecological indicators, health outcomes, housing availability, emissions,
    mobility, safety, etc., depending on the domain.
- **Process metrics**
  - participation (who was consulted), transparency, conflict/appeals.

These are all standard measurement channels in the fabric, attached to
`DecisionRecognition` and `ImplementationRecognition`.

## 4. Runbooks and questions

- Runbooks:
  - `evaluate_decision`: gather and summarize metrics + traceability for a
    single decision.
  - `compare_decisions`: compare multiple decisions on similar topics across
    places/times.
  - `trace_impact`: starting from an observed change (e.g., increased flooding),
    trace back through recognitions to decisions and implementations.

Example questions:

- “How did zoning decision X affect tree canopy, flood risk, and housing costs
  over 10 years?”
- “Which decisions correlate with improvements in health metrics in this
  community?”
- “What patterns exist in who votes for/against decisions that later show
  strong negative measurements?”

Government choices then become first-class, measurable parts of the relational
universe, rather than opaque events in a newsfeed.

