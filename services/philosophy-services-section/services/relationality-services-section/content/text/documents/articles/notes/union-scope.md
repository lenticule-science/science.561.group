---
title: Union Scope
id: union-scope
role: operator
status: plan
inputs:
- id: coverage-site
  alias: left
- id: coverage-site
  alias: right
outputs:
- id: coverage-site
  alias: scope
transformation:
- return
  - scope
proof_refs:
- coverage-site
description: Combines two coverage scopes into a joint coverage where both recognitions hold.
---


Combines two coverage scopes into a joint coverage where both recognitions hold.

## Proof
- Uses: coverage stability/union properties.
- Shows that: scopes can be combined when coverage admits a common refinement.
