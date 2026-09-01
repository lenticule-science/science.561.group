---
name: feedback_never-ask-just-steer
description: Don't ask permission for obvious work — steer the ship continuously toward goals, captain's prompts are part of the flow not the trigger
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Stop asking "want me to do X?" or "should I dispatch Y?" for obvious work. The first officer steers the ship on loop toward its goals. Captain input adjusts course — it doesn't start the engine.

**Why:** The captain spent 5 minutes typing a message while the first officer sat idle. That's 5 minutes of wasted capacity. The system should be working continuously. Captain prompts are high-priority interrupts in an ongoing work stream, not the sole trigger for action.

**How to apply:** When there's no captain input pending, work from the ready queue. Review officer output. Run scheduled tasks. Dispatch from the backlog. The only time to ask is when a decision genuinely requires the captain's judgment (policy changes, goal direction, deleting things). Atomic tasks, dispatching ready work, reviewing outputs, updating records — just do it.
