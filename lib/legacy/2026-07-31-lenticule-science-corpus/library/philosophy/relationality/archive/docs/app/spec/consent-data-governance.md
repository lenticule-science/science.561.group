---
title: Consent and Data Governance Graphs
status: someday
keywords:
  - idea
  - consent
  - governance
---
# Idea: Consent and Data Governance Graphs

Make consent, purpose limitation, and data governance explicit recognitions so
that all domains (health, finance, social, research) share the same guarantees.

## 1. Core recognitions

- `ConsentRecordRecognition`
  - A record that a person/entity has agreed (or not) to specific uses of
    specific data under defined conditions and durations.
- `PurposeRecognition`
  - Purposes for which data can be used (care, research, analytics, marketing,
    governance), each with constraints and obligations.
- `DataAssetRecognition`
  - Bundles of recognitions treated as a governed unit (e.g. “medical data for
    this person”, “financial history for this account”).
- `PolicyBindingRecognition`
  - Links between consents, purposes, policies, and data assets describing what
    is currently allowed or prohibited.

## 2. Topology and measurement

- **Topology**
  - Consent records connect identities, data assets, and purposes.
  - Policies attach to slices of the graph via `PolicyBindingRecognition`.
  - Revocations and expirations are edges that override or constrain earlier
    grants.
- **Measurement**
  - Track how often data is accessed under each purpose, how often consent
    checks block actions, and where ambiguous/undocumented uses occur.
  - Risk metrics: assets without clear consent, stale consent records, or
    policies with no effective bindings.

## 3. Runbooks and flows

- `run_register_consent`
  - Create/update `ConsentRecordRecognition`s when people give, deny, or update
    consent; tie them to data assets and purposes.
- `run_check_consent`
  - Given a proposed action, check the consent/purpose graph and policy engine
    before proceeding.
- `run_audit_data_governance`
  - Periodically audit assets and activity against consents and purposes;
    generate reports and remediation runbooks.

## 4. Cross-domain connections

- Applies across:
  - medical data, finance, social timelines, research notebooks,
    ecology and climate data, and more.
- Anchors the policy/audit console and multi-user ideas in explicit consent
  structures rather than ad-hoc flags.

