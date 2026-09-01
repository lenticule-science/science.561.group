---
title: Nuclear Quartet
description: The four canonical sub-algebras determined by two commuting nuclei on a Heyting algebra — free carrier, the two individual fixed-point algebras, and the joint fixed point — an exhaustive commuting square of inclusions. The single diamond at each grade of the bigraded diamond tower.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["nuclear-quartet", "nucleus", "nuclear-dyad", "heyting-algebra", "commutativity", "fixed-point", "commuting-square", "bigraded-diamond"]
---

## What this node is

The **nuclear quartet** is the single diamond at each grade of the
[bigraded diamond](../../bigraded-diamond.md): the four canonical sub-algebras
determined by two commuting [nuclei](#) $j_1, j_2$ on a Heyting algebra $A$. When
$j_1 \circ j_2 = j_2 \circ j_1$, the composite $\pi := j_1 \circ j_2$ is itself a
nucleus, and the four sub-algebras are

$$\bigl(\,A,\;\; \mathrm{Fix}(j_1),\;\; \mathrm{Fix}(j_2),\;\; A^*\,\bigr),\qquad A^* = \mathrm{Fix}(\pi) = \mathrm{Fix}(j_1)\cap\mathrm{Fix}(j_2).$$

## The four corners

| Sub-algebra | Status | Description |
|---|---|---|
| $A$ | free carrier | neither nucleus has acted |
| $\mathrm{Fix}(j_1)$ | $j_1$-active | all $j_1$-closure applied; $j_2$ may still have work |
| $\mathrm{Fix}(j_2)$ | $j_2$-active | all $j_2$-closure applied; $j_1$ may still have work |
| $A^*$ | doubly stable | both nuclei act as identity — nothing left to close |

The four exhaust the canonical options — apply neither, $j_1$ alone, $j_2$ alone,
or both — so the quartet is exhaustive, the same four-corner shape the spine meets
at the articulation phases and the bilattice charge, here as *sub-algebras under
closure*.

## Why commutativity is the hinge

Without commutativity, $\pi = j_1\circ j_2$ need not be a nucleus — it may fail
idempotence or meet-preservation, and $\mathrm{Fix}(j_1)\cap\mathrm{Fix}(j_2)$
exists only as a set, lacking the reflection that makes it a canonical
sub-algebra. Commutativity promotes the intersection to the fixed-point set of a
nucleus — the content of the Nuclear Quartet Theorem. The commuting square

$$A \xrightarrow{j_1} \mathrm{Fix}(j_1),\quad A \xrightarrow{j_2} \mathrm{Fix}(j_2),\quad \text{both} \to A^*$$

has two paths from $A$ to $A^*$ that agree exactly because $j_1\circ j_2 = j_2\circ j_1$.

## Orientation

Read [bigraded-diamond](../../bigraded-diamond.md) for how grading this diamond by
the two orders builds the tower. The two nuclei are the knowledge- and
truth-order closures the [settling](../../../../settling.md) morphism iterates.
