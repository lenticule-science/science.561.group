---
extends: state
name: Open
description: "A unit of work that is available to begin — its preconditions are met but no agent has started acting on it."
instance-of: state
state-of: [task, plan]
precedes: in-progress
next-via: [begin, assign, start]
follows: null
can-become: [in-progress, blocked, abandoned]
contributes-to-whole: not-yet-complete
date-created: 2026-04-06
---

Open is the state of a unit of [work](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/work.md) whose preconditions are met but which no agent has begun. An open [task](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/task-as-command-term.md) is available — it can be picked up. An open [plan](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/plan-as-command-term.md) has been adopted but no tasks within it are active.

Open follows from either initial creation (a new task starts open) or from unblocking (a previously [blocked](../../../../../../../../content/text/glossary/terms/blocked.md) task whose dependencies are now met returns to open). Open precedes [in-progress](../../../../../../content/text/documents/articles/notes/2026/04/06/2026-04-06-in-progress.md) — the transition happens when an [act](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/philosophy/terms/act.md) of beginning occurs.
