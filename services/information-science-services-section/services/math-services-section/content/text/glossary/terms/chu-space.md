---
name: "Chu Space"
description: "A state set, attribute set, and evaluation pairing that generalizes formal contexts and supplies a categorical model of linear logic."
aliases:
  - "Chu space"
  - "Chu spaces"
  - "Chu construction"
date-created: 2026-03-30
term-kind: concept
specialization: formal-context
category-of: star-autonomous-category
models: linear-logic
---

A Chu space over a value set $L$ is a triple $(A,r,X)$: $A$ is a set of states or objects, $X$ is a set of attributes or observations, and $r:A \times X \to L$ is an evaluation function. A binary formal context is the special case $L=\{0,1\}$; many-valued formal contexts are Chu spaces over their value set.

Chu spaces form a $*$-autonomous category, the categorical environment underlying linear logic.

**Two constructions are named here (choice for the owner).** The paragraph above defines a Chu space from two sets $A$ and $X$ and an evaluation into a value set $L$. The next sentence uses $\mathrm{Chu}(H,0)$ over a Heyting algebra $H$ with dualizing element $0$, which also identifies with the twist construction producing bilattices (Jakl, 2025). The entry does not say whether these are one construction or two, or how a bilattice-valued formal context (sets $A$ and $X$ with values in a bilattice) becomes a pair of lattice elements. The owner of this entry must state which construction "Chu space" means in the sentences that follow, and give the bridge between the two if both are meant. Under that identification, linear-logic tensor corresponds to twist-product fusion ($\odot$), and linear implication corresponds to the twist-product residual ($\Rightarrow$). Thus a bilattice-valued formal context can be read simultaneously as a formal context, Chu space, model of linear logic, and concept-lattice structure.
