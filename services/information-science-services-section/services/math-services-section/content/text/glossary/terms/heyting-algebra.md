---

introduces: algebraic-structure
description: "A bounded distributive lattice with an implication operation satisfying the residuation law: c ≤ (a → b) iff c ∧ a ≤ b. The algebraic semantics of intuitionistic logic."
aliases: [Heyting algebra, Heyting algebras]
specialization: [bounded-lattice, distributive-lattice, residuated-lattice]
operations: [meet, join, heyting-implication]
laws: [residuation, distributivity]
product-is: meet
residual-is: heyting-implication
algebraic-semantics-of: intuitionistic-logic
excluded-middle: "does not hold in general"
double-negation: "does not hold in general"
examples: [open-sets-of-topological-space]
chu-construction-yields: bilattice
chu-connection: jakl-2025
date-created: 2026-03-30

---

A Heyting algebra is a bounded [distributive lattice](./distributive-lattice.md) $(H, \wedge, \vee, 0, 1)$ with an additional operation — the Heyting implication $\to$ — satisfying:

$$c \leq (a \to b) \quad\text{if and only if}\quad c \wedge a \leq b$$

Implication is right adjoint to meet. This residuation law makes a Heyting algebra an integral commutative [residuated lattice](./residuated-lattice.md) where the product is meet.

Heyting algebras are the algebraic semantics of intuitionistic logic, where excluded middle ($a \vee \neg a = 1$) does not hold in general. A Boolean algebra is a Heyting algebra where every element has a complement ($\neg\neg a = a$). The open sets of a topological space form a complete Heyting algebra.

Jakl (2025) proved the [Chu construction](./chu-space.md) $\mathrm{Chu}(H, 0)$ over a Heyting algebra $H$ is the [twist construction](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) producing a [bilattice](./bilattice.md). This connects Heyting algebras to bilattice theory and [linear logic](./linear-logic.md).

---

## Additional formulation

```yaml
---

introduces: algebraic-structure
description: "A bounded distributive lattice with an implication operation satisfying the residuation law: c ≤ (a → b) iff c ∧ a ≤ b. The algebraic semantics of intuitionistic logic."
aliases: [Heyting algebra, Heyting algebras]
specialization: [bounded-lattice, distributive-lattice, residuated-lattice]
operations: [meet, join, heyting-implication]
laws: [residuation, distributivity]
product-is: meet
residual-is: heyting-implication
algebraic-semantics-of: intuitionistic-logic
excluded-middle: "does not hold in general"
double-negation: "does not hold in general"
examples: [open-sets-of-topological-space]
chu-construction-yields: bilattice
chu-connection: jakl-2025
date-created: 2026-03-30
---
```

A Heyting algebra is a bounded [distributive lattice](distributive-lattice.md) $(H, \wedge, \vee, 0, 1)$ with an additional operation — the Heyting implication $\to$ — satisfying:

$$c \leq (a \to b) \quad\text{if and only if}\quad c \wedge a \leq b$$

Implication is right adjoint to meet. This residuation law makes a Heyting algebra an integral commutative [residuated lattice](residuated-lattice.md) where the product is meet.

Heyting algebras are the algebraic semantics of intuitionistic logic, where excluded middle ($a \vee \neg a = 1$) does not hold in general. A Boolean algebra is a Heyting algebra where every element has a complement ($\neg\neg a = a$). The open sets of a topological space form a complete Heyting algebra.

Jakl (2025) proved the [Chu construction](./chu-space.md) $\mathrm{Chu}(H, 0)$ over a Heyting algebra $H$ is the [twist construction](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) producing a [bilattice](../../algebra/terms/bilattice.md). This connects Heyting algebras to bilattice theory and [linear logic](./linear-logic.md).
