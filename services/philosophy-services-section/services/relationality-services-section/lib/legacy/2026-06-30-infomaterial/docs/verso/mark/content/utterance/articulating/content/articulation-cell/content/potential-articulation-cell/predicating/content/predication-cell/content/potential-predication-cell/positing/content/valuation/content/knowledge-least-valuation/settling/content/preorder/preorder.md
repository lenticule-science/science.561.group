---
title: Preorder
description: A set carrying a relation ≤ that is reflexive and transitive but not yet antisymmetric — the weakest comparison, allowing ties. The accessibility relation of settling's modal closure (an S4 Kripke frame: reflexive = T, transitive = 4). Generates order by the addition of antisymmetry, which settling's leastness supplies.
date-created: 2026-06-21
date-modified: 2026-06-21
keywords: ["preorder", "quasi-order", "accessibility-relation", "kripke-frame", "s4", "reflexive", "transitive", "settling", "modal-closure", "order"]
---

# Preorder

## What this node is

A **preorder** is a set carrying a relation $\le$ that is

- **reflexive** — everything $\le$ itself;
- **transitive** — $\le$ chains;

and *nothing more*. It is the weakest structure that still supports "is at least as
much as." A preorder is **not** required to be antisymmetric: two distinct elements
may satisfy both $a \le b$ and $b \le a$ — they are **tied** rather than equal.

This is the thinnest comparison there is, and so it is where the chain of order
begins. Add one law — antisymmetry, that mutual comparison forces identity — and the
preorder becomes an [order](content/order/order.md). The preorder is the generator;
order is what that one restriction produces. Equivalently, every preorder collapses
to an order by **quotient**: define $a \sim b$ when $a \le b$ and $b \le a$; this is
an equivalence relation, and the preorder descends to a genuine order on the
tie-classes. Every preorder is "an order up to ties," and order is a preorder with
the ties removed.

## Why settling generates it

Settling iterates the modal closure $\Diamond\Box$ ($\textit{possibilize}\circ
\textit{necessitate}$) until the valuation stops changing. A closure operator is
**extensive** and **idempotent**, and the modal operator it carries is exactly an
**S4** necessity: its **T axiom** (what is necessary is true) is *reflexivity* of the
underlying accessibility relation, and its **4 axiom** (what is necessary is
necessarily so) is *transitivity*. The Kripke frame of an S4 modality is precisely a
preorder. So the first relational fact settling lays down is this reflexive-transitive
**accessibility relation** — the frame over which $\Diamond$ and $\Box$ quantify. Where
the [closure 2-monad](../closure-2-monad/closure-2-monad.md) packages this closure
algebraically, the preorder is its frame.

Antisymmetry — the law that turns a preorder into an order — is supplied by settling's
own defining feature: the fixed point it reaches is the **least** one. A least upper
bound is unique, so on the settled values mutual comparison *does* collapse to
equality; the ties are quotiented away. This is why settling generates the preorder
*first* and the [order](content/order/order.md) *from* it: the accessibility frame is
what the closure is before leastness acts, and order is what it becomes after. The two
are not side by side — order sits under preorder, one law deeper.

## What it generates

A preorder is exactly a **thin category**: elements are objects, and there is one
arrow $a \to b$ whenever $a \le b$; reflexivity gives identities, transitivity gives
composition. A preorder allows arrows both ways between distinct objects — its ties.
Make the category *skeletal* — at most one arrow each way — and it is an
[order](content/order/order.md), and through order the
[lattice](content/order/content/lattice/lattice.md) and all its refinements. The
single step from preorder to order is the addition of antisymmetry; everything in the
order subtree is generated past that step.

## Orientation

The morphism that generates this object is [settling](../../settling.md), which lays
it down as the accessibility frame of its modal closure, alongside the
[closure 2-monad](../closure-2-monad/closure-2-monad.md) (the algebra of the same
closure). Descend through `content/` to [order](content/order/order.md), the
antisymmetric refinement settling's leastness produces. The fuller modal development —
the modal operator and its possible-world semantics — is generated downstream under
positing's logic; here is where the bare reflexive-transitive relation first exists.
