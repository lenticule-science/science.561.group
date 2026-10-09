---
name: auditing
description: A predicate whose cells record the application of an audit process to a filestore or entity — including what process was applied and with what overall bilattice-valued outcome.
title: auditing
---

## Subjects and objects

Subject: a filestore or entity being subjected to audit.

Object: an audit skill or audit process entity — the specific process sequence that was applied.

## Cell values

- **true**: the audit process completed and found no violations.
- **false**: the audit process completed and found violations.
- **mystery**: no audit has been run on this subject by this process.
- **contradiction**: the audit produced inconsistent findings — typically indicating a rule conflict or an incomplete audit run.

## Mathematical structure

Auditing is a composited governance operation.
It is not simply linting applied many times: it sequences linting across a target set of entities and rules, records each finding as a substrate event (a witnessed positing), collects those findings into a report entity, and records the overall audit relationship at the auditing cell.

Formally: an audit process $a$ applied to subject $s$ executes a sequence of steps $a_1, \ldots, a_n$ where at minimum some $a_i$ are linting evaluations $(e, \mathtt{linting}, r)$ over entities $e$ in a scope and rules $r$ in a rule set.
The process also includes non-linting steps — witness emission, report entity construction, event logging — that are outside linting's scope.
The auditing cell $(s, \mathtt{auditing}, a)$ receives the knowledge-order meet of all step outcomes: true only if all steps succeed, false if any linting step finds a violation.

This makes auditing strictly stronger than a batch of linting: the process is witnessed, the findings are substrate entities, and the auditing cell itself is a durable record of the audit having occurred.

## Role in the substrate

Auditing cells provide the substrate's governance record of self-inspection.
A substrate that has never been audited has all auditing cells at mystery.
The audit process is itself a governance operation — it is defined as a skill, executed by an agent, and its results are substrate predications rather than external reports.
The auditing transformer is what makes self-inspection a first-class substrate predication rather than an external tool output.
