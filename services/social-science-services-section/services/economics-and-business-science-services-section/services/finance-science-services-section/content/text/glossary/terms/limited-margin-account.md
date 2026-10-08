---
name: "Limited Margin Account"
date-created: 2026-08-27
aliases:
  - "limited margin account"
description: "A broker-defined margin account whose credit, shorting, or product access is restricted relative to the broker's standard margin service."
references: {}
---

A **limited margin account** is a broker-defined account structured under a margin agreement but granted less credit or product access than a standard margin account. A common implementation permits reuse of eligible unsettled sale proceeds while limiting buying power to cash-covered purchases and prohibiting short sales.

The label does not create one universal rule set. Eligibility can depend on equity, account type, jurisdiction, security, concentration, and the broker's house requirements. Settlement still occurs on the market's legal timetable even when the broker extends temporary credit against proceeds.

Because the account is legally or contractually a margin account, its treatment can differ from a cash account for settlement violations, collateral, liquidation, and disclosures. That difference must not be inferred from the label alone; the current account agreement and broker policy determine it.

Systems should distinguish settled cash, unsettled proceeds, withdrawable cash, buying power, margin used, and short availability. Current thresholds and capabilities belong in broker-adapter configuration or dated operating records, not in the general definition.
