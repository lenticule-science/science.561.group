# Term Stratum

Term-level acts introduce variables, binders, fixpoint constructors, and the
evaluation contexts that carry syntax forward.  This stratum is where the trace
machinery hardens into the objects manipulated by the judgement layer.

Acts classified under **term** grouped by phase.

## Free Phase

| Index | Act | Title |
| --- | --- | --- |
| 0046 | `EquateEventually` | [Equating Eventually](../acts/0046-equate-eventually.md) |
| 0047 | `RecognizeEquateEventually` | [Recognizing Eventual Equivalence](../acts/0047-recognize-equate-eventually.md) |
| 0048 | `EnforceEquateEventuallyLaw` | [Enforcing Eventual Equivalence Law](../acts/0048-enforce-equate-eventually-law.md) |
| 0049 | `SeedTerm` | [Seeding Terms](../acts/0049-seed-term.md) |
| 0050 | `BindTerm` | [Binding Terms](../acts/0050-bind-term.md) |
| 0051 | `PresentVariableTerm` | [Presenting Variable Term](../acts/0051-present-variable-term.md) |
| 0052 | `FormTermBody` | [Forming Term Body](../acts/0052-form-term-body.md) |
| 0053 | `FormFunctionTerm` | [Forming Function Term](../acts/0053-form-function-term.md) |
| 0054 | `PairApplication` | [Pairing Application](../acts/0054-pair-application.md) |
| 0055 | `FormApplicationTerm` | [Forming Application Term](../acts/0055-form-application-term.md) |
| 0056 | `PairLeastFix` | [Pairing Least Fix](../acts/0056-pair-least-fix.md) |
| 0057 | `FormLeastFixTerm` | [Forming Least Fix Term](../acts/0057-form-least-fix-term.md) |
| 0058 | `PairGreatestFix` | [Pairing Greatest Fix](../acts/0058-pair-greatest-fix.md) |
| 0059 | `FormGreatestFixTerm` | [Forming Greatest Fix Term](../acts/0059-form-greatest-fix-term.md) |
| 0060 | `TypeSeed` | [Seeding Types](../acts/0060-type-seed.md) |
| 0061 | `TypeVariable` | [Typing Variables](../acts/0061-type-variable.md) |
| 0062 | `TypeApplication` | [Typing Applications](../acts/0062-type-application.md) |
| 0063 | `WeakeningSeed` | [Seeding Weakening](../acts/0063-weakening-seed.md) |
| 0064 | `GreatestFixpointTypeSeed` | [Seeding Greatest Fixpoint Typing](../acts/0064-greatest-fixpoint-type-seed.md) |
| 0065 | `GreatestFixpointTypingStep` | [Stepping Greatest Fixpoint Typing](../acts/0065-greatest-fixpoint-typing-step.md) |
| 0066 | `BinderSeed` | [Seeding Binder](../acts/0066-binder-seed.md) |
| 0067 | `BinderTransport` | [Transporting Binder](../acts/0067-binder-transport.md) |
| 0068 | `BinderApplication` | [Applying Binder](../acts/0068-binder-application.md) |
| 0069 | `SubstitutionTerm` | [Forming Substitution Term](../acts/0069-substitution-term.md) |
| 0070 | `Reduce` | [Reducing](../acts/0070-reduce.md) |
| 0071 | `StepTrace` | [Tracing Steps](../acts/0071-step-trace.md) |
| 0072 | `Normalization` | [Normalizing](../acts/0072-normalization.md) |
| 0073 | `EquateContexts` | [Equating Contexts](../acts/0073-equate-contexts.md) |
| 0074 | `SeedEvaluationContext` | [Seeding Evaluation Context](../acts/0074-seed-evaluation-context.md) |
| 0075 | `BuildEvaluationContext` | [Building Evaluation Context](../acts/0075-build-evaluation-context.md) |
| 0076 | `SeedValue` | [Seeding Values](../acts/0076-seed-value.md) |
| 0077 | `RecognizeValue` | [Recognizing Values](../acts/0077-recognize-value.md) |
