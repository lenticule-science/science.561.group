---
name: reviewing
gerund: reviewing
agent-noun: reviewer
imperative: review
description: A read-only transformer that compares a record against a later body of evidence and emits a classification with a recommended action (no-change, amend, supersede, split, or escalate).
title: reviewing
---

A reviewing transformer reads one record together with a later body of evidence (a corpus, a log, a single observation, or another record), classifies the evidence as confirming, extending, correcting, or unrelated to the record, and emits a recommended action on the record. The transformer does not edit the record; it only reports.

Reviewing is distinct from auditing in two ways. Auditing composes lint plus cross-file resolution checks and runs as a built-in correctness gate, so its codomain is a diagnostic report partitioned by skill. Reviewing instead compares a record to *later* evidence and emits a recommendation, so its codomain is a classification plus an action label.

## Domain and codomain

- **Domain:** a target record (file path or record identifier) paired with an evidence body (a later record, a log line, a paragraph, or a corpus).
- **Codomain:** a classification of the evidence relative to the target (confirms, extends, corrects, supersedes, unrelated) and a recommended action on the target (no-change, amend, supersede, split, new-record).

## Morphological forms in naming grammar

- `gerund: reviewing` heads skills built on this transformer: `reviewing-a-resource-with-accreted-wisdom`, `reviewing-a-lesson`, `reviewing-a-skill-against-a-diary-entry`, `reviewing-a-diary-entry-to-improve-skills`, `reviewing-the-diary-to-improve-skills`.
- `agent-noun: reviewer` heads agents that invoke such skills: `reviewer-of-a-resource`, `reviewer-of-a-diary-entry`.
- `imperative: review` heads scripts that body such skills: `review-entry.mjs`, `review-skill-against-entry.mjs`, `review-diary.mjs`.
