---

name: feedback_stop_gatekeeping_ecc
description: Bring in everything-claude-code components when asked — stop deciding what's "relevant"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_stop_gatekeeping_ecc
---

Bring in ALL ECC components when the user asks. Do not filter by "relevance" to current repo state.

**Why:** The repo is early-stage infrastructure for a confederacy with broad needs (healthcare, video, logistics, everything). The user has asked multiple times across multiple sessions to bring in ECC skills/commands/agents. Each time, Claude filters down to 2-3 "relevant" items instead of doing the bulk work requested. This is paternalistic and blocks progress.

**How to apply:** When the user says "bring in ECC stuff," bring in ALL of it. Batch it. Parallelize it. Don't editorialize about what's needed. The user decides what's relevant, not Claude.
