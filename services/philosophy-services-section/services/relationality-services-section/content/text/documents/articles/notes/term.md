# Term Stratum

Term-level acts introduce variables, binders, fixpoint constructors, and the
evaluation contexts that carry syntax forward.  This stratum is where the trace
machinery hardens into the objects manipulated by the judgement layer.

Acts classified under **term** grouped by phase.

## Free Phase

| Index | Act | Title |
| --- | --- | --- |
| 0046 | `EquateEventually` | [Equating Eventually](./0046-equate-eventually.md) |
| 0047 | `RecognizeEquateEventually` | [Recognizing Eventual Equivalence](./0047-recognize-equate-eventually.md) |
| 0048 | `EnforceEquateEventuallyLaw` | [Enforcing Eventual Equivalence Law](./0048-enforce-equate-eventually-law.md) |
| 0049 | `SeedTerm` | [Seeding Terms](./0049-seed-term.md) |
| 0050 | `BindTerm` | [Binding Terms](./0050-bind-term.md) |
| 0051 | `PresentVariableTerm` | [Presenting Variable Term](./0051-present-variable-term.md) |
| 0052 | `FormTermBody` | [Forming Term Body](./0052-form-term-body.md) |
| 0053 | `FormFunctionTerm` | [Forming Function Term](./0053-form-function-term.md) |
| 0054 | `PairApplication` | [Pairing Application](./0054-pair-application.md) |
| 0055 | `FormApplicationTerm` | [Forming Application Term](./0055-form-application-term.md) |
| 0056 | `PairLeastFix` | [Pairing Least Fix](./0056-pair-least-fix.md) |
| 0057 | `FormLeastFixTerm` | [Forming Least Fix Term](./0057-form-least-fix-term.md) |
| 0058 | `PairGreatestFix` | [Pairing Greatest Fix](./0058-pair-greatest-fix.md) |
| 0059 | `FormGreatestFixTerm` | [Forming Greatest Fix Term](./0059-form-greatest-fix-term.md) |
| 0060 | `TypeSeed` | [Seeding Types](./0060-type-seed.md) |
| 0061 | `TypeVariable` | [Typing Variables](./0061-type-variable.md) |
| 0062 | `TypeApplication` | [Typing Applications](./0062-type-application.md) |
| 0063 | `WeakeningSeed` | [Seeding Weakening](./0063-weakening-seed.md) |
| 0064 | `GreatestFixpointTypeSeed` | [Seeding Greatest Fixpoint Typing](./0064-greatest-fixpoint-type-seed.md) |
| 0065 | `GreatestFixpointTypingStep` | [Stepping Greatest Fixpoint Typing](./0065-greatest-fixpoint-typing-step.md) |
| 0066 | `BinderSeed` | [Seeding Binder](./0066-binder-seed.md) |
| 0067 | `BinderTransport` | [Transporting Binder](./0067-binder-transport.md) |
| 0068 | `BinderApplication` | [Applying Binder](./0068-binder-application.md) |
| 0069 | `SubstitutionTerm` | [Forming Substitution Term](./0069-substitution-term.md) |
| 0070 | `Reduce` | [Reducing](./0070-reduce.md) |
| 0071 | `StepTrace` | [Tracing Steps](./0071-step-trace.md) |
| 0072 | `Normalization` | [Normalizing](./0072-normalization.md) |
| 0073 | `EquateContexts` | [Equating Contexts](./0073-equate-contexts.md) |
| 0074 | `SeedEvaluationContext` | [Seeding Evaluation Context](./0074-seed-evaluation-context.md) |
| 0075 | `BuildEvaluationContext` | [Building Evaluation Context](./0075-build-evaluation-context.md) |
| 0076 | `SeedValue` | [Seeding Values](./0076-seed-value.md) |
| 0077 | `RecognizeValue` | [Recognizing Values](./0077-recognize-value.md) |
