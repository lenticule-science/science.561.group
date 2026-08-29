---
name: project_writable-fars-session
description: "2026-04-06 continued — FARS became read-write, general/particular tower, hooks as interfacers, campaign term"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

FARS is now read-write. message(entity, {key: value}) → settle() → persist to source markdown files.

Key deliverables:
- markdown.js apply() — text-edits YAML in place, preserves ordering/quoting/body, counit law holds
- message.js persistToFiles() — wired into settlement pipeline, atomic writes (temp + rename)
- Decision 005: library/operations IS the general/particular distinction, expressed as a tower of specificity where extends inherits the settled remainder (invariant across all accounts)
- Decision 006: ALL hooks are interfacers — zero exceptions. Logic in entity fibers, hooks are thin adapters.
- Campaign library term — missing coordination level between project and enterprise
- Planning predication plan — ontological dependencies (requires-concepts), campaign coordination
- Work term enrichments: requires-concepts-takes, coordinated-by-takes on plan/project/task
- Audited 7 infrastructure plans: every one assumes undefined concepts (message, respond, settle, interfacer have no library terms)

Key insights:
- The tower of specificity: not 2 levels (library/ops) but N levels, one per domain depth. Domain path IS disambiguation via lexical scoping (decision 003).
- extends inherits the SETTLED REMAINDER — the fixed point of composing all same-named entities across the tower. Only what's invariantly true propagates.
- Undefined library terms = thinner fixed points = impoverished fibers at every lower level. Writing general terms fattens the fixed point.
- Hooks are interfacers whose "outside" is Claude Code lifecycle. Extract: JSON → payload. Apply: settlement → exit code.
- Precompiled constraint fibers solve hot-path performance for guard hooks.

Next: study ECC/Cline/OpenClaw research (already read) with writable FARS in hand. Design how 30 hooks map to message() calls. First concrete step: classify hooks by target entity.
