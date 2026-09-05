---
title: Members
date-created: "2026-03-06T00:00:00"
type: "[structure](structure)"
structure-type: "[sequence](sequence)"
date-introduced: "[2025-04-30](2025-04-30)"
derived-in: "[Deriving Reflexive Relational Sequencing](Deriving Reflexive Relational Sequencing)"
---


- [summary](summary):: **Reflexive relational depth** is the structure formed by applying [reflex](reflex) repeatedly to a [relational structure](relational structure), producing a layered sequence of self-relations.

This structure arises from the act of a structure [relating|relating](relating|relating) to itself, once, then again, and again — each time generating a deeper layer of internal inclusion.

## Members

R(0): domain of relating  
R(1): reflex(R(0))  
R(2): reflex(R(1))  
...  
R(n): reflex(R(n–1))

## Properties

- Ordered by depth: each R(n) contains all previous layers.
- Induced, not assumed: arises from repeated application of [reflex](reflex).
- Enables structural position: depth becomes a relational coordinate.

## Expression

reflexive relational depth := { R(0), R(1), R(2), … }  
where R(n+1) := reflex(R(n))
