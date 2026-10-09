---
name: auditing
gerund: auditing
agent-noun: auditor
imperative: audit
description: A composer transformer that runs lint plus cross-file resolution checks plus categorical-membership checks against a file or directory and returns a combined diagnostic report.
title: auditing
---

An audit transformer is a composer. It invokes lint and one or more resolve and category-check morphisms, collects their diagnostics, and emits a combined report.

Auditing is read-only at the substrate boundary. It does not edit the file or the records it checks; it only reports.

## Domain and codomain

- **Domain:** a file path (for `auditing-a-file`) or a directory path (for `auditing-a-directory`).
- **Codomain:** a combined diagnostic report partitioned by which composed skill emitted each diagnostic.

## Morphological forms in naming grammar

- `gerund: auditing` heads skills built on this transformer: `auditing-a-file`, `auditing-a-directory`.
- `agent-noun: auditor` heads agents that invoke such skills: `auditor-of-a-file`, `auditor-of-a-directory`.
- `imperative: audit` heads scripts that body such skills: `audit-a-file.mjs`, `audit-a-directory.mjs`.
