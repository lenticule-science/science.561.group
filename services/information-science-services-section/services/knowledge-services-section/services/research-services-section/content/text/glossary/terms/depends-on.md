---
inversion: depended-on-by
---

# depends-on

`depends-on` carries dependency claims on tasks, plans, milestones. Inversion populates the reverse fiber: querying `(X, depended-on-by, ?)` answers "what depends on X?" without anyone authoring the reverse direction by hand.
