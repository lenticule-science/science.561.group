---
description: The mechanism that determines which context, memory, files, or derived representations are attached or exposed to a particular agent run.
identity: context-access-control
name: context-access-control
provenance:
  date-created: 2026-08-29
  sources:
    - https://docs.letta.com/tutorials/attaching-detaching-blocks/
relations:
  distinguished-from: authority-boundary, isolation-boundary
---
Context-access control limits what information is presented to an agent during a run. It can be implemented through attached memory blocks, scoped retrieval, per-agent workspaces, or tool/resource policy. It is not identical to authority control: an agent may see a record without standing to alter it, and an approved authority may need a distinct effect-level authorization before an action occurs.
