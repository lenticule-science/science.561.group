---
name: lifecycle-state-machine
description: The kind-specific lifecycle-state-machine for friction-note. Narrows the universal work-item lifecycle to the 3 states {open,triaged,withdrawn} appropriate for this kind, with the listed valid transitions.
specializing: lifecycle-state-machine
having-objects: 3
transitions:
  triaged: [withdrawn]
  open: [triaged, withdrawn]---

The **friction-note lifecycle-state-machine** is the kind-specific specialization of the [universal lifecycle-state-machine](../../../lifecycle-state-machine/lifecycle-state-machine.md). friction-note has a narrower has-status state-set than the 8-state task lifecycle: only {open,triaged,withdrawn}.

This per-kind machine is what transitioning-a-work-items-state should consult when the target's has-kind is "friction-note" — falling back to the universal lifecycle-state-machine only for kinds without their own specialization.

Per the work-item-as-predication-shape derivation, has-status's specialization-by-kind is one of the predicate-category morphisms acting on the workflow predicates: the universal has-status restricts to has-friction-note-status via predicate-specialization, with the sub-support inclusion restricting to entities of kind = "friction-note".
