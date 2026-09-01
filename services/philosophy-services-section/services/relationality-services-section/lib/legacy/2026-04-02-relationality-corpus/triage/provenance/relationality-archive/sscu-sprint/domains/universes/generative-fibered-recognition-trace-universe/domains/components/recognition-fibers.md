---

name: recognition-fibers
  - "Recognition Fibers"
  - "recognition fibers"
date-created: 2025-12-26
introduces: concept
tags: []
---

## Concrete example first

At each trace, imagine a small logic of recognition states:
$\bot < m < \top$.

- $\bot$: not recognized,
- $m$: partially recognized,
- $\top$: recognized.

If a [morphism](../../../categories/ordinary-categories/terms/morphism.md) $f:t\to t'$ forgets detail, a reindexing map $H(f):H_{t'}\to H_t$ transports recognitions backward along that forgetful move. If these maps preserve logical operations and compose functorially, you have a fibered recognition system.

## Formal definition

A **recognition fiber** at trace $t$ is a finite [Heyting algebra](../../../../teaching/explanations/heyting-algebra/index.md) $H_t$.
A **fibered recognition system** is a contravariant assignment
$$
H:T^{op}\to \mathbf{FinHeyt}
$$
that sends each trace to a finite [Heyting algebra](../../../../teaching/explanations/heyting-algebra/index.md) and each [morphism](../../../categories/ordinary-categories/terms/morphism.md) $f:t\to t'$ to a structure-preserving reindexing map $H(f):H_{t'}\to H_t$.

In GFRTU, these fibers carry local recognition logic before sheaf-level gluing.

## Why it matters in GFRTU

- It gives each trace an explicit internal logic.
- It makes recognition transport precise across refinements.
- It provides the domain for stabilizer and drift dynamics.
