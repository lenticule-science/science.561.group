---
name: project_issue-tracking-gap
description: No bug/issue reporting system exists — need one commensurate with GitHub Issues, plus Context7 for upstream docs
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

The system has no issue or bug reporting infrastructure. Plans, tasks, and objectives exist but there's no way to report bugs, track defects, or manage issues. Captain identified this 2026-04-04.

**Why:** The operations loop's tracking stage needs defect/issue tracking as a first-class entity type. GitHub Issues is the external analog we should be commensurate with (bidirectional sync via GitHub MCP server).

**How to apply:** When building tracking infrastructure, include issues alongside tasks and plans. Design issue entities to map onto GitHub Issues fields. Context7 MCP provides library docs lookup for grounding implementations in upstream API docs.
