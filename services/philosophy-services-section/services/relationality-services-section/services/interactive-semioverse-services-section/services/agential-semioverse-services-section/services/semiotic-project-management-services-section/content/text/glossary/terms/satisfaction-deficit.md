---
name: "Satisfaction Deficit"
aliases:
  - "Satisfaction Deficit"
  - "satisfaction deficit"
date-created: 2026-03-07T00:00:00
authors:
  - claude
keywords:
  - ProjectManagement
  - Semiotics
  - PredicateGraph
description: "The total number of unsatisfied axioms across all pages — a monotone-decreasing measure of distance to closure."
defined-in:
  - ../index.md
requires:
  - ../../../agential-semioverse-repository/predicate-graph.md
---

The **satisfaction deficit** is the total number of unsatisfied
axioms across all pages in the
[predicate graph](../../../agential-semioverse-repository/predicate-graph.md).
It is a monotone-decreasing measure under closure — each axiom
violation resolved brings the system closer to its fixed point.

Satisfaction deficit replaces "percent complete" as a progress
measure. The distinction matters: a team can be 90% complete on
tasks and 0% closer to closure if the tasks do not address the
actual gaps. Satisfaction deficit measures distance to closure, not
activity.

The predicate graph satisfaction report computes the deficit. As of
March 2026, the emsemioverse's deficit includes 40 MUST errors and
417 SHOULD warnings across 2,991 pages.
