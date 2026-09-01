---
title: Saturating
description: The morphism applying the backward-facing saturation nucleus σ_t to a settled fiber-algebra element — the largest element of the fiber whose restriction profile across all sub-histories matches a. The past-facing closure of an aperiodic settling's non-stabilizing orbit; generates the saturating-nuclear-dyad-category.
date-created: 2026-06-20
date-modified: 2026-06-20
keywords: ["saturating", "nucleus", "closure-operator", "fiber-algebra", "aperiodic-settling", "sub-history", "restriction", "nuclear-dyad", "kz-diamond"]
---


## What this node is

Saturating is one of the two commuting nuclei of an
[aperiodic settling](../aperiodic-settling.md). It applies the **saturation
nucleus** $\sigma_t$ to an element $a$ of the settled fiber Heyting algebra
$H_t$ over a history $t$, returning the largest element of $H_t$ whose
restriction profile — how it looks from every proper sub-history — agrees with
that of $a$.

This morphism is statable only here, not at the articulating birth-corner that
shares its gerund: $\sigma_t$ acts on a **settled** fiber Heyting algebra, which
exists only after [settling](../../../settling.md) has packaged the trace as a
[sheaf](../../sheaf/sheaf.md). Because aperiodic settling is the regime whose
orbit does not stabilize (closure ordinal $\kappa \geq \omega_1$), its fibers are
genuinely history-graded, and saturating is the closure that reads each fiber
**backward**, against the accumulated past.

## Definition of $\sigma_t$

For each proper sub-history $t_0 < t$ let $\rho_{t_0} : H_t \to H_{t_0}$ be the
restriction homomorphism of the settling-associated sheaf. The saturation
nucleus at $t$ is

$$
\sigma_t(a) \;:=\; \bigvee\bigl\{\, b \in H_t \;\big|\; \rho_{t_0}(b) \leq \rho_{t_0}(a)\ \text{for all}\ t_0 < t \,\bigr\}.
$$

$\sigma_t(a)$ is the largest element of $H_t$ whose restriction profile is
componentwise $\leq$ that of $a$. Since $a$ is in the defining set,
$\sigma_t(a) \geq a$. For the empty history $t = \epsilon$ no proper sub-history
exists, the condition is vacuous, and $\sigma_\epsilon(a) = \top_\epsilon$.

It is a **nucleus**: *extensive* ($a \leq \sigma_t(a)$ above); *idempotent*
(finite joins are preserved by the Heyting restriction maps, so
$\rho_{t_0}(\sigma_t(a)) = \rho_{t_0}(a)$ — profile preservation — whence
$\sigma_t\sigma_t = \sigma_t$); *meet-preserving*
($\sigma_t(a) \wedge \sigma_t(b) = \sigma_t(a \wedge b)$, checked profile-wise).

## What it generates

The [saturating-nuclear-dyad-category](content/saturating-nuclear-dyad-category/saturating-nuclear-dyad-category.md):
Heyting algebras equipped with a single nucleus $\sigma$. Each object has two
poles — the free carrier $A$ and the **sub-history-determined layer**
$\mathrm{Fix}(\sigma)$ (elements uniquely fixed by how they look from every
shorter history) — joined by the adjoint reflection $\sigma \dashv \iota$.

## Orientation

Saturating is the **backward-facing** (past) closure. Paired with
[transferring](../transferring/transferring.md) (forward-facing, toward
extensions) and made coherent by [commutating](../commutating/commutating.md),
it is one axis of the nuclear quartet — the KZ diamond whose non-stabilizing
orbit carries the
[aperiodic classifying invariant](../content/aperiodic-classifying-invariant/aperiodic-classifying-invariant.md).
These nuclei close along the **history filtration**; do not conflate them with
the knowledge/truth nuclei of the
[bigraded diamond](../../bigraded-diamond/content/nuclear-quartet/nuclear-quartet.md),
which close along the bilattice value-orders at the finite regime.
