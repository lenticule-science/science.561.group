---
name: read-before-write
introduces: instinct
work-type: derivation
formality: F1
trigger: "when creating or overwriting a file"
action: "read the existing file before using Write, to catch cases where Edit would be more appropriate"
domain: workflow
office: command
source: session-observation
date-created: 2026-03-31
date-last-seen: 2026-04-06
saturation-evidence: [session-2026-03-31, session-2026-04-04]
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## Action

Read the existing file before using Write to overwrite it. This catches cases where the file already exists and Edit would be more appropriate.

## Evidence

- Observed 5 times across sessions
- Pattern: Write overwrites existing content when Edit would preserve surrounding context
