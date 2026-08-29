---
title: "Discipline / Regime / Filter / Profile"
date-created: 2026-03-05T00:00:00
type: term
canonical-name: Discipline
movement: III–IV (dynamics through geometry)
draft-names:
  draft-3-treatise: "Discipline, Regime, Filter, Profile"
  draft-4: "Discipline, Regime, Filter, Profile (same hierarchy)"
stability: low — appears only in the treatise (draft 3) and draft 4; not present in PRE, Foundations, draft 11, or draft 12
---

A four-level hierarchy describing how structure constrains and organizes relational dynamics. This hierarchy appears only in the treatise (draft 3) and draft 4, where it provides the bridge between directed dynamics (Movement III) and geometric cohesion (Movement IV).

## What they are

### Discipline

A unary endomap on the relational field that commutes with all nuclei (closure operators) and with Flow. A Discipline is a way of filtering or constraining the relational field that respects all the structure already earned — it does not disrupt closure, does not interfere with directed motion, and does not break the modal operators.

Treatise (draft 3): Defines Discipline formally as an endomap d: Rel → Rel such that d commutes with every nucleus j and with the Flow comonad. This is a strong condition: Disciplines are the "well-behaved" constraints.

Draft 4: Same definition. Uses the RES (Relational Expressions Syntax) format: (Discipline d) requires (Commutes d j) for all nuclei j and (Commutes d Flow).

### Regime

The fixed-point set of a Discipline: Regime(d) = {a ∈ Rel | d(a) = a}. A Regime is what remains stable under a given Discipline — the recognitions that the Discipline leaves unchanged. Regimes inherit the full relational structure (Heyting algebra, modal operators, etc.) restricted to their fixed points.

### Filter

A Discipline applied to a RelationalGeometry (the structure earned in Movement IV). When the cohesive chain (Shape ⊣ Discrete ⊣ Codiscrete ⊣ Global) is in place, a Filter is a Discipline that additionally respects the geometric structure — it commutes not only with nuclei and Flow but also with the cohesive adjunctions.

### Profile

The fixed points of a Filter. A Profile carries the full recursive RelationalStructure — the complete Heyting algebra, modal operators, Flow, and cohesive geometry — restricted to the recognitions that survive the Filter. Profiles are the most constrained and most structured level: they are self-contained relational subsystems.

## Why they matter

The hierarchy describes how relational structure can be specialized without being destroyed. Each level adds a stronger constraint:

1. Discipline: commutes with nuclei and Flow (respects logic and dynamics)
2. Regime: fixed points of a Discipline (what survives the constraint)
3. Filter: a Discipline on a geometry (respects cohesion too)
4. Profile: fixed points of a Filter (a self-contained relational subsystem)

This provides a theory of observation and perspective: a Profile is a viewpoint from which the relational field is seen, carrying all the structure needed to do relational dynamics within the viewpoint.

## Relationship to other concepts

- Presupposes: the full logical core (Movement I), modal closure (Movement II), Flow (Movement III)
- Filter presupposes: the cohesive chain (Movement IV)
- Relates to: the treatise's RelationalLanguage — Profiles carry enough structure to support a typed lambda calculus (λ_R) within themselves
- Relates to: States and Observables (Movement V) — Profiles may be the formal mechanism by which "states" and "measurement" are defined

## Open question

The Discipline/Regime/Filter/Profile hierarchy does not appear in PRE, Foundations, draft 11, or draft 12. Is it:
- An elaboration of concepts present in those drafts under different names? (PRE's "Stratify" and "Constructible" may relate to Filter and Profile.)
- A concept developed in the treatise/draft 4 era that was later absorbed into the movement structure without being named?
- A genuinely new contribution of the treatise/draft 4 era that the later drafts have not yet incorporated?
