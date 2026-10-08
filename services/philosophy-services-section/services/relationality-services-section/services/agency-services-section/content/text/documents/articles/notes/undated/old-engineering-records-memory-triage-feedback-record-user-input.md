---
name: feedback_record-user-input
description: When the captain speaks, get it into plans, ideas, records — use subordinates for this, don't let it evaporate
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_record-user-input
---

When the user says something substantive — a direction, an idea, a priority shift, a design insight — it needs to land in the repo as an artifact. Not a memory. A plan, a task, an idea file, a decision record.

**Why:** The captain thinks out loud. These aren't casual remarks — they're directives, insights, and design decisions that inform all future work. If they only exist in conversation context, they're lost at session end. Policy 008 (Prompts Become Artifacts) applies here.

**How to apply:** During conversation, when the user expresses direction or ideas: (1) dispatch a subordinate to create the appropriate artifact (plan update, idea file, decision record), or (2) do it inline if it's quick. Don't wait until session end. Don't just save memories — memories are for cross-session context about the user, not for capturing their actual directives. Use `/record-event` for discrete actions, idea files for brainstorms, plan mutations for priority shifts.
