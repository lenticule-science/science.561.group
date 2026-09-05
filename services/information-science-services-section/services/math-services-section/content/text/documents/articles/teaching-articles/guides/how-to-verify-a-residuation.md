---
title: "How to Verify a Residuation"
description: "A how-to guide: given two operations on a finite set, check whether they form a residuated pair by testing the adjunction law on every triple."
date-created: 2026-03-31
depends-on:
  - binary-operation
  - partial-order
introduces:
  - residuated-lattice
type: guide
article-kind: walkthrough
status: current
---
You have two operations, $\odot$ and $\Rightarrow$, on a finite ordered set. You want to know: do they form a [residuated pair](../../../../glossary/terms/residuated-lattice.md)? That is, does the adjunction law hold?

$$a \odot p \leq q \quad\text{if and only if}\quad p \leq (a \Rightarrow q)$$

Here is how to check.

## Step 1: Write out the operation tables

List every element of your set. Compute $a \odot b$ and $a \Rightarrow b$ for every pair. Arrange the results in two tables.

For the four-valued [bilattice](../../../../glossary/terms/bilattice.md) $\{\bot, t, f, \top\}$ with the Busaniche-Cignoli operations, the tables are:

```
⊙  |  ⊥   t   f   ⊤        ⇒  |  ⊥   t   f   ⊤
---|----------------        ---|-------------
---
⊥  |  f   ⊥   f   ⊥        ⊥  |  t   t   ⊥   ⊥
t  |  ⊥   t   f   t        t  |  ⊥   t   f   f
f  |  f   f   f   f        f  |  t   t   t   t
⊤  |  ⊥   t   f   ⊤        ⊤  |  ⊥   t   f   ⊤
```

## Step 2: Write out the ordering

You need to know which elements are $\leq$ which. For a residuation, you must use the correct ordering — the one the adjunction is claimed to hold on.

For the bilattice, the residuation holds on the **truth ordering** $\leq_t$ (the twist-product order), not the knowledge ordering:

- $f \leq_t \bot \leq_t t$
- $f \leq_t \top \leq_t t$
- $\bot$ and $\top$ are incomparable under $\leq_t$

Write out all pairs $(x, y)$ where $x \leq_t y$:

$(f, f)$, $(f, \bot)$, $(f, \top)$, $(f, t)$, $(\bot, \bot)$, $(\bot, t)$, $(\top, \top)$, $(\top, t)$, $(t, t)$.

## Step 3: Check every triple

For every triple $(a, p, q)$ of elements, compute both sides of the biconditional:

- **Left side**: Is $a \odot p \leq_t q$? Look up $a \odot p$ in the $\odot$ table, then check whether the result is $\leq_t q$.
- **Right side**: Is $p \leq_t (a \Rightarrow q)$? Look up $a \Rightarrow q$ in the $\Rightarrow$ table, then check whether $p \leq_t$ that result.

If the left side and right side agree (both true or both false) for every triple, the residuation holds.

## Example: checking one triple

Take $a = t$, $p = \bot$, $q = t$.

Left side: $t \odot \bot = \bot$ (from the table). Is $\bot \leq_t t$? Yes. Left side: TRUE.

Right side: $t \Rightarrow t = t$ (from the table). Is $\bot \leq_t t$? Yes. Right side: TRUE.

Both true. This triple checks out.

## Example: a triple where both sides are false

Take $a = t$, $p = t$, $q = \bot$.

Left side: $t \odot t = t$. Is $t \leq_t \bot$? No ($t$ is above $\bot$). Left side: FALSE.

Right side: $t \Rightarrow \bot = \bot$. Is $t \leq_t \bot$? No. Right side: FALSE.

Both false. Still checks out — the biconditional holds when both sides agree, regardless of which value they agree on.

## Step 4: Count violations

On a set with $n$ elements, there are $n^3$ triples to check. For the four-valued bilattice, that is $4^3 = 64$ triples.

If the violation count is 0, the residuation holds. If there are violations, the operations are not a residuated pair (at least not on this ordering — check whether a different ordering works).

The computation script at `operations/science/research/2026-03-30-predication-bilattices/dynamics.py` automates this for the four-valued bilattice: it checks all 64 triples on the full set and all 27 on the post-[closure](../../../../glossary/terms/closure.md) set $\{t, f, \top\}$. Both come back with 0 violations.

## Common mistakes

- **Wrong ordering.** The Busaniche-Cignoli residuation holds on the truth ordering, not the knowledge ordering. Checking against $\leq_k$ gives 21 violations. The ordering matters.
- **Forgetting incomparable pairs.** In a [partial order](../../../../glossary/terms/partial-order.md), some pairs are incomparable: neither $x \leq y$ nor $y \leq x$. When computing "is $x \leq y$?", incomparable means NO — the answer is false, not undefined.
- **Checking only one direction.** The adjunction is a biconditional (if AND only if). You must check that the left side implies the right AND the right implies the left. A one-direction check is not sufficient.
