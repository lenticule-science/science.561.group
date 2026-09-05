---
id: unit
description: "A Unit is a value — a typed, self-contained element of a type where equality is structural: two units of the same type with the same attributes are the same unit, regardless of when or where they were created."
mathematical-object: category
references:
  - "Awodey, Category Theory, 2nd ed., Oxford University Press, 2010"
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  type: relational-universe
  content: relational-universe
output: relational-universe
ast:
  structural-equality-value:
    - type
    - content

---

# Unit

Let $\mathcal{C}$ be a category with a terminal object $1$.

**Definition.** A **global element** (or **unit**) of an object $A$ in $\mathcal{C}$ is a morphism $u : 1 \to A$.

**Proposition.** Two global elements $u, v : 1 \to A$ are equal iff they are equal as morphisms. Identity is determined entirely by content — there is no separate identity carrier.

**Proposition.** Since $1$ is the unit for products ($A \times 1 \cong A$), a global element $u : 1 \to A$ is the canonical way to select a specific element of $A$ from outside.

In type theory, a global element corresponds to a **closed term** $t : T$ — a term with no free variables, fully determined without ambient context. Two closed terms are equal iff they reduce to the same normal form.

**Definition.** A **unit** in this system is any value whose equality is structural: two units of the same type with identical attributes are the same unit. This contrasts with an [Entity](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/entity.md), which carries a separate identity that persists across attribute changes.

**Examples.**
- Two morphisms $1 \to A$ with the same composite are the same global element.
- In $\mathbf{Set}$, global elements of a set $A$ are exactly the elements of $A$.
- `WorkUnit` and `PromptUnit` are units: equality is by content, not by id.

**Proposition.** Units are closed under products: if $u : 1 \to A$ and $v : 1 \to B$, then $(u, v) : 1 \to A \times B$ is a unit of the product.

## Open questions

- Whether the product closure (Unit $\times$ Unit = Unit) should be elevated to a formal axiom in the system.
- Whether ContextEntry is a unit (defined by content) or an entity (has local identity via heading).
