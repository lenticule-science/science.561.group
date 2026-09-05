---
title: ActivityPub Program
id: activitypub-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



Program-level sketch to expose the relational computer through ActivityPub:
map internal knowledge/runbooks to ActivityStreams activities and actors while
keeping all storage as earned recognitions.

## Behaviour
- Translate ActivityStreams JSON to internal recognitions and runbooks via
  [Recognition](./recognition.md) and
  [Recognize Spec](./recognize-spec.md); apply
  policy/topology constraints.
- Build/execute wiring plans for inbox/outbox handling via
  [Plan Runbook](./plan-runbook.md),
  [Evaluate Step](./evaluate-step.md),
  [Detect Plan Conflicts](./detect-plan-conflicts.md), and
  [Stabilize Plan](./stabilize-plan.md).
- Publish posts/resources as ActivityStreams objects; map to internal
  [Program Command](./program-command.md) and
  [Program Wiring Plan](./program-wiring-plan.md).
- Snapshot ActivityPub state via [Snapshot Plan](./snapshot-plan.md) using
  [Program Snapshot](./program-snapshot.md) and
  [Program Transcript](./program-transcript.md).
- Do not introduce new storage; reuse the knowledge graph and traceability.

## Goals
- Federate site/knowledge content via ActivityPub.
- Maintain semantic alignment with the internal knowledge graph and RDF/OWL
  correspondences.

## Proof
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
