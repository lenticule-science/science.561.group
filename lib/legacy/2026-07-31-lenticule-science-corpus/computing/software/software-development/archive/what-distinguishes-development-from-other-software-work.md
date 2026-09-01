---
type: question
status: open
---

# What distinguishes development from other software work?

Software engineering as a discipline includes activities that are *not* development — running services, observing them, decommissioning them, hiring the people who will write code, choosing programming languages and frameworks, organizing teams. The boundary between development and these other activities is fuzzy in everyday practice (does a deployment-config edit count? does writing a runbook count? does deleting an unused file count?), but the theory needs a sharp answer.

A working hypothesis: development is the activity-slice in which the *artifact* — the source — is the thing being changed. Operating, observing, and organizing are activities in which the artifact is the thing being *referenced* but not modified. Decommissioning is the boundary case where the artifact is being removed.

This hypothesis sharpens in the predicated form: development is the slice of [software-engineering](../../../_index.md) work whose increments land on the codebase-cell-system rather than on the running-instance-cell-system or the team-cell-system. Whether that line cuts cleanly remains to be seen — config-as-code, infrastructure-as-code, and prompt-as-code all complicate it.

## Why this matters

If the line is fuzzy, then the boundary between [software-refactoring](theories/software-refactoring/_index.md) (a development sub-activity) and runtime tuning (an operations activity) is also fuzzy, and the structure-preservation guarantee that refactoring promises will not survive crossing that boundary. The sharper we can make the boundary, the more useful refactoring's guarantees become.
