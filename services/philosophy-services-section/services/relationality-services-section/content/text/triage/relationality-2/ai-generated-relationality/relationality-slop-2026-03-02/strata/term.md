---
title: Term
aliases:
  - "Term"
  - "term"
date-created: 2026-02-28T00:00:00
---
# Term Stratum

Term-level acts introduce variables, binders, fixpoint constructors, and the
evaluation contexts that carry syntax forward.  This stratum is where the trace
machinery hardens into the objects manipulated by the judgement layer.

Acts classified under **term** grouped by phase.

## Free Phase

| Act | Title |
| --- | --- |
| `EquateEventually` | [Equating Eventually](404.md) |
| `RecognizeEquateEventually` | [Recognizing Eventual Equivalence](404.md) |
| `EnforceEquateEventuallyLaw` | [Enforcing Eventual Equivalence Law](404.md) |
| `SeedTerm` | [Seeding Terms](404.md) |
| `BindTerm` | [Binding Terms](404.md) |
| `PresentVariableTerm` | [Presenting Variable Term](404.md) |
| `FormTermBody` | [Forming Term Body](404.md) |
| `FormFunctionTerm` | [Forming Function Term](404.md) |
| `PairApplication` | [Pairing Application](404.md) |
| `FormApplicationTerm` | [Forming Application Term](404.md) |
| `PairLeastFix` | [Pairing Least Fix](404.md) |
| `FormLeastFixTerm` | [Forming Least Fix Term](404.md) |
| `PairGreatestFix` | [Pairing Greatest Fix](404.md) |
| `FormGreatestFixTerm` | [Forming Greatest Fix Term](404.md) |
| `TypeSeed` | [Seeding Types](404.md) |
| `TypeVariable` | [Typing Variables](404.md) |
| `TypeApplication` | [Typing Applications](404.md) |
| `WeakeningSeed` | [Seeding Weakening](404.md) |
| `GreatestFixpointTypeSeed` | [Seeding Greatest Fixpoint Typing](404.md) |
| `GreatestFixpointTypingStep` | [Stepping Greatest Fixpoint Typing](404.md) |
| `BinderSeed` | [Seeding Binder](404.md) |
| `BinderTransport` | [Transporting Binder](404.md) |
| `BinderApplication` | [Applying Binder](404.md) |
| `SubstitutionTerm` | [Forming Substitution Term](404.md) |
| `Reduce` | [Reducing](404.md) |
| `StepTrace` | [Tracing Steps](404.md) |
| `Normalization` | [Normalizing](404.md) |
| `EquateContexts` | [Equating Contexts](404.md) |
| `SeedEvaluationContext` | [Seeding Evaluation Context](404.md) |
| `BuildEvaluationContext` | [Building Evaluation Context](404.md) |
| `SeedValue` | [Seeding Values](404.md) |
| `RecognizeValue` | [Recognizing Values](404.md) |
