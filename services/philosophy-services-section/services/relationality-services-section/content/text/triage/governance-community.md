---
title: Collaborative Governance & Community
status: someday
keywords:
  - idea
  - governance
  - community
---
# Idea: Collaborative Governance / Community Server

Model proposals, votes, and roles as recognitions so governance is transparent
and auditable.

## 1. Governance recognitions

- `ProposalRecognition`: text, options, scope, affected recognitions.
- `VoteRecognition`: actor, choice, weight, justification.
- `RoleRecognition`: permissions, membership, history.
- `DecisionRecognition`: outcome of a governance process.

## 2. Runbooks and invariants

- Runbooks:
  - `create_proposal`, `run_vote`, `ratify_decision`, `repeal`, `amend`.
- Invariants:
  - every decision traces back to proposals, votes, and policies in force,
  - role changes are recorded with reasons and constraints.
