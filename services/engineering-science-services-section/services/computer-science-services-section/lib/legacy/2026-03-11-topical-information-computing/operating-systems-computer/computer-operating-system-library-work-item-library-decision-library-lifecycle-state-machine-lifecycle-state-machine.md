---
name: lifecycle-state-machine
description: The kind-specific lifecycle-state-machine for decision. Narrows the universal work-item lifecycle to the 3 states {pending,recorded,superseded} appropriate for this kind, with the listed valid transitions.
specializing: lifecycle-state-machine
having-objects: 3
transitions:
  recorded: [superseded]
  pending: [recorded, superseded]---

The **decision lifecycle-state-machine** is the kind-specific specialization of the [universal lifecycle-state-machine](../../../lifecycle-state-machine/lifecycle-state-machine.md). decision has a narrower has-status state-set than the 8-state task lifecycle: only {pending,recorded,superseded}.

This per-kind machine is what transitioning-a-work-items-state should consult when the target's has-kind is "decision" — falling back to the universal lifecycle-state-machine only for kinds without their own specialization.

Per the work-item-as-predication-shape derivation, has-status's specialization-by-kind is one of the predicate-category morphisms acting on the workflow predicates: the universal has-status restricts to has-decision-status via predicate-specialization, with the sub-support inclusion restricting to entities of kind = "decision".
