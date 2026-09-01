---
title: "The Chu Construction and Linear Logic"
description: "How the Chu construction connects formal contexts, bilattices, and linear logic — and why this means every bilattice-valued data system is a model of linear logic."
date-created: 2026-03-30
depends-on:
  - formal-context
  - bilattice
  - linear-logic
introduces:
  - chu-space
type: walkthrough
status: current
---
Three structures that look unrelated turn out to be the same thing.

A [formal context](../objects/formal-context.md) $(G, M, I)$ is a table of objects and attributes. A [bilattice](../../algebra/objects/bilattice.md) is an algebraic structure with two lattice orderings and two involutions. [Linear logic](teaching/explanations/linear-logic.md) is a logic where premises are resources consumed by use. These come from data analysis, algebraic logic, and proof theory respectively. They should have nothing to do with each other.

Pratt (1999) showed a formal context is a [Chu space](../objects/chu-space.md) — a triple $(A, r, X)$ of states, attributes, and an evaluation function. Chu spaces form a $*$-autonomous category, which is the categorical structure underlying linear logic. So formal contexts and linear logic share a categorical home.

Jakl (2025) closed the triangle: the Chu construction $\mathrm{Chu}(H, 0)$ over a [Heyting algebra](../objects/heyting-algebra.md) $H$ is exactly the [twist construction](../../algebra/objects/twist-product.md) that produces bilattices. Under this identification:

- **Tensor** ($\otimes$) in linear logic = **fusion** ($\odot$) on the twist product = **extending**
- **Linear implication** ($\multimap$) = **twist-product implication** ($\Rightarrow$) = **restricting**
- The adjunction $\otimes \dashv \multimap$ of linear logic IS the Busaniche-Cignoli residuation

This means:

A bilattice-valued formal context — a data table where each cell carries an [epistemic state](../../../../information/terms/epistemic-state.md) from $\{\bot, t, f, \top\}$ — is simultaneously:

1. A formal context in the FCA sense (with a [concept lattice](../../order/objects/concept-lattice.md) and Galois connection)
2. A Chu space (with the $*$-autonomous category structure)
3. A model of linear logic (where extending is tensor and restricting is linear implication)
4. A [residuated lattice](../../algebra/objects/residuated-lattice.md) (with [Lambek calculus](teaching/explanations/lambek-calculus.md) structure, by Wurm 2012)

The "resources" tracked by linear logic in this setting are epistemic states. Extending by an affirmation ($t$) and a denial ($f$) produces a contest ($\top$): $t \odot f = \top$. The resource has been consumed — the two assertions combined into a contradiction. This is linear logic's resource sensitivity applied to knowledge: using conflicting evidence produces contestation, and the evidence is consumed in the process.

Every system of key-value records valued in the bilattice — every YAML repository, every annotated database — is a model of linear logic. The algebra is already there.
