---
type: decision
title: "Introduce harnesses as a substrate-to-runtime bridge concept; ship the replit harness"
date: 2026-05-02
status: enacted
of-polity: "polity:561-group"
decided-by: "office:engineering"
prompted-by: "message:msg-20260502182839-c6508b"
supersedes: []
amends: ["decision:agentic-coordination-gap-analysis"]
---

# Introduce harnesses; ship the replit harness

## Context

The MCP follow-up addendum in [decision:agentic-coordination-gap-analysis](agentic-coordination-gap-analysis.md) named one half of the visibility problem: how does an external agent runtime *call* the substrate's affordances.
MCP-over-HTTP solves that.

But the user observed a second half: how does an external agent runtime *discover* the substrate's affordances *before* deciding to call anything.
For Replit Agent specifically, the discovery convention is project-installed skills under `.agents/skills/<name>/SKILL.md` — a file-system convention, not an RPC protocol.
Per the Replit docs (paraphrased): installing skills there makes them available to the agent across every chat session in the project.

This is a different shape of problem from MCP.
It is solved at file-write time, not call time.
And it generalizes beyond Replit — Claude Desktop, Cursor, and every future agent runtime will have its own discovery convention.

## Decision

Introduce a substrate concept called **harness**: a runtime-specific bridge that materializes a *view* of the substrate's affordances in whatever filesystem (or other) convention some particular external agent runtime expects to discover them.

- **Substrate is the source of truth.** Skills, verbs, witnesses, work-items live where they live (`operations/engineering/`).
- **Harnesses are derived views.** They are installed into wherever the runtime looks; they are not authored by hand.
  Re-installing rewrites them.
- **Harnesses are themselves substrate records.** Each lives at `operations/engineering/harnesses/<name>/_index.md` with `type: harness` and declares its `target-runtime:` and `target-default:` install location.
- **One verb runs them all.** `fars install-harness <name>` dispatches to the named harness's install logic.
  With no positional arg it lists available harnesses.
  `--uninstall` reverses an install via the manifest the install left behind.

Ship the **replit** harness as the first concrete instance.
Its install logic walks every FARS engineering skill and writes a Replit-format `SKILL.md` shim at `.agents/skills/<prefix><pack>-<skill>/SKILL.md`, with the prefix defaulting to `fars-` so the shims are namespaced and distinguishable from any user-authored skills in the same directory.

## Shim format

A Replit-format SKILL.md needs only `name:` and `description:` in frontmatter; the body is freeform.
The shim's body:

1. Tags the origin: `[FARS:<pack>] <description>` so the agent's skill listing makes the source obvious.
2. Documents the invocation: `fars skills run <name>`.
3. Points at the source path: the substrate, not the shim, is canonical.
4. Includes the original SKILL.md body verbatim so the agent has the full instructions when it actually loads the skill.

## Manifest

Each install writes `<target>/.fars-harness-manifest.json` recording:

```json
{
  "harness": "replit",
  "installed-at": "<iso-timestamp>",
  "prefix": "fars-",
  "target": ".agents/skills",
  "skills": [
    {"shim-name": "fars-group-audit-group-graph",
     "shim-path": ".agents/skills/fars-group-audit-group-graph/SKILL.md",
     "source-path": "operations/engineering/skills/group/audit-group-graph/SKILL.md",
     "fars-name": "audit-group-graph",
     "pack": "group"},
    "..."
  ]
}
```

`--uninstall` reads this and removes exactly the listed shims plus the manifest itself.
Files placed in `.agents/skills/` by other means are untouched.

## Why discovery-time *and* call-time

The Replit harness and the MCP-over-HTTP task are complementary, not redundant.

- **MCP-over-HTTP** ([task:expose-fars-mcp-over-http](../tasks/engineering/expose-fars-mcp-over-http.md)) is the *call-time* bridge.
  It gives the agent typed tool signatures it can invoke at runtime.
  It needs the runtime to support MCP and a network round-trip.
- **The replit harness** is the *discovery-time* bridge.
  It gives the agent rich SKILL.md text the moment a session starts, with no protocol negotiation.
  It needs only file-system access.

Both can be active at the same time; the agent uses whichever is more natural for the moment.
(For Replit specifically: harness for skill discovery on session start, MCP for actually invoking verbs that need typed parameters.)

## What this does *not* do

- Does not shim FARS verbs as Replit skills.
  Verbs are MCP-shaped (typed parameters, JSON Schema); coercing them into freeform SKILL.md text would lose the typing.
  A future `--include-verbs` flag could be added if it turns out to be useful.
- Does not auto-run on session start.
  Installation is explicit (`fars install-harness replit`); the user controls when their `.agents/skills/` mutates.
- Does not handle Replit-managed primary skills.
  Those live in `.local/skills/` and are owned by Replit.
- Does not yet do live-reload.
  If a FARS skill's SKILL.md is edited, the user must re-run `fars install-harness replit` for the shim to update.
  A `fars watch --install-harness replit` pattern is plausible future work.

## Effects on other records

- **Harness as a substrate type.** First use of `type: harness`; harnesses index lives at `operations/engineering/harnesses/_index.md`.
- **No new office.** The harness installation is engineering work; `office:engineering` owns the verb and the harness directory.
  No new institutional position needed.
- **Provenance back to the prompting message.** This decision's `prompted-by:` points at `message:msg-20260502182839-c6508b` (emsenn's user-story prompt that surfaced the visibility gap) — exercising the message-as-substrate-record convention from the upstream decision.

## See also

- [`operations/engineering/harnesses/_index.md`](../../../engineering/harnesses/_index.md) — the harness pack overview.
- [`operations/engineering/harnesses/replit/_index.md`](../../../engineering/harnesses/replit/_index.md) — the replit harness record.
- [`operations/engineering/fars/src/fars/cli/install_harness.py`](../../../engineering/fars/src/fars/cli/install_harness.py) — the dispatcher verb.
- [decision:agentic-coordination-gap-analysis](agentic-coordination-gap-analysis.md) — upstream gap-analysis.
