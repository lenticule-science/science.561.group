---
name: workflow-predicate-category
description: A small sub-category of the predicate-category C. Objects are the 11 workflow predicates (has-kind, has-status, owned-by, assigned-to, has-priority, has-deadline, depends-on, contributes-to, blocked-by, claimed-by, has-estimated-effort). Morphisms are the four canonical predicate-category generators restricted to these predicates.
specializing: predicate-category
having-objects: 11
---

The **workflow-predicate-category** is the small sub-category $\mathcal{C}_{\text{workflow}} \hookrightarrow \mathcal{C}$ of the OS-wide [predicate-category](../../../../../../../../../predicate-category/predicate-category.md) whose object set is the workflow predicate set $\Pi_{\text{workflow}}$.

## Objects

$$\mathrm{Ob}(\mathcal{C}_{\text{workflow}}) = \{\text{has-kind, has-status, owned-by, assigned-to, has-priority, has-deadline, depends-on, contributes-to, blocked-by, claimed-by, has-estimated-effort}\}$$

The first 9 predicates are the core set named in the work-item-as-predication-shape derivation.
The two additions — claimed-by and has-estimated-effort — were earned during the lifecycle-transformer implementation pass as natural workflow predicates that the existing characteristic cells did not cover. claimed-by tracks ownership commitments distinct from owned-by (assignment of execution responsibility, possibly different from accountability); has-estimated-effort tracks pre-execution estimates that the planning machinery uses.

## Morphisms

The four canonical predicate-category generators apply to workflow predicates:

- **Specialization.** has-kind specializes per work-item-kind. has-status specializes per kind to a kind-specific status set (task: full 8-state; question: {open, answered, withdrawn}; decision: {pending, recorded, superseded}; friction-note/triage-note: {open, triaged, withdrawn}).
- **Converse.** depends-on and blocks are converses: (a depends-on b) ⟺ (b blocks a). contributes-to has converse is-contributed-to-by.
- **Subject-projection.** Useful for self-referential workflow predicates (none currently).
- **Object-projection.** Symmetric.

## Closure rules

Two closure rules fire over the workflow predicate cells:

1. **Block-propagation.** If $(a, \text{depends-on}, b) \wedge (b, \text{has-status}, \text{blocked})$, derive $(a, \text{has-status}, \text{blocked})$.
  Implemented by [propagating-blocks](../work-item/doing/working/propagating-blocks/propagating-blocks.md).

2. **Completion-rollup.** If $\forall a$ with $(a, \text{contributes-to}, p)$: $(a, \text{has-status}, \text{done})$, derive $(p, \text{has-status}, \text{done})$ as a suggestive positing.
  Implemented by [rolling-up-progress-across-projects](../work-item/learning/answering/rolling-up-progress-across-projects/rolling-up-progress-across-projects.md).
