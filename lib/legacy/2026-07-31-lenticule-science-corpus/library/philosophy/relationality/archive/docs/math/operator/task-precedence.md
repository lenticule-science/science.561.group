---
title: Task Precedence
id: task-precedence
role: Establish a precedence relation over tasks based on trace read/write sets and
  commutation.
status: plan
inputs:
- id: task-carrier
  name: tasks
- id: trace
  name: trace
outputs:
- id: task-carrier
  name: tasks-with-precedes
transformation:
- return
- value
proof_refs: []
---


# Task Precedence

Defines a precedence relation over tasks: writes must precede dependent reads;
commuting tasks need not be ordered.

## Behaviour
- Compute read/write sets per task from the trace context.
- Use [task-commutation](task-commutation.md) to identify commuting tasks.
- Build the `Precedes` relation accordingly and annotate tasks.

## Invariants
- Dependency soundness: every read is preceded by all writers to that trace
  region/channel.
- Commutation: only commuting tasks may be unordered.
- Acyclicity: precedence is acyclic.

## Proof
- Uses: read/write set extraction and commutation to compute precedence.
- Shows that: imposing ordering for interfering tasks and omitting it for
  commuting tasks yields a sound, acyclic precedence relation.
