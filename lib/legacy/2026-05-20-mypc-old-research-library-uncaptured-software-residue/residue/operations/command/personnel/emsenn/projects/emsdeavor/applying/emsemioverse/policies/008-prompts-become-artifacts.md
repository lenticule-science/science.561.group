---
title: "Policy 008: Prompts become artifacts before action"
date-created: 2026-03-07T00:00:00
type: policy
number: 8
keywords:
  - Policies
  - Process
  - Provenance
description: "Every prompt should result in a repo artifact — a plan, a decision, a term, a text, a policy — before work begins."
---

Every prompt should result in a repo artifact — a plan, a decision, a
term, a text, a policy — before work begins.

## What this means

When emsenn gives direction, that direction contains information: what
to do, why, constraints, ideas, architectural insights. If the agent
acts on that information without recording it, the information exists
only in the conversation context. When the session ends, it is lost.
Future sessions either reinvent it or work from stale assumptions.

The fix: before acting on a prompt, record its content as one or more
repository artifacts. A request to build something becomes a plan. An
architectural insight becomes a decision record or a term. A constraint
becomes a policy. A research question becomes a question file. Only
after the information is recorded does the agent begin work.

This serves multiple policies:
- **005 (accrete, don't replace)**: the information accretes into the
  repository rather than living and dying in a conversation.
- **006 (research produces texts)**: research deliverables are texts,
  not conversation summaries.
- **001 (progressive automation)**: recorded plans and decisions are
  reusable by future agents, including less capable ones.

## What artifacts a prompt becomes

| Prompt type | Artifact |
|---|---|
| Build/implement request | Plan in `plans/` |
| Architectural insight | Decision record in `plans/decisions/` |
| New constraint or commitment | Policy in `policies/` |
| Research question | Question file or plan |
| New term or concept | Term/concept file |
| Feedback on process | Decision record or policy amendment |

A single prompt often becomes multiple artifacts. "We should automate
the bibliography" becomes a plan (for the automation work) and possibly
a decision record (for why automation is better than hand-maintenance).

## Operational implications

- When a prompt arrives, the agent's first action is to identify what
  artifacts it produces. The agent creates those artifacts, then acts
  on them.
- Plans prevent work from being abandoned halfway. A plan records what
  "done" looks like, so work can be resumed in a future session.
- Plans prevent hyperfocus. A plan records the scope, so the agent can
  check whether it is going beyond what was asked.
- The conversation summary at the end of work is not the artifact. The
  artifacts are the files in the repo. The conversation is ephemeral;
  the repo is permanent.
- Not every prompt needs a heavyweight artifact. A quick fix does not
  need a plan. Use judgment: if the work is small enough to complete
  in a few minutes with no ambiguity, just do it. The policy applies
  to work that spans sessions, involves architectural decisions, or
  introduces new commitments.
