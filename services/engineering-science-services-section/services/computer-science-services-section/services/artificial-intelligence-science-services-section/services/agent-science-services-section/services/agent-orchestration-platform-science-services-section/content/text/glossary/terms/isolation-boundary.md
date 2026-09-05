---
description: The actually enforced separation of workspaces, processes, users, credentials, tenants, networks, and filesystems between agent executions.
identity: isolation-boundary
name: isolation-boundary
provenance:
  date-created: 2026-08-29
---
An isolation boundary is the set of mechanisms that actually prevent one agent
execution from observing or affecting another execution’s resources. Names,
profiles, prompts, working directories, and tenant labels are not hard
boundaries on their own. Evidence should identify process/container or VM
separation, OS user, filesystem and network policy, credential scope, and the
assay used to test them.
