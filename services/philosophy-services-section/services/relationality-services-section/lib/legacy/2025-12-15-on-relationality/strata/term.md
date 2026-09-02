# Term Stratum

Term-level acts introduce variables, binders, fixpoint constructors, and the
evaluation contexts that carry syntax forward.  This stratum is where the trace
machinery hardens into the objects manipulated by the judgement layer.

Acts classified under **term** grouped by phase.

## Free Phase

| Act | Title |
| --- | --- |
| `EquateEventually` | [Equating Eventually](../acts/equate-eventually.md) |
| `RecognizeEquateEventually` | [Recognizing Eventual Equivalence](../acts/recognize-equate-eventually.md) |
| `EnforceEquateEventuallyLaw` | [Enforcing Eventual Equivalence Law](../acts/enforce-equate-eventually-law.md) |
| `SeedTerm` | [Seeding Terms](../acts/seed-term.md) |
| `BindTerm` | [Binding Terms](../acts/bind-term.md) |
| `PresentVariableTerm` | [Presenting Variable Term](../acts/present-variable-term.md) |
| `FormTermBody` | [Forming Term Body](../acts/form-term-body.md) |
| `FormFunctionTerm` | [Forming Function Term](../acts/form-function-term.md) |
| `PairApplication` | [Pairing Application](../acts/pair-application.md) |
| `FormApplicationTerm` | [Forming Application Term](../acts/form-application-term.md) |
| `PairLeastFix` | [Pairing Least Fix](../acts/pair-least-fix.md) |
| `FormLeastFixTerm` | [Forming Least Fix Term](../acts/form-least-fix-term.md) |
| `PairGreatestFix` | [Pairing Greatest Fix](../acts/pair-greatest-fix.md) |
| `FormGreatestFixTerm` | [Forming Greatest Fix Term](../acts/form-greatest-fix-term.md) |
| `TypeSeed` | [Seeding Types](../acts/type-seed.md) |
| `TypeVariable` | [Typing Variables](../acts/type-variable.md) |
| `TypeApplication` | [Typing Applications](../acts/type-application.md) |
| `WeakeningSeed` | [Seeding Weakening](../acts/weakening-seed.md) |
| `GreatestFixpointTypeSeed` | [Seeding Greatest Fixpoint Typing](../acts/greatest-fixpoint-type-seed.md) |
| `GreatestFixpointTypingStep` | [Stepping Greatest Fixpoint Typing](../acts/greatest-fixpoint-typing-step.md) |
| `BinderSeed` | [Seeding Binder](../acts/binder-seed.md) |
| `BinderTransport` | [Transporting Binder](../acts/binder-transport.md) |
| `BinderApplication` | [Applying Binder](../acts/binder-application.md) |
| `SubstitutionTerm` | [Forming Substitution Term](../acts/substitution-term.md) |
| `Reduce` | [Reducing](../acts/reduce.md) |
| `StepTrace` | [Tracing Steps](../acts/step-trace.md) |
| `Normalization` | [Normalizing](../acts/normalization.md) |
| `EquateContexts` | [Equating Contexts](../acts/equate-contexts.md) |
| `SeedEvaluationContext` | [Seeding Evaluation Context](../acts/seed-evaluation-context.md) |
| `BuildEvaluationContext` | [Building Evaluation Context](../acts/build-evaluation-context.md) |
| `SeedValue` | [Seeding Values](../acts/seed-value.md) |
| `RecognizeValue` | [Recognizing Values](../acts/recognize-value.md) |
