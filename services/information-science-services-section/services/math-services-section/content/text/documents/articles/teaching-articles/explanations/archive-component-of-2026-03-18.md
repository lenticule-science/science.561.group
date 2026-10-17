---
id: component-of
description: "A relation declaring that the subject is a named, direct structural member of the object at one level of decomposition. Non-transitive: a component's components are not thereby components of the whole."
mathematical-object: category
references:
  - "Awodey, Category Theory, 2nd ed., Oxford University Press, 2010"
extends: Relation
describes: Entity
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  subject: relational-universe
  whole: relational-universe
output: relational-universe-morphism
ast:
  named-projection:
    - whole
    - subject
title: Component-of
---

# Component-of

Let $\mathcal{C}$ be a category with finite products.

**Definition.** An object $A$ is a **component of** an object $B$ if there exists a named projection morphism $\pi : B \to A$ — that is, $A$ is a factor of $B$ in a product decomposition, accessible by a specified projection.

**Proposition.** Component-of is **non-transitive**: if $A$ is a component of $B$ via $\pi_1 : B \to A$ and $X$ is a component of $A$ via $\pi_2 : A \to X$, the composite $\pi_2 \circ \pi_1 : B \to X$ exists, but $X$ becomes a component of $B$ only when there exists a direct named projection $B \to X$; the composite $\pi_2 \circ \pi_1$ alone is insufficient.

In type theory, this corresponds to a record field: if $B$ is a record type and $A$ is the type of field $\ell$ in $B$, then $A$ is a component of $B$ accessed by projection $\pi_\ell : B \to A$.

**Distinction from related notions:**
- `part-of` — transitive mereological membership (loses the named-projection structure)
- `component-of` — non-transitive, requires a named projection morphism
- `extends` — $X$ embeds into the subject via a monomorphism; the subject has all of $X$ plus more

## Open questions

