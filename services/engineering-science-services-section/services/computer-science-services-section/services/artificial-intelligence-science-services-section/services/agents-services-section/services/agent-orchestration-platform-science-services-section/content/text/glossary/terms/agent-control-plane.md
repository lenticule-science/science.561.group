---
id: agent-control-plane
description: "A system that represents agent identities, organizational relations, goals, policies, budgets, approvals, and operator intervention independently of worker runtimes."
defines: agent-control-plane
distinguished-from: agent-runtime, durable-work-ledger
date-created: 2026-08-29
sources:
  - https://github.com/paperclipai/paperclip
---

An agent control plane represents who agents are, how they relate to an
organization, what goals and policies constrain them, what they may spend, and
where operators may intervene. It can coordinate heterogeneous runtimes. Its
records are not automatically authoritative corporate records; a lawful
control plane projects from or reconciles with the owners of authority, money,
obligations, and machine state.
