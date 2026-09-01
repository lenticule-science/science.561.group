---
name: releasing-a-claim
description: Removes the claimed-by cell from a work-item. The inverse of claiming.
specializing: denying-positing-morphism
---

A **releasing-a-claim** call is the denying positing that removes the (target, claimed-by, *) cell, freeing the work-item for another actor to claim.
Does not transition the lifecycle state — releasing a claim on an in-progress work-item leaves it in-progress (someone else can pick it up).
