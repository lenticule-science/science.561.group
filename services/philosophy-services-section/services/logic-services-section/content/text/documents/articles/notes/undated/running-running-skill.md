---
name: running-an-operating-system
description: Generic running of any operating-system. Extends system's running with subsystem supervision; abstract at this level — concrete behavior lives at the subkind.
title: running-an-operating-system
---

## Requirements

- Subkind specialization. The script at this level is abstract — direct invocation throws.

## Steps

1. The caller imports `run` from a subkind (e.g. computer-operating-system) and parameterizes it.

## Outcomes

- Direct invocation: `Error: operating-system.run: abstract — specialize per subkind of operating-system`.
- Specialized invocation through a subkind: see the subkind's `SKILL.md` for behavior.
