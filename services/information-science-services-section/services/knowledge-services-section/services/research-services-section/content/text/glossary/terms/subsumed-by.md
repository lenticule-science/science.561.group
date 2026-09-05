---
inversion: subsumes
---

# subsumed-by

`subsumed-by` carries the parent-pointer for a sub-objective: a smaller objective declares which larger objective encompasses it. Inversion populates `subsumes` at the parent objective so a query at any objective returns its sub-objectives without anyone authoring the parent-side child list. The parent objective is achieved when every objective in its `subsumes` fiber is achieved.
