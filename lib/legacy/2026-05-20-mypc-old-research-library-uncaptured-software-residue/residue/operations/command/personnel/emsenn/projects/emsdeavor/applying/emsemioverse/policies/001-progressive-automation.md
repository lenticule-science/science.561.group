---
title: "Policy 001: Progressive automation"
date-created: 2026-03-07T00:00:00
type: policy
number: 1
keywords:
  - Policies
  - Automation
description: "Make actions accomplishable by less capable agents over time."
---

Make actions accomplishable by less capable agents over time.

## What this means

Every time a capable agent (human or large model) performs a task, part
of the work should be encoding that task so that a less capable agent
could perform it next time. The trajectory is:

```
learn → document → curricula → skills → scripts → formalization
```

Each step reduces the inference required. A document records what was
learned. A curriculum organizes it for teaching. A skill encodes it as
repeatable instructions. A script automates the mechanical parts. A
formal proof eliminates ambiguity entirely.

The goal is not to remove the need for capable agents — it is to move
their effort from routine execution to genuine reasoning, while routine
execution flows downward to cheaper, faster, more deterministic tools.

## Operational implications

- When you finish a task, ask: what part of this could a dumber agent
  do next time?
- Encode that part as a skill, script, or frontmatter convention.
- Prefer deterministic scripts over inference-based skills where the
  task is well-understood.
- Design skills with enough detail that a less capable model could
  follow them.
- When frontmatter can encode what prose currently describes, migrate
  the information to frontmatter.
