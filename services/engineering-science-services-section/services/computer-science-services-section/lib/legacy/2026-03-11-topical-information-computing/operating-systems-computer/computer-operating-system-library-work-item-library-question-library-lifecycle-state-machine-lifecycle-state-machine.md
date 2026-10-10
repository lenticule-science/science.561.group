---
name: lifecycle-state-machine
description: The kind-specific lifecycle-state-machine for question. Narrows the universal work-item lifecycle to the 3 states {open,answered,withdrawn} appropriate for this kind, with the listed valid transitions.
specializing: lifecycle-state-machine
having-objects: 3
transitions:
  open: [answered, withdrawn]
  answered: [withdrawn]---

The **question lifecycle-state-machine** is the kind-specific specialization of the [universal lifecycle-state-machine](../../../lifecycle-state-machine/lifecycle-state-machine.md). question has a narrower has-status state-set than the 8-state task lifecycle: only {open,answered,withdrawn}.

This per-kind machine is what transitioning-a-work-items-state should consult when the target's has-kind is "question" — falling back to the universal lifecycle-state-machine only for kinds without their own specialization.

Per the work-item-as-predication-shape derivation, has-status's specialization-by-kind is one of the predicate-category morphisms acting on the workflow predicates: the universal has-status restricts to has-question-status via predicate-specialization, with the sub-support inclusion restricting to entities of kind = "question".
