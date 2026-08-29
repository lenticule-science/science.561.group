---
name: lifecycle-state-machine
description: A thin small category L on 8 status-objects (open, in-progress, blocked, review, done, deferred, abandoned, reopened) whose morphisms are valid lifecycle transitions. The state-machine validity check for a proposed transition (from, to) is L(from, to) != empty.
specializing: category
having-objects: 8
transitions:
  open: [in-progress, blocked, abandoned]
  in-progress: [blocked, review, abandoned, deferred]
  blocked: [in-progress, abandoned]
  review: [done, in-progress, abandoned]
  done: [reopened]
  deferred: [in-progress, abandoned]
  abandoned: [reopened]
  reopened: [open]
---

The **lifecycle-state-machine** is the small category $L$ whose objects are the 8 work-item lifecycle states and whose morphisms are the valid transitions between them.
Per the work-item-as-predication-shape derivation, $L$ is thin (at most one morphism per ordered pair), so $L(s_1, s_2)$ is either a singleton (the transition is valid) or empty (invalid).

The transitions are declared in the frontmatter `transitions:` field as a mapping from source-state to a list of admissible target-states.
The transitioning-a-work-items-state transformer reads this field to validate a proposed transition before firing.

## Categorical content

$L$ is a sub-category of the free category on the transition-graph quotiented by composition coherence.
Identity at each state is "no transition."
Composition is sequencing of transitions — valid only when the intermediate state matches; e.g., (open → in-progress) ∘ (in-progress → review) is valid and equals the composite morphism representing the two-step path from open to review.

## Closure properties

The state-machine itself is acyclic at the object level (no state has a transition cycle that comes back to itself in one step), but two-step compositions can return: open → in-progress → blocked → in-progress → review, etc. The "reopened" state is the recovery point: done → reopened → open and abandoned → reopened → open.
The reopened state is intentionally one-shot — its only outgoing transition is to open — so reopen-then-immediately-stuck cycles cannot form.
