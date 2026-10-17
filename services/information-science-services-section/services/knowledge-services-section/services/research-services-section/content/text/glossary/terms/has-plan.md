---
specialization: plans
---

# has-plan

`has-plan` is the inversion-derived back-walk of the `project` predicate: every `(P, project, Pr)` claim at a plan subject derives `(Pr, has-plan, <witness>)` at the project subject. Specialization cascades the derived claims into the parallel `plans` fiber at the project subject, so consumers who walk `(project-X, plans, ?)` read the witnessing configuration under a naturally-named predicate. Witness presence is the signal; the bilattice value encodes the algebraic transport.
