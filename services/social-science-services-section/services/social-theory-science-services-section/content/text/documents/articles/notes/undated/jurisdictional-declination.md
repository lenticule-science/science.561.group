---
type: morphism
status: sketch
depends-on: [jurisdiction, jural-relation, operations-settling]
realizes: [jurisdictional-declination]
see-also: [jurisdictional-invocation, jurisdictional-excess, jurisdiction-as-base-change]
title: Jurisdictional declination
description: The morphism by which an authority $A$ asserts non-jurisdiction over a history-fiber pair $(t, a)$ — settling the validity-condition cell toward $\mathbf{f}$, marking the pair as outside $A$'s operative scope.
---

# Jurisdictional declination

The morphism by which an authority $A$ asserts *non-jurisdiction* over a history-fiber pair $(t, a)$ — settling the validity-condition cell toward $\mathbf{f}$, marking the pair as outside $A$'s operative scope.

## Definition

Given a [jurisdiction](../../research/2026/07/31/lenticule-import/library/social-sciences/working/objects/jurisdiction.md) $\mathcal{J} = (A, T_J, H_J, V)$ and a history-fiber pair $(t, a)$, **jurisdictional declination** is the increment

$$\mathrm{decl}_{\mathcal{J}}(t, a) \;=\; \langle (t, a), \texttt{within-jurisdiction-of}, A\rangle \;\mapsto\; \mathbf{f}$$

settling the validity-condition cell to $\mathbf{f}$, asserting that $A$'s nucleus is not operative on acts at $(t, a)$.

## When declination arises

Declination occurs in two main patterns:

1. **Structural non-jurisdiction:** $(t, a) \notin T_J \times H_J$ — the pair is outside the jurisdiction's scope by definition. The authority's nucleus is structurally not applicable; the declination cell settling to $\mathbf{f}$ records this explicitly.

2. **Discretionary declination:** $(t, a) \in T_J \times H_J$ (structurally within scope) but the authority declines to exercise jurisdiction — for procedural reasons (the case should be transferred), for standing reasons (the matter should be handled by a subordinate), or for capacity reasons. Discretionary declination is a governance decision within the authority's power: the authority has the privilege of exercising or not exercising jurisdiction within its scope.

## Distinction from ultra vires

A [jurisdictional-excess](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/jurisdictional-excess.md) morphism is an act taken *without* jurisdiction — it does not settle the validity-condition cell; it simply acts, and the jurisdiction check fails ex post. A declination is a proactive assertion of non-jurisdiction before or instead of action. The distinction matters: a declination cell at $\mathbf{f}$ prevents downstream closure-rule firings that would trigger jurisdiction-conditional normative effects; an ultra-vires act simply fails to propagate through the nucleus without the explicit $\mathbf{f}$ assertion.

## Paraconsistency: declination + prior invocation

If a validity-condition cell has previously been settled at $\mathbf{t}$ (by invocation) and a declination increment arrives asserting $\mathbf{f}$, the resulting bilattice value is $\top$ (both true and false — contested jurisdiction). This is the formal model of *jurisdictional dispute*: two authoritative assertions conflict about whether $(t, a)$ falls within $\mathcal{J}$. The $\top$ state is handled by the adjudication machinery; in governance terms, it is a conflict-of-laws condition requiring resolution.
