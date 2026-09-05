---
title: "Induces"
kind: term
---
Residual implication. What must be added to one recognition for another to be recognized. *Not* "if $a$ then $b$" propositionally, but "what completes $a$ for $b$."

## What it is

`Induces(a, b)` is residual implication, with standard symbol $\Rightarrow$. The defining property:

$$\text{Includes}(\text{Together}(a, b), c) \iff \text{Includes}(a, \text{Induces}(b, c))$$

In set / lattice notation: $\text{Induces}(a, b) := \max\{x \mid a \land x \leq b\}$ — the largest recognition $x$ such that adding $x$ to $a$ keeps the result within $b$.

In this relational logic, truth is replaced by *sufficiency*. `Induces(a, b)` does not mean "if $a$ then $b$" propositionally; it means "what must be added to $a$ for $b$ to be recognized."

## Key properties

- **Galois connection**: $\text{Together}(a, -) \dashv \text{Induces}(a, -)$.
- Antitone in the first argument, monotone in the second.
- **Modus ponens**: $\text{Includes}(\text{Together}(a, \text{Induces}(a, b)), b)$.
- [Negate](negate.md) is the special case: $\text{Negate}(a) = \text{Induces}(a, \bot)$.
- **Self-sufficiency**: $\text{Includes}(a, \text{Induces}(a, a))$.

## What it produces

The full Heyting algebra structure: $(\text{Rel}, \text{Together}, \text{Either}, \text{Induces}, \text{Negate}, \top, \bot)$. The complete logical system of the relational field, earned from [Differentiate](differentiate.md) alone.
