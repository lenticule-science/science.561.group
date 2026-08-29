---
type: morphism
class: composed-operator
realizes: [schema-evolution]
depends-on: [insertion, validate-against-shape]
see-also: [retire, vocabulary-completeness]
---

# Add predicate

The operator that introduces a new predicate to a [scope](teaching/explanations/scope.md)'s vocabulary, declaring its identity, its [shape](theories/agential-orchestration-platform/concepts/shape.md), its admissibility profile, and any closure rules that consume or produce it. Add-predicate is the substrate's [schema-evolution](teaching/explanations/schema-evolution.md) primitive for vocabulary growth.

## Signature

`add-predicate(predicate-name, shape-spec, admissibility-spec, scope, agent) → (predicate-record, witness) | (rejection, witness)`

Inputs:

- **`predicate-name`** — the predicate's identifier. Must be unique within the scope.
- **`shape-spec`** — the predicate's expected shape: what entity types may appear in subject and object positions, what value-domain values are admissible, what cardinality constraints apply (one-per-subject, many-per-subject, etc.).
- **`admissibility-spec`** — the predicate's admissibility profile: which scopes admit claims using this predicate, which agents are authorized to assert it, what authorization is required to retract it.
- **`scope`** — the scope into which the predicate is being added.
- **`agent`** — the agent introducing the predicate. Must be authorized for vocabulary edits within the scope.

Outputs:

- **`predicate-record`** — the substrate-resident record of the new predicate, with predications declaring its name, shape, admissibility, and the agent who introduced it.
- **`rejection`** — the predicate cannot be added: name conflict, shape contradiction with existing content, scope admissibility violation, agent unauthorized.
- **`witness`** — the witness chain entry recording the addition.

## Operational semantics

Add-predicate proceeds in five steps:

1. *Validate inputs.* Check that the predicate name is unique in the scope, the shape-spec is well-formed (consistent with the substrate's shape-vocabulary), the admissibility-spec is consistent with the scope's admission discipline, the agent is authorized.
2. *Run shape consistency check.* Per [validate-against-shape](validate-against-shape.md), check whether existing substrate content uses the new predicate (if any). If it does, the existing predications must conform to the new shape; predications that conflict with the new shape produce a rejection (or a contested-predication path per substrate policy).
3. *Insert predicate-record.* Insert (per [insertion](insertion.md)) the predications declaring the new predicate's identity, shape, admissibility, and authoring agent.
4. *Update scope vocabulary.* Insert the predication `scope-admits(scope, predicate)` declaring the scope's expanded vocabulary. Per [vocabulary-completeness](teaching/explanations/vocabulary-completeness.md), this resolves vocabulary debt for any prior predications that were waiting for this predicate to be declared.
5. *Witness emit.* Per the substrate's witness discipline, the addition is in the audit trail.

## Engineering invariants

- **Shape consistency required.** Adding a predicate whose shape conflicts with existing predications is rejected. The substrate does not silently admit a new predicate alongside content that violates its shape.
- **Admissibility composes.** Per [scope-as-predication](teaching/explanations/scope-as-predication.md), the admissibility-spec composes with the scope's admission discipline; the predicate inherits the scope's authorization defaults plus its own additions.
- **Idempotent.** Adding the same predicate with the same shape and admissibility twice is a no-op (the predicate-record is content-hash-equal). The substrate's content-addressed deduplication catches this.
- **Replay-stable.** Per [source-of-truth](teaching/explanations/source-of-truth.md), replaying the substrate's event log under the new predicate's specification produces the working model that includes the predicate. Substrates loaded from the log after the predicate was added all see the new predicate.

## Failure modes

- **Name conflict.** A predicate with the same name already exists in the scope. Reject; surface the existing predicate's record.
- **Shape violation.** Existing substrate content uses the predicate with a shape inconsistent with the new spec. Reject (or admit-with-violations per policy) and surface the conflicting predications.
- **Authorization revoked.** Per ordinary admission discipline.
- **Cyclic shape dependency.** The new predicate's shape references a predicate that has not yet been added; the dependency creates a cycle. Reject; the substrate may suggest the order to admit predicates.

## Position in the substrate

Add-predicate is the substrate's *vocabulary-growth primitive*. Per [schema-evolution](teaching/explanations/schema-evolution.md), it is what makes the substrate's vocabulary editable while the substrate is running. Without it, vocabulary changes require tearing down the substrate and rebuilding it from a new schema; with it, vocabulary changes are ordinary substrate operations witnessed in the substrate's audit trail.

The morphism composes with [retire](retire.md) (the inverse: removing a predicate from active use), with [validate-against-shape](validate-against-shape.md) (the shape consistency check), with [insertion](insertion.md) (the underlying primitive for the predicate-record predications), and with [governance-decision](theories/agential-orchestration-platform/morphisms/governance-decision.md) (when the addition affects multiple agents' vocabularies, governance may decide the cross-agent admissibility).
