---

title: "Computing on the Bilattice by Hand"
description: "A tutorial: take a small set of assertions with epistemic states, compute extends (⊙) and restricts (⇒) step by step, and see what the adjunction does."
date-created: 2026-03-31
requires:
  - epistemic-state
teaches:
  - bilattice
  - residuated-lattice
  - twist-product
---

This tutorial walks through computing with the four-valued [bilattice](../terms/bilattice.md) by hand. You will apply the extending operation ($\odot$) and the restricting operation ($\Rightarrow$) to concrete [epistemic states](../../../../information/terms/epistemic-state.md) and verify the [adjunction](../../categories/domains/ordinary-categories/terms/adjoint-pair.md) on specific examples.

## The four values

Each value is a pair of binary components — positive evidence and negative evidence:

| Value | Pair | Meaning |
|-------|------|---------|
| $\bot$ | (0, 0) | No information from any source |
| $t$ | (1, 0) | Affirmed: positive evidence, no negative |
| $f$ | (0, 1) | Denied: negative evidence, no positive |
| $\top$ | (1, 1) | Contested: both positive and negative evidence |

## The operations

The base lattice is $\{0, 1\}$ with multiplication $x \cdot y = \min(x, y)$ and implication $x \to y = 0$ if $x > y$, else $1$.

**Extending** ($\odot$): $(x, y) \odot (z, v) = (x \cdot z,\ (x \to v) \wedge (z \to y))$

**Restricting** ($\Rightarrow$): $(x, y) \Rightarrow (z, v) = ((x \to z) \wedge (v \to y),\ x \cdot v)$

## Worked examples

### Example 1: Extending an affirmation by an affirmation

$t \odot t = (1, 0) \odot (1, 0)$

First component: $1 \cdot 1 = 1$
Second component: $(1 \to 0) \wedge (1 \to 0) = 0 \wedge 0 = 0$

Result: $(1, 0) = t$.

Affirming something that is already affirmed gives affirmation. Extending does not create contradiction from agreement.

### Example 2: Extending an affirmation by a denial

$t \odot f = (1, 0) \odot (0, 1)$

First component: $1 \cdot 0 = 0$
Second component: $(1 \to 1) \wedge (0 \to 0) = 1 \wedge 1 = 1$

Result: $(0, 1) = f$.

Extending an affirmation by a denial yields denial. The denial wins — it absorbs the affirmation.

### Example 3: What about ⊥ ⊙ ⊥?

$\bot \odot \bot = (0, 0) \odot (0, 0)$

First component: $0 \cdot 0 = 0$
Second component: $(0 \to 0) \wedge (0 \to 0) = 1 \wedge 1 = 1$

Result: $(0, 1) = f$.

Extending nothing by nothing gives denial. This is the most surprising result in the table: the product of two unknowns is not unknown but denied. Two absences of evidence combine into a negative result.

### Example 4: Restricting an affirmation by itself

$t \Rightarrow t = (1, 0) \Rightarrow (1, 0)$

First component: $(1 \to 1) \wedge (0 \to 0) = 1 \wedge 1 = 1$
Second component: $1 \cdot 0 = 0$

Result: $(1, 0) = t$.

Restricting something by itself affirms it. Self-restriction is self-confirmation.

### Example 5: Does the adjunction hold?

Check the triple $a = t$, $p = \bot$, $q = t$:

**Left side**: $t \odot \bot = \bot$ (computed from the table). Is $\bot \leq_t t$? The truth ordering has $\bot \leq_t t$. Yes. Left side: TRUE.

**Right side**: $t \Rightarrow t = t$ (computed above). Is $\bot \leq_t t$? Yes. Right side: TRUE.

Both true. The adjunction holds for this triple.

Check $a = f$, $p = t$, $q = \bot$:

**Left side**: $f \odot t = f$. Is $f \leq_t \bot$? The truth ordering has $f \leq_t \bot$. Yes. Left side: TRUE.

**Right side**: $f \Rightarrow \bot = t$. Is $t \leq_t t$? Yes. Right side: TRUE.

Both true. Holds again.

## The full tables

For reference, the complete operation tables (verify any entry using the formulas above):

```
⊙  |  ⊥   t   f   ⊤        ⇒  |  ⊥   t   f   ⊤
---|----------------        ---|-------------
---
⊥  |  f   ⊥   f   ⊥        ⊥  |  t   t   ⊥   ⊥
t  |  ⊥   t   f   t        t  |  ⊥   t   f   f
f  |  f   f   f   f        f  |  t   t   t   t
⊤  |  ⊥   t   f   ⊤        ⊤  |  ⊥   t   f   ⊤
```

Patterns to notice:
- The $\top$ row and column of $\odot$ reproduce the other argument: $\top \odot a = a$. Extending by the maximally-informed state does nothing.
- The $f$ row of $\odot$ is all $f$: extending by denial always yields denial.
- The $f$ row of $\Rightarrow$ is all $t$: denial restricts everything to affirmation. (If the premise is denied, the implication is vacuously true.)
- The diagonal of $\Rightarrow$ is $t$ except for $\top \Rightarrow \top = \top$: self-restriction affirms, unless you are already contested.
