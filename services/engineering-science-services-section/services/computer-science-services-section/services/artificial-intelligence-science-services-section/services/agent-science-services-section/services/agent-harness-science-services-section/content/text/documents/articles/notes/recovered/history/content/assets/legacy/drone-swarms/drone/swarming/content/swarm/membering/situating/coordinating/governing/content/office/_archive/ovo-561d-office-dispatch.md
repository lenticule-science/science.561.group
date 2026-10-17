---
title: "Wire mash-engine and duty-officer to use office definitions"
specialization: task
date-created: 2026-04-04
plan: office-vocabulary-overhaul
work-type: procedure
depends-on:
  - ovo-rename-agent-frontmatter
  - ovo-dispatch-routing
requires: [code-editing, dispatch]
assigned-to: operations-officer
---
**Action:** Wire mash-engine and duty-officer to use office definitions

**Why:** Add --office flag to mash-engine start, load office model/tools/duties into prompt, and make /duty-officer consult dispatch-work.js to select the correct office
