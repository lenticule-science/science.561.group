---
title: Legal Agreements & Contracts
keywords:
  - idea
  - legal
  - contracts
part-of: relational-computer
description: "Models contracts as recognitions so obligations and changes are traceable."
---
# Idea: Legal / Agreements / Contracts

Model contracts as recognitions so obligations and changes are traceable.

## 1. Recognitions

- `ContractRecognition`: parties, clauses, effective dates, jurisdiction.
- `ObligationRecognition`: specific duties, triggers, remedies.
- `EventRecognition`: signings, amendments, breaches, fulfillments.

## 2. Runbooks and topology

- Runbooks:
  - `propose_contract`, `sign`, `amend`, `terminate`, `raise_dispute`.
- Topology:
  - links to people/orgs, assets, and governing law recognitions.

