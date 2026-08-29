---
specialization: sub-objectives
---

# subsumes

`subsumes` is the inversion-derived back-walk of the `subsumed-by` predicate: every `(O1, subsumed-by, O2)` claim at a sub-objective derives `(O2, subsumes, <witness>)` at the parent objective. Specialization cascades the derived claims into the parallel `sub-objectives` fiber at the parent, so consumers who walk `(objective-X, sub-objectives, ?)` read the witnessing configuration. Witness presence is the signal; the parent is achieved when every sub-objective is achieved.
