---
title: Lambda-calculus typing and reduction trace
type: example
article-kind: note
status: triaged
source-corpus: 2026-08-17-windows-561-group/sites/triage.dev.emsenn.net/content/_archive/type-theory
---

# Lambda-calculus typing and reduction trace

The flattened archive contained twenty-one small records from one generated
lambda-calculus trace. They are not twenty-one independent mathematical
concepts: each record is a vertex in a single dependency chain. This note
keeps the complete chain while giving it one canonical home.

| canonical record | head | tail | role |
| --- | --- | --- | --- |
| `TypingSeed` | `ContextRecognition` | `TermBinding` | judgement seed |
| `TypingVariable` | `VariableTerm` | `TypingSeed` | variable typing |
| `TypingBody` | `ContextExtension` | `TermBody` | body typing |
| `TypingFunction` | `FunctionTerm` | `TypingBody` | abstraction typing |
| `TypingApplication` | `ApplicationTerm` | `ContextTrace` | application typing |
| `WeakeningSeed` | `ContextExtension` | `TypingVariable` | first weakening step |
| `WeakeningStep` | `TypingApplication` | `WeakeningSeed` | weakening propagation |
| `WeakeningTrace` | `ContextTrace` | `WeakeningStep` | weakening stability |
| `TermSeed` | `TraceHead` | `ContextTrace` | term construction seed |
| `TermBinding` | `FirstName` | `TermSeed` | binding a name |
| `TermBody` | `TermBinding` | `TraceTail` | abstraction body |
| `VariableTerm` | `TermBinding` | `TraceHead` | variable constructor |
| `SubstitutionSeed` | `ApplicationTerm` | `TypingBody` | substitution seed |
| `SubstitutionStep` | `ContextTrace` | `SubstitutionSeed` | substitution judgement |
| `SubstitutionTerm` | `TermSeed` | `SubstitutionStep` | substitution record |
| `StepRecognition` | `EvaluationContext` | `BetaStep` | recognizing a reduction |
| `StepTrace` | `TraceWhole` | `BetaStep` | propagating a reduction |
| `StepObservationTail` | `TraceTail` | `TracedStepObservation` | accumulating observations |
| `StepObservationHead` | `TraceHead` | `StepObservationTail` | stabilizing observations |
| `StepObservation` | `StepRecognition` | `ObservationWitness` | recording a step's observation |

The original prose uses a consistent “unresolved obligation” construction:
each head/tail relation witnesses what has already been established, then
introduces the next record when the current witness cannot determine the next
property. In order, the chain records context recognition, variable binding,
typing, weakening, term formation, substitution, beta-step recognition and
trace propagation, followed by head/tail observation stabilization. The
individual source ids, strata, phases, and role annotations are retained in
the source legacy mirror; the table is the canonical navigable representation
of their mathematical content.
