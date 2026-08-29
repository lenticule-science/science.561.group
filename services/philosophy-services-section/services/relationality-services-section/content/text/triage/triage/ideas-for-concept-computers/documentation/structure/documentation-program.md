---
title: Documentation Program
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-kernel
uses:
  - program/documentation/structure/documentation-workspace
  - program/documentation/structure/documentation-session
  - program/documentation/structure/documentation-command
  - program/documentation/structure/documentation-transcript
  - program/documentation/operator/documentation-measure
  - program/documentation/operator/documentation-nucleation
produces:
  - program/documentation/structure/documentation-transcript
  - program/documentation/structure/documentation-measurement-report
---
# Documentation Program

The **Documentation Program** is a program-layer runbook over the computer
kernel specialised to maintain and improve documentation corpora. It packages
computer carriers/operators into an SDK-facing pipeline that accepts a
snapshot, measures it, rewrites it, and persists transcripts. It is defined for
any corpus that satisfies its carrier contracts; our repository is one such
corpus.

## Carrier
- **Plan:** a finite acyclic wiring over documentation operators:
  [Documentation Measurement](../operator/documentation-measure.md),
  [Documentation Nucleation](../../../../../documents/articles/notes/documentation-nucleation.md),
  plus computer operators
  ([Recognition](../../../../relationality-2/ai-generated-relationality/relationality-slop-2026-03-04/phenomena/recognition.md),
  [EvaluateStep](../../../../../documents/articles/notes/evaluate-step.md),
  [Storage](../../../../../documents/articles/notes/storage.md),
  [Wiring](../../../../../documents/articles/notes/wiring.md)).
- **Inputs:** documentation carriers
  ([Documentation Workspace](./documentation-workspace.md),
  [Documentation Session](./documentation-session.md),
  [Documentation Command](./documentation-command.md),
  [Documentation Transcript](./documentation-transcript.md)).
- **Outputs:** updated documentation transcripts and
  [Documentation Measurement Reports](./documentation-measurement-report.md); may
  emit [Computer Failure](../../../../../documents/articles/notes/computer-failure.md) via
  underlying operators.

## Behaviour
1. Load a documentation snapshot into the [Documentation Workspace](./documentation-workspace.md)
   and [Documentation Session](./documentation-session.md).
2. Measure the corpus (for example, via the linter) to produce a
   [Measurement Report](./documentation-measurement-report.md).
3. Apply nucleation rewrites (split omnibus documents, tighten links) over the
   workspace according to the program wiring and documented commands.
4. Store updated transcripts/snapshots and emit failures when the plan cannot
   progress.

## Invariants
- Plan must remain acyclic (inherits the computer [Wiring Plan](../../../../../documents/articles/notes/computer-wiring-plan.md) constraint).
- Every operator invocation consumes/produces the correct computer carriers and
  may emit [Computer Failure](../../../../../documents/articles/notes/computer-failure.md).
- Documentation snapshots/workspaces remain well-typed carriers for subsequent runs.

## Proof
Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
Shows that: constraining the computer operators to documentation measurement
and rewrite tasks yields a runnable documentation pipeline over computer
carriers, preserving kernel semantics while specialising to documentation corpora.
