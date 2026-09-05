---
title: Transferring
description: The morphism applying the forward-facing transfer nucleus Δ_t to a settled fiber-algebra element — the smallest element already witnessed in every independent one-step extension. The future-facing closure of an aperiodic settling's non-stabilizing orbit; generates the transferring-nuclear-dyad-category.
date-created: 2026-06-20
date-modified: 2026-06-20
keywords: ["transferring", "nucleus", "closure-operator", "fiber-algebra", "aperiodic-settling", "extension", "locality", "nuclear-dyad", "kz-diamond"]
---


## What this node is

Transferring is one of the two commuting nuclei of an
[aperiodic settling](../aperiodic-settling.md). It applies the **transfer
nucleus** $\Delta_t$ to an element $a$ of the settled fiber Heyting algebra
$H_t$ over a history $t$, returning the smallest element of $H_t$ already
witnessed in every independent one-step extension of $t$.

Like [saturating](../saturating/saturating.md), it is statable only here, on a
**settled** fiber Heyting algebra — the output of [settling](../../../settling.md)
packaged as a [sheaf](../../sheaf/sheaf.md) — not at the articulating
birth-corner that shares its gerund. Where saturating reads each fiber backward
against sub-histories, transferring reads it **forward**, toward the committed
future.

## Definition of $\Delta_t$

For each step $s$ independent of $t$ (written $s \perp t$), let
$i_{s,t} : t \to s \star t$ be the one-step extension in the history category.
The **transfer-stable layer** is the intersection of restriction images from
those independent extensions,

$$
\mathrm{Fix}(\Delta_t) \;:=\; \bigcap_{s \perp t} \mathrm{image}\bigl(H(i_{s,t}) : H_{s\star t} \to H_t\bigr),
$$

and $\Delta_t(a) := \bigwedge\{\, b \in \mathrm{Fix}(\Delta_t) \mid b \geq a \,\}$
is the smallest transfer-stable element above $a$. When no $s \perp t$ exists the
intersection is empty, $\mathrm{Fix}(\Delta_t) = H_t$, and $\Delta_t = \mathrm{id}$.

Each $\mathrm{image}(H(i_{s,t}))$ is a sub-Heyting-algebra (image of a Heyting
homomorphism); an intersection of these is again one, so $\mathrm{Fix}(\Delta_t)$
is a sub-Heyting-algebra and the reflection onto it is a **nucleus** (Johnstone,
*Stone Spaces* II.2.2). The sheaf condition on $H$ over the commutation topology
is what makes the intersection from independent extensions cohere — which is why
this morphism needs the settled sheaf, not merely a lattice.

## What it generates

The [transferring-nuclear-dyad-category](content/transferring-nuclear-dyad-category/transferring-nuclear-dyad-category.md):
Heyting algebras equipped with a single nucleus $\Delta$. The two poles are the
free carrier $A$ and the **extension-witnessed layer** $\mathrm{Fix}(\Delta)$,
joined by the adjoint reflection $\Delta \dashv \iota$. The gap
$a < \Delta_t(a)$ is the propositional **possibility** still open at $t$ — what
must be committed for $a$ to be extension-witnessed.

## Orientation

Transferring is the **forward-facing** (future) closure. Paired with
[saturating](../saturating/saturating.md) and made coherent by
[commutating](../commutating/commutating.md), it is the second axis of the
nuclear quartet — the KZ diamond whose non-stabilizing orbit carries the
[aperiodic classifying invariant](../content/aperiodic-classifying-invariant/aperiodic-classifying-invariant.md).
It closes along the **history filtration**, not the bilattice value-orders of the
[bigraded diamond](../../bigraded-diamond/content/nuclear-quartet/nuclear-quartet.md).
