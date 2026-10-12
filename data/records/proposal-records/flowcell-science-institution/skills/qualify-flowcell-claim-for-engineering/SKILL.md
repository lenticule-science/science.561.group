---
name: qualify-flowcell-claim-for-engineering
description: "Decide whether a FlowCell scientific result is sufficiently evidenced and bounded to become an Engineering design input."
---

# Qualify a FlowCell claim for Engineering

Read the preregistered assay, exact configuration, raw evidence, analysis, uncertainty, controls, failures, and deviations.

Return exactly one status:
- qualified;
- qualified-with-bounds;
- not-qualified;
- contradicted.

A qualification packet states:
- claim;
- evidence maturity;
- exact configuration;
- operating/environment envelope;
- comparator;
- effect size/relevant metrics;
- uncertainty;
- replication;
- known confounders;
- raw evidence;
- prohibited extrapolations.

Engineering may use the result only inside that envelope. Simulation-only, one-off, post-hoc, and analogy-based results remain labeled accordingly.
