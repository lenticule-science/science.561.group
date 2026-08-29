---

name: milestone
  - "Milestone"
  - "milestone"
date-created: 2026-03-07T00:00:00
introduces: term
keywords:
  - project-management
  - semiotics
  - closure-pressure
description: "A named state where a set of closure conditions are simultaneously met, representing a meaningful intermediate closure."
defined-in:
  - ../index.md
requires:
  - ./closure-condition.md
---

A **milestone** is a named state where a set of
[closure conditions](./closure-condition.md) are simultaneously met.
It represents a meaningful intermediate closure — a state where
enough gaps have been resolved that a new capability exists.

Milestones are declared as `milestone:` values in plan frontmatter.
Plans that share a milestone value form a coherent group whose
collective completion constitutes the named state.

Milestones are not deadlines. They are descriptions of closure
states, ordered by dependency, not by calendar.
