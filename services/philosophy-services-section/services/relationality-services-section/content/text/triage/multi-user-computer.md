---
title: Multi-User Relational Computer
status: someday
keywords:
  - idea
  - multi-user
  - identity
  - permissions
---
# Idea: Multi-User Relational Computer

Treat multiple people, devices, and tenants as first-class recognitions so the
relational computer can safely serve many users at once, with shared and private
graphs, audit, and policy.

## 1. Core recognitions

- `IdentityRecognition`
  - Persons, organizations, agents; linked to auth credentials, keys, and
    external identities (ActivityPub, email, OAuth).
- `AccountRecognition`
  - Logical accounts/tenants under an identity (personal, work, project),
    each with its own default policies and namespaces.
- `SessionRecognition`
  - Live sessions (web, CLI, MCP, MUD, API token) with device info, start/end,
    and attached policies/topology hints.
- `PermissionBindingRecognition`
  - Grants/denials tying identities/accounts to capabilities over subsets of the
    graph (read/write/runbook‑execute/policy‑author).
- `SharingAgreementRecognition`
  - Structured agreements about what is shared between users/tenants, at which
    granularity, with what measurement and revocation rules.

## 2. Topology and measurement

- **Topology**
  - Identities, accounts, and sessions form an identity graph; permissions and
    sharing agreements are edges into the main recognition graph.
  - Namespaces and views (per-user “slices”) are projections constrained by
    these edges and by higher‑level policy specs.
- **Measurement**
  - Per-user and per-tenant usage metrics: number and types of recognitions,
    runbook executions, error rates.
  - Security/abuse metrics: unusual access patterns, policy violations,
    attempted escalations, cross‑tenant leakage risk.

## 3. Runbooks and flows

- `run_provision_identity`
  - Create an `IdentityRecognition` with minimal defaults, link external
    credentials, issue initial sessions.
- `run_provision_tenant`
  - Spin up an `AccountRecognition` for a new tenant (project, group), attach
    base policies and sharing defaults.
- `run_grant_permission` / `run_revoke_permission`
  - Manage `PermissionBindingRecognition`s with audit and policy checks.
- `run_share_slice`
  - Create or update a `SharingAgreementRecognition` describing which slice of
    the graph is shared between which identities/tenants and under what terms.
- `run_audit_multi_user_health`
  - Periodically audit metrics and permissions to detect misconfigurations and
    security issues.

## 4. Cross-domain connections

- Integrates with:
  - `policy-audit-console` architecture texts and policy specs for enforcement.
  - Social and collaboration ideas (`activitypub.md`, `social-timelines.md`,
    `governance-community.md`, `care-networks.md`, `projects-coordination.md`)
    where multi-user behavior is essential.
  - External integrations (email/messaging, ActivityPub, code hosting) where
    the same identity appears in many systems.
