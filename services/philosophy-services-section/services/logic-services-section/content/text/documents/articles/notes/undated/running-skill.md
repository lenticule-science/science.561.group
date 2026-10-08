---
name: running-a-system
description: Generic running of any system. Abstract at this level; throws unless invoked through a subkind specialization.
title: running-a-system
---

## Requirements

- Subkind specialization. The script at this level is abstract — invocation directly raises an error.

## Steps

1. The caller (an instance, e.g. 561) imports its parent kind's `run` function and parameterizes it.

## Outcomes

- Direct invocation: `Error: system.run: abstract — specialize per subkind of system`.
- Specialized invocation through a subkind: see the subkind's `SKILL.md` for behavior.
