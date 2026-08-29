---
title: Commutating
description: The morphism asserting σ ∘ Δ = Δ ∘ σ between the saturating and transferring nuclei on a settled fiber-algebra. The aperiodic-regime coherence 2-cell (the KZ-diamond hinge); its output is the commutative nuclear square, and it generates the aperiodic-nuclear-quartet-category.
date-created: 2026-06-20
date-modified: 2026-06-20
keywords: ["commutating", "coherence", "nucleus", "nuclear-quartet", "kz-diamond", "aperiodic-settling", "frobenius", "fixed-point"]
---

# Commutating

## What this node is

Commutating is the coherence morphism of an
[aperiodic settling](../aperiodic-settling.md): it asserts that the past-facing
nucleus [saturating](../saturating/saturating.md) $\sigma$ and the future-facing
nucleus [transferring](../transferring/transferring.md) $\Delta$, acting on the
same settled fiber Heyting algebra $A = H_t$, **commute**:

$$
\sigma \circ \Delta \;=\; \Delta \circ \sigma.
$$

It is the aperiodic-regime instance of the descent's recurring coherence 2-cell —
the KZ-diamond hinge at this depth (the analogue, on settled fiber-algebras, of
`twistoring` at the articulating birth-corner).

## Why commutativity is the hinge

Given two arbitrary nuclei on $A$, the composite $\pi = \sigma \circ \Delta$ need
not be a nucleus — it may fail idempotence, and $\mathrm{Fix}(\sigma) \cap
\mathrm{Fix}(\Delta)$ exists only as a set. Commutativity promotes it: with
$\sigma\Delta = \Delta\sigma$, the composite $\pi$ is again a nucleus and

$$
A^* \;:=\; \mathrm{Fix}(\pi) \;=\; \mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta)
$$

is its fixed-point sub-algebra — the **doubly-quiescent layer**, where the past
has nothing further to add and the future has already sent everything back. The
commuting square

$$
A \xrightarrow{\sigma} \mathrm{Fix}(\sigma),\quad
A \xrightarrow{\Delta} \mathrm{Fix}(\Delta),\quad \text{both} \to A^*
$$

has two agreeing paths from $A$ to $A^*$ exactly because the nuclei commute.

## What it generates

The [aperiodic-nuclear-quartet-category](content/aperiodic-nuclear-quartet-category/aperiodic-nuclear-quartet-category.md),
whose objects are commutative nuclear squares $(A, \sigma, \Delta)$ carrying the
four-corner structure $(A,\ \mathrm{Fix}(\sigma),\ \mathrm{Fix}(\Delta),\ A^*)$.
Graded along the non-stabilizing aperiodic orbit ($\kappa \geq \omega_1$), these
quartets are the KZ diamonds whose 2-cell information the orbit accumulates.

## Orientation

Commutating sits above [saturating](../saturating/saturating.md) and
[transferring](../transferring/transferring.md) — it presupposes both nuclei —
and below the cohomological machinery that measures the orbit it generates: the
[anderson-putnam-direct-limit](../content/anderson-putnam-direct-limit/anderson-putnam-direct-limit.md)
assembles finite-stage cohomology of these quartets, and the
[aperiodic classifying invariant](../content/aperiodic-classifying-invariant/aperiodic-classifying-invariant.md)
is the $H^1$ class it converges to. The quartet here is the **history-filtration**
quartet, distinct from the bilattice-order quartet of the
[bigraded diamond](../../bigraded-diamond/content/nuclear-quartet/nuclear-quartet.md).
